---@class (exact) ExSkill2FrameParticleManager : SpawnObjectManager Exスキル2で使用するフレームで使用するパーティクルを管理するクラス
---@field public objects ExSkillFrameParticle[] インスタンスで制御するオブジェクト
---@field public getObject fun(self: ExSkill2FrameParticleManager, pos: Vector2, velocity: Vector2): ExSkill2FrameParticle Exスキル2ｍｐフレームのパーティクルのインスタンスを生成して返す
---@field public spawn fun(self: ExSkill2FrameParticleManager, pos: Vector2, velocity: Vector2) Exスキル2のフレームのパーティクルをスポーンさせる

ExSkill2FrameParticleManager = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return ExSkill2FrameParticleManager
    new = function (parent)
        ---@type ExSkill2FrameParticleManager
        local instance = Avatar.instantiate(ExSkill2FrameParticleManager, SpawnObjectManager, parent)

        instance.managerName = "ex_skill_2_frame_particle"

        return instance
    end;

    ---初期化関数
    ---@param self ExSkill2FrameParticleManager
    init = function (self)
        SpawnObjectManager.init(self)

        ---@diagnostic disable-next-line: discard-returns
        models.models.ex_skill_2.Gui:newPart("script_ex_skill_2_frame_particles")
    end;

    ---Exスキル2のフレームのパーティクルのインスタンスを生成して返す。
    ---@param self ExSkill2FrameParticleManager
    ---@param pos Vector2 パーティクルをスポーンさせる画面上の座標
    ---@param velocity Vector2 パーティクルの速度
    ---@return ExSkill2FrameParticle instance 生成したインスタンス
    getObject = function (self, pos, velocity)
        return ExSkill2FrameParticle.new(self.parent, pos, velocity)
    end;

    ---Exスキル2のフレームのパーティクルをスポーンさせる。
    ---@param self ExSkill2FrameParticleManager
    ---@param pos Vector2 パーティクルをスポーンさせる画面上の座標
    ---@param velocity Vector2 パーティクルの速度
    spawn = function (self, pos, velocity)
        SpawnObjectManager.spawn(self, pos, velocity)
    end;
}