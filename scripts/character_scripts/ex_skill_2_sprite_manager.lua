---@alias ExSkill2SpriteManager.SpriteType
---| "STAR" # 星
---| "MINISTAR" # 小さい星（アニメーション付き）
---| "MINISTAR2" # 斜めの小さい星（アニメーション付き）

---@class (exact) ExSkill2SpriteManager : SpawnObjectManager Exスキル2内で使用するスプライトのオブジェクトのマネージャークラス
---@field public objects ExSkill2Sprite[] インスタンスで制御するオブジェクト
---@field public getObject fun(self: ExSkill2SpriteManager, type: ExSkill2SpriteManager.SpriteType, pos: Vector2, velocity: Vector2): ExSkill2Sprite Exスキル2のスプライトのインスタンスを生成して返す
---@field public spawn fun(self: ExSkill2SpriteManager, type: ExSkill2SpriteManager.SpriteType, pos:Vector2, velocity: Vector2) Exスキル2のスプライトをスポーンさせる

ExSkill2SpriteManager = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return ExSkill2SpriteManager
    new = function (parent)
        ---@type ExSkill2SpriteManager
        local instance = Avatar.instantiate(ExSkill2SpriteManager, SpawnObjectManager, parent)

        instance.managerName = "ex_skill_2_sprite"

        return instance
    end;

    ---初期化関数
    ---@param self ExSkill2SpriteManager
    init = function (self)
        SpawnObjectManager.init(self)

        ---@diagnostic disable-next-line: discard-returns
        models:newPart("script_ex_skill_2_sprite", "Gui")
    end;

    ---Exスキル2のスプライトのインスタンスを生成して返す。
    ---@param self ExSkill2SpriteManager
    ---@param type ExSkill2SpriteManager.SpriteType スプライトの種類
    ---@param pos Vector2 スプライトの初期位置
    ---@param velocity Vector2 スプライトの移動速度
    ---@return ExSkill2Sprite instance 生成したインスタンス
    getObject = function (self, type, pos, velocity)
        return ExSkill2Sprite.new(self.parent, type, pos, velocity)
    end;

    ---Exスキル2のスプライトのパーティクルをスポーンさせる。
    ---@param self ExSkill2SpriteManager
    ---@param type ExSkill2SpriteManager.SpriteType スプライトの種類
    ---@param pos Vector2 スプライトの初期位置
    ---@param velocity Vector2 スプライトの移動速度
    spawn = function (self, type, pos, velocity)
        SpawnObjectManager.spawn(self, type, pos, velocity)
    end;
}