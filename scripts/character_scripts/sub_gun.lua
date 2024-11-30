---@class (exact) SubGun : AvatarModule 臨戦衣装の拳銃を制御するクラス
---@field public hasSubGun boolean サブハンドガンを持っているかどうか
---@field public enable fun(self: SubGun) サブハンドガンを有効にする
---@field public disable fun() サブハンドガンを無効にする

SubGun = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return SubGun
    new = function (parent)
        ---@type SubGun
        local instance = Avatar.instantiate(SubGun, AvatarModule, parent)

        instance.hasSubGun = false

        return instance
    end;

    ---サブハンドガンを有効にする。
    ---@param self SubGun
    enable = function (self)
        events.TICK:register(function ()
            if self.parent.gun.currentGunPosition ~= "NONE" then
                local isLeftHanded = player:isLeftHanded()
                local heldItem = player:getHeldItem(self.parent.gun.currentGunPosition == "RIGHT" ~= isLeftHanded)
                self.hasSubGun = false
                for _, gunItem in ipairs(self.parent.gun.gunItems) do
                    if gunItem == heldItem.id then
                        self.hasSubGun = true
                        break
                    end
                end
            end
            if self.hasSubGun and self.parent.exSkill.animationCount == -1 then
                models.models.main.Avatar.UpperBody.Body.SubGun:setScale(1.5, 1.5, 1.5)
                models.models.main.Avatar.UpperBody.Body.SubGun:setParentType("Item")
            elseif self.parent.exSkill.animationCount == -1 then
                models.models.main.Avatar.UpperBody.Body.SubGun:setPos(-1, 17.5, -1.9)
                models.models.main.Avatar.UpperBody.Body.SubGun:setRot(-30, 90, 0)
                models.models.main.Avatar.UpperBody.Body.SubGun:setScale()
                models.models.main.Avatar.UpperBody.Body.SubGun:setParentType("None")
            end
        end, "sun_gun_tick")
        events.ITEM_RENDER:register(function (_, mode)
            if self.hasSubGun then
                if self.parent.gun.currentGunPosition == "RIGHT" then
                    if mode == "FIRST_PERSON_LEFT_HAND" then
                        models.models.main.Avatar.UpperBody.Body.SubGun:setPos(-1, 0.5, -2.5)
                        models.models.main.Avatar.UpperBody.Body.SubGun:setRot()
                        return models.models.main.Avatar.UpperBody.Body.SubGun
                    elseif mode == "THIRD_PERSON_LEFT_HAND" then
                        models.models.main.Avatar.UpperBody.Body.SubGun:setPos(0, -2, -1)
                        models.models.main.Avatar.UpperBody.Body.SubGun:setRot()
                        return models.models.main.Avatar.UpperBody.Body.SubGun
                    end
                elseif self.parent.gun.currentGunPosition == "LEFT" then
                    if mode == "FIRST_PERSON_RIGHT_HAND" then
                        models.models.main.Avatar.UpperBody.Body.SubGun:setPos(-1, 0.5, -1)
                        models.models.main.Avatar.UpperBody.Body.SubGun:setRot()
                        return models.models.main.Avatar.UpperBody.Body.SubGun
                    elseif mode == "THIRD_PERSON_RIGHT_HAND" then
                        models.models.main.Avatar.UpperBody.Body.SubGun:setPos(0, -2, -1)
                        models.models.main.Avatar.UpperBody.Body.SubGun:setRot()
                        return models.models.main.Avatar.UpperBody.Body.SubGun
                    end
                end
            end
        end, "sun_gun_item_render")
    end;

    ---サブハンドガンを無効にする。
    ---@param self SubGun
    disable = function (self)
        events.TICK:remove("sun_gun_tick")
        events.ITEM_RENDER:remove("sun_gun_item_render")
        self.hasSubGun = false
    end;
}