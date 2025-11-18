---@class (exact) MachineGun : AvatarModule ヒナのマシンガンを制御するクラス
---@field private isCharging boolean 弦引き中かどうか
---@field private animationLength integer アニメーションの長さ
---@field private chargePercent number マシンガンのチャージ割合
---@field private currentRot number 現在の回転角度
---@field private nextRot number 次ティックの回転角度
MachineGun = {}

---コンストラクタ
---@param parent Avatar アバターのメインクラスへの参照
---@return MachineGun
function MachineGun.new(parent)
    local self = Avatar.instantiate(MachineGun, AvatarModule, parent)

    self.isCharging = false
    self.animationLength = 0
    self.chargePercent = 0
    self.currentRot = 0
    self.nextRot = 0

    return self
end

---初期化関数
function MachineGun:init()
    AvatarModule.init(self)

    events.TICK:register(function ()
        if not client:isPaused() then
            local isGunHold = self.parent.gun.currentGunPosition ~= "NONE"
            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Gun.RotatableBarrel.RotatableBarrelEmissive, models.models.main.Avatar.UpperBody.Body.Gun.GunBodyEmissive}) do
                modelPart:setPrimaryRenderType(isGunHold and "CUTOUT_EMISSIVE_SOLID" or "CUTOUT")
            end


            --弦引きの検出
            if self.parent.exSkill.animationCount == -1 then
                local activeItem = player:getActiveItem()
                local isLeftHanded = player:isLeftHanded()
                local heldItems = {player:getHeldItem(isLeftHanded), player:getHeldItem(not isLeftHanded)}
                local gameVersion = client:getVersion()
                local hasChargedCrossbow = (heldItems[1].id == "minecraft:crossbow" and ((gameVersion >= "1.20.5" and #heldItems[1].tag["minecraft:charged_projectiles"] >= 1) or (gameVersion < "1.20.5" and heldItems[1].tag.Charged == 1)) and self.parent.gun.currentGunPosition == "RIGHT") or (heldItems[2].id == "minecraft:crossbow" and ((gameVersion >= "1.20.5" and #heldItems[2].tag["minecraft:charged_projectiles"] >= 1) or (gameVersion < "1.20.5" and heldItems[2].tag.Charged == 1)) and self.parent.gun.currentGunPosition == "LEFT")
                if (activeItem.id == "minecraft:bow" or activeItem.id == "minecraft:crossbow") and not self.isCharging then
                    --チャージ開始
                    self.isCharging = true
                    if activeItem.id == "minecraft:bow" then
                        self.animationLength = 20
                    else
                        local quickChargeLevel = 0
                        if client:getVersion() >= "1.20.5" then
                            quickChargeLevel = activeItem.tag["minecraft:enchantments"].levels["minecraft:quick_charge"] ~= nil and activeItem.tag["minecraft:enchantments"].levels["minecraft:quick_charge"] or 0
                        else
                            if activeItem.tag.Enchantments ~= nil then
                                for _, enchant in ipairs(activeItem.tag.Enchantments) do
                                    if enchant.id == "minecraft:quick_charge" then
                                        quickChargeLevel = enchant.lvl
                                        break
                                    end
                                end
                            end
                        end
                        self.animationLength = quickChargeLevel <= 5 and 25 - quickChargeLevel * 5 or math.huge
                    end
                elseif hasChargedCrossbow and not self.isCharging then
                    self.isCharging = true
                    self.animationLength = 0
                elseif activeItem.id ~= "minecraft:bow" and activeItem.id ~= "minecraft:crossbow" and not hasChargedCrossbow and self.isCharging and self.parent.exSkill.animationCount == -1 then
                    --チャージ終了
                    self.isCharging = false
                    self.animationLength = 0
                end
            else
                self.isCharging = false
                self.animationLength = 0
            end

            if self.isCharging then
                self.chargePercent = math.min(self.chargePercent + 20 / self.animationLength * 0.05, 1)
            elseif self.parent.gun.currentGunPosition == "NONE" or self.parent.exSkill.animationCount >= 0 then
                self.chargePercent = 0
            else
                self.chargePercent = math.max(self.chargePercent - 0.05, 0)
            end

            self.currentRot = self.nextRot
            self.nextRot = self.currentRot + self.chargePercent * 80
        end
    end)

    events.RENDER:register(function (delta, ctx, matrix)
        if not client:isPaused() then
            models.models.main.Avatar.UpperBody.Body.Gun.RotatableBarrel:setRot(0, 0, self.currentRot + (self.nextRot - self.currentRot) * delta)
        end
    end)
end
