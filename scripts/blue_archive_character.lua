---@alias BlueArchiveCharacter.RightEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "CENTER" # 少し反対側を見る目
---| "CLOSED2" # 閉じた目2
---| "ANGRY" # 怒った目

---@alias BlueArchiveCharacter.LeftEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "INVERTED" # 反対側を見る目
---| "CLOSED2" # 閉じた目2
---| "CENTER" # 少し反対側を見る目
---| "ANGRY_INVERTED" # 怒りつつ、反対側を見る目
---| "ANGRY" # 怒った目

---@alias BlueArchiveCharacter.MouthTextures
---| "NORMAL" # 通常
---| "CLOSED" # 閉じた口
---| "SMALL" # 小さく開いた口
---| "SIGH" # ため息口
---| "ANXIOUS" # への口
---| "SMILE" # にっこり

---@alias BlueArchiveCharacter.GunHoldType
---| "NORMAL" # バニラの弓やクロスボウの構え方と同じ
---| "CUSTOM" # BBアニメーション"[models.main][gun_hold_right]"と"[models.main][gun_hold_left]"で構え方を定義する

---@alias BlueArchiveCharacter.GunPutType
---| "BODY" # アバターのBodyに銃を移動させる
---| "HIDDEN" # 銃を隠す

---@alias BlueArchiveCharacter.FormationType
---| "STRIKER" # ストライカー（前衛）
---| "SPECIAL" # スペシャル（後方支援）

---@alias BlueArchiveCharacter.Costumes
---| "DEFAULT" # デフォルト衣装

--[[ ******************************** ]]

---@class BlueArchiveCharacter : AvatarModule キャラクター変数を保持するクラス。別のキャラクターに対してもここを変更するだけで対応できるようにする。
---@field public basic BlueArchiveCharacter.BasicStruct 生徒の基本情報
---@field public faceParts BlueArchiveCharacter.FacePartsStruct 目や口による表情
---@field public arms BlueArchiveCharacter.ArmsStruct 腕
---@field public skirt BlueArchiveCharacter.SkirtStruct スカート
---@field public gun BlueArchiveCharacter.GunStruct 銃
---@field public placementObjects BlueArchiveCharacter.PlacementObjectStruct[] 設置物
---@field public exSkill BlueArchiveCharacter.ExSkillStruct[] Exスキル
---@field public costume BlueArchiveCharacter.CostumeStruct コスチューム
---@field public bubble BlueArchiveCharacter.BubbleStruct 吹き出しエモート
---@field public headBlock BlueArchiveCharacter.HeadBlockStruct 頭ブロック
---@field public portrait BlueArchiveCharacter.HeadBlockStruct ポートレート
---@field public deathAnimation BlueArchiveCharacter.DeathAnimationStruct 死亡アニメーション
---@field public actionWheel BlueArchiveCharacter.ActionWheelStruct アクションホイール
---@field public physics BlueArchiveCharacter.PhysicsStruct 物理演算
---@field public dataSync BlueArchiveCharacter.DataSyncStruct データ同期

--[[ ******************************** ]]

---@class BlueArchiveCharacter.BasicStruct 生徒の基本情報のデータ構造体
---@field public firstName BlueArchiveCharacter.LocaleStringSet 生徒の名前
---@field public lastName BlueArchiveCharacter.LocaleStringSet 生徒の苗字
---@field public clubName BlueArchiveCharacter.LocaleStringSet 生徒が所属している部活名
---@field public birth BlueArchiveCharacter.MonthDaySet 生徒の誕生日

---@class BlueArchiveCharacter.FacePartsStruct 目や口による表情のデータ構造体。UVマッピング情報は、デフォルトパーツから見て左からx番目、上からy番目とする。
---@field public rightEye {[BlueArchiveCharacter.RightEyeTextures]: Vector2} 右目のテクスチャのUVマッピング情報
---@field public leftEye {[BlueArchiveCharacter.LeftEyeTextures]: Vector2} 左目のテクスチャのUVマッピング情報
---@field public mouth {[BlueArchiveCharacter.MouthTextures]: Vector2} 口のテクスチャのUVマッピング情報
---@field public emotionSet? BlueArchiveCharacter.OverrideEmotionSet 特定の状況における表情を上書きする

---@class BlueArchiveCharacter.ArmsStruct 腕のデータ構造体
---@field public callbacks? BlueArchiveCharacter.ArmsCallbacksSet 腕の制御のコールバック関数群

---@class BlueArchiveCharacter.SkirtStruct スカートのデータ構造体
---@field public skirtModels? ModelPart[] スカートとして制御するモデル

---@class BlueArchiveCharacter.GunStruct 銃のデータ構造体
---@field public scale number 銃モデルの大きさの倍率
---@field public gunPosition BlueArchiveCharacter.GunPositionSet 銃モデルの位置や向き
---@field public sound BlueArchiveCharacter.GunSoundSet 銃の射撃音
---@field public callbacks? BlueArchiveCharacter.GunCallbacksSet 銃のコールバック関数

---@class BlueArchiveCharacter.PlacementObjectStruct 設置物のデータ構造体
---@field public model ModelPart 設置物として扱うモデル
---@field public boundingBox BlueArchiveCharacter.PlacementObjectBoundingBoxSet 設置物の当たり判定
---@field public placementMode PlacementObjectManager.PlacementMode 設置物の設置モード
---@field public gravity? number 設置物にかかる重力。1が標準的な自由落下。0で空中静止。負の数で反重力（上に向かって落ちる）。
---@field public hasFireResistance? boolean 設置物に火炎耐性を付与するかどうか。trueにすると炎やマグマで焼かれなくなる。
---@field public callbacks? BlueArchiveCharacter.PlacementObjectCallbacksSet 設置物のコールバック関数

---@class BlueArchiveCharacter.ExSkillStruct Exスキルのデータ構造体
---@field public name BlueArchiveCharacter.LocaleStringSet Exスキルの名前
---@field public formationType BlueArchiveCharacter.FormationType この生徒の戦闘配置タイプ
---@field public models ModelPart[] Exスキルアニメーション開始時に表示し、Exスキルアニメーション終了時に非表示にするモデルパーツ
---@field public animations string[] Exスキルアニメーションが含まれるモデルファイル名。アニメーション名は"ex_skill_<Exスキルのインデックス番号>"にすること。
---@field public camera BlueArchiveCharacter.ExSkillCameraSet Exスキルアニメーション中のカメラワーク
---@field public callbacks? BlueArchiveCharacter.ExSkillCallbacks Exスキルのコールバック関数

---@class BlueArchiveCharacter.CostumeStruct コスチュームのデータ構造体
---@field public costumes BlueArchiveCharacter.CostumeDataSet[] コスチュームデータ
---@field public callbacks? BlueArchiveCharacter.CostumeCallbacks コスチュームのコールバック関数

---@class BlueArchiveCharacter.BubbleStruct 吹き出しエモートのデータ構造体
---@field public callbacks? BlueArchiveCharacter.BubbleCallbacks 吹き出しエモートのコールバック関数

---@class BlueArchiveCharacter.HeadBlockStruct 頭ブロック、ポートレートのデータ構造体
---@field public includeModels ModelPart[] 頭モデルに追加でアタッチするモデル
---@field public callbacks? BlueArchiveCharacter.HeadBlockCallbacks 頭ブロック、ポートレートのコールバック関数

---@class BlueArchiveCharacter.DeathAnimationStruct 死亡アニメーションのデータ構造体
---@field public callbacks? BlueArchiveCharacter.DeathAnimationCallbacks 死亡アニメーションのコールバック関数

