---@class Bicycle : AvatarModule 自転車を制御するクラス
---@field package bicycleEnabled boolean 自転車乗りが有効かどうか
---@field package bicycleEnabledPrev boolean 前ティックに自転車乗りが有効だったかどうか
---@field package bicycleOffsetPos number 自転車のオフセット位置
---@field package windSound Sound|nil 自転車の風切り音のインスタンス
---@field package handleRot number 現在の自転車のハンドルの角度
---@field package handleRotPrev number 前ティックの自転車のハンドルの角度
---@field package isBicycleRidingPrev boolean 前ティックに自転車に乗っていたかどうか
---@field package isDrinkItemHeld boolean 自転車のドリンクを持っているかどうか
---@field package isDrinkItemHeldPrev boolean 前ティックに自転車のドリンクを持っていたかどうか

Bicycle = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return Bicycle
    new = function (parent)
        ---@type Bicycle
        local instance = Avatar.instantiate(Bicycle, AvatarModule, parent)

        instance.bicycleEnabled = false
        instance.bicycleEnabledPrev = false
        instance.bicycleOffsetPos = 0
        instance.handleRot = 0
        instance.handleRotPrev = 0
        instance.isBicycleRidingPrev = false
        instance.isDrinkItemHeld = false
        instance.isDrinkItemHeldPrev = false

        return instance
    end;

    ---初期化関数
    ---@param self AvatarModule
    init = function (self)
        AvatarModule.init(self)

        events.TICK:register(function ()
            local vehicle = player:getVehicle()
            self.bicycleEnabled = false
            if vehicle ~= nil then
                local vehicleType = vehicle:getType()
                local jockey = vehicle:getControllingPassenger()
                if jockey ~= nil then
                    self.bicycleEnabled = self.parent.actionWheel.shouldReplaceVehicleModels and (vehicleType == "minecraft:horse" or vehicleType == "minecraft:donkey" or vehicleType == "minecraft:mule") and vehicle:getControllingPassenger():getName() == player:getName()
                else
                    self.bicycleEnabled = false
                end
                if self.bicycleEnabled then
                    if vehicleType == "minecraft:horse" then
                        self.bicycleOffsetPos = 0
                    elseif vehicleType == "minecraft:donkey" then
                        self.bicycleOffsetPos = 0.35
                    elseif vehicleType == "minecraft:mule" then
                        self.bicycleOffsetPos = 0.27
                    end
                end
            end
            if self.bicycleEnabled ~= self.bicycleEnabledPrev then
                if self.bicycleEnabled then
                    models.models.main.Avatar.LowerBody.Bicycle:setVisible(true)
                    renderer:setRenderVehicle(false)
                    for _, animationModel in ipairs({"models.main", "models.ex_skill_3"}) do
                        animations[animationModel]["bicycle_idle"]:play()
                    end
                    animations["models.main"]["bicycle_idle"]:setSpeed(-1)
                    if self.parent.gun.currentGunPosition == "RIGHT" then
                        self.parent.arms:setArmState(7, 6)
                    elseif self.parent.gun.currentGunPosition == "LEFT" then
                        self.parent.arms:setArmState(6, 7)
                    else
                        self.parent.arms:setArmState(6, 6)
                    end
                    events.TICK:register(function ()
                        if self.bicycleEnabled then
                            models.models.main.Avatar:setPos(0, self.bicycleOffsetPos * 16, 0)
                        end
                        local velocity = player:getVelocity()
                        local horizontalSpeed = math.sqrt(velocity.x ^ 2 + velocity.z ^ 2)
                        local isBicycleRiding = (horizontalSpeed >= 0.01 or math.abs(self.parent.physics.velocityAverage[2][2]) >= 0.01) and self.bicycleEnabled
                        if isBicycleRiding ~= self.isBicycleRidingPrev then
                            if isBicycleRiding then
                                animations["models.main"]["bicycle_idle"]:setSpeed(1)
                                for _, animationModel in ipairs({"models.main", "models.ex_skill_3"}) do
                                    animations[animationModel]["bicycle_run"]:play()
                                end
                            else
                                animations["models.main"]["bicycle_idle"]:setSpeed(-1)
                                for _, animationModel in ipairs({"models.main", "models.ex_skill_3"}) do
                                    animations[animationModel]["bicycle_run"]:stop()
                                end
                            end
                            self.isBicycleRidingPrev = isBicycleRiding
                        end
                        for _, animationModel in ipairs({"models.main", "models.ex_skill_3"}) do
                            animations[animationModel]["bicycle_run"]:setSpeed(2 * (self.parent.physics.velocityAverage[1][2] + math.abs(self.parent.physics.velocityAverage[3][2])))
                        end
                        models.models.main.Avatar.LowerBody.Bicycle.Wheels.Chain:setUVPixels(math.ceil(animations["models.main"]["bicycle_run"]:getTime() * 20) % 2, 0)
                        self.handleRotPrev = self.handleRot
                        self.handleRot = isBicycleRiding and math.clamp(self.parent.physics.velocityAverage[3][2] + self.parent.physics.velocityAverage[4][2] / 1500, -0.2, 0.2) * -75 or 0
                        if isBicycleRiding and horizontalSpeed >= 0.3 then
                            local playerPos = player:getPos()
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.dispenser.fail"), playerPos, 0.025, 5)
                            if self.windSound ~= nil then
                                self.windSound:setPos(playerPos)
                                self.windSound:setVolume(0.14285714285714 * horizontalSpeed - 0.042857142857143)
                            else
                                self.windSound = sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.elytra.flying"), playerPos, 0.14285714285714 * horizontalSpeed - 0.042857142857143, 2, true)
                            end
                        elseif self.windSound ~= nil then
                            self.windSound:stop()
                            self.windSound = nil
                        end
                        self.isDrinkItemHeld = false
                        for _, item in ipairs({player:getHeldItem(false), player:getHeldItem(true)}) do
                            if item.id == "minecraft:potion" or item.id == "minecraft:milk_bucket" then
                                self.isDrinkItemHeld = true
                                break
                            end
                        end
                        if self.isDrinkItemHeld ~= self.isDrinkItemHeldPrev then
                            if self.isDrinkItemHeld then
                                models.models.main.Avatar.LowerBody.Bicycle.Shaft.Shaft8.WaterBottle:setParentType("Item")
                                events.ITEM_RENDER:register(function (item, mode)
                                    if (item.id == "minecraft:potion" or item.id == "minecraft:milk_bucket") and self.isDrinkItemHeld and mode ~= "HEAD" and self.parent.exSkill.animationCount == -1 then
                                        if mode == "FIRST_PERSON_LEFT_HAND" then
                                            models.models.main.Avatar.LowerBody.Bicycle.Shaft.Shaft8.WaterBottle:setPos(-2, -6, 5.5)
                                            models.models.main.Avatar.LowerBody.Bicycle.Shaft.Shaft8.WaterBottle:setRot(90, -60, 0)
                                        elseif mode == "FIRST_PERSON_RIGHT_HAND" then
                                            models.models.main.Avatar.LowerBody.Bicycle.Shaft.Shaft8.WaterBottle:setPos(2, -6, 5.5)
                                            models.models.main.Avatar.LowerBody.Bicycle.Shaft.Shaft8.WaterBottle:setRot(90, -120, 0)
                                        elseif mode == "THIRD_PERSON_LEFT_HAND" then
                                            models.models.main.Avatar.LowerBody.Bicycle.Shaft.Shaft8.WaterBottle:setPos(0, -7.5, 5.5)
                                            models.models.main.Avatar.LowerBody.Bicycle.Shaft.Shaft8.WaterBottle:setRot(90, 90, 0)
                                        elseif mode == "THIRD_PERSON_RIGHT_HAND" then
                                            models.models.main.Avatar.LowerBody.Bicycle.Shaft.Shaft8.WaterBottle:setPos(0, -7.5, 5.5)
                                            models.models.main.Avatar.LowerBody.Bicycle.Shaft.Shaft8.WaterBottle:setRot(90, 90, 0)
                                        end
                                        return models.models.main.Avatar.LowerBody.Bicycle.Shaft.Shaft8.WaterBottle
                                    end
                                end, "drink_bottle_item_render")
                            else
                                events.ITEM_RENDER:remove("drink_bottle_item_render")
                                models.models.main.Avatar.LowerBody.Bicycle.Shaft.Shaft8.WaterBottle:setParentType("None")
                                models.models.main.Avatar.LowerBody.Bicycle.Shaft.Shaft8.WaterBottle:setPos()
                                models.models.main.Avatar.LowerBody.Bicycle.Shaft.Shaft8.WaterBottle:setRot()
                            end
                            self.isDrinkItemHeldPrev = self.isDrinkItemHeld
                        end
                    end, "bicycle_ride_tick")
                    events.RENDER:register(function (delta)
                        local bicycleIdleFactor = 1 - animations["models.main"]["bicycle_idle"]:getTime() * 4
                        models.models.main.Avatar.Head:setRot(45 - 30 * bicycleIdleFactor, 0, 0)
                        local currentHandleRot = (self.handleRot - self.handleRotPrev) * delta + self.handleRot
                        models.models.main.Avatar.LowerBody.Bicycle.Handle:setRot(0, currentHandleRot, 0)
                        if host:isHost() and self.bicycleEnabled then
                            self.parent.cameraManager.setCameraPivot(vectors.vec3(0, 0.15 * bicycleIdleFactor - 0.75 + self.bicycleOffsetPos, 0))
                            renderer:setEyeOffset(0, 0.15 * bicycleIdleFactor - 0.75 + self.bicycleOffsetPos, 0)
                        end
                    end, "bicycle_ride_render")
                    events.ON_PLAY_SOUND:register(function (id, pos, _, _, _, _, path)
                        if path ~= nil and (id:match("^minecraft:entity%.horse%.") or id:match("^minecraft:entity%.donkey%.") or id:match("^minecraft:entity%.mule%.")) and pos:copy():sub(player:getPos()):length() <= 1.5 then
                            if id == "minecraft:entity.horse.jump" then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.blaze.hurt"), pos, 0.5, 2, false)
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.wool.step"), pos, 1, 0.75, false)
                            elseif id == "minecraft:entity.horse.land" then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.iron_door.close"), pos, 0.25, 1.75, false)
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.wool.step"), pos, 1, 0.75, false)
                            elseif id:match("^minecraft:entity%.%w+%.hurt$") then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.anvil.place"), pos, 0.5, 2, false)
                            elseif id:match("^minecraft:entity%.%w+%.death$") then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.firework_rocket.blast"), pos, 1, 2, false)
                                local playerPos = player:getPos()
                                local lookDir = player:getLookDir()
                                local bodyYaw = math.deg(math.atan2(lookDir.z, lookDir.x))
                                local anchor1Pos = playerPos:copy():add(vectors.rotateAroundAxis(bodyYaw * -1 + 90, 0, -0.75, -0.65, 0, 1, 0))
                                local anchor2Pos = playerPos:copy():add(vectors.rotateAroundAxis(bodyYaw * -1 + 90, 0, -0.75, 0.5, 0, 1, 0))
                                for _ = 1, 5 do
                                    for _, anchorPos in ipairs({anchor1Pos, anchor2Pos}) do
                                        particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:smoke"), anchorPos):setVelocity(math.random() * 0.04 - 0.02, 0, math.random() * 0.04 - 0.02)
                                    end
                                end
                                self.isTyreBurst = true
                                self.parent.bubble:play("SWEAT", 40, vectors.vec2(), 0, false)
                                self.isTyreBurst = false
                            end
                            return true
                        end
                    end, "bicycle_ride_sound")
                else
                    events.TICK:remove("bicycle_ride_tick")
                    events.RENDER:remove("bicycle_ride_render")
                    events.ITEM_RENDER:remove("drink_bottle_item_render")
                    events.ON_PLAY_SOUND:remove("bicycle_ride_sound")
                    models.models.main.Avatar:setPos()
                    models.models.main.Avatar.LowerBody.Bicycle:setVisible(false)
                    renderer:setRenderVehicle(true)
                    for _, animationModel in ipairs({"models.main", "models.ex_skill_3"}) do
                        animations[animationModel]["bicycle_run"]:stop()
                        animations[animationModel]["bicycle_idle"]:stop()
                    end
                    models.models.main.Avatar.Head:setRot()
                    if host:isHost() then
                        self.parent.cameraManager.setCameraPivot(vectors.vec3())
                        renderer:setEyeOffset()
                    end
                    events.ITEM_RENDER:remove("drink_bottle_item_render")
                    models.models.main.Avatar.LowerBody.Bicycle.Shaft.Shaft8.WaterBottle:setParentType("None")
                    models.models.main.Avatar.LowerBody.Bicycle.Shaft.Shaft8.WaterBottle:setPos()
                    models.models.main.Avatar.LowerBody.Bicycle.Shaft.Shaft8.WaterBottle:setRot()
                    if self.windSound ~= nil then
                        self.windSound:stop()
                        self.windSound = nil
                    end
                    self.isDrinkItemHeld = false
                    self.bicycleEnabled = false
                    if self.parent.gun.currentGunPosition == "RIGHT" then
                        self.parent.arms:setArmState(1, 2)
                    elseif self.parent.gun.currentGunPosition == "LEFT" then
                        self.parent.arms:setArmState(2, 1)
                    else
                        self.parent.arms:setArmState(0, 0)
                    end
                end
                self.bicycleEnabledPrev = self.bicycleEnabled
            end
        end)
    end;
}