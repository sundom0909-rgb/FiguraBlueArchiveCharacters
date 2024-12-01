---@class (exact) ExSkill2MelodyParticle : SpawnObject Exスキル2で使用する音符の独自パーティクルのクラス
---@field package object ModelPart インスタンスで制御するモデルパーツ
---@field package currentPos Vector3 現ティックのパーティクルの位置
---@field package nextPos Vector3 次ティックのパーティクルの位置
---@field package rot Vector3 パーティクルの向き
---@field package size Vector2 パーティクルの大きさ
---@field package velocity Vector3 パーティクルの移動速度
---@field package lifeTime integer このパーティクルが破棄されるまでの時間
---@field package shouldSeeCamera boolean パーティクルがカメラワークの方向を見るべきかどうか
---@field public new fun(parent: Avatar, pos: Vector3, rot: Vector3, size: Vector2, velocity: Vector3, lifeTime: integer, shouldSeeCamera: boolean): ExSkill2MelodyParticle コンストラクタ

ExSkill2MelodyParticle = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@param pos Vector3 パーティクルの初期位置
    ---@param rot Vector3 パーティクルの向き
    ---@param size Vector2 パーティクルの大きさ
    ---@param velocity Vector3 パーティクルの移動方向と速度
    ---@param lifeTime integer パーティクルの表示時間
    ---@param shouldSeeCamera boolean パーティクルがカメラワークの方向を見るべきかどうか
    ---@return ExSkill2MelodyParticle
    new = function (parent, pos, rot, size, velocity, lifeTime, shouldSeeCamera)
        ---@type ExSkill2MelodyParticle
        local instance = Avatar.instantiate(ExSkill2MelodyParticle, SpawnObject, parent)

        instance.object = models.models.ex_skill_2.Notes["Note"..math.random(1, 3)]:copy(instance.uuid)
        instance.currentPos = pos:copy()
        instance.nextPos = instance.currentPos:copy()
        instance.rot = rot:copy()
        instance.size = size:copy()
        instance.velocity = velocity:copy()
        instance.shouldSeeCamera = shouldSeeCamera
        instance.lifeTime = lifeTime

        instance.callbacks = {
            ---@param self ExSkill2MelodyParticle
            onInit = function (self)
                self.object:setVisible(true)
                self.object:setScale(self.size:copy():augmented(1))
                if not self.shouldSeeCamera then
                    self.object:setRot(self.rot)
                end
                models.script_ex_skill_2_melody_particle:addChild(instance.object)
            end;

            ---@param self ExSkill2MelodyParticle
            onDeinit = function (self)
                models.script_ex_skill_2_melody_particle:removeChild(self.object)
                self.object:remove()
            end;

            ---@param self ExSkill2MelodyParticle
            onTick = function (self)
                if self.lifeTime == 0 then
                    self.shouldDeinit = true
                end

                --パーティクルの位置を強制更新
                self.currentPos = self.nextPos:copy()
                self.object:setPos(self.currentPos:copy():scale(16))

                --次の位置を計算
                self.nextPos = self.currentPos:copy():add(self.velocity)

                --カウンター更新
                self.lifeTime = self.lifeTime - 1
            end;

            ---@param self ExSkill2MelodyParticle
            onRender = function (self, delta, context)
                if self.shouldSeeCamera then
                    self.object:setRot(client:getCameraRot():mul(1, -1, 1))
                end
                if self.velocity:length() > 0 then
                    self.object:setPos(self.currentPos:copy():add(self.nextPos:copy():sub(self.currentPos):scale(delta)):scale(16))
                end
            end;
        }

        return instance
    end;

}