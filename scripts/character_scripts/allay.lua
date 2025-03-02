---@class (exact) Allay : AvatarModule お供のアレイを制御するクラス
---@field package isAllayEnabled boolean アレイ制御が有効かどうか
---@field package wasAllayEnabledPrev boolean 前ティックにアレイ制御が有効だったかどうか
---@field public perchCount integer アレイが頭に止まるまでのカウンター
---@field package currentPos Vector3 アレイの現在の位置
---@field package nextPos Vector3 アレイの次ティックの位置
---@field package currentRot number アレイの現在の角度
---@field package nextRot number アレイの次ティックの角度

Allay = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return Allay
    new = function (parent)
        ---@type Allay
        local instance = Avatar.instantiate(Allay, AvatarModule, parent)

        instance.isAllayEnabled = false
        instance.wasAllayEnabledPrev = false
        instance.perchCount = 0
        instance.currentPos = vectors.vec3()
        instance.nextPos = vectors.vec3()
        instance.currentRot = 0
        instance.nextRot = 0

        return instance
    end;

    ---初期化関数
    ---@param self Allay
    init = function (self)
        AvatarModule.init(self)

        events.TICK:register(function ()
            self.isAllayEnabled = self.parent.exSkill.animationCount == -1
            if self.isAllayEnabled ~= self.wasAllayEnabledPrev then
                if self.isAllayEnabled then
                    --アレイ制御を有効化
                    events.TICK:register(function ()
                        if not client:isPaused() and self.isAllayEnabled and models.models.main.Avatar.Head.Allay ~= nil then
                            local playerPose = player:getPose()
                            if (not player:isMoving() or player:getVehicle() ~= nil) and playerPose ~= "FALL_FLYING" and playerPose ~= "SWIMMING" and playerPose ~= "SLEEPING" then
                                if self.perchCount <= 10 and self.perchCount > 0 then
                                    if self.perchCount == 10 then
                                        animations["models.ex_skill_1"].allay_fly_start:setSpeed(-1)
                                    end
                                elseif self.perchCount == 0 then
                                    events.RENDER:remove("allay_fly_render")
                                    animations["models.ex_skill_1"].allay_fly_loop:stop()
                                    animations["models.ex_skill_1"].allay_perch_loop:play()
                                    models.models.main.Avatar.Head.Allay:setParentType("None")
                                    models.models.main.Avatar.Head.Allay:setPos(0, self.parent.armor.isArmorVisible.helmet and 33 or 32, 3)
                                    models.models.main.Avatar.Head.Allay:setRot()
                                end
                                self.perchCount = self.perchCount - 1
                            else
                                if self.perchCount <= 10 then
                                    animations["models.ex_skill_1"].allay_fly_start:setSpeed(1)
                                    if self.perchCount <= 0 then
                                        animations["models.ex_skill_1"].allay_perch_loop:stop()
                                        animations["models.ex_skill_1"].allay_fly_loop:play()
                                        models.models.main.Avatar.Head.Allay:setParentType("World")
                                        self.currentPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.Head.AllayAnchor)
                                        self.nextPos = self.currentPos:copy()
                                        local deltaPos = self.nextPos:copy():sub(self.currentPos)
                                        self.currentRot = math.deg(math.atan2(deltaPos.z, deltaPos.x)) * -1 - 90
                                        self.nextRot = self.currentRot
                                        models.models.main.Avatar.Head.Allay:setRot(0, player:getBodyYaw() * -1 + 180, 0)
                                        events.RENDER:register(function (delta)
                                            if not client:isPaused() and self.isAllayEnabled and models.models.main.Avatar.Head.Allay ~= nil then
                                                local pos = self.nextPos:copy():sub(self.currentPos):scale(delta):add(self.currentPos)
                                                local playerPos = player:getPos(delta):add(0, 1.5, 0)
                                                local headRot = 0
                                                if playerPos.y - pos.y ~= 0 then
                                                    headRot = math.deg(math.atan2(playerPos.y - pos.y, math.sqrt(math.pow(playerPos.x - pos.x, 2) + math.pow(playerPos.z - pos.z, 2)))) * math.min(self.perchCount / 10, 1)
                                                end
                                                models.models.main.Avatar.Head.Allay:setPos(pos:scale(16))
                                                models.models.main.Avatar.Head.Allay:setRot(0, (self.nextRot - self.currentRot) * delta + self.currentRot, 0)
                                                models.models.main.Avatar.Head.Allay.AllayHead:setRot(headRot, 0, 0)
                                            end
                                        end, "allay_fly_render")
                                    end
                                end
                                self.perchCount = 60
                            end
                            if self.perchCount > 0 then
                                self.currentPos = self.nextPos:copy()
                                self.currentRot = self.nextRot
                                local playerPos = player:getPos()
                                if self.perchCount > 10 then
                                    self.nextPos = playerPos:copy():add(0, 2, 0):sub(self.currentPos):scale(0.2):add(self.currentPos)
                                    local deltaPos = self.nextPos:copy():sub(self.currentPos)
                                    self.nextRot = math.deg(math.atan2(deltaPos.z, deltaPos.x)) * -1 - 90
                                else
                                    self.nextPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.Head.AllayAnchor):sub(self.currentPos):scale(0.2):add(self.currentPos)
                                    local lookDir = player:getLookDir()
                                    self.nextRot = math.deg(math.atan2(lookDir.z, lookDir.x)) * -1 - 90
                                end
                                animations["models.ex_skill_1"].allay_fly_loop:setSpeed(1 + math.min(self.nextPos:copy():sub(self.currentPos):length(), 1) * 2)
                                local rotDelta = self.nextRot - self.currentRot
                                if rotDelta > 180 then
                                    self.nextRot = self.nextRot - 360
                                elseif rotDelta < -180 then
                                    self.nextRot = self.nextRot + 360
                                end
                                if math.abs(self.nextRot - self.currentRot) > 30 then
                                    if self.nextRot - self.currentRot >= 0 then
                                        self.nextRot = self.currentRot + 30
                                    else
                                        self.nextRot = self.currentRot - 30
                                    end
                                end
                                if playerPos:copy():sub(self.nextPos):length() < 1.5 then
                                    self.nextPos = playerPos:copy():sub(self.nextPos):normalize():scale(-1.5):add(playerPos)
                                end
                            end
                            models.models.main.Avatar.Head.Allay:setVisible(self.perchCount <= 0 or not renderer:isFirstPerson())
                        end
                    end, "allay_tick")
                    models.models.ex_skill_1.Allay:moveTo(models.models.main.Avatar.Head)
                    models.models.ex_skill_1:removeChild(models.models.main.Avatar.Head.Allay)
                    for _, animName in ipairs({"allay", "allay_fly_start"}) do
                        animations["models.ex_skill_1"][animName]:play()
                    end
                    animations["models.ex_skill_1"].allay_fly_start:setSpeed(-1)

                else
                    --アレイ制御を無効化
                    events.TICK:remove("allay_tick")
                    events.RENDER:remove("allay_fly_render")
                    for _, animName in ipairs({"allay", "allay_perch_loop", "allay_fly_start", "allay_fly_loop"}) do
                        animations["models.ex_skill_1"][animName]:stop()
                    end
                    for _, animName in ipairs({"allay_fly_start", "allay_fly_loop"}) do
                        animations["models.ex_skill_1"][animName]:setSpeed()
                    end
                    if models.models.main.Avatar.Head.Allay ~= nil then
                        models.models.main.Avatar.Head.Allay:moveTo(models.models.ex_skill_1)
                        models.models.main.Avatar.Head:removeChild(models.models.ex_skill_1.Allay)
                    end
                    models.models.ex_skill_1.Allay:setVisible(false)
                    models.models.ex_skill_1.Allay:setParentType("None")
                    models.models.ex_skill_1.Allay:setPos()
                    models.models.ex_skill_1.Allay:setRot()
                    models.models.ex_skill_1.Allay.AllayHead:setRot()
                    self.perchCount = 0
                end
                self.wasAllayEnabledPrev = self.isAllayEnabled
            end
        end)
        models.models.ex_skill_1.Allay:setPrimaryTexture("RESOURCE", "minecraft:textures/entity/allay/allay.png")
    end;
}