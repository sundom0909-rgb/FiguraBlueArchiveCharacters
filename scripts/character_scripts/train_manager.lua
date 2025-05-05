---@class (exact) TrainManager : SpawnObjectManager Exスキル1で使用する列車を管理するクラス
---@field public objects RailObject[] インスタンスで制御するオブジェクト
---@field package railForwardLength integer 列車の前方に設置するレールの長さ
---@field package railBackwardLength integer 列車の通過後に残しておくレールの長さ
---@field package maxRailPerTick number 1ティックに設置する最大のレールの数
---@field package currentPos Vector3 線路の設置処理を行う現在の座標
---@field package railRot number 線路の向き
---@field package trainPos Vector3 列車の現在位置（線路の設置判定の基準にする）
---@field package railPlaceCount integer 現在のティックで設置したレールの数
---@field public getObject fun(self: TrainManager, pos: Vector3, rot: number): RailObject 線路オブジェクトを生成して返す。
---@field public spawnRail fun(self: TrainManager, pos: Vector3, rot: number) 線路オブジェクトをスポーンさせる。
---@field public spawnExSkillRail fun(self: TrainManager) Exスキル用の線路をスポーンさせる。
---@field public stopExSkillRail fun(self: TrainManager) Exスキル用の線路スポーン処理を停止させる。

TrainManager = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return TrainManager
    new = function (parent)
        ---@type TrainManager
        local instance = Avatar.instantiate(TrainManager, SpawnObjectManager, parent)

        instance.railForwardLength = 32
        instance.railBackwardLength = math.huge
        instance.maxRailPerTick = math.huge

        instance.managerName = "ex_skill_1_rail"
        instance.currentPos = vectors.vec3()
        instance.railRot = 0
        instance.trainPos = vectors.vec3()
        instance.railPlaceCount = 0

        return instance
    end;

    ---初期化関数
    ---@param self TrainManager
    init = function (self)
        SpawnObjectManager.init(self)

        ---@diagnostic disable-next-line: discard-returns
        models:newPart("script_ex_skill_1_rail", "World")
    end;

    ---線路オブジェクトを生成して返す。
    ---@param self TrainManager
    ---@param pos Vector3 線路オブジェクトを設置するワールド座標
    ---@param rot number 線路オブジェクトを設置するワールド方向
    ---@return RailObject instance 生成したインスタンス
    getObject = function (self, pos, rot)
        return RailObject.new(self.parent, pos, rot)
    end;

    ---線路オブジェクトをスポーンさせる。
    ---@param self TrainManager
    ---@param pos Vector3 線路オブジェクトを設置するワールド座標
    ---@param rot number 線路オブジェクトを設置するワールド方向
    spawnRail = function (self, pos, rot)
        ---@diagnostic disable-next-line: redundant-parameter
        local instance = self:getObject(pos, rot)
        table.insert(self.objects, instance)
        if instance.callbacks ~= nil and instance.callbacks.onInit ~= nil then
            instance.callbacks.onInit(instance)
        end

        if #self.objects == 1 then
            events.TICK:remove(self.managerName.."_tick")
            events.RENDER:remove(self.managerName.."_render")
            events.TICK:register(function ()
                if not client:isPaused() then
                    for index, ins in ipairs(self.objects) do
                        if ins.callbacks ~= nil and ins.callbacks.onTick ~= nil and self.trainPos ~= nil then
                            ins.callbacks.onTick(ins, self.trainPos, self.railBackwardLength)
                        end
                        if ins.shouldDeinit then
                            if ins.callbacks ~= nil and ins.callbacks.onDeinit ~= nil then
                                ins.callbacks.onDeinit(ins)
                            end
                            table.remove(self.objects, index)
                            if #self.objects == 0 then
                                events.TICK:remove(self.managerName.."_tick")
                            end
                        end
                    end
                end
            end, self.managerName.."_tick")
        end
    end;

    ---Exスキル用の線路をスポーンさせる。
    ---@param self TrainManager
    spawnExSkillRail = function (self)
        self.currentPos = player:getPos():scale(16)
        self.rot = (player:getBodyYaw() * -1) % 360
        self.trainPos = self.currentPos:copy()
        events.TICK:register(function ()
            while self.currentPos:copy():sub(self.trainPos:copy():add(vectors.rotateAroundAxis(self.rot, 0, 0, 32 * self.railForwardLength, 0, 1, 0))):length() >= 32 and self.railPlaceCount < self.maxRailPerTick do
                self:spawnRail(self.currentPos, self.rot)
                self.currentPos:add(vectors.rotateAroundAxis(self.rot, 0, 0, 32, 0, 1, 0))
                self.railPlaceCount = self.railPlaceCount + 1
            end
            self.trainPos = player:getPos():add(vectors.rotateAroundAxis(self.rot, models.models.main.Avatar:getAnimPos():mul(-0.0625, 0, -0.0625), 0, 1, 0)):scale(16 * 0.9375)
            self.railPlaceCount = 0
        end, "train_manager_ex_skill_tick")
    end;

    ---Exスキル用の線路スポーン処理を停止させる。
    ---@param self TrainManager
    stopExSkillRail = function (self)
        events.TICK:remove("train_manager_ex_skill_tick")
        self:removeAll()
    end;
}