---@class BlueArchiveCharacter.ActionWheelStruct アクションホイールのデータ構造体
---@field public isVehicleOptionEnabled boolean 乗り物のモデル置き換えオプションを有効にするかどうか

---@class BlueArchiveCharacter.PhysicsStruct 物理演算のデータ構造体
---@field physicData BlueArchiveCharacter.PhysicDataSet[] 物理演算データ
---@field callbacks? BlueArchiveCharacter.PhysicCallbacks 物理演算のコールバック関数

---@class BlueArchiveCharacter.DataSyncStruct データ同期のデータ構造体
---@field public syncData {[string]: any} 追加でping同期させるデータテーブル
---@field public callbacks? BlueArchiveCharacter.DataSyncCallbacks データ同期のコールバック関数

--[[ ******************************** ]]

---@class (exact) BlueArchiveCharacter.OverrideEmotionSet 特定の状況における表情を上書きするセット
---@field public onDamage? BlueArchiveCharacter.EmotionSet ダメージを受けたとき
---@field public onDied? BlueArchiveCharacter.EmotionSet 死んだとき（死亡アニメーションは除外）
---@field public onSleep? BlueArchiveCharacter.EmotionSet ベッドで寝ているとき

---@class (exact) BlueArchiveCharacter.EmotionSet 表情のデータセット
---@field public rightEye BlueArchiveCharacter.RightEyeTextures 右目の表情名
---@field public leftEye BlueArchiveCharacter.LeftEyeTextures 左目の表情名
---@field public mouth BlueArchiveCharacter.MouthTextures 口の表情名

---@class (exact) BlueArchiveCharacter.ArmsCallbacksSet 腕処理のコールバック関数のセット
---@field public onArmStateChanged? fun(self: BlueArchiveCharacter, right: integer, left: integer): {right?: integer, left?: integer}|nil 腕の状態が変更された際のコールバック関数
---@field public onAdditionalRightArmProcess? fun(self: BlueArchiveCharacter, state: integer) 右腕の追加処理
---@field public onAdditionalLeftArmProcess? fun(self: BlueArchiveCharacter, state: integer) 左腕の追加処理

---@class (exact) BlueArchiveCharacter.GunPositionSet 銃のモデルの位置や向きのデータセット
---@field public hold BlueArchiveCharacter.GunHoldPositionSet 銃を構えているとき
---@field public put BlueArchiveCharacter.GunPutPositionSet 銃をしまっているとき

---@class (exact) BlueArchiveCharacter.GunHoldPositionSet 構えているときの銃のモデルの位置や向きのデータセット
---@field public type BlueArchiveCharacter.GunHoldType 銃の構え方の種類
---@field public firstPersonPos? BlueArchiveCharacter.Vector3RightLeftSet 一人称視点での銃の位置
---@field public firstPersonRot? BlueArchiveCharacter.Vector3RightLeftSet 一人称視点での銃の方向
---@field public thirdPersonPos? BlueArchiveCharacter.Vector3RightLeftSet 三人称視点での銃の位置
---@field public thirdPersonRot? BlueArchiveCharacter.Vector3RightLeftSet 三人称視点での銃の方向

---@class (exact) BlueArchiveCharacter.GunPutPositionSet しまっているときの銃のモデルの位置や向きのデータセット
---@field public type BlueArchiveCharacter.GunPutType 銃のしまい方の種類
---@field public pos? BlueArchiveCharacter.Vector3RightLeftSet 一人称視点での銃の位置
---@field public rot? BlueArchiveCharacter.Vector3RightLeftSet 一人称視点での銃の方向

---@class (exact) BlueArchiveCharacter.GunSoundSet 銃の音のデータセット
---@field public name Minecraft.soundID 銃の音として使用するゲームの音源名
---@field public pitch number 音源の再生ピッチ（0.5～2）

---@class (exact) BlueArchiveCharacter.GunCallbacksSet 銃のコールバック関数のセット
---@field public onMainHandChange? fun(self: BlueArchiveCharacter, direction: Gun.HandDirection) 利き手が変更されたときに呼び出される関数

---@class (exact) BlueArchiveCharacter.PlacementObjectBoundingBoxSet 設置物の当たり判定のデータセット
---@field public offsetPos? Vector3 設置物の底の中心点のオフセット位置（任意）。基準点は(0, 0, 0)。
---@field public size? Vector3 当たり判定の大きさ。BlockBenchでのサイズの値をそのまま入力する。基準点はモデルの底面の中心。

---@class (exact) BlueArchiveCharacter.PlacementObjectCallbacksSet 設置物のコールバック関数のセット
---@field public onInit? fun(self: BlueArchiveCharacter, placementObject: PlacementObject) 設置物インスタンスが生成された直後に呼ばれる関数
---@field public onDeinit? fun(self: BlueArchiveCharacter, placementObject: PlacementObject) 設置物インスタンスが破棄される直前に呼ばれる関数
---@field public onTick? fun(self: BlueArchiveCharacter, placementObject: PlacementObject) 各ティック毎に呼ばれる関数
---@field public onRender? fun(self: BlueArchiveCharacter, placementObject: PlacementObject) 各レンダーティック毎に呼ばれる関数
---@field public onGround? fun(self: BlueArchiveCharacter, placementObject: PlacementObject) 設置物が接地した瞬間に呼ばれる関数

---@class (exact) BlueArchiveCharacter.ExSkillCameraSet Exスキルアニメーション中のカメラワークのセット
---@field public start BlueArchiveCharacter.ExSkillCameraPositionSet Exスキルアニメーション開始地点
---@field public fin BlueArchiveCharacter.ExSkillCameraPositionSet Exスキルアニメーション終了地点
---@field public fixMode? boolean カメラの補正モード。通常は無効だが、特定のキャラクターに対しては有効にしておく。

---@class (exact) BlueArchiveCharacter.ExSkillCameraPositionSet Exスキルアニメーション中のカメラワークの開始/終了地点の位置のデータセット
---@field public pos Vector3 カメラの位置
---@field public rot Vector3 カメラの方向

---@class (exact) BlueArchiveCharacter.ExSkillCallbacks Exスキルのコールバック関数のセット
---@field public onPreTransition? fun(self: BlueArchiveCharacter) Exスキルアニメーション開始前のトランジション開始前に実行されるコールバック関数
---@field public onPreAnimation? fun(self: BlueArchiveCharacter) Exスキルアニメーション開始前のトランジション終了後に実行されるコールバック関数
---@field public onAnimationTick? fun(self: BlueArchiveCharacter, tick: integer) Exスキルアニメーション再生中のみ実行されるティック関数
---@field public onPostAnimation? fun(self: BlueArchiveCharacter, forcedStop: boolean) Exスキルアニメーション終了後のトランジション開始前に実行されるコールバック関数
---@field public onPostTransition? fun(self: BlueArchiveCharacter, forcedStop: boolean) Exスキルアニメーション終了後のトランジション終了後に実行されるコールバック関数

---@class BlueArchiveCharacter.CostumeDataSet コスチュームのデータセット
---@field public name string コスチュームの内部名
---@field public displayName BlueArchiveCharacter.LocaleStringSet コスチュームの表示名
---@field public exSkill integer コスチュームに対応するExスキルのインデックス番号
---@field public subExSkill? integer コスチュームに対応するサブExスキルのインデックス番号

---@class (exact) BlueArchiveCharacter.CostumeCallbacks コスチュームのコールバック関数のセット
---@field public onChange? fun(self: BlueArchiveCharacter, costumeId: BlueArchiveCharacter.Costumes) 衣装が変更されたときに実行されるコールバック関数。デフォルトの衣装はここに含めない。
---@field public onReset? fun(self: BlueArchiveCharacter) 衣装がリセットされたときに実行されるコールバック関数。あらゆる衣装からデフォルトの衣装へ推移できるようにする。
---@field public onArmorChange? fun(self: BlueArchiveCharacter, parts: Armor.ArmorPart, isVisible: boolean) 防具が変更された（防具が見える/見えない）ときに実行されるコールバック関数

