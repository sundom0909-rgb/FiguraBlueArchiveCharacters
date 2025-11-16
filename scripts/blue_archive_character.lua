---@alias BlueArchiveCharacter.RightEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）

---@alias BlueArchiveCharacter.LeftEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "CENTER" # 少し反対側を見る目

---@alias BlueArchiveCharacter.MouthTextures
---| "NORMAL" # 通常
---| "TEETH" # 歯が見える口
---| "CLOSED" # ハイフンみたいな口

---@alias BlueArchiveCharacter.GunPutType
---| "BODY" # アバターのBodyに銃を移動させる
---| "HIDDEN" # 銃を隠す

---@alias BlueArchiveCharacter.FormationType
---| "STRIKER" # ストライカー（前衛）
---| "SPECIAL" # スペシャル（後方支援）

---@alias BlueArchiveCharacter.Costumes
---| "DEFAULT" # デフォルト衣装
---| "SWIMSUIT" # 水着衣装

--[[ ******************************** ]]

---@class BlueArchiveCharacter : AvatarModule キャラクター変数を保持するクラス。別のキャラクターに対してもここを変更するだけで対応できるようにする。
---@field public basic BlueArchiveCharacter.BasicStruct 生徒の基本情報
---@field public faceParts BlueArchiveCharacter.FacePartsStruct 目や口による表情
---@field public arms BlueArchiveCharacter.ArmsStruct 腕
---@field public skirt BlueArchiveCharacter.SkirtStruct スカート
---@field public gun BlueArchiveCharacter.GunStruct 銃
---@field public placementObjects BlueArchiveCharacter.PlacementObjectStruct[] 設置物
---@field public exSkill BlueArchiveCharacter.ExSkillStruct Exスキル
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
---@field public callbacks? BlueArchiveCharacter.FacePartsCallbacksSet 表情のコールバック

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
---@field public exSkills BlueArchiveCharacter.ExSkillDataSet[] Exスキルデータ
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

---@class (exact) BlueArchiveCharacter.FacePartsCallbacksSet 表情のコールバック関数のセット
---@field public onPlay? fun(self: BlueArchiveCharacter, right: BlueArchiveCharacter.RightEyeTextures, left: BlueArchiveCharacter.LeftEyeTextures, mouth: BlueArchiveCharacter.MouthTextures) 表情が変化したときのコールバック関数

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
---@field public onRender? fun(self: BlueArchiveCharacter, placementObject: PlacementObject, delta: number) 各レンダーティック毎に呼ばれる関数
---@field public onGround? fun(self: BlueArchiveCharacter, placementObject: PlacementObject) 設置物が接地した瞬間に呼ばれる関数

---@class (exact) BlueArchiveCharacter.ExSkillCallbacks Exスキルのコールバック関数のセット
---@field public additionalCheckFunc? fun(self: BlueArchiveCharacter): boolean Exスキルを再生するかどうかの追加チェック関数

---@class (exact) BlueArchiveCharacter.ExSkillDataSet Exスキルのデータセット
---@field public name BlueArchiveCharacter.LocaleStringSet Exスキルの名前
---@field public formationType BlueArchiveCharacter.FormationType この生徒の戦闘配置タイプ
---@field public models ModelPart[] Exスキルアニメーション開始時に表示し、Exスキルアニメーション終了時に非表示にするモデルパーツ
---@field public animations string[] Exスキルアニメーションが含まれるモデルファイル名。アニメーション名は"ex_skill_<Exスキルのインデックス番号>"にすること。
---@field public camera BlueArchiveCharacter.ExSkillCameraSet Exスキルアニメーション中のカメラワーク
---@field public callbacks? BlueArchiveCharacter.ExSkillAnimationCallbacks Exスキルアニメーションのコールバック関数

---@class (exact) BlueArchiveCharacter.ExSkillCameraSet Exスキルアニメーション中のカメラワークのセット
---@field public start BlueArchiveCharacter.ExSkillCameraPositionSet Exスキルアニメーション開始地点
---@field public fin BlueArchiveCharacter.ExSkillCameraPositionSet Exスキルアニメーション終了地点
---@field public fixMode? boolean カメラの補正モード。通常は無効だが、特定のキャラクターに対しては有効にしておく。

