---@class (exact) ExSkill2CoinManager : SpawnObjectManager Exスキル2で使用するコインを管理するクラス
---@field public objects ExSkill2Coin[] インスタンスで制御するオブジェクト
---@field package getObject fun(self: ExSkill2CoinManager, pos: Vector3): ExSkill2Coin コインのインスタンスを生成して返す
---@field public spawn fun(self: ExSkill2CoinManager, pos: Vector3) コインをスポーンさせる
---@field public getAll fun(self: ExSkill2CoinManager) 現在スポーン中の全てのコインオブジェクトに対して取得アニメーションを再生する

ExSkill2CoinManager = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return ExSkill2CoinManager
    new = function (parent)
        ---@type ExSkill2CoinManager
        local instance = Avatar.instantiate(ExSkill2CoinManager, SpawnObjectManager, parent)

        instance.managerName = "ex_skill_2_coin"

        return instance
    end;

    ---初期化関数
    ---@param self ExSkill2CoinManager
    init = function (self)
        SpawnObjectManager.init(self)

        ---@diagnostic disable-next-line: discard-returns
        models:newPart("script_ex_skill_2_coin")
    end;

    ---コインのインスタンスを生成して返す。
    ---@param self ExSkill2CoinManager
    ---@param pos Vector3 コインをスポーンさせるアバター座標
    ---@return ExSkill2Coin instance 生成したインスタンス
    getObject = function (self, pos)
        return ExSkill2Coin.new(self.parent, pos)
    end;

    ---コインをスポーンさせる。
    ---@param self ExSkill2CoinManager
    ---@param pos Vector3 コインをスポーンさせるアバター座標
    spawn = function (self, pos)
        SpawnObjectManager.spawn(self, pos)

        events.TICK:remove(self.managerName.."_tick")
        events.TICK:register(function ()
            if not client:isPaused() then
                local animPos = models.models.main.Avatar:getAnimPos()
                for index, ins in ipairs(self.objects) do
                    if ins.callbacks ~= nil and ins.callbacks.onTick ~= nil then
                        ins.callbacks.onTick(ins, animPos)
                    end
                    if ins.shouldDeinit then
                        if ins.callbacks ~= nil and ins.callbacks.onDeinit ~= nil then
                            ins.callbacks.onDeinit(ins)
                        end
                        table.remove(self.objects, index)
                        if #self.objects == 0 then
                            events.TICK:remove(self.managerName.."_tick")
                            events.RENDER:remove(self.managerName.."_render")
                        end
                    end
                end
            end
        end, self.managerName.."_tick")
    end;

    ---現在スポーン中の全てのコインオブジェクトに対して取得アニメーションを再生する。
    ---@param self ExSkill2CoinManager
    getAll = function (self)
        for _, obj in ipairs(self.objects) do
            obj:playGetAnimation(true)
        end
    end;
}