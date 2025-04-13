---@alias ExSkill1ItemObjectManager.SpriteType
---| "ITEM" # アイテムテクスチャ
---| "CROSS" # 十字
---| "DOT" # ドット

---@class ExSkill1ItemObjectManager : SpawnObjectManager Exスキル1で使用するアイテムオブジェクトのマネージャークラス
---@field public getObject fun(self: ExSkill1ItemObjectManager, type: ExSkill1ItemObjectManager.SpriteType, launchRot?: number): ExSkill1ItemObject アイテムオブジェクトのインスタンスを生成して返す
---@field public spawn fun(self: ExSkill1ItemObjectManager, type: ExSkill1ItemObjectManager.SpriteType, launchRot?: number) アイテムオブジェクトを生成する

ExSkill1ItemObjectManager = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return ExSkill1ItemObjectManager
    new = function (parent)
        ---@type ExSkill1ItemObjectManager
        local instance = Avatar.instantiate(ExSkill1ItemObjectManager, SpawnObjectManager, parent)

        instance.managerName = "ex_skill_1_item_object"

        return instance
    end;

    ---初期化関数
    ---@param self ExSkill1ItemObjectManager
    init = function (self)
        SpawnObjectManager.init(self)

        ---@diagnostic disable-next-line: discard-returns
        models:newPart("script_ex_skill_1_item_object", "World")
    end;

    ---アイテムオブジェクトのインスタンスを生成して返す。
    ---@param self ExSkill1ItemObjectManager
    ---@param type ExSkill1ItemObjectManager.SpriteType 表示するスプライトの種類
    ---@param launchRot? number スプライトの射出角度。スプライトタイプが"ITEM"以外は無視される。
    ---@return ExSkill1ItemObject instance 生成したインスタンス
    getObject = function (self, type, launchRot)
        return ExSkill1ItemObject.new(self.parent, type, launchRot)
    end;

    ---アイテムオブジェクトを生成する。
    ---@param self ExSkill1ItemObjectManager
    ---@param type ExSkill1ItemObjectManager.SpriteType 表示するスプライトの種類
    ---@param launchRot? number スプライトの射出角度。スプライトタイプが"ITEM"以外は無視される。
    spawn = function (self, type, launchRot)
        SpawnObjectManager.spawn(self, type, launchRot)
    end;
}