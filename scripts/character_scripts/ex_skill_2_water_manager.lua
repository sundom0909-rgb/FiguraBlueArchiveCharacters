---@class (exact) ExSkill2WaterManager : SpawnObjectManager Exスキル2で使用する水スプライトを管理するクラス
---@field public objects ExSkill2Water[] インスタンスで制御するオブジェクト
---@field package getObject fun(self: ExSkill2WaterManager, pos: Vector3, velocity: Vector3): ExSkill2Water 水スプライトのインスタンスを生成して返す
---@field public spawn fun(self: ExSkill2WaterManager, pos: Vector3, velocity: Vector3) 水スプライトスポーンさせる

ExSkill2WaterManager = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return ExSkill2WaterManager
    new = function (parent)
        ---@type ExSkill2WaterManager
        local instance = Avatar.instantiate(ExSkill2WaterManager, SpawnObjectManager, parent)

        instance.managerName = "ex_skill_2_water"

        return instance
    end;

    ---初期化関数
    ---@param self ExSkill2WaterManager
    init = function (self)
        SpawnObjectManager.init(self)

        ---@diagnostic disable-next-line: discard-returns
        models:newPart("script_ex_skill_2_water", "World")
        models.models.ex_skill_2.Water:setPrimaryTexture("RESOURCE", "minecraft:textures/block/water_still.png")
    end;

    ---水スプライトのインスタンスを生成して返す。
    ---@param self ExSkill2WaterManager
    ---@param pos Vector3 水スプライトをスポーンさせるワールド座標
    ---@param velocity Vector3 水スプライトを移動させる速度
    ---@return ExSkill2Water instance 生成したインスタンス
    getObject = function (self, pos, velocity)
        return ExSkill2Water.new(self.parent, pos, velocity)
    end;

    ---水スプライトをスポーンさせる。
    ---@param self ExSkill2WaterManager
    ---@param pos Vector3 水スプライトをスポーンさせるワールド座標
    ---@param velocity Vector3 水スプライトを移動させる速度
    spawn = function (self, pos, velocity)
        SpawnObjectManager.spawn(self, pos, velocity)
    end;
}