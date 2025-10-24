---@class TankShellManager : SpawnObjectManager 視覚的な砲弾オブジェクトを管理するクラス
---@field public new fun(parent: Avatar): TankShellManager コンストラクタ
---@field public init fun(self: TankShellManager) 初期化関数
---@field public getObject fun(self: TankShellManager, startPos: Vector3, rot: Vector3): TankShell 砲弾のインスタンスを生成して返す
---@field public spawn fun(self: TankShellManager, startPos: Vector3, rot: Vector3) 砲弾をスポーンさせる

TankShellManager = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return TankShellManager
    new = function (parent)
        ---@type TankShellManager
        local instance = Avatar.instantiate(TankShellManager, SpawnObjectManager, parent)

        instance.managerName = "tank_shell"

        return instance
    end;

    ---初期化関数
    ---@param self TankShellManager
    init = function (self)
        SpawnObjectManager.init(self)

        ---@diagnostic disable-next-line: discard-returns
        models:newPart("script_tank_shell", "World")
    end;

    ---砲弾のインスタンスを生成して返す。
    ---@param self TankShellManager
    ---@param startPos Vector3 砲弾の出現位置
    ---@param rot Vector3 砲弾が飛んでいく方向
    ---@return  TankShell instance 生成したインスタンス
    getObject = function (self, startPos, rot)
        return TankShell.new(self.parent, startPos, rot)
    end;

    ---砲弾をスポーンさせる。
    ---@param self TankShellManager
    ---@param startPos Vector3 砲弾の出現位置
    ---@param rot Vector3 砲弾が飛んでいく方向
    spawn = function (self, startPos, rot)
        SpawnObjectManager.spawn(self, startPos, rot)
    end;
}