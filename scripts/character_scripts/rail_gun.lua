---@class (exact) RailGun : AvatarModule アリスの武器を制御するクラス

RailGun = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return RailGun
    new = function (parent)
        ---@type RailGun
        local instance = Avatar.instantiate(RailGun, AvatarModule, parent)

        return instance
    end;

    ---初期化関数
    ---@param self PlayerUtils
    init = function (self)
        AvatarModule.init(self)

        --ディスプレイのスプライトを配置
        for i = 1, 3 do
            local displayRDigit = models.models.main.Avatar.UpperBody.Body.Gun:newSprite("displayR_digit_"..i)
            displayRDigit:setTexture(textures["textures.gun"])
            displayRDigit:setDimensions(textures["textures.gun"]:getDimensions())
            displayRDigit:setRegion(3, 5)
            displayRDigit:setUVPixels(80, 0)
            displayRDigit:setPos(1.51, -0.55, 7.55 + (i - 1) * -0.215)
            displayRDigit:setRot(0, -90, 0)
            displayRDigit:setScale(0.06, 0.06, 1)
            displayRDigit:setSize(3, 5)
            displayRDigit:setRenderType("EMISSIVE_SOLID")
            local displayRArrow = models.models.main.Avatar.UpperBody.Body.Gun:newSprite("displayR_arrow_"..i)
            displayRArrow:setTexture(textures["textures.gun"])
            displayRArrow:setDimensions(textures["textures.gun"]:getDimensions())
            displayRArrow:setRegion(3, 3)
            displayRArrow:setUVPixels(63, 0)
            displayRArrow:setPos(1.51, -0.3, 7.55 + (i - 1) * -0.125)
            displayRArrow:setRot(0, -90, 0)
            displayRArrow:setScale(0.03, 0.03, 1)
            displayRArrow:setSize(3, 3)
            displayRArrow:setRenderType("EMISSIVE_SOLID")
            local displayLDigit = models.models.main.Avatar.UpperBody.Body.Gun:newSprite("displayL_digit_"..i)
            displayLDigit:setTexture(textures["textures.gun"])
            displayLDigit:setDimensions(textures["textures.gun"]:getDimensions())
            displayLDigit:setRegion(3, 5)
            displayLDigit:setUVPixels(80, 0)
            displayLDigit:setPos(-1.51, -0.55, 6.675 + (i - 1) * -0.215)
            displayLDigit:setRot(0, 90, 0)
            displayLDigit:setScale(0.06, 0.06, 1)
            displayLDigit:setSize(3, 5)
            displayLDigit:setRenderType("EMISSIVE_SOLID")
            local displayLArrow = models.models.main.Avatar.UpperBody.Body.Gun:newSprite("displayL_arrow_"..i)
            displayLArrow:setTexture(textures["textures.gun"])
            displayLArrow:setDimensions(textures["textures.gun"]:getDimensions())
            displayLArrow:setRegion(3, 3)
            displayLArrow:setUVPixels(63, 0)
            displayLArrow:setPos(-1.51, -0.3, 6.85 + (i - 1) * -0.125)
            displayLArrow:setRot(0, 90, 0)
            displayLArrow:setScale(0.03, 0.03, 1)
            displayLArrow:setSize(3, 3)
            displayLArrow:setRenderType("EMISSIVE_SOLID")
        end
        local displayRMeter = models.models.main.Avatar.UpperBody.Body.Gun:newSprite("displayR_meter")
        displayRMeter:setTexture(textures["textures.gun"])
        displayRMeter:setDimensions(textures["textures.gun"]:getDimensions())
        displayRMeter:setRegion(11, 5)
        displayRMeter:setUVPixels(69, 0)
        displayRMeter:setPos(1.51, -0.55, 6.9)
        displayRMeter:setRot(0, -90, 0)
        displayRMeter:setScale(0.06, 0.06, 1)
        displayRMeter:setSize(11, 5)
        displayRMeter:setRenderType("EMISSIVE_SOLID")
        local displayLMeter = models.models.main.Avatar.UpperBody.Body.Gun:newSprite("displayL_meter")
        displayLMeter:setTexture(textures["textures.gun"])
        displayLMeter:setDimensions(textures["textures.gun"]:getDimensions())
        displayLMeter:setRegion(11, 5)
        displayLMeter:setUVPixels(69, 0)
        displayLMeter:setPos(-1.51, -0.55, 6.9)
        displayLMeter:setRot(0, 90, 0)
        displayLMeter:setScale(0.06, 0.06, 1)
        displayLMeter:setSize(11, 5)
        displayLMeter:setRenderType("EMISSIVE_SOLID")
    end;
}