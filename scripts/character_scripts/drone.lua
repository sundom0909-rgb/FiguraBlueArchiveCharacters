---@class Drone : AvatarModule クリエイティブ飛行に表示するドローンを制御するクラス
---@field public dronePosition Gun.GunPosition ドローンの位置
---@field package droneSound Sound|nil ドローンの飛行音
---@field package isMissileLaunchAllowed boolean ミサイル発射が許可されているかどうか
---@field package missileCoolDown integer ミサイル発射のクールダウン
---@field package didTipShow boolean ヒントを表示したかどうか
---@field public isFlying boolean クリエイティブ飛行中かどうか
---@field package isFlyingPrev boolean 前ティックにクリエイティブ飛行をしていたかどうか
---@field package shouldShowDronePrev boolean 前ティックにドローンが表示されていたかどうか
---@field package isLeftHandedPrev boolean 前ティックにプレイヤーが左利きだったかどうか
---@field package gunPositionPrev Gun.GunPosition 前ティックの銃の位置

Drone = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return Drone
    new = function (parent)
        ---@type Drone
        local instance = Avatar.instantiate(Drone, AvatarModule, parent)

        instance.dronePosition = "NONE"
        instance.isMissileLaunchAllowed = false
        instance.missileCoolDown = 0
        instance.didTipShow = false
        instance.isFlying = false
        instance.isFlyingPrev = false
        instance.shouldShowDronePrev = false
        instance.isLeftHandedPrev = false
        instance.gunPositionPrev = "NONE"

        return instance
    end;

    ---初期化関数
    ---@param self Drone
    init = function (self)
        AvatarModule.init(self)

        events.TICK:register(function ()
            local vehicle = player:getVehicle()
            local shouldShowDrone = self.isFlying and vehicle == nil and player:getPose() == "STANDING"
            if shouldShowDrone ~= self.shouldShowDronePrev then
                if shouldShowDrone then
                    models.models.ex_skill_1.Drone:moveTo(models.models.main.Avatar)
                    models.models.main.Avatar.Drone:setVisible(true)
                    self.isLeftHandedPrev = player:isLeftHanded()
                    self.parent.gun:processGunTick()
                    self.gunPositionPrev = self.parent.gun.currentGunPosition
                    if self.gunPositionPrev == "RIGHT" or (self.gunPositionPrev == "NONE" and not self.isLeftHandedPrev) then
                        animations["models.main"]["creative_flying_transition_right"]:setSpeed(1)
                        animations["models.main"]["creative_flying_transition_right"]:play()
                        animations["models.ex_skill_1"]["creative_flying_start_right"]:play()
                        self.dronePosition = "RIGHT"
                    else
                        animations["models.main"]["creative_flying_transition_left"]:setSpeed(1)
                        animations["models.main"]["creative_flying_transition_left"]:play()
                        animations["models.ex_skill_1"]["creative_flying_start_left"]:play()
                        self.dronePosition = "LEFT"
                    end
                    if self.parent.gun.currentGunPosition == "RIGHT" then
                        self.parent.arms:setArmState(1, 4)
                    elseif self.parent.gun.currentGunPosition == "LEFT" then
                        self.parent.arms:setArmState(4, 1)
                    elseif self.dronePosition == "RIGHT" then
                        self.parent.arms:setArmState(5, 4)
                    else
                        self.parent.arms:setArmState(4, 5)
                    end

                    local particleAnchor = player:getPos():add(vectors.rotateAroundAxis(player:getBodyYaw() * -1 + 180, self.dronePosition == "RIGHT" and -0.40625 or 0.40625, 5.015625, 1.9375, 0, 1, 0))
                    for _ = 1, 30 do
                        particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:poof"), particleAnchor:copy():add(math.random() * 2.4 - 1.2, math.random() * 1 - 0.5, (math.random() * 2.4 - 1.2)))
                    end
                    self.droneSound =  sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.bee.loop"), player:getPos():add(0, 3, 0), 0.1, 1, true)

                    local startCount = 0
                    events.TICK:register(function ()
                        if not client:isPaused() then
                            startCount = startCount + 1
                            self.droneSound:setPos(player:getPos():add(0, 3, 0))
                            if startCount == 5 then
                                events.TICK:remove("drone_tick_start")
                                for _, ctx in ipairs({"right", "left"}) do
                                    animations["models.main"]["creative_flying_transition_"..ctx]:stop()
                                    animations["models.ex_skill_1"]["creative_flying_start_"..ctx]:stop()
                                end
                                self.isLeftHandedPrev = player:isLeftHanded()
                                self.gunPositionPrev = self.parent.gun.currentGunPosition
                                if self.gunPositionPrev == "RIGHT" or (self.gunPositionPrev == "NONE" and not self.isLeftHandedPrev) then
                                    for _, animationModel in ipairs({"models.main", "models.ex_skill_1"}) do
                                        animations[animationModel]["creative_flying_right"]:play()
                                    end
                                    self.dronePosition = "RIGHT"
                                else
                                    for _, animationModel in ipairs({"models.main", "models.ex_skill_1"}) do
                                        animations[animationModel]["creative_flying_left"]:play()
                                    end
                                    self.dronePosition = "LEFT"
                                end
                                if not self.didTipShow and host:isHost() then
                                    print(self.parent.locale:getLocale("missile_launch.tip_pre")..self.parent.keyManager.keyMappings["missile_launch"].keybind:getKeyName()..self.parent.locale:getLocale("missile_launch.tip_post"))
                                    self.didTipShow = true
                                end
                                self.isMissileLaunchAllowed = true

                                events.TICK:register(function ()
                                    self.droneSound:setPos(player:getPos():add(0, 3, 0))
                                    local isLeftHanded = player:isLeftHanded()
                                    if (self.parent.gun.currentGunPosition == "RIGHT" or (self.parent.gun.currentGunPosition == "NONE" and not isLeftHanded)) and animations["models.main"]["creative_flying_left"]:getPlayState() == "PLAYING" then
                                        for _, animationModel in ipairs({"models.main", "models.ex_skill_1"}) do
                                            animations[animationModel]["creative_flying_right"]:play()
                                            animations[animationModel]["creative_flying_right"]:setTime(animations[animationModel]["creative_flying_left"]:getTime())
                                            animations[animationModel]["creative_flying_left"]:stop()
                                        end
                                        self.dronePosition = "RIGHT"
                                    elseif (self.parent.gun.currentGunPosition == "LEFT" or (self.parent.gun.currentGunPosition == "NONE" and isLeftHanded)) and animations["models.main"]["creative_flying_right"]:getPlayState() == "PLAYING" then
                                        for _, animationModel in ipairs({"models.main", "models.ex_skill_1"}) do
                                            animations[animationModel]["creative_flying_left"]:play()
                                            animations[animationModel]["creative_flying_left"]:setTime(animations[animationModel]["creative_flying_right"]:getTime())
                                            animations[animationModel]["creative_flying_right"]:stop()
                                        end
                                        self.dronePosition = "LEFT"
                                    end
                                    if isLeftHanded ~= self.isLeftHandedPrev and self.parent.gun.currentGunPosition == "NONE" then
                                        if isLeftHanded then
                                            self.parent.arms:setArmState(4, 5)
                                        else
                                            self.parent.arms:setArmState(5, 4)
                                        end
                                    end
                                    self.isLeftHandedPrev = isLeftHanded
                                    self.gunPositionPrev = self.parent.gun.currentGunPosition
                                end, "drone_tick")
                            end
                        end
                    end, "drone_tick_start")
                elseif models.models.main.Avatar.Drone ~= nil then
                    for _, eventName in ipairs({"drone_tick_start", "drone_tick"}) do
                        events.TICK:remove(eventName)
                    end
                    for _, ctx in ipairs({"right", "left"}) do
                        animations["models.main"]["creative_flying_transition_"..ctx]:stop()
                        animations["models.ex_skill_1"]["creative_flying_start_"..ctx]:stop()
                        for _, animationModel in ipairs({"models.main", "models.ex_skill_1"}) do
                            animations[animationModel]["creative_flying_"..ctx]:stop()
                        end
                    end
                    if self.parent.gun.currentGunPosition == "RIGHT" or (self.parent.gun.currentGunPosition == "NONE" and not player:isLeftHanded()) then
                        animations["models.main"]["creative_flying_transition_right"]:setSpeed(-1)
                        animations["models.main"]["creative_flying_transition_right"]:play()
                        animations["models.ex_skill_1"]["creative_flying_end_right"]:play()
                        self.dronePosition = "RIGHT"
                    else
                        animations["models.main"]["creative_flying_transition_left"]:setSpeed(-1)
                        animations["models.main"]["creative_flying_transition_left"]:play()
                        animations["models.ex_skill_1"]["creative_flying_end_left"]:play()
                        self.dronePosition = "LEFT"
                    end
                    local endCount = 0
                    events.TICK:register(function ()
                        if not client:isPaused() then
                            endCount = endCount + 1
                            self.droneSound:setPos(player:getPos():add(0, 3, 0))
                            if endCount == 5 then
                                for _, eventName in ipairs({"drone_tick_end", "missile_launch_tick"}) do
                                    events.TICK:remove(eventName)
                                end
                                for _, modelPart in ipairs({models.models.main.Avatar.Drone.LauncherRight.MissilesRight, models.models.main.Avatar.Drone.LauncherLeft.MissilesLeft}) do
                                    for _, modelPart2 in ipairs(modelPart:getChildren()) do
                                        modelPart2:setVisible(true)
                                    end
                                end
                                models.models.main.Avatar.Drone:moveTo(models.models.ex_skill_1)
                                models.models.ex_skill_1.Drone:setVisible(false)
                                local particleAnchor = player:getPos():add(vectors.rotateAroundAxis(player:getBodyYaw() * -1 + 180, self.dronePosition == "RIGHT" and -0.40625 or 0.40625, 5.015625, -1.9375, 0, 1, 0))
                                for _ = 1, 30 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:poof"), particleAnchor:copy():add(math.random() * 2.4 - 1.2, math.random() * 1 - 0.5, (math.random() * 2.4 - 1.2)))
                                end
                                self.droneSound:stop()
                                self.dronePosition = "NONE"
                                if self.parent.gun.currentGunPosition == "RIGHT" then
                                    self.parent.arms:setArmState(1, 2)
                                elseif self.parent.gun.currentGunPosition == "LEFT" then
                                    self.parent.arms:setArmState(2, 1)
                                else
                                    self.parent.arms:setArmState(0, 0)
                                end
                            end
                        end
                    end, "drone_tick_end")
                end
                self.shouldShowDronePrev = shouldShowDrone
            end

            if host:isHost() then
                local isFlying = host:isFlying() and player:getGamemode() ~= "SPECTATOR"
                if isFlying ~= self.isFlyingPrev then
                    pings.setIsFlying(isFlying)
                    self.isFlyingPrev = isFlying
                end
                self.parent.characterData.dataSync.syncData.isFlying = isFlying
                self.missileCoolDown = math.max(self.missileCoolDown - 1, 0)
            end
        end)

        self.parent.avatarEvents.SCRIPT_INIT:register(function ()
            local localeStrings = {
                {"key_name.missile_launch", "Launch missiles", "ミサイル発射"};
                {"missile_launch.in_cool_down_pre", "Please wait ", "あと"};
                {"missile_launch.in_cool_down_post", " more seconds to launch missiles.", "秒待ってください。"};
                {"missile_launch.tip_pre", "9§l[TIP]§r Press ", "§9§l[TIP]§r "};
                {"missile_launch.tip_post", " key to launch missiles!", "キーを押すとミサイルを発射します！"};
            }

            for _, localeSet in ipairs(localeStrings) do
                self.parent.locale.localeData.en_us[localeSet[1]] = localeSet[2]
                self.parent.locale.localeData.ja_jp[localeSet[1]] = localeSet[3]
            end

            self.parent.keyManager:register("missile_launch", "key.keyboard.v"):setOnPress(function ()
                if self.isMissileLaunchAllowed then
                    if self.missileCoolDown == 0 then
                        pings.launchMissiles()
                        self.missileCoolDown = 200
                    else
                        sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.note_block.bass"), player:getPos(), 1, 0.5)
                        print(self.parent.locale:getLocale("missile_launch.in_cool_down_pre")..math.ceil(self.missileCoolDown / 20)..self.parent.locale:getLocale("missile_launch.in_cool_down_post"))
                    end
                end
            end)
        end)
    end;
}

