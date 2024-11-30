---@class ExSkill2WaveParticleManager : SpawnObjectManager 水着のExスキルアニメーション後の波を表現するパーティクルを管理するクラス
---@field package animationCount integer パーティクルの再生タイミングを計るカウンター
---@field public getObject fun(self: ExSkill2WaveParticleManager, pos: Vector3, rot: number): ExSkill2WaveParticleManager パーティクルのインスタンスを生成して返す
---@field public spawn fun(self: ExSkill2WaveParticleManager, pos: Vector3, rot: number) パーティクルを生成する
---@field public play fun(self: ExSkill2WaveParticleManager) 波のパーティクルを再生する

ExSkill2WaveParticleManager = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return ExSkill2WaveParticleManager
    new = function (parent)
        ---@type ExSkill2WaveParticleManager
        local instance = Avatar.instantiate(ExSkill2WaveParticleManager, SpawnObjectManager, parent)

        instance.managerName = "ex_skill_2_particles"
        instance.animationCount = 0

        return instance
    end;

    ---パーティクルのインスタンスを生成して返す。
    ---@param self ExSkill2WaveParticleManager
    ---@param pos Vector3 パーティクルの基準位置
    ---@param rot number パーティクルの向き（度数法）
    ---@return ExSkill2WaveParticle instance 生成したインスタンス
    getObject = function (self,  pos, rot)
        return ExSkill2WaveParticle.new(self.parent, pos, rot)
    end;

    ---パーティクルを生成する。
    ---@param self ExSkill2WaveParticleManager
    ---@param pos Vector3 パーティクルの基準位置
    ---@param rot number パーティクルの向き（度数法）
    spawn = function (self, pos, rot)
        SpawnObjectManager.spawn(self, pos, rot)
    end;

    ---波のパーティクルを再生する。
    ---@param self ExSkill2WaveParticleManager
    play = function (self)
        events.TICK:remove("ex_skill_2_particles_play_tick")

        local playerPos = player:getPos()
        local bodyYaw = player:getBodyYaw()
        events.TICK:register(function ()
            self:spawn(playerPos, bodyYaw)
            if self.animationCount == 20 then
                events.TICK:remove("ex_skill_2_particles_play_tick")
                self.animationCount = 0
            else
                self.animationCount = self.animationCount + 1
            end
        end, "ex_skill_2_particles_play_tick")
    end;
}