---@class (exact) BlueArchiveCharacter.BubbleCallbacks 吹き出しエモートのコールバック関数のセット
---@field public onPlay? fun(self: BlueArchiveCharacter, type: Bubble.BubbleType, duration: integer, showInGui: boolean) 吹き出しエモートが再生された時に実行されるコールバック関数
---@field public  onStop? fun(self: BlueArchiveCharacter, type: Bubble.BubbleType, forcedStop: boolean) 吹き出しアニメーション終了時に実行されるコールバック関数

---@class (exact) BlueArchiveCharacter.HeadBlockCallbacks 頭ブロックのコールバック関数のセット
---@field public onBeforeModelCopy? fun(self: BlueArchiveCharacter, isScriptLoaded: boolean) モデルのコピー直前に実行される関数
---@field public onAfterModelCopy? fun(self: BlueArchiveCharacter, isScriptLoaded: boolean) モデルのコピー直後に実行される関数

---@class (exact) BlueArchiveCharacter.DeathAnimationCallbacks 死亡アニメーションのコールバック関数のセット
---@field public onPhase1? fun(self: BlueArchiveCharacter, dummyAvatar: ModelPart, costume: BlueArchiveCharacter.Costumes) 死亡アニメーションが再生された直後に実行される関数
---@field public onPhase2? fun(self: BlueArchiveCharacter, dummyAvatar: ModelPart, costume: BlueArchiveCharacter.Costumes) ダミーアバターが縄ばしごにつかまった直後に実行される関数
---@field public onBeforeModelCopy? fun(self: BlueArchiveCharacter, isScriptLoaded: boolean) モデルのコピー直前に実行される関数
---@field public onAfterModelCopy? fun(self: BlueArchiveCharacter, isScriptLoaded: boolean) モデルのコピー直後に実行される関数

---@class (exact) BlueArchiveCharacter.PhysicDataSet 物理演算のデータセット
---@field public models ModelPart[] 物理演算の対象にするモデルパーツ
---@field public x? BlueArchiveCharacter.PhysicAxisData x軸のデータ
---@field public y? BlueArchiveCharacter.PhysicAxisData y軸のデータ
---@field public z? BlueArchiveCharacter.PhysicAxisData z軸のデータ

---@class (exact) BlueArchiveCharacter.PhysicAxisData 物理演算の1軸のデータセット
---@field public vertical? BlueArchiveCharacter.PhysicCoreData 体が垂直方向である時（通常時）の物理演算データ
---@field public horizontal? BlueArchiveCharacter.PhysicCoreData 体が水平方向である時（水泳時、エリトラ飛行時）の物理演算データ

---@class (exact) BlueArchiveCharacter.PhysicCoreData 物理演算のコアデータ
---@field public min number このモデルパーツ、回転軸の絶対的な回転の最小値（度）
---@field public neutral number このモデルパーツ、回転軸の中立の回転位置（度）
---@field public max number このモデルパーツ、回転軸の絶対的な回転の最大値（度）
---@field public sneakOffset? number スニーク時にこのモデルパーツの回転に加えられるオフセット値
---@field public headRotMultiplayer? number 頭の縦方向の回転と共にこのモデルパーツの回転に加えられる値の倍率
---@field public headX? BlueArchiveCharacter.PhysicFactorData 頭を基準とした、前後方向移動によるモデルパーツの回転データ
---@field public headZ? BlueArchiveCharacter.PhysicFactorData 頭を基準とした、左右方向移動によるモデルパーツの回転データ
---@field public headRot? BlueArchiveCharacter.PhysicFactorData 頭の回転によるによるモデルパーツの回転データ
---@field public bodyX? BlueArchiveCharacter.PhysicFactorData 体を基準とした、前後方向移動によるモデルパーツの回転データ
---@field public bodyY? BlueArchiveCharacter.PhysicFactorData 体を基準とした、上下方向移動によるモデルパーツの回転データ
---@field public bodyZ? BlueArchiveCharacter.PhysicFactorData 体を基準とした、左右方向移動によるモデルパーツの回転データ
---@field public bodyRot? BlueArchiveCharacter.PhysicFactorData 体の回転によるによるモデルパーツの回転データ

---@class (exact) BlueArchiveCharacter.PhysicFactorData 物理演算を働かせる要因を定義するデータセット
---@field public multiplayer number この回転事象がモデルパーツに与える回転の倍率
---@field public min number この回転事象がモデルパーツに与える回転の最小値
---@field public max number この回転事象がモデルパーツに与える回転の最大値

---@class (exact) BlueArchiveCharacter.PhysicCallbacks 物理演算のコールバック関数のセット
---@field public onPhysicPerformed? fun(self: BlueArchiveCharacter, model: ModelPart) 物理演算処理後に実行されるコールバック関数（省略可）。ここでモデルパーツの向きを上書きできる。

---@class (exact) BlueArchiveCharacter.DataSyncCallbacks データ同期のコールバック関数のセット
---@field public onDataSynced? fun(self: BlueArchiveCharacter) データが同期されたときに実行させるコールバック関数。ホスト上では実行されない。

--[[ ******************************** ]]

---@class (exact) BlueArchiveCharacter.LocaleStringSet ロケール文字列のセット
---@field public en_us string 英語（米国）
---@field public ja_jp string 日本語

---@class (exact) BlueArchiveCharacter.MonthDaySet 日月のデータセット
---@field public month integer 月
---@field public day integer 日

---@class (exact) BlueArchiveCharacter.Vector3RightLeftSet 左右で別々にVector3が定義できるデータセット
---@field public right? Vector3 右
---@field public left? Vector3 左

