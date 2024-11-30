---@class (exact) Shield : AvatarModule 盾を制御するクラス
---@field public hasShield boolean 盾を手に持っているかどうか
---@field public setShield fun(self: Shield, value: boolean, shouldPlayShieldSound: boolean) 盾の展開状態を設定する

Shield = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return Shield
    new = function (parent)
        ---@type Shield
        local instance = Avatar.instantiate(Shield, AvatarModule, parent)

        instance.hasShield = false

        return instance
    end;

    ---初期化関数
    ---@param self Shield
    init = function (self)
        AvatarModule.init(self)

        events.TICK:register(function ()
            self:setShield((player:getHeldItem().id == "minecraft:shield" or player:getHeldItem(true).id == "minecraft:shield") and self.parent.exSkill.animationCount == -1, true)
        end)

        events.ITEM_RENDER:register(function (item, mode)
            if item.id == "minecraft:shield" and mode ~= "HEAD" and self.hasShield and (self.parent.gun.shouldShowWeaponInFirstPerson or mode == "THIRD_PERSON_LEFT_HAND" or mode == "THIRD_PERSON_RIGHT_HAND") then
                if mode == "FIRST_PERSON_LEFT_HAND" then
                    local leftHanded = player:isLeftHanded()
                    if player:getActiveItemTime() > 0 and ((player:getActiveHand() == "OFF_HAND" and not leftHanded) or (player:getActiveHand() == "MAIN_HAND" and leftHanded)) then
                        models.models.main.Avatar.UpperBody.Body.Shield:setPos(8, -20.25, 2.5)
                        models.models.main.Avatar.UpperBody.Body.Shield:setRot(0, 0, -5)
                    else
                        models.models.main.Avatar.UpperBody.Body.Shield:setPos(6, -22.5, 2.5)
                        models.models.main.Avatar.UpperBody.Body.Shield:setRot(0, 0, 5)
                    end
                elseif mode == "FIRST_PERSON_RIGHT_HAND" then
                    local leftHanded = player:isLeftHanded()
                    if player:getActiveItemTime() > 0 and ((player:getActiveHand() == "MAIN_HAND" and not leftHanded) or (player:getActiveHand() == "OFF_HAND" and leftHanded)) then
                        models.models.main.Avatar.UpperBody.Body.Shield:setPos(0, -19.25, 2.5)
                        models.models.main.Avatar.UpperBody.Body.Shield:setRot(0, 0, 5)
                    else
                        models.models.main.Avatar.UpperBody.Body.Shield:setPos(2, -22.5, 2.5)
                        models.models.main.Avatar.UpperBody.Body.Shield:setRot(0, 0, -5)
                    end
                elseif mode == "THIRD_PERSON_LEFT_HAND" then
                    if self.parent.arms.armState.left == 4 then
                        if player:isCrouching() then
                            models.models.main.Avatar.UpperBody.Body.Shield:setPos(3.5, -19.5, 0)
                            models.models.main.Avatar.UpperBody.Body.Shield:setRot(80, 5, 30)
                        else
                            models.models.main.Avatar.UpperBody.Body.Shield:setPos(2, -20.5, -1)
                            models.models.main.Avatar.UpperBody.Body.Shield:setRot(55, 20, 25)
                        end
                    else
                        local leftHanded = player:isLeftHanded()
                        if player:getActiveItemTime() > 0 and ((player:getActiveHand() == "OFF_HAND" and not leftHanded) or (player:getActiveHand() == "MAIN_HAND" and leftHanded)) then
                            models.models.main.Avatar.UpperBody.Body.Shield:setPos(2, -20.5, -2)
                            models.models.main.Avatar.UpperBody.Body.Shield:setRot(50, 30, 30)
                        else
                            models.models.main.Avatar.UpperBody.Body.Shield:setPos(2, -20.5, 2.5)
                            models.models.main.Avatar.UpperBody.Body.Shield:setRot(5, 90, 0)
                        end
                    end
                elseif mode == "THIRD_PERSON_RIGHT_HAND" then
                    if self.parent.arms.armState.right == 4 then
                        if player:isCrouching() then
                            models.models.main.Avatar.UpperBody.Body.Shield:setPos(4.5, -19.5, 0)
                            models.models.main.Avatar.UpperBody.Body.Shield:setRot(80, -5, -30)
                        else
                            models.models.main.Avatar.UpperBody.Body.Shield:setPos(6, -20.5, -1)
                            models.models.main.Avatar.UpperBody.Body.Shield:setRot(55, -20, -25)
                        end
                    else
                        local leftHanded = player:isLeftHanded()
                        if player:getActiveItemTime() > 0 and ((player:getActiveHand() == "MAIN_HAND" and not leftHanded) or (player:getActiveHand() == "OFF_HAND" and leftHanded)) then
                            models.models.main.Avatar.UpperBody.Body.Shield:setPos(6, -20.5, -2)
                            models.models.main.Avatar.UpperBody.Body.Shield:setRot(50, -30, -30)
                        else
                            models.models.main.Avatar.UpperBody.Body.Shield:setPos(6, -20.5, 2.5)
                            models.models.main.Avatar.UpperBody.Body.Shield:setRot(5, -90, 0)
                        end
                    end
                end
                models.models.main.Avatar.UpperBody.Body.Shield:setSecondaryRenderType(item:hasGlint() and "GLINT" or "NONE")
                models.models.main.Avatar.UpperBody.Body.Shield:setVisible(true)
                return models.models.main.Avatar.UpperBody.Body.Shield
            end
        end)

        events.ON_PLAY_SOUND:register(function (id, pos, _, _, _, _, path)
            if path ~= nil then
                if id == "minecraft:item.shield.block" and math.abs(pos:copy():sub(player:getPos()):length() - player:getVelocity():length()) < 0.2 and player:getActiveItem().id == "minecraft:shield" then
                    sounds:playSound(CompatibilityUtils:checkSound("minecraft:block.anvil.place"), pos, 1, 4)
                    return true
                end
            end
        end)
    end;

    ---盾の展開状態を設定する。
    ---@param self Shield
    ---@param value boolean 新しい値
    ---@param shouldPlayShieldSound boolean 盾の展開音を再生するかどうか
    setShield = function (self, value, shouldPlayShieldSound)
        if value and not self.hasShield then
            models.models.main.Avatar.UpperBody.Body.Shield:setParentType("Item")
            models.models.main.Avatar.UpperBody.Body.Shield.Section2.ShoulderBelt:setVisible(false)
            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Shield.Section2, models.models.main.Avatar.UpperBody.Body.Shield.Section2.Section1}) do
                modelPart:setRot()
            end
            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Shield.Section2.GasCylinder3.GasPiston3, models.models.main.Avatar.UpperBody.Body.Shield.Section2.GasCylinder4.GasPiston4, models.models.main.Avatar.UpperBody.Body.Shield.Section2.Section1.GasCylinder1.GasPiston1, models.models.main.Avatar.UpperBody.Body.Shield.Section2.Section1.GasCylinder2.GasPiston2}) do
                modelPart:setPos(0, -1.4, 0)
            end
            models.models.main.Avatar.UpperBody.Body.Shield.Section3.Handle2:setPos(0, 0.25, 0)
            models.models.main.Avatar.UpperBody.Body.Shield.Section2.Section1.Handle:setPos(0, -0.25, 0)
            if shouldPlayShieldSound then
                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.anvil.place"), player:getPos(), 0.1, 2)
            end
        elseif not value and self.hasShield then
            models.models.main.Avatar.UpperBody.Body.Shield:setVisible(self.parent.costume.currentCostume ~= 3)
            models.models.main.Avatar.UpperBody.Body.Shield:setParentType("None")
            if self.parent.exSkill.animationCount == -1 then
                models.models.main.Avatar.UpperBody.Body.Shield.Section2.ShoulderBelt:setVisible(true)
            end
            models.models.main.Avatar.UpperBody.Body.Shield:setPos()
            models.models.main.Avatar.UpperBody.Body.Shield:setRot(5, 90, 0)
            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Shield.Section2, models.models.main.Avatar.UpperBody.Body.Shield.Section2.Section1}) do
                modelPart:setRot(-180, 0, 0)
            end
            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Shield.Section2.GasCylinder3.GasPiston3, models.models.main.Avatar.UpperBody.Body.Shield.Section2.GasCylinder4.GasPiston4, models.models.main.Avatar.UpperBody.Body.Shield.Section2.Section1.GasCylinder1.GasPiston1, models.models.main.Avatar.UpperBody.Body.Shield.Section2.Section1.GasCylinder2.GasPiston2, models.models.main.Avatar.UpperBody.Body.Shield.Section3.Handle2, models.models.main.Avatar.UpperBody.Body.Shield.Section2.Section1.Handle}) do
                modelPart:setPos()
            end
            models.models.main.Avatar.UpperBody.Body.Shield:setSecondaryRenderType("NONE")
        end
        self.hasShield = value
    end;
}