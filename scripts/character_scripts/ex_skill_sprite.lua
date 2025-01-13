---@class (exact) ExSkillSprite : SpawnObject Exスキル内で使用するスプライトのオブジェクトのクラス
---@field package object ModelPart インスタンスで制御するオブジェクト
---@field package subObject ModelPart インスタンスで制御するサブオブジェクト
---@field package sprite SpriteTask インスタンスで制御するメインのスプライト
---@field package target ModelPart インスタンスオブジェクトをアタッチする親モデル
---@field package index integer テクスチャの種類を決めるインデックス番号
---@field package currentPos Vector3 オブジェクトの現在位置
---@field package nextPos Vector3 次ティックのオブジェクトの位置
---@field package currentRot integer オブジェクトの現在角度
---@field package nextRot integer 次ティックのオブジェクトの角度
---@field package velocity Vector3 オブジェクトの速度
---@field package rotVelocity integer オブジェクトの角速度
---@field package size Vector2 スプライトの大きさ
---@field package lifetimeCount integer オブジェクトの残り時間を計るカウンター
---@field public new fun(parent: Avatar, target: ModelPart, index: integer, pos: Vector3, velocity: Vector3, rotVelocity: Vector3, size: Vector2, lifetime: integer, shouldSeeCamera: boolean): ExSkillSprite コンストラクター

ExSkillSprite = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@param target ModelPart インスタンスオブジェクトをアタッチする親モデル
    ---@param index integer テクスチャの種類を決めるインデックス番号
    ---@param pos Vector3 オブジェクトをスポーンさせる位置
    ---@param velocity Vector3 オブジェクトの移動速度
    ---@param rotVelocity number オブジェクトの角速度
    ---@param size Vector2 スプライトの大きさ
    ---@param lifetime integer このインスタンスを破棄するまでの時間
    ---@param shouldSeeCamera boolean カメラを見続けるべきかどうか
    ---@return ExSkillSprite
    new = function (parent, target, index, pos, velocity, rotVelocity, size, lifetime, shouldSeeCamera)
        ---@type ExSkillSprite
        local instance = Avatar.instantiate(ExSkillSprite, SpawnObject, parent)

        instance.target = target
        instance.object = instance.target:newPart(instance.uuid)
        instance.subObject = instance.object:newPart(client.intUUIDToString(client.generateUUID()), shouldSeeCamera and "Camera" or "None")
        instance.sprite = instance.subObject:newSprite(client.intUUIDToString(client.generateUUID()))
        instance.index = index
        instance.currentPos = pos:copy()
        instance.nextPos = instance.currentPos:copy()
        instance.currentRot = 0
        instance.nextRot = 0
        instance.velocity = velocity:copy()
        instance.rotVelocity = rotVelocity
        instance.size = size:copy()
        instance.lifetimeCount = lifetime

        instance.callbacks = {
            ---@param self ExSkillSprite
            onInit = function (self)
                self.sprite:setTexture(textures["textures.ex_skill_1"])
                self.sprite:setDimensions(255, 255)
                self.sprite:setRegion(11, 11)
                self.sprite:setUVPixels(0, 11 * (self.index - 1) + 10)
                self.sprite:setSize(self.size)
                self.object:setPos(self.currentPos:copy())
                self.sprite:setPos(self.size:copy():scale(0.5):augmented(0))
            end;

            ---@param self ExSkillSprite
            onDeinit = function (self)
                self.subObject:removeTask(self.sprite:getName())
                self.object:removeChild(self.subObject)
                self.subObject:remove()
                self.target:removeChild(self.object)
                self.object:remove()
            end;

            ---@param self ExSkillSprite
            onTick = function (self)
                --パーティクル位置を強制更新
                if self.velocity:length() > 0 then
                    self.currentPos = self.nextPos:copy()
                    self.object:setPos(self.currentPos:copy())
                end
                if self.rotVelocity > 0 then
                    self.currentRot = self.nextRot
                    self.sprite:setPos(self.size.x / 2 * (math.cos(math.rad(self.currentRot + 45)) * math.sqrt(2)), self.size.y / 2 * (math.sin(math.rad(self.currentRot + 45)) * math.sqrt(2)), 0) --1, 1  -1, 1  -1, -1  1, -1
                    self.sprite:setRot(0, 0, self.currentRot)
                end

                --カウンターを更新
                if self.lifetimeCount == 0 then
                    self.shouldDeinit = true
                end
                self.lifetimeCount = self.lifetimeCount - 1

                --次ティックの位置を計算
                if self.velocity:length() > 0 then
                    self.nextPos = self.currentPos:copy():add(self.velocity:copy():scale(0.05))
                end
                if self.rotVelocity > 0 then
                    self.nextRot = self.currentRot + self.rotVelocity * 0.05
                end
            end;

            ---@param self ExSkillSprite
            onRender = function (self, delta)
                if self.velocity:length() > 0 then
                    self.object:setPos(self.nextPos:copy():sub(self.currentPos):scale(delta):add(self.currentPos))
                end
                if self.rotVelocity > 0 then
                    local actualRot = (self.nextRot - self.currentRot) * delta + self.currentRot
                    self.sprite:setPos(self.size.x / 2 * (math.cos(math.rad(actualRot + 45)) * math.sqrt(2)), self.size.y / 2 * (math.sin(math.rad(actualRot + 45)) * math.sqrt(2)), 0) --1, 1  -1, 1  -1, -1  1, -1
                    self.sprite:setRot(0, 0, actualRot)
                end
            end;
        }

        return instance
    end;
}