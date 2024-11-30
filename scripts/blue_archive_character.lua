---@alias BlueArchiveCharacter.RightEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "CLOSED2" # 閉じた目2
---| "HALF" # 半分目
---| "ANGRY" # 怒った目
---| "CENTER" # 少し反対側を見る目
---| "NARROW_CENTER" # 少し閉じつつ少し反対側を見る目
---| "NARROW_ANGRY_CENTER" # 少し閉じつつ怒りつつ少し反対側を見る目
---| "NARROW_ANGRY" # 少し閉じつつ怒った目

---@alias BlueArchiveCharacter.LeftEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "CLOSED2" # 閉じた目2
---| "HALF" # 半分目
---| "ANGRY" # 怒った目
---| "NARROW" # 少し閉じた目
---| "NARROW_ANGRY" # 少し閉じつつ怒った目
---| "CENTER" # 少し反対側を見る目
---| "NARROW_ANGRY_INVERTED" # 少し閉じつつ怒りつつ反対側を見る目
---| "INVERTED" # 反対側を見る目
---| "ANGRY_INVERTED" # 怒りつつ反対側を見る目

---@alias BlueArchiveCharacter.MouthTextures
---| "NORMAL" # 通常
---| "TRIANGLE" # 三角口
---| "ANGRY" # への口
---| "CLOSED" # 閉じた口
---| "CLOSED2" # 閉じた口2

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
---| "MASKED" # 覆面水着団
---| "SWIMSUIT" # 水着
---| "RIDING" # ライディング

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
                en_us = "Shiroko";
                ja_jp = "シロコ";
            };

            lastName = {
                en_us = "Sunaokami";
                ja_jp = "砂狼";
            };

            clubName = {
                en_us = "Countermeasure Council";
                ja_jp = "対策委員会";
            };

            birth = {
                month = 5;
                day = 16;
            };
        }

        instance.faceParts = {
            rightEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(2, 0); --必須
                TIRED = vectors.vec2(4, 0); --必須
                CLOSED = vectors.vec2(6, 0); --必須
                CLOSED2 = vectors.vec2(7, 0);
                HALF = vectors.vec2(8, 0);
                ANGRY = vectors.vec2(0, 1);
                CENTER = vectors.vec2(2, 1);
                NARROW_CENTER = vectors.vec2(3, 1);
                NARROW_ANGRY_CENTER = vectors.vec2(5, 1);
                NARROW_ANGRY = vectors.vec2(8, 1);
            };

            leftEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(2, 0); --必須
                TIRED = vectors.vec2(4, 0); --必須
                CLOSED = vectors.vec2(5, 0); --必須
                CLOSED2 = vectors.vec2(6, 0);
                HALF = vectors.vec2(8, 0);
                ANGRY = vectors.vec2(0, 1);
                NARROW = vectors.vec2(3, 1);
                NARROW_ANGRY = vectors.vec2(5, 1);
                CENTER = vectors.vec2(6, 1);
                NARROW_ANGRY_INVERTED = vectors.vec2(8, 1);
                INVERTED = vectors.vec2(-1, 2);
                ANGRY_INVERTED = vectors.vec2(0, 2);
            };

            mouth = {
                TRIANGLE = vectors.vec2(1, 0);
                ANGRY = vectors.vec2(2, 0);
                CLOSED = vectors.vec2(3, 0);
                CLOSED2 = vectors.vec2(0, 1);
            };
        }

        instance.arms = {
            callbacks = {
                onArmStateChanged = function (self, right, left)
                    if self.parent.drone ~= nil and self.parent.bicycle then
                        if left == 2 and right == 1 then
                            if self.parent.drone.dronePosition ~= "NONE" then
                                return {right = 1, left = 4}
                            elseif self.parent.bicycle.bicycleEnabled then
                                return {right = 7, left = 6}
                            end
                        elseif left == 1 and right == 2 then
                            if self.parent.drone.dronePosition ~= "NONE" then
                                return {right = 4, left = 1}
                            elseif self.parent.bicycle.bicycleEnabled then
                                return {right = 6, left = 7}
                            end
                        elseif left == 0 and right == 0 then
                            if self.parent.drone.dronePosition == "RIGHT" then
                                return {right = 5, left = 4}
                            elseif self.parent.drone.dronePosition == "LEFT" then
                                return {right = 4, left = 5}
                            elseif self.parent.bicycle.bicycleEnabled then
                                return {right = 6, left = 6}
                            end
                        end
                    end
                end;

                onAdditionalRightArmProcess = function (self, state)
                    if state == 1 then
                        events.RENDER:register(function (_, context)
                            if self.parent.drone ~= nil then
                                local isLeftHanded = player:isLeftHanded()
                                if self.parent.drone.dronePosition == "RIGHT" and isLeftHanded then
                                    local isSwingingArm = player:isSwingingArm() and isLeftHanded
                                    models.models.main.Avatar.UpperBody.Arms.RightArm:setParentType(context == "FIRST_PERSON" and "RightArm" or (isSwingingArm and "LeftArm" or "Body"))
                                    if isSwingingArm then
                                        models.models.main.Avatar.UpperBody.Arms.RightArm:setRot()
                                    end
                                end
                            end
                        end, "right_arm_render")
                    elseif state == 2 then
                        events.TICK:register(function ()
                            if self.parent.bicycle.bicycleEnabled and animations["models.main"]["bicycle_idle"]:getTime() * 4 > 0 then
                                self.parent.arms:setArmState(6, nil)
                            end
                        end, "right_arm_tick")
                    elseif state == 4 then
                        --ドローンに掴まる腕
                        events.RENDER:register(function (_, context)
                            models.models.main.Avatar.UpperBody.Arms.RightArm:setParentType(context == "FIRST_PERSON" and "RightArm" or "Body")
                        end, "right_arm_render")
                    elseif state == 5 then
                        --ドローンぶら下がり
                        local isHoldingItem = false
                        events.TICK:register(function ()
                            self.parent.arms:processArmWingCount()
                            isHoldingItem = (player:isLeftHanded() and player:getHeldItem(true).id or player:getHeldItem(false).id) ~= "minecraft:air"
                        end, "right_arm_tick")
                        events.RENDER:register(function (delta, context)
                            local isLeftHanded = player:isLeftHanded()
                            local activeHand = player:getActiveHand()
                            local isUsingSpyglass = player:getActiveItem().id == "minecraft:spyglass" and ((activeHand == "MAIN_HAND" and not isLeftHanded) or (activeHand == "OFF_HAND" and isLeftHanded))
                            local isSwingingArm = (player:isSwingingArm() and not isLeftHanded) or isUsingSpyglass
                            models.models.main.Avatar.UpperBody.Arms.RightArm:setParentType((context == "FIRST_PERSON" or isSwingingArm) and "RightArm" or "Body")
                            models.models.main.Avatar.UpperBody.Arms.RightArm:setRot(isSwingingArm and vectors.vec3((isHoldingItem and not isUsingSpyglass) and 20 or 0, 0, 0) or vectors.vec3(isHoldingItem and 20 or 0, 0, 10 + math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * -2.5))
                        end, "right_arm_render")
                    elseif state == 6 then
                        --自転車
                        events.TICK:register(function ()
                            self.parent.arms:processArmWingCount()
                            if animations["models.main"]["bicycle_idle"]:getTime() * 4 == 0 then
                                self.parent.arms:setArmState(Gun.CurrentGunPosition == "LEFT" and 2 or 8, nil)
                            end
                        end, "right_arm_tick")
                        events.RENDER:register(function (delta, context)
                            local isLeftHanded = player:isLeftHanded()
                            local activeHand = player:getActiveHand()
                            local isUsingSpyglass = player:getActiveItem().id == "minecraft:spyglass" and ((activeHand == "MAIN_HAND" and not isLeftHanded) or (activeHand == "OFF_HAND" and isLeftHanded))
                            local isSwingingArm = (player:isSwingingArm() and not isLeftHanded) or isUsingSpyglass
                            models.models.main.Avatar.UpperBody.Arms.RightArm:setParentType((context == "FIRST_PERSON" or isSwingingArm) and "RightArm" or "Body")
                            local bicycleIdleFactor = 1 - animations["models.main"]["bicycle_idle"]:getTime() * 4
                            local currentHandleRot = (self.parent.bicycle.handleRot - self.parent.bicycle.handleRotPrev) * delta + self.parent.bicycle.handleRot
                            models.models.main.Avatar.UpperBody.Arms.RightArm:setRot(isSwingingArm and vectors.vec3(isUsingSpyglass and 40 or 20, 0, 0) or vectors.vec3(50 * (1 - bicycleIdleFactor) + 20, 8 * (1 - bicycleIdleFactor) + 8 * (currentHandleRot / 15), 0))
                        end, "right_arm_render")
                    elseif state == 7 then
                        --自転車で銃を持っているとき
                        events.TICK:register(function ()
                            self.parent.arms:processArmWingCount()
                            if player:isSwingingArm() and not player:isLeftHanded() then
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
                            local bicycleIdleFactor = 1 - animations["models.main"]["bicycle_idle"]:getTime() * 4
                            models.models.main.Avatar.UpperBody.Arms.RightArm:setRot(player:isSwingingArm() and not player:isLeftHanded() and vectors.vec3(60, 0, 0) or vectors.vec3(headRot.x + math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * 2.5 + (1 - bicycleIdleFactor) * 35 + 105, headRot.y, 0))
                        end, "right_arm_render")
                    elseif state == 8 then
                        --自転車で待機中
                        events.TICK:register(function ()
                            if animations["models.main"]["bicycle_idle"]:getTime() * 4 > 0 then
                                self.parent.arms:setArmState(6, nil)
                            end
                        end, "right_arm_tick")
                    end
                end;

                onAdditionalLeftArmProcess = function (self, state)
                    if state == 1 then
                        events.RENDER:register(function (_, context)
                            if self.parent.drone ~= nil then
                                local isLeftHanded = player:isLeftHanded()
                                if self.parent.drone.dronePosition == "LEFT" and not isLeftHanded then
                                    local isSwingingArm = player:isSwingingArm() and not isLeftHanded
                                    models.models.main.Avatar.UpperBody.Arms.LeftArm:setParentType(context == "FIRST_PERSON" and "LeftArm" or (isSwingingArm and "RightArm" or "Body"))
                                    if isSwingingArm then
                                        models.models.main.Avatar.UpperBody.Arms.LeftArm:setRot()
                                    end
                                end
                            end
                        end, "left_arm_render")
                    elseif state == 2 then
                        events.TICK:register(function ()
                            if self.parent.bicycle.bicycleEnabled and animations["models.main"]["bicycle_idle"]:getTime() * 4 > 0 then
                                self.parent.arms:setArmState(nil, 6)
                            end
                        end, "left_arm_tick")
                    elseif state == 4 then
                        --ドローンに掴まる腕
                        events.RENDER:register(function (_, context)
                            models.models.main.Avatar.UpperBody.Arms.LeftArm:setParentType(context == "FIRST_PERSON" and "LeftArm" or "Body")
                        end, "left_arm_render")
                    elseif state == 5 then
                        --ドローンぶら下がり
                        local isHoldingItem = false
                        events.TICK:register(function ()
                            self.parent.arms:processArmWingCount()
                            isHoldingItem = (player:isLeftHanded() and player:getHeldItem(false).id or player:getHeldItem(true).id) ~= "minecraft:air"
                        end, "left_arm_tick")
                        events.RENDER:register(function (delta, context)
                            local isLeftHanded = player:isLeftHanded()
                            local activeHand = player:getActiveHand()
                            local isUsingSpyglass = player:getActiveItem().id == "minecraft:spyglass" and ((activeHand == "MAIN_HAND" and isLeftHanded) or (activeHand == "OFF_HAND" and not isLeftHanded))
                            local isSwingingArm = (player:isSwingingArm() and isLeftHanded) or isUsingSpyglass
                            models.models.main.Avatar.UpperBody.Arms.LeftArm:setParentType((context == "FIRST_PERSON" or isSwingingArm) and "LeftArm" or "Body")
                            models.models.main.Avatar.UpperBody.Arms.LeftArm:setRot(isSwingingArm and vectors.vec3((isHoldingItem and not isUsingSpyglass) and 20 or 0, 0, 0) or vectors.vec3(isHoldingItem and 20 or 0, 0, -10 + math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * -2.5))
                        end, "left_arm_render")
                    elseif state == 6 then
                        --自転車
                        events.TICK:register(function ()
                            self.parent.arms:processArmWingCount()
                            if animations["models.main"]["bicycle_idle"]:getTime() * 4 == 0 then
                                self.parent.arms:setArmState(nil, Gun.CurrentGunPosition == "RIGHT" and 2 or 8)
                            end
                        end, "left_arm_tick")
                        events.RENDER:register(function (delta, context)
                            local isLeftHanded = player:isLeftHanded()
                            local activeHand = player:getActiveHand()
                            local isUsingSpyglass = player:getActiveItem().id == "minecraft:spyglass" and ((activeHand == "MAIN_HAND" and isLeftHanded) or (activeHand == "OFF_HAND" and not isLeftHanded))
                            local isSwingingArm = (player:isSwingingArm() and isLeftHanded) or isUsingSpyglass
                            models.models.main.Avatar.UpperBody.Arms.LeftArm:setParentType((context == "FIRST_PERSON" or isSwingingArm) and "LeftArm" or "Body")
                            local bicycleIdleFactor = 1 - animations["models.main"]["bicycle_idle"]:getTime() * 4
                            local currentHandleRot = (self.parent.bicycle.handleRot - self.parent.bicycle.handleRotPrev) * delta + self.parent.bicycle.handleRot
                            models.models.main.Avatar.UpperBody.Arms.LeftArm:setRot(isSwingingArm and vectors.vec3(isUsingSpyglass and 40 or 20, 0, 0) or vectors.vec3(50 * (1 - bicycleIdleFactor) + 20, -8 * (1 - bicycleIdleFactor) + 8 * (currentHandleRot / 15), 0))
                        end, "left_arm_render")
                    elseif state == 7 then
                        --自転車で銃を持っているとき
                        events.TICK:register(function ()
                            self.parent.arms:processArmWingCount()
                            if player:isSwingingArm() and player:isLeftHanded() then
                                models.models.main.Avatar.UpperBody.Arms.LeftArm:setParentType("LeftArm")
                            else
                                models.models.main.Avatar.UpperBody.Arms.LeftArm:setParentType("Body")
                            end
                            if player:getActiveItem().id == "minecraft:crossbow" then
                                self.parent.arms:setArmState(3, 3)
                            end
                        end, "left_arm_tick")
                        events.RENDER:register(function (delta)
                            local headRot = vanilla_model.HEAD:getOriginRot()
                            local bicycleIdleFactor = 1 - animations["models.main"]["bicycle_idle"]:getTime() * 4
                            models.models.main.Avatar.UpperBody.Arms.LeftArm:setRot(player:isSwingingArm() and player:isLeftHanded() and vectors.vec3(60, 0, 0) or vectors.vec3(headRot.x + math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * -2.5 + (1 - bicycleIdleFactor) * 35 + 105, headRot.y, 0))
                        end, "left_arm_render")
                    elseif state == 8 then
                        --自転車で待機中
                        events.TICK:register(function ()
                            if animations["models.main"]["bicycle_idle"]:getTime() * 4 > 0 then
                                self.parent.arms:setArmState(nil, 6)
                            end
                        end, "left_arm_tick")
                    end
                end;
            };
        }

        instance.skirt = {
            skirtModels = {models.models.main.Avatar.UpperBody.Body.Skirt};
        }

        instance.gun = {
            scale = 1.4;

            gunPosition = {
                hold = {
                    type = "NORMAL";

                    firstPersonPos = {
                        right = vectors.vec3(-1.5, 0, -4);
                        left = vectors.vec3(1.5, 0, -4);
                    };

                    thirdPersonPos = {
                        right = vectors.vec3(-1.5, -0.5, -3);
                        left = vectors.vec3(1.5, -0.5, -3);
                    };
                };

                put = {
                    type = "BODY";

                    pos = {
                        right = vectors.vec3(0, 2, 2.75);
                        left = vectors.vec3(0, 2, 2.75);
                    };

                    rot = {
                        right = vectors.vec3(-135, -90, 0);
                        left = vectors.vec3(-135, 90, 0);
                    };
                };
            };

            sound = {
                name = "minecraft:entity.firework_rocket.blast";
                pitch = 1;
            };
        }

        instance.placementObjects = {

        }

        instance.exSkill = {
            {
                name = {
                    en_us = "Summon Drone: Fire Support";
                    ja_jp = "ドローン召喚：火力支援";
                };

                formationType = "STRIKER";

                models = {models.models.ex_skill_1.Drone};

                animations = {"main", "ex_skill_1"};

                camera = {
                    start = {
                        rot = vectors.vec3(0, 180, 0);
                        pos = vectors.vec3(7, 27, -10);
                    };

                    fin = {
                        rot = vectors.vec3(-15, 210, 5);
                        pos = vectors.vec3(-14, 7, -30);
                    };
                };

                callbacks = {
                    onPreAnimation = function (self)
                        models.models.ex_skill_1.Drone.LauncherRight.ShineEffects:setColor(client:hasShaderPack() and vectors.vec3(0.5, 1, 1) or vectors.vec3(1, 1, 1))
                        self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "TRIANGLE", 20, true)
                    end;

                    onAnimationTick = function (self, tick)
                        if tick == 20 then
                            self.parent.faceParts:setEmotion("HALF", "HALF", "TRIANGLE", 5, true)
                        elseif tick == 25 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "TRIANGLE", 10, true)
                        elseif tick == 35 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "ANGRY", 10, true)
                        elseif tick == 40 then
                            self.parent.faceParts:setEmotion("ANGRY", "ANGRY", "ANGRY", 30, true)
                        elseif tick == 41 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), player:getPos(), 0.5, 1.5)
                        end
                    end;
                };
            };

            {
                name = {
                    en_us = "Big catch";
                    ja_jp = "大物だ";
                };

                formationType = "SPECIAL";

                models = {models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.FishingRod};

                animations = {"main", "ex_skill_2"};

                camera = {
                    start = {
                        rot = vectors.vec3(0, 160, 0);
                        pos = vectors.vec3(13, 34, -33);
                    };

                    fin = {
                        rot = vectors.vec3(-10, 160, 0);
                        pos = vectors.vec3(-12, 36, -61);
                    };
                };

                callbacks = {
                    onPreTransition = function (self)
                        if not self.exSkill[2].init then
                            models.models.ex_skill_2.UnderWater:setLight(15)
                            models.models.ex_skill_2.Stage.Reef:setPrimaryTexture("RESOURCE", "textures/block/stone.png")
                            models.models.ex_skill_2.Stage.Ocean:setPrimaryTexture("RESOURCE", "textures/block/water_still.png")
                            self.exSkill[2].init = true
                        end
                        models.models.ex_skill_2.Stage.Ocean:setColor(world.getBiome(player:getPos()):getWaterColor())
                        models.models.ex_skill_2.Stage:setVisible(true)
                        models.models.main.Avatar:setPos(0, 8, 0)
                    end;

                    onPreAnimation = function (self)
                        models.models.main.Avatar:setPos()
                        self.parent.faceParts:setEmotion("CENTER", "NORMAL", "CLOSED", 107, true)
                        if host:isHost() then
                            local windowSize = client:getWindowSize()
                            models.models.ex_skill_2.UnderWater.ForCameraOffset.Background:setScale(vectors.vec3(windowSize.x / windowSize.y, 1, 1):scale(23))
                            local bodyYaw = player:getBodyYaw()
                            local backgroundPos = vectors.rotateAroundAxis(bodyYaw + 180, vectors.rotateAroundAxis(bodyYaw * -1 + 180, self.exSkill[2].camera.start.pos, 0, 1, 0):add(client:getCameraDir()), 0, 1, 0):scale(16 / 0.9375)
                            models.models.ex_skill_2.UnderWater:setOffsetPivot(backgroundPos)
                            models.models.ex_skill_2.UnderWater.ForCameraOffset:setPos(backgroundPos)
                            events.RENDER:register(function (_, context)
                                models.models.ex_skill_2.UnderWater:setVisible(context == "RENDER")
                            end, "ex_skill_2_render")
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.bubble_column.upwards_inside"), player:getPos(), 1, 0.5)
                        end
                    end;

                    onAnimationTick = function (self, tick)
                        if tick <= 28 and host:isHost() then
                            local finPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.UnderWater.ForCameraOffset.Tuna.RearBody.TailFin)
                            for _ = 1, 5 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:underwater"), finPos:copy():add(math.random() * 0.1 - 0.05, math.random() * 0.1 - 0.05, 0)):setScale(0.2)
                            end
                        elseif tick >= 37 and tick < 73 and host:isHost() then
                            local headPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.UnderWater.ForCameraOffset.Tuna.FrontBody.Head)
                            local tunaRotY = models.models.ex_skill_2.UnderWater.ForCameraOffset.Tuna:getAnimRot().y
                            local cameraRotY = renderer:getCameraRot().y
                            local particleCount = math.max(tick - 52, 0)
                            for i = 0, 2 * math.pi, math.pi / 6 do
                                particles:newParticle(self.parent.compatibilityUtils.getDustParticleId(vectors.vec3(100, 1000000000, 1000000000), particleCount / 27 + 1), vectors.rotateAroundAxis(tunaRotY + cameraRotY, 0, math.cos(i) * 0.3, math.sin(i) * 0.3, 0, 1, 0):add(headPos)):setVelocity(vectors.rotateAroundAxis(tunaRotY - cameraRotY - 90, 0, 0, 0.1, 0, 1, 0)):setLifetime(20)
                            end
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.squid.ambient"), player:getPos(), 1, 0.75)
                        elseif tick == 78 and host:isHost() then
                            events.RENDER:remove("ex_skill_2_render")
                            models.models.ex_skill_2.UnderWater:setVisible(false)
                        elseif tick == 107 then
                            self.parent.faceParts:setEmotion("NARROW_CENTER", "NARROW", "CLOSED", 27, true)
                        elseif tick == 134 then
                            self.parent.faceParts:setEmotion("NARROW_ANGRY_CENTER", "NARROW_ANGRY", "TRIANGLE", 16, true)
                        elseif tick == 139 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), player:getPos(), 1, 1.5)
                            if host:isHost() then
                                local windowSize = client:getWindowSize()
                                models.models.ex_skill_2.Flash.ForCameraOffset2.Background:setScale(vectors.vec3(windowSize.x / windowSize.y, 1, 1):scale(22.5))
                                local backgroundPos = vectors.rotateAroundAxis(player:getBodyYaw() + 180, renderer:getCameraOffsetPivot():copy():add(0, 1.62, 0):add(client:getCameraDir():copy()), 0, 1, 0):scale(16 / 0.9375)
                                models.models.ex_skill_2.Flash:setOffsetPivot(backgroundPos)
                                models.models.ex_skill_2.Flash.ForCameraOffset2:setPos(backgroundPos)
                                models.models.ex_skill_2.Flash:setVisible(true)
                            end
                        elseif tick == 148 and host:isHost() then
                            models.models.ex_skill_2.Flash:setVisible(false)
                        elseif tick == 150 then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "CLOSED", 8, true)
                            if host:isHost() then
                                renderer:setPostEffect("phosphor")
                            end
                        elseif tick == 157 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.attack.sweep"), player:getPos(), 0.5, 2)
                        elseif tick == 158 then
                            self.parent.faceParts:setEmotion("CENTER", "NORMAL", "CLOSED", 48, true)
                        elseif tick >= 160 and tick <= 170 and host:isHost() then
                            local cameraPos = renderer:getCameraOffsetPivot()
                            for i = 0, 8 do
                                particles:newParticle(self.parent.compatibilityUtils.getDustParticleId(vectors.vec3(100, 1000000000, 1000000000), 4), cameraPos:copy():add(player:getPos()):add((i % 3 - 1) * 0.25, 1.25, (math.floor(i / 3) - 1) * 0.25)):setLifetime(5):setVelocity(0, 0.25, 0)
                            end
                            if tick == 160 then
                                local playerPos = player:getPos()
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.bucket.empty"), playerPos, 1, 0.25)
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.bucket.empty"), playerPos, 1, 0.5)
                            elseif tick == 170 then
                                renderer:setPostEffect()
                            end
                        elseif tick == 175 then
                            models.models.ex_skill_2.UnderWater.ForCameraOffset.Tuna:moveTo(models.models.ex_skill_2)
                            local playerPos = player:getPos()
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.generic.splash"), playerPos, 1, 0.5)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:ambient.underwater.exit"), playerPos, 0.5, 0.5)
                        elseif tick == 180 then
                            local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Tuna)
                            for _ = 1, 50 do
                                particles:newParticle(self.parent.compatibilityUtils.getDustParticleId(vectors.vec3(100, 1000000000, 1000000000), 3), anchorPos:copy()):setVelocity(vectors.rotateAroundAxis(player:getBodyYaw() * -1, math.random() * 0.2, math.random() * 0.25 + 0.125, math.random() * 0.2 - 0.1, 0, 1, 0)):setGravity(0.5):setLifetime(25)
                            end
                        end
                        if tick % 35 == 24 and tick <= 160 then
                            local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Stage.Reef.ExSkill2ParticleAnchor)
                            local bodyYaw = player:getBodyYaw()
                            for _ = 1, 50 do
                                local particleOffset = math.random()
                                particles:newParticle(self.parent.compatibilityUtils.getDustParticleId(vectors.vec3(1000000000, 1000000000, 1000000000), 5), anchorPos:copy():add(vectors.rotateAroundAxis(bodyYaw * -1, particleOffset - 0.5, 0, 0, 0, 1, 0))):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, particleOffset * 0.5 - 0.25, math.random() * 0.5 + 0.25, math.random() * 0.25 - 0.125, 0, 1, 0)):setGravity(1):setLifetime(40)
                            end
                            if tick >= 80 or not host:isHost() then
                                local playerPos = player:getPos()
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.bucket.empty"), playerPos, 1, 0.25)
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.bucket.empty"), playerPos, 1, 0.5)
                            end
                        end
                        if tick <= 139 or tick % 2 == 0 then
                            local currentFrame = models.models.ex_skill_2.Stage.Ocean:getUVPixels().y / 16
                            if currentFrame < 31 then
                                models.models.ex_skill_2.Stage.Ocean:setUVPixels(0, (currentFrame + 1) * 16)
                            else
                                models.models.ex_skill_2.Stage.Ocean:setUVPixels()
                            end
                        end
                        if (tick >= 83 and tick < 110) or (tick >= 110 and tick <= 130 and tick % 2 == 0) then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.dispenser.fail"), player:getPos(), 0.5, 5)
                        end
                    end;

                    onPostAnimation = function (_, forcedStop)
                        if models.models.ex_skill_2.Tuna ~= nil then
                            models.models.ex_skill_2.Tuna:moveTo(models.models.ex_skill_2.UnderWater.ForCameraOffset)
                        end
                        if forcedStop and host:isHost() then
                            events.RENDER:remove("ex_skill_2_render")
                            for _, modelPart in ipairs({models.models.ex_skill_2.UnderWater, models.models.ex_skill_2.Flash}) do
                                modelPart:setVisible(false)
                            end
                            renderer:setPostEffect()
                        elseif not forcedStop then
                            models.models.main.Avatar:setPos(0, 8, 0)
                        end
                    end;

                    onPostTransition = function ()
                        models.models.ex_skill_2.Stage:setVisible(false)
                        models.models.main.Avatar:setPos()
                    end;
                };

                ---このExスキルの初期化処理が行われたかどうか
                ---@param boolean
                init = false;
            };

            {
                name = {
                    en_us = "Ride & Grenade";
                    ja_jp = "ライド＆グレネード";
                };

                formationType = "STRIKER";

                models = {models.models.main.Avatar.LowerBody.Bicycle};

                animations = {"main", "ex_skill_3"};

                camera = {
                    start = {
                        rot = vectors.vec3(60, 0, 0);
                        pos = vectors.vec3(-71, 28, 0);
                    };

                    fin = {
                        rot = vectors.vec3(0, 40, -25);
                        pos = vectors.vec3(-119, 27, -938.5);
                    };
                };

                callbacks = {
                    onPreAnimation = function (self)
                        self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "CLOSED2", 40, true)
                        self.exSkill[3].windSound = sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.elytra.flying"), player:getPos(), 0.05, 2)
                    end;

                    onAnimationTick = function (self, tick)
                        if tick == 40 then
                            self.parent.faceParts:setEmotion("NORMAL", "INVERTED", "CLOSED2", 7, true)
                        elseif tick == 27 and host:isHost() then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.attack.sweep"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 0.1, 0.75)
                        elseif tick == 47 then
                            self.parent.faceParts:setEmotion("NARROW_ANGRY", "NARROW_ANGRY_INVERTED", "TRIANGLE", 35, true)
                        elseif tick >= 58 and tick < 80 then
                            if tick == 58 then
                                self.exSkill[3].windSound:stop()
                                self.exSkill[3].windSound = nil
                            end
                            local bicycleYaw = models.models.main.Avatar:getAnimRot().y + player:getBodyYaw() * -1
                            local bicyclePos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.Bicycle)
                            local frontWheelPos = vectors.rotateAroundAxis(bicycleYaw, 0, 0, 0.5625, 0, 1, 0):add(bicyclePos)
                            local backWheelPos = vectors.rotateAroundAxis(bicycleYaw, 0, 0, -0.5625, 0, 1, 0):add(bicyclePos)
                            for _ = 1, 5 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), frontWheelPos):setColor(0.973, 0.714, 0.29):setScale(0.5):setVelocity(math.random() * 0.5 - 0.25, math.random() * 0.25, math.random() * 0.5 - 0.25)
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), backWheelPos):setColor(0.973, 0.714, 0.29):setScale(0.5):setVelocity(math.random() * 0.5 - 0.25, math.random() * 0.25, math.random() * 0.5 - 0.25)
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:campfire_cosy_smoke"), frontWheelPos):setVelocity(math.random() * 0.2 - 0.1, 0.015, math.random() * 0.2 - 0.1)
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:campfire_cosy_smoke"), backWheelPos):setVelocity(math.random() * 0.2 - 0.1, 0.015, math.random() * 0.2 - 0.1)
                            end
                            local particleBlock = world.getBlockState(bicyclePos:copy():sub(0, 0.5, 0)).id
                            if particleBlock ~= "minecraft:air" and particleBlock ~= "minecraft:void_air" then
                                for _ = 1, 5 do
                                    particles:newParticle(self.parent.compatibilityUtils.getBlockParticleId(particleBlock), frontWheelPos)
                                    particles:newParticle(self.parent.compatibilityUtils.getBlockParticleId(particleBlock), backWheelPos)
                                end
                            end
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.gravel.hit"), bicyclePos, 0.1, 0.5)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.grindstone.use"), bicyclePos, 0.1, 3)
                        elseif tick == 82 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "TRIANGLE", 15, true)
                            models.models.main.Avatar.LowerBody.Bicycle.Shaft.Shaft8.WaterBottle:moveTo(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom)
                        elseif tick == 97 then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "TRIANGLE", 4, true)
                        elseif tick == 101 then
                            self.parent.faceParts:setEmotion("NARROW_ANGRY", "NARROW_ANGRY_INVERTED", "CLOSED2", 26, true)
                        elseif tick == 109 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.attack.sweep"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 0.25, 0.5)
                            if host:isHost() then
                                local windowSize = client:getWindowSize()
                                models.models.ex_skill_3.CameraBackground.Background:setScale(vectors.vec3(windowSize.x / windowSize.y, 1, 1):scale(33.5))
                                local backgroundPos = vectors.rotateAroundAxis(player:getBodyYaw() + 180, renderer:getCameraOffsetPivot():copy():add(0, 1.62, 0):add(client:getCameraDir():copy():scale(1.5)), 0, 1, 0):scale(16 / 0.9375)
                                models.models.ex_skill_3.CameraBackground:setOffsetPivot(backgroundPos)
                                models.models.ex_skill_3.CameraBackground.Background:setPos(backgroundPos)
                                models.models.ex_skill_3.CameraBackground:setVisible(true)
                            end
                        end
                        if tick < 58 then
                            models.models.main.Avatar.LowerBody.Bicycle.Wheels.Chain:setUVPixels(tick % 2, 0)
                            self.exSkill[3].windSound:setVolume(math.clamp(16 - client:getCameraPos():sub(self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar)):length(), 0, 8) / 160)
                        end
                        if tick < 69 then
                            local bodyYaw = player:getBodyYaw()
                            local avatarPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar)
                            particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:cloud"), vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 8 - 4, math.random() * 4, 10, 0, 1, 0):add(avatarPos)):setColor(1, 1, 1, 0.25):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, 0, 0, -0.5, 0, 1, 0))
                        end
                    end;

                    onPostAnimation = function ()
                        if models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.WaterBottle ~= nil then
                            models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.WaterBottle:moveTo(models.models.main.Avatar.LowerBody.Bicycle.Shaft.Shaft8)
                        end
                        if host:isHost() then
                            models.models.ex_skill_3.CameraBackground:setVisible(false)
                        end
                    end;
                };

                ---風切り音
                ---@type Sound|nil
                windSound = nil;
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
                    name = "masked";

                    displayName = {
                        en_us = "Masked Swimsuit Group";
                        ja_jp = "覆面水着団";
                    };

                    exSkill = 1;
                };

                {
                    name = "swimsuit";

                    displayName = {
                        en_us = "Swimsuit";
                        ja_jp = "水着";
                    };

                    exSkill = 2;
                };

                {
                    name = "riding";

                    displayName = {
                        en_us = "Riding";
                        ja_jp = "ライディング";
                    };

                    exSkill = 3;
                };
            };

            callbacks = {
                onChange = function (self, costumeId)
                    if costumeId == "RIDING" then
                        --ライディング
                        self.parent.costume.setCostumeTextureOffset(2)
                        models.models.main.Avatar.UpperBody.Body.Hairs.FrontHair:setPos(0, 0, 0.25)
                        models.models.main.Avatar.UpperBody.Body.Hairs.BackHair:setPos(0, 0, -0.25)
                        for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.CRidingB, models.models.main.Avatar.UpperBody.Arms.RightArm.CRidingRA, models.models.main.Avatar.UpperBody.Arms.LeftArm.CRidingLA}) do
                            modelPart:setVisible(true)
                        end
                        for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Scarf, models.models.main.Avatar.UpperBody.Body.Skirt, models.models.main.Avatar.UpperBody.Body.IDCard}) do
                            modelPart:setVisible(false)
                        end
                    elseif costumeId == "MASKED" then
                        --覆面水着団
                        for _, modelPart in ipairs({models.models.main.Avatar.Head.CMaskedH}) do
                            modelPart:setVisible(true)
                        end
                        for _, modelPart in ipairs({models.models.main.Avatar.Head.HairPin, models.models.main.Avatar.Head.HairEnds, models.models.main.Avatar.UpperBody.Body.Hairs}) do
                            modelPart:setVisible(false)
                        end
                    elseif costumeId == "SWIMSUIT" then
                        --水着
                        self.parent.costume.setCostumeTextureOffset(1)
                        for _, modelPart in ipairs({models.models.main.Avatar.Head.Head, models.models.main.Avatar.Head.HatLayer}) do
                            modelPart:setUVPixels(0, 16)
                        end
                        for _, modelPart in ipairs({models.models.main.Avatar.Head.HairEnds, models.models.main.Avatar.UpperBody.Body.Scarf, models.models.main.Avatar.UpperBody.Body.Skirt, models.models.main.Avatar.UpperBody.Body.Hairs, models.models.main.Avatar.UpperBody.Body.IDCard}) do
                            modelPart:setVisible(false)
                        end
                        models.models.main.Avatar.Head.CSwimsuitH:setVisible(true)
                    end
                end;

                onReset = function (self)
                    self.parent.costume.setCostumeTextureOffset(0)
                    for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Hairs.FrontHair, models.models.main.Avatar.UpperBody.Body.Hairs.BackHair}) do
                        modelPart:setPos()
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.Head, models.models.main.Avatar.Head.HatLayer}) do
                        modelPart:setUVPixels()
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.CMaskedH, models.models.main.Avatar.Head.CSwimsuitH, models.models.main.Avatar.UpperBody.Body.CRidingB, models.models.main.Avatar.UpperBody.Arms.RightArm.CRidingRA, models.models.main.Avatar.UpperBody.Arms.LeftArm.CRidingLA}) do
                        modelPart:setVisible(false)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.HairPin, models.models.main.Avatar.Head.HairEnds, models.models.main.Avatar.UpperBody.Body.Hairs, models.models.main.Avatar.UpperBody.Body.Scarf, models.models.main.Avatar.UpperBody.Body.IDCard, models.models.main.Avatar.UpperBody.Body.Scarf.Scarf2, models.models.main.Avatar.UpperBody.Body.Scarf.Scarf3, models.models.main.Avatar.UpperBody.Body.Scarf.Scarf4, models.models.main.Avatar.UpperBody.Body.Skirt}) do
                        modelPart:setVisible(true)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Hairs.FrontHair, models.models.main.Avatar.UpperBody.Body.Hairs.BackHair}) do
                        modelPart:setPos()
                    end
                end;

                onArmorChange = function (self, parts, isVisible)
                    if parts == "HELMET" then
                        if isVisible then
                            models.models.main.Avatar.Head.CSwimsuitH:setVisible(false)
                        elseif self.parent.costume.currentCostume == 4 then
                            models.models.main.Avatar.Head.CSwimsuitH:setVisible(true)
                        end
                    elseif parts == "CHEST_PLATE" then
                        if isVisible then
                            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Scarf.Scarf2, models.models.main.Avatar.UpperBody.Body.Scarf.Scarf3, models.models.main.Avatar.UpperBody.Body.Scarf.Scarf4}) do
                                modelPart:setVisible(false)
                            end
                            models.models.main.Avatar.UpperBody.Body.Hairs.FrontHair:setPos(0, 0, -0.75)
                            models.models.main.Avatar.UpperBody.Body.Hairs.BackHair:setPos(0, 0, 0.75)
                        else
                            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Scarf.Scarf2, models.models.main.Avatar.UpperBody.Body.Scarf.Scarf3, models.models.main.Avatar.UpperBody.Body.Scarf.Scarf4}) do
                                modelPart:setVisible(true)
                            end
                            if self.parent.costume.currentCostume == 2 then
                                models.models.main.Avatar.UpperBody.Body.Hairs.FrontHair:setPos(0, 0, -0.75)
                                models.models.main.Avatar.UpperBody.Body.Hairs.BackHair:setPos(0, 0, 0.75)
                            else
                                for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Hairs.FrontHair, models.models.main.Avatar.UpperBody.Body.Hairs.BackHair}) do
                                    modelPart:setPos()
                                end
                            end
                            models.models.main.Avatar.UpperBody.Body.Hairs.FrontHair:setPos(0, 0, 0.25)
                            models.models.main.Avatar.UpperBody.Body.Hairs.BackHair:setPos(0, 0, -0.25)
                        end
                    elseif parts == "LEGGINGS" then
                        models.models.main.Avatar.UpperBody.Body.Skirt:setVisible(not isVisible and self.parent.costume.currentCostume <= 2)
                    end
                end;
            };
        }

        instance.bubble = {
            callbacks = {
                onPlay = function(self, type, duration)
                    if duration > 0 then
                        if type == "GOOD" then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "CLOSED", duration, true)
                        elseif type == "HEART" then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "CLOSED", duration, true)
                        elseif type == "NOTE" then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "TRIANGLE", duration, true)
                        elseif type == "QUESTION" then
                            self.parent.faceParts:setEmotion("NORMAL","NORMAL", "ANGRY", duration, true)
                        elseif type == "SWEAT" then
                            if not self.parent.bicycle.isTyreBurst then
                                self.parent.faceParts:setEmotion("NARROW_ANGRY", "NARROW_ANGRY", "ANGRY", duration, true)
                            else
                                self.parent.faceParts:setEmotion("SURPRISED", "SURPRISED", "ANGRY", duration, true)
                            end
                        end
                    end
                end;

                onStop = function(self, type, forcedStop)
                    if not forcedStop then
                        self.parent.faceParts:resetEmotion();
                    end
                end;
            };
        }

        instance.headBlock = {
            includeModels = {models.models.main.Avatar.UpperBody.Body.Hairs};

            callbacks = {
                onBeforeModelCopy = function ()
                    models.models.main.Avatar.Head:setRot()
                end;
            };
        }

        instance.portrait = {
            includeModels = {};

            callbacks = {
                onBeforeModelCopy = function ()
                    models.models.main.Avatar.Head:setRot()
                end;
            };
        }

        instance.deathAnimation = {
            callbacks = {
                onPhase1 = function (_, dummyAvatar, costume)
                    dummyAvatar.Head.Ears.RightEarPivot:setRot(-49.02, -11.44, -9.77)
                    dummyAvatar.Head.Ears.LeftEarPivot:setRot(-49.02, 11.44, 9.77)
                    if costume == "DEFAULT" or costume == "MASKED" then
                        dummyAvatar.UpperBody.Body.Skirt:setRot(27.5, 0, 0)
                    end
                end;

                onPhase2 = function (_, dummyAvatar, costume)
                    if costume == "DEFAULT" or costume == "MASKED" then
                        dummyAvatar.UpperBody.Body.Skirt:setRot(12.5, 0, 0)
                    end
                end;
            };
        }

        instance.actionWheel = {
            isVehicleOptionEnabled = true;
        }

        instance.physics = {
            physicData = {
                {
                    models = {models.models.main.Avatar.UpperBody.Body.Hairs.FrontHair};

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
                            min = -80;
                            neutral = 0;
                            max = 0;

                            bodyX = {
                                multiplayer = -80;
                                min = -80;
                                max = 0;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -80;
                                max = 0;
                            };

                            bodyRot = {
                                multiplayer = 0.05;
                                min = -80;
                                max = 0;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Scarf.Scarf2};

                    x = {
                        vertical = {
                            min = 0;
                            neutral = 0;
                            max = 140;
                            sneakOffset = 30;

                            bodyX = {
                                multiplayer = -160;
                                min = 0;
                                max = 90;
                            };

                            bodyY = {
                                multiplayer = -160;
                                min = 0;
                                max = 140;
                            };

                            bodyRot = {
                                multiplayer = -0.05;
                                min = 0;
                                max = 90;
                            };
                        };

                        horizontal = {
                            min = 0;
                            neutral = 90;
                            max = 90;

                            bodyX = {
                                multiplayer = -160;
                                min = 0;
                                max = 90;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Scarf.Scarf3};

                    x = {
                        vertical = {
                            min = 2;
                            neutral = 2;
                            max = 140;
                            sneakOffset = 30;

                            bodyX = {
                                multiplayer = -160;
                                min = 2;
                                max = 90;
                            };

                            bodyY = {
                                multiplayer = -160;
                                min = 2;
                                max = 140;
                            };

                            bodyRot = {
                                multiplayer = -0.05;
                                min = 2;
                                max = 90;
                            };
                        };

                        horizontal = {
                            min = 2;
                            neutral = 90;
                            max = 90;

                            bodyX = {
                                multiplayer = -160;
                                min = 2;
                                max = 90;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Scarf.Scarf2.Scarf2, models.models.main.Avatar.UpperBody.Body.Scarf.Scarf3.Scarf3, models.models.main.Avatar.UpperBody.Body.Scarf.Scarf4.Scarf4};

                    z = {
                        vertical = {
                            min = -90;
                            neutral = 0;
                            max = 90;

                            bodyZ = {
                                multiplayer = -80;
                                min = -90;
                                max = 90;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Scarf.Scarf4};

                    x = {
                        vertical = {
                            min = -140;
                            neutral = 0;
                            max = 0;

                            bodyX = {
                                multiplayer = -160;
                                min = -90;
                                max = 0;
                            };

                            bodyY = {
                                multiplayer = 160;
                                min = -140;
                                max = 0;
                            };

                            bodyRot = {
                                multiplayer = 0.05;
                                min = -90;
                                max = 0;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CSwimsuitH};

                    x = {
                        vertical = {
                            min = -140;
                            neutral = 0;
                            max = 0;

                            headRotMultiplayer = -1;

                            bodyX = {
                                multiplayer = -80;
                                min = -90;
                                max = 0;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -140;
                                max = 0;
                            };

                            bodyRot = {
                                multiplayer = 0.05;
                                min = -90;
                                max = 0;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CSwimsuitH.HairTail};

                    z = {
                        vertical = {
                            min = -90;
                            neutral = 0;
                            max = 90;

                            bodyZ = {
                                multiplayer = -80;
                                min = -90;
                                max = 90;
                            };
                        };
                    };
                };
            };
        }

        instance.dataSync = {
            syncData = {
                isFlying = false;
            };

            callbacks = {
                onDataSynced = function (self)
                    self.parent.drone.isFlying = self.dataSync.syncData.isFlying
                end;
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