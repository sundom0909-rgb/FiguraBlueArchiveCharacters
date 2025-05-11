---@alias BlueArchiveCharacter.RightEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "UNEQUAL" # 不等号目（><）
---| "INVERTED" # 反対側を見る目
---| "ANGRY" # 怒った目
---| "CLOSED2" # 閉じた目2
---| "FEAR" # 恐怖を感じているときの目
---| "FEAR_CENTER" # 恐怖を感じてつつ少し反対側を見る目
---| "CLOSED2_WITH_TEAR" # 涙ぐみつつ閉じた目2

---@alias BlueArchiveCharacter.LeftEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "UNEQUAL" # 不等号目（><）
---| "ANGRY_INVERTED" # 怒りつつ反対側を見る目
---| "CLOSED2" # 閉じた目2
---| "FEAR" # 恐怖を感じているときの目
---| "FEAR_CENTER" # 恐怖を感じてつつ少し反対側を見る目
---| "CLOSED2_WITH_TEAR" # 涙ぐみつつ閉じた目2
---| "ANGRY" # 怒った目
---| "INVERTED" # 反対側を見る目

---@alias BlueArchiveCharacter.MouthTextures
---| "NORMAL" # 通常
---| "SHOCK" # あんぐり口
---| "FRUST" # ぐにゅぐにゅ口
---| "SMALL" # 小さく開けた口
---| "CLOSED" # 閉じた口
---| "ANGRY" # 怒った口
---| "FEAR" # 恐怖を感じているときの口
---| "SMILE" # にっこり
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
---@field public addtionalCheckFunc? fun(self: BlueArchiveCharacter): boolean 吹き出しエモートを表示するかどうかの追加チェック関数
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
                en_us = "Yuzu";
                ja_jp = "ユズ";
            };

            lastName = {
                en_us = "Hanaoka";
                ja_jp = "花岡";
            };

            clubName = {
                en_us = "Game Development Department";
                ja_jp = "ゲーム開発部";
            };

            birth = {
                month = 8;
                day = 12;
            };
        }

        instance.faceParts = {
            rightEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(2, 0); --必須
                TIRED = vectors.vec2(3, 0); --必須
                CLOSED = vectors.vec2(4, 0); --必須
                UNEQUAL = vectors.vec2(5, 0);
                INVERTED = vectors.vec2(6, 0);
                ANGRY = vectors.vec2(7, 0);
                CLOSED2 = vectors.vec2(9, 0);
                FEAR = vectors.vec2(0, 1);
                FEAR_CENTER = vectors.vec2(1, 1);
                CLOSED2_WITH_TEAR = vectors.vec2(2, 1);
            };

            leftEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(1, 0); --必須
                TIRED = vectors.vec2(2, 0); --必須
                CLOSED = vectors.vec2(3, 0); --必須
                UNEQUAL = vectors.vec2(4, 0);
                ANGRY_INVERTED = vectors.vec2(7, 0);
                CLOSED2 = vectors.vec2(8, 0);
                FEAR = vectors.vec2(-1, 1);
                FEAR_CENTER = vectors.vec2(0, 1);
                CLOSED2_WITH_TEAR = vectors.vec2(1, 1);
                ANGRY = vectors.vec2(2, 1);
                INVERTED = vectors.vec2(3, 1);
            };

            mouth = {
                SHOCK = vectors.vec2(0, 0);
                FRUST = vectors.vec2(1, 0);
                SMALL = vectors.vec2(2, 0);
                CLOSED = vectors.vec2(3, 0);
                ANGRY = vectors.vec2(0, 1);
                FEAR = vectors.vec2(1, 1);
                SMILE = vectors.vec2(2, 1);
                OPENED = vectors.vec2(3, 1);
            };
        }

        instance.arms = {
            callbacks = {
                onArmStateChanged = function (self, right, left)
                    if self.costume.costumes[2].shouldShowChest then
                        return {right = 4, left = 4}
                    end
                end;

                onAdditionalRightArmProcess = function (self, state)
                    if state == 4 then
                        models.models.main.Avatar.UpperBody.Arms.RightArm:setRot(0, 0, 15)
                        models.models.main.Avatar.UpperBody.Arms.RightArm:setParentType("Body")
                    end
                end;

                onAdditionalLeftArmProcess = function (self, state)
                    if state == 4 then
                        models.models.main.Avatar.UpperBody.Arms.LeftArm:setRot(0, 0, -15)
                        models.models.main.Avatar.UpperBody.Arms.LeftArm:setParentType("Body")
                    end
                end;
            };
        }

        instance.skirt = {
            skirtModels = {models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1}
        }

        instance.gun = {
            scale = 0.8;

            gunPosition = {
                hold = {
                    firstPersonPos = {
                        right = vectors.vec3(0, 3, -4);
                        left = vectors.vec3(0, 3, -4);
                    };

                    thirdPersonPos = {
                        right = vectors.vec3(-2.25, 3, -4.5);
                        left = vectors.vec3(2.25, 3, -4.5);
                    };
                };

                put = {
                    type = "HIDDEN";
                };
            };

            sound = {
                name = "minecraft:entity.arrow.shoot";
                pitch = 0.5;
            };

            ---武器のアニメーション用のティック変数
            ---@type integer
            animationTick = 0;

            ---前ティックの銃の位置
            ---@type Gun.GunPosition
            gunPositionPrev = "NONE";
        }

        instance.placementObjects = {
        }

        instance.exSkill = {
            exSkills = {
                {
                    name = {
                        en_us = "Game Start!";
                        ja_jp = "ゲームスタート！";
                    };

                    formationType = "STRIKER";

                    models = {models.models.main.Avatar.Head.ShineRing};

                    animations = {"main", "gun", "ex_skill_1"};

                    camera = {
                        start = {
                            rot = vectors.vec3(-10, 130, 0);
                            pos = vectors.vec3(9, 22, -12.7);
                        };

                        fin = {
                            rot = vectors.vec3(0, 180, -15);
                            pos = vectors.vec3(0, 24, -16.7);
                        };
                    };

                    callbacks = {
                        onPreAnimation = function (self)
                            if not self.exSkill.exSkills[1].init then
                                if host:isHost() then
                                    models.models.ex_skill_1.Background.Background2.Action.ActionBackground.ActionTextAnchor:newText("ex_skill_1_action_text"):setAlignment("CENTER"):setOutlineColor(0.33, 1, 1)
                                    models.models.ex_skill_1.Background.Background2.Cancel.CancelBackground.CancelTextAnchor:newText("ex_skill_1_cancel_text"):setText("CANCEL"):setAlignment("CENTER"):setOutline(true):setOutlineColor(0.33, 1, 1)
                                    models.models.ex_skill_1.Background.Background2.Action.ActionBackground.ActionBackground:setColor(0.055, 0.341, 0.702)
                                    models.models.ex_skill_1.Background.Background2.Cancel.CancelBackground.CancelBackground:setColor(0.698, 0.016, 0.184)
                                    models.models.ex_skill_1.Gui.NameArea:setScale(4, 4, 4)
                                    models.models.ex_skill_1.Gui.NameArea.NameAreaRight:newText("ex_skill_1_name_text_1"):setText("§lYUZU"):setPos(30, 5.5, -1):setScale(1.2, 1.2, 1):setAlignment("CENTER"):setOutline(true):setOutlineColor(0.33, 1, 1)
                                    models.models.ex_skill_1.Gui.NameArea.NameAreaRight:newText("ex_skill_1_name_text_2"):setText("§lYUZU"):setPos(30, 4.5, -0.5):setScale(1.2, 1.2, 1):setAlignment("CENTER"):setOutline(true):setOutlineColor(0.33, 0.5, 0.5)
                                end
                                self.exSkill.exSkills[1].init = false
                            end
                            if host:isHost() then
                                local randomNum = math.random()
                                self.exSkill.exSkills[1].actionTextIndex = randomNum < 0.95 and 1 or (randomNum < 0.975 and 2 or 3)
                                models.models.ex_skill_1.Background.Background2.Action.ActionBackground.ActionTextAnchor:getTask("ex_skill_1_action_text"):setText("§7"..(self.exSkill.exSkills[1].actionTextIndex == 1 and "ACTION" or (self.exSkill.exSkills[1].actionTextIndex == 2 and "MINE" or "CRAFT")))
                                models.models.ex_skill_1.Gui.NameArea:setPos(client:getScaledWindowSize():scale(-1):augmented(0))
                            end
                            self.parent.faceParts:setEmotion("UNEQUAL", "UNEQUAL", "SHOCK", 9, true)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:ui.toast.in"), player:getPos(), 1, 1)
                        end;

                        onAnimationTick = function (self, tick)
                            if tick == 0 then
                                models.models.main.Avatar.UpperBody.Body.Gun:moveTo(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom)
                                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun:setPos()
                                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun:setRot()
                                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun.Grenade:setVisible(true)
                                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun.GameDisplay.Display:setColor(0, 0, 0)
                                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun.GameDisplay.DisplayFlash:setVisible(true)
                                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun:setVisible(true)
                            end

                            if tick == 8 then
                                local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun.GameDisplay.ExSkill1ParticleAnchor)
                                for i = -2, 5 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), anchorPos):setScale(0.25):setVelocity(vectors.rotateAroundAxis(player:getBodyYaw() * -1, 0.01, i * 0.01, -0.025, 0, 1, 0)):setColor(0.996, 1, 0.039)
                                end
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.chiseled_bookshelf.insert"), anchorPos, 0.5, 5)
                            elseif tick == 9 then
                                self.parent.faceParts:setEmotion("UNEQUAL", "UNEQUAL", "FRUST", 9, true)
                            elseif tick == 18 then
                                self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "FRUST", 8, true)
                            elseif tick == 21 then
                                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun.GameDisplay.Display:setColor()
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun.GameDisplay), 0.25, 2)
                                if host:isHost() then
                                    models.models.ex_skill_1.Background:setVisible(true)
                                    local barWidthScale = 0.135 * client:getScaledWindowSize().x
                                    for _, modelPart in ipairs({models.models.ex_skill_1.Background.Background2.Action.ActionBackground, models.models.ex_skill_1.Background.Background2.Cancel.CancelBackground}) do
                                        modelPart:setScale(barWidthScale, 1, 1)
                                    end
                                    for _, modelPart in ipairs({models.models.ex_skill_1.Background.Background2.Action.ActionBackground.ActionTextAnchor, models.models.ex_skill_1.Background.Background2.Cancel.CancelBackground.CancelTextAnchor}) do
                                        modelPart:setPos(1 / barWidthScale * -15, 0, 0)
                                    end
                                    models.models.ex_skill_1.Background.Background2.Action.ActionBackground.ActionTextAnchor:getTask("ex_skill_1_action_text"):setPos(0, 1.4, 0)
                                    models.models.ex_skill_1.Background.Background2.Cancel.CancelBackground.CancelTextAnchor:getTask("ex_skill_1_cancel_text"):setPos(0, 1.4, 0)
                                    events.RENDER:register(function ()
                                        local backgroundPos = vectors.rotateAroundAxis(player:getBodyYaw() + 180, renderer:getCameraOffsetPivot():copy():add(0, 1.62, 0):add(client:getCameraDir():copy():scale(1.3)), 0, 1, 0):scale(16 / 0.9375)
                                        models.models.ex_skill_1.Background:setOffsetPivot(backgroundPos)
                                        models.models.ex_skill_1.Background.Background2:setPos(backgroundPos)
                                        models.models.ex_skill_1.Background.Background2:setRot(0, 0, renderer:getCameraRot().z)
                                        local actionTextScale = models.models.ex_skill_1.Background.Background2.Action.ActionBackground.ActionTextAnchor:getScale().x
                                        models.models.ex_skill_1.Background.Background2.Action.ActionBackground.ActionTextAnchor:getTask("ex_skill_1_action_text"):setScale(vectors.vec3(1 / barWidthScale, 1, 1):scale(0.4 * actionTextScale))
                                        local cancelTextScale = models.models.ex_skill_1.Background.Background2.Cancel.CancelBackground.CancelTextAnchor:getScale().x
                                        models.models.ex_skill_1.Background.Background2.Cancel.CancelBackground.CancelTextAnchor:getTask("ex_skill_1_cancel_text"):setScale(vectors.vec3(1 / barWidthScale, 1, 1):scale(0.4 * cancelTextScale))
                                    end, "ex_skill_1_background_render")
                                end
                            elseif tick == 26 then
                                self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "FRUST", 3, true)
                            elseif tick == 29 then
                                self.parent.faceParts:setEmotion("INVERTED", "NORMAL", "SMALL", 4, true)
                            elseif tick == 33 then
                                self.parent.faceParts:setEmotion("INVERTED", "NORMAL", "SMALL", 2, true)
                            elseif tick == 31 and host:isHost() then
                                models.models.ex_skill_1.Background.Background2.Action.ActionBackground.ActionTextAnchor:getTask("ex_skill_1_action_text"):setText(self.exSkill.exSkills[1].actionTextIndex == 1 and "ACTION" or (self.exSkill.exSkills[1].actionTextIndex == 2 and "MINE" or "CRAFT")):setOutline(true)
                                models.models.ex_skill_1.Background.Background2.Cancel.CancelBackground.CancelTextAnchor:getTask("ex_skill_1_cancel_text"):setText("§7CANCEL"):setOutline(false)
                                models.models.ex_skill_1.Background.Background2.Action.ActionBackground.ActionBackground:setVisible(true)
                                models.models.ex_skill_1.Background.Background2.Cancel.CancelBackground.CancelBackground:setVisible(false)
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:ui.button.click"), player:getPos(), 0.25, 1.5)
                            elseif tick == 35 then
                                self.parent.faceParts:setEmotion("ANGRY", "ANGRY_INVERTED", "SMALL", 2, true)
                            elseif tick == 36 and host:isHost() then
                                models.models.ex_skill_1.Background.Background2.Action.ActionBackground.ActionTextAnchor:getTask("ex_skill_1_action_text"):setOutlineColor(1, 1, 1)
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:ui.button.click"), player:getPos(), 0.5, 1)
                            elseif tick == 38 then
                                self.parent.faceParts:setEmotion("ANGRY", "ANGRY_INVERTED", "CLOSED", 16, true)
                            elseif tick == 40 and host:isHost() then
                                models.models.ex_skill_1.Background.Background2.Action.ActionBackground.ActionTextAnchor:getTask("ex_skill_1_action_text"):setOutlineColor(0.33, 1, 1)
                            elseif tick == 44 and host:isHost() then
                                events.RENDER:remove("ex_skill_1_background_render")
                                models.models.ex_skill_1.Background:setVisible(false)
                            elseif tick == 47 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), player:getPos(), 1, 1.5)
                            elseif tick == 54 then
                                self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "CLOSED", 2, true)
                            elseif tick == 56 then
                                self.parent.faceParts:setEmotion("ANGRY", "ANGRY_INVERTED", "CLOSED", 2, true)
                            elseif tick == 58 then
                                self.parent.faceParts:setEmotion("ANGRY", "ANGRY_INVERTED", "ANGRY", 28, true)
                                if host:isHost() then
                                    models.models.ex_skill_1.Gui:setVisible(true)
                                    events.RENDER:register(function ()
                                        local windowSize = client:getScaledWindowSize()
                                        models.models.ex_skill_1.Gui.NameArea.NameAreaLeft:setPos(models.models.ex_skill_1.Gui.NameArea.NameAreaLeftAnchor:getAnimPos().x * (windowSize.x / 427), 24.5, 0)
                                        models.models.ex_skill_1.Gui.NameArea.NameAreaRight:setPos(models.models.ex_skill_1.Gui.NameArea.NameAreaRightAnchor:getAnimPos().x * (windowSize.x / 427), 17, 0)
                                    end, "ex_skill_1_name_render")
                                end
                            elseif tick == 61 then
                                for i = 0, 5 do
                                    self.parent.itemSpriteManager:spawn("ITEM", i * 60 + math.random() * 60 - 30)
                                end
                                for _ = 1, 5 do
                                    self.parent.itemSpriteManager:spawn("CROSS")
                                end
                                for _ = 1, 10 do
                                    self.parent.itemSpriteManager:spawn("DOT")
                                end
                            elseif tick == 70 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.note_block.bit"), player:getPos(), 1, 1.5)
                            elseif tick == 72 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.note_block.bit"), player:getPos(), 1, 1.75)
                            elseif tick == 74 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.note_block.bit"), player:getPos(), 1, 2)
                            end
                        end;

                        onPostAnimation = function (self, forcedStop)
                            models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun:moveTo(models.models.main.Avatar.UpperBody.Body)
                            models.models.main.Avatar.UpperBody.Body.Gun.Grenade:setVisible(false)
                            models.models.main.Avatar.UpperBody.Body.Gun.GameDisplay.Display:setColor()
                            models.models.main.Avatar.UpperBody.Body.Gun.GameDisplay.DisplayFlash:setVisible(false)
                            models.models.main.Avatar.UpperBody.Body.Gun:setVisible(self.parent.gun.currentGunPosition ~= "NONE")
                            if host:isHost() then
                                events.RENDER:remove("ex_skill_1_name_render")
                                models.models.ex_skill_1.Gui:setVisible(false)
                                models.models.ex_skill_1.Background.Background2.Action.ActionBackground.ActionTextAnchor:getTask("ex_skill_1_action_text"):setOutline(false)
                                models.models.ex_skill_1.Background.Background2.Cancel.CancelBackground.CancelTextAnchor:getTask("ex_skill_1_cancel_text"):setText("CANCEL"):setOutline(true)
                                models.models.ex_skill_1.Background.Background2.Action.ActionBackground.ActionBackground:setVisible(false)
                                models.models.ex_skill_1.Background.Background2.Cancel.CancelBackground.CancelBackground:setVisible(true)
                            end
                            if forcedStop then
                                self.parent.itemSpriteManager:removeAll()
                                if host:isHost() then
                                    events.RENDER:remove("ex_skill_1_background_render")
                                    models.models.ex_skill_1.Background:setVisible(false)
                                    models.models.ex_skill_1.Background.Background2.Action.ActionBackground.ActionTextAnchor:getTask("ex_skill_1_action_text"):setOutlineColor(0.33, 1, 1)
                                end
                            end
                        end;
                    };

                    ---このExスキルの初期化処理が行われたかどうか
                    ---@type boolean
                    init = false;

                    ---「Action」の項目に出すテキスト
                    ---1.ACTION, 2.MINE, 3.CRAFT
                    ---@type integer
                    actionTextIndex = 1;
                };

                {
                    name = {
                        ja_jp = "潜入スタート！";
                        en_us = "Starting infiltration!";
                    };

                    formationType = "SPECIAL";

                    models = {models.models.main.Avatar.Head.ExSkill2H.ShineEffect, models.models.ex_skill_2.Pillagers, models.models.ex_skill_2.Gui.Hotbar, models.models.ex_skill_2.Gui.Map};

                    animations = {"main", "gun", "costume_maid", "ex_skill_2"};

                    camera = {
                        start = {
                            rot = vectors.vec3(0, 175, 0);
                            pos = vectors.vec3(13, 23, -24);
                        };

                        fin = {
                            rot = vectors.vec3(5, 195, 0);
                            pos = vectors.vec3(-5.75, 17, -18.5);
                        };
                    };

                    callbacks = {
                        onPreAnimation = function (self)
                            if not self.exSkill.exSkills[2].init then
                                ---@diagnostic disable-next-line: discard-returns
                                models:newPart("script_ex_skill_2_wall_model")
                                models.script_ex_skill_2_wall_model:setPos(-8, 0, 8)
                                for i = 1, 4 do
                                    models.script_ex_skill_2_wall_model:newBlock("ex_skill_2_block_"..i):setBlock(self.parent.compatibilityUtils:checkBlock("minecraft:stripped_dark_oak_log")):setPos(0, (i - 1) * 16, 0)
                                end
                                for i = 1, 3 do
                                    for j = 1, 4 do
                                        models.script_ex_skill_2_wall_model:newBlock("ex_skill_2_block_"..((i - 1) * 4) + j + 4):setBlock(self.parent.compatibilityUtils:checkBlock("minecraft:dark_oak_planks")):setPos((i - 1) * 16 + 16, (j - 1) * 16, 0)
                                    end
                                end
                                for _, modelPart in ipairs({models.models.ex_skill_2.Pillagers.Pillager1.Pillager1Head.PillagerHead, models.models.ex_skill_2.Pillagers.Pillager1.Pillager1Head.Pillager1Nose, models.models.ex_skill_2.Pillagers.Pillager1.Pillager1Body, models.models.ex_skill_2.Pillagers.Pillager1.Pillager1RightArm, models.models.ex_skill_2.Pillagers.Pillager1.Pillager1LeftArm, models.models.ex_skill_2.Pillagers.Pillager1.Pillager1RightLeg, models.models.ex_skill_2.Pillagers.Pillager1.Pillager1LeftLeg}) do
                                    modelPart:setPrimaryTexture("RESOURCE", "minecraft:textures/entity/illager/pillager.png")
                                end
                                for _, part in ipairs({"Head", "Body", "RightArm", "LeftArm", "RightLeg", "LeftLeg"}) do
                                    models.models.ex_skill_2.Pillagers.Pillager2["Pillager2"..part]:addChild(self.parent.modelUtils:copyModel(models.models.ex_skill_2.Pillagers.Pillager1["Pillager1"..part]))
                                end
                                for i = 1, 2 do
                                    models.models.ex_skill_2.Pillagers["Pillager"..i]["Pillager"..i.."RightArm"]:newItem("ex_skill_2_pillager_"..i.."_crossbow"):setItem(self.parent.compatibilityUtils:checkItem("minecraft:crossbow")):setPos(0, -12, -2):setRot(0, 0, -135)
                                    models.models.ex_skill_2.Pillagers["Pillager"..i]["Pillager"..i.."Question"]["Pillager"..i.."Question2"]:newText("ex_skill_2_pillager_question_"..i):setText("§e?"):setPos(0, 7, 0):setAlignment("CENTER")
                                end
                                if host:isHost() then
                                    models.models.ex_skill_2.Gui.Hotbar.HotbarSection1:newItem("ex_skill_2_hotbar_section1"):setItem(self.parent.compatibilityUtils:checkItem("minecraft:firework_rocket")):setPos(0, 11, 0)
                                    models.models.ex_skill_2.Gui.Hotbar.HotbarSection2:newItem("ex_skill_2_hotbar_section2"):setItem(self.parent.compatibilityUtils:checkItem("minecraft:comparator")):setPos(0, 11, 0)
                                    models.models.ex_skill_2.Gui.Hotbar.HotbarSection3:newItem("ex_skill_2_hotbar_section3"):setItem(self.parent.compatibilityUtils:checkItem("minecraft:name_tag")):setPos(0, 11, 0)
                                    models.models.ex_skill_2.Gui.Hotbar.HotbarSection4:newItem("ex_skill_2_hotbar_section4"):setItem(self.parent.compatibilityUtils:checkItem("minecraft:arrow")):setPos(0, 11, 0)
                                    models.models.ex_skill_2.Gui.Hotbar.HotbarSection5:newItem("ex_skill_2_hotbar_section5"):setItem(self.parent.compatibilityUtils:checkItem("minecraft:book")):setPos(0, 11, 0)
                                    models.models.ex_skill_2.Gui.Hotbar.HotbarSection6:newItem("ex_skill_2_hotbar_section6"):setItem(self.parent.compatibilityUtils:checkItem("minecraft:crossbow")):setPos(0, 11, -5)
                                    models.models.ex_skill_2.Gui.Hotbar.HotbarSection7:newItem("ex_skill_2_hotbar_section7"):setItem(self.parent.compatibilityUtils:checkItem("minecraft:brush")):setPos(0, 11, -5)
                                    models.models.ex_skill_2.Gui.Hotbar.HotbarSection9:newItem("ex_skill_2_hotbar_section9"):setItem(self.parent.compatibilityUtils:checkItem("minecraft:diamond")):setPos(0, 11, -5)
                                    models.models.ex_skill_2.Gui.Map.MapBackground:setPrimaryTexture("RESOURCE", "minecraft:textures/map/map_background.png")
                                    models.models.ex_skill_2.YuzuChest:setVisible(true)
                                    local chestModel = self.parent.modelUtils:copyModel(models.models.ex_skill_2.YuzuChest)
                                    chestModel:setPos(-60, -16, -2)
                                    chestModel:setRot(-33.4, 39.86, -22.91)
                                    chestModel:setScale(0.5, 0.5, 0.5)
                                    models.models.ex_skill_2.Gui.Hotbar.HotbarSection8:addChild(chestModel)
                                    models.models.ex_skill_2.Gui.ScreenEffects:setScale(8, 8, 8)
                                    for _, modelName in ipairs({"ScreenEffectTLBack", "ScreenEffectBRFront", "ScreenEffectBRBack"}) do
                                        models.models.ex_skill_2.Gui.ScreenEffects:addChild(models.models.ex_skill_2.Gui.ScreenEffects.ScreenEffectTLFront:copy(modelName))
                                    end
                                    for _, modelPart in ipairs({models.models.ex_skill_2.Gui.ScreenEffects.ScreenEffectBRFront, models.models.ex_skill_2.Gui.ScreenEffects.ScreenEffectBRBack}) do
                                        modelPart:setRot(0, 0, 180)
                                    end
                                    for _, modelPart in ipairs({models.models.ex_skill_2.Gui.ScreenEffects.ScreenEffectTLFront, models.models.ex_skill_2.Gui.ScreenEffects.ScreenEffectBRFront}) do
                                        modelPart:setColor(0.996, 0.4, 0.455)
                                    end
                                    for _, modelPart in ipairs({models.models.ex_skill_2.Gui.ScreenEffects.ScreenEffectTLBack, models.models.ex_skill_2.Gui.ScreenEffects.ScreenEffectBRBack}) do
                                        modelPart:setColor(0.231, 0.725, 0.988)
                                    end
                                    if client:getVersion() >= "1.20.2" then
                                        for i = 1, 9 do
                                            models.models.ex_skill_2.Gui.Hotbar["HotbarSection"..i]["HotbarSection"..i]:setPrimaryTexture("RESOURCE", "minecraft:textures/gui/sprites/hud/hotbar.png")
                                        end
                                        models.models.ex_skill_2.Gui.Hotbar.HotbarSelection:setPrimaryTexture("RESOURCE", "minecraft:textures/gui/sprites/hud/hotbar_selection.png")
                                        models.models.ex_skill_2.Gui.Map.PlayerMarker:setPrimaryTexture("RESOURCE", "minecraft:textures/map/decorations/player.png")
                                        for i = 1, 2 do
                                            models.models.ex_skill_2.Gui.Map["EnemyMarker"..i]:setPrimaryTexture("RESOURCE", "minecraft:textures/map/decorations/red_marker.png")
                                        end
                                    else
                                        textures:fromVanilla("widgets", "minecraft:textures/gui/widgets.png")
                                        local hotbarTextureScale = textures["widgets"]:getDimensions().x / 256
                                        textures:newTexture("hotbar", 182 * hotbarTextureScale, 22 * hotbarTextureScale)
                                        for y = 0, 21 do
                                            for x = 0, 181 do
                                                textures["hotbar"]:setPixel(x, y, textures["widgets"]:getPixel(x, y))
                                            end
                                        end
                                        for i = 1, 9 do
                                            models.models.ex_skill_2.Gui.Hotbar["HotbarSection"..i]["HotbarSection"..i]:setPrimaryTexture("CUSTOM", textures["hotbar"])
                                        end
                                        textures:newTexture("hotbar_selection", 24 * hotbarTextureScale, 24 * hotbarTextureScale)
                                        for y = 0, 23 do
                                            for x = 0, 23 do
                                                textures["hotbar_selection"]:setPixel(x, y, textures["widgets"]:getPixel(x, y + 22))
                                            end
                                        end
                                        models.models.ex_skill_2.Gui.Hotbar.HotbarSelection:setPrimaryTexture("CUSTOM", textures["hotbar_selection"])
                                        textures:fromVanilla("map_icons", "minecraft:textures/map/map_icons.png")
                                        local mapTextureScale = textures["map_icons"]:getDimensions().x / 128
                                        textures:newTexture("player", 8 * mapTextureScale, 8 * mapTextureScale)
                                        for y = 0, 7 do
                                            for x = 0, 7 do
                                                textures["player"]:setPixel(x, y, textures["map_icons"]:getPixel(x, y))
                                            end
                                        end
                                        models.models.ex_skill_2.Gui.Map.PlayerMarker:setPrimaryTexture("CUSTOM", textures["player"])
                                        textures:newTexture("red_marker", 8 * mapTextureScale, 8 * mapTextureScale)
                                        for y = 0, 7 do
                                            for x = 0, 7 do
                                                textures["red_marker"]:setPixel(x, y, textures["map_icons"]:getPixel(x + 16, y))
                                            end
                                        end
                                        for i = 1, 2 do
                                            models.models.ex_skill_2.Gui.Map["EnemyMarker"..i]:setPrimaryTexture("CUSTOM", textures["red_marker"])
                                        end
                                    end

                                end
                                self.exSkill.exSkills[2].init = true
                            else
                                models.script_ex_skill_2_wall_model:setVisible(true)
                            end
                            if host:isHost() then
                                local windowSize = client:getScaledWindowSize()
                                models.models.ex_skill_2.Gui.Hotbar:setPos(windowSize.x / 2 * -1, windowSize.y * -1, 0)
                                models.models.ex_skill_2.Gui.Map:setPos(windowSize.x * -1 + 50, -30, 0)
                            end
                            self.parent.faceParts:setEmotion("ANGRY", "ANGRY_INVERTED", "CLOSED", 6)
                        end;

                        onAnimationTick = function (self, tick)
                            if tick == 0 then
                                models.models.main.Avatar.UpperBody.Body.Gun:moveTo(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom)
                                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun:setPos()
                                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun:setRot()
                                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun:setVisible(true)
                            elseif tick == 6 then
                                self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "CLOSED", 2)
                            elseif tick == 8 then
                                self.parent.faceParts:setEmotion("ANGRY", "ANGRY_INVERTED", "SMALL", 22)
                            elseif tick == 21 then
                                local bodyYaw = player:getBodyYaw()
                                local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Pillagers.Pillager1.Pillager1Question):add(0, 0.25, 0)
                                for j = 0, 5 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), anchorPos):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, vectors.rotateAroundAxis(j * 60, 0.1, 0, 0, 0, 0, 1), 0, 1, 0)):setColor(1, 1, 0.33):setLifetime(5)
                                end
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.pillager.ambient"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Pillagers.Pillager1), 0.5, 1)
                            elseif tick == 23 then
                                local bodyYaw = player:getBodyYaw()
                                local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Pillagers.Pillager2.Pillager2Question):add(0, 0.25, 0)
                                for j = 0, 5 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), anchorPos):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, vectors.rotateAroundAxis(j * 60, 0.1, 0, 0, 0, 0, 1), 0, 1, 0)):setColor(1, 1, 0.33):setLifetime(5)
                                end
                            elseif tick == 29 then
                                models.models.main.Avatar.Head.ExSkill2H.NoticeEffect:setVisible(true)
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.experience_orb.pickup"), player:getPos(), 0.25, 1.5)
                            elseif tick == 30 then
                                self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "SMALL", 2)
                            elseif tick == 31 then
                                models.models.main.Avatar.Head.ExSkill2H.NoticeEffect:setVisible(false)
                            elseif tick == 32 then
                                for _, modelPart in ipairs({models.models.main.Avatar.Head.ExSkill2H.FearEffect, models.models.main.Avatar.Head.ExSkill2H.NoticeEffect}) do
                                    modelPart:setVisible(true)
                                end
                                self.parent.faceParts:setEmotion("FEAR_CENTER", "FEAR", "FRUST", 2)
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.experience_orb.pickup"), player:getPos(), 0.25, 1.5)
                            elseif tick == 34 then
                                models.models.main.Avatar.Head.ExSkill2H.NoticeEffect:setVisible(false)
                                self.parent.faceParts:setEmotion("FEAR_CENTER", "FEAR", "FEAR", 8)
                            elseif tick == 42 then
                                self.parent.faceParts:setEmotion("FEAR", "FEAR_CENTER", "FEAR", 4)
                            elseif tick == 46 then
                                self.parent.faceParts:setEmotion("FEAR_CENTER", "FEAR", "FEAR", 4)
                            elseif tick == 50 then
                                self.parent.faceParts:setEmotion("FEAR", "FEAR_CENTER", "FEAR", 4)
                            elseif tick == 54 then
                                self.parent.faceParts:setEmotion("FEAR_CENTER", "FEAR", "FEAR", 4)
                            elseif tick == 58 then
                                self.parent.faceParts:setEmotion("FEAR", "FEAR_CENTER", "FEAR", 4)
                            elseif tick == 62 then
                                self.parent.faceParts:setEmotion("FEAR_CENTER", "FEAR", "FEAR", 4)
                            elseif tick == 66 then
                                self.parent.faceParts:setEmotion("FEAR", "FEAR_CENTER", "FEAR", 10)
                            elseif tick == 71 and host:isHost() then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:ui.button.click"), player:getPos(), 0.5, 1)
                            elseif tick == 74 then
                                models.models.ex_skill_2.YuzuChest:setVisible(true)
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.YuzuChest), 1, 1)
                            elseif tick == 76 then
                                self.parent.faceParts:setEmotion("CLOSED2_WITH_TEAR", "CLOSED2_WITH_TEAR", "SHOCK", 17)
                            elseif tick == 82 then
                                local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.YuzuChest)
                                for i = 0, 11 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:campfire_cosy_smoke"), anchorPos:copy():add(vectors.rotateAroundAxis(i * 30, 0, 0, 0.5, 0, 1, 0))):setVelocity(vectors.rotateAroundAxis(i * 30, 0, 0, 0.05, 0, 1, 0)):setLifetime(20)
                                end
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.zombie.attack_wooden_door"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.YuzuChest), 0.2, 1.5)
                            elseif tick == 84 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.pillager.hurt"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Pillagers.Pillager1), 0.5, 1)
                            elseif tick == 93 then
                                models.models.main.Avatar.Head.ExSkill2H.FearEffect:setVisible(false)
                                self.parent.faceParts:setEmotion("ANGRY", "ANGRY_INVERTED", "SMALL", 44)
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.chest.open"), player:getPos(), 0.1, 0.75)
                            elseif tick == 105 and host:isHost() then
                                events.RENDER:register(function (delta)
                                    local opacity = (self.parent.exSkill.animationCount + delta - 1) * -0.2 + 22
                                    for _, modelPart in ipairs({models.models.ex_skill_2.YuzuChest.YuzuChestBottom.YuzuChestBottomFront, models.models.ex_skill_2.YuzuChest.TheYuzu, models.models.ex_skill_2.YuzuChest.YuzuChestTop.YuzuChestTopFront, models.models.ex_skill_2.YuzuChest.YuzuChestTop.YuzuChestHook}) do
                                        modelPart:setOpacity(opacity)
                                    end
                                end, "ex_skill_2_yuzu_chest")
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), player:getPos(), 0.5, 1.5)
                            elseif tick == 106 and host:isHost() then
                                models.models.ex_skill_2.Gui.ScreenEffects:setVisible(true)
                                events.RENDER:register(function ()
                                    local windowSize = client:getScaledWindowSize()
                                    models.models.ex_skill_2.Gui.ScreenEffects.ScreenEffectTLFront:setPos(models.models.ex_skill_2.Gui.ScreenEffects.ScreenEffectFrontAnchor:getAnimPos().x * (windowSize.x / 427), -10, -1)
                                    models.models.ex_skill_2.Gui.ScreenEffects.ScreenEffectTLBack:setPos(models.models.ex_skill_2.Gui.ScreenEffects.ScreenEffectBackAnchor:getAnimPos().x * (windowSize.x / 427), -11, 0)
                                    models.models.ex_skill_2.Gui.ScreenEffects.ScreenEffectBRFront:setPos(models.models.ex_skill_2.Gui.ScreenEffects.ScreenEffectFrontAnchor:getAnimPos().x * (windowSize.x / 427) * -1 + ((windowSize.x + math.sin(math.rad(-18.8)) * windowSize.y) * -1) / 8, (windowSize.y * -1 + math.sin(math.rad(-18.8)) * windowSize.x) / 8 + 10, -1)
                                    models.models.ex_skill_2.Gui.ScreenEffects.ScreenEffectBRBack:setPos(models.models.ex_skill_2.Gui.ScreenEffects.ScreenEffectBackAnchor:getAnimPos().x * (windowSize.x / 427) * -1 + ((windowSize.x + math.sin(math.rad(-18.8)) * windowSize.y) * -1) / 8, (windowSize.y * -1 + math.sin(math.rad(-18.8)) * windowSize.x) / 8 + 11, 0)
                                end, "ex_skill_2_screen_effects")
                            elseif tick == 107 and host:isHost() then
                                models.script_ex_skill_2_sprite:setPos(client:getScaledWindowSize():scale(-0.5):augmented(0))
                                local windowSize = client:getScaledWindowSize()
                                for i = 0, 5 do
                                    local offset = vectors.vec2(math.cos(math.rad(i * 60)), math.sin(math.rad(i * 60))):mul(windowSize.x / windowSize.y, 1)
                                    self.parent.exSkill2SpriteManager:spawn("STAR", offset:copy():scale(50), offset:copy():scale(math.random() * 5 + 10))
                                end
                                for _ = 1, 5 do
                                    local rot = math.random() * 360
                                    local offset = vectors.vec2(math.cos(math.rad(rot)), math.sin(math.rad(rot))):mul(windowSize.x / windowSize.y, 1)
                                    self.parent.exSkill2SpriteManager:spawn(math.random() < 0.5 and "MINISTAR" or "MINISTAR2", offset:copy():scale(50), offset:copy():scale(math.random() * 5 + 10))
                                end
                            elseif tick == 110 and host:isHost() then
                                events.RENDER:remove("ex_skill_2_yuzu_chest")
                                for _, modelPart in ipairs({models.models.ex_skill_2.YuzuChest.YuzuChestBottom.YuzuChestBottomFront, models.models.ex_skill_2.YuzuChest.TheYuzu, models.models.ex_skill_2.YuzuChest.YuzuChestTop.YuzuChestTopFront, models.models.ex_skill_2.YuzuChest.YuzuChestTop.YuzuChestHook}) do
                                    modelPart:setOpacity(0)
                                end
                            end
                            if tick >= 32 and tick < 76 then
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:splash"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.Head)):setPower(2)
                                if (tick - 32) % 4 == 0 then
                                    sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.bubble_column.bubble_pop"), player:getPos(), 0.15, 2 - math.random() * 0.5)
                                end
                            end
                            if tick >= 37 and tick <= 67 and (tick - 37) % 4 == 0 and host:isHost() then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:ui.button.click"), player:getPos(), 0.25, 1.5)
                            end
                        end;

                        onPostAnimation = function (self, forcedStop)
                            models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun:moveTo(models.models.main.Avatar.UpperBody.Body)
                            models.models.main.Avatar.UpperBody.Body.Gun:setVisible(self.parent.gun.currentGunPosition ~= "NONE")
                            models.script_ex_skill_2_wall_model:setVisible(false)
                            models.models.ex_skill_2.YuzuChest:setVisible(self.costume.costumes[2].shouldShowChest)
                            if host:isHost() then
                                events.RENDER:remove("ex_skill_2_screen_effects")
                                models.models.ex_skill_2.Gui.ScreenEffects:setVisible(false)
                                for _, modelPart in ipairs({models.models.ex_skill_2.YuzuChest.YuzuChestBottom.YuzuChestBottomFront, models.models.ex_skill_2.YuzuChest.TheYuzu, models.models.ex_skill_2.YuzuChest.YuzuChestTop.YuzuChestTopFront, models.models.ex_skill_2.YuzuChest.YuzuChestTop.YuzuChestHook}) do
                                    modelPart:setOpacity(1)
                                end
                            end
                            if forcedStop then
                                for _, modelPart in ipairs({models.models.main.Avatar.Head.ExSkill2H.FearEffect, models.models.main.Avatar.Head.ExSkill2H.NoticeEffect}) do
                                    modelPart:setVisible(false)
                                end
                                if host:isHost() then
                                    self.parent.exSkill2SpriteManager:removeAll()
                                end
                            end
                        end;

                    };

                    ---このExスキルの初期化処理が行われたかどうか。
                    ---@type boolean
                    init = false;
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
                    name = "maid";

                    displayName = {
                        en_us = "Maid";
                        ja_jp = "メイド";
                    };

                    exSkill = 2;

                    ---この衣装の初期化処理が行われたかどうか
                    ---@type boolean
                    init = false;

                    ---前ティックに脚とスカートの調整をしたかどうか
                    ---@type boolean
                    shouldAdjustLegsPrev = false;

                    ---前ティックは脚を隠すべきだったかどうか
                    ---@type boolean
                    shouldHideLegsPrev = false;

                    ---チェストを表示すべきかどうか
                    ---@type boolean
                    shouldShowChest = false;

                    ---前ティックにチェストを表示していたかどうか
                    ---@type boolean
                    shouldShowChestPrev = false;

                    ---チェストの中に隠れていたかどうか
                    ---@type boolean
                    shouldHideInChest = false;

                    ---前ティックにチェストの中に隠れていたかどうか
                    ---@type boolean
                    shouldHideInChestPrev = false;

                    ---前ティックのBodyYaw
                    ---@type number
                    bodyYawPrev = 0;

                    ---チェストに隠れているときのAFKカウンター
                    ---@type integer
                    chestAFKCount = 0;

                    ---チェストに隠れられる機能を停止する。
                    ---@param self BlueArchiveCharacter
                    stopChest = function (self)
                        events.TICK:remove("chest_tick")
                        events.RENDER:remove("chest_render")
                        events.DAMAGE:remove("chest_damage")
                        models.models.ex_skill_2.YuzuChest:setVisible(false)
                        for _, anim in ipairs({animations["models.ex_skill_2"]["chest_idle"], animations["models.main"]["chest_hide"], animations["models.costume_maid"]["chest_hide"], animations["models.ex_skill_2"]["chest_hide"], animations["models.main"]["chest_afk"], animations["models.main"]["chest_afk_overwrite"], animations["models.costume_maid"]["chest_afk"], animations["models.ex_skill_2"]["chest_afk"]}) do
                            anim:stop()
                        end
                        self.parent.faceParts:resetEmotion()
                        self.parent.cameraManager.setCameraPivot()
                        renderer:setEyeOffset()
                        self.costume.costumes[2].shouldShowChest = false
                        self.costume.costumes[2].shouldShowChestPrev = false
                        self.costume.costumes[2].shouldHideInChest = false
                        self.costume.costumes[2].shouldHideInChestPrev = false
                        self.costume.costumes[2].chestAFKCount = 0
                        if self.parent.gun.currentGunPosition == "RIGHT" then
                            self.parent.arms:setArmState(1, 2)
                        elseif self.parent.gun.currentGunPosition == "LEFT" then
                            self.parent.arms:setArmState(2, 1)
                        else
                            self.parent.arms:setArmState(0, 0)
                        end
                    end;
                };
            };

            callbacks = {
                onChange = function (self)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.CMaidH, models.models.main.Avatar.UpperBody.Arms.RightArm.CMaidRA, models.models.main.Avatar.UpperBody.Arms.LeftArm.CMaidLA}) do
                        modelPart:setVisible(true)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.HairTip1, models.models.main.Avatar.UpperBody.Body.Hairs, models.models.main.Avatar.UpperBody.Body.MilleniumLogo, models.models.main.Avatar.UpperBody.Body.IDCard, models.models.main.Avatar.UpperBody.Body.GameConsole, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.MilleniumPatch}) do
                        modelPart:setVisible(false)
                    end
                    models.models.main.Avatar.UpperBody.Body.CMaidB:setVisible(not self.parent.armor.isArmorVisible.leggings)
                    self.parent.costume.setCostumeTextureOffset(1)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.Head, models.models.main.Avatar.Head.HatLayer}) do
                        modelPart:setUVPixels(0, 16)
                    end
                    if not self.costume.costumes[2].init then
                        for _, modelPart in ipairs({models.models.ex_skill_2.YuzuChest.YuzuChestBottom, models.models.ex_skill_2.YuzuChest.YuzuChestTop}) do
                            modelPart:setPrimaryTexture("RESOURCE", "minecraft:textures/entity/chest/normal.png")
                        end
                        self.costume.costumes[2].init = true
                    end
                    events.TICK:register(function ()
                        if not client:isPaused() then
                            local skirtVisible = models.models.main.Avatar.UpperBody.Body.CMaidB:getVisible()
                            local shouldHideLegs = skirtVisible and player:getVehicle() ~= nil
                            if shouldHideLegs and not self.costume.costumes[2].shouldHideLegsPrev then
                                models.models.main.Avatar.LowerBody.Legs:setVisible(false)
                                models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1:setScale(1.5, 0.5, 1.5)
                                for _, modelPart in ipairs({ models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1.Skirt2, models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1.Skirt2.Skirt3, models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1.Skirt2.Skirt3.Skirt4}) do
                                    modelPart:setScale()
                                end
                            elseif not shouldHideLegs and self.costume.costumes[2].shouldHideLegsPrev then
                                models.models.main.Avatar.LowerBody.Legs:setVisible(true)
                            end

                            local shouldAdjustLegs = skirtVisible and not shouldHideLegs
                            if shouldAdjustLegs and not self.costume.costumes[2].shouldAdjustLegsPrev then
                                events.RENDER:register(function (delta)
                                    local rightLegRotX = vanilla_model.RIGHT_LEG:getOriginRot().x
                                    models.models.main.Avatar.LowerBody.Legs.RightLeg:setRot(rightLegRotX * -0.45, 0, 0)
                                    models.models.main.Avatar.LowerBody.Legs.LeftLeg:setRot(vanilla_model.LEFT_LEG:getOriginRot().x * -0.45, 0, 0)
                                    if self.costume.costumes[2].shouldHideInChest then
                                        for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1, models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1.Skirt2, models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1.Skirt2.Skirt3, models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1.Skirt2.Skirt3.Skirt4}) do
                                            modelPart:setScale()
                                        end
                                    else
                                        local rightLegRotAbs = math.abs(rightLegRotX)
                                        local playerPose = player:getPose()
                                        local skirtFlipVal = math.min(math.abs(self.parent.physics.getValueBetweenTicks(self.parent.physics.velocityAverage[7], delta)) * 0.00025 + ((playerPose == "SWIMMING" or playerPose == "FALL_FLYING") and 0 or math.max(self.parent.physics.getValueBetweenTicks(self.parent.physics.velocityAverage[2], delta) * -0.25, 0)), 0.5)
                                        models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1:setScale(1 + skirtFlipVal, 1 - skirtFlipVal * 0.75, rightLegRotAbs * 0.001 + 1 + skirtFlipVal)
                                        models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1.Skirt2:setScale(rightLegRotAbs * -0.0001 + 1, 1, rightLegRotAbs * 0.001 + 1)
                                        models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1.Skirt2.Skirt3:setScale(rightLegRotAbs * -0.0001 + 1, 1, rightLegRotAbs * 0.001 + 1)
                                        models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1.Skirt2.Skirt3.Skirt4:setScale(rightLegRotAbs * -0.00005 + 1, 1, rightLegRotAbs * 0.0005 + 1)
                                    end
                                end, "costume_maid_render")
                            elseif not shouldAdjustLegs and self.costume.costumes[2].shouldAdjustLegsPrev then
                                events.RENDER:remove("costume_maid_render")
                                for _, modelPart in ipairs({models.models.main.Avatar.LowerBody.Legs.RightLeg, models.models.main.Avatar.LowerBody.Legs.LeftLeg}) do
                                    modelPart:setRot()
                                end
                                if not shouldHideLegs then
                                    for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1, models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1.Skirt2, models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1.Skirt2.Skirt3, models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1.Skirt2.Skirt3.Skirt4}) do
                                        modelPart:setScale()
                                    end
                                end
                            end
                            self.costume.costumes[2].shouldHideLegsPrev = shouldHideLegs
                            self.costume.costumes[2].shouldAdjustLegsPrev = shouldAdjustLegs

                            self.costume.costumes[2].shouldShowChest = player:getItem(6).id == "minecraft:carved_pumpkin" and not self.parent.armor.shouldShowArmor and self.parent.exSkill.animationCount == -1 and player:getPose() ~= "SLEEPING"
                            if self.costume.costumes[2].shouldShowChest ~= self.costume.costumes[2].shouldShowChestPrev then
                                if self.costume.costumes[2].shouldShowChest then
                                    models.models.ex_skill_2.YuzuChest:setVisible(true)
                                    for _, anim in ipairs({animations["models.ex_skill_2"]["chest_idle"], animations["models.main"]["chest_hide"], animations["models.costume_maid"]["chest_hide"], animations["models.ex_skill_2"]["chest_hide"]}) do
                                        anim:play()
                                    end
                                    for _, anim in ipairs({animations["models.main"]["chest_hide"], animations["models.costume_maid"]["chest_hide"], animations["models.ex_skill_2"]["chest_hide"]}) do
                                        anim:setTime(0)
                                        anim:setSpeed(-1)
                                    end
                                    self.parent.arms:setArmState(4, 4)
                                    events.TICK:register(function ()
                                        if not client:isPaused() then
                                            self.costume.costumes[2].shouldHideInChest = player:isCrouching()
                                            if self.costume.costumes[2].shouldHideInChest ~= self.costume.costumes[2].shouldHideInChestPrev then
                                                if self.costume.costumes[2].shouldHideInChest then
                                                    for _, anim in ipairs({animations["models.main"]["chest_hide"], animations["models.costume_maid"]["chest_hide"], animations["models.ex_skill_2"]["chest_hide"]}) do
                                                        anim:setSpeed(1)
                                                    end
                                                    sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.ender_chest.close"), player:getPos(), 0.1, 2)
                                                else
                                                    for _, anim in ipairs({animations["models.main"]["chest_hide"], animations["models.costume_maid"]["chest_hide"], animations["models.ex_skill_2"]["chest_hide"]}) do
                                                        anim:setSpeed(-1)
                                                    end
                                                    sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.chest.open"), player:getPos(), 0.1, 2)
                                                end
                                                self.costume.costumes[2].shouldHideInChestPrev = self.costume.costumes[2].shouldHideInChest
                                            end
                                            local bodyYaw = player:getBodyYaw()
                                            if self.costume.costumes[2].shouldHideInChest and not player:isMoving() and bodyYaw == self.costume.costumes[2].bodyYawPrev and not player:isInWater() and not player:isInLava() and player:getFrozenTicks() == 0 and player:getSwingArm() == nil and player:getActiveItem().id == "minecraft:air" then
                                                if self.costume.costumes[2].chestAFKCount == -135 then
                                                    self.parent.faceParts:setEmotion("NORMAL", "INVERTED", "FRUST", 35, true)
                                                    sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.chest.open"), player:getPos(), 0.1, 2)
                                                elseif self.costume.costumes[2].chestAFKCount == -100 then
                                                    self.parent.faceParts:setEmotion("INVERTED", "NORMAL", "FRUST", 35, true)
                                                elseif self.costume.costumes[2].chestAFKCount == -65 then
                                                    self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "FRUST", 15, true)
                                                elseif self.costume.costumes[2].chestAFKCount == -50 then
                                                    self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "SMALL", 40, true)
                                                elseif self.costume.costumes[2].chestAFKCount == -10 then
                                                    sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.ender_chest.close"), player:getPos(), 0.1, 2)
                                                elseif self.costume.costumes[2].chestAFKCount == 1200 then
                                                    for _, anim in ipairs({animations["models.main"]["chest_afk"], animations["models.main"]["chest_afk_overwrite"], animations["models.costume_maid"]["chest_afk"], animations["models.ex_skill_2"]["chest_afk"]}) do
                                                        anim:play()
                                                    end
                                                    self.costume.costumes[2].chestAFKCount = -140
                                                end
                                                self.costume.costumes[2].chestAFKCount = self.costume.costumes[2].chestAFKCount + 1
                                            else
                                                for _, anim in ipairs({animations["models.main"]["chest_afk"], animations["models.main"]["chest_afk_overwrite"], animations["models.costume_maid"]["chest_afk"], animations["models.ex_skill_2"]["chest_afk"]}) do
                                                    anim:stop()
                                                end
                                                self.parent.faceParts:resetEmotion()
                                                self.costume.costumes[2].chestAFKCount = 0
                                            end
                                            self.costume.costumes[2].bodyYawPrev = bodyYaw
                                        end
                                    end, "chest_tick")

                                    events.RENDER:register(function ()
                                        local lookYOffset = (models.models.ex_skill_2.YuzuChest:getAnimPos().y / 16 - 0.75) * 0.5
                                        self.parent.cameraManager.setCameraPivot(vectors.vec3(0, lookYOffset, 0))
                                        renderer:setEyeOffset(0, lookYOffset, 0)
                                    end, "chest_render")

                                    events.DAMAGE:register(function ()
                                        for _, anim in ipairs({animations["models.main"]["chest_afk"], animations["models.main"]["chest_afk_overwrite"], animations["models.costume_maid"]["chest_afk"], animations["models.ex_skill_2"]["chest_afk"]}) do
                                            anim:stop()
                                        end
                                        self.costume.costumes[2].chestAFKCount = 0
                                    end, "chest_damage")
                                else
                                    self.costume.costumes[2].stopChest(self)
                                end
                                self.costume.costumes[2].shouldShowChestPrev = self.costume.costumes[2].shouldShowChest
                            end
                        end
                    end,"costume_maid_tick")
                end;

                onReset = function (self)
                    events.TICK:remove("costume_maid_tick")
                    events.RENDER:remove("costume_maid_render")
                    self.costume.costumes[2].stopChest(self)
                    models.models.main.Avatar.LowerBody.Legs:setVisible(true)
                    for _, modelPart in ipairs({models.models.main.Avatar.LowerBody.Legs.RightLeg, models.models.main.Avatar.LowerBody.Legs.LeftLeg}) do
                        modelPart:setRot()
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.HairTip1, models.models.main.Avatar.UpperBody.Body.Hairs, models.models.main.Avatar.UpperBody.Body.MilleniumLogo, models.models.main.Avatar.UpperBody.Body.IDCard, models.models.main.Avatar.UpperBody.Body.GameConsole, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.MilleniumPatch}) do
                        modelPart:setVisible(true)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.CMaidH, models.models.main.Avatar.UpperBody.Body.CMaidB, models.models.main.Avatar.UpperBody.Arms.RightArm.CMaidRA, models.models.main.Avatar.UpperBody.Arms.LeftArm.CMaidLA}) do
                        modelPart:setVisible(false)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.Head, models.models.main.Avatar.Head.HatLayer}) do
                        modelPart:setUVPixels()
                    end
                    self.costume.costumes[2].shouldAdjustLegsPrev = false
                end;

                onArmorChange = function (self, parts, isVisible)
                    if parts == "HELMET" then
                        if isVisible then
                            for _, modelPart in ipairs({models.models.main.Avatar.Head.HairTip2, models.models.main.Avatar.Head.CMaidH.Brim}) do
                                modelPart:setVisible(false)
                            end
                        else
                            for _, modelPart in ipairs({models.models.main.Avatar.Head.HairTip2, models.models.main.Avatar.Head.CMaidH.Brim}) do
                                modelPart:setVisible(true)
                            end
                        end
                    elseif parts == "CHEST_PLATE" then
                        if isVisible then
                            models.models.main.Avatar.UpperBody.Body.Hairs.FrontHair:setPos(0, 0, -1)
                            models.models.main.Avatar.UpperBody.Body.Hairs.BackHair:setPos(0, 0, 1)
                        else
                            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Hairs.FrontHair, models.models.main.Avatar.UpperBody.Body.Hairs.BackHair}) do
                                modelPart:setPos()
                            end
                        end
                    elseif parts == "LEGGINGS" and self.parent.costume.currentCostume == 2 then
                        models.models.main.Avatar.UpperBody.Body.CMaidB:setVisible(not isVisible)
                    end
                end;
            };
        }

        instance.bubble = {
            callbacks = {
                onPlay = function(self, type, duration)
                    if duration > 0 then
                        if type == "GOOD" then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "SMILE", duration, true)
                        elseif type == "HEART" then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "OPENED", duration, true)
                        elseif type == "NOTE" then
                            self.parent.faceParts:setEmotion("ANGRY", "ANGRY", "CLOSED", duration, true)
                        elseif type == "QUESTION" then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "FRUST", duration, true)
                        elseif type == "SWEAT" then
                            self.parent.faceParts:setEmotion("FEAR", "FEAR", "FEAR", duration, true)
                            models.models.main.Avatar.Head.ExSkill2H.FearEffect:setVisible(true)
                        end
                    end
                end;

                onStop = function(self, _, forcedStop)
                    models.models.main.Avatar.Head.ExSkill2H.FearEffect:setVisible(false)
                    if forcedStop then
                        self.parent.faceParts:resetEmotion()
                    end
                end;
            };
        }

        instance.headBlock = {
            includeModels = {models.models.main.Avatar.UpperBody.Body.Hairs};
        }

        instance.portrait = {
            includeModels = {};
        }

        instance.deathAnimation = {
            callbacks = {
                onPhase1 = function (_, dummyAvatar, costume)
                    if costume == "MAID" then
                        dummyAvatar.Head.CMaidH.HairTail:setRot(20, 0, 0)
                        dummyAvatar.UpperBody.Body.CMaidB.Skirt1:setScale(1.5, 0.5, 1.5)
                        dummyAvatar.LowerBody.Legs:setVisible(false)
                    end
                end;
                onPhase2 = function (_, dummyAvatar, costume)
                    if costume == "DEFAULT" then
                        dummyAvatar.UpperBody.Body.Hairs.BackHair:setPos(0, 0.5, 0.5)
                        dummyAvatar.UpperBody.Body.Hairs.BackHair:setRot(-15, 0, -15)
                    elseif costume == "MAID" then
                        dummyAvatar.Head.CMaidH.HairTail:setRot(-15, 0, -5)
                        dummyAvatar.UpperBody.Body.CMaidB.Skirt1:setRot(20, 0, 0)
                        dummyAvatar.UpperBody.Body.CMaidB.Skirt1:setScale(1, 1, 1)
                        dummyAvatar.UpperBody.Body.CMaidB.BackRibbon.RibbonBottomRight:setRot(15, 0, 0)
                        dummyAvatar.UpperBody.Body.CMaidB.BackRibbon.RibbonBottomLeft:setRot(15, 0, 0)
                        dummyAvatar.LowerBody.Legs:setVisible(true)
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
                    models = {models.models.main.Avatar.Head.HairTip1.HairTipCore},

                    z = {
                        vertical = {
                            min = -20;
                            neutral = 32.5;
                            max = 60;
                        };

                        horizontal = {
                            min = -20;
                            neutral = 32.5;
                            max = 60;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.HairTip1.HairTipCore.HairTipCoreZPivot},

                    y = {
                        vertical = {
                            min = -10;
                            neutral = 0;
                            max = 10;
                        };

                        horizontal = {
                            min = -10;
                            neutral = 0;
                            max = 10;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.HairTip2};

                    x = {
                        vertical = {
                            min = -15;
                            neutral = 52.5;
                            max = 82.5;

                            bodyY = {
                                multiplayer = -40;
                                min = -15;
                                max = 82.5;
                            };
                        };

                        horizontal = {
                            min = -15;
                            neutral = 52.5;
                            max = 82.5;

                            bodyX = {
                                multiplayer = -80;
                                min = -15;
                                max = 82.5;
                            };
                        };
                    };

                    y = {
                        vertical = {
                            min = -40;
                            neutral = -40;
                            max = -40;
                        };

                        horizontal = {
                            min = -40;
                            neutral = -40;
                            max = -40;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CMaidH.HairTail};

                    x = {
                        vertical = {
                            min = -170;
                            neutral = 0;
                            max = 30;
                            sneakOffset = -20;
                            headRotMultiplayer = -1;

                            headX = {
                                multiplayer = -80;
                                min = -90;
                                max = 10;
                            };

                            headRot = {
                                multiplayer = 0.05;
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
                            max = -30;

                            headX = {
                                multiplayer = -80;
                                min = -45;
                                max = -30;
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
                                multiplayer = -80;
                                min = -80;
                                max = 80;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CMaidH.HairBandRibbon.HairBandRibbonTopLeftYPivot};

                    y = {
                        vertical = {
                            min = 0;
                            neutral = 0;
                            max = 80;
                            headRotMultiplayer = 0.5;

                            headX = {
                                multiplayer = 160;
                                min = 0;
                                max = 80;
                            };

                            headRot = {
                                multiplayer = -0.1;
                                min = 0;
                                max = 80;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CMaidH.HairBandRibbon.HairBandRibbonTopLeftYPivot.HairBandRibbonTopLeftZPivot};

                    z = {
                        vertical = {
                            min = -75;
                            neutral = 0;
                            max = 27.5;

                            bodyY = {
                                multiplayer = 20;
                                min = -75;
                                max = 27.5;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CMaidH.HairBandRibbon.HairBandRibbonTopRightYPivot};

                    y = {
                        vertical = {
                            min = -80;
                            neutral = 0;
                            max = 0;
                            headRotMultiplayer = -0.5;

                            headX = {
                                multiplayer = -160;
                                min = -80;
                                max = 0;
                            };

                            headRot = {
                                multiplayer = 0.1;
                                min = -80;
                                max = 0;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CMaidH.HairBandRibbon.HairBandRibbonTopRightYPivot.HairBandRibbonTopRightZPivot};

                    z = {
                        vertical = {
                            min = -27.5;
                            neutral = 0;
                            max = 75;

                            bodyY = {
                                multiplayer = -20;
                                min = -27.5;
                                max = 75;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CMaidH.HairBandRibbon.HairBandRibbonBottom.HairBandRibbonBottomLeftXPivot, models.models.main.Avatar.Head.CMaidH.HairBandRibbon.HairBandRibbonBottom.HairBandRibbonBottomRightXPivot};

                    x = {
                        vertical = {
                            min = -170;
                            neutral = 0;
                            max = 0;
                            headRotMultiplayer = -1;

                            headX = {
                                multiplayer = -160;
                                min = -80;
                                max = 0;
                            };

                            headRot = {
                                multiplayer = 0.1;
                                min = -80;
                                max = 0;
                            };

                            bodyY = {
                                multiplayer = 160;
                                min = -170;
                                max = 0;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CMaidH.HairBandRibbon.HairBandRibbonBottom.HairBandRibbonBottomLeftXPivot.HairBandRibbonBottomLeftZPivot};

                    z = {
                        vertical = {
                            min = 0;
                            neutral = 0;
                            max = 30;

                            headX = {
                                multiplayer = 20;
                                min = 0;
                                max = 30;
                            };

                            headRot = {
                                multiplayer = -0.1;
                                min = 0;
                                max = 30;
                            };

                            bodyY = {
                                multiplayer = 20;
                                min = 0;
                                max = 30;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CMaidH.HairBandRibbon.HairBandRibbonBottom.HairBandRibbonBottomRightXPivot.HairBandRibbonBottomRightZPivot};

                    z = {
                        vertical = {
                            min = -30;
                            neutral = 0;
                            max = 0;

                            headX = {
                                multiplayer = -20;
                                min = -30;
                                max = 0;
                            };

                            headRot = {
                                multiplayer = 0.1;
                                min = -30;
                                max = 0;
                            };

                            bodyY = {
                                multiplayer = -20;
                                min = -30;
                                max = 0;
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
                onPhysicPerformed = function (self, model)
                    if model:getName():match("^HairTipCore") then
                        local playerPose = player:getPose()
                        local isHorizontal = playerPose == "SWIMMING" or playerPose == "FALL_FLYING"
                        local velocityY = math.clamp(self.parent.physics.velocityAverage[1][2] * -40, -20, 20)
                        local velocityZ = math.clamp(self.parent.physics.velocityAverage[2][2] * (isHorizontal and 160 or -40), -20, 60)
                        local lookRotY = math.deg(math.asin(player:getLookDir().y)) / 90
                        local rotY = velocityZ * (1 - math.abs(lookRotY)) * -1 + velocityY * lookRotY
                        local rotZ = velocityY * (1 - math.abs(lookRotY)) * -1 + velocityZ * lookRotY
                        if model == models.models.main.Avatar.Head.HairTip1.HairTipCore then
                            models.models.main.Avatar.Head.HairTip1.HairTipCore:setRot(0, 0, (isHorizontal and rotZ or rotY) + 32.5)
                        elseif model == models.models.main.Avatar.Head.HairTip1.HairTipCore.HairTipCoreZPivot then
                            models.models.main.Avatar.Head.HairTip1.HairTipCore.HairTipCoreZPivot:setRot(0, isHorizontal and rotY or rotZ, 0)
                        end
                    elseif model == models.models.main.Avatar.Head.CMaidH.HairTail then
                        model:setRot(math.min(model:getRot().x, 30), 0, 0)
                    elseif model == models.models.main.Avatar.Head.CMaidH.HairBandRibbon.HairBandRibbonTopRightYPivot then
                        model:setRot(0, math.min(model:getRot().y, 0), 0)
                    elseif model == models.models.main.Avatar.Head.CMaidH.HairBandRibbon.HairBandRibbonTopLeftYPivot then
                        model:setRot(0, math.max(model:getRot().y, 0), 0)
                    elseif model == models.models.main.Avatar.Head.CMaidH.HairBandRibbon.HairBandRibbonBottom.HairBandRibbonBottomRightXPivot or model == models.models.main.Avatar.Head.CMaidH.HairBandRibbon.HairBandRibbonBottom.HairBandRibbonBottomLeftXPivot then
                        model:setRot(math.min(model:getRot().x, 0), 0, 0)
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

        events.TICK:register(function ()
            if not client:isPaused() then
                if self.parent.gun.currentGunPosition ~= "NONE" or self.parent.exSkill.animationCount >= 0 then
                    if self.gun.animationTick % 4 == 0 then
                        local frame = self.gun.animationTick / 4
                        if models.models.main.Avatar.UpperBody.Body.Gun ~= nil then
                            models.models.main.Avatar.UpperBody.Body.Gun.GameDisplay.Display:setUVPixels(37 * (frame % 2), 15 * (math.floor(frame / 2)))
                        elseif models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun ~= nil then
                            models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun.GameDisplay.Display:setUVPixels(37 * (frame % 2), 15 * (math.floor(frame / 2)))
                        end
                    end
                    self.gun.animationTick = self.gun.animationTick == 15 and 0 or self.gun.animationTick + 1
                elseif self.parent.gun.currentGunPosition == "NONE" and self.gun.gunPositionPrev ~= "NONE" then
                    models.models.main.Avatar.UpperBody.Body.Gun.GameDisplay.Display:setUVPixels()
                    self.gun.animationTick = 0
                end
                self.gun.gunPositionPrev = self.parent.gun.currentGunPosition
            end
        end)
    end;
}