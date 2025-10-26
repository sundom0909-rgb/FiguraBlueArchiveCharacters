---@alias BlueArchiveCharacter.RightEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "ANGRY" # 怒った目
---| "UNEQUAL" # 不等号目
---| "SHOCKED" # 丸い目
---| "CLOSED2" # 閉じた目2

---@alias BlueArchiveCharacter.LeftEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "ANGRY" # 怒った目
---| "UNEQUAL" # 不等号目
---| "SHOCKED" # 丸い目
---| "CLOSED2" # 閉じた目2

---@alias BlueArchiveCharacter.MouthTextures
---| "NORMAL" # 通常
---| "OPENED" # 開いた口
---| "NARROW" # 細長い口
---| "FRUST" # ぐじゅぐじゅ口

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
                en_us = "Reisa";
                ja_jp = "レイサ";
            };

            lastName = {
                en_us = "Uzawa";
                ja_jp = "宇沢";
            };

            clubName = {
                en_us = "Trinity Vigilante Corps";
                ja_jp = "トリニティ自警団";
            };

            birth = {
                month = 5;
                day = 31;
            };
        }

        instance.faceParts = {
            rightEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(2, 0); --必須
                TIRED = vectors.vec2(3, 0); --必須
                CLOSED = vectors.vec2(4, 0); --必須
                ANGRY = vectors.vec2(5, 0);
                UNEQUAL = vectors.vec2(7, 0);
                SHOCKED = vectors.vec2(8, 0);
                CLOSED2 = vectors.vec2(9, 0);
            };

            leftEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(1, 0); --必須
                TIRED = vectors.vec2(2, 0); --必須
                CLOSED = vectors.vec2(3, 0); --必須
                ANGRY = vectors.vec2(5, 0);
                UNEQUAL = vectors.vec2(6, 0);
                SHOCKED = vectors.vec2(7, 0);
                CLOSED2 = vectors.vec2(8, 0);
            };

            mouth = {
                OPENED = vectors.vec2(0, 0);
                NARROW = vectors.vec2(1, 0);
                FRUST = vectors.vec2(2, 0);
            };

            callbacks = {
                onPlay = function (_, right, left)
                    if right ~= "CLOSED2" then
                        models.models.main.Avatar.Head.FaceParts.Eyes.EyeLeft:setRot()
                    end
                    if left ~= "CLOSED2" then
                        models.models.main.Avatar.Head.FaceParts.Eyes.EyeRight:setRot()
                    end
                end;
            };
        }

        instance.arms = {

        }

        instance.skirt = {
            skirtModels = {models.models.main.Avatar.UpperBody.Body.Skirt, models.models.main.Avatar.UpperBody.Body.CMagicalB.Skirt};
        }

        instance.gun = {
            scale = 1;

            gunPosition = {
                hold = {
                    thirdPersonPos = {
                        right = vectors.vec3(-1.5, 0, -4.5);
                        left = vectors.vec3(1.5, 0, -4.5);
                    };
                };

                put = {
                    type = "BODY";

                    pos = {
                        right = vectors.vec3(0, -2, 3);
                        left = vectors.vec3(0, -2, 3);
                    };

                    rot = {
                        right = vectors.vec3(0, 90, -10);
                        left = vectors.vec3(0, -90, 10);
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
                model = models.models.ex_skill_1.Letter;

                boundingBox = {
                    size = vectors.vec3(6, 1, 6)
                };

                placementMode = "COPY";

                callbacks = {
                    onInit = function (self, placementObject)
                        placementObject.textUuid = client.intUUIDToString(client.generateUUID())
                        ---@diagnostic disable-next-line: discard-returns, invisible
                        placementObject.object:newPart("TextArea")
                        ---@diagnostic disable-next-line: invisible
                        placementObject.object.TextArea:setPos(0, 7, 0)
                        ---@diagnostic disable-next-line: discard-returns, invisible
                        placementObject.object.TextArea:newPart("TextAreaInner", "Camera")
                        ---@diagnostic disable-next-line: invisible
                        placementObject.textTask = placementObject.object.TextArea.TextAreaInner:newText(placementObject.textUuid)

                        placementObject.textTask:setScale(0.5, 0.5, 0.5)
                        placementObject.textTask:setAlignment("CENTER")
                        placementObject.textTask:setBackground(true)
                        local wordIndex = math.random(1, 6)
                        local activeLang = client:getActiveLang()
                        if self.costume.costumes[1].challengeWords[activeLang] ~= nil then
                            placementObject.textTask:setText(self.costume.costumes[1].challengeWords[activeLang][wordIndex]..self.costume.costumes[1].challengeWords[activeLang][7])
                        else
                            placementObject.textTask:setText(self.costume.costumes[1].challengeWords.en_us[wordIndex]..self.costume.costumes[1].challengeWords.en_us[7])
                        end
                    end;

                    onDeinit = function (_, placementObject)
                        ---@diagnostic disable-next-line: invisible
                        placementObject.object.TextArea:removeTask()
                    end;

                    onTick = function (self, placementObject)
                        placementObject.textTask:setVisible(placementObject.currentPos:copy():sub(client:getViewer():getPos()):length() <= 2)
                    end;
                };
            };
        }

        instance.exSkill = {
            exSkills = {
                {
                    name = {
                        en_us = "Come challenge me!";
                        ja_jp = "挑戦状を受け取ってください！";
                    };

                    formationType = "STRIKER";

                    models = {models.models.main.Avatar.Background, models.models.ex_skill_1.MuzzleEffect, models.models.ex_skill_1.Illagers, models.models.ex_skill_1.Letter};

                    animations = {"main", "gun", "ex_skill_1"};

                    camera = {
                        start = {
                            rot = vectors.vec3(50, 150, 0);
                            pos = vectors.vec3(3, 6, -2.75);
                        };

                        fin = {
                            rot = vectors.vec3(0, 180, 15);
                            pos = vectors.vec3(-4, 31.5, -24);
                        };
                    };

                    callbacks = {
                        onPreAnimation = function (self)
                            if not self.exSkill.exSkills[1].initialized then
                                if host:isHost() then
                                    ---@diagnostic disable-next-line: discard-returns
                                    models:newPart("script_ex_skill_1")
                                    models.script_ex_skill_1:setVisible(false)
                                    models.script_ex_skill_1:addChild(models.models.main.Avatar:copy("exSkill1Outline1"))
                                    models.script_ex_skill_1.exSkill1Outline1:removeChild(models.script_ex_skill_1.exSkill1Outline1.Background)
                                    models.script_ex_skill_1.exSkill1Outline1:setOffsetPivot(0, 16, 0)
                                    models.script_ex_skill_1.exSkill1Outline1:setScale(1.7, 1.5, 1.6)
                                    models.script_ex_skill_1.exSkill1Outline1:setPrimaryTexture("CUSTOM", textures["textures.ex_skill_1_white"])
                                    models.script_ex_skill_1.exSkill1Outline1:setPrimaryRenderType("EMISSIVE_SOLID")
                                    models.script_ex_skill_1:addChild(models.script_ex_skill_1.exSkill1Outline1:copy("exSkill1Outline2"))
                                    models.script_ex_skill_1.exSkill1Outline2:setPos(-2, -2, 2)
                                    models.script_ex_skill_1.exSkill1Outline2:setColor(0.608, 0.741, 1)
                                end

                                for _, part in ipairs({"Head", "Body", "RightArm", "LeftArm", "RightLeg", "LeftLeg"}) do
                                    for i = 1, 2 do
                                        models.models.ex_skill_1.Illagers["Vindicator"..i]["Vindicator"..i..part]:addChild(self.parent.modelUtils:copyModel(models.models.ex_skill_1.Illagers.Pillager1["Pillager1"..part]))
                                    end
                                end
                                models.models.ex_skill_1.Illagers.Pillager1:setPrimaryTexture("RESOURCE", "minecraft:textures/entity/illager/pillager.png")
                                models.models.ex_skill_1.Letter:setPrimaryTexture("PRIMARY")
                                for i = 1, 2 do
                                        models.models.ex_skill_1.Illagers["Vindicator"..i]:setPrimaryTexture("RESOURCE", "minecraft:textures/entity/illager/vindicator.png")
                                    end
                                for i, modelPart in ipairs({models.models.ex_skill_1.Illagers.Pillager1.Pillager1Question.Pillager1Question2, models.models.ex_skill_1.Illagers.Vindicator1.Vindicator1Question.Vindicator1Question2, models.models.ex_skill_1.Illagers.Vindicator2.Vindicator2Question.Vindicator2Question2}) do
                                    modelPart:newText("ex_skill_1_question_"..i):setText("§e?"):setPos(0, 7, 0):setScale(0.8, 0.8, 1):setAlignment("CENTER")
                                end

                                ---@diagnostic disable-next-line: discard-returns
                                models.models.ex_skill_1:newPart("script_walls")
                                for i = 0, 1 do
                                    for j = 0, 3 do
                                        models.models.ex_skill_1.script_walls:newBlock("ex_skill_1_block_"..(i * 4 + (j + 1))):setBlock(self.parent.compatibilityUtils:checkBlock("minecraft:dark_oak_planks")):setPos(i * 96 - 56, j * 16, 8)
                                    end
                                    for j = 0, 1 do
                                        models.models.ex_skill_1.script_walls:newBlock("ex_skill_1_block_"..(i * 2 + (j + 1) + 8)):setBlock(self.parent.compatibilityUtils:checkBlock("minecraft:dark_oak_planks")):setPos(i * 64 - 40, j * 48, 8)
                                    end
                                end
                                ---@diagnostic disable-next-line: discard-returns
                                models.models.ex_skill_1:newPart("script_walls_breakable")
                                for i = 0, 1 do
                                    for j = 0, 1 do
                                        models.models.ex_skill_1.script_walls_breakable:newBlock("ex_skill_1_block_"..(i * 2 + (j + 1) + 12)):setBlock(self.parent.compatibilityUtils:checkBlock("minecraft:dark_oak_planks")):setPos(i * 64 - 40, j * 16 + 16, 8)
                                    end
                                    for j = 0, 3 do
                                        models.models.ex_skill_1.script_walls_breakable:newBlock("ex_skill_1_block_"..(i * 4 + (j + 1) + 16)):setBlock(self.parent.compatibilityUtils:checkBlock("minecraft:dark_oak_planks")):setPos(i * 32 - 24, j * 16, 8)
                                    end
                                end
                                for i = 0, 1 do
                                    models.models.ex_skill_1.script_walls_breakable:newBlock("ex_skill_1_block_"..((i + 1) + 24)):setBlock(self.parent.compatibilityUtils:checkBlock("minecraft:dark_oak_planks")):setPos(-8, i * 16 + 32, 8)
                                end
                                models.models.ex_skill_1.script_walls_breakable:newBlock("ex_skill_1_block_27"):setBlock(self.parent.compatibilityUtils:checkBlock("minecraft:oak_door", "[facing=south,half=lower]")):setPos(-8, 0.5, 8.01)
                                models.models.ex_skill_1.script_walls_breakable:newBlock("ex_skill_1_block_28"):setBlock(self.parent.compatibilityUtils:checkBlock("minecraft:oak_door", "[facing=south,half=upper]")):setPos(-8, 16.5, 8.01)

                                self.exSkill.exSkills[1].initialized = true
                            else
                                for _, modelPart in ipairs({models.models.ex_skill_1.script_walls, models.models.ex_skill_1.script_walls_breakable}) do
                                    modelPart:setVisible(true)
                                end
                            end
                            self.parent.placementObjectManager:removeAll()
                            renderer:shadowRadius(0)
                            models.models.main.Avatar.Head.EyeShines:setVisible(true)
                            self.parent.faceParts:setEmotion("ANGRY", "ANGRY", "OPENED", 93, true)
                        end;

                        onAnimationTick = function (self, tick)
                            if tick == 0 then
                                models.models.main.Avatar.UpperBody.Body.Gun:setPos()
                                models.models.main.Avatar.UpperBody.Body.Gun:setRot()
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.book.page_turn"), player:getPos(), 1, 1.5)
                            elseif tick >= 26 and tick <= 38 and (tick - 26) % 6 == 0 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), player:getPos(), 0.25, 1)
                            elseif tick == 27 then
                                models.models.ex_skill_1.Letter:moveTo(models.models.ex_skill_1.Illagers.Pillager1.Pillager1RightArm)
                            elseif tick == 43 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.pillager.ambient"), player:getPos(), 0.5, 1)
                            elseif tick == 54 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.vindicator.ambient"), player:getPos(), 0.5, 1)
                            elseif tick == 68 then
                                models.models.ex_skill_1.script_walls_breakable:setVisible(false)
                                local bodyYaw = player:getBodyYaw()
                                local playerPos = player:getPos()
                                local anchorPos = playerPos:copy():add(vectors.rotateAroundAxis(bodyYaw * -1, 0, 2, -1, 0, 1, 0))
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:explosion_emitter"), anchorPos)
                                for _ = 1, 50 do
                                    local offset = vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 5 - 2.5, math.random() * 4 - 2, math.random() - 0.5, 0, 1, 0)
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:block", self.parent.compatibilityUtils:checkBlock("minecraft:dark_oak_planks")), anchorPos:copy():add(offset))
                                end
                                for _, pos in ipairs({vectors.vec3(-5, 3, 0), vectors.vec3(4, 0, 0), vectors.vec3(8, 8, 0)}) do
                                    self.parent.exSkillSpriteManager:spawn(models.models.ex_skill_1.ExSkill1ParticleAnchor1, 1, vectors.vec3(0.294, 1, 1), pos, vectors.vec3(0, 0, 0), math.random() * -30 - 15, 3, models.models.ex_skill_1.StarScale, 33, true, 1)
                                end
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.generic.explode"), anchorPos, 0.5, 1)
                                for _, soundName in ipairs({"minecraft:entity.pillager.hurt", "minecraft:entity.vindicator.hurt"}) do
                                    sounds:playSound(self.parent.compatibilityUtils:checkSound(soundName), playerPos, 0.5, 1)
                                end
                            elseif tick == 83 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), player:getPos(), 1, 1.5)
                            elseif tick == 93 then
                                models.models.main.Avatar.Head.EyeShines:setVisible(false)
                                self.parent.faceParts:setEmotion("UNEQUAL", "UNEQUAL", "OPENED", 45, true)
                            elseif tick == 97 then
                                models.models.main.Avatar.UpperBody.Body.Gun.MuzzleEffect.MuzzleEffect1:setColor(1, 0.659, 0.698)
                                for _ = 1, 8 do
                                    self.parent.exSkillSpriteManager:spawn(models.models.ex_skill_1.ExSkill1ParticleAnchor2, math.random(2, 5), vectors.vec3(0.294, 1, 1), vectors.vec3(0, 0, 0), vectors.rotateAroundAxis(math.random() * 360, 50, 0, 0, 0, 0, 1), 0, 2, nil, 8, true, 0.80)
                                end
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.arrow.shoot"), player:getPos(), 1, 2)
                            elseif tick == 105 then
                                if host:isHost() then
                                    events.RENDER:register(function (delta)
                                        models.models.ex_skill_1.Gui.ScreenFilter:setOpacity((self.parent.exSkill.animationCount + delta - 1) * -0.333 + 36)
                                    end, "ex_skill_1_filter_render")
                                    models.models.ex_skill_1.Gui.ScreenFilter:setScale(client:getScaledWindowSize():augmented(1))
                                    models.models.ex_skill_1.Gui.ScreenFilter:setVisible(true)
                                    models.models.ex_skill_1.script_walls:setVisible(false)
                                    models.models.ex_skill_1.CameraBackground.Background:setVisible(true)
                                    local windowSize = client:getWindowSize()
                                    models.models.ex_skill_1.CameraBackground.Background:setScale(vectors.vec3(windowSize.x / windowSize.y, 1, 1):scale(45))
                                    local shouldAdjustBackgroundRot = client:getVersion() >= "1.21"
                                    events.RENDER:register(function (delta, context)
                                        models.models.ex_skill_1.CameraBackground:setVisible(context == "RENDER")
                                        local backgroundPos = vectors.rotateAroundAxis(player:getBodyYaw(delta) + 180, renderer:getCameraOffsetPivot():copy():add(0, 1.62, 0):add(client:getCameraDir():copy():scale(2)), 0, 1, 0):scale(16 / 0.9375)
                                        models.models.ex_skill_1.CameraBackground:setOffsetPivot(backgroundPos)
                                        models.models.ex_skill_1.CameraBackground.Background:setPos(backgroundPos)
                                        if shouldAdjustBackgroundRot then
                                            models.models.ex_skill_1.CameraBackground.Background:setRot(0, 0, renderer:getCameraRot().z)
                                        end
                                    end, "ex_skill_1_background_render")
                                    if not self.parent.armor.isArmorVisible.helmet and not self.parent.armor.isArmorVisible.chestplate and not self.parent.armor.isArmorVisible.leggings and not self.parent.armor.isArmorVisible.boots then
                                        models.script_ex_skill_1:setVisible(true)
                                        events.RENDER:register(function (delta)
                                            local animPos = models.models.main.Avatar:getAnimPos()
                                            local bodyYaw = player:getBodyYaw(delta)
                                            models.script_ex_skill_1:setPos(animPos:copy():add(vectors.rotateAroundAxis(bodyYaw + 180, player:getPos(delta):add(vectors.rotateAroundAxis(bodyYaw * -1, animPos:copy():scale(0.0625):add(-0.15, 0.8, 0), 0, 1, 0)):sub(client:getCameraPos()):scale(8), 0, 1, 0)))
                                            models.script_ex_skill_1:setRot(models.models.main.Avatar:getAnimRot())
                                        end, "ex_skill_1_outline_render")
                                    end
                                end
                                for _ = 1, 8 do
                                    self.parent.exSkillSpriteManager:spawn(models.models.ex_skill_1.ExSkill1ParticleAnchor2, math.random(2, 5), vectors.vec3(1, 1, 0.443), vectors.vec3(0, 0, 0), vectors.rotateAroundAxis(math.random() * 360, 40, 0, 0, 0, 0, 1), 0, 2, nil, 33, true, 0.80)
                                end
                            elseif tick == 106 then
                                models.models.main.Avatar.UpperBody.Body.Gun.MuzzleEffect.MuzzleEffect1:setColor(0.557, 0.655, 0.976)
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.generic.explode"), player:getPos(), 0.5, 2.5)
                            elseif tick == 108 and host:isHost() then
                                events.RENDER:remove("ex_skill_1_filter_render")
                                models.models.ex_skill_1.Gui.ScreenFilter:setVisible(false)
                            end
                        end;

                        onPostAnimation = function (self, forcedStop)
                            if host:isHost() then
                                for _, eventName in ipairs({"ex_skill_1_outline_render", "ex_skill_1_background_render"}) do
                                    events.RENDER:remove(eventName)
                                end
                                for _, modelPart in ipairs({models.script_ex_skill_1, models.models.ex_skill_1.CameraBackground.Background}) do
                                    modelPart:setVisible(false)
                                end
                            end
                            models.models.ex_skill_1.script_walls:setVisible(false)
                            if models.models.ex_skill_1.Illagers.Pillager1.Pillager1RightArm.Letter ~= nil then
                                models.models.ex_skill_1.Illagers.Pillager1.Pillager1RightArm.Letter:moveTo(models.models.ex_skill_1)
                            end
                            renderer:shadowRadius()
                            if self.parent.gun.currentGunPosition == "NONE" then
                                if player:isLeftHanded() then
                                    models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(0, 12, 0):add(self.gun.gunPosition.put.pos.left))
                                    models.models.main.Avatar.UpperBody.Body.Gun:setRot(self.gun.gunPosition.put.rot.left)
                                else
                                    models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(0, 12, 0):add(self.gun.gunPosition.put.pos.right))
                                    models.models.main.Avatar.UpperBody.Body.Gun:setRot(self.gun.gunPosition.put.rot.right)
                                end
                            end
                            if forcedStop then
                                if host:isHost() then
                                    events.RENDER:remove("ex_skill_1_filter_render")
                                end
                                for _, modelPart in ipairs({models.models.main.Avatar.Head.EyeShines, models.models.ex_skill_1.script_walls_breakable}) do
                                    modelPart:setVisible(false)
                                end
                                self.parent.exSkillSpriteManager:removeAll()
                            else
                                local lookDir = player:getLookDir()
                                local lookYaw = math.deg(math.atan2(lookDir.z, lookDir.x))
                                self.parent.placementObjectManager:spawn(1, player:getPos():add(vectors.rotateAroundAxis(lookYaw * -1 + 90, 0, 1, 3, 0, 1, 0)), lookYaw * -1 + 90)
                            end
                        end;
                    };

                    ---このExスキルが初期化されたかどうか。
                    ---@type boolean
                    initialized = false;
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

                    challengeWords = {
                        ja_jp = {
                            "とりゃーー！！";
                            "ここに参上！！";
                            "勝負です！！";
                            "逃しませんよー！！";
                            "挑戦状を！受け取ってー！くださいっ！！";
                            "覚悟してください！！";
                            " - レイサ";
                        };
                        en_us = {
                            "Dorya-!!";
                            "Making my entrance!!";
                            "It's a match!!";
                            "You can't escape!!";
                            "Please receive, this letter of challenge!!";
                            "Please prepare yourself!!";
                            " - Reisa";
                        };
                    };
                };

                {
                    name = "magical";

                    displayName = {
                        en_us = "Magical";
                        ja_jp = "マジカル";
                    };

                    exSkill = 1;
                }
            };

            callbacks = {
                onChange = function (self)
                    self.parent.costume.setCostumeTextureOffset(1)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.Head, models.models.main.Avatar.Head.HatLayer}) do
                        modelPart:setUVPixels(0, 16)
                    end
                    models.models.main.Avatar.Head.Cowlick:setUVPixels(0, 1)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.CMagicalH, models.models.main.Avatar.UpperBody.Body.CMagicalB, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.CMagicalRAB, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.CMagicalLAB, models.models.main.Avatar.LowerBody.Legs.RightLeg.RightLegBottom.CMagicalRLB, models.models.main.Avatar.LowerBody.Legs.LeftLeg.LeftLegBottom.CMagicalLLB, models.models.main.Avatar.UpperBody.Body.Gun.StartAccessories}) do
                        modelPart:setVisible(true)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.HairPin, models.models.main.Avatar.Head.HairTails, models.models.main.Avatar.UpperBody.Body.Backpack, models.models.main.Avatar.UpperBody.Body.Skirt}) do
                        modelPart:setVisible(false)
                    end
                    models.models.main.Avatar.UpperBody.Body.Gun:setUVPixels(0, 85)
                end;

                onReset = function (self)
                    self.parent.costume.setCostumeTextureOffset(0)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.Head, models.models.main.Avatar.Head.HatLayer, models.models.main.Avatar.Head.Cowlick}) do
                        modelPart:setUVPixels()
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.CMagicalH, models.models.main.Avatar.UpperBody.Body.CMagicalB, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.CMagicalRAB, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.CMagicalLAB, models.models.main.Avatar.LowerBody.Legs.RightLeg.RightLegBottom.CMagicalRLB, models.models.main.Avatar.LowerBody.Legs.LeftLeg.LeftLegBottom.CMagicalLLB, models.models.main.Avatar.UpperBody.Body.Gun.StartAccessories}) do
                        modelPart:setVisible(false)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.HairPin, models.models.main.Avatar.Head.HairTails, models.models.main.Avatar.UpperBody.Body.Backpack, models.models.main.Avatar.UpperBody.Body.Skirt}) do
                        modelPart:setVisible(true)
                    end
                    models.models.main.Avatar.UpperBody.Body.Gun:setUVPixels()
                end;

                onArmorChange = function (_, parts, isVisible)
                    if parts == "LEGGINGS" then
                        models.models.main.Avatar.UpperBody.Body.Skirt:setVisible(not isVisible)
                    end
                end;
            };
        }

        instance.bubble = {
            callbacks = {
                onPlay = function(self, type, duration)
                    if duration > 0 then
                        if type == "GOOD" then
                            self.parent.faceParts:setEmotion("ANGRY", "ANGRY", "OPENED", duration, true)
                        elseif type == "HEART" then
                            self.parent.faceParts:setEmotion("UNEQUAL", "UNEQUAL", "OPENED", duration, true)
                        elseif type == "NOTE" then
                            self.parent.faceParts:setEmotion("ANGRY", "ANGRY", "NARROW", duration, true)
                            models.models.main.Avatar.Head.EyeShines:setVisible(true)
                        elseif type == "QUESTION" then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "NARROW", duration, true)
                            models.models.main.Avatar.Head.FaceParts.Eyes.EyeLeft:setRot(0, 0, -5)
                            models.models.main.Avatar.Head.FaceParts.Eyes.EyeRight:setRot(0, 0, 5)
                        elseif type == "SWEAT" then
                            self.parent.faceParts:setEmotion("SHOCKED", "SHOCKED", "FRUST", duration, true)
                            models.models.main.Avatar.Head.FaceParts.Eyes.EyeLeft:setRot(0, 0, -5)
                            models.models.main.Avatar.Head.FaceParts.Eyes.EyeRight:setRot(0, 0, 5)
                        end
                    end
                end;

                onStop = function(self, _, forcedStop)
                    models.models.main.Avatar.Head.EyeShines:setVisible(false)
                    if forcedStop then
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
                    dummyAvatar.Head.HairTails.HairRight:setRot(15, 0, 0)
                    dummyAvatar.Head.HairTails.HairLeft:setRot(15, 0, 0)
                    dummyAvatar.UpperBody.Body.Skirt:setRot(32.5, 0, 0)
                end;

                onPhase2 = function (_, dummyAvatar)
                    dummyAvatar.Head.HairTails.HairRight:setRot(-22.5, 0, 0)
                    dummyAvatar.Head.HairTails.HairLeft:setRot(-60, 0, 0)
                    dummyAvatar.UpperBody.Body.Backpack.BackPackMascot1:setRot(-17.5, 0, 0)
                    dummyAvatar.UpperBody.Body.Backpack.BackPackMascot2:setRot(-17.5, 0, 0)
                    dummyAvatar.UpperBody.Body.Backpack.BackPackMascot3:setRot(-17.5, 0, 20)
                    dummyAvatar.UpperBody.Body.Skirt:setRot(15, 0, 0)
                end;
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
                            min = -50;
                            neutral = -20;
                            max = 20;

                            headX = {
                                multiplayer = 40;
                                min = -50;
                                max = 20;
                            };

                            bodyY = {
                                multiplayer = 40;
                                min = -50;
                                max = 20;
                            };
                        };

                        horizontal = {
                            min = -50;
                            neutral = -20;
                            max = 20;

                            bodyX = {
                                multiplayer = 80;
                                min = 0;
                                max = 20;
                            };
                        };
                    };

                    y = {
                        vertical = {
                            min = -20;
                            neutral = -20;
                            max = -20;
                        };

                        horizontal = {
                            min = -20;
                            neutral = -20;
                            max = -20;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.HairTails.HairLeft};

                    x = {
                        vertical = {
                            min = -160;
                            neutral = -15;
                            max = -15;
                            headRotMultiplayer = -1;
                            sneakOffset = -30;

                            headX = {
                                multiplayer = -80;
                                min = -160;
                                max = -15;
                            };

                            headRot = {
                                multiplayer = 0.05;
                                min = -90;
                                max = 0;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -160;
                                max = -15;
                            };
                        };

                        horizontal = {
                            min = -67.5;
                            neutral = -67.5;
                            max = -67.5;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.HairTails.HairLeft.HairLeftZ};

                    z = {
                        vertical = {
                            min = -92.5;
                            neutral = -10;
                            max = 87.5;

                            headZ = {
                                multiplayer = -80;
                                min = -92.5;
                                max = 87.5;
                            };
                        };

                        horizontal = {
                            min = -92.5;
                            neutral = -10;
                            max = 87.5;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.HairTails.HairRight};

                    x = {
                        vertical = {
                            min = -160;
                            neutral = -15;
                            max = -15;
                            headRotMultiplayer = -1;
                            sneakOffset = -30;

                            headX = {
                                multiplayer = -80;
                                min = -160;
                                max = -15;
                            };

                            headRot = {
                                multiplayer = 0.05;
                                min = -90;
                                max = 0;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -160;
                                max = -15;
                            };
                        };

                        horizontal = {
                            min = -67.5;
                            neutral = -67.5;
                            max = -67.5;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.HairTails.HairRight.HairRightZ};

                    z = {
                        vertical = {
                            min = -87.5;
                            neutral = 10;
                            max = 92.5;

                            headZ = {
                                multiplayer = -80;
                                min = -87.5;
                                max = 92.5;
                            };
                        };

                        horizontal = {
                            min = -87.5;
                            neutral = 10;
                            max = 92.5;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Backpack.BackpackFastener};

                    x = {
                        vertical = {
                            min = -167.5;
                            neutral = 0;
                            max = 0;

                            bodyX = {
                                multiplayer = -160;
                                min = -90;
                                max = 0;
                            };

                            bodyY = {
                                multiplayer = 160;
                                min = -167.5;
                                max = 0;
                            };

                            bodyRot = {
                                multiplayer = 0.1;
                                min = -167.5;
                                max = 0;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Backpack.BackpackFastener.BackpackFastenerZ};

                    z = {
                        vertical = {
                            min = -80;
                            neutral = 0;
                            max = 80;

                            headZ = {
                                multiplayer = -160;
                                min = -80;
                                max = 80;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Backpack.BackpackFastener.BackpackFastenerZ};

                    z = {
                        vertical = {
                            min = -80;
                            neutral = 0;
                            max = 80;

                            headZ = {
                                multiplayer = -160;
                                min = -80;
                                max = 80;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Backpack.BackPackMascot2};

                    x = {
                        vertical = {
                            min = -80;
                            neutral = 0;
                            max = 80;

                            bodyX = {
                                multiplayer = -80;
                                min = -80;
                                max = 80;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -80;
                                max = 0;
                            };

                            bodyRot = {
                                multiplayer = 0.05;
                                min = -80;
                                max = 80;
                            };
                        };

                        horizontal = {
                            min = -80;
                            neutral = 80;
                            max = 80;

                            bodyX = {
                                multiplayer = -160;
                                min = 0;
                                max = 80;
                            };

                            bodyY = {
                                multiplayer = 160;
                                min = -80;
                                max = 80;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Backpack.BackPackMascot1};

                    x = {
                        vertical = {
                            min = 0;
                            neutral = 0;
                            max = 0;
                        };

                        horizontal = {
                            min = -80;
                            neutral = 80;
                            max = 80;

                            bodyX = {
                                multiplayer = -80;
                                min = 0;
                                max = 80;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -80;
                                max = 80;
                            };
                        };
                    };

                    z = {
                        vertical = {
                            min = -80;
                            neutral = 0;
                            max = 80;

                            bodyZ = {
                                multiplayer = -80;
                                min = -80;
                                max = 80;
                            };

                            bodyY = {
                                multiplayer = -80;
                                min = 0;
                                max = 80;
                            };
                        };

                        horizontal = {
                            min = 0;
                            neutral = 0;
                            max = 0;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Backpack.BackPackMascot3};

                    x = {
                        vertical = {
                            min = -90;
                            neutral = 0;
                            max = 90;

                            bodyX = {
                                multiplayer = -40;
                                min = -90;
                                max = 90;
                            };

                            bodyRot = {
                                multiplayer = 0.025;
                                min = -90;
                                max = 0;
                            };
                        };

                        horizontal = {
                            min = -90;
                            neutral = 0;
                            max = 90;

                            bodyY = {
                                multiplayer = 40;
                                min = -90;
                                max = 90;
                            };
                        };
                    };

                    z = {
                        vertical = {
                            min = 20;
                            neutral = 20;
                            max = 20;
                        };

                        horizontal = {
                            min = 0;
                            neutral = 0;
                            max = 0;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Backpack.BackPackMascot3.BackPackMascot3Z};

                    z = {
                        vertical = {
                            min = -155;
                            neutral = 0;
                            max = 60;

                            bodyY = {
                                multiplayer = 80;
                                min = -155;
                                max = 0;
                            };

                            bodyZ = {
                                multiplayer = -80;
                                min = -110;
                                max = 60;
                            };
                        };

                        horizontal = {
                            min = -110;
                            neutral = 0;
                            max = 60;

                            bodyZ = {
                                multiplayer = -160;
                                min = -110;
                                max = 60;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CMagicalH.HairTails.LeftHairTail};
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
                    models = {models.models.main.Avatar.Head.CMagicalH.HairTails.RightHairTail};

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
                    models = {models.models.main.Avatar.Head.CMagicalH.HairPin.HairPinWing, models.models.main.Avatar.LowerBody.Legs.LeftLeg.LeftLegBottom.CMagicalLLB.LeftBootsWing};

                    z = {
                        vertical = {
                            min = -15;
                            neutral = 0;
                            max = 35;

                            bodyY = {
                                multiplayer = 40;
                                min = -15;
                                max = 35;
                            };
                        };

                        horizontal = {
                            min = -15;
                            neutral = 0;
                            max = 35;

                            bodyY = {
                                multiplayer = -40;
                                min = -15;
                                max = 35;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.CMagicalB.Skirt.BackRibbon.RibbonRight};

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
                    models = {models.models.main.Avatar.UpperBody.Body.CMagicalB.Skirt.BackRibbon.RibbonRight.RibbonRightZPivot};

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
                    models = {models.models.main.Avatar.UpperBody.Body.CMagicalB.Skirt.BackRibbon.RibbonLeft};

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
                    models = {models.models.main.Avatar.UpperBody.Body.CMagicalB.Skirt.BackRibbon.RibbonLeft.RibbonLeftZPivot, models.models.main.Avatar.UpperBody.Body.CMagicalB.ChestRibbon.ChestRibbonLeft.ChestRibbonLeftZPivot};

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
                    models = {models.models.main.Avatar.UpperBody.Body.CMagicalB.Skirt.BackRibbon.RibbonBottomRight, models.models.main.Avatar.UpperBody.Body.CMagicalB.Skirt.BackRibbon.RibbonBottomLeft};

                    x = {
                        vertical = {
                            min = -140;
                            neutral = 0;
                            max = 15;
                            sneakOffset = 30;

                            bodyX = {
                                multiplayer = -80;
                                min = -60;
                                max = 15;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -140;
                                max = 15;
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
                            max = 15;

                            bodyY = {
                                multiplayer = 80;
                                min = -60;
                                max = 15;
                            };
                        };
                    };
                };


            {
                    models = {models.models.main.Avatar.UpperBody.Body.CMagicalB.Skirt.BackRibbon.RibbonBottomRight.RibbonBottomRightZPivot, models.models.main.Avatar.UpperBody.Body.CMagicalB.ChestRibbon.ChestRibbonBottomRight.ChestRibbonBottomRightZPivot};

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

                            bodyY = {
                                multiplayer = 20;
                                min = 0;
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
                    models = {models.models.main.Avatar.UpperBody.Body.CMagicalB.Skirt.BackRibbon.RibbonBottomLeft.RibbonBottomLeftZPivot, models.models.main.Avatar.UpperBody.Body.CMagicalB.ChestRibbon.ChestRibbonBottomLeft.ChestRibbonBottomLeftZPivot};

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

                            bodyY = {
                                multiplayer = -20;
                                min = -15;
                                max = 0;
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

                {
                    models = {models.models.main.Avatar.UpperBody.Body.CMagicalB.Skirt.BackRibbon.RibbonRight};

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
                    models = {models.models.main.Avatar.UpperBody.Body.CMagicalB.ChestRibbon.ChestRibbonLeft};

                    y = {
                        vertical = {
                            min = -70;
                            neutral = 0;
                            max = 0;

                            bodyX = {
                                multiplayer = 40;
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
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.CMagicalB.ChestRibbon.ChestRibbonRight};

                    y = {
                        vertical = {
                            min = 0;
                            neutral = 0;
                            max = 70;

                            bodyX = {
                                multiplayer = -40;
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
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.CMagicalB.Skirt.BackRibbon.RibbonRight.RibbonRightZPivot, models.models.main.Avatar.UpperBody.Body.CMagicalB.ChestRibbon.ChestRibbonRight.ChestRibbonRightZPivot};

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
                    models = {models.models.main.Avatar.UpperBody.Body.CMagicalB.ChestRibbon.ChestRibbonBottomRight, models.models.main.Avatar.UpperBody.Body.CMagicalB.ChestRibbon.ChestRibbonBottomLeft};

                    x = {
                        vertical = {
                            min = 0;
                            neutral = 0;
                            max = 140;
                            sneakOffset = 30;

                            bodyX = {
                                multiplayer = -80;
                                min = 0;
                                max = 60;
                            };

                            bodyY = {
                                multiplayer = -80;
                                min = 0;
                                max = 140;
                            };

                            bodyRot = {
                                multiplayer = -0.05;
                                min = 0;
                                max = 60;
                            };
                        };

                        horizontal = {
                            min = 0;
                            neutral = 0;
                            max = 140;

                            bodyY = {
                                multiplayer = -80;
                                min = 0;
                                max = 60;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.LowerBody.Legs.RightLeg.RightLegBottom.CMagicalRLB.RightBootsWing};

                    z = {
                        vertical = {
                            min = -35;
                            neutral = 0;
                            max = 15;

                            bodyY = {
                                multiplayer = -40;
                                min = -35;
                                max = 15;
                            };
                        };

                        horizontal = {
                            min = -35;
                            neutral = 0;
                            max = 15;

                            bodyY = {
                                multiplayer = 40;
                                min = -35;
                                max = 15;
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

        models.models.ex_skill_1.MuzzleEffect:moveTo(models.models.main.Avatar.UpperBody.Body.Gun)
    end;
}