---@class (exact) BlueArchiveCharacter.ExSkillCameraPositionSet Exスキルアニメーション中のカメラワークの開始/終了地点の位置のデータセット
---@field public pos Vector3 カメラの位置
---@field public rot Vector3 カメラの方向

---@class (exact) BlueArchiveCharacter.ExSkillAnimationCallbacks Exスキルアニメーションのコールバック関数のセット
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
---@field public additionalCheckFunc? fun(self: BlueArchiveCharacter): boolean 吹き出しエモートを表示するかどうかの追加チェック関数
---@field public onPlay? fun(self: BlueArchiveCharacter, type: Bubble.BubbleType, duration: integer, showInGui: boolean) 吹き出しエモートが再生された時に実行されるコールバック関数
---@field public onStop? fun(self: BlueArchiveCharacter, type: Bubble.BubbleType, forcedStop: boolean) 吹き出しアニメーション終了時に実行されるコールバック関数

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
                en_us = "Hina";
                ja_jp = "ヒナ";
            };

            lastName = {
                en_us = "Sorasaki";
                ja_jp = "空崎";
            };

            clubName = {
                en_us = "Gehenna Prefect Team";
                ja_jp = "風紀委員会";
            };

            birth = {
                month = 2;
                day = 19;
            };
        }

        instance.faceParts = {
            rightEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(2, 0); --必須
                TIRED = vectors.vec2(3, 0); --必須
                CLOSED = vectors.vec2(4, 0); --必須
            };

            leftEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(1, 0); --必須
                TIRED = vectors.vec2(2, 0); --必須
                CLOSED = vectors.vec2(3, 0); --必須
                CENTER = vectors.vec2(4, 0);
            };

            mouth = {
                TEETH = vectors.vec2(0, 0);
                CLOSED = vectors.vec2(1, 0);
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
                            models.models.main.Avatar.UpperBody.Arms.RightArm:setRot(player:isSwingingArm() and not player:isLeftHanded() and vectors.vec3() or vectors.vec3(math.max(headRot.x - 15 + (player:isCrouching() and 30 or 0), -15) + math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * 2.5, rotY, 10))
                        end, "right_arm_render")
                    elseif state == 2 then
                        events.RENDER:remove("right_arm_render")
                        events.RENDER:register(function (delta, context)
                            local headRot = vanilla_model.HEAD:getOriginRot()
                            local isSwingingArm = player:isSwingingArm() and not player:isLeftHanded()
                            models.models.main.Avatar.UpperBody.Arms.RightArm:setParentType((isSwingingArm or context == "FIRST_PERSON") and "RightArm" or "Body")
                            models.models.main.Avatar.UpperBody.Arms.RightArm:setRot(isSwingingArm and vectors.vec3() or vectors.vec3(math.max(headRot.x + 55 + (player:isCrouching() and 30 or 0), 55), math.min(math.map((headRot.y + 180) % 360 - 180, -50, 50, -21, 78) + 30, 65) + math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * 2.5, 0))
                        end, "right_arm_render")
                    end
                    models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom:setRot(state == 1 and 40 or 0, 0, 0)
                end;

                onAdditionalLeftArmProcess = function (self, state)
                    if state == 1 then
                        events.RENDER:remove("left_arm_render")
                        events.RENDER:register(function (delta)
                            local headRot = vanilla_model.HEAD:getOriginRot()
                            local rotY = headRot.y % 360
                            rotY = rotY < 180 and 0 or rotY
                            models.models.main.Avatar.UpperBody.Arms.LeftArm:setRot(player:isSwingingArm() and player:isLeftHanded() and vectors.vec3() or vectors.vec3(math.max(headRot.x - 15 + (player:isCrouching() and 30 or 0), -15) + math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * -2.5, rotY, -10))
                        end, "left_arm_render")
                    elseif state == 2 then
                        events.RENDER:remove("left_arm_render")
                        events.RENDER:register(function (delta, context)
                            local headRot = vanilla_model.HEAD:getOriginRot()
                            local isSwingingArm = player:isSwingingArm() and player:isLeftHanded()
                            models.models.main.Avatar.UpperBody.Arms.LeftArm:setParentType((isSwingingArm or context == "FIRST_PERSON") and "LeftArm" or "Body")
                            models.models.main.Avatar.UpperBody.Arms.LeftArm:setRot(isSwingingArm and vectors.vec3() or vectors.vec3(math.max(headRot.x + 55 + (player:isCrouching() and 30 or 0), 55), math.max(math.map((headRot.y + 180) % 360 - 180, -50, 50, -78, 21) - 30, -65) + math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * -2.5, 0))
                        end, "left_arm_render")
                    end
                    models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom:setRot(state == 1 and 40 or 0, 0, 0)
                end;
            }
        }

        instance.skirt = {

        }

        instance.gun = {
            scale = 2.5;

            gunPosition = {
                hold = {
                    firstPersonPos = {
                        right = vectors.vec3(0, 2, -15);
                        left = vectors.vec3(0, 2, -15);
                    };
                    thirdPersonPos = {
                        right = vectors.vec3(-2, 10, -5);
                        left = vectors.vec3(2, 10, -5);
                    };
                    thirdPersonRot = {
                        right = vectors.vec3(70, 10, 0);
                        left = vectors.vec3(70, -10, 0);
                    }
                };

                put = {
                    type = "BODY";

                    pos = {
                        right = vectors.vec3(0, 4, 2);
                        left = vectors.vec3(0, 4, 2);
                    };

                    rot = {
                        right = vectors.vec3(0, 90, 45);
                        left = vectors.vec3(0, -90, -45);
                    };
                };
            };

            sound = {
                name = "minecraft:entity.firework_rocket.blast";
                pitch = 0.5;
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
            exSkills = {
                {
                    name = {
                        en_us = "Ending scene: Ishbóshet";
                        ja_jp = "終幕：イシュ・ボシェテ";
                    };

                    formationType = "STRIKER";

                    models = {};

                    animations = {"main", "ex_skill_1"};

                    camera = {
                        start = {
                            rot = vectors.vec3(-15, 130, 0);
                            pos = vectors.vec3(12, 19, -11);
                        };

                        fin = {
                            rot = vectors.vec3(-15, 180, 0);
                            pos = vectors.vec3(0, 6.25, -71);
                        };
                    };

                    callbacks = {
                        onPreAnimation = function (self)
                            self.parent.faceParts:setEmotion("NORMAL", "CENTER", "TEETH", 20, true)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.blaze.shoot"), player:getPos(), 1, 0.5)
                        end;

                        onAnimationTick = function (self, tick)
                            if tick == 20 then
                                self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "CLOSED", 63, true)
                            elseif tick == 37 and host:isHost() then
                                models.models.ex_skill_1.CameraBackground:setVisible(true)
                                local windowSize = client:getWindowSize()
                                events.RENDER:register(function ()
                                    local backgroundPos = vectors.rotateAroundAxis(player:getBodyYaw() + 180, renderer:getCameraOffsetPivot():copy():add(0, 1.62, 0):add(client:getCameraDir():copy():scale(5)), 0, 1, 0):scale(16 / 0.9375)
                                    models.models.ex_skill_1.CameraBackground:setOffsetPivot(backgroundPos)
                                    models.models.ex_skill_1.CameraBackground.Background:setPos(backgroundPos)
                                    models.models.ex_skill_1.CameraBackground.Background:setScale(windowSize.x / windowSize.y * 130 * models.models.ex_skill_1.CameraBackground.BackgroundScale:getAnimScale().x)
                                end, "ex_skill_1_transition_1")
                                models.models.main.Avatar:setColor(0, 0, 0)
                            elseif tick == 27 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.bat.takeoff"), player:getPos(), 1, 0.5)
                            elseif tick == 42 then
                                for _, soundData in ipairs({{"minecraft:entity.firework_rocket.large_blast", 1}, {"minecraft:entity.player.levelup", 1.5}}) do
                                    sounds:playSound(self.parent.compatibilityUtils:checkSound(soundData[1]), player:getPos(), 1, soundData[2])
                                end
                            elseif tick == 45 and host:isHost() then
                                events.RENDER:remove("ex_skill_1_transition_1")
                                models.models.ex_skill_1.CameraBackground:setVisible(false)
                                models.models.main.Avatar:setColor()
                            elseif tick == 56 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.lightning_bolt.thunder"), player:getPos(), 1, 2)
                            end

                            if tick < 28 then
                                local playerPos = player:getPos()
                                for _ = 1, 15 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:dust", "1 1 1 1"), playerPos:copy():add(math.random() * 3 - 1.5, math.random() * 1, math.random() * 3 - 1.5)):setScale(1):setVelocity(0, 0.1, 0):setColor(vectors.vec3(1, 0, 1):add(vectors.vec3(0.38, 0, 0.81):sub(1, 0, 1):scale(math.random())))
                                end
                            elseif tick >= 40 and tick % 2 == 0 then
                                local playerPos = player:getPos()
                                local bodyYaw = player:getBodyYaw()
                                local anchorPos = playerPos:copy():add(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 1 - 0.5, math.random() * 1.5, 0, 0, 1, 0))
                                local colorOffset = math.random()
                                local rotZ = math.random() * 60 - 30
                                rotZ = rotZ >= 0 and (rotZ + 10) or (rotZ - 25)
                                for i = 0, 35 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:dust", "1 1 1 1"), anchorPos):setScale(1):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1 + 90, vectors.rotateAroundAxis(rotZ, vectors.rotateAroundAxis(math.random() * 60 - 30, vectors.rotateAroundAxis(i * 10 + 1, 0, 0, 0.3, 0, 1, 0), 1, 0, 0), 0, 0, 1), 0, 1, 0)):setColor(vectors.vec3(1, 0, 1):add(vectors.vec3(0.38, 0, 0.81):sub(1, 0, 1):scale(colorOffset))):setLifetime(20 + math.random() * 20)
                                end
                            end
                        end;

                        onPostAnimation = function (_, forcedStop)
                            if forcedStop and host:isHost() then
                                events.RENDER:remove("ex_skill_1_transition_1")
                                models.models.ex_skill_1.CameraBackground:setVisible(false)
                                models.models.main.Avatar:setColor()
                            end
                        end;
                    }
                };
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
                    name = "swimsuit";

                    displayName = {
                        en_us = "Swimsuit";
                        ja_jp = "水着";
                    };

                    exSkill = 1;

                    ---この衣装が初期化されたかどうか
                    ---@type boolean
                    isInitialized = false;
                }
            };

            callbacks = {
                onChange = function (self)
                    self.parent.costume.setCostumeTextureOffset(1)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.Head, models.models.main.Avatar.Head.HatLayer}) do
                        modelPart:setUVPixels(0, 16)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.CSwimsuitH, models.models.main.Avatar.UpperBody.Body.CSwimsuitB}) do
                        modelPart:setVisible(true)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.Horns, models.models.main.Avatar.Head.BackHairs.TopBackHair, models.models.main.Avatar.UpperBody.Body.Jacket, models.models.main.Avatar.UpperBody.Body.Wings}) do
                        modelPart:setVisible(false)
                    end
                    self.physics.physicData[2].x.vertical.neutral = -5
                    self.physics.physicData[2].x.vertical.max = -5
                    self.physics.physicData[2].x.vertical.headX.max = -5
                    self.physics.physicData[2].x.vertical.headRot.max = -5
                    self.physics.physicData[2].x.vertical.bodyY.max = -5
                    self.physics.physicData[2].x.horizontal.neutral = -30
                    self.physics.physicData[2].x.horizontal.max = -5
                    self.physics.physicData[2].x.horizontal.headX.min = -45
                    self.physics.physicData[2].x.horizontal.headX.max = -5
                    self.faceParts.rightEye.NORMAL = vectors.vec2(6, 0)
                    self.faceParts.leftEye.NORMAL = vectors.vec2(6, 0)
                    if events.TICK:getRegisteredCount("costume_swimsuit_head_generation_delay_tick") == 0 then
                        local delayCount = 0
                        events.TICK:register(function ()
                            if delayCount == 1 then
                                for _, modelPart in ipairs({models.script_head_block.Head.FaceParts.Eyes.EyeLeft, models.script_head_block.Head.FaceParts.Eyes.EyeRight, models.script_portrait.Head.FaceParts.Eyes.EyeLeft, models.script_portrait.Head.FaceParts.Eyes.EyeRight}) do
                                    modelPart:setUVPixels(36, 0)
                                end
                                events.TICK:remove("costume_swimsuit_head_generation_delay_tick")
                            end
                            delayCount = delayCount + 1
                        end, "costume_swimsuit_head_generation_delay_tick")
                    end
                    if not self.costume.costumes[2].isInitialized then
                        models.models.main.Avatar.UpperBody.Body.CSwimsuitB:newText("costume_swimsuit_text_1"):setText("§05-A"):setPos(0, -3, -2):setScale(0.05):setAlignment("CENTER")
                        models.models.main.Avatar.UpperBody.Body.CSwimsuitB:newText("costume_swimsuit_text_2"):setText("§0ひな"):setPos(0, -3.35, -2):setScale(0.2):setAlignment("CENTER")
                        self.costume.costumes[2].isInitialized = true
                    end
                    self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "NORMAL", 1)
                end;

                onReset = function (self)
                    self.parent.costume.setCostumeTextureOffset(0)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.Head, models.models.main.Avatar.Head.HatLayer}) do
                        modelPart:setUVPixels()
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.CSwimsuitH, models.models.main.Avatar.UpperBody.Body.CSwimsuitB}) do
                        modelPart:setVisible(false)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.Horns, models.models.main.Avatar.Head.BackHairs.TopBackHair, models.models.main.Avatar.UpperBody.Body.Jacket, models.models.main.Avatar.UpperBody.Body.Wings}) do
                        modelPart:setVisible(true)
                    end
                    self.physics.physicData[2].x.vertical.neutral = -15
                    self.physics.physicData[2].x.vertical.max = -15
                    self.physics.physicData[2].x.vertical.headX.max = -15
                    self.physics.physicData[2].x.vertical.headRot.max = -15
                    self.physics.physicData[2].x.vertical.bodyY.max = -15
                    self.physics.physicData[2].x.horizontal.neutral = -45
                    self.physics.physicData[2].x.horizontal.max = -5
                    self.physics.physicData[2].x.horizontal.headX.min = -60
                    self.physics.physicData[2].x.horizontal.headX.max = -15
                    self.faceParts.rightEye.NORMAL = vectors.vec2(0, 0)
                    self.faceParts.leftEye.NORMAL = vectors.vec2(0, 0)
                    self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "NORMAL", 1)
                end;

                onArmorChange = function (_, parts, isVisible)
                    if parts == "CHEST_PLATE" then
                        models.models.main.Avatar.UpperBody.Body.FrontHair:setPos(0, 0, isVisible and -1 or 0)
                    elseif parts == "LEGGINGS" then
                        models.models.main.Avatar.UpperBody.Body.Jacket.JacketMain:setVisible(not isVisible)
                    end
                end;
            };
        }

        instance.bubble = {

        }

        instance.headBlock = {
            includeModels = {models.models.main.Avatar.UpperBody.Body.FrontHair};
        }

        instance.portrait = {
            includeModels = {};
        }

        instance.deathAnimation = {
            callbacks = {
                onPhase1 = function (_, dummyAvatar)
                    dummyAvatar.Head.BackHairs.BottomBackHair:setRot(12.5, 0, 0)
                    dummyAvatar.Head.BackHairs.TopBackHair:setRot(5, 0, 0)
                    for _, modelPart in ipairs({dummyAvatar.UpperBody.Body.Wings.RightWing.RightWingZPivot.RightWingBone1.RightWingBone2.RightWingFinger1.RightWingTip1, dummyAvatar.UpperBody.Body.Wings.RightWing.RightWingZPivot.RightWingBone1.RightWingBone2.RightWingBone3.RightWingFinger2.RightWingTip2, dummyAvatar.UpperBody.Body.Wings.RightWing.RightWingZPivot.RightWingBone1.RightWingBone2.RightWingBone3.RightWingBone4.RightWingFinger3.RightWingTip3, dummyAvatar.UpperBody.Body.Wings.RightWing.RightWingZPivot.RightWingBone1.RightWingBone2.RightWingBone3.RightWingBone4.RightWingBone5.RightWingBone6.RightWingBone7.RightWingBone8.RightWingFinger4.RightWingFinger4_2.RightWingFinger4_3.RightWingTip4, dummyAvatar.UpperBody.Body.Wings.LeftWing.LeftWingZPivot.LeftWingBone1.LeftWingBone2.LeftWingFinger1.LeftWingTip1, dummyAvatar.UpperBody.Body.Wings.LeftWing.LeftWingZPivot.LeftWingBone1.LeftWingBone2.LeftWingBone3.LeftWingFinger2.LeftWingTip2, dummyAvatar.UpperBody.Body.Wings.LeftWing.LeftWingZPivot.LeftWingBone1.LeftWingBone2.LeftWingBone3.LeftWingBone4.LeftWingFinger3.LeftWingTip3, dummyAvatar.UpperBody.Body.Wings.LeftWing.LeftWingZPivot.LeftWingBone1.LeftWingBone2.LeftWingBone3.LeftWingBone4.LeftWingBone5.LeftWingBone6.LeftWingBone7.LeftWingBone8.LeftWingFinger4.LeftWingFinger4_2.LeftWingFinger4_3.LeftWingTip4}) do
                        modelPart:setPrimaryRenderType("CUTOUT")
                    end
                end;

                onPhase2 = function (_, dummyAvatar)
                    dummyAvatar.Head.BackHairs.BottomBackHair:setRot(-20, 0, 0)
                    dummyAvatar.Head.BackHairs.TopBackHair:setRot(-20, 0, 0)
                    dummyAvatar.UpperBody.Body.Wings.RightWing:setRot(0, -120, 0)
                    dummyAvatar.UpperBody.Body.Wings.LeftWing:setRot(0, 40, 0)
                end
            };
        }

        instance.actionWheel = {
            isVehicleOptionEnabled = false;
        }

        instance.physics = {
            physicData = {
                {
                    models = {models.models.main.Avatar.Head.Cowlick};

                    x = {
                        vertical = {
                            min = -70;
                            neutral = -30;
                            max = -5;

                            headX = {
                                multiplayer = 40;
                                min = -70;
                                max = -5;
                            };

                            bodyY = {
                                multiplayer = 40;
                                min = -50;
                                max = -5;
                            };
                        };

                        horizontal = {
                            min = -70;
                            neutral = -30;
                            max = -30;

                            bodyX = {
                                multiplayer = 80;
                                min = -70;
                                max = -30;
                            };
                        };
                    };

                    y = {
                        vertical = {
                            min = -25;
                            neutral = -25;
                            max = -25;
                        };

                        horizontal = {
                            min = -25;
                            neutral = -25;
                            max = -25;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.BackHairs.BottomBackHair};

                    x = {
                        vertical = {
                            min = -130;
                            neutral = -15;
                            max = -15;
                            sneakOffset = -30;

                            headRotMultiplayer = -1;

                            headX = {
                                multiplayer = -40;
                                min = -90;
                                max = -15;
                            };

                            headRot = {
                                multiplayer = 0.025;
                                min = -90;
                                max = -15;
                            };

                            bodyY = {
                                multiplayer = 40;
                                min = -130;
                                max = -15;
                            };
                        };

                        horizontal = {
                            min = -130;
                            neutral = -45;
                            max = -15;

                            headX = {
                                multiplayer = -80;
                                min = -60;
                                max = -15;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.BackHairs.TopBackHair};

                    x = {
                        vertical = {
                            min = -170;
                            neutral = -12.5;
                            max = -7.5;
                            sneakOffset = -20;

                            headRotMultiplayer = -1;

                            headX = {
                                multiplayer = -80;
                                min = -90;
                                max = -7.5;
                            };

                            headRot = {
                                multiplayer = 0.05;
                                min = -90;
                                max = -7.5;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -170;
                                max = -7.5;
                            };
                        };

                        horizontal = {
                            min = -135;
                            neutral = -30;
                            max = -45;

                            headX = {
                                multiplayer = -80;
                                min = -60;
                                max = -45;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.BackHairs.TopBackHair.TopBackHairZPivot};

                    z = {
                        vertical = {
                            min = -30;
                            neutral = 0;
                            max = 30;

                            headZ = {
                                multiplayer = -40;
                                min = -30;
                                max = 30;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.Horns.HornBL.LeftHornRibbon, models.models.main.Avatar.Head.Horns.HornBR.RightHornRibbon};

                    x = {
                        vertical = {
                            min = -172.5;
                            neutral = -12.5;
                            max = -12.5;
                            headRotMultiplayer = -1;

                            headX = {
                                multiplayer = -120;
                                min = -90;
                                max = -12.5;
                            };

                            headRot = {
                                multiplayer = 0.01;
                                min = -90;
                                max = -12.5;
                            };

                            bodyY = {
                                multiplayer = 120;
                                min = -172.5;
                                max = -12.5;
                            };
                        };

                        horizontal = {
                            min = -172.5;
                            neutral = -45;
                            max = -12.5;

                            headX = {
                                multiplayer = -120;
                                min = -60;
                                max = -45;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.FrontHair};

                    x = {
                        vertical = {
                            min = 0;
                            neutral = 0;
                            max = 150;
                            sneakOffset = 30;

                            bodyX = {
                                multiplayer = -60;
                                min = 0;
                                max = 90;
                            };

                            bodyY = {
                                multiplayer = -60;
                                min = 0;
                                max = 150;
                            };

                            bodyRot = {
                                multiplayer = -0.03;
                                min = 0;
                                max = 90;
                            };
                        };

                        horizontal = {
                            min = 0;
                            neutral = 90;
                            max = 150;

                            bodyX = {
                                multiplayer = -60;
                                min = 0;
                                max = 150;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Jacket.RightJacketArm, models.models.main.Avatar.UpperBody.Body.Jacket.LeftJacketArm};

                    x = {
                        vertical = {
                            min = -165;
                            neutral = -5;
                            max = 12.5;

                            bodyX = {
                                multiplayer = -80;
                                min = -90;
                                max = 12.5;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -165;
                                max = 0;
                            };

                            bodyRot = {
                                multiplayer = 0.05;
                                min = -90;
                                max = 0;
                            };
                        };

                        horizontal = {
                            min = -5;
                            neutral = -5;
                            max = -5;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Jacket.RightJacketArm.RightJacketArmZPivot};

                    z = {
                        vertical = {
                            min = -50;
                            neutral = 12.5;
                            max = 62.5;

                            bodyX = {
                                multiplayer = -10;
                                min = 0;
                                max = 12.5;
                            };

                            bodyZ = {
                                multiplayer = -80;
                                min = -50;
                                max = 62.5;
                            };

                            bodyRot = {
                                multiplayer = 0.01;
                                min = 0;
                                max = 12.5;
                            };
                        };

                        horizontal = {
                            min = -50;
                            neutral = 12.5;
                            max = 62.5;

                            bodyX = {
                                multiplayer = -10;
                                min = 0;
                                max = 12.5;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Jacket.LeftJacketArm.LeftJacketArmZPivot};

                    z = {
                        vertical = {
                            min = -62.5;
                            neutral = -12.5;
                            max = 50;

                            bodyX = {
                                multiplayer = 10;
                                min = -12.5;
                                max = 0;
                            };

                            bodyZ = {
                                multiplayer = -80;
                                min = -62.5;
                                max = 50;
                            };

                            bodyRot = {
                                multiplayer = -0.01;
                                min = -12.5;
                                max = 0;
                            };
                        };

                        horizontal = {
                            min = -50;
                            neutral = -12.5;
                            max = 62.5;

                            bodyX = {
                                multiplayer = 10;
                                min = 0;
                                max = -12.5;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CSwimsuitH.SideHairTail};

                    x = {
                        vertical = {
                            min = -90;
                            neutral = 0;
                            max = 90;

                            headRotMultiplayer = -1;

                            headX = {
                                multiplayer = -60;
                                min = -90;
                                max = 90;
                            };
                        };

                        horizontal = {
                            min = -45;
                            neutral = 45;
                            max = 45;

                            headX = {
                                multiplayer = -120;
                                min = -45;
                                max = 45;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CSwimsuitH.SideHairTail.SideHairTailZPivot};

                    z = {
                        vertical = {
                            min = -170;
                            neutral = -7.5;
                            max = -7.5;

                            headZ = {
                                multiplayer = -40;
                                min = -60;
                                max = -7.5;
                            };

                            headRot = {
                                multiplayer = 0.025;
                                min = -60;
                                max = -7.5;
                            };

                            bodyY = {
                                multiplayer = 60;
                                min = -170;
                                max = -7.5;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.CSwimsuitB.Whistle.WhistleFront};

                    x = {
                        vertical = {
                            min = 0;
                            neutral = 0;
                            max = 75;
                            sneakOffset = 30;

                            bodyX = {
                                multiplayer = -120;
                                min = 0;
                                max = 75;
                            };

                            bodyY = {
                                multiplayer = -120;
                                min = 0;
                                max = 75;
                            };

                            bodyRot = {
                                multiplayer = -0.1;
                                min = 0;
                                max = 75;
                            };
                        };

                        horizontal = {
                            min = 0;
                            neutral = 75;
                            max = 75;

                            bodyX = {
                                multiplayer = -120;
                                min = 0;
                                max = 75;
                            };
                        };
                    };
                };
            };

            callbacks = {
                onPhysicPerformed = function (_, model)
                    if model == models.models.main.Avatar.Head.BackHairs.BottomBackHair then
                        local rot = math.deg(math.asin(player:getLookDir().y)) - model:getRot().x
                        if rot < 0 then
                            models.models.main.Avatar.Head.BackHairs.BottomBackHair:setOffsetPivot(0, 0, 2)
                        else
                            models.models.main.Avatar.Head.BackHairs.BottomBackHair:setOffsetPivot()
                        end
                    elseif model == models.models.main.Avatar.Head.BackHairs.TopBackHair then
                        model:setRot(math.min(model:getRot().x, 20), 0, 0)
                    elseif model == models.models.main.Avatar.Head.Horns.HornBL.LeftHornRibbon or model == models.models.main.Avatar.Head.Horns.HornBR.RightHornRibbon then
                        model:setRot(math.min(model:getRot().x, 0), 0, 0)
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
        models.models.main.Avatar.UpperBody.Body.Jacket.LeftJacketArm.LeftJacketArmZPivot.Armband:newText("costume_default_text_1"):setText("§l風紀"):setScale(0.18):setRot(0, 180, 0):setAlignment("CENTER")

        events.RENDER:register(function ()
            local wingRotOffset = math.map(vanilla_model.RIGHT_LEG:getOriginRot().x, -90, 90, 20, 0)
            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Wings.RightWing, models.models.main.Avatar.UpperBody.Body.CSwimsuitB.Wings.RightWing}) do
                modelPart:setRot(0, wingRotOffset * -1, 0)
            end
            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Wings.LeftWing, models.models.main.Avatar.UpperBody.Body.CSwimsuitB.Wings.LeftWing}) do
                modelPart:setRot(0, wingRotOffset, 0)
            end
        end)
    end;
}