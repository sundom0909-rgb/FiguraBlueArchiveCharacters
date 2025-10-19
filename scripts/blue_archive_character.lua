---@alias BlueArchiveCharacter.RightEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "INVERTED" # 反対側を見る目
---| "WORRY" # 困った目
---| "WORRY_CENTER" # 困りつつ少し反対側を見る目
---| "UNEQUAL" # 不等号目

---@alias BlueArchiveCharacter.LeftEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "WORRY" # 困った目
---| "WORRY_CENTER" # 困りつつ少し反対側を見る目
---| "UNEQUAL" # 不等号目
---| "WORRY_INVERTED" # 困りつつ反対側を見る目

---@alias BlueArchiveCharacter.MouthTextures
---| "NORMAL" # 通常
---| "ANXIOUS" # への口
---| "O" # オーの形の口
---| "SURPRISED" # あんぐり口
---| "SMILE" # にっこり口
---| "OPENED" # 開いた口
---| "OPENED_SMALL" # 小さく開いた口
---| "ANXIOUS_SMALL" # 小さいへの口

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
                en_us = "Hifumi";
                ja_jp = "ヒフミ";
            };

            lastName = {
                en_us = "Ajitani";
                ja_jp = "阿慈谷";
            };

            clubName = {
                en_us = "Supplementary Classes Club";
                ja_jp = "補習授業部";
            };

            birth = {
                month = 11;
                day = 27;
            };
        }

        instance.faceParts = {
            rightEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(2, 0); --必須
                TIRED = vectors.vec2(3, 0); --必須
                CLOSED = vectors.vec2(4, 0); --必須
                INVERTED = vectors.vec2(5, 0);
                WORRY = vectors.vec2(6, 0);
                WORRY_CENTER = vectors.vec2(8, 0);
                UNEQUAL = vectors.vec2(0, 1);
            };

            leftEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(1, 0); --必須
                TIRED = vectors.vec2(2, 0); --必須
                CLOSED = vectors.vec2(3, 0); --必須
                WORRY = vectors.vec2(6, 0);
                WORRY_CENTER = vectors.vec2(8, 0);
                UNEQUAL = vectors.vec2(-1, 1);
                WORRY_INVERTED = vectors.vec2(0, 1);
            };

            mouth = {
                ANXIOUS = vectors.vec2(0, 0);
                O = vectors.vec2(1, 0);
                SURPRISED = vectors.vec2(2, 0);
                SMILE = vectors.vec2(3, 0);
                OPENED = vectors.vec2(0, 1);
                OPENED_SMALL = vectors.vec2(1, 1);
                ANXIOUS_SMALL = vectors.vec2(2, 1);
            };
        }

        instance.arms = {

        }

        instance.skirt = {
            skirtModels = {models.models.main.Avatar.UpperBody.Body.Skirt};
        }

        instance.gun = {
            scale = 1.5;

            gunPosition = {
                hold = {
                    firstPersonPos = {
                        right = vectors.vec3(0.5, 1, -5);
                        left = vectors.vec3(0.5, 1, -5);
                    };

                    thirdPersonPos = {
                        right = vectors.vec3(-1.75, 0, -6);
                        left = vectors.vec3(1.75, 0, -6);
                    };
                };

                put = {
                    type = "HIDDEN";
                };
            };

            sound = {
                name = "minecraft:entity.firework_rocket.blast";
                pitch = 1;
            };
        }

        instance.placementObjects = {
            {
                model = models.models.ex_skill_1.PeroroDisc;

                boundingBox = {
                    size = vectors.vec3(8, 42, 8);
                };

                placementMode = "MOVE";

                ---デコイペロロのアニメーションカウンター。-1はアニメーション停止を示す。
                ---@type integer
                animationTick = -1;

                callbacks = {
                    onDeinit = function (self, placementObject)
                        placementObject.object.Peroro:setVisible(false)
                        for _, animName in ipairs({"peroro_start", "peroro_loop"}) do
                            animations["models.ex_skill_1"][animName]:stop()
                        end
                        self.placementObjects[1].animationTick = -1
                    end;

                    onTick = function (self, placementObject)
                        if self.placementObjects[1].animationTick >= 0 then
                            if self.placementObjects[1].animationTick == 8 then
                                animations["models.ex_skill_1"]["peroro_loop"]:play()
                            end
                            if self.placementObjects[1].animationTick > 0 and self.placementObjects[1].animationTick % 12 == 0 then
                                local colors = {vectors.vec3(1, 1, 0), vectors.vec3(0.52, 1, 1), vectors.vec3(0.96, 0.38, 1)}
                                for _ = 1, 4 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:note"), placementObject.currentPos:copy():add(math.random() * 3 - 1.5, math.random() * 2, math.random() * 3 - 1.5)):setColor(colors[math.random(#colors)])
                                end
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.experience_orb.pickup"), placementObject.currentPos, 0.25, math.random() * 0.5 + 1.5)
                            end
                            if self.placementObjects[1].animationTick >= 21 and (self.placementObjects[1].animationTick - 8) % 19 == 0 then
                                local colors = {vectors.vec3(1, 1, 0), vectors.vec3(0.52, 1, 1), vectors.vec3(0.96, 0.38, 1)}
                                local color = colors[math.random(#colors)]
                                for i = 0, 12 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), placementObject.currentPos):setScale(1):setVelocity(vectors.rotateAroundAxis(i * 30, 0, 0, math.random() * 0.05 + 0.05, 0, 1, 0)):setColor(color):setLifetime(math.random(12, 16))
                                end
                            end
                            self.placementObjects[1].animationTick = self.placementObjects[1].animationTick + 1
                        end
                    end;

                    onGround = function (self, placementObject)
                        if self.placementObjects[1].animationTick == -1 then
                            placementObject.object.Peroro:setVisible(true)
                            animations["models.ex_skill_1"]["peroro_start"]:play()
                            local colors = {vectors.vec3(1, 1, 0), vectors.vec3(0.52, 1, 1), vectors.vec3(0.96, 0.38, 1)}
                            for _ = 1, 20 do
                                local offset = vectors.vec3(math.random() * 3 - 1.5, math.random() * 2, math.random() * 3 - 1.5)
                                local velocityOffset = offset:copy():scale(0.025)
                                velocityOffset.y = 0.2
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), placementObject.currentPos:copy():add(offset)):setScale(1.5):setVelocity(velocityOffset):setColor(colors[math.random(#colors)]):setLifetime(math.random(8, 12))
                            end
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), placementObject.currentPos, 1, 1)
                            self.placementObjects[1].animationTick = 0
                        end
                    end;
                };
            };
        }

        instance.exSkill = {
            exSkills = {
                {
                    name = {
                        en_us = "Help me, Peroro-sama!";
                        ja_jp = "助けて、ペロロ様！";
                    };

                    formationType = "STRIKER";

                    models = {models.models.ex_skill_1.GlowEffect};

                    animations = {"main", "gun", "ex_skill_1"};

                    camera = {
                        start = {
                            rot = vectors.vec3(0, 180, 0);
                            pos = vectors.vec3(0, 15, -29);
                        };

                        fin = {
                            rot = vectors.vec3(0, 215, 0);
                            pos = vectors.vec3(-4.5, 2, -74);
                        };
                    };

                    callbacks = {
                        onPreAnimation = function (self)
                            self.parent.placementObjectManager:removeAll()
                            models.script_placement_object.PeroroDisc:moveTo(models.models.ex_skill_1)
                            models.models.ex_skill_1.PeroroDisc:setPos()
                            models.models.ex_skill_1.PeroroDisc:setRot()
                            models.models.ex_skill_1.PeroroDisc:setVisible(true)
                            self.parent.faceParts:setEmotion("INVERTED", "NORMAL", "ANXIOUS", 8, true)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.armor.equip_leather"), player:getPos(), 1, 1)
                        end;

                        onAnimationTick = function (self, tick)
                            if tick == 0 then
                                models.models.main.Avatar.UpperBody.Body.Gun:setPos()
                                models.models.main.Avatar.UpperBody.Body.Gun:setRot()
                                models.models.main.Avatar.UpperBody.Body.Gun:setVisible(true)
                                models.models.main.Avatar.UpperBody.Body.Gun:moveTo(models.models.main)
                            elseif tick == 8 then
                                self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "ANXIOUS", 19, true)
                            elseif tick == 18 then
                                for i = 0, 11 do
                                    local offset = vectors.rotateAroundAxis(i * 30, 0, 0, 0.25, 0, 1, 0)
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:campfire_cosy_smoke"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Body.Backpack.ExSkill1ParticleAnchor1):copy():add(offset)):setScale(1):setVelocity(offset:copy():scale(0.05):add(0, 0.025, 0)):setLifetime(12)
                                end
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.chiseled_bookshelf.insert"), player:getPos(), 1, 1)
                            elseif tick == 27 then
                                self.parent.faceParts:setEmotion("WORRY_CENTER", "WORRY", "ANXIOUS", 3, true)
                            elseif tick == 30 then
                                self.parent.faceParts:setEmotion("WORRY", "WORRY", "ANXIOUS", 3, true)
                            elseif tick == 33 then
                                self.parent.faceParts:setEmotion("WORRY", "WORRY_CENTER", "ANXIOUS", 3, true)
                            elseif tick == 36 then
                                self.parent.faceParts:setEmotion("WORRY_CENTER", "WORRY", "O", 3, true)
                            elseif tick == 39 then
                                self.parent.faceParts:setEmotion("WORRY", "WORRY", "O", 6, true)
                            elseif tick == 44 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), player:getPos(), 1, 1.5)
                            elseif tick == 45 then
                                self.parent.faceParts:setEmotion("SURPRISED", "SURPRISED", "SURPRISED", 13, true)
                            elseif tick == 54 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), player:getPos(), 1, 1.5)
                            elseif tick == 58 then
                                self.parent.faceParts:setEmotion("UNEQUAL", "UNEQUAL", "ANXIOUS", 10, true)
                            elseif tick == 62 then
                                local colors = {vectors.vec3(1, 1, 0), vectors.vec3(0.52, 1, 1), vectors.vec3(0.96, 0.38, 1)}
                                local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_1.PeroroDisc)
                                for i = 0, 11 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), anchorPos):setVelocity(vectors.rotateAroundAxis(i * 30, 0, math.random() * 0.05 - 0.025 + 0.05, 0.1, 0, 1, 0)):setColor(colors[math.random(#colors)]):setGravity(0.1):setLifetime(16)
                                end
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.generic.small_fall"), anchorPos, 0.5, 1.2)
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.dispenser.dispense"), anchorPos, 1, 1.5)
                            elseif tick == 68 then
                                self.parent.faceParts:setEmotion("WORRY", "WORRY", "O", 54, true)
                            end

                            if tick >= 26 and tick <= 43 then
                                local bodyYaw = player:getBodyYaw()
                                local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Body.Backpack.ExSkill1ItemAnchor)
                                for _ = 1, 4 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:campfire_cosy_smoke"), anchorPos:copy():add(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 0.6 - 0.3, math.random() * 0.2 - 0.1, math.random() * 0.2 - 0.1, 0, 1, 0))):setScale(1):setLifetime(8)
                                end
                                local colors = {vectors.vec3(1, 1, 0), vectors.vec3(0.52, 1, 1), vectors.vec3(0.96, 0.38, 1)}
                                if (tick - 26) % 2 == 0 then
                                    local offsetX = math.random() * 0.6 - 0.3
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), anchorPos:copy():add(vectors.rotateAroundAxis(bodyYaw * -1, offsetX, 0, math.random() * 0.2 - 0.1, 0, 1, 0))):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, offsetX * 0.1, 0.1, 0.05, 0, 1, 0)):setColor(colors[math.random(#colors)]):setLifetime(12)
                                end
                                if (tick - 26) % 3 == 0 then
                                    ---@diagnostic disable-next-line: invisible
                                    self.parent.itemLauncher:launch(self.parent.compatibilityUtils.registries.item[math.random(#self.parent.compatibilityUtils.registries.item)], anchorPos, bodyYaw * -1, 0.25, vectors.rotateAroundAxis(bodyYaw * -1, (((tick - 26) % 6 == 0) and 1 or -1) * (math.random() + 2), 4, 0, 0, 1, 0), 30)
                                    sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), anchorPos, 0.75, math.random() * 0.4 + 0.8)
                                end
                            end
                        end;

                        onPostAnimation = function (self, forcedStop)
                            models.models.ex_skill_1.PeroroDisc:setVisible(false)
                            models.models.ex_skill_1.PeroroDisc:moveTo(models.script_placement_object)
                            models.models.main.Gun:moveTo(models.models.main.Avatar.UpperBody.Body)
                            models.models.main.Avatar.UpperBody.Body.Gun:setVisible(false)
                            if not forcedStop then
                                local bodyYaw = player:getBodyYaw()
                                self.parent.placementObjectManager:spawn(1, player:getPos():copy():add(vectors.rotateAroundAxis(bodyYaw * -1, 0, 1, 4.3594, 0, 1, 0)), bodyYaw * -1 + 180)
                            else
                                self.parent.itemLauncher:removeAll()
                            end
                        end;
                    };
                };

                {
                    name = {
                        en_us = "Crusader-chan, please!";
                        ja_jp = "クルセイダーちゃん、お願いします！";
                    };

                    formationType = "SPECIAL";

                    models = {models.models.ex_skill_2.Tank, models.models.main.Avatar.UpperBody.Body.SwimRing, models.models.main.Avatar.Head.NoticeEffect};

                    animations = {"main", "ex_skill_2"};

                    camera = {
                        start = {
                            rot = vectors.vec3(20, 80, -15);
                            pos = vectors.vec3(55, 27.8, 19);
                        };

                        fin = {
                            rot = vectors.vec3(0, 25, 0);
                            pos = vectors.vec3(56.9, 56, -1075.5);
                        };
                    };

                    callbacks = {
                        onPreAnimation = function (self)
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "SMILE", 20, true)
                        end;

                        onAnimationTick = function (self, tick)
                            if tick <= 15 and tick % 2 == 0 then
                                local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Tank.TankBody.ExSkill2ParticleAnchor1)
                                local bodyYaw = player:getBodyYaw()
                                local colorTable = {vectors.vec3(0.96, 0.92, 0.98), vectors.vec3(0.75, 1, 1), vectors.vec3(0.93, 1, 0.64)}
                                for _ = 1, 2 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:end_rod"), anchorPos:copy():add(vectors.rotateAroundAxis(bodyYaw * -1, 0.05, math.random() * 0.8 - 0.4, math.random() * 1.8 - 0.9, 0, 1, 0))):setScale(math.random() * 0.25 + 0.25):setColor(colorTable[math.random(#colorTable)]):setLifetime(4)
                                end
                            elseif tick == 20 then
                                self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "SMILE", 4, true)
                            elseif tick == 25 then
                                local bodyYaw = player:getBodyYaw()
                                local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.Head):add(vectors.rotateAroundAxis(bodyYaw * -1, 0, 0, 0.1, 0, 1, 0))
                                for i = 0, 11 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:end_rod"), anchorPos):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, vectors.rotateAroundAxis(i * 30, 0, 0, math.random() * 0.05 + 0.1, 1, 0, 0), 0, 1, 0)):setColor(1, 1, 0.22):setLifetime(12)
                                end
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), anchorPos, 1, 3)
                            elseif tick == 24 then
                                self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "OPENED", 11, true)
                            elseif tick == 35 then
                                self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "OPENED", 1, true)
                            elseif tick == 36 then
                                self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "OPENED_SMALL", 8, true)
                            elseif tick == 42 then
                                self.exSkill.exSkills[2].engineSound = sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.minecart.riding"), player:getPos(), 0.25, 0.5)
                            elseif tick == 44 then
                                self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "OPENED_SMALL", 2, true)
                            elseif tick == 45 or tick == 48 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.experience_orb.pickup"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 0.5, 1.5)
                            elseif tick == 46 then
                                self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "ANXIOUS_SMALL", 6, true)
                            elseif tick == 52 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.firework_rocket.launch"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 1, 2)
                            elseif tick == 53 then
                                self.parent.faceParts:setEmotion("SURPRISED", "SURPRISED", "SURPRISED", 8, true)
                            elseif tick == 61 then
                                self.parent.faceParts:setEmotion("WORRY", "WORRY_INVERTED", "SURPRISED", 14, true)
                            elseif tick == 75 then
                                self.parent.faceParts:setEmotion("UNEQUAL", "UNEQUAL", "SURPRISED", 29, true)
                            end

                            if tick >= 56 and (tick - 56) % 3 == 0 then
                                ---@type Minecraft.itemID
                                local itemTable = {"melon", "potion", "melon_slice", "apple", "milk_bucket", "tube_coral_block", "brain_coral_block", "bubble_coral_block", "fire_coral_block", "horn_coral_block", "tube_coral", "brain_coral", "fire_coral", "horn_coral", "bubble_coral", "tube_coral_fan", "brain_coral_fan", "bubble_coral_fan", "fire_coral_fan", "horn_coral_fan", "cod", "cod_bucket", "salmon", "salmon_bucket", "tropical_fish", "tropical_fish_bucket", "seagrass", "sea_pickle", "kelp", "ink_sac", "turtle_scute", "sand", "heart_of_the_sea"}
                                local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Tank.TankBody.CoolerBox.ExSkill2LauncherAnchor)
                                self.parent.itemLauncher:launch(self.parent.compatibilityUtils:checkItem("minecraft:" .. itemTable[math.random(#itemTable)]), anchorPos, math.random() * 360, 0.75, vectors.rotateAroundAxis(player:getBodyYaw() * -1, math.random() * 4 - 2, math.random() * 2 + 1, math.random() * 10 + 5, 0, 1, 0), 30)
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), anchorPos, 1, math.random() * 0.4 + 0.8)
                            end

                            if tick >= 42 then
                                self.exSkill.exSkills[2].engineSound:setPos(self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar))
                            end
                            if tick >= 52 then
                                if tick % 2 == 0 then
                                    sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.piston.extend"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Tank), 0.5, 0.2 + (tick - 52) / 520)
                                    sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.piston.contract"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Tank), 0.5, 0.2 + (tick - 52) / 520)
                                end
                                for _, modelPart in ipairs({models.models.ex_skill_2.Tank.RightCrawler.RightCrawlerBelt, models.models.ex_skill_2.Tank.LeftCrawler.LeftCrawlerBelt}) do
                                    modelPart:setUVPixels(0, (tick % 2))
                                end
                                local bodyYaw = player:getBodyYaw()
                                for _, anchor in ipairs({models.models.ex_skill_2.Tank.LeftCrawler.ExSkill2ParticleAnchor2, models.models.ex_skill_2.Tank.RightCrawler.ExSkill2ParticleAnchor3}) do
                                    local anchorPos = self.parent.modelUtils.getModelWorldPos(anchor)
                                    local particleBlock = world.getBlockState(anchorPos:copy():add(0, -1, 0)).id
                                    if particleBlock ~= "minecraft:air" and particleBlock ~= "minecraft:cave_air" and particleBlock ~= "minecraft:void_air" then
                                        for _ = 1, 10 do
                                            particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:block", particleBlock), anchorPos):setScale(1.5):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 2 - 1, math.random() * 0.6, math.random() * 0.5 + 0.5, 0, 1, 0))
                                        end
                                    end
                                end
                            end
                        end;

                        onPostAnimation = function (self)
                            if self.exSkill.exSkills[2].engineSound ~= nil then
                                self.exSkill.exSkills[2].engineSound:stop()
                                self.exSkill.exSkills[2].engineSound = nil
                            end
                        end;
                    };

                    ---戦車のエンジン音のインスタンス
                    ---@type Sound|nil
                    engineSound = nil;
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

                    ---この衣装が初期化されているかどうか。
                    ---@type boolean
                    isInitialized = false;
                };
            };

            callbacks = {
                onChange = function (self, costumeId)
                    if costumeId == "MASKED" then
                        --覆面水着団
                        models.models.main.Avatar.Head.CMaskedH:setVisible(true)
                    elseif costumeId == "SWIMSUIT" then
                        --水着
                        self.parent.costume.setCostumeTextureOffset(1)
                        models.models.main.Avatar.Head.CSwimsuitH:setVisible(true)
                        for _, modelPart in ipairs({models.models.main.Avatar.Head.HairTails.RightHairTail.RightHairTailZPivot.RightHairTailAccessories.RightHairTailAccessory2, models.models.main.Avatar.Head.HairTails.RightHairTail.RightHairTailZPivot.RightHairTailAccessories.RightHairTailAccessory3, models.models.main.Avatar.Head.HairTails.LeftHairTail.LeftHairTailZPivot.LeftHairTailAccessories.LeftHairTailAccessory2, models.models.main.Avatar.Head.HairTails.LeftHairTail.LeftHairTailZPivot.LeftHairTailAccessories.LeftHairTailAccessory3, models.models.main.Avatar.UpperBody.Body.Backpack, models.models.main.Avatar.UpperBody.Body.Skirt, models.models.main.Avatar.UpperBody.Arms.RightArm.RightTrinityLogo, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftTrinityLogo}) do
                            modelPart:setVisible(false)
                        end
                        self.physics.physicData[2].z.vertical.neutral = 5
                        self.physics.physicData[2].z.vertical.headX.max = 5
                        self.physics.physicData[3].z.vertical.neutral = -5
                        self.physics.physicData[3].z.vertical.headX.min = -5

                        if not self.costume.costumes[3].isInitialized then
                            models.models.ex_skill_2.Tank.TankBody.BaseLeftSide4:newText("ex_skill_2_tank_text_1"):setText("§02年3組 備品"):setPos(0, 7, 14):setRot(0, 90, 0):setScale(0.55):setAlignment("CENTER")
                            models.models.ex_skill_2.Tank.TankBody.BaseLeftSide4:newText("ex_skill_2_tank_text_2"):setText("§0使用後、元の位置に！"):setPos(0, 2.25, 20):setRot(0, 90, 0):setScale(0.15):setAlignment("CENTER")
                            models.models.ex_skill_2.Tank.TankBody.CoolerBox:newItem("ex_skill_2_tank_item_1"):setItem(self.parent.compatibilityUtils:checkItem("minecraft:melon")):setPos(7, 5.6, 0):setScale(0.7)
                            models.models.ex_skill_2.Tank.TankBody.CoolerBox:newItem("ex_skill_2_tank_item_2"):setItem(self.parent.compatibilityUtils:checkItem("minecraft:potion")):setPos(-11, 5.6, -2):setRot(0, -150, 0):setScale(0.7)
                            models.models.ex_skill_2.Tank.TankBody.CoolerBox:newItem("ex_skill_2_tank_item_3"):setItem(self.parent.compatibilityUtils:checkItem("minecraft:potion")):setPos(-7, 5.6, 0):setRot(0, 180, 0):setScale(0.7)
                            models.models.ex_skill_2.Tank.TankBody.CoolerBox:newItem("ex_skill_2_tank_item_4"):setItem(self.parent.compatibilityUtils:checkItem("minecraft:potion")):setPos(-4, 5.6, -2):setRot(0, 140, 0):setScale(0.7)
                            models.models.ex_skill_2.Tank.TankBody.CoolerBox:newItem("ex_skill_2_tank_item_5"):setItem(self.parent.compatibilityUtils:checkItem("minecraft:apple")):setPos(-7, 5.6, 3):setRot(0, 180, 0):setScale(0.7)
                            models.models.ex_skill_2.Tank.TankBody.Turret.TurretTank:newItem("ex_skill_2_tank_item_6"):setItem("minecraft:iron_shovel"):setPos(0, 0, 0.5):setRot(0, 0, 45)
                            self.costume.costumes[3].isInitialized = true
                        end
                    end
                end;

                onReset = function (self)
                    self.parent.costume.setCostumeTextureOffset(0)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.CMaskedH, models.models.main.Avatar.Head.CSwimsuitH}) do
                        modelPart:setVisible(false)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.HairTails.RightHairTail.RightHairTailZPivot.RightHairTailAccessories.RightHairTailAccessory2, models.models.main.Avatar.Head.HairTails.RightHairTail.RightHairTailZPivot.RightHairTailAccessories.RightHairTailAccessory3, models.models.main.Avatar.Head.HairTails.LeftHairTail.LeftHairTailZPivot.LeftHairTailAccessories.LeftHairTailAccessory2, models.models.main.Avatar.Head.HairTails.LeftHairTail.LeftHairTailZPivot.LeftHairTailAccessories.LeftHairTailAccessory3, models.models.main.Avatar.UpperBody.Body.Backpack, models.models.main.Avatar.UpperBody.Body.Skirt, models.models.main.Avatar.UpperBody.Arms.RightArm.RightTrinityLogo, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftTrinityLogo}) do
                        modelPart:setVisible(true)
                    end
                        self.physics.physicData[2].z.vertical.neutral = 20
                        self.physics.physicData[2].z.vertical.headX.max = 20
                        self.physics.physicData[3].z.vertical.neutral = -20
                        self.physics.physicData[3].z.vertical.headX.min = -20
                end;

                onArmorChange = function (self, parts, isVisible)
                    if parts == "LEGGINGS" then
                        models.models.main.Avatar.UpperBody.Body.Skirt:setVisible(self.parent.costume.currentCostume <= 2 and not isVisible)
                    end
                end;
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
            callbacks = {
                onPhase1 = function (_, dummyAvatar, costume)
                    if costume == "DEFAULT" or costume == "MASKED" then
                        dummyAvatar.Head.HairTails.RightHairTail:setRot(30, 0, 0)
                        dummyAvatar.Head.HairTails.RightHairTail.RightHairTailZPivot:setRot(0, 0, 10)
                        dummyAvatar.Head.HairTails.LeftHairTail:setRot(30, 0, 0)
                        dummyAvatar.Head.HairTails.LeftHairTail.LeftHairTailZPivot:setRot(0, 0, -10)
                        dummyAvatar.UpperBody.Body.Skirt:setRot(55, 0, 0)
                    end
                end;

                onPhase2 = function (_, dummyAvatar, costume)
                    if costume == "DEFAULT" or costume == "MASKED" then
                        dummyAvatar.Head.HairTails.RightHairTail:setRot(-20, 0, 0)
                        dummyAvatar.Head.HairTails.RightHairTail.RightHairTailZPivot:setRot(0, 0, 10)
                        dummyAvatar.Head.HairTails.LeftHairTail:setRot(-30, 0, 0)
                        dummyAvatar.Head.HairTails.LeftHairTail.LeftHairTailZPivot:setRot(0, 0, -20)
                        dummyAvatar.UpperBody.Body.Backpack.OpenableBackpackBase.PeroroTip1:setRot(120, 0, 0)
                        dummyAvatar.UpperBody.Body.Backpack.OpenableBackpackBase.PeroroTip2:setRot(120, 0, 0)
                        dummyAvatar.UpperBody.Body.Backpack.OpenableBackpackBase.PeroroRightWing:setRot(0, 40, 0)
                        dummyAvatar.UpperBody.Body.Backpack.OpenableBackpackBase.PeroroLeftWing:setRot(0, -60, 0)
                        dummyAvatar.UpperBody.Body.Backpack.PeroroRightFoot:setRot(-10, 0, -10)
                        dummyAvatar.UpperBody.Body.Backpack.PeroroLeftFoot:setRot(-10, 0, -10)
                        dummyAvatar.UpperBody.Body.Backpack.BackpackBackPocket.BackpackKeyRing:setRot(-30, 0, 0)
                        dummyAvatar.UpperBody.Body.Skirt:setRot(12, 0, 0)
                    end
                end;
            }
        }

        instance.actionWheel = {
            isVehicleOptionEnabled = false;
        }

        instance.physics = {
            physicData = {
                {
                    models = {models.models.main.Avatar.Head.HairTails.RightHairTail, models.models.main.Avatar.Head.HairTails.LeftHairTail};

                    x = {
                        vertical = {
                            min = -180;
                            neutral = -5;
                            max = 90;
                            headRotMultiplayer = -1;
                            sneakOffset = -30;

                            headX = {
                                multiplayer = -80;
                                min = -90;
                                max = 90;
                            };

                            headRot = {
                                multiplayer = 0.05;
                                min = -90;
                                max = 0;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -180;
                                max = 0;
                            };
                        };

                        horizontal = {
                            min = -45;
                            neutral = 45;
                            max = 45;

                            bodyX = {
                                multiplayer = -80;
                                min = -45;
                                max = 45;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.HairTails.RightHairTail.RightHairTailZPivot};

                    z = {
                        vertical = {
                            min = -32.5;
                            neutral = 20;
                            max = 90;

                            headX = {
                                multiplayer = -20;
                                min = 0;
                                max = 20;
                            };

                            headZ = {
                                multiplayer = -80;
                                min = -32.5;
                                max = 90;
                            };
                        };

                        horizontal = {
                            min = -32.5;
                            neutral = 10;
                            max = 90;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.HairTails.LeftHairTail.LeftHairTailZPivot};

                    z = {
                        vertical = {
                            min = -90;
                            neutral = -20;
                            max = 32.5;

                            headX = {
                                multiplayer = 20;
                                min = -20;
                                max = 0;
                            };

                            headZ = {
                                multiplayer = -80;
                                min = -90;
                                max = 32.5;
                            };
                        };

                        horizontal = {
                            min = -90;
                            neutral = -20;
                            max = 32.5;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Backpack.OpenableBackpackBase.PeroroTip1, models.models.main.Avatar.UpperBody.Body.Backpack.OpenableBackpackBase.PeroroTip2};

                    x = {
                        vertical = {
                            min = -85;
                            neutral = 0;
                            max = 157.5;

                            bodyX = {
                                multiplayer = 40;
                                min = -85;
                                max = 85;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = 0;
                                max = 157.5;
                            };

                            bodyRot = {
                                multiplayer = -0.05;
                                min = 0;
                                max = 90;
                            };

                        };

                        horizontal = {
                            min = 0;
                            neutral = 0;
                            max = 157.5;

                            bodyX = {
                                multiplayer = 80;
                                min = 0;
                                max = 157.5;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Backpack.OpenableBackpackBase.PeroroFace.PeroroTongue};

                    x = {
                        vertical = {
                            min = 12.5;
                            neutral = 30;
                            max = 30;

                            bodyX = {
                                multiplayer = -40;
                                min = 12.5;
                                max = 30;
                            };

                            bodyY = {
                                multiplayer = 40;
                                min = 12.5;
                                max = 30;
                            };

                            bodyRot = {
                                multiplayer = 0.025;
                                min = 12.5;
                                max = 30;
                            };
                        };

                        horizontal = {
                            min = 12.5;
                            neutral = 30;
                            max = 30;
                        };
                    };

                    y = {
                        vertical = {
                            min = -30;
                            neutral = -30;
                            max = -30;
                        };

                        horizontal = {
                            min = -30;
                            neutral = -30;
                            max = -30;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Backpack.OpenableBackpackBase.PeroroRightWing};

                    y = {
                        vertical = {
                            min = -15;
                            neutral = 0;
                            max = 52.5;

                            bodyX = {
                                multiplayer = 80;
                                min = -15;
                                max = 52.5;
                            };

                            bodyRot = {
                                multiplayer = -0.05;
                                min = 0;
                                max = 52.5;
                            };
                        };

                        horizontal = {
                            min = -15;
                            neutral = 0;
                            max = 52.5;

                            bodyY = {
                                multiplayer = -80;
                                min = -15;
                                max = 52.5;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Backpack.OpenableBackpackBase.PeroroLeftWing};

                    y = {
                        vertical = {
                            min = -52.5;
                            neutral = 0;
                            max = 15;

                            bodyX = {
                                multiplayer = -80;
                                min = -52.5;
                                max = 15;
                            };

                            bodyRot = {
                                multiplayer = 0.05;
                                min = -52.5;
                                max = 0;
                            };
                        };

                        horizontal = {
                            min = -52.5;
                            neutral = 0;
                            max = 15;

                            bodyY = {
                                multiplayer = 80;
                                min = -52.5;
                                max = 15;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Backpack.PeroroRightFoot, models.models.main.Avatar.UpperBody.Body.Backpack.PeroroLeftFoot};

                    x = {
                        vertical = {
                            min = -90;
                            neutral = 0;
                            max = 47.5;

                            bodyX = {
                                multiplayer = -80;
                                min = -90;
                                max = 47.5;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -90;
                                max = 0;
                            };

                            bodyRot = {
                                multiplayer = 0.05;
                                min = -90;
                                max = 0;
                            };

                        };

                        horizontal = {
                            min = -90;
                            neutral = 0;
                            max = 47.5;

                            bodyY = {
                                multiplayer = 80;
                                min = -90;
                                max = 47.5;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Backpack.BackpackBackPocket.BackpackKeyRing};

                    x = {
                        vertical = {
                            min = -147.5;
                            neutral = -25;
                            max = -25;

                            bodyX = {
                                multiplayer = -80;
                                min = -90;
                                max = -25;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -147.5;
                                max = -25;
                            };

                            bodyRot = {
                                multiplayer = 0.05;
                                min = -90;
                                max = -25;
                            };

                        };

                        horizontal = {
                            min = -147.5;
                            neutral = -25;
                            max = -25;

                            bodyY = {
                                multiplayer = 80;
                                min = -90;
                                max = -25;
                            };
                        };
                    };

                    z = {
                        vertical = {
                            min = -90;
                            neutral = 0;
                            max = 90;

                            bodyZ = {
                                multiplayer = -160;
                                min = -90;
                                max = 90;
                            };
                        };

                        horizontal = {
                            min = -90;
                            neutral = 0;
                            max = 90;
                        };
                    }
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

    end;
}