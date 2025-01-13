---@class (exact) ExSkillSpriteManager : SpawnObjectManager Exスキル内で使用するスプライトのオブジェクトのマネージャークラス
---@field public objects ExSkillSprite[] インスタンスで制御するオブジェクト
---@field public getObject fun(self: ExSkillSpriteManager, target: ModelPart, index: integer, pos: Vector3, velocity: Vector3, rotVelocity: integer, size: Vector2, lifetime: integer, shouldSeeCamera: boolean): ExSkillSprite Exスキルフレームのパーティクルのインスタンスを生成して返す
---@field public spawn fun(self: ExSkillSpriteManager, target: ModelPart, index: integer, pos: Vector3, velocity: Vector3, rotVelocity: integer, size: Vector2, lifetime: integer, shouldSeeCamera: boolean) Exスキルフレームのパーティクルをスポーンさせる

ExSkillSpriteManager = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return ExSkillSpriteManager
    new = function (parent)
        ---@type ExSkillSpriteManager
        local instance = Avatar.instantiate(ExSkillSpriteManager, SpawnObjectManager, parent)

        instance.managerName = "ex_skill_sprite"

        return instance
    end;

    ---Exスキルフレームのパーティクルのインスタンスを生成して返す。
    ---@param self ExSkillSpriteManager
    ---@param target ModelPart インスタンスオブジェクトをアタッチする親モデル
    ---@param index integer テクスチャの種類を決めるインデックス番号
    ---@param pos Vector3 オブジェクトをスポーンさせる位置
    ---@param velocity Vector3 オブジェクトの移動速度
    ---@param rotVelocity integer オブジェクトの角速度
    ---@param size Vector2 スプライトの大きさ
    ---@param lifetime integer このインスタンスを破棄するまでの時間
    ---@param shouldSeeCamera boolean カメラを見続けるべきかどうか
    ---@return ExSkillSprite instance 生成したインスタンス
    getObject = function (self, target, index, pos, velocity, rotVelocity, size, lifetime, shouldSeeCamera)
        return ExSkillSprite.new(self.parent, target, index, pos, velocity, rotVelocity, size, lifetime, shouldSeeCamera)
    end;

    ---Exスキルフレームのパーティクルをスポーンさせる。
    ---@param self ExSkillSpriteManager
    ---@param target ModelPart インスタンスオブジェクトをアタッチする親モデル
    ---@param index integer テクスチャの種類を決めるインデックス番号
    ---@param pos Vector3 オブジェクトをスポーンさせる位置
    ---@param velocity Vector3 オブジェクトの移動速度
    ---@param rotVelocity integer オブジェクトの角速度
    ---@param size Vector2 スプライトの大きさ
    ---@param lifetime integer このインスタンスを破棄するまでの時間
    ---@param shouldSeeCamera boolean カメラを見続けるべきかどうか
    spawn = function (self, target, index, pos, velocity, rotVelocity, size, lifetime, shouldSeeCamera)
        SpawnObjectManager.spawn(self, target, index, pos, velocity, rotVelocity, size, lifetime, shouldSeeCamera)
    end;
}