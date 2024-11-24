---@class ExSkill1TextObjectManager : SpawnObjectManager Exスキル1で使用するテキストオブジェクトのマネージャークラス
---@field package objects ExSkill1TextObject[] インスタンスで制御するオブジェクト
---@field public getObject fun(self: ExSkill1TextObjectManager, text: string): ExSkill1TextObject テキストオブジェクトのインスタンスを生成して返す
---@field public spawn fun(self: ExSkill1TextObjectManager, text: string) テキストオブジェクトを生成する

ExSkill1TextObjectManager = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return ExSkill1TextObjectManager
    new = function (parent)
        ---@type ExSkill1TextObjectManager
        local instance = Avatar.instantiate(ExSkill1TextObjectManager, SpawnObjectManager, parent)

        instance.managerName = "ex_skill_1_text_object"

        return instance
    end;

    ---初期化関数
    ---@param self ExSkill1TextObjectManager
    init = function (self)
        SpawnObjectManager.init(self)

        ---@diagnostic disable-next-line: discard-returns
        models:newPart("script_ex_skill_1_text_object")
    end;

    ---テキストオブジェクトのインスタンスを生成して返す。
    ---@param self ExSkill1TextObjectManager
    ---@param text string オブジェクトに設定するテキスト
    ---@return ExSkill1TextObject instance 生成したインスタンス
    getObject = function (self, text)
        return ExSkill1TextObject.new(self.parent, text)
    end;

    ---テキストオブジェクトを生成する。
    ---@param self ExSkill1TextObjectManager
    ---@param text string オブジェクトに設定するテキスト
    spawn = function (self, text)
        SpawnObjectManager.spawn(self, text)
    end;
}