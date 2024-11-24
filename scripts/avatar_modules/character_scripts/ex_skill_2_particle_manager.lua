---@class ExSkill2ParticleManager : SpawnObjectManager Exスキル2で使用する独自定義のパーティクルのマネージャークラス
---@field public getObject fun(self: ExSkill2ParticleManager, text: string): ExSkill2Particle 独自定義のパーティクルのインスタンスを生成して返す

ExSkill2ParticleManager = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return ExSkill2ParticleManager
    new = function (parent)
        ---@type ExSkill2ParticleManager
        local instance = Avatar.instantiate(ExSkill2ParticleManager, SpawnObjectManager, parent)

        instance.managerName = "ex_skill_2_particle"

        return instance
    end;

    ---独自定義のパーティクルのインスタンスを生成して返す。
    ---@param self ExSkill2ParticleManager
    ---@return ExSkill2Particle instance 生成したインスタンス
    getObject = function (self)
        return ExSkill2Particle.new(self.parent)
    end;
}