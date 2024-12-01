---@class ExSkill2MelodyParticleManager : SpawnObjectManager Exスキル2で使用する音符の独自パーティクルを管理するクラス
---@field package getObject fun(self: ExSkill2MelodyParticleManager, pos: Vector3, rot: Vector3, size: Vector2, velocity: Vector3, lifeTime: integer, shouldSeeCamera: boolean): ExSkill2MelodyParticle 音符パーティクルのインスタンスを生成して返す
---@field public spawn fun(self: ExSkill2MelodyParticleManager, pos: Vector3, rot: Vector3, size: Vector2, velocity: Vector3, lifeTime: integer, shouldSeeCamera: boolean) 音符パーティクルをスポーンさせる

ExSkill2MelodyParticleManager = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return ExSkill2MelodyParticleManager
    new = function (parent)
        ---@type ExSkill2MelodyParticleManager
        local instance = Avatar.instantiate(ExSkill2MelodyParticleManager, SpawnObjectManager, parent)

        instance.managerName = "ex_skill_2_melody_particle"

        return instance
    end;

    ---初期化関数
    ---@param self ExSkill2MelodyParticleManager
    init = function (self)
        SpawnObjectManager.init(self)

        ---@diagnostic disable-next-line: discard-returns
        models:newPart("script_ex_skill_2_melody_particle", "World")
    end;

    ---音符パーティクルのインスタンスを生成して返す。
    ---@param self ExSkill2MelodyParticleManager
    ---@param pos Vector3 パーティクルの初期位置
    ---@param rot Vector3 パーティクルの向き
    ---@param size Vector2 パーティクルの大きさ
    ---@param velocity Vector3 パーティクルの移動方向と速度
    ---@param lifeTime integer パーティクルの表示時間
    ---@param shouldSeeCamera boolean パーティクルがカメラワークの方向を見るべきかどうか
    ---@return ExSkill2MelodyParticle instance 生成したインスタンス
    getObject = function (self, pos, rot, size, velocity, lifeTime, shouldSeeCamera)
        return ExSkill2MelodyParticle.new(self.parent, pos, rot, size, velocity, lifeTime, shouldSeeCamera)
    end;

    ---音符パーティクルをスポーンさせる。
    ---@param self ExSkill2MelodyParticleManager
    ---@param pos Vector3 パーティクルの初期位置
    ---@param rot Vector3 パーティクルの向き
    ---@param size Vector2 パーティクルの大きさ
    ---@param velocity Vector3 パーティクルの移動方向と速度
    ---@param lifeTime integer パーティクルの表示時間
    ---@param shouldSeeCamera boolean パーティクルがカメラワークの方向を見るべきかどうか
    spawn = function (self, pos, rot, size, velocity, lifeTime, shouldSeeCamera)
        SpawnObjectManager.spawn(self, pos, rot, size, velocity, lifeTime, shouldSeeCamera)
    end;
}