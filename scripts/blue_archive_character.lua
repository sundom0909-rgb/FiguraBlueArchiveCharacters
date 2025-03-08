---@alias BlueArchiveCharacter.RightEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "NARROW" # 少し閉じた目
---| "CLOSED2" # 閉じた目2
---| "STARE" # 凝視目（Exスキル1の最後の目）

---@alias BlueArchiveCharacter.LeftEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "NARROW" # 少し閉じた目
---| "CLOSED2" # 閉じた目2
---| "STARE" # 凝視目（Exスキル1の最後の目）
---| "CENTER" # 少し反対側を見る目

---@alias BlueArchiveCharacter.MouthTextures
---| "NORMAL" # 通常
---| "CLOSED" # 閉じた口
---| "SMILE" # にっこり
---| "SMALL" # 小さく開いた口
---| "OPENED" # 開いた口

---@alias BlueArchiveCharacter.GunPutType
---| "BODY" # アバターのBodyに銃を移動させる
---| "HIDDEN" # 銃を隠す

---@alias BlueArchiveCharacter.FormationType
---| "STRIKER" # ストライカー（前衛）
---| "SPECIAL" # スペシャル（後方支援）

---@alias BlueArchiveCharacter.Costumes
---| "DEFAULT" # デフォルト衣装
---| "MAID" # メイド衣装

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
                en_us = "Aris";
                ja_jp = "アリス";
            };

            lastName = {
                en_us = "Tendo";
                ja_jp = "天童";
            };

            clubName = {
                en_us = "Game Development Department";
                ja_jp = "ゲーム開発部";
            };

            birth = {
                month = 3;
                day = 25;
            };
        }

        instance.faceParts = {
            rightEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(2, 0); --必須
                TIRED = vectors.vec2(3, 0); --必須
                CLOSED = vectors.vec2(4, 0); --必須
                NARROW = vectors.vec2(5, 0);
                CLOSED2 = vectors.vec2(7, 0);
                STARE = vectors.vec2(8, 0);
            };

            leftEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(1, 0); --必須
                TIRED = vectors.vec2(2, 0); --必須
                CLOSED = vectors.vec2(3, 0); --必須
                NARROW = vectors.vec2(5, 0);
                CLOSED2 = vectors.vec2(6, 0);
                STARE = vectors.vec2(7, 0);
                CENTER = vectors.vec2(8, 0);
            };

            mouth = {
                CLOSED = vectors.vec2(0, 0);
                SMILE = vectors.vec2(1, 0);
                SMALL =  vectors.vec2(2, 0);
                OPENED = vectors.vec2(3, 0);
            };
        }

        instance.arms = {
            callbacks = {
                onArmStateChanged = function (self, right, left)
                    if right == 3 and self.parent.gun.currentGunPosition == "RIGHT" then
                        return {right = 1}
                    elseif left == 3 and self.parent.gun.currentGunPosition == "LEFT" then
                        return {left = 1}
                    end
                end;

                onAdditionalRightArmProcess = function (self, state)
                    if state == 1 then
                        events.RENDER:remove("right_arm_render")
                        events.RENDER:register(function (delta)
                            local headRot = vanilla_model.HEAD:getOriginRot()
                            local rotY = headRot.y % 360
                            rotY = rotY > 180 and 0 or rotY
                            models.models.main.Avatar.UpperBody.Arms.RightArm:setRot(player:isSwingingArm() and not player:isLeftHanded() and vectors.vec3() or vectors.vec3(math.max(headRot.x - 40 + (player:isCrouching() and 30 or 0), -40) + math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * 2.5, rotY, 0))
                        end, "right_arm_render")
                    elseif state == 2 then
                        events.RENDER:remove("right_arm_render")
                        events.RENDER:register(function (delta, context)
                            local headRot = vanilla_model.HEAD:getOriginRot()
                            local isSwingingArm = player:isSwingingArm() and not player:isLeftHanded()
                            models.models.main.Avatar.UpperBody.Arms.RightArm:setParentType((isSwingingArm or context == "FIRST_PERSON") and "RightArm" or "Body")
                            models.models.main.Avatar.UpperBody.Arms.RightArm:setRot(isSwingingArm and vectors.vec3() or vectors.vec3(math.max(headRot.x + 50 + (player:isCrouching() and 30 or 0), 40), math.min(math.map((headRot.y + 180) % 360 - 180, -50, 50, -21, 78) + 30, 65) + math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * 2.5, 0))
                        end, "right_arm_render")
                    end
                end;

                onAdditionalLeftArmProcess = function (self, state)
                    if state == 1 then
                        events.RENDER:remove("left_arm_render")
                        events.RENDER:register(function (delta)
                            local headRot = vanilla_model.HEAD:getOriginRot()
                            local rotY = headRot.y % 360
                            rotY = rotY < 180 and 0 or rotY
                            models.models.main.Avatar.UpperBody.Arms.LeftArm:setRot(player:isSwingingArm() and player:isLeftHanded() and vectors.vec3() or vectors.vec3(math.max(headRot.x - 40 + (player:isCrouching() and 30 or 0), -40) + math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * -2.5, rotY, 0))
                        end, "left_arm_render")
                    elseif state == 2 then
                        events.RENDER:remove("left_arm_render")
                        events.RENDER:register(function (delta, context)
                            local headRot = vanilla_model.HEAD:getOriginRot()
                            local isSwingingArm = player:isSwingingArm() and player:isLeftHanded()
                            models.models.main.Avatar.UpperBody.Arms.LeftArm:setParentType((isSwingingArm or context == "FIRST_PERSON") and "LeftArm" or "Body")
                            models.models.main.Avatar.UpperBody.Arms.LeftArm:setRot(isSwingingArm and vectors.vec3() or vectors.vec3(math.max(headRot.x + 50 + (player:isCrouching() and 30 or 0), 40), math.max(math.map((headRot.y + 180) % 360 - 180, -50, 50, -78, 21) - 30, -65) + math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * -2.5, 0))
                        end, "left_arm_render")
                    end
                end;
            };
        }

        instance.skirt = {
            skirtModels = {models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1};
        }

        instance.gun = {
            scale = 2.2;

            gunPosition = {
                hold = {
                    firstPersonPos = {
                        right = vectors.vec3(6, 0, 0);
                        left = vectors.vec3(-6, 0, 0);
                    };

                    firstPersonRot = {
                        right = vectors.vec3(0, 2, 0);
                        left = vectors.vec3(0, -2, 0);
                    };

                    thirdPersonPos = {
                        right = vectors.vec3(0, 10, 0);
                        left = vectors.vec3(0, 10, 0);
                    };

                    thirdPersonRot = {
                        right = vectors.vec3(130, 0, 0);
                        left = vectors.vec3(130, 0, 0);
                    };
                };

                put = {
                    type = "BODY";

                    pos = {
                        right = vectors.vec3(0, 1.5, 6);
                        left = vectors.vec3(0, 1.5, 6);
                    };

                    rot = {
                        right = vectors.vec3(0, -90, -32.5);
                        left = vectors.vec3(0, 90, 32.5);
                    };
                };
            };

            sound = {
                name = "minecraft:entity.blaze.hurt";
                pitch = 2;
            };
        }

        instance.placementObjects = {
            {
                model = models.models.placement_object.PlacementObject;

                boundingBox = {
                    size = vectors.vec3(8, 8, 8)
                };

                placementMode = "COPY";
            };
        }

        instance.exSkill = {
            {
                name = {
                    en_us = "I'm breaking the world's rules!";
                    ja_jp = "世界の 法則が 崩壊します！";
                };

                formationType = "STRIKER";

                models = {models.models.main.Avatar.UpperBody.Body.Gun.LightEffect, models.models.ex_skill_1.BodySignages, models.models.ex_skill_1.Gui};

                animations = {"main", "gun", "ex_skill_1"};

                camera = {
                    start = {
                        rot = vectors.vec3(0, 198, 0);
                        pos = vectors.vec3(-14.8, 10.25, -12.5);
                    };

                    fin = {
                        rot = vectors.vec3(10, 180, 0);
                        pos = vectors.vec3(0, 25.8, -28.4);
                    };
                };

                callbacks = {
                    onPreAnimation = function (self)
                        if not self.exSkill[1].init then
                            models.models.ex_skill_1.SideHUDs.SideHUDBackground:setOpacity(0.5)
                            models.models.ex_skill_1.SideHUDs.SideHUDContents:newText("ex_skill_1_text_1"):setText("§bARIS"):setPos(0.05, 1.75, 0):setRot(0, -90, 0):setScale(0.075, 0.075, 1):setAlignment("CENTER"):setShadow(true):setLight(15)
                            models.models.ex_skill_1.SideHUDs.SideHUDContents:newText("ex_skill_1_text_2"):setText("Model complexity:"):setPos(0.05, 1.1, 2.5):setRot(0, -90, 0):setScale(0.05, 0.05, 1):setAlignment("LEFT"):setShadow(true):setLight(15)
                            models.models.ex_skill_1.SideHUDs.SideHUDContents:newText("ex_skill_1_text_3"):setText("§e> §cnil"):setPos(0.05, 0.65, 2.3):setRot(0, -90, 0):setScale(0.05, 0.05, 1):setAlignment("LEFT"):setShadow(true):setLight(15)
                            models.models.ex_skill_1.SideHUDs.SideHUDContents:newText("ex_skill_1_text_4"):setText("Tick instructions:"):setPos(0.05, 0.1, 2.5):setRot(0, -90, 0):setScale(0.05, 0.05, 1):setAlignment("LEFT"):setShadow(true):setLight(15)
                            models.models.ex_skill_1.SideHUDs.SideHUDContents:newText("ex_skill_1_text_5"):setText("§e> §cnil"):setPos(0.05, -0.35, 2.3):setRot(0, -90, 0):setScale(0.05, 0.05, 1):setAlignment("LEFT"):setShadow(true):setLight(15)
                            models.models.ex_skill_1.SideHUDs.SideHUDContents:newText("ex_skill_1_text_6"):setText("Render instructions:"):setPos(0.05, -0.9, 2.5):setRot(0, -90, 0):setScale(0.05, 0.05, 1):setAlignment("LEFT"):setShadow(true):setLight(15)
                            models.models.ex_skill_1.SideHUDs.SideHUDContents:newText("ex_skill_1_text_7"):setText("§e> §cnil"):setPos(0.05, -1.35, 2.3):setRot(0, -90, 0):setScale(0.05, 0.05, 1):setAlignment("LEFT"):setShadow(true):setLight(15)
                            ---@diagnostic disable-next-line: discard-returns
                            models:newPart("script_ex_skill_1")
                            models.script_ex_skill_1:addChild(models.models.main.Avatar:copy("exSkill1Outline"))
                            models.script_ex_skill_1.exSkill1Outline:setVisible(false)
                            models.script_ex_skill_1.exSkill1Outline:setOffsetPivot(0, 16, 0)
                            models.script_ex_skill_1.exSkill1Outline:setScale(1.35, 1.3, 1.35)
                            models.script_ex_skill_1.exSkill1Outline:setPrimaryTexture("CUSTOM", textures["textures.ex_skill_1_white"])
                            models.script_ex_skill_1.exSkill1Outline:setPrimaryRenderType("EMISSIVE_SOLID")
                            models.script_ex_skill_1.exSkill1Outline:setColor(0.988, 0.522, 1)
                            self.exSkill[1].init = true
                        end
                        events.RENDER:register(function (delta)
                            if host:isHost() then
                                models.models.ex_skill_1.Gui.ScreenFilter:setOpacity(models.models.ex_skill_1.Gui.ScreenFilterOpacity:getAnimScale().x)
                                if models.models.ex_skill_1.CameraBackground:getVisible() then
                                    local opacity = models.models.ex_skill_1.CameraBackground.BackgroundOpacity:getAnimScale().x
                                    models.models.ex_skill_1.CameraBackground:setOpacity(opacity)
                                    models.models.ex_skill_1.CameraBackground:setColor(vectors.vec3(1, 1, 1):scale(opacity))
                                    local backgroundPos = vectors.rotateAroundAxis(player:getBodyYaw(delta) + 180, renderer:getCameraOffsetPivot():copy():add(0, 1.62, 0):add(client:getCameraDir():copy():scale(1.65)), 0, 1, 0):scale(16 / 0.9375)
                                    models.models.ex_skill_1.CameraBackground:setOffsetPivot(backgroundPos)
                                    models.models.ex_skill_1.CameraBackground.Background:setPos(backgroundPos)
                                    local windowSize = client:getWindowSize()
                                    models.models.ex_skill_1.CameraBackground.Background:setScale(vectors.vec3(windowSize.x / windowSize.y, 1, 1):scale(40))
                                end
                            end
                            if models.script_ex_skill_1.exSkill1Outline:getVisible() then
                                local animRot = models.models.main.Avatar:getAnimRot()
                                models.script_ex_skill_1.exSkill1Outline:setPos(vectors.rotateAroundAxis(player:getBodyYaw(delta) + 180, player:getPos(delta):add(0, 1, 0):sub(client:getCameraPos()):normalize(), 0, 1, 0):scale(10))
                                models.script_ex_skill_1.exSkill1Outline:setRot(animRot)
                            end
                        end, "ex_skill_1_render")
                        self.parent.railGun.chargePercent = 0
                        self.parent.railGun.chargeState = "STRONG"
                        self.parent.railGun.animationLength = 35
                        models.models.main.Avatar.UpperBody.Body.Gun.DisplayContents:setVisible(true)
                        self.parent.faceParts:setEmotion("NARROW", "NARROW", "CLOSED", 65, true)
                    end;

                    onAnimationTick = function (self, tick)
                        if tick == 0 then
                            models.models.main.Avatar.UpperBody.Body.Gun:setPos()
                            models.models.main.Avatar.UpperBody.Body.Gun:setRot()
                        elseif tick == 13 then
                            models.models.main.Avatar.UpperBody.Body.Gun.LightEffect:setOffsetPivot(0, 0, -1)
                        elseif tick == 16 then
                            local gunPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Body.Gun)
                            local axisZ = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Body.Gun.GunZ):sub(gunPos):normalize()
                            for _ = 1, 50 do
                                local anchorPos = gunPos:copy():add(axisZ:copy():scale(math.random() * 0.6 - 0.1))
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), anchorPos):setVelocity(vectors.rotateAroundAxis(math.random() * 360, 0, 0.1, 0, axisZ)):setColor(0.996, 0.859, 0.365)
                            end
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.chest.locked"), player:getPos(), 0.25, 2)
                        elseif tick == 26 or tick == 30 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.chest.locked"), player:getPos(), 0.25, 2)
                        elseif tick == 51 then
                            for _, modelPart in ipairs({models.models.main.Avatar.Head.EyeHUDs, models.models.ex_skill_1.SideHUDs}) do
                                modelPart:setVisible(true)
                            end
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.beacon.activate"), player:getPos(), 0.25, 5)
                        elseif tick == 57 then
                            models.models.ex_skill_1.SideHUDs.SideHUDContents:setVisible(true)
                        elseif tick == 65 then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "CLOSED", 7, true)
                        elseif tick == 68 and host:isHost() then
                            models.models.ex_skill_1.Gui.ScreenFilter:setScale(client:getScaledWindowSize():augmented(1))
                            models.models.ex_skill_1.CameraBackground:setVisible(true)
                        elseif tick == 70 then
                            models.models.main.Avatar.Head.EyeHUDs.LeftEyeHUDs:setVisible(false)
                        elseif tick == 72 then
                            self.parent.faceParts:setEmotion("STARE", "STARE", "CLOSED", 28, true)
                            models.models.main.Avatar.Head.EyeLights:setColor(vectors.vec3(1, 1, 1):scale(client:hasShaderPack() and 0.75 or 1))
                            models.models.main.Avatar.Head.EyeLights:setVisible(true)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), player:getPos(), 1, 1.5)
                            models.script_ex_skill_1.exSkill1Outline:setVisible(true)
                        elseif tick == 76 and host:isHost() then
                            models.models.ex_skill_1.CameraBackground:setVisible(false)
                        end

                        if tick >= 57 and tick < 70 then
                            local modelComplexity = avatar:getComplexity()
                            local modelComplexityPercent = modelComplexity / avatar:getMaxComplexity()
                            models.models.ex_skill_1.SideHUDs.SideHUDContents:getTask("ex_skill_1_text_3"):setText("§e> §"..(modelComplexityPercent > 0.9 and "c" or (modelComplexityPercent > 0.75 and "e" or "a"))..modelComplexity)
                            local tickCount = avatar:getTickCount()
                            local tickCountPercent = tickCount / avatar:getMaxTickCount()
                            models.models.ex_skill_1.SideHUDs.SideHUDContents:getTask("ex_skill_1_text_5"):setText("§e> §"..(tickCountPercent > 0.9 and "c" or (tickCountPercent > 0.75 and "e" or "a"))..tickCount)
                            local renderCount = avatar:getRenderCount()
                            local renderCountPercent = renderCount / avatar:getMaxRenderCount()
                            models.models.ex_skill_1.SideHUDs.SideHUDContents:getTask("ex_skill_1_text_7"):setText("§e> §"..(renderCountPercent > 0.9 and "c" or (renderCountPercent > 0.75 and "e" or "a"))..renderCount)
                        elseif tick >= 70 then
                            local anchorPos = self.parent.modelUtils.getModelWorldPos(models.script_ex_skill_1.exSkill1Outline)
                            local particleVec = player:getPos():add(0, 1, 0):sub(anchorPos):normalize()
                            local particleRot = math.deg(math.atan2(particleVec.z, particleVec.x))
                            for _ = 1, 2 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:end_rod"), anchorPos:copy():add(vectors.rotateAroundAxis(particleRot * -1 + 90, math.random() * 2.4 - 1.2, math.random() * 2, 0, 0, 1, 0))):setScale(0.25):setVelocity(0, 0.1, 0):setColor(0.988, 0.522, 1)
                            end
                        end
                    end;

                    onPostAnimation = function (self, forcedStop)
                        if host:isHost() then
                            events.RENDER:remove("ex_skill_1_render")
                            if forcedStop then
                                models.models.ex_skill_1.CameraBackground:setVisible(false)
                            end
                        end
                        if self.parent.gun.currentGunPosition == "NONE" then
                            local isLeftHanded = player:isLeftHanded()
                            models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(0, 12, 0):add(self.gun.gunPosition.put.pos[isLeftHanded and "left" or "right"]))
                            models.models.main.Avatar.UpperBody.Body.Gun:setRot(self.gun.gunPosition.put.rot[isLeftHanded and "left" or "right"])
                            models.models.main.Avatar.UpperBody.Body.Gun.DisplayContents:setVisible(false)
                        end
                        for _, modelPart in ipairs({models.models.main.Avatar.Head.EyeHUDs, models.models.ex_skill_1.SideHUDs, models.models.ex_skill_1.SideHUDs.SideHUDContents, models.models.main.Avatar.Head.EyeLights, models.script_ex_skill_1.exSkill1Outline}) do
                            modelPart:setVisible(false)
                        end
                        models.models.main.Avatar.Head.EyeHUDs.LeftEyeHUDs:setVisible(true)
                        models.models.main.Avatar.UpperBody.Body.Gun.LightEffect:setOffsetPivot()
                        if not forcedStop then
                            self.parent.railGun.isSpecialCharge = true
                        end
                    end;
                };

                ---このExスキルの初期化処理が行われたかどうか
                ---@type boolean
                init = false;
            };

            {
                name = {
                    ja_jp = "アリス、お掃除します！";
                    en_us = "Aris, clean up!";
                };

                formationType = "STRIKER";

                models = {models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Broom};

                animations = {"main", "gun", "costume_maid", "ex_skill_2"};

                camera = {
                    start = {
                        rot = vectors.vec3(0, 180, 0);
                        pos = vectors.vec3(-56, 11, -28);
                    };

                    fin = {
                        rot = vectors.vec3(-10, 180, -35);
                        pos = vectors.vec3(-335, 11.3, -30);
                    };
                };

                callbacks = {
                    onPreAnimation = function (self)
                        if not self.exSkill[2].init then
                            models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Broom.BroomBase:setPrimaryTexture("RESOURCE", "minecraft:textures/block/oak_planks.png")
                            if host:isHost() then
                                if client:getVersion() >= "1.20.2" then
                                    textures:fromVanilla("heart_base", "minecraft:textures/gui/sprites/hud/heart/container.png")
                                    textures:fromVanilla("heart", "minecraft:textures/gui/sprites/hud/heart/full.png")
                                else
                                    textures:fromVanilla("icons", "minecraft:textures/gui/icons.png")
                                end

                                ---@diagnostic disable-next-line: discard-returns
                                models:newPart("ex_skill_2_gui", "Gui")
                                ---@diagnostic disable-next-line: discard-returns
                                models.ex_skill_2_gui:newPart("hearts")
                                models.ex_skill_2_gui.hearts:setPos(-17.5, -17.5, 0)
                                for i = 1, 3 do
                                    local baseSprite = models.ex_skill_2_gui.hearts:newSprite("ex_skill_2_heart_"..i.."_base")
                                    if textures.heart_base ~= nil then
                                        baseSprite:setTexture(textures.heart_base)
                                        baseSprite:setDimensions(9, 9)
                                        baseSprite:setRegion(9, 9)
                                        baseSprite:setSize(18, 18)
                                    else
                                        baseSprite:setTexture(textures.icons)
                                        baseSprite:setDimensions(256, 256)
                                        baseSprite:setRegion(9, 9)
                                        baseSprite:setUVPixels(16, 0)
                                        baseSprite:setSize(18, 18)
                                    end
                                    baseSprite:setPos((i - 1) * -19, 0, 0)
                                    local heartSprite = models.ex_skill_2_gui.hearts:newSprite("ex_skill_2_heart_"..i)
                                    if textures.heart ~= nil then
                                        heartSprite:setTexture(textures.heart)
                                        heartSprite:setDimensions(9, 9)
                                        heartSprite:setRegion(9, 9)
                                        heartSprite:setSize(18, 18)
                                    else
                                        heartSprite:setTexture(textures.icons)
                                        heartSprite:setDimensions(256, 256)
                                        heartSprite:setRegion(9, 9)
                                        heartSprite:setUVPixels(52, 0)
                                        heartSprite:setSize(18, 18)
                                    end
                                    heartSprite:setPos((i - 1) * -19, 0, 0)
                                end
                                ---@diagnostic disable-next-line: discard-returns
                                models.ex_skill_2_gui:newPart("coins")
                                models.ex_skill_2_gui.coins:addChild(models.models.ex_skill_2.Coin:copy("Coin"))
                                models.ex_skill_2_gui.coins.Coin:setPos(51, -11.5, 0)
                                models.ex_skill_2_gui.coins.Coin:setScale(1.6, 1.6, 1)
                                models.ex_skill_2_gui.coins.Coin:setPivot(0, 12, 0)
                                models.ex_skill_2_gui.coins.Coin:setPrimaryRenderType()
                                models.ex_skill_2_gui.coins.Coin:setVisible(true)
                                models.ex_skill_2_gui.coins:newText("ex_skill_2_coin_counter"):setText("215"):setPos(38, -1, 0):setScale(2, 2, 2):setOutline(true):setOutlineColor(0.35, 0.35, 0.35)
                            end
                            self.exSkill[2].init = true
                        elseif host:isHost() then
                            models.ex_skill_2_gui:setVisible(true)
                        end
                        if host:isHost() then
                            models.ex_skill_2_gui.coins:setPos(client:getScaledWindowSize().x * -1 + 17.5, -18.5, 0)
                        end
                        self.exSkill[2].coinCount = 215
                        for i = -1, 4 do
                            for j = 0, 18 do
                                self.parent.coinManager:spawn(vectors.vec3(j * 32 - 96, 0, i * 32))
                            end
                        end
                        self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "SMILE", 66, true)
                    end;

                    onAnimationTick = function (self, tick)
                        if tick == 0 then
                            models.models.main.Avatar.UpperBody.Body.Gun:setPos()
                            models.models.main.Avatar.UpperBody.Body.Gun:setRot()
                            models.models.main.Avatar.UpperBody.Body.Gun.DisplayContents:setVisible(false)
                        elseif tick == 66 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "SMILE", 4, true)
                        elseif tick == 70 then
                            self.parent.faceParts:setEmotion("NORMAL", "CENTER", "SMALL", 15, true)
                        elseif tick == 80 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 0.5, 1.25)
                        elseif tick == 85 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "SMALL", 2, true)
                        elseif tick == 87 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "SMILE", 19, true)
                            self.exSkill[1].broomTipAnchorPosPrev = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Broom)
                        elseif tick >= 88 and tick < 92 then
                            local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Broom)
                            if tick == 88 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.bucket.empty"), anchorPos, 1, 0.75)
                            end
                            local directionVec = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Broom.BroomParticleNAnchor):copy():sub(anchorPos)
                            for i = -2, 2 do
                                local offsetPos = directionVec:copy():scale(i)
                                for j = 0, 1, 0.25 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:dust", "1 1 1 1"), anchorPos:copy():sub(self.exSkill[1].broomTipAnchorPosPrev):scale(j):add(anchorPos):add(offsetPos)):setScale(1.5):setColor(math.random() * 0.5 + 0.5, 1, 1)
                                end
                            end
                            self.exSkill[1].broomTipAnchorPosPrev = anchorPos:copy()
                        elseif tick == 92 then
                            if host:isHost() then
                                models.ex_skill_2_gui:setVisible(false)
                            end
                            models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Broom:moveTo(models.models.main.Avatar.UpperBody.Body)
                            self.parent.railGun.chargePercent = 0
                            self.parent.railGun.chargeState = "STRONG"
                            self.parent.railGun.animationLength = 20
                            models.models.main.Avatar.UpperBody.Body.Gun.DisplayContents:setVisible(true)
                        elseif tick == 106 then
                            self.parent.faceParts:setEmotion("NORMAL", "CENTER", "OPENED", 41, true)
                        elseif tick == 109 then
                            self.parent.coinManager:getAll()
                        elseif tick == 111 then
                            for _ = 1, 50 do
                                self.parent.cubeManager:spawn()
                            end
                        elseif tick == 118 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.note_block.bit"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 1, 1.5)
                        elseif tick == 120 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.note_block.bit"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 1, 1.75)
                        elseif tick == 122 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.note_block.bit"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 1, 2)
                        end

                        if tick < 61 then
                            if (tick - 1) % 2 == 0 then
                                self.parent.waterManager:spawn(self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Broom), vectors.rotateAroundAxis(player:getBodyYaw() * -1, -0.1, 0, 0, 0, 1, 0))
                            end
                            if tick % 8 == 0 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.cod.flop"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 0.25, 0.75)
                            end
                            for _ = 1, 3 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:splash"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Broom))
                            end
                        end
                        if tick < 92 and host:isHost() then
                            models.ex_skill_2_gui.coins:getTask("ex_skill_2_coin_counter"):setText(self.exSkill[2].coinCount)
                        end
                    end;

                    onPostAnimation = function (self, forcedStop)
                        if models.models.main.Avatar.UpperBody.Body.Broom ~= nil then
                            models.models.main.Avatar.UpperBody.Body.Broom:moveTo(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom)
                        end
                        if self.parent.gun.currentGunPosition == "NONE" then
                            local isLeftHanded = player:isLeftHanded()
                            models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(0, 12, 0):add(self.gun.gunPosition.put.pos[isLeftHanded and "left" or "right"]))
                            models.models.main.Avatar.UpperBody.Body.Gun:setRot(self.gun.gunPosition.put.rot[isLeftHanded and "left" or "right"])
                            models.models.main.Avatar.UpperBody.Body.Gun.DisplayContents:setVisible(false)
                        end
                        self.parent.cubeManager:removeAll()
                        if forcedStop then
                            self.parent.coinManager:removeAll()
                            self.parent.waterManager:removeAll()
                            if host:isHost() then
                                models.ex_skill_2_gui:setVisible(false)
                            end
                        else
                            self.parent.railGun.isSpecialCharge = true
                        end
                    end;
                };

                ---このExスキルの初期化処理が行われたかどうか
                ---@type boolean
                init = false;

                ---Exスキル中に表示されるコインカウンターの値
                ---@type integer
                coinCount = 215;

                ---前ティックの箒の先っちょの座標
                ---@type Vector3
                broomTipAnchorPosPrev = vectors.vec3()
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
                };

                {
                    name = "maid";

                    displayName = {
                        en_us = "Maid";
                        ja_jp = "メイド";
                    };

                    exSkill = 2;
                };
            };

            callbacks = {
                onChange = function (self)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.CMaidH, models.models.main.Avatar.UpperBody.Body.CMaidB}) do
                        modelPart:setVisible(true)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.SideTail, models.models.main.Avatar.Head.SideTailRibbon, models.models.main.Avatar.Head.HRibbon, models.models.main.Avatar.UpperBody.Body.Hairs, models.models.main.Avatar.UpperBody.Body.MillenniumLogo, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeve, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftSleeve}) do
                        modelPart:setVisible(false)
                    end
                    self.parent.costume.setCostumeTextureOffset(1)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.Head, models.models.main.Avatar.Head.HatLayer}) do
                        modelPart:setUVPixels(0, 16)
                    end
                end;

                onReset = function (self)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.SideTail, models.models.main.Avatar.Head.SideTailRibbon, models.models.main.Avatar.Head.HRibbon, models.models.main.Avatar.UpperBody.Body.Hairs, models.models.main.Avatar.UpperBody.Body.MillenniumLogo, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeve, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftSleeve}) do
                        modelPart:setVisible(true)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.CMaidH, models.models.main.Avatar.UpperBody.Body.CMaidB}) do
                        modelPart:setVisible(false)
                    end
                    self.parent.costume.setCostumeTextureOffset(0)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.Head, models.models.main.Avatar.Head.HatLayer}) do
                        modelPart:setUVPixels()
                    end
                end;

                onArmorChange = function (_, parts, isVisible)
                    if parts == "CHEST_PLATE" then
                        if isVisible then
                            models.models.main.Avatar.UpperBody.Body.Hairs.FrontHair:setPos(0, 0, -1)
                            models.models.main.Avatar.UpperBody.Body.Hairs.BackHair:setPos(0, 0, 1)
                        else
                            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Hairs.FrontHair, models.models.main.Avatar.UpperBody.Body.Hairs.BackHair}) do
                                modelPart:setPos()
                            end
                        end
                    elseif parts == "LEGGINGS" then
                        models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1:setVisible(not isVisible)
                    end
                end;
            };
        }

        instance.bubble = {

        }

        instance.headBlock = {
            includeModels = {models.models.main.Avatar.UpperBody.Body.Hairs, models.models.main.Avatar.UpperBody.Body.CMaidB.FrontHair};
        }

        instance.portrait = {
            includeModels = {};
        }

        instance.deathAnimation = {
            callbacks = {
                onPhase1 = function (_, dummyAvatar, costume)
                    if costume == "DEFAULT" then
                        dummyAvatar.Head.SideTail:setRot(30, 0, -10)
                        dummyAvatar.UpperBody.Body.Hairs.BackHair:setRot(-10, 0, 0)
                        dummyAvatar.UpperBody.Body.Hairs.BackHair.BackHairBottom:setRot(-80, 0, 0)
                        dummyAvatar.UpperBody.Body.Hairs.BackHair.BackHairBottom:setOffsetPivot(0, 0, -1)
                    else
                        dummyAvatar.Head.CMaidH.HairTail:setRot(10, 0, 0)
                        dummyAvatar.UpperBody.Body.CMaidB.Skirt1:setRot(35, 0, 0)
                    end
                end;

                onPhase2 = function (_, dummyAvatar, costume)
                    if costume == "DEFAULT" then
                        dummyAvatar.Head.SideTail:setRot(-25, 0, 0)
                        dummyAvatar.UpperBody.Body.Hairs.BackHair:setRot(-12.5, 0, -15)
                        dummyAvatar.UpperBody.Body.Hairs.BackHair.BackHairBottom:setRot()
                    else
                        dummyAvatar.Head.CMaidH.HairTail:setRot(-20, 0, 0)
                        dummyAvatar.UpperBody.Body.CMaidB.Skirt1:setRot(15, 0, 0)
                    end
                end;
            };
        }

        instance.actionWheel = {
            isVehicleOptionEnabled = false;
        }

        instance.physics = {
            physicData = {
                {
                    models = {models.models.main.Avatar.Head.SideTail};

                    x = {
                        vertical = {
                            min = -90;
                            neutral = 0;
                            max = 90;

                            headRotMultiplayer = -1;

                            headX = {
                                multiplayer = -80;
                                min = -90;
                                max = 90;
                            };
                        };

                        horizontal = {
                            min = -45;
                            neutral = 45;
                            max = 45;

                            headX = {
                                multiplayer = -40;
                                min = -45;
                                max = 45;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.SideTail.SideTail};

                    z = {
                        vertical = {
                            min = -170;
                            neutral = 0;
                            max = 0;

                            headZ = {
                                multiplayer = -40;
                                min = -60;
                                max = 0;
                            };

                            headRot = {
                                multiplayer = 0.025;
                                min = -60;
                                max = 0;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -170;
                                max = 0;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Hairs.FrontHair, models.models.main.Avatar.UpperBody.Body.CMaidB.FrontHair};

                    x = {
                        vertical = {
                            min = 0;
                            neutral = 0;
                            max = 80;
                            sneakOffset = 30;

                            bodyX = {
                                multiplayer = -80;
                                min = 0;
                                max = 80;
                            };

                            bodyY = {
                                multiplayer = -80;
                                min = 0;
                                max = 80;
                            };

                            bodyRot = {
                                multiplayer = -0.05;
                                min = 0;
                                max = 80;
                            };
                        };

                        horizontal = {
                            min = 0;
                            neutral = 80;
                            max = 80;

                            bodyX = {
                                multiplayer = -160;
                                min = 0;
                                max = 80;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Hairs.BackHair};

                    x = {
                        vertical = {
                            min = -170;
                            neutral = 0;
                            max = 0;

                            bodyX = {
                                multiplayer = -40;
                                min = -80;
                                max = 0;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -170;
                                max = 0;
                            };

                            bodyRot = {
                                multiplayer = 0.025;
                                min = -80;
                                max = 0;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CMaidH.HairTail};

                    x = {
                        vertical = {
                            min = -170;
                            neutral = 0;
                            max = 5;
                            sneakOffset = -20;

                            headRotMultiplayer = -1;

                            headX = {
                                multiplayer = -40;
                                min = -90;
                                max = 5;
                            };

                            headRot = {
                                multiplayer = 0.025;
                                min = -90;
                                max = 0;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -170;
                                max = 0;
                            };
                        };

                        horizontal = {
                            min = -135;
                            neutral = -30;
                            max = -25;

                            headX = {
                                multiplayer = -40;
                                min = -45;
                                max = -25;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CMaidH.HairTail.HairTailZPivot};

                    z = {
                        vertical = {
                            min = -80;
                            neutral = 0;
                            max = 80;

                            headZ = {
                                multiplayer = -40;
                                min = -80;
                                max = 80;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.CMaidB.BackRibbon.RibbonRight};

                    y = {
                        vertical = {
                            min = -70;
                            neutral = 0;
                            max = 0;

                            bodyX = {
                                multiplayer = -40;
                                min = -70;
                                max = 0;
                            };

                            bodyRot = {
                                multiplayer = 0.025;
                                min = -70;
                                max = 0;
                            };
                        };

                        horizontal = {
                            min = -70;
                            neutral = 0;
                            max = 0;

                            bodyY = {
                                multiplayer = 40;
                                min = -70;
                                max = 0;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.CMaidB.BackRibbon.RibbonRight.RibbonRightZPivot};

                    z = {
                        vertical = {
                            min = -20;
                            neutral = 0;
                            max = 20;

                            bodyY = {
                                multiplayer = -20;
                                min = -20;
                                max = 20;
                            };
                        };

                        horizontal = {
                            min = -20;
                            neutral = 0;
                            max = 20;

                            bodyX = {
                                multiplayer = -20;
                                min = -20;
                                max = 20;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.CMaidB.BackRibbon.RibbonLeft};

                    y = {
                        vertical = {
                            min = 0;
                            neutral = 0;
                            max = 70;

                            bodyX = {
                                multiplayer = 40;
                                min = 0;
                                max = 70;
                            };

                            bodyRot = {
                                multiplayer = -0.025;
                                min = 0;
                                max = 70;
                            };
                        };

                        horizontal = {
                            min = 0;
                            neutral = 0;
                            max = 70;

                            bodyY = {
                                multiplayer = -40;
                                min = 0;
                                max = 70;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.CMaidB.BackRibbon.RibbonLeft.RibbonLeftZPivot};

                    z = {
                        vertical = {
                            min = -20;
                            neutral = 0;
                            max = 20;

                            bodyY = {
                                multiplayer = 20;
                                min = -20;
                                max = 20;
                            };
                        };

                        horizontal = {
                            min = -20;
                            neutral = 0;
                            max = 20;

                            bodyX = {
                                multiplayer = 20;
                                min = -20;
                                max = 20;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.CMaidB.BackRibbon.RibbonBottomRight, models.models.main.Avatar.UpperBody.Body.CMaidB.BackRibbon.RibbonBottomLeft};

                    x = {
                        vertical = {
                            min = -140;
                            neutral = 0;
                            max = 0;
                            sneakOffset = 30;

                            bodyX = {
                                multiplayer = -80;
                                min = -60;
                                max = 0;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -140;
                                max = 0;
                            };

                            bodyRot = {
                                multiplayer = 0.05;
                                min = -60;
                                max = 0;
                            };
                        };

                        horizontal = {
                            min = -140;
                            neutral = 0;
                            max = 0;

                            bodyY = {
                                multiplayer = 80;
                                min = -60;
                                max = 0;
                            };
                        };
                    };
                };


                {
                    models = {models.models.main.Avatar.UpperBody.Body.CMaidB.BackRibbon.RibbonBottomRight.RibbonBottomRightZPivot};

                    z = {
                        vertical = {
                            min = -22.5;
                            neutral = 0;
                            max = 15;

                            bodyX = {
                                multiplayer = 10;
                                min = -22.5;
                                max = 15;
                            };

                            bodyRot = {
                                multiplayer = -0.025;
                                min = -22.5;
                                max = 15;
                            };
                        };

                        horizontal = {
                            min = -22.5;
                            neutral = 0;
                            max = 10;

                            bodyX = {
                                multiplayer = 10;
                                min = -22.5;
                                max = 15;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.CMaidB.BackRibbon.RibbonBottomLeft.RibbonBottomLeftZPivot};

                    z = {
                        vertical = {
                            min = -15;
                            neutral = 0;
                            max = 22.5;

                            bodyX = {
                                multiplayer = -10;
                                min = -15;
                                max = 22.5;
                            };

                            bodyRot = {
                                multiplayer = 0.025;
                                min = -15;
                                max = 22.5;
                            };
                        };

                        horizontal = {
                            min = -22.5;
                            neutral = 0;
                            max = 10;

                            bodyX = {
                                multiplayer = 10;
                                min = -22.5;
                                max = 15;
                            };
                        };
                    };
                };
            };

            callbacks = {
                onPhysicPerformed = function (_, model)
                    if model == models.models.main.Avatar.UpperBody.Body.Hairs.BackHair then
                        if player:isCrouching() then
                            local rot = model:getRot().x
                            model:setRot(math.min(rot + 30, 0))
                            model.BackHairBottom:setRot(math.max(rot + 30, 0))
                        else
                            model.BackHairBottom:setRot()
                        end
                    elseif model == models.models.main.Avatar.Head.CMaidH.HairTail then
                        local modelRot = model:getRot()
                        local headRotY = math.deg(math.asin(player:getLookDir().y))
                        if headRotY < 0 then
                            modelRot.x = math.min(modelRot.x, 50)
                        end
                        model:setRot(modelRot)
                    end
                end;
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
    end;
}