---@class ExSkill1TextObjectManager : SpawnObjectManager Exスキル1で使用するテキストオブジェクトのマネージャークラス
---@field package objects ExSkill1TextObject[] インスタンスで制御するオブジェクト
---@field public getObject fun(self: ExSkill1TextObjectManager, pos: Vector2, text: string): ExSkill1TextObject テキストオブジェクトのインスタンスを生成して返す
---@field public spawn fun(self: ExSkill1TextObjectManager, pos: Vector2, text: string) テキストオブジェクトを生成する
---@field public setBlack fun(self: ExSkill1TextObjectManager, isBlack: boolean) スポーン中のテキストオブジェクトを全て黒くする

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

    ---テキストオブジェクトのインスタンスを生成して返す。
    ---@param self ExSkill1TextObjectManager
    ---@param pos Vector2 テキストオブジェクトオブジェクトを設置する座標
    ---@param text string オブジェクトに設定するテキスト
    ---@return ExSkill1TextObject instance 生成したインスタンス
    getObject = function (self, pos, text)
        return ExSkill1TextObject.new(self.parent, pos, text)
    end;

    ---テキストオブジェクトを生成する。
    ---@param self ExSkill1TextObjectManager
    ---@param pos Vector2 テキストオブジェクトオブジェクトを設置する座標
    ---@param text string オブジェクトに設定するテキスト
    spawn = function (self, pos, text)
        SpawnObjectManager.spawn(self, pos, text)
    end;

    ---スポーン中のテキストオブジェクトを全て黒くする。
    ---@param self ExSkill1TextObjectManager
    ---@param isBlack boolean テキストオブジェクトを黒くするかどうか
    setBlack = function (self, isBlack)
        for _, object in ipairs(self.objects) do
            object.object:setText("§"..(isBlack and "0" or "d")..object.text)
        end
    end;
}