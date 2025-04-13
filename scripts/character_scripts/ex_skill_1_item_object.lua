---@class ExSkill1ItemObject : SpawnObject Exスキル1で使用するアイテムオブジェクト
---@field package object ModelPart インスタンスで制御するモデルパーツ
---@field package subObject ModelPart インスタンスで制御するサブモデルパーツ
---@field package spriteTask SpriteTask subObject内にアタッチするスプライトレンダータスク
---@field package spriteIndex integer このアイテムオブジェクトで表示するアイテムテクスチャのインデックス番号
---@field package currentPos Vector3 現ティックの位置
---@field package nextPos Vector3 次ティックの位置
---@field package velocity Vector3 このオブジェクトの移動速度
---@field package lifeTimeCount integer スプライトの残り時間
---@field public new fun(parent: Avatar): ExSkill1ItemObject コンストラクター

ExSkill1ItemObject = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@param launchRot number スプライトの射出角度
    ---@return ExSkill1ItemObject
    new = function (parent, launchRot)
        ---@type ExSkill1ItemObject
        local instance = Avatar.instantiate(ExSkill1ItemObject, SpawnObject, parent)

        instance.object = models.script_ex_skill_1_item_object:newPart(instance.uuid)
        instance.subObject = instance.object:newPart(client.intUUIDToString(client:generateUUID()), "Camera")
        instance.spriteTask = instance.subObject:newSprite(client.intUUIDToString(client:generateUUID()))
        instance.spriteIndex = math.random(1, 4)
        instance.currentPos = player:getPos():add(vectors.rotateAroundAxis(player:getBodyYaw() * -1 + 180, 0, 2, 1, 0, 1, 0))
        instance.nextPos = instance.currentPos
        instance.velocity = vectors.rotateAroundAxis(player:getBodyYaw() * -1, vectors.rotateAroundAxis(launchRot, math.random() * 0.5 + 0.25, 0, 0, 0, 0, 1), 0, 1, 0)
        instance.lifeTimeCount = 25

        instance.callbacks = {
            ---@param self ExSkill1ItemObject
            onInit = function (self)
                self.spriteTask:setTexture(textures["textures.ex_skill_1"])
                self.spriteTask:setDimensions(textures["textures.ex_skill_1"]:getDimensions())
                self.spriteTask:setRegion(self.spriteIndex == 1 and vectors.vec2(12, 21) or (self.spriteIndex == 2 and vectors.vec2(14, 14) or (self.spriteIndex == 3 and vectors.vec2(10, 12) or vectors.vec2(12, 12))))
                self.spriteTask:setUVPixels(self.spriteIndex == 1 and 0 or (self.spriteIndex == 2 and 12 or (self.spriteIndex == 3 and 26 or 36)), 17)
                self.spriteTask:setSize(self.spriteIndex == 1 and 5.7143 or (self.spriteIndex == 3 and 8.3333 or 10), 10)
            end;

            ---@param self ExSkill1ItemObject
            onDeinit = function (self)
                self.subObject:removeTask(self.spriteTask:getName())
                self.object:removeChild(self.subObject)
                self.subObject:remove()
                models.script_ex_skill_1_item_object:removeChild(self.object)
                self.object:remove()
            end;

            ---@param self ExSkill1ItemObject
            onTick = function (self)
                --オブジェクトの状態を強制更新
                self.currentPos = self.nextPos
                self.object:setPos(self.currentPos:copy():scale(16))

                --次の位置を計算
                self.nextPos = self.currentPos:copy():add(self.velocity)
                self.velocity:scale(0.7)

                --残り時間の計算
                if self.lifeTimeCount == 0 then
                    self.shouldDeinit = true
                end
                self.lifeTimeCount = self.lifeTimeCount - 1
            end;

            ---@param self ExSkill1ItemObject
            onRender = function (self, delta)
                self.object:setPos(self.currentPos:copy():scale(16):add(self.nextPos:copy():sub(self.currentPos):scale(16 * delta)))
            end;
        }

        return instance
    end
}