---クリエイティブ飛行フラグを設定する。
---@param isFlying boolean クリエイティブ飛行をしているかどうか
function pings.setIsFlying(isFlying)
    AvatarInstance.drone.isFlying = isFlying
end

---ミサイルを発射する。
function pings.launchMissiles()
    if models.models.main.Avatar.Drone ~= nil then
        AvatarInstance.faceParts:setEmotion("NARROW_ANGRY", "NARROW_ANGRY", "ANGRY", 60, true)
        local launchCounter = 0
        if events.TICK:getRegisteredCount("missile_launch_tick") == 0 then
            events.TICK:register(function ()
                if launchCounter % 5 == 0 and launchCounter <= 35 then
                    local missileNum = math.floor(launchCounter / 5) + 1
                    local missileModel = missileNum <= 4 and models.models.main.Avatar.Drone.LauncherRight.MissilesRight["Missile"..missileNum] or models.models.main.Avatar.Drone.LauncherLeft.MissilesLeft["Missile"..(missileNum - 4)]
                    local lookDir = player:getLookDir()
                    AvatarInstance.missileManager:spawn(AvatarInstance.modelUtils.getModelWorldPos(missileModel), vectors.vec3(math.deg(math.asin(lookDir.y)) * -1, math.deg(math.atan2(lookDir.z, lookDir.x)) * -1 + 90, 0))
                    missileModel:setVisible(false)
                    sounds:playSound(AvatarInstance.compatibilityUtils:checkSound("minecraft:entity.blaze.hurt"), player:getPos(), 1, 1.5)
                elseif launchCounter == 135 then
                    events.TICK:remove("missile_launch_tick")
                    for _, modelPart in ipairs({models.models.main.Avatar.Drone.LauncherRight.MissilesRight, models.models.main.Avatar.Drone.LauncherLeft.MissilesLeft}) do
                        for _, modelPart2 in ipairs(modelPart:getChildren()) do
                            modelPart2:setVisible(true)
                        end
                    end
                    sounds:playSound(AvatarInstance.compatibilityUtils:checkSound("minecraft:block.dispenser.fail"), player:getPos(), 1, 2)
                end
                if launchCounter % 5 <= 1 and launchCounter <= 36 then
                    for _, modelPart in ipairs({models.models.main.Avatar.Drone.LauncherRight.LauncherBase, models.models.main.Avatar.Drone.LauncherLeft.LauncherBase}) do
                        local anchorPos = ModelUtils.getModelWorldPos(modelPart)
                        local bodyYaw = player:getBodyYaw()
                        local particleDir = vectors.rotateAroundAxis(bodyYaw * -1, 0, 0, -0.25, 0, 1, 0)
                        if launchCounter % 5 == 0 then
                            for _ = 1, 5 do
                                particles:newParticle(AvatarInstance.compatibilityUtils:checkParticle("minecraft:flame"), anchorPos:copy():add(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 0.5 - 0.25, math.random() * 0.5 - 0.25, 0, 0, 1, 0))):setVelocity(particleDir:copy():scale(2)):setLifetime(4)
                            end
                        end
                        for _ = 1, 5 do
                            particles:newParticle(AvatarInstance.compatibilityUtils:checkParticle("minecraft:large_smoke"), anchorPos:copy():add(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 0.5 - 0.25, math.random() * 0.5 - 0.25, 0, 0, 1, 0))):setVelocity(particleDir)
                        end
                    end
                end
                launchCounter = launchCounter + 1
            end, "missile_launch_tick")
        end
    end
end