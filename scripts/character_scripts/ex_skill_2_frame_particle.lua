---@class (exact) ExSkill2FrameParticle : SpawnObject Exスキルのフレームで使用するパーティクルの単一を管理するクラス
---@field package object SpriteTask インスタンスで制御するオブジェクト
---@field package currentPos Vector2 パーティクルの現在位置
---@field package nextPos Vector2 次ティックのパーティクルの位置
---@field package velocity Vector2 パーティクルの速度
---@field public new fun(parent: Avatar, pos: Vector2, velocity: Vector2): ExSkill2FrameParticle コンストラクター

ExSkill2FrameParticle = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@param pos Vector2 パーティクルをスポーンさせるスクリーン上の座標。GUIスケールも考慮される。
    ---@param velocity Vector2 パーティクルの秒間移動距離（ピクセル）
    ---@return ExSkill2FrameParticle
    new = function (parent, pos, velocity)
        ---@type ExSkill2FrameParticle
        local instance = Avatar.instantiate(ExSkill2FrameParticle, SpawnObject, parent)

        instance.object = models.models.ex_skill_2.Gui.script_ex_skill_2_frame_particles:newSprite(instance.uuid)
        instance.currentPos = pos
        instance.nextPos = instance.currentPos
        instance.velocity = velocity

        instance.callbacks = {
            ---@param self ExSkill2FrameParticle
            onInit = function (self)
                self.object:setTexture(textures["textures.ex_skill_2"])
                self.object:setDimensions(textures["textures.ex_skill_2"]:getDimensions())
                self.object:setRegion(1, 1)
                self.object:setSize(5, 5)
                self.object:setUVPixels(33, 15)
            end;

            ---@param self ExSkill2FrameParticle
            onDeinit = function (self)
                models.models.ex_skill_2.Gui.script_ex_skill_2_frame_particles:removeTask(self.uuid)
            end;

            ---@param self ExSkill2FrameParticle
            onTick = function (self)
                --パーティクル位置を強制更新
                self.currentPos = self.nextPos:copy()
                self.object:setPos(self.currentPos:copy():augmented(0))

                --次ティックの位置を計算
                if self.velocity:length() > 0 then
                    self.nextPos = self.currentPos:copy():add(self.velocity:copy():scale(1))
                    self.velocity:scale(0.85)
                end
            end;

            ---@param self ExSkill2FrameParticle
            onRender = function (self, delta)
                self.object:setPos(self.nextPos:copy():sub(self.currentPos):scale(delta):add(self.currentPos):augmented(0))
            end;
        }

        return instance
    end;
}