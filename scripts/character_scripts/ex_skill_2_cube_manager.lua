---@class ExSkill2CubeManager : SpawnObjectManager Exスキル2で使用するキューブを管理するクラス
---@field public objects ExSkill2Cube[] インスタンスで制御するオブジェクト
---@field package getObject fun(self: ExSkill2CubeManager): ExSkill2Cube キューブのインスタンスを生成して返す
---@field public spawn fun(self: ExSkill2CubeManager) キューブをスポーンさせる

ExSkill2CubeManager = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return ExSkill2CubeManager
    new = function (parent)
        ---@type ExSkill2CubeManager
        local instance = Avatar.instantiate(ExSkill2CubeManager, SpawnObjectManager, parent)

        instance.managerName = "ex_skill_2_cube"

        return instance
    end;

    ---初期化関数
    ---@param self ExSkill2CubeManager
    init = function (self)
        SpawnObjectManager.init(self)

        models.models.ex_skill_2.Cube:setLight(15)
        ---@diagnostic disable-next-line: discard-returns
        models:newPart("script_ex_skill_2_cube")
    end;

    ---キューブのインスタンスを生成して返す。
    ---@param self ExSkill2CubeManager
    ---@return ExSkill2Cube instance 生成したインスタンス
    getObject = function (self)
        return ExSkill2Cube.new(self.parent)
    end;

    ---キューブをスポーンさせる。
    ---@param self ExSkill2CubeManager
    spawn = function (self)
        SpawnObjectManager.spawn(self)
    end;
}