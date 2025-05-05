---@alias SyupogakiDance.DanceState
---| "NOT_STANDBY" # 非スタンバイ状態
---| "STANDBY" # スタンバイ状態
---| "PLAYING" # ダンス再生中

---@class (exact) SyupogakiDance : AvatarModule シュポガキダンスを制御するクラス
---@field public danceState SyupogakiDance.DanceState シュポガキダンスの状態
---@field package isHost boolean このアバターが親かどうか
---@field package offsetPos Vector3 ダンスを行う位置のオフセット
---@field package rot number ダンスをする際のアバターの向き
---@field package targetPlayer string|nil 相手プレイヤーのUUID
---@field package animationTick integer ダンスアニメーションのタイミングを測るティック変数
---@field package canPlayDance fun(self: SyupogakiDance): boolean シュポガキダンスが再生可能か（スタンバイ可能か）を返す。
---@field public standby fun(self: SyupogakiDance) シュポガキダンスをスタンバイ状態にする。
---@field public stop fun(self: SyupogakiDance) シュポガキダンスを終了する（スタンバイ状態を含む）。

SyupogakiDance = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return SyupogakiDance
    new = function (parent)
        ---@type SyupogakiDance
        local instance = Avatar.instantiate(SyupogakiDance, AvatarModule, parent)

        instance.danceState = "NOT_STANDBY"
        instance.isHost = false
        instance.offsetPos = vectors.vec3()
        instance.rot = 0
        instance.targetPlayer = nil
        instance.animationTick = -1

        return instance
    end;

    ---初期化関数
    ---@param self SyupogakiDance
    init = function (self)
        AvatarModule.init(self)

        if host:isHost() then
            local localeStrings = {
                {"key_name.syupogaki_dance", "Syupogaki dance", "シュポガキダンス"};
            }

            for _, localeSet in ipairs(localeStrings) do
                self.parent.locale.localeData.en_us[localeSet[1]] = localeSet[2]
                self.parent.locale.localeData.ja_jp[localeSet[1]] = localeSet[3]
            end

            self.parent.keyManager:register("syupogaki_dance", "key.keyboard.v"):onPress(function ()
                if self:canPlayDance() and self.danceState == "NOT_STANDBY" then
                    pings.standbyDance()
                else
                    print(self.parent.locale:getLocale("key_bind.ex_skill.unavailable"..(renderer:isFirstPerson() and "_firstperson" or "")))
                    sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.note_block.bass"), player:getPos(), 1, 0.5)
                end
            end)
        end

        avatar:store("FBAC_Hikari", true)
        avatar:store("dance_state", "NOT_STANDBY")
        avatar:store("dance_animation_time", 0)
        avatar:store("dance_pos", vectors.vec3())
        avatar:store("dance_rot", 0)
        avatar:store("target_player", "")
        avatar:store("dance_tick", -1)
    end;

    ---シュポガキダンスが再生可能か（スタンバイ可能か）を返す。
    ---@param self SyupogakiDance
    ---@return boolean canPlayDance シュポガキダンスが再生可能かどうか
    canPlayDance = function (self)
        local firstCheck = player:getPose() == "STANDING" and not player:isMoving() and player:isOnGround() and not player:isInWater() and not player:isInLava() and player:getFrozenTicks() == 0 and not renderer:isFirstPerson() and player:getSwingArm() == nil and player:getActiveItem().id == "minecraft:air" and not self.parent.costume.isChangingCostume and self.parent.exSkill.transitionCount == 0
        if self.targetPlayer ~= nil then
            local avatarVars = world.avatarVars()
            if avatarVars[self.targetPlayer].FBAC_Nozomi ~= nil and avatarVars[self.targetPlayer].FBAC_Nozomi then
                return firstCheck and avatarVars[self.targetPlayer].dance_state ~= "NOT_STANDBY"
            else
                return false
            end
        else
            return firstCheck
        end
    end;

    ---シュポガキダンスをスタンバイ状態にする。
    ---@param self SyupogakiDance
    standby = function (self)
        animations["models.main"]["syupogaki_dance_standby"]:play()
        self.parent.physics:disable()
        avatar:store("dance_state", "STANDBY")
        sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), player:getPos(), 1, 0.5)

        ---既にスタンバイ状態である相手を検索
        ---ここで発見した場合、こちらが子になる。
        local playerPos = player:getPos()
        local playerFound = false
        for uuid, avatarVar in pairs(world.avatarVars()) do
            if avatarVar.FBAC_Nozomi and avatarVar.dance_state == "STANDBY" and avatarVar.dance_pos:copy():sub(playerPos):length() <= 2  then
                self.isHost = false
                self.danceState = "PLAYING"
                avatar:store("dance_state", "PLAYING")
                self.targetPlayer = uuid
                avatar:store("target_player", uuid)
                playerFound = true
                self.offsetPos = avatarVar.dance_pos:copy():sub(playerPos)
                self.rot = avatarVar.dance_rot
                models.models.main.Avatar:setPos(vectors.rotateAroundAxis(self.rot, self.offsetPos:copy():scale(16):mul(-1, 1, -1), 0, 1, 0))
                animations["models.main"]["syupogaki_dance_standby"]:stop()
                animations["models.main"]["syupogaki_dance"]:play()
            end
        end
        if not playerFound then
            self.danceState = "STANDBY"
            avatar:store("dance_state", "STANDBY")
            avatar:store("dance_pos", playerPos)
            self.rot = player:getBodyYaw() % 360
            avatar:store("dance_rot", self.rot)
        end

        events.TICK:register(function ()
            if not self:canPlayDance() then
                self:stop()
            end

            ---相手が承認してくれるのを待つ。
            ---ここで発見した場合、こちらが親になる。
            if self.danceState == "STANDBY" then
                for uuid, avatarVar in pairs(world.avatarVars()) do
                    if avatarVar.FBAC_Nozomi and avatarVar.target_player == player:getUUID()  then
                        self.isHost = true
                        self.danceState = "PLAYING"
                        avatar:store("dance_state", "PLAYING")
                        self.targetPlayer = uuid
                        animations["models.main"]["syupogaki_dance_standby"]:stop()
                        animations["models.main"]["syupogaki_dance"]:play()
                    end
                end
            elseif self.danceState == "PLAYING" then
                local avatarVars = world.avatarVars()
                if self.isHost then
                    animations["models.main"]["syupogaki_dance"]:setTime(avatarVars[self.targetPlayer].dance_animation_time)
                    self.animationTick = avatarVars[self.targetPlayer].animationTick
                else
                    self.animationTick = self.animationTick + 1
                    avatar:store("dance_animation_time", animations["models.main"]["syupogaki_dance"]:getTime())
                    avatar:store("dance_tick", self.animationTick)
                end
            end
        end, "syupogaki_dance_tick")

        events.RENDER:register(function (delta, ctx, matrix)
            models.models.main:setRot(0, player:getBodyYaw(delta) + self.rot * -1, 0)
        end, "syupogaki_dance_render")
    end;

    ---シュポガキダンスを終了する（スタンバイ状態を含む）。
    ---@param self SyupogakiDance
    stop = function (self)
        events.TICK:remove("syupogaki_dance_tick")
        events.RENDER:remove("syupogaki_dance_render")
        models.models.main.Avatar:setPos()
        models.models.main:setRot()
        for _, animationName in ipairs({"syupogaki_dance_standby", "syupogaki_dance"}) do
            animations["models.main"][animationName]:stop()
        end
        self.parent.physics:enable()
        self.isHost = false
        self.danceState = "NOT_STANDBY"
        avatar:store("dance_state", "NOT_STANDBY")
        avatar:store("dance_animation_time", 0)
        self.offsetPos = vectors.vec3()
        avatar:store("dance_pos", vectors.vec3())
        self.rot = 0
        avatar:store("dance_rot", 0)
        self.targetPlayer = nil
        avatar:store("target_player", "")
        self.animationTick = -1
        avatar:store("dance_tick", -1)
    end;
}

---シュポガキダンスをスタンバイ状態にする。
function pings.standbyDance()
    AvatarInstance.syupogakiDance:standby()
end
