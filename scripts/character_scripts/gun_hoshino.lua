---@class (exact) GunHoshino : Gun ホシノ専用gun.lua

GunHoshino = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return GunHoshino
    new = function (parent)
        ---@type GunHoshino
        local instance = Avatar.instantiate(GunHoshino, Gun, parent)

        return instance
    end;

    ---初期化関数
    ---@param self GunHoshino
    init = function (self)
        AvatarModule.init(self)

        events.TICK:register(function ()
            self:processGunTick()
            self.isGunTickProcessed = false
        end)

        local this = self --Figuraにスクリプトを再構築させると参照がおかしくなることに対処しているコード
        events.ON_PLAY_SOUND:register(function (id, pos, _, _, _, _, path)
            self = this
            if path ~= nil then
                local velocityDistance = player:getVelocity():length()
                local distanceFromSound = math.abs(pos:copy():sub(player:getPos()):length() - velocityDistance)
                if (id == "minecraft:entity.arrow.shoot" or id == "minecraft:item.crossbow.loading_end" or id == "minecraft:item.crossbow.shoot") and math.abs(velocityDistance - distanceFromSound) < 1 then
                    if id == "minecraft:item.crossbow.loading_end" then
                        sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.dispenser.fail"), pos, 1, 2)
                    elseif player:isUnderwater() then
                        sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.generic.extinguish_fire"), pos, 0.5, 1.5)
                    else
                        local gunPosition = self.parent.gun.currentGunPosition
                        if self.parent.subGun.hasSubGun and math.random() >= 0.5 then
                            gunPosition = gunPosition == "RIGHT" and "LEFT" or "RIGHT"
                        end
                        local particleAnchor = ModelUtils.getModelWorldPos(renderer:isFirstPerson() and (gunPosition == "RIGHT" and models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightItemPivot or models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftItemPivot) or (self.parent.gun.currentGunPosition == gunPosition and models.models.main.Avatar.UpperBody.Body.Gun.MuzzleAnchor or models.models.main.Avatar.UpperBody.Body.SubGun.MuzzleAnchor2))
                        for _ = 1, 5 do
                            particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:smoke"), particleAnchor)
                        end
                        if self.parent.gun.currentGunPosition == gunPosition then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound(self.parent.characterData.gun.sound.name), pos, 1, self.parent.characterData.gun.sound.pitch)
                        else
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.iron_golem.hurt"), pos, 1, 2)
                        end
                    end
                    return true
                elseif (id == "minecraft:item.crossbow.loading_start" or id == "minecraft:item.crossbow.loading_middle" or id:match("^minecraft:item%.crossbow%.quick_charge_[1-3]$") ~= nil) and distanceFromSound < 1 and player:getActiveItem().id == "minecraft:crossbow" then
                    local activeItemTime = player:getActiveItemTime()
                    local quickChargeLevel = 0
                    local activeItem = player:getActiveItem()
                    if activeItem.tag.Enchantments ~= nil then
                        for _, enchant in ipairs(activeItem.tag.Enchantments) do
                            if enchant.id == "minecraft:quick_charge" then
                                quickChargeLevel = enchant.lvl
                                break
                            end
                        end
                    end
                    if (quickChargeLevel <= 4 and activeItemTime + quickChargeLevel >= 4 and activeItemTime + quickChargeLevel <= 6) or (quickChargeLevel == 5 and activeItemTime <= 2) then
                        sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.flintandsteel.use"), pos, 1, 2)
                        return true
                    elseif id == "minecraft:item.crossbow.loading_middle" then
                        return true
                    end
                end
            end
        end)

        events.ITEM_RENDER:register(function (item, mode, _, _, _, leftHanded)
            self = this
            if mode ~= "HEAD" and self.currentGunPosition == (leftHanded and "LEFT" or "RIGHT") and (self.shouldShowWeaponInFirstPerson or mode =="THIRD_PERSON_LEFT_HAND" or mode == "THIRD_PERSON_RIGHT_HAND") then
                for _, gunItem in ipairs(self.gunItems) do
                    if item.id == gunItem then
                        if leftHanded then
                            if mode == "FIRST_PERSON_LEFT_HAND" then
                                local offsetPos = vectors.vec3()
                                if self.parent.characterData.gun.gunPosition.hold.firstPersonPos ~= nil and self.parent.characterData.gun.gunPosition.hold.firstPersonPos.left ~= nil then
                                    offsetPos = self.parent.characterData.gun.gunPosition.hold.firstPersonPos.left
                                end
                                local offsetRot = vectors.vec3()
                                if self.parent.characterData.gun.gunPosition.hold.firstPersonRot ~= nil and self.parent.characterData.gun.gunPosition.hold.firstPersonRot.left ~= nil then
                                    offsetRot = self.parent.characterData.gun.gunPosition.hold.firstPersonRot.left
                                end
                                local activeItemId = player:getActiveItem().id
                                if activeItemId == "minecraft:bow" then
                                    models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(0, -2.25, 4.25):add(offsetPos))
                                    models.models.main.Avatar.UpperBody.Body.Gun:setRot(vectors.vec3(20, -7.5, -5):add(offsetRot))
                                elseif activeItemId == "minecraft:crossbow" then
                                    models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(0, 0.25, 4.25):add(offsetPos))
                                    models.models.main.Avatar.UpperBody.Body.Gun:setRot(vectors.vec3(0, 0, 0):add(offsetRot))
                                elseif item.id == "minecraft:crossbow" and item.tag.Charged == 1 then
                                    if player:isLeftHanded() then
                                        models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(-10, -1.25, 6):add(offsetPos))
                                        models.models.main.Avatar.UpperBody.Body.Gun:setRot(vectors.vec3(0, 10, 0):add(offsetRot))
                                    else
                                        models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(0, -1.25, 4.25):add(offsetPos))
                                        models.models.main.Avatar.UpperBody.Body.Gun:setRot(vectors.vec3(0, 0, 0):add(offsetRot))
                                    end
                                else
                                    models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(0, -1.25, 4.25):add(offsetPos))
                                    models.models.main.Avatar.UpperBody.Body.Gun:setRot(vectors.vec3(0, 0, 0):add(offsetRot))
                                end
                            elseif mode == "THIRD_PERSON_LEFT_HAND" then
                                local offsetPos = vectors.vec3()
                                if self.parent.characterData.gun.gunPosition.hold.thirdPersonPos ~= nil and self.parent.characterData.gun.gunPosition.hold.thirdPersonPos.left ~= nil then
                                    offsetPos = self.parent.characterData.gun.gunPosition.hold.thirdPersonPos.left
                                end
                                local offsetRot = vectors.vec3()
                                if self.parent.characterData.gun.gunPosition.hold.thirdPersonRot ~= nil and self.parent.characterData.gun.gunPosition.hold.thirdPersonRot.left ~= nil then
                                    offsetRot = self.parent.characterData.gun.gunPosition.hold.thirdPersonRot.left
                                end
                                models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(0, -4.25, 4.25):add(offsetPos))
                                models.models.main.Avatar.UpperBody.Body.Gun:setRot(vectors.vec3(0, 0, 0):add(offsetRot))
                            end
                        else
                            if mode == "FIRST_PERSON_RIGHT_HAND" then
                                local offsetPos = vectors.vec3()
                                if self.parent.characterData.gun.gunPosition.hold.firstPersonPos ~= nil and self.parent.characterData.gun.gunPosition.hold.firstPersonPos.right ~= nil then
                                    offsetPos = self.parent.characterData.gun.gunPosition.hold.firstPersonPos.right
                                end
                                local offsetRot = vectors.vec3()
                                if self.parent.characterData.gun.gunPosition.hold.firstPersonRot ~= nil and self.parent.characterData.gun.gunPosition.hold.firstPersonRot.right ~= nil then
                                    offsetRot = self.parent.characterData.gun.gunPosition.hold.firstPersonRot.right
                                end
                                local activeItemId = player:getActiveItem().id
                                if activeItemId == "minecraft:bow" then
                                    models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(0, -2.25, 4.25):add(offsetPos))
                                    models.models.main.Avatar.UpperBody.Body.Gun:setRot(vectors.vec3(20, 7.5, 5):add(offsetRot))
                                elseif activeItemId == "minecraft:crossbow" then
                                    models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(0, 0.25, 4.25):add(offsetPos))
                                    models.models.main.Avatar.UpperBody.Body.Gun:setRot(vectors.vec3(0, 0, 0):add(offsetRot))
                                elseif item.id == "minecraft:crossbow" and item.tag.Charged == 1 then
                                    if player:isLeftHanded() then
                                        models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(0, -1.25, 4.25):add(offsetPos))
                                        models.models.main.Avatar.UpperBody.Body.Gun:setRot(vectors.vec3(0, 0, 0):add(offsetRot))
                                    else
                                        models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(10, -1.25, 6):add(offsetPos))
                                        models.models.main.Avatar.UpperBody.Body.Gun:setRot(vectors.vec3(0, -10, 0):add(offsetRot))
                                    end
                                else
                                    models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(0, -1.25, 4.25):add(offsetPos))
                                    models.models.main.Avatar.UpperBody.Body.Gun:setRot(vectors.vec3(0, 0, 0):add(offsetRot))
                                end
                            elseif mode == "THIRD_PERSON_RIGHT_HAND" then
                                local offsetPos = vectors.vec3()
                                if self.parent.characterData.gun.gunPosition.hold.thirdPersonPos ~= nil and self.parent.characterData.gun.gunPosition.hold.thirdPersonPos.right ~= nil then
                                    offsetPos = self.parent.characterData.gun.gunPosition.hold.thirdPersonPos.right
                                end
                                local offsetRot = vectors.vec3()
                                if self.parent.characterData.gun.gunPosition.hold.thirdPersonRot ~= nil and self.parent.characterData.gun.gunPosition.hold.thirdPersonRot.right ~= nil then
                                    offsetRot = self.parent.characterData.gun.gunPosition.hold.thirdPersonRot.right
                                end
                                models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(0, -4.25, 4.25):add(offsetPos))
                                models.models.main.Avatar.UpperBody.Body.Gun:setRot(vectors.vec3(0, 0, 0):add(offsetRot))
                            end
                        end
                        return models.models.main.Avatar.UpperBody.Body.Gun
                    end
                end
            end
        end)

        models.models.main.Avatar.UpperBody.Body.Gun:setScale(vectors.vec3(1, 1, 1):scale(self.parent.characterData.gun.scale))
        self:setGunPosition("NONE")
        if self.parent.characterData.gun.callbacks ~= nil and self.parent.characterData.gun.callbacks.onMainHandChange ~= nil then
            self.parent.characterData.gun.callbacks.onMainHandChange(self.parent.characterData, self.isLeftHandedPrev and "LEFT" or "RIGHT")
        end
    end;
}