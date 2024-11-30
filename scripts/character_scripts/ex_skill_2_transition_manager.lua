---@class ExSkill2TransitionManager : SpawnObjectManager Exスキル2で使用するトランジション効果のマネージャークラス
---@field public getObject fun(self: ExSkill2TransitionManager, pos: Vector2): ExSkill1TextObject トランジションスプライトのインスタンスを生成して返す
---@field public spawn fun(self:  ExSkill2TransitionManager, pos: Vector2) トランジションスプライトを生成する
---@field public play fun(self: ExSkill2TransitionManager) トランジションを再生する
---@field public stop fun(self: ExSkill2TransitionManager) トランジションを停止する

ExSkill2TransitionManager = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return ExSkill2TransitionManager
    new = function (parent)
        ---@type ExSkill2TransitionManager
        local instance = Avatar.instantiate(ExSkill2TransitionManager, SpawnObjectManager, parent)

        instance.managerName = "ex_skill_2_transition"

        return instance
    end;

    ---トランジションスプライトのインスタンスを生成して返す。
    ---@param self ExSkill2TransitionManager
    ---@param pos Vector2 スプライトの位置（左からx番目、上からy番目のスプライト）
    ---@return ExSkill2TransitionSprite instance 生成したインスタンス
    getObject = function (self, pos)
        return ExSkill2TransitionSprite.new(self.parent, pos)
    end;

    ---トランジションスプライトを生成する。
    ---@param self ExSkill2TransitionManager
    ---@param pos Vector2 スプライトの位置（左からx番目、上からy番目のスプライト）
    spawn = function (self, pos)
        SpawnObjectManager.spawn(self, pos)
    end;

    ---トランジションを再生する。
    ---@param self ExSkill2TransitionManager
    play = function (self)
        self:stop()

        local spriteDimension = client:getScaledWindowSize():scale(1 / 50):ceil()
        local linesPerTick = (spriteDimension.x + spriteDimension.y - 1) / 10
        local targetLine = 0
        local currentLine = 0

        events.TICK:register(function ()
            while currentLine <= targetLine do
                for i = 0, math.max(math.min(currentLine, spriteDimension.x - currentLine - 1), spriteDimension.y - 1) do
                    if currentLine - i >= 0 and currentLine - i <= spriteDimension.x - 1 then
                        self:spawn(vectors.vec2(currentLine - i, i))
                    end
                end
                currentLine = currentLine + 1
                if currentLine == spriteDimension.x + spriteDimension.y - 1 then
                    events.TICK:remove(self.managerName.."_play_tick")
                    break
                end
            end
            targetLine = targetLine + linesPerTick
        end, self.managerName.."_play_tick")
    end;

    ---トランジションを停止する。
    ---@param self ExSkill2TransitionManager
    stop = function (self)
        events.TICK:remove(self.managerName.."_play_tick")
        self:removeAll()
    end;
}