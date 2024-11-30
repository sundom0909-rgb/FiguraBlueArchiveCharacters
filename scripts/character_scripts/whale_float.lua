---@class (exact) WhaleFloat : AvatarModule クジラフロートを制御するクラス
---@field public whaleFloatEnabled boolean クジラフローに乗っているか
---@field package whaleFloatEnabledPrev boolean 前ティックにクジラフロートに乗っていたかどうか
---@field package lookDirPrev Vector3 前ティックに見ていた方法
---@field package whaleFloatAfkCount integer クジラフロート上でのAFKカウンター
---@field public isAfk boolean AFK中かどうか
---@field public enable fun(self: WhaleFloat) クジラフローを有効にする
---@field public disable fun(self: WhaleFloat) クジラフローを無効にする

WhaleFloat = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return WhaleFloat
    new = function (parent)
        ---@type WhaleFloat
        local instance = Avatar.instantiate(WhaleFloat, AvatarModule, parent)

        instance.whaleFloatEnabled = false
        instance.whaleFloatEnabledPrev = false
        instance.lookDirPrev = player:getLookDir()
        instance.whaleFloatAfkCount = 0
        instance.isAfk = false

        return instance
    end;

    ---初期化関数
    ---@param self AvatarModule
    init = function (self)
        AvatarModule.init(self)
    end;

    ---クジラフローを有効にする。
    ---@param self WhaleFloat
    enable = function (self)
        events.TICK:register(function ()
            local vehicle = player:getVehicle()
            if vehicle ~= nil  then
                local id = vehicle:getType()
                local whaleFloatEnabled = self.parent.actionWheel.shouldReplaceVehicleModels and (id == "minecraft:boat" or id == "minecraft:chest_boat") and #vehicle:getPassengers() == 1
                if whaleFloatEnabled then
                    if not self.whaleFloatEnabledPrev then
                        models.models.main.Avatar.LowerBody.WhaleFloat:setVisible(true)
                        renderer:setRenderVehicle(false)
                        models.models.main.Avatar.Head:setRot(10, 0, 0)
                        if self.parent.gun.currentGunPosition == "RIGHT" then
                            self.parent.arms:setArmState(1, 2)
                        elseif self.parent.gun.currentGunPosition == "LEFT" then
                            self.parent.arms:setArmState(2, 1)
                        else
                            self.parent.arms:setArmState(5, 5)
                        end
                        for _, animationModel in ipairs({"models.main", "models.ex_skill_2"}) do
                            animations[animationModel]["float_ride"]:play()
                        end

                        events.TICK:register(function ()
                            if world.getBlockState(player:getPos()).id == "minecraft:water" then
                                animations["models.main"]["whale_float"]:setPlaying(true)
                                if self.parent.physics.velocityAverage[5][2] >= 0.35 then
                                    self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "W", 1)
                                end
                                if self.parent.physics.velocityAverage[5][2] >= 0.1 then
                                    local bodyYaw = player:getBodyYaw()
                                    local anchorPos = ModelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.WhaleFloat.WhaleParticleAnchor1):add(vectors.rotateAroundAxis(bodyYaw * -1, 0.1875, 0, 0, 0, 1, 0))
                                    for _ = 1, 5 do
                                        local particleDirection = math.random() * 60 - 30
                                        particleDirection = particleDirection > 0 and particleDirection + 30 or particleDirection - 30
                                        particles:newParticle(self.parent.compatibilityUtils.getDustParticleId(vectors.vec3(1000000000, 1000000000, 1000000000), 3), anchorPos):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1 + particleDirection + 150, vectors.vec3(1, 1, 1), 0, 1, 0):scale(math.random()):normalize():scale(self.parent.physics.velocityAverage[5][2])):setGravity(0.5):setLifetime(10)
                                    end
                                end

                                if player:getVehicle():getNbt().Type == "bamboo" then
                                    models.models.main.Avatar:setPos(0, -6, 0)
                                    self.parent.cameraManager.setCameraPivot(vectors.vec3(0, 0.1875, 0))
                                    renderer:setEyeOffset(0, 0.1875, 0)
                                else
                                    models.models.main.Avatar:setPos()
                                    self.parent.cameraManager.setCameraPivot(vectors.vec3(0, 0.5625, 0))
                                    renderer:setEyeOffset(0, 0.5625, 0)
                                end
                            else
                                animations["models.main"]["whale_float"]:setPlaying(false)
                                if player:getVehicle():getNbt().Type == "bamboo" then
                                    models.models.main.Avatar:setPos(0, -9, 0)
                                    self.parent.cameraManager.setCameraPivot(vectors.vec3())
                                    renderer:setEyeOffset()
                                else
                                    models.models.main.Avatar:setPos(0, -3, 0)
                                    self.parent.cameraManager.setCameraPivot(vectors.vec3(0, 0.375, 0))
                                    renderer:setEyeOffset(0, 0.375, 0)
                                end
                            end

                            local lookDir = player:getLookDir()
                            if player:getVelocity():length() < 0.01 and self.lookDirPrev:copy():sub(lookDir):length() == 0 and not player:isSwingingArm() and self.parent.playerUtils.damageStatus == "NONE" and player:getActiveItem().id == "minecraft:air" then
                                self.whaleFloatAfkCount = self.whaleFloatAfkCount + 1
                                if self.whaleFloatAfkCount == 2400 then
                                    self.isAfk = true
                                    for _, animationModel in ipairs({"models.main", "models.costume_swimsuit", "models.ex_skill_2"}) do
                                        animations[animationModel]["float_afk"]:setSpeed(1)
                                        animations[animationModel]["float_afk"]:play()
                                    end
                                    self.parent.arms:setArmState(0, 0)
                                    self.parent.physics:disable()
                                elseif self.whaleFloatAfkCount >= 2430 then
                                    self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "YAWN", 1, false)
                                end
                            else
                                if self.isAfk then
                                    self.isAfk = false
                                    for _, animationModel in ipairs({"models.main", "models.costume_swimsuit", "models.ex_skill_2"}) do
                                        animations[animationModel]["float_afk"]:setSpeed(-1)
                                    end
                                    events.TICK:remove("whale_float_afk_end_tick")
                                    events.TICK:register(function ()
                                        if animations["models.main"]["float_afk"]:getTime() == 0 then
                                            for _, animationModel in ipairs({"models.main", "models.costume_swimsuit", "models.ex_skill_2"}) do
                                                animations[animationModel]["float_afk"]:stop()
                                            end
                                            if self.parent.gun.currentGunPosition == "RIGHT" then
                                                self.parent.arms:setArmState(1, 2)
                                            elseif self.parent.gun.currentGunPosition == "LEFT" then
                                                self.parent.arms:setArmState(2, 1)
                                            else
                                                self.parent.arms:setArmState(5, 5)
                                            end
                                            self.parent.physics:enable()
                                            events.TICK:remove("whale_float_afk_end_tick")
                                        end
                                    end, "whale_float_afk_end_tick")
                                end
                                self.lookDirPrev = lookDir
                            end
                        end, "whale_float_tick_2")
                    end
                    self.whaleFloatEnabledPrev = true
                elseif self.whaleFloatEnabledPrev then
                    self:disable()
                end
            elseif self.whaleFloatEnabledPrev then
                self.whaleFloatEnabled = false
                self:disable()
            end
        end, "whale_float_tick")
    end;

    ---クジラフロートを無効にする。
    ---@param self WhaleFloat
    disable = function (self)
        for _, eventName in ipairs({"whale_float_tick", "whale_float_tick_2", "whale_float_afk_end_tick"}) do
            events.TICK:remove(eventName)
        end
        models.models.main.Avatar.LowerBody.WhaleFloat:setVisible(false)
        renderer:setRenderVehicle(true)
        models.models.main.Avatar.Head:setRot()
        if self.parent.gun.currentGunPosition == "RIGHT" then
            self.parent.arms:setArmState(1, 2)
        elseif self.parent.gun.currentGunPosition == "LEFT" then
            self.parent.arms:setArmState(2, 1)
        else
            self.parent.arms:setArmState(0, 0)
        end
        for _, animationModel in ipairs({"models.main", "models.ex_skill_2"}) do
            animations[animationModel]["float_ride"]:stop()
            animations[animationModel]["float_afk"]:stop()
        end
        animations["models.costume_swimsuit"]["float_afk"]:stop()
        animations["models.main"]["whale_float"]:stop()
        models.models.main.Avatar:setPos()
        self.parent.cameraManager.setCameraPivot(vectors.vec3())
        renderer:setEyeOffset()
        self.whaleFloatAfkCount = 0
        self.isAfk = false
        self.whaleFloatEnabledPrev = false
    end;
}