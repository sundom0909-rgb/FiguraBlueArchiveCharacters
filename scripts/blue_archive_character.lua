---@alias BlueArchiveCharacter.RightEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "CLOSED2" # 閉じた目2
---| "CENTER" # 少し反対側を見る目
---| "UNEQUAL" # 不等号目

---@alias BlueArchiveCharacter.LeftEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "CLOSED2" # 閉じた目2
---| "CENTER" # 少し反対側を見る目
---| "UNEQUAL" # 不等号目

---@alias BlueArchiveCharacter.MouthTextures
---| "NORMAL" # 通常
---| "SMALL" # 小さく開いた口
---| "SMILE" # にっこり + 八重歯
---| "YUMMY" # 舌を出した口
---| "BIG" # 大きく開いた口
---| "OPENED" # 開いた口
---| "CIRCLE" # 丸い口
---| "ANXIOUS" # への口

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
                en_us = "Nozomi";
                ja_jp = "ノゾミ";
            };

            lastName = {
                en_us = "Tachibana";
                ja_jp = "橘";
            };

            clubName = {
                en_us = "CCC";
                ja_jp = "CCC";
            };

            birth = {
                month = 6;
                day = 14;
            };
        }

        instance.faceParts = {
            rightEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(2, 0); --必須
                TIRED = vectors.vec2(3, 0); --必須
                CLOSED = vectors.vec2(4, 0); --必須
                CLOSED2 = vectors.vec2(5, 0);
                CENTER = vectors.vec2(6, 0);
                UNEQUAL = vectors.vec2(8, 0);
            };

            leftEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(1, 0); --必須
                TIRED = vectors.vec2(2, 0); --必須
                CLOSED = vectors.vec2(3, 0); --必須
                CLOSED2 = vectors.vec2(4, 0);
                CENTER = vectors.vec2(6, 0);
                UNEQUAL = vectors.vec2(7, 0);
            };

            mouth = {
                SMALL = vectors.vec2(0, 0);
                SMILE = vectors.vec2(1, 0);
                YUMMY = vectors.vec2(2, 0);
                BIG = vectors.vec2(3, 0);
                OPENED = vectors.vec2(0, 1);
                CIRCLE = vectors.vec2(1, 1);
                ANXIOUS = vectors.vec2(2, 1);
            };
        }

        instance.arms = {
            callbacks = {
                onArmStateChanged = function (self, right, left)
                    local armState = {right = right, left = left}
                    if self.parent.syupogakiDance ~= nil and self.parent.syupogakiDance.danceState ~= "NOT_STANDBY" then
                        armState.right = 0
                        armState.left = 0
                    else
                        armState.right = armState.right == 2 and 0 or armState.right
                        armState.left = armState.left == 2 and 0 or armState.left
                    end
                    return armState
                end;
            };
        }

        instance.skirt = {

        }

        instance.gun = {
            scale = 0.5;

            gunPosition = {
                hold = {
                    firstPersonPos = {
                        right = vectors.vec3(-1, -3.5, -2);
                        left = vectors.vec3(1, -3.5, -2);
                    };

                    thirdPersonPos = {
                        right = vectors.vec3(0, -3.5, -3);
                        left = vectors.vec3(0, -3.5, -3);
                    };
                };

                put = {
                    type = "BODY";

                    pos = {
                        right = vectors.vec3(4.5, -9, 0);
                        left = vectors.vec3(4.5, -9, 0);
                    };

                    rot = {
                        right = vectors.vec3(-90, 0, 0);
                        left = vectors.vec3(-90, 0, 0);
                    };
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
            exSkills = {
                {
                    name = {
                        en_us = "Booster on!";
                        ja_jp = "ブースターオン！";
                    };

                    formationType = "STRIKER";

                    models = {models.models.main.Avatar.LowerBody.Train, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Key, models.models.main.Avatar.Head.HeadShineEffects};

                    animations = {"main", "ex_skill_1"};

                    camera = {
                        start = {
                            rot = vectors.vec3(0, 195, 0);
                            pos = vectors.vec3(-15, 63, -101);
                        };

                        fin = {
                            rot = vectors.vec3(0, 210, 15);
                            pos = vectors.vec3(-12.1, 42.75, -4079.85);
                        };
                    };

                    callbacks = {
                        onPreAnimation = function (self)
                            if not self.exSkill.exSkills[1].didInit then
                                for _, modelPart in ipairs({models.models.main.Avatar.LowerBody.Train.TrainCar1.TrainCar1RightFirework.TrainCar1RightFireworkItem, models.models.main.Avatar.LowerBody.Train.TrainCar1.TrainCar1LeftFirework.TrainCar1LeftFireworkItem}) do
                                    modelPart:setPrimaryTexture("RESOURCE", "minecraft:textures/item/firework_rocket.png")
                                end
                                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Key:newItem("ex_skill_1_key_item"):setPos(0, -1, 0):setScale(0.25, 0.25, 0.25):setVisible(false)
                                self.exSkill.exSkills[1].didInit = true
                            end
                            if math.random() >= 0.95 and client:getVersion() >= "1.21" then
                                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Key.KeyModel:setVisible(false)
                                local task = models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Key:getTask("ex_skill_1_key_item")
                                ---@cast task ItemTask
                                task:setItem(math.random() >= 0.8 and self.parent.compatibilityUtils:checkItem("minecraft:ominous_trial_key") or self.parent.compatibilityUtils:checkItem("minecraft:trial_key"))
                                task:setVisible(true)
                            else
                                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Key.KeyModel:setVisible(true)
                                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Key:getTask("ex_skill_1_key_item"):setVisible(false)
                            end
                            self.parent.trainManager:stopTrainAnimation()
                            self.parent.trainManager:spawnExSkillRail()
                            models.models.main.Avatar.LowerBody.Train:setVisible(true)
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "SMALL", 20, true)
                        end;

                        onAnimationTick = function (self, tick)
                            if tick == 15 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.zombie.attack_wooden_door"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.Train), 0.25, 1.5)
                            elseif tick == 20 then
                                self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "SMILE", 2, true)
                            elseif tick == 22 then
                                self.parent.faceParts:setEmotion("CENTER", "NORMAL", "SMILE", 25, true)
                            elseif tick == 23 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.Train), 1, 1.5)
                            elseif tick == 47 then
                                self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "SMILE", 2, true)
                            elseif tick == 49 then
                                self.parent.faceParts:setEmotion("NORMAL", "CENTER", "YUMMY", 21, true)
                            elseif tick == 53 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.Train), 1, 3)
                            elseif tick == 60 then
                                self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "YUMMY", 32, true)
                            elseif tick == 65 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.vault.insert_item"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.Train.TrainCar1.TrainCar1ChimneyParticleAnchor), 1, 1)
                            elseif tick == 76 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.iron_trapdoor.open"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.Train.TrainCar1.TrainCar1RightHatch), 1, 1)
                            elseif tick == 82 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.piston.extend"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.Train.TrainCar1.TrainCar1RightFirework), 1, 1.5)
                            elseif tick == 92 then
                                self.parent.faceParts:setEmotion("UNEQUAL", "UNEQUAL", "SMALL", 54, true)
                            elseif tick == 104 then
                                local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.Train.TrainCar1.TrainCar1RightFirework)
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.flintandsteel.use"), anchorPos, 1, 1)
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.fire.extinguish"), anchorPos, 1, 0.5)
                            elseif tick == 114 and host:isHost() then
                                models.models.main.Avatar:setColor(0, 0, 0)
                                local windowSize = client:getWindowSize()
                                models.models.ex_skill_1.CameraBackground.Background:setScale(vectors.vec3(windowSize.x / windowSize.y, 1, 1):scale(60))
                                events.RENDER:register(function (delta, context)
                                    models.models.ex_skill_1.CameraBackground:setVisible(context == "RENDER")
                                    local backgroundPos = vectors.rotateAroundAxis(player:getBodyYaw(delta) + 180, renderer:getCameraOffsetPivot():copy():add(0, 1.62, 0):add(client:getCameraDir():copy():scale(2.6)), 0, 1, 0):scale(16 / 0.9375)
                                    models.models.ex_skill_1.CameraBackground:setOffsetPivot(backgroundPos)
                                    models.models.ex_skill_1.CameraBackground.Background:setPos(backgroundPos)
                                end, "ex_skill_1_background_render")
                            elseif tick == 117 and host:isHost() then
                                events.RENDER:remove("ex_skill_1_background_render")
                                models.models.main.Avatar:setColor(1, 1, 1)
                                models.models.ex_skill_1.CameraBackground:setVisible(false)
                            elseif tick == 118 then
                                local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.Train.TrainCar1.TrainCar1RightFirework)
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.firework_rocket.large_blast"), anchorPos, 1, 1)
                                self.exSkill.exSkills[1].engineFireworkSound = sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.firework_rocket.launch"), anchorPos, 0.5, 0.5)
                            elseif tick == 146 then
                                self.parent.faceParts:setEmotion("NORMAL", "CLOSED", "BIG", 77, true)
                                self.exSkill.exSkills[1].whistleSound = sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.goat_horn.sound.1"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.Train), 1, 0.5)
                            end

                            local bodyYaw = player:getBodyYaw()
                            particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:campfire_cosy_smoke"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.Train.TrainCar1.TrainCar1ChimneyParticleAnchor):add(vectors.rotateAroundAxis(bodyYaw * -1, 0, 0, tick < 146 and 1 or 0, 0, 1, 0))):setScale(5):setVelocity(0, 0.2, 0)
                            if tick % (tick < 114 and 4 or (tick < 140 and 3 or 2)) == 0 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound(self.exSkill.exSkills[1].trainSoundCounter % 2 == 0 and "minecraft:block.piston.extend" or "minecraft:block.piston.contract"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.Train), 0.5, (tick < 114 and 0.25 or (tick < 140 and 0.3 or 0.35)) * (math.random() * 0.1 + 0.9))
                                self.exSkill.exSkills[1].trainSoundCounter = self.exSkill.exSkills[1].trainSoundCounter + 1
                            end
                            if tick >= 15 then
                                for i = 1, 3 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.Train["TrainCar"..i]["TrainCar"..i.."Platform"]["TrainCar"..i.."PlatformRightParticleAnchor"])):setScale(2):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * -0.5, math.random() * 1, 1, 0, 1, 0)):setColor(1, 0.953, 0.408)
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.Train["TrainCar"..i]["TrainCar"..i.."Platform"]["TrainCar"..i.."PlatformLeftParticleAnchor"])):setScale(2):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 0.5, math.random() * 1, 1, 0, 1, 0)):setColor(1, 0.953, 0.408)
                                end
                                local dustColors = {vectors.vec3(1, 0.878, 0.592), vectors.vec3(0.824, 0.718, 0.49)}
                                local randomNum = math.random() * 0.5 - 0.25
                                randomNum = randomNum >= 0 and randomNum + 0.25 or randomNum - 0.25
                                randomNum = (tick >= 126 and tick < 146) and randomNum / 2 or randomNum
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:poof"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.Train.TrainCar1.TrainCar1DustParticleAnchor)):setScale((tick >= 126 and tick < 146) and 20 or ((tick < 73 or tick >= 126) and 10 or 2)):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, randomNum, math.random() * 0.5, tick < 118 and 1 or (tick < 108 and 1.5 or 2), 0, 1, 0)):setColor(dustColors[1]:copy():add(dustColors[2]:copy():sub(dustColors[1]):scale(math.random())))
                                if tick < 58 then
                                    sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.grindstone.use"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.Train), 0.5 * math.min(tick * -0.05 + 2.9, 1), 3)
                                end
                            end
                            if tick >= 104 and tick < 118 then
                                for _, modelPart in ipairs({models.models.main.Avatar.LowerBody.Train.TrainCar1.TrainCar1RightFirework.TrainCar1RightFireworkParticleAnchor, models.models.main.Avatar.LowerBody.Train.TrainCar1.TrainCar1LeftFirework.TrainCar1LeftFireworkParticleAnchor}) do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:large_smoke"), self.parent.modelUtils.getModelWorldPos(modelPart):add(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 0.5 - 0.25, math.random() * 0.5 - 0.25, 1, 0, 1, 0))):setScale(1.5):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, 0, 0, 0.8, 0, 1, 0))
                                end
                            elseif tick >= 104 then
                                for _, modelPart in ipairs({models.models.main.Avatar.LowerBody.Train.TrainCar1.TrainCar1RightFirework.TrainCar1RightFireworkParticleAnchor, models.models.main.Avatar.LowerBody.Train.TrainCar1.TrainCar1LeftFirework.TrainCar1LeftFireworkParticleAnchor}) do
                                    local anchorPos = self.parent.modelUtils.getModelWorldPos(modelPart)
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:large_smoke"), self.parent.modelUtils.getModelWorldPos(modelPart):add(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 0.5 - 0.25, math.random() * 0.5 - 0.25, 2, 0, 1, 0))):setScale(2):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, 0, 0, 0.8, 0, 1, 0))
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:soul_fire_flame"), anchorPos:copy():add(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 0.5 - 0.25, math.random() * 0.5 - 0.25, 2, 0, 1, 0))):setScale(2):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, 0, 0, 0.8, 0, 1, 0))
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:firework"), anchorPos:copy():add(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 0.5 - 0.25, math.random() * 0.5 - 0.25, 2, 0, 1, 0))):setScale(1.5):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, 0, 0, 0.8, 0, 1, 0))
                                end
                            end
                            if tick >= 118 then
                                local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.Train.TrainCar1.TrainCar1RightFirework)
                                self.exSkill.exSkills[1].engineFireworkSound:setPos(anchorPos)
                                if (tick - 118) % 4 == 0 then
                                    sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.firecharge.use"), anchorPos, 0.25, 0.5)
                                end
                                if tick >= 146 then
                                    self.exSkill.exSkills[1].whistleSound:setPos(anchorPos)
                                end
                            end
                        end;

                        onPostAnimation = function (self, forcedStop)
                            self.parent.trainManager:stopExSkillRail()
                            self.exSkill.exSkills[1].trainSoundCounter = 0
                            if forcedStop then
                                if host:isHost() then
                                    events.RENDER:remove("ex_skill_1_background_render")
                                    models.models.main.Avatar:setColor(1, 1, 1)
                                    models.models.ex_skill_1.CameraBackground:setVisible(false)
                                end
                                self.parent.trainManager:removeAll()
                            else
                                self.parent.trainManager:playTrainAnimation()
                            end
                        end;
                    };

                    ---このExスキルの初期化処理が行われたかどうか
                    ---@type boolean
                    didInit = false;

                    ---汽車のシュポシュポ音の回数をカウントする変数
                    ---@type integer
                    trainSoundCounter = 0;

                    ---エンジンのロケット花火の音のインスタンス
                    ---@type Sound|nil
                    engineFireworkSound = nil;

                    ---汽笛の音のインスタンス
                    ---@type Sound|nil
                    whistleSound = nil;
                };
            };

            callbacks = {
                additionalCheckFunc = function (self)
                    return self.parent.syupogakiDance.danceState == "NOT_STANDBY"
                end;
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
            };

            callbacks = {
                onArmorChange = function (self, parts, isVisible)
                    if parts == "HELMET" then
                        models.models.main.Avatar.Head.Hat:setVisible(not isVisible)
                    elseif parts == "CHEST_PLATE" then
                        models.models.main.Avatar.UpperBody.Body.ShoulderBag:setVisible(not isVisible)
                    end
                    models.models.main.Avatar.UpperBody.Body.BeltAccessories:setVisible(not self.parent.armor.isArmorVisible.chestplate and not self.parent.armor.isArmorVisible.leggings)
                end;
            };

        }

        instance.bubble = {
            callbacks = {
                additionalCheckFunc = function (self)
                    return self.parent.syupogakiDance.danceState == "NOT_STANDBY"
                end;

                onPlay = function (self, type, duration)
                    if type == "GOOD" then
                        self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "SMILE", duration, true)
                    elseif type == "HEART" then
                        self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "OPENED", duration, true)
                    elseif type == "NOTE" then
                        self.parent.faceParts:setEmotion("NORMAL", "CLOSED", "OPENED", duration, true)
                    elseif type == "QUESTION" then
                        self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "CIRCLE", duration, true)
                    elseif type == "SWEAT" then
                        self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "ANXIOUS", duration, true)
                    end
                end;

                onStop = function (self, _, forcedStop)
                    if not forcedStop then
                        self.parent.faceParts:resetEmotion()
                    end
                end;
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
                    dummyAvatar.Head.HairTails.RightHairTail:setRot(30, 0, 0)
                    dummyAvatar.Head.HairTails.LeftHairTail:setRot(30, 0, 0)
                    dummyAvatar.UpperBody.Body.TailXPivot:setRot(10, 0, 0)
                end;

                onPhase2 = function (_, dummyAvatar)
                    dummyAvatar.Head.HairTails.RightHairTail:setRot(-20, 0, -2.5)
                    dummyAvatar.Head.HairTails.LeftHairTail:setRot(-20, 0, -2.5)
                    dummyAvatar.UpperBody.Body.TailXPivot:setRot(60, 0, -15)
                    dummyAvatar.UpperBody.Body.TailXPivot.TailYPivot.Tail.Tail2:setRot(0, 0, 0)
                end;
            };
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
                            min = -180;
                            neutral = 0;
                            max = 90;
                            headRotMultiplayer = -1;

                            headX = {
                                multiplayer = -80;
                                min = -90;
                                max = 90;
                            };

                            headRot = {
                                multiplayer = 0.05;
                                min = -90;
                                max = 90;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -180;
                                max = 0;
                            };
                        };

                        horizontal = {
                            min = -180;
                            neutral = -45;
                            max = 95;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.HairTails.LeftHairTail.LeftHairTailZPivot};

                    z = {
                        vertical = {
                            min = -70;
                            neutral = 0;
                            max = 90;

                            headZ = {
                                multiplayer = -80;
                                min = -70;
                                max = 90;
                            };
                        };

                        horizontal = {
                            min = -70;
                            neutral = 0;
                            max = 90;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.HairTails.RightHairTail};

                    x = {
                        vertical = {
                            min = -180;
                            neutral = 0;
                            max = 90;
                            headRotMultiplayer = -1;

                            headX = {
                                multiplayer = -80;
                                min = -90;
                                max = 90;
                            };

                            headRot = {
                                multiplayer = 0.05;
                                min = -90;
                                max = 90;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -180;
                                max = 0;
                            };
                        };

                        horizontal = {
                            min = -180;
                            neutral = -45;
                            max = 95;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.HairTails.RightHairTail.RightHairTailZPivot};

                    z = {
                        vertical = {
                            min = -90;
                            neutral = 0;
                            max = 70;

                            headZ = {
                                multiplayer = -80;
                                min = -90;
                                max = 70;
                            };
                        };

                        horizontal = {
                            min = -90;
                            neutral = 0;
                            max = 70;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.BeltAccessories};

                    x = {
                        vertical = {
                            min = 0;
                            neutral = 0;
                            max = 155;
                            sneakOffset = 30;

                            bodyX = {
                                multiplayer = -160;
                                min = 0;
                                max = 90;
                            };

                            bodyY = {
                                multiplayer = -160;
                                min = 0;
                                max = 155;
                            };
                        };

                        horizontal = {
                            min = 0;
                            neutral = 90;
                            max = 155;

                            bodyX = {
                                multiplayer = 0;
                                min = -40;
                                max = 155;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.TailXPivot};

                    x = {
                        vertical = {
                            min = -40;
                            neutral = 0;
                            max = 40;
                            sneakOffset = 15;

                            bodyY = {
                                multiplayer = 40;
                                min = -40;
                                max = 40;
                            };
                        };

                        horizontal = {
                            min = -40;
                            neutral = 0;
                            max = 40;

                            bodyX = {
                                multiplayer = 40;
                                min = -40;
                                max = 40;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.TailXPivot.TailYPivot};

                    y = {
                        vertical = {
                            min = -40;
                            neutral = 0;
                            max = 40;

                            bodyZ = {
                                multiplayer = -80;
                                min = -40;
                                max = 40;
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

    end;
}