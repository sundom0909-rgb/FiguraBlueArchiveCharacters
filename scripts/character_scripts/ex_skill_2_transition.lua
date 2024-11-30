---@class ExSkill2TransitionSprite : SpawnObject Exスキル2のトランジションで使用するスプライトのクラス
---@field package object SpriteTask インスタンスで制御するスプライト
---@field package pos Vector2 スプライトの位置（左からx番目、上からy番目のスプライト）
---@field package animationCount integer スプライトアニメーションのカウンター

ExSkill2TransitionSprite = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@param pos Vector2 スプライトの位置（左からx番目、上からy番目のスプライト）
    ---@return ExSkill2TransitionSprite
    new = function (parent, pos)
        ---@type ExSkill2TransitionSprite
        local instance = Avatar.instantiate(ExSkill2TransitionSprite, SpawnObject, parent)

        instance.object = models.models.ex_skill_2.Gui.TransitionAnchor:newSprite(instance.uuid)
        instance.pos = pos
        instance.animationCount = 0

        instance.callbacks = {
            ---@param self ExSkill2TransitionSprite
            onInit = function (self)
                self.object:setTexture(textures["textures.ex_skill_2"])
                self.object:setDimensions(textures["textures.ex_skill_2"]:getDimensions())
                self.object:setRegion(1, 1)
                self.object:setUVPixels(47, 115)
            end;

            ---@param self ExSkill2TransitionSprite
            onDeinit = function (self)
                models.models.ex_skill_2.Gui.TransitionAnchor:removeTask(self.uuid)
            end;

            ---@param self ExSkill2TransitionSprite
            onTick = function (self)
                if self.animationCount == 4 then
                    self.object:setColor(0.8, 0.7, 0.7)
                elseif self.animationCount == 14 then
                    self.shouldDeinit = true
                end
                self.animationCount = self.animationCount + 1
            end;

            ---@param self ExSkill2TransitionSprite
            onRender = function (self, delta)
                local actualTick = self.animationCount + delta
                local scale = actualTick <= 2 and actualTick * 25 or (actualTick <= 10 and 50 or (actualTick <= 12 and actualTick * -25 + 300 or 0))
                local rot = actualTick <= 2 and actualTick * 45 or (actualTick <= 10 and 90 or (actualTick <= 12 and actualTick * 45 - 360 or 180))
                self.object:setPos(self.pos.x * -50 - 25 + math.cos(math.rad(rot * -1 + 45)) * scale * math.sqrt(2) / 2, self.pos.y * -50 - 25 + math.sin(math.rad(rot * -1 + 45)) * scale * math.sqrt(2) / 2, 0)
                self.object:setRot(0, 0, rot * -1)
                self.object:setSize(vectors.vec2(1, 1):scale(scale))
            end;
        }

        return instance
    end;
}