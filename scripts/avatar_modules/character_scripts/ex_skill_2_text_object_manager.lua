---@class ExSkill2TextObjectManager : SpawnObjectManager Exスキル2で使用するテキストオブジェクトのマネージャークラス
---@field public getObject fun(self: ExSkill2TextObjectManager, parentModel: ModelPart): ExSkill2TextObject テキストオブジェクトのインスタンスを生成して返す
---@field public spawn fun(self: ExSkill2TextObjectManager, parentModel: ModelPart) テキストオブジェクトを生成する

ExSkill2TextObjectManager = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return ExSkill2TextObjectManager
    new = function (parent)
        ---@type ExSkill2TextObjectManager
        local instance = Avatar.instantiate(ExSkill2TextObjectManager, SpawnObjectManager, parent)

        instance.managerName = "ex_skill_2_text_object"

        return instance
    end;

    ---テキストオブジェクトのインスタンスを生成して返す。
    ---@param self ExSkill2TextObjectManager
    ---@param parentModel ModelPart このオブジェクトをアタッチする親パーツ
    ---@return ExSkill2TextObject instance 生成したインスタンス
    getObject = function (self, parentModel)
        return ExSkill2TextObject.new(self.parent, parentModel)
    end;

    ---テキストオブジェクトを生成する。
    ---@param self ExSkill2TextObjectManager
    ---@param parentModel ModelPart このオブジェクトをアタッチする親パーツ
    spawn = function (self, parentModel)
        SpawnObjectManager.spawn(self, parentModel)
    end;
}