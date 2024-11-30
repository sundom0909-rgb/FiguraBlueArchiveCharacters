---@class ExSkill2TextObject : SpawnObject Exスキル2で使用するテキストオブジェクト
---@field package object TextTask インスタンスで制御するテキストレンダータスク
---@field package subObject TextTask インスタンスで制御するサブテキストレンダータスク
---@field package animationCount integer アニメーションのカウンター
---@field public new fun(parent: Avatar, parentModel: ModelPart): ExSkill2TextObject コンストラクター

ExSkill2TextObject = {
    ---コンストラクター
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@param parentModel ModelPart このオブジェクトをアタッチする親パーツ
    ---@return ExSkill2TextObject
    new = function (parent, parentModel)
        ---@type ExSkill2TextObject
        local instance = Avatar.instantiate(ExSkill2TextObject, SpawnObject, parent)

        instance.object = parentModel:newText(instance.uuid)
        instance.subObject = parentModel:newText(client.intUUIDToString(client:generateUUID()))
        instance.animationCount = 0

        instance.callbacks = {
            ---@param self ExSkill2TextObject
            onInit = function (self)
                self.object:setText("§0§lMISS")
                self.object:setAlignment("CENTER")
                self.subObject:setText("§4§lMISS")
                self.subObject:setAlignment("CENTER")
            end;

            ---@param self ExSkill2TextObject
            onDeinit = function (self)
                for _, id in ipairs({self.uuid, self.subObject:getName()}) do
                    parentModel:removeTask(id)
                end
            end;

            ---@param self ExSkill2TextObject
            onTick = function (self)
                self.object:setPos(0, self.animationCount * 0.5 + 3.5, 0)
                self.animationCount = self.animationCount + 1
                if self.animationCount == 1 then
                    self.object:setText("§e§lMISS")
                    self.subObject:setVisible(false)
                elseif self.animationCount == 6 or self.animationCount == 10 then
                    self.object:setOpacity(0.5)
                elseif self.animationCount == 8 or self.animationCount == 12 then
                    self.object:setOpacity(1)
                elseif self.animationCount == 14 then
                    self.shouldDeinit = true
                end
            end;

            ---@param self ExSkill2TextObject
            onRender = function (self, delta, context)
                self.object:setPos(0, (self.animationCount + delta) * 0.5 + 3.5, 0)
                if self.animationCount == 0 then
                    self.subObject:setPos(0, 3.5 + delta * 3.5, 0)
                    self.subObject:setScale(vectors.vec3(1, 1, 1):scale(1 + delta))
                    self.subObject:setOpacity(1 - delta)
                end
            end;
        }

        return instance
    end;
}