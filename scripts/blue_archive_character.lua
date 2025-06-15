---@alias BlueArchiveCharacter.RightEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "LOWER" # 下を見る目
---| "CLOSED2" # 閉じた目2
---| "SCHEME" # 何かを企んでいる目
---| "TEAR" # 涙ぐんでいる目

---@alias BlueArchiveCharacter.LeftEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "LOWER" # 下を見る目
---| "CLOSED2" # 閉じた目2
---| "SCHEME" # 何かを企んでいる目
---| "INVERTED" # 反対側を見る目

---@alias BlueArchiveCharacter.MouthTextures
---| "NORMAL" # 通常
---| "OPENED" # 開いた口
---| "FRUST_OPENED" # ぐじゅぐじゅの開き口
---| "FRUST" # ぐじゅぐじゅ口
---| "SMALL" # 小さく開いた口
---| "OVER_SMILE" # 悪意を感じるにっこり
---| "UNCOMFORT" # への口
---| "SHOCK" # あんぐり口

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
                en_us = "Michiru";
                ja_jp = "ミチル";
            };

            lastName = {
                en_us = "Chidori";
                ja_jp = "千鳥";
            };

            clubName = {
                en_us = "Ninjutsu Research Department";
                ja_jp = "忍術研究部";
            };

            birth = {
                month = 2;
                day = 22;
            };
        }

        instance.faceParts = {
            rightEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(2, 0); --必須
                TIRED = vectors.vec2(3, 0); --必須
                CLOSED = vectors.vec2(4, 0); --必須
                LOWER = vectors.vec2(5, 0);
                CLOSED2 = vectors.vec2(7, 0);
                SCHEME = vectors.vec2(8, 0);
                TEAR = vectors.vec2(0, 1);
            };

            leftEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(1, 0); --必須
                TIRED = vectors.vec2(2, 0); --必須
                CLOSED = vectors.vec2(3, 0); --必須
                LOWER = vectors.vec2(5, 0);
                CLOSED2 = vectors.vec2(6, 0);
                SCHEME = vectors.vec2(8, 0);
                INVERTED = vectors.vec2(0, 1);
            };

            mouth = {
                OPENED = vectors.vec2(0, 0);
                FRUST_OPENED = vectors.vec2(1, 0);
                FRUST = vectors.vec2(2, 0);
                SMALL = vectors.vec2(3, 0);
                OVER_SMILE = vectors.vec2(0, 1);
                UNCOMFORT = vectors.vec2(1, 1);
                SHOCK = vectors.vec2(2, 1);
            };
        }

        instance.arms = {

        }

        instance.skirt = {
            skirtModels = {models.models.main.Avatar.UpperBody.Body.Skirt};
        }

        instance.gun = {
            scale = 1.75;

            gunPosition = {
                hold = {
                    firstPersonPos = {
                        right = vectors.vec3(1, 2, -8);
                        left = vectors.vec3(-1, 2, -8);
                    };

                    thirdPersonPos = {
                        right = vectors.vec3(-1.5, 1.5, -6);
                        left = vectors.vec3(1.5, 1.5, -6);
                    };
                };

                put = {
                    type = "BODY";

                    pos = {
                        right = vectors.vec3(1.5, 3.5, 3);
                        left = vectors.vec3(1.5, 3.5, 3);
                    };

                    rot = {
                        right = vectors.vec3(-20, -90, 0);
                        left = vectors.vec3(-20, -90, 0);
                    };
                };
            };

            sound = {
                name = "minecraft:entity.generic.explode";
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
            exSkills = {
                {
                    name = {
                        en_us = "Michiru-style technique!!";
                        ja_jp = "ミチル流忍法っ！！";
                    };

                    formationType = "STRIKER";

                    models = {models.models.ex_skill_1.CameraBackground};

                    animations = {"main", "ex_skill_1"};

                    camera = {
                        start = {
                            rot = vectors.vec3(10, 180, -10);
                            pos = vectors.vec3(0, 26.2, -25);
                        };

                        fin = {
                            rot = vectors.vec3(-10, 120, 10);
                            pos = vectors.vec3(22.05, 19.35, -9.65);
                        };
                    };

                    callbacks = {
                        onPreAnimation = function (self)
                            if not self.exSkill.exSkills[1].isInitialized then
                                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setPrimaryTexture("RESOURCE", "minecraft:textures/item/firework_rocket.png")
                                self.exSkill.exSkills[1].isInitialized = true
                            end
                            if host:isHost() then
                                models.models.ex_skill_1.CameraBackground:setOpacity(0)
                                local shouldAdjustBackgroundRot = client:getVersion() >= "1.21"
                                events.RENDER:register(function (delta, ctx, matrix)
                                    local opacity = models.models.ex_skill_1.CameraBackground.BackgroundOpacity:getAnimScale().x
                                    models.models.ex_skill_1.CameraBackground:setOpacity(opacity)
                                    if opacity > 0 then
                                        local backgroundPos = vectors.rotateAroundAxis(player:getBodyYaw(delta) + 180, renderer:getCameraOffsetPivot():copy():add(0, 1.62, 0):add(client:getCameraDir():copy():scale(1.8)), 0, 1, 0):scale(16 / 0.9375)
                                        models.models.ex_skill_1.CameraBackground:setOffsetPivot(backgroundPos)
                                        models.models.ex_skill_1.CameraBackground.BackgroundCore:setPos(backgroundPos)
                                        local windowSize = client:getWindowSize()
                                        models.models.ex_skill_1.CameraBackground.BackgroundCore:setScale(vectors.vec3(windowSize.x / windowSize.y, 1, 1):scale(40))
                                        if shouldAdjustBackgroundRot then
                                            models.models.ex_skill_1.CameraBackground.BackgroundCore:setRot(0, 0, renderer:getCameraRot().z)
                                        end
                                        models.models.ex_skill_1.CameraBackground.BackgroundCore.Flash.Flash:setOpacity(models.models.ex_skill_1.CameraBackground.BackgroundCore.FlashOpacity:getAnimScale().x)
                                    end
                                end, "ex_skill_1_render")
                            end
                            events.ITEM_RENDER:remove("firework_item_render")
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setPos()
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setRot()
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setScale(1, 1, 1)
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setParentType("None")
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setSecondaryRenderType("NONE")
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setVisible(false)
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "OPENED", 9, true)
                        end;

                        onAnimationTick = function (self, tick)
                            if tick == 9 then
                                self.parent.faceParts:setEmotion("LOWER", "LOWER", "OPENED", 5, true)
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.attack.weak"), player:getPos(), 0.5, 1.5)
                            elseif tick == 14 then
                                self.parent.faceParts:setEmotion("LOWER", "LOWER", "FRUST_OPENED", 8, true)
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.attack.weak"), player:getPos(), 0.5, 1.5)
                            elseif tick == 19 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.attack.sweep"), player:getPos(), 0.25, 1.5)
                            elseif tick == 22 then
                                self.parent.faceParts:setEmotion("LOWER", "LOWER", "FRUST", 10, true)
                            elseif tick == 25 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), player:getPos(), 0.5, 1.75)
                            elseif tick == 32 then
                                self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "FRUST", 3, true)
                            elseif tick == 33 then
                                models.models.main.Avatar.Head.Sweat:setVisible(true)
                            elseif tick == 35 then
                                self.parent.faceParts:setEmotion("SURPRISED", "SURPRISED", "SMALL", 16, true)
                                local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.Head.FaceParts.Mouth)
                                local velocityVec = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.Head.ExSkill1ParticleAnchor3):sub(anchorPos):normalize()
                                for _ = 1, 3 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:smoke"), anchorPos):setScale(0.8):setVelocity(velocityVec:copy():add(math.random() - 0.5, math.random() * 0.5, math.random() - 0.5):scale(0.05)):setLifetime(12)
                                end
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), player:getPos(), 1, 0.5)
                            elseif tick == 50  then
                                if host:isHost() then
                                    models.models.ex_skill_1.CameraBackground.BackgroundCore.Background:setColor(0, 0, 0)
                                end
                                models.models.main.Avatar.Head.Sweat:setVisible(false)
                            elseif tick == 51 then
                                self.parent.faceParts:setEmotion("SCHEME", "SCHEME", "OVER_SMILE", 16, true)
                                models.models.main.Avatar.Head.Head:setUVPixels(0, 16)
                            elseif tick == 58 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), player:getPos(), 0.5, 1.5)
                            elseif tick == 62 then
                                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setVisible(true)
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.flintandsteel.use"), player:getPos(), 1, 1)
                            elseif tick == 67 then
                                self.parent.faceParts:setEmotion("TEAR", "INVERTED", "UNCOMFORT", 5, true)
                                models.models.main.Avatar.Head.Head:setUVPixels()
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.firework_rocket.launch"), player:getPos(), 1, 0.75)
                            elseif tick == 72 then
                                self.parent.faceParts:setEmotion("TEAR", "INVERTED", "SHOCK", 30, true)
                            end

                            if tick >= 11 and tick <= 23 and (tick - 11) % 6 == 0 then
                                local bodyYaw = player:getBodyYaw()
                                local anchorPos = player:getPos():add(vectors.rotateAroundAxis(bodyYaw * -1, 0, 1.25, 0.4, 0, 1, 0))
                                for i = 0, 11 do
                                    local offsetVec = vectors.rotateAroundAxis(bodyYaw * -1, vectors.rotateAroundAxis(i * 30, 1, 0, 0, 0, 0, 1), 0, 1, 0):normalize()
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:end_rod"), anchorPos:copy():add(offsetVec:copy():scale(0.2))):setScale(0.25):setVelocity(offsetVec:copy():scale(0.05)):setColor(1, 1, 0.75):setLifetime(4)
                                end
                            elseif tick >= 9 and tick <= 19 and (tick - 9) % 5 == 0 then
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:sweep_attack"), player:getPos():add(vectors.rotateAroundAxis(player:getBodyYaw() * -1, 0, 1.35, 0.4, 0, 1, 0))):setScale(2):setLifetime(4)
                            end

                            if tick >= 1 and tick <= 23 then
                                local animationProgress = tick / 23
                                local playerPos = player:getPos()
                                local bodyYaw = player:getBodyYaw()
                                for i = 1, 2 do
                                    if i == 1 or tick >= 16 then
                                        local animPos = models.models.ex_skill_1["ExSkill1ParticleAnchor"..i]:getAnimPos():mul(-1, 1, -1)
                                        local dirVec = animPos:copy():sub(self.exSkill.exSkills[1].fireAnchorPosPrev[i])
                                        for j = 0, 7 do
                                            particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:flame"), playerPos:copy():add(vectors.rotateAroundAxis(bodyYaw * -1, self.exSkill.exSkills[1].fireAnchorPosPrev[i]:copy():add(dirVec:copy():scale(j / 8)):scale(0.0625), 0, 1, 0))):setLifetime(animationProgress * 10 + math.random(6, 14))
                                        end
                                        self.exSkill.exSkills[1].fireAnchorPosPrev[i] = animPos:copy()
                                    end
                                end
                            elseif tick >= 62 then
                                local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework.ExSkill1ParticleAnchor)
                                for _ = 1, 2 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:firework"), anchorPos):setScale(1):setVelocity(math.random() * 0.4 - 0.2, math.random() * 0.4 - 0.2, math.random() * 0.4 - 0.2):setGravity(0.25):setColor(1, 0.856, 0.185):setLifetime(4)
                                end
                            end
                        end;

                        onPostAnimation = function (self, forcedStop)
                            if host:isHost() then
                                events.RENDER:remove("ex_skill_1_render")
                                models.models.ex_skill_1.CameraBackground.BackgroundCore.Background:setColor()
                            end
                            self.exSkill.exSkills[1].fireAnchorPosPrev = {vectors.vec3(-19, 25.5, 15), vectors.vec3(-21, 43, -11)};
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setParentType("Item")
                            self.registerFireworkItemRenderEvent()
                            if forcedStop then
                                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setVisible(true)
                                models.models.main.Avatar.Head.Sweat:setVisible(false)
                                models.models.main.Avatar.Head.Head:setUVPixels()
                            end
                        end;
                    };

                    ---このExスキルの初期化処理が行われたかどうか。
                    ---@type boolean
                    isInitialized = false;

                    ---前ティックの炎のトレイルの位置：[1]: アンカー1, [2]: アンカー2
                    ---@type Vector3[]
                    fireAnchorPosPrev = {vectors.vec3(-19, 25.5, 15), vectors.vec3(-21, 43, -11)};
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

                    ---前ティックで剣を持っていたかどうか。
                    ---@type boolean
                    hadSwordPrev = false;
                };
            };
        }

        instance.bubble = {

        }

        instance.headBlock = {
            includeModels = {};
        }

        instance.portrait = {
            includeModels = {};
        }

        instance.deathAnimation = {

        }

        instance.actionWheel = {
            isVehicleOptionEnabled = false;
        }

        instance.physics = {
            physicData = {
                {
                    models = {models.models.main.Avatar.Head.HairTails.LeftHairTail};
                    x = {
                        vertical = {
                            min = -170;
                            neutral = -10;
                            max = 70;
                            headRotMultiplayer = -1;

                            headX = {
                                multiplayer = -80;
                                min = -90;
                                max = 70;
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
                            min = -170;
                            neutral = 45;
                            max = 70;

                            headX = {
                                multiplayer = -80;
                                min = -45;
                                max = 70;
                            };
                        };
                    };

                    z = {
                        vertical = {
                            min = -70;
                            neutral = -10;
                            max = 70;

                            headZ = {
                                multiplayer = -80;
                                min = -70;
                                max = 70;
                            };
                        };

                        horizontal = {
                            min = -70;
                            neutral = -10;
                            max = 70;

                            headX = {
                                multiplayer = 80;
                                min = -10;
                                max = -2.5;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.HairTails.RightHairTail};

                    x = {
                        vertical = {
                            min = -170;
                            neutral = -10;
                            max = 70;
                            headRotMultiplayer = -1;

                            headX = {
                                multiplayer = -80;
                                min = -90;
                                max = 70;
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
                            min = -170;
                            neutral = 45;
                            max = 70;

                            headX = {
                                multiplayer = -80;
                                min = -45;
                                max = 70;
                            };
                        };
                    };

                    z = {
                        vertical = {
                            min = -70;
                            neutral = 10;
                            max = 70;

                            headZ = {
                                multiplayer = -80;
                                min = -70;
                                max = 70;
                            };
                        };

                        horizontal = {
                            min = -70;
                            neutral = 10;
                            max = 70;

                            headX = {
                                multiplayer = 80;
                                min = 10;
                                max = 2.5;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.HRibbons.RightHeadRibbon1};

                    y = {
                        vertical = {
                            min = -90;
                            neutral = 0;
                            max = 90;

                            headX = {
                                multiplayer = 160;
                                min = -90;
                                max = 90;
                            };
                        };

                        horizontal = {
                            min = -45;
                            neutral = -45;
                            max = 45;

                            headX = {
                                multiplayer = 80;
                                min = -45;
                                max = 45;
                            };

                            bodyY = {
                                multiplayer = -160;
                                min = -45;
                                max = 45;
                            };
                        };
                    };

                    z = {
                        vertical = {
                            min = -75;
                            neutral = 45;
                            max = 65;

                            bodyY = {
                                multiplayer = 160;
                                min = -75;
                                max = 65;
                            };

                            headRot = {
                                multiplayer = 0.08;
                                min = 0;
                                max = 65;
                            };
                        };

                        horizontal = {
                            min = -75;
                            neutral = 45;
                            max = 65;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.HRibbons.RightHeadRibbon2};

                    y = {
                        vertical = {
                            min = -90;
                            neutral = 0;
                            max = 90;

                            headX = {
                                multiplayer = 160;
                                min = -90;
                                max = 90;
                            };
                        };

                        horizontal = {
                            min = -45;
                            neutral = -45;
                            max = 45;

                            headX = {
                                multiplayer = 80;
                                min = -45;
                                max = 45;
                            };

                            bodyY = {
                                multiplayer = -160;
                                min = -45;
                                max = 45;
                            };
                        };
                    };

                    z = {
                        vertical = {
                            min = -65;
                            neutral = 70;
                            max = 82.5;

                            bodyY = {
                                multiplayer = 160;
                                min = -65;
                                max = 82.5;
                            };

                            headRot = {
                                multiplayer = 0.08;
                                min = 0;
                                max = 82.5;
                            };
                        };

                        horizontal = {
                            min = -65;
                            neutral = 70;
                            max = 82.5;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.HRibbons.LeftHeadRibbon1};

                    y = {
                        vertical = {
                            min = -90;
                            neutral = 0;
                            max = 90;

                            headX = {
                                multiplayer = -160;
                                min = -90;
                                max = 90;
                            };
                        };

                        horizontal = {
                            min = -45;
                            neutral = 45;
                            max = 45;

                            headX = {
                                multiplayer = -80;
                                min = -45;
                                max = 45;
                            };

                            bodyY = {
                                multiplayer = 160;
                                min = -45;
                                max = 45;
                            };
                        };
                    };

                    z = {
                        vertical = {
                            min = -65;
                            neutral = -45;
                            max = 75;

                            bodyY = {
                                multiplayer = -160;
                                min = -65;
                                max = 75;
                            };

                            headRot = {
                                multiplayer = -0.08;
                                min = -65;
                                max = 0;
                            };
                        };

                        horizontal = {
                            min = -65;
                            neutral = -45;
                            max = 75;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.HRibbons.LeftHeadRibbon2};

                    y = {
                        vertical = {
                            min = -90;
                            neutral = 0;
                            max = 90;

                            headX = {
                                multiplayer = -160;
                                min = -90;
                                max = 90;
                            };
                        };

                        horizontal = {
                            min = -45;
                            neutral = 45;
                            max = 45;

                            headX = {
                                multiplayer = -80;
                                min = -45;
                                max = 45;
                            };

                            bodyY = {
                                multiplayer = 160;
                                min = -45;
                                max = 45;
                            };
                        };
                    };

                    z = {
                        vertical = {
                            min = -82.5;
                            neutral = -70;
                            max = 65;

                            bodyY = {
                                multiplayer = -160;
                                min = -82.5;
                                max = 65;
                            };

                            headRot = {
                                multiplayer = -0.08;
                                min = -82.5;
                                max = 0;
                            };
                        };

                        horizontal = {
                            min = -82.5;
                            neutral = -70;
                            max = 65;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.Cowlick};

                    x = {
                        vertical = {
                            min = -85;
                            neutral = -67.5;
                            max = -47.5;

                            bodyY = {
                                multiplayer = -40;
                                min = -85;
                                max = -47.5;
                            };
                        };

                        horizontal = {
                            min = -85;
                            neutral = -67.5;
                            max = -47.5;

                            bodyX = {
                                multiplayer = -80;
                                min = -85;
                                max = -47.5;
                            };
                        };
                    };

                    y = {
                        vertical = {
                            min = 50;
                            neutral = 50;
                            max = 50;
                        };

                        horizontal = {
                            min = 50;
                            neutral = 50;
                            max = 50;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Tail};

                    x = {
                        vertical = {
                            min = -60;
                            neutral = 45;
                            max = 60;
                            sneakOffset = 30;

                            bodyX = {
                                multiplayer = -160;
                                min = 0;
                                max = 60;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -60;
                                max = 60;
                            };

                            bodyRot = {
                                multiplayer = 0.05;
                                min = 0;
                                max = 60;
                            };
                        };

                        horizontal = {
                            min = -60;
                            neutral = 0;
                            max = 60;
                            sneakOffset = 30;

                            bodyX = {
                                multiplayer = 160;
                                min = -60;
                                max = 60;
                            };
                        };
                    };

                    y = {
                        vertical = {
                            min = -30;
                            neutral = 0;
                            max = 30;

                            bodyZ = {
                                multiplayer = -160;
                                min = -30;
                                max = 30;
                            };
                        };

                        horizontal = {
                            min = -30;
                            neutral = 0;
                            max = 30;

                            bodyRot = {
                                multiplayer = 0.05;
                                min = -30;
                                max = 30;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Scarfs.Scarf1};

                    x = {
                        vertical = {
                            min = -30;
                            neutral = 75;
                            max = 75;

                            bodyX = {
                                multiplayer = -80;
                                min = 0;
                                max = 75;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -30;
                                max = 75;
                            };

                            bodyRot = {
                                multiplayer = 0.05;
                                min = -30;
                                max = 75;
                            };
                        };

                        horizontal = {
                            min = -30;
                            neutral = 75;
                            max = 75;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Scarfs.Scarf2};

                    x = {
                        vertical = {
                            min = -30;
                            neutral = 75;
                            max = 75;

                            bodyX = {
                                multiplayer = -120;
                                min = 0;
                                max = 75;
                            };

                            bodyY = {
                                multiplayer = 120;
                                min = -30;
                                max = 75;
                            };

                            bodyRot = {
                                multiplayer = 0.075;
                                min = -30;
                                max = 75;
                            };
                        };

                        horizontal = {
                            min = -30;
                            neutral = 75;
                            max = 75;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Scarfs.Scarf1.Scarf1YPivot};

                    y = {
                        vertical = {
                            min = -70;
                            neutral = 15;
                            max = 80;

                            bodyX = {
                                multiplayer = -20;
                                min = 0;
                                max = 15;
                            };

                            bodyZ = {
                                multiplayer = -80;
                                min = -70;
                                max = 80;
                            };

                            bodyRot = {
                                multiplayer = 0.01;
                                min = 0;
                                max = 15;
                            };
                        };

                        horizontal = {
                            min = -70;
                            neutral = 15;
                            max = 80;

                            bodyX = {
                                multiplayer = -20;
                                min = 0;
                                max = 15;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Scarfs.Scarf2.Scarf2YPivot};

                    y = {
                        vertical = {
                            min = -80;
                            neutral = -15;
                            max = 70;

                            bodyX = {
                                multiplayer = 30;
                                min = -15;
                                max = 0;
                            };

                            bodyZ = {
                                multiplayer = -120;
                                min = -80;
                                max = 70;
                            };

                            bodyRot = {
                                multiplayer = -0.015;
                                min = -15;
                                max = 0;
                            };
                        };

                        horizontal = {
                            min = -80;
                            neutral = -15;
                            max = 70;

                            bodyX = {
                                multiplayer = 30;
                                min = 0;
                                max = -15;
                            };
                        };
                    };
                };
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

        self.registerFireworkItemRenderEvent()

        events.TICK:register(function ()
            local hasSword = (player:getHeldItem().id:match("^minecraft:(%a+)_sword$") ~= nil or player:getHeldItem(true).id:match("^minecraft:(%a+)_sword$") ~= nil) and self.parent.exSkill.animationCount == -1
            if hasSword ~= self.costume.costumes[1].hadSwordPrev then
                if hasSword then
                    models.models.main.Avatar.UpperBody.Body.SwordGroup.Sword:setParentType("Item")
                    sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.anvil.place"), player:getPos(), 0.5, 5)
                    local version = client:getVersion() == "1.21.4"
                    events.ITEM_RENDER:register(function (item, mode)
                        if item.id:match("^minecraft:(%a+)_sword$") ~= nil and mode ~= "HEAD" then
                            if mode == "FIRST_PERSON_LEFT_HAND" or mode == "FIRST_PERSON_RIGHT_HAND" then
                                models.models.main.Avatar.UpperBody.Body.SwordGroup.Sword:setPos(0, -7.5, -1)
                                models.models.main.Avatar.UpperBody.Body.SwordGroup.Sword:setRot(10, 0, 0)
                            elseif mode == "THIRD_PERSON_LEFT_HAND" or mode == "THIRD_PERSON_RIGHT_HAND" then
                                models.models.main.Avatar.UpperBody.Body.SwordGroup.Sword:setPos(0.5, -9.75, -1)
                                models.models.main.Avatar.UpperBody.Body.SwordGroup.Sword:setRot()
                            end
                            local material = item.id:match("^minecraft:(%a+)_sword$")
                            models.models.main.Avatar.UpperBody.Body.SwordGroup.Sword.SwordBlade:setUVPixels(material == "wooden" and -4 or (material == "stone" and -2 or (material == "golden" and 2 or (material == "diamond" and 4 or (material == "netherite" and 6 or 0)))), 0)
                            models.models.main.Avatar.UpperBody.Body.SwordGroup.Sword:setSecondaryRenderType(item:hasGlint() and "GLINT"..(version and "2" or "") or "NONE")
                            return models.models.main.Avatar.UpperBody.Body.SwordGroup.Sword
                        end
                    end, "sword_item_render")
                else
                    events.ITEM_RENDER:remove("sword_item_render")
                    models.models.main.Avatar.UpperBody.Body.SwordGroup.Sword:setParentType("None")
                    models.models.main.Avatar.UpperBody.Body.SwordGroup.Sword:setPos()
                    models.models.main.Avatar.UpperBody.Body.SwordGroup.Sword:setRot()
                    models.models.main.Avatar.UpperBody.Body.SwordGroup.Sword:setSecondaryRenderType("NONE")
                    sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.iron_trapdoor.close"), player:getPos(), 0.5, 2)
                end
                self.costume.costumes[1].hadSwordPrev = hasSword
            end
        end)
    end;

    registerFireworkItemRenderEvent = function ()
        local version = client:getVersion() == "1.21.4"
        events.ITEM_RENDER:register(function (item, mode, pos, rot, scale, lefthanded)
            if item.id == "minecraft:firework_rocket" then
                if mode == "FIRST_PERSON_LEFT_HAND" then
                    models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setPos(-2.5, 2, 0)
                    models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setRot(60, 10, 0)
                    models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setScale()
                elseif mode == "FIRST_PERSON_RIGHT_HAND" then
                    models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setPos(2.5, 2, 0)
                    models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setRot(60, 10, 0)
                    models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setScale()
                elseif mode == "THIRD_PERSON_LEFT_HAND" or mode == "THIRD_PERSON_RIGHT_HAND" then
                    models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setPos(0, -2, 0)
                    models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setRot(90, 90, 0)
                    models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setScale()
                else
                    models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setPos(0, 12.5, 0)
                    models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setRot(90, 0, 0)
                    models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setScale(2, 2, 2)
                end
                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework:setSecondaryRenderType(item:hasGlint() and "GLINT"..(version and "2" or "") or "NONE")
                return models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Firework
            end
        end, "firework_item_render")
    end;
}