BlueArchiveCharacter = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return BlueArchiveCharacter
    new = function (parent)
        ---@type BlueArchiveCharacter
        local instance = Avatar.instantiate(BlueArchiveCharacter, AvatarModule, parent)

        instance.basic = {
            firstName = {
                en_us = "Iroha";
                ja_jp = "イロハ";
            };

            lastName = {
                en_us = "Natsume";
                ja_jp = "棗";
            };

            clubName = {
                en_us = "Pandemonium Society";
                ja_jp = "万魔殿";
            };

            birth = {
                month = 11;
                day = 16;
            };
        }

        instance.faceParts = {
            rightEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(2, 0); --必須
                TIRED = vectors.vec2(3, 0); --必須
                CLOSED = vectors.vec2(4, 0); --必須
                CENTER = vectors.vec2(6, 0);
                CLOSED2 = vectors.vec2(7, 0);
                ANGRY = vectors.vec2(9, 0);
            };

            leftEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(1, 0); --必須
                TIRED = vectors.vec2(2, 0); --必須
                CLOSED = vectors.vec2(3, 0); --必須
                INVERTED = vectors.vec2(4, 0);
                CLOSED2 = vectors.vec2(6, 0);
                CENTER = vectors.vec2(7, 0);
                ANGRY_INVERTED = vectors.vec2(-1, 1);
                ANGRY = vectors.vec2(0, 1);
            };

            mouth = {
                CLOSED = vectors.vec2(0, 0);
                SMALL = vectors.vec2(1, 0);
                SIGH = vectors.vec2(2, 0);
                ANXIOUS = vectors.vec2(3, 0);
                SMILE = vectors.vec2(0, 1);
            };
        }

        instance.arms = {
            callbacks = {
                onArmStateChanged = function (self, right, left)
                    if self.costume.costumes[1].isRidingTank and self.costume.costumes[1].tankTick <= 35 then
                        return {right = 0, left = 0}
                    end
                    if self.costume.costumes[1].isRidingTank then
                        if self.costume.costumes[1].tankTick <= 35 then
                            return {right = 0, left = 0}
                        else
                            return {right = right == 1 and 4 or (right == 2 and 5 or right), left = left == 1 and 4 or (left == 2 and 5 or left)}
                        end
                    end
                end;

                onAdditionalRightArmProcess = function (self, state)
                    if state == 4 then
                        --虎丸搭乗中の武器の構え
                        events.TICK:register(function ()
                            self.parent.arms:processArmWingCount()
                            if player:isSwingingArm() and not player:isLeftHanded() and self.costume.costumes[1].shootTick == -1 then
                                models.models.main.Avatar.UpperBody.Arms.RightArm:setParentType("RightArm")
                            else
                                models.models.main.Avatar.UpperBody.Arms.RightArm:setParentType("Body")
                            end
                            if player:getActiveItem().id == "minecraft:crossbow" then
                                self.parent.arms:setArmState(3, 3)
                            end
                        end, "right_arm_tick")
                        events.RENDER:register(function (delta)
                            local headRot = vanilla_model.HEAD:getOriginRot()
                            models.models.main.Avatar.UpperBody.Arms.RightArm:setRot(((player:isSwingingArm() and not player:isLeftHanded()) or self.costume.costumes[1].shootTick >= 0) and vectors.vec3() or vectors.vec3(headRot.x + math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * 2.5 + 90, 70, 0))
                        end, "right_arm_render")
                    elseif state == 5 then
                        --虎丸搭乗中の武器を持っていない手
                        local isHolding = false
                        events.TICK:register(function ()
                            self.parent.arms:processArmWingCount()
                            local heldItem = player:getHeldItem(not player:isLeftHanded())
                            isHolding = player:getActiveItem().id == "minecraft:bow" or (heldItem.id == "minecraft:crossbow" and heldItem.tag.Charged ~= nil and heldItem.tag.Charged == 1)
                            models.models.main.Avatar.UpperBody.Arms.RightArm:setParentType((isHolding or self.costume.costumes[1].shootTick >= 0) and "Body" or "RightArm")
                        end, "right_arm_tick")
                        events.RENDER:register(function (delta)
                            models.models.main.Avatar.UpperBody.Arms.RightArm:setRot(isHolding and vectors.vec3(math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * 2.5 + 35, 0, 0) or vectors.vec3())
                        end, "right_arm_render")
                    end
                end;

                onAdditionalLeftArmProcess = function (self, state)
                    if state == 4 then
                        --虎丸搭乗中の武器の構え
                        events.TICK:register(function ()
                            self.parent.arms:processArmWingCount()
                            if player:isSwingingArm() and player:isLeftHanded() and self.costume.costumes[1].shootTick == -1 then
                                models.models.main.Avatar.UpperBody.Arms.LeftArm:setParentType("LeftArm")
                            else
                                models.models.main.Avatar.UpperBody.Arms.LeftArm:setParentType("Body")
                            end
                            if player:getActiveItem().id == "minecraft:crossbow" then
                                self.parent.arms:setArmState(3, 3)
                            end
                        end, "right_arm_tick")
                        events.RENDER:register(function (delta)
                            local headRot = vanilla_model.HEAD:getOriginRot()
                            models.models.main.Avatar.UpperBody.Arms.LeftArm:setRot(((player:isSwingingArm() and player:isLeftHanded()) or self.costume.costumes[1].shootTick >= 0) and vectors.vec3() or vectors.vec3(headRot.x + math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * 2.5 + 90, 90, 0))
                        end, "right_arm_render")
                    elseif state == 5 then
                        --虎丸搭乗中の武器を持っていない手
                        local isHolding = false
                        events.TICK:register(function ()
                            self.parent.arms:processArmWingCount()
                            local heldItem = player:getHeldItem(player:isLeftHanded())
                            isHolding = player:getActiveItem().id == "minecraft:bow" or (heldItem.id == "minecraft:crossbow" and heldItem.tag.Charged ~= nil and heldItem.tag.Charged == 1)
                            models.models.main.Avatar.UpperBody.Arms.LeftArm:setParentType((isHolding or self.costume.costumes[1].shootTick >= 0) and "Body" or "LeftArm")
                        end, "right_arm_tick")
                        events.RENDER:register(function (delta)
                            models.models.main.Avatar.UpperBody.Arms.LeftArm:setRot(isHolding and vectors.vec3(math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * 2.5 + 35, 0, 0) or vectors.vec3())
                        end, "right_arm_render")
                    end
                end
            };
        }

        instance.skirt = {

        }

        instance.gun = {
            scale = 0.4;

            gunPosition = {
                hold = {
                    type = "NORMAL";

                    firstPersonPos = {
                        right = vectors.vec3(-0.5, -3.75, -3);
                        left = vectors.vec3(0.5, -3.75, -3);
                    };

                    thirdPersonPos = {
                        right = vectors.vec3(0, -3.75, -3);
                        left = vectors.vec3(0, -3.75, -3);
                    };
                };

                put = {
                    type = "HIDDEN";
                };
            };

            sound = {
                name = "minecraft:entity.iron_golem.hurt";
                pitch = 2;
            };
        }

        instance.placementObjects = {

        }

        instance.exSkill = {
            {
                name = {
                    en_us = "Let's go, Toramaru";
                    ja_jp = "行きますよ、虎丸";
                };

                formationType = "SPECIAL";

                models = {models.models.ex_skill_1.Tank, models.models.ex_skill_1.Tank.TankBody.Turret.Cannon.ShineEffect, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Book};

                animations = {"main", "ex_skill_1"};

                camera = {
                    start = {
                        rot = vectors.vec3(0, 155, 0);
                        pos = vectors.vec3(0, 43, -28);
                    };

                    fin = {
                        rot = vectors.vec3(-5, 280, 0);
                        pos = vectors.vec3(-8, 60.4, -388);
                    };
                };

                callbacks = {
                    onPreAnimation = function (self)
                        self.parent.faceParts:setEmotion("CENTER", "NORMAL", "CLOSED", 13, true)
                    end;

                    onAnimationTick = function (self, tick)
                        if tick == 13 then
                            self.parent.faceParts:setEmotion("NORMAL", "CENTER", "SMALL", 6, true)
                            models.models.main.Avatar.Head.NoticeEffect:setVisible(true)
                        elseif tick == 15 then
                            models.models.main.Avatar.Head.NoticeEffect:setVisible(false)
                        elseif tick == 17 then
                            models.models.main.Avatar.Head.NoticeEffect:setVisible(true)
                        elseif tick == 19 then
                            self.parent.faceParts:setEmotion("NORMAL", "CENTER", "SIGH", 5, true)
                            models.models.main.Avatar.Head.NoticeEffect:setVisible(false)
                        elseif tick == 22 then
                            local bodyYaw = player:getBodyYaw() * -1 - 60
                            particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Book):add(vectors.rotateAroundAxis(bodyYaw, -0.25, 0.2, 0.1, 0, 1, 0))):setScale(0.5):setVelocity(vectors.rotateAroundAxis(bodyYaw, -0.1, 0.05, 0, 0, 1, 0)):setColor(1, 1, 0.608):setGravity(0.4)
                        elseif tick == 24 then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "SMALL", 10, true)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.chiseled_bookshelf.insert"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Book), 1, 1)
                        elseif tick == 26 then
                            local bodyYaw = player:getBodyYaw() * -1 - 60
                            particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:snowflake"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.Head.FaceParts.Mouth):add(vectors.rotateAroundAxis(bodyYaw, 0, 0, 0.2, 0, 1, 0))):setScale(0.5):setVelocity(vectors.rotateAroundAxis(bodyYaw, 0, -0.01, 0.05, 0, 1, 0)):setGravity(0):setLifetime(8)
                        elseif tick == 34 then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "ANXIOUS", 3, true)
                        elseif tick == 37 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "ANXIOUS", 35, true)
                        elseif tick == 40 then
                            self.exSkill[1].engineSound = sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.minecart.riding"), player:getPos(), 0.25, 0.5)
                        elseif tick == 62 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), player:getPos(), 1, 1.5)
                        elseif tick == 72 then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "ANXIOUS", 6, true)
                        elseif tick == 78 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "CLOSED", 19, true)
                        elseif tick == 97 then
                            self.parent.faceParts:setEmotion("CENTER", "NORMAL", "CLOSED", 16, true)
                        end
                        if (tick >= 51 and tick < 65) or (tick >= 74 and tick < 77) then
                            for _, modelPart in ipairs({models.models.ex_skill_1.Tank.RightCrawler.ExSkill1ParticleAnchor1, models.models.ex_skill_1.Tank.LeftCrawler.ExSkill1ParticleAnchor2}) do
                                local anchorPos = self.parent.modelUtils.getModelWorldPos(modelPart)
                                for _ = 1, 5 do
                                    local offsetPos = vectors.vec3(math.random() - 0.5, 0, math.random() - 0.5)
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), anchorPos:copy():add(offsetPos)):setVelocity(offsetPos:copy():scale(0.1):add(0, 0.05, 0)):setColor(0.98, 0.784, 0.533)
                                end
                            end
                        end
                        if (tick >= 51 and tick < 65) or tick >= 74 then
                            local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_1.Tank)
                            for _ = 1, 5 do
                                local offsetPos = vectors.vec3(math.random() * 7 - 3.5, 0, math.random() * 7 - 3.5)
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:campfire_cosy_smoke"), anchorPos:copy():add(offsetPos)):setScale(5):setVelocity(offsetPos:copy():scale(0.01):add(0, 0.025, 0))
                            end
                        end
                        if tick >= 51 and tick < 65 and tick % 2 == 0 then
                            for _, modelPart in ipairs({models.models.ex_skill_1.Tank.RightCrawler.RightCrawlerBelt, models.models.ex_skill_1.Tank.LeftCrawler.LeftCrawlerBelt}) do
                                modelPart:setUVPixels(0, (tick % 4) / 2)
                            end
                        end
                        if tick >= 74 then
                            for _, modelPart in ipairs({models.models.ex_skill_1.Tank.RightCrawler.RightCrawlerBelt, models.models.ex_skill_1.Tank.LeftCrawler.LeftCrawlerBelt}) do
                                modelPart:setUVPixels(0, (tick % 2))
                            end
                        end
                        if tick > 40 then
                            self.exSkill[1].engineSound:setPos(self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_1.Tank))
                        end
                        if tick > 73 then
                            if tick % 2 == 0 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.piston.extend"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_1.Tank), 0.5, 0.2 + (tick - 73) / 370)
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.piston.contract"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_1.Tank), 0.5, 0.2 + (tick - 73) / 370)
                            end
                        end
                    end;

                    onPostAnimation = function (self, forcedStop)
                        self.exSkill[1].engineSound = nil
                        if forcedStop then
                            models.models.main.Avatar.Head.NoticeEffect:setVisible(false)
                        end
                    end;
                };

                ---戦車のエンジン音のインスタンス
                ---@type Sound|nil
                engineSound = nil;
            };
        }

        instance.costume = {
            costumes = {
                {
                    name = "default";

                    displayName = {
                        en_us = "Default";
                        ja_jp = "デフォルト";
                    };

                    exSkill = 1;

                    ---戦車に乗っているかどうか
                    ---@type boolean
                    isRidingTank = false;

                    ---前ティックに戦車に乗っていたかどうか
                    ---@type boolean
                    isRidingTankPrev = false;

                    ---前ティックに戦車のエンジンが起動していたかどうか
                    ---@type boolean
                    isEngineActivePrev = false;

                    ---戦車に乗っているときのティックカウンター
                    ---@type integer
                    tankTick = 0;

                    ---ラクダの向きのデータ
                    ---@type number[]
                    camelRotData = {0, 0};

                    ---現ティックの戦車の移動ベクトル
                    ---@type Vector3
                    tankVelocity = vectors.vec3();

                    ---砲弾を撃つ際のティックカウンター
                    ---@type integer
                    shootTick = -1;

                    ---次の砲弾を撃つまでのクールダウン
                    ---@type integer
                    shootCooldown = 0;

                    ---ヒント表示をしたかどうか。
                    ---@type boolean
                    isTipShowed = false;

                    ---イブキを搭乗させているかどうか。
                    ---@type boolean
                    hasIbuki = false;

                    ---前ティックにイブキを搭乗させていたかどうか。
                    ---@type boolean
                    hadIbukiPrev = false;
                };
            };

            callbacks = {
                onArmorChange = function (self, parts, isVisible)
                    if parts == "HELMET" then
                        models.models.main.Avatar.Head.Hat:setVisible(not isVisible)
                    end
                end;
            };
        }

        instance.bubble = {
            callbacks = {
                onPlay = function (self, type, duration, showInGui)
                    if type == "GOOD" then
                        self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "CLOSED", duration, true)
                    elseif type == "HEART" then
                        self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "SMILE", duration, true)
                    elseif type == "NOTE" then
                        self.parent.faceParts:setEmotion("ANGRY", "ANGRY", "SMILE", duration, true)
                    elseif type == "QUESTION" then
                        self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "SMALL", duration, true)
                    elseif type == "SWEAT" then
                        if showInGui then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "SIGH", duration, true)
                        else

                            self.parent.faceParts:setEmotion("SURPRISED", "SURPRISED", "CLOSED", 60, true)
                        end
                    end
                end
            };
        }

        instance.headBlock = {
            includeModels = {};
        }

        instance.portrait = {
            includeModels = {};
        }

        instance.deathAnimation = {
            callbacks = {
                onPhase1 = function (_, dummyAvatar)
                    dummyAvatar.Head.BackHair:setRot(20, 0, 0)
                    dummyAvatar.Head.BackHair:setOffsetPivot(0, 0, 4)
                end;

                onPhase2 = function (_, dummyAvatar)
                    dummyAvatar.Head.BackHair:setRot(-20, 0, 0)
                    dummyAvatar.Head.BackHair:setOffsetPivot()
                end;
            };
        }

        instance.actionWheel = {
            isVehicleOptionEnabled = true;
        }

        instance.physics = {
            physicData = {
                {
                    models = {models.models.main.Avatar.Head.BackHair};

                    x = {
                        vertical = {
                            min = -120;
                            neutral = 0;
                            max = 0;
                            sneakOffset = -30;

                            headRotMultiplayer = -1;

                            headX = {
                                multiplayer = -80;
                                min = -90;
                                max = 0;
                            };

                            headRot = {
                                multiplayer = 0.05;
                                min = -90;
                                max = 0;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -120;
                                max = 0;
                            };
                        };

                        horizontal = {
                            min = -135;
                            neutral = -30;
                            max = 0;

                            headX = {
                                multiplayer = -80;
                                min = -45;
                                max = 0;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.Hat.RightHatRibbon};

                    x = {
                        vertical = {
                            min = -5;
                            neutral = -5;
                            max = -5;
                        };
                    };

                    z = {
                        vertical = {
                            min = 0;
                            neutral = 0;
                            max = 150;

                            bodyY = {
                                multiplayer = -80;
                                min = 0;
                                max = 150;
                            };

                            headZ = {
                                multiplayer = -80;
                                min = 0;
                                max = 90;
                            };

                            headRot = {
                                multiplayer = -0.05;
                                min = 0;
                                max = 90;
                            };
                        };

                        horizontal = {
                            min = -150;
                            neutral = -10;
                            max = 35;

                            bodyX = {
                                multiplayer = 80;
                                min = -150;
                                max = 0;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.Hat.LeftHatRibbon};

                    x = {
                        vertical = {
                            min = -5;
                            neutral = -5;
                            max = -5;
                        };
                    };

                    z = {
                        vertical = {
                            min = -150;
                            neutral = 0;
                            max = 0;

                            bodyY = {
                                multiplayer = 80;
                                min = -150;
                                max = 0;
                            };

                            headZ = {
                                multiplayer = -80;
                                min = -90;
                                max = 0;
                            };

                            headRot = {
                                multiplayer = 0.05;
                                min = -90;
                                max = 0;
                            };
                        };

                        horizontal = {
                            min = -150;
                            neutral = -10;
                            max = 35;

                            bodyX = {
                                multiplayer = 80;
                                min = -150;
                                max = 0;
                            };
                        };
                    };
                };
            };

            callbacks = {
                onPhysicPerformed = function (self, model)
                    if model == models.models.main.Avatar.Head.BackHair then
                        local rot = math.deg(math.asin(player:getLookDir().y)) - model:getRot().x
                        if rot < 0 then
                            models.models.main.Avatar.Head.BackHair:setOffsetPivot(0, 0, 2)
                        else
                            models.models.main.Avatar.Head.BackHair:setOffsetPivot()
                        end
                    end
                end
            };
        }

        instance.dataSync = {
            syncData = {

            };

            callbacks = {

            };
        }

        return instance
    end;

    ---初期化関数
    ---@param self BlueArchiveCharacter
    init = function (self)
        AvatarModule.init(self)

        --生徒固有初期化処理
        --Player APIにアクセスする場合は、ENTITY_INIT後に実行されるようにする必要がある。

        models.models.ex_skill_1.Tank:setColor(1, 1, 1)
        for _, modelPart in ipairs({models.models.ex_skill_1.Tank.TankBody.PSLogo1, models.models.ex_skill_1.Tank.TankBody.Turret.PSLogo2, models.models.ex_skill_1.Tank.TankBody.Turret.PSLogo3}) do
            modelPart:newText("toramaru_logo_text"):setText("§e万魔殿"):setPos(0, 2.25, 0):setScale(0.2):setAlignment("CENTER"):setOutline(true):setOutlineColor(0.404, 0.306, 0.051)
        end
        models.models.ex_skill_1.Tank.TankBody.Turret.Cannon.HangingSign:setPrimaryTexture("RESOURCE", "minecraft:textures/entity/signs/hanging/oak.png")
        models.models.ex_skill_1.Tank.TankBody.Turret.Cannon.HangingSign:newText("toramaru_sign_text_1"):setText("§0§l巡回中"):setPos(-1, -9, 0.5):setRot(0, 90, 0):setScale(0.5):setAlignment("CENTER")
        models.models.ex_skill_1.Tank.TankBody.Turret.Cannon.HangingSign:newText("toramaru_sign_text_2"):setText("§0§l巡回中"):setPos(1, -9, -0.5):setRot(0, -90, 0):setScale(0.5):setAlignment("CENTER")

        self.parent.avatarEvents.SCRIPT_INIT:register(function ()
            for i = 0, 1 do
                for j = 0, 9 do
                    models.models.ex_skill_1.Tank.TankBody.BaseBase1:newBlock("toramaru_log_"..(i * 10 + j)):setBlock(self.parent.compatibilityUtils:checkBlock("minecraft:oak_log").."[axis=z]"):setPos(36 + i * -80, -2, j * 8 - 41):setScale(0.5)
                end
            end

            if host:isHost() then
                local localeStrings = {
                    {"key_name.tank_shoot", "Main gun aim, fire", "主砲照準、発射"};
                    {"tank_shoot.in_cool_down_pre", "Please wait ", "あと"};
                    {"tank_shoot.in_cool_down_post", " more seconds to shoot a shell.", "秒待ってください。"};
                    {"tank_shoot.tip_pre", "9§l[TIP]§r Press ", "§9§l[TIP]§r "};
                    {"tank_shoot.tip_post", " key to shoot a shell!", "キーを押すと砲弾を発射します！"};
                }

                for _, localeSet in ipairs(localeStrings) do
                    self.parent.locale.localeData.en_us[localeSet[1]] = localeSet[2]
                    self.parent.locale.localeData.ja_jp[localeSet[1]] = localeSet[3]
                end

                self.parent.keyManager:register("tank_shoot", "key.keyboard.v"):setOnPress(function ()
                    if self.costume.costumes[1].isRidingTank and self.costume.costumes[1].tankTick >= 36 and models.models.ex_skill_1.Tank:getColor() == vectors.vec3(1, 1, 1) then
                        if self.costume.costumes[1].shootCooldown == 0 then
                            pings.tankShoot()
                        else
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.note_block.bass"), player:getPos(), 1, 0.5)
                            print(self.parent.locale:getLocale("tank_shoot.in_cool_down_pre")..math.ceil(self.costume.costumes[1].shootCooldown / 20)..self.parent.locale:getLocale("tank_shoot.in_cool_down_post"))
                        end
                    end
                end)
            end
        end)

        events.TICK:register(function ()
            if not client:isPaused() then
                local vehicle = player:getVehicle()
                self.costume.costumes[1].isRidingTank = false
                self.costume.costumes[1].hasIbuki = false
                if vehicle ~= nil then
                    local passengers = vehicle:getPassengers()
                    local controlledPassenger = vehicle:getControllingPassenger()
                    local avatarVars = world.avatarVars()
                    self.costume.costumes[1].hasIbuki = passengers[2] ~= nil and passengers[2]:hasAvatar() and avatarVars[passengers[2]:getUUID()].FBAC_Ibuki
                    self.costume.costumes[1].isRidingTank = vehicle:getType() == "minecraft:camel" and controlledPassenger ~= nil and controlledPassenger:getName() == player:getName() and (#passengers == 1 or self.costume.costumes[1].hasIbuki) and self.parent.actionWheel.shouldReplaceVehicleModels and player:getHealth() > 0
                end
                if self.costume.costumes[1].isRidingTank ~= self.costume.costumes[1].isRidingTankPrev then
                    if self.costume.costumes[1].isRidingTank then
                        renderer:setRenderVehicle(false)
                        models.models.ex_skill_1.Tank:setVisible(true)
                        models.models.main.Avatar:setPos(-13, 16, 4)
                        models.models.ex_skill_1.Tank:setOffsetPivot(0, 0, 8)
                        self.parent.cameraManager:setThirdPersonCameraDistance(8)
                        self.parent.arms:setArmState(0, 0)
                        animations["models.main"]["tank_start"]:play()
                        animations["models.main"]["tank_idle"]:play()
                        for _, animationName in ipairs({"tank_start", "tank_move"}) do
                            animations["models.ex_skill_1"][animationName]:play()
                        end
                        self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "CLOSED", 35, true)
                        sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.iron_trapdoor.open"), player:getPos(), 1, 0.5)
                        self.costume.costumes[1].tankVelocity = vectors.rotateAroundAxis(vehicle:getRot().y * -1, 0, 0, 1, 0, 1, 0)
                        avatar:store("isEngineActive", false)
                        avatar:store("engineAnimTime", 0)
                        events.TICK:register(function ()
                            if not client:isPaused() then
                                local camelRot = vehicle:getRot().y % 360
                                table.insert(self.costume.costumes[1].camelRotData, camelRot)
                                table.remove(self.costume.costumes[1].camelRotData, 1)
                                local velocity = vehicle:getVelocity():mul(1, 0, 1)
                                local camelVelocity = velocity:length()
                                if camelVelocity > 0.01 then
                                    self.costume.costumes[1].tankVelocity = vectors.rotateAroundAxis(camelRot * -1, 0, 0, 1, 0, 1, 0)
                                end
                                local isEngineActive = self.costume.costumes[1].isRidingTank and (player:getPos():sub(vehicle:getPos()):length() - 1.51017) * -1.35 < 1 and models.models.ex_skill_1.Tank:getColor() == vectors.vec3(1, 1, 1)
                                if isEngineActive and not self.costume.costumes[1].isEngineActivePrev then
                                    animations["models.main"]["tank_idle_powered"]:play()
                                    animations["models.ex_skill_1"]["tank_idle"]:play()
                                    avatar:store("isEngineActive", true)
                                elseif not isEngineActive and self.costume.costumes[1].isEngineActivePrev then
                                    animations["models.main"]["tank_idle_powered"]:stop()
                                    animations["models.ex_skill_1"]["tank_idle"]:stop()
                                    avatar:store("isEngineActive", false)
                                end
                                if isEngineActive then
                                    avatar:store("engineAnimTime", animations["models.main"]["tank_idle_powered"]:getTime())
                                end
                                animations["models.ex_skill_1"]["tank_move"]:setSpeed(self.parent.physics.velocityAverage[5][2] * 2.5)
                                local beltOffset = math.floor(animations["models.ex_skill_1"]["tank_move"]:getTime() * 32) % 2
                                for _, modelPart in ipairs({models.models.ex_skill_1.Tank.RightCrawler.RightCrawlerBelt, models.models.ex_skill_1.Tank.LeftCrawler.LeftCrawlerBelt}) do
                                    modelPart:setUVPixels(0, beltOffset)
                                end
                                if self.parent.faceParts.blinkCount == 0 and self.parent.faceParts.emotionCount == 0 then
                                    self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "CLOSED", 2, true)
                                else
                                    self.parent.faceParts:setEmotion("NORMAL", "INVERTED", "CLOSED", 1)
                                end
                                if self.costume.costumes[1].tankTick == 36 then
                                    if self.parent.gun.currentGunPosition == "RIGHT" then
                                        self.parent.arms:setArmState(4, 5)
                                    elseif self.parent.gun.currentGunPosition == "LEFT" then
                                        self.parent.arms:setArmState(5, 4)
                                    end
                                    if host:isHost() and not self.costume.costumes[1].isTipShowed then
                                        print(self.parent.locale:getLocale("tank_shoot.tip_pre")..self.parent.keyManager.keyMappings["tank_shoot"].keybind:getKeyName()..self.parent.locale:getLocale("tank_shoot.tip_post"))
                                        self.costume.costumes[1].isTipShowed = true
                                    end
                                end
                                if self.costume.costumes[1].tankTick % 2 == 0 and isEngineActive then
                                    sounds:playSound(self.parent.compatibilityUtils:checkSound(self.costume.costumes[1].tankTick % 4 == 0 and "minecraft:block.piston.extend" or "minecraft:block.piston.contract"), vehicle:getPos(), 0.02, 0.5)
                                end
                                local health = vehicle:getNbt().Health
                                if health < 16 then
                                    local playerPos = player:getPos()
                                    local bodyYaw = player:getBodyYaw()
                                    if health < 8 then
                                        particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:flame"), playerPos:copy():add(vectors.rotateAroundAxis(bodyYaw * -1 , math.random() * 5 - 2.5, math.random() * 3 - 1.5, math.random() * 7 - 3.5, 0, 1, 0)))
                                    end
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:large_smoke"), playerPos:copy():add(vectors.rotateAroundAxis(bodyYaw * -1 , math.random() * 5 - 2.5, math.random() * 3 - 1.5, math.random() * 7 - 3.5, 0, 1, 0)))
                                end
                                if self.costume.costumes[1].hasIbuki ~= self.costume.costumes[1].hadIbukiPrev then
                                    if self.costume.costumes[1].hasIbuki then
                                        animations["models.ex_skill_1"]["tank_ibuki_start"]:setSpeed(1)
                                        animations["models.ex_skill_1"]["tank_ibuki_start"]:play()
                                        sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.iron_trapdoor.open"), player:getPos(), 1, 1.5)
                                    else
                                        animations["models.ex_skill_1"]["tank_ibuki_start"]:setSpeed(-1)
                                        sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.iron_trapdoor.close"), player:getPos(), 1, 1.5)
                                    end
                                end
                                self.costume.costumes[1].tankTick = self.costume.costumes[1].isRidingTank and self.costume.costumes[1].tankTick + 1 or 0
                                self.costume.costumes[1].isEngineActivePrev = isEngineActive
                                self.costume.costumes[1].hadIbukiPrev = self.costume.costumes[1].hasIbuki
                            end
                        end, "tank_tick")
                        events.RENDER:register(function (delta)
                            if not client:isPaused() then
                                local camelRot = math.abs(self.costume.costumes[1].camelRotData[1] - self.costume.costumes[1].camelRotData[2]) <= 180 and self.costume.costumes[1].camelRotData[2] + ((self.costume.costumes[1].camelRotData[2] - self.costume.costumes[1].camelRotData[1]) * delta) or self.costume.costumes[1].camelRotData[2]
                                local camelVelocity = vehicle:getVelocity():mul(1, 0, 1):length()
                                local baseRot = camelRot - (math.deg(math.atan2(self.costume.costumes[1].tankVelocity.z, self.costume.costumes[1].tankVelocity.x)) - 90) % 360
                                local lookDir = player:getLookDir()
                                local turretRot = math.clamp(math.deg(math.asin(lookDir.y)), -15, 25)
                                local heightOffset = (player:getPos(delta):sub(vehicle:getPos(delta)):length() - 1.51017) * -1.35
                                models.models.main.Avatar:setPos(-13, 16 + heightOffset * 16, 4)
                                models.models.ex_skill_1.Tank:setPos(0, -24.5 + heightOffset * 16, 0)
                                models.models.ex_skill_1.Tank.TankBody.Turret.Cannon:setRot(turretRot, 0, 0)
                                models.models.ex_skill_1.Tank.TankBody.Turret.Cannon.HangingSign:setRot(turretRot * -1, 0, 0)
                                if camelVelocity > 0.01 then
                                    for _, modelPart in ipairs({models.models.ex_skill_1.Tank, models.models.ex_skill_1.Tank.TankBody.Turret}) do
                                        modelPart:setRot()
                                    end
                                else
                                    models.models.ex_skill_1.Tank:setRot(0, baseRot, 0)
                                    models.models.ex_skill_1.Tank.TankBody.Turret:setRot(0, baseRot * -1, 0)
                                end

                                local bodyYaw = player:getBodyYaw(delta)
                                if renderer:isFirstPerson() then
                                    renderer:setCameraPos(-0.75, 0, 0)
                                    self.parent.cameraManager.setCameraPivot(vectors.vec3(math.sin(math.rad(bodyYaw)) * 0.2, 1 + heightOffset, math.cos(math.rad(bodyYaw)) * -0.2))
                                    renderer:setEyeOffset(vectors.rotateAroundAxis(bodyYaw * -1, 0.8, 1 + heightOffset, 0.2, 0, 1, 0))
                                else
                                    self.parent.cameraManager.setCameraPivot(vectors.vec3(0, heightOffset * 0.75, 0))
                                    renderer:setEyeOffset(0, heightOffset * 0.75, 0)
                                end
                            end
                        end, "tank_render")

                        events.ON_PLAY_SOUND:register(function (id, pos, _, _, _, _, path)
                            if pos:copy():sub(vehicle:getPos()):length() < 2 and path ~= nil then
                                if id:match("^minecraft:entity.camel") ~= nil or id == "minecraft:entity.horse.land" then
                                    if id == "minecraft:entity.camel.step" then
                                        sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.wool.step"), pos, 0.25, 1)
                                    elseif id == "minecraft:entity.horse.land" then
                                        sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.wool.step"), pos, 1, 1)
                                    elseif id == "minecraft:entity.camel.dash" then
                                        sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.blaze.hurt"), pos, 1, 1.5)
                                    elseif id == "minecraft:entity.camel.dash_ready" then
                                        sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.dispenser.fail"), pos, 1, 2)
                                    elseif id == "minecraft:entity.camel.hurt" then
                                        sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.anvil.place"), pos, 1, 2)
                                    elseif id == "minecraft:entity.camel.death" then
                                        models.models.ex_skill_1.Tank:setColor(0.2, 0.2, 0.2)
                                        for _, modelPart in ipairs({models.models.ex_skill_1.Tank.TankBody.PSLogo1, models.models.ex_skill_1.Tank.TankBody.Turret.PSLogo2, models.models.ex_skill_1.Tank.TankBody.Turret.PSLogo3}) do
                                            modelPart:getTask("toramaru_logo_text"):setText("§0万魔殿"):setOutlineColor(0, 0, 0)
                                        end
                                        for i = 0, 1 do
                                            for j = 0, 9 do
                                                models.models.ex_skill_1.Tank.TankBody.BaseBase1:getTask("toramaru_log_"..(i * 10 + j)):setLight(0)
                                            end
                                        end
                                        local playerPos = player:getPos()
                                        local bodyYaw = player:getBodyYaw()
                                        particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:explosion_emitter"), playerPos)
                                        for _ = 0, 50 do
                                            local offsetPos = vectors.rotateAroundAxis(bodyYaw * -1 , math.random() * 5 - 2.5, math.random() * 3 - 1.5, math.random() * 7 - 3.5, 0, 1, 0)
                                            particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:poof"), playerPos:copy():add(offsetPos)):setColor(vectors.vec3(1, 1, 1):scale(math.random() * 0.1 + 0.2)):setScale(5):setVelocity(offsetPos:copy():scale(0.05))
                                        end
                                        sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.generic.explode"), pos, 1, 1)
                                        self.parent.bubble:play("SWEAT", 20, vectors.vec2(), 40, false)
                                    end
                                    return true
                                end
                            end
                        end, "tank_on_play_sound")
                    else
                        events.TICK:remove("tank_tick")
                        events.RENDER:remove("tank_render")
                        events.ON_PLAY_SOUND:remove("tank_on_play_sound")
                        renderer:setRenderVehicle(true)
                        models.models.ex_skill_1.Tank:setVisible(false)
                        for _, modelPart in ipairs({models.models.ex_skill_1.Tank, models.models.ex_skill_1.Tank.TankBody.Turret, models.models.ex_skill_1.Tank.TankBody.Turret.Cannon}) do
                            modelPart:setPos()
                            modelPart:setRot()
                        end
                        models.models.ex_skill_1.Tank.TankBody.Turret.Cannon.HangingSign:setRot()
                        models.models.ex_skill_1.Tank:setColor(1, 1, 1)
                        for _, modelPart in ipairs({models.models.ex_skill_1.Tank.TankBody.PSLogo1, models.models.ex_skill_1.Tank.TankBody.Turret.PSLogo2, models.models.ex_skill_1.Tank.TankBody.Turret.PSLogo3}) do
                            modelPart:getTask("toramaru_logo_text"):setText("§e万魔殿"):setOutlineColor(0.404, 0.306, 0.051)
                        end
                        for i = 0, 1 do
                            for j = 0, 9 do
                                models.models.ex_skill_1.Tank.TankBody.BaseBase1:getTask("toramaru_log_"..(i * 10 + j)):setLight()
                            end
                        end
                        models.models.main.Avatar:setPos()
                        self.parent.cameraManager:setThirdPersonCameraDistance(4)
                        self.parent.cameraManager.setCameraPivot()
                        renderer:setEyeOffset()
                        for _, animationName in ipairs({"tank_start", "tank_idle", "tank_idle_powered", "tank_shoot_right", "tank_shoot_left"}) do
                            animations["models.main"][animationName]:stop()
                        end
                        for _, animationName in ipairs({"tank_start", "tank_idle", "tank_move", "tank_shoot"}) do
                            animations["models.ex_skill_1"][animationName]:stop()
                        end
                        if self.parent.gun.currentGunPosition == "RIGHT" then
                            self.parent.arms:setArmState(1, 2)
                        elseif self.parent.gun.currentGunPosition == "LEFT" then
                            self.parent.arms:setArmState(2, 1)
                        end
                        avatar:store("isEngineActive", false)
                        avatar:store("engineAnimTime", 0)
                        self.costume.costumes[1].tankTick = 0
                        self.costume.costumes[1].shootTick = -1
                        self.costume.costumes[1].isEngineActivePrev = false
                        self.costume.costumes[1].hadIbukiPrev = false
                    end
                end

                if self.costume.costumes[1].shootTick >= 0 then
                    self.costume.costumes[1].shootTick = self.costume.costumes[1].shootTick + 1
                    if self.costume.costumes[1].shootTick == 13 then
                        local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_1.Tank.TankBody.Turret.Cannon.MuzzleAnchor1)
                        self.parent.shellManager:spawn(anchorPos, vectors.vec3(models.models.ex_skill_1.Tank.TankBody.Turret.Cannon:getRot().x * -1, player:getBodyYaw() * -1, 0))
                        for _ = 1, 10 do
                            particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:large_smoke"), anchorPos:copy():add(math.random() - 0.5, math.random() - 0.5, math.random() - 0.5)):setScale(2)
                        end
                        sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.firework_rocket.large_blast"), player:getPos(), 1, 1)
                    elseif self.costume.costumes[1].shootTick == 38 then
                        events.RENDER:remove("tank_shoot_render")
                        self.costume.costumes[1].shootTick = -1
                    end
                end
                self.costume.costumes[1].isRidingTankPrev = self.costume.costumes[1].isRidingTank
                self.costume.costumes[1].shootCooldown = math.max(self.costume.costumes[1].shootCooldown - 1, 0)
            end
        end)

        avatar:store("FBAC_Iroha", true)
    end;
}

---虎丸の弾を発射する。
function pings.tankShoot()
    animations["models.main"]["tank_shoot"]:play()
    animations["models.main"]["tank_shoot_"..(player:isLeftHanded() and "left" or "right")]:play()
    animations["models.ex_skill_1"]["tank_shoot"]:play()
    AvatarInstance.faceParts:setEmotion("ANGRY", "ANGRY_INVERTED", "CLOSED", 38, true)
    events.RENDER:register(function (delta, ctx, matrix)
        models.models.ex_skill_1.Tank:setPos(0, models.models.ex_skill_1.Tank:getPos().y, models.models.ex_skill_1.ShootAnimAnchor:getAnimPos().z)
    end, "tank_shoot_render")
    AvatarInstance.characterData.costume.costumes[1].shootTick = 0
    AvatarInstance.characterData.costume.costumes[1].shootCooldown = 100
end