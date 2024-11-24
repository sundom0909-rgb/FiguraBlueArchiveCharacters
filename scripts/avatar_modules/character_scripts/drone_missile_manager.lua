---@class DroneMissileManager : SpawnObjectManager 視覚的なミサイルオブジェクトを管理するクラス
---@field public new fun(parent: Avatar): DroneMissileManager コンストラクタ
---@field public init fun(self: DroneMissileManager) 初期化関数
---@field public getObject fun(self: DroneMissileManager, startPos: Vector3, rot: Vector3): DroneMissile ミサイルのインスタンスを生成して返す
---@field public spawn fun(self: DroneMissileManager, startPos: Vector3, rot: Vector3) ミサイルをスポーンさせる

DroneMissileManager = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return DroneMissileManager
    new = function (parent)
        ---@type DroneMissileManager
        local instance = Avatar.instantiate(DroneMissileManager, SpawnObjectManager, parent)

        instance.managerName = "drone_missile"

        return instance
    end;

    ---初期化関数
    ---@param self DroneMissileManager
    init = function (self)
        SpawnObjectManager.init(self)

        ---@diagnostic disable-next-line: discard-returns
        models:newPart("script_drone_missile", "World")
    end;

    ---ミサイルのインスタンスを生成して返す。
    ---@param self DroneMissileManager
    ---@param startPos Vector3 ミサイルの出現位置
    ---@param rot Vector3 ミサイルが飛んでいく方向
    ---@return  DroneMissile instance 生成したインスタンス
    getObject = function (self, startPos, rot)
        return DroneMissile.new(self.parent, startPos, rot)
    end;

    ---ミサイルをスポーンさせる。
    ---@param self DroneMissileManager
    ---@param startPos Vector3 ミサイルの出現位置
    ---@param rot Vector3 ミサイルが飛んでいく方向
    spawn = function (self, startPos, rot)
        SpawnObjectManager.spawn(self, startPos, rot)
    end;
}