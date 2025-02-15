---@alias BlueArchiveCharacter.RightEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "CENTER" # 少し反対側を見る目
---| "NARROW" # 少し閉じた目
---| "CLOSED2" # 閉じた目2

---@alias BlueArchiveCharacter.LeftEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "CENTER" # 少し反対側を見る目
---| "NARROW_CENTER" # 少し閉じつつ反対側を見る目
---| "CLOSED2" # 閉じた目2

---@alias BlueArchiveCharacter.MouthTextures
---| "NORMAL" # 通常
---| "CLOSED" # 閉じた口
---| "SMALL" # 小さく開いた口
---| "OPENED" # 開いた口
---| "SMILE" # にっこり
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
                en_us = "Seia";
                ja_jp = "セイア";
            };

            lastName = {
                en_us = "Yurizono";
                ja_jp = "百合園";
            };

            clubName = {
                en_us = "Tea Party";
                ja_jp = "ティーパーティー";
            };

            birth = {
                month = 9;
                day = 29;
            };
        }

        instance.faceParts = {
            rightEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(2, 0); --必須
                TIRED = vectors.vec2(3, 0); --必須
                CLOSED = vectors.vec2(4, 0); --必須
                CENTER = vectors.vec2(5, 0);
                NARROW = vectors.vec2(7, 0);
                CLOSED2 = vectors.vec2(9, 0);
            };

            leftEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(1, 0); --必須
                TIRED = vectors.vec2(2, 0); --必須
                CLOSED = vectors.vec2(3, 0); --必須
                CENTER = vectors.vec2(5, 0);
                NARROW_CENTER = vectors.vec2(7, 0);
                CLOSED2 = vectors.vec2(8, 0);
            };

            mouth = {
                CLOSED = vectors.vec2(0, 0);
                SMALL = vectors.vec2(1, 0);
                OPENED = vectors.vec2(2, 0);
                SMILE = vectors.vec2(3, 0);
                ANXIOUS = vectors.vec2(3, 1);
            };
        }

        instance.arms = {

        }

        instance.skirt = {
            skirtModels = {models.models.main.Avatar.UpperBody.Body.Skirt};
        }

        instance.gun = {
            scale = 0.5;

            gunPosition = {
                hold = {
                    firstPersonPos = {
                        right = vectors.vec3(-0.5, -1, -3);
                        left = vectors.vec3(0.5, -1, -3);
                    };

                    thirdPersonPos = {
                        right = vectors.vec3(0, -1, -5);
                        left = vectors.vec3(0, -1, -5);
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
                    en_us = "Garden of Slumber";
                    ja_jp = "まどろみの庭";
                };

                formationType = "STRIKER";

                models = {models.models.ex_skill_1.Bench, models.models.main.Avatar.Head.NoticeEffects, models.models.ex_skill_1.Gui};

                animations = {"main", "ex_skill_1"};

                camera = {
                    start = {
                        rot = vectors.vec3(25, -25, 0);
                        pos = vectors.vec3(-39.3, 53.3, 79);
                    };

                    fin = {
                        rot = vectors.vec3(-2.5, 65, 0);
                        pos = vectors.vec3(-29.7, 23.3, -59);
                    };
                };

                callbacks = {
                    onPreAnimation = function (self)
                        if not self.exSkill[1].init then
                            if models.models.main.Avatar.Head.Allay ~= nil then
                                models.models.main.Avatar.Head.Allay:moveTo(models.models.ex_skill_1)
                                models.models.main.Avatar.Head:removeChild(models.models.ex_skill_1.Allay)
                            end
                            for i = 2, 7 do
                                models.models.ex_skill_1.AnimAllays["Allay"..i]["Allay"..i.."Head"]:addChild(models.models.ex_skill_1.Allay.AllayHead.AllayHead:copy("Allay"..i.."Head"))
                                for j = 1, 2 do
                                    models.models.ex_skill_1.AnimAllays["Allay"..i]["Allay"..i.."Body"]:addChild(models.models.ex_skill_1.Allay.AllayBody["AllayBody"..j]:copy("Allay"..i.."Body"..j))
                                end
                                models.models.ex_skill_1.AnimAllays["Allay"..i]["Allay"..i.."Body"]["Allay"..i.."RA"]:addChild(models.models.ex_skill_1.Allay.AllayBody.AllayRA.AllayRA:copy("Allay"..i.."RA"))
                                models.models.ex_skill_1.AnimAllays["Allay"..i]["Allay"..i.."Body"]["Allay"..i.."LA"]:addChild(models.models.ex_skill_1.Allay.AllayBody.AllayLA.AllayLA:copy("Allay"..i.."LA"))
                                models.models.ex_skill_1.AnimAllays["Allay"..i]["Allay"..i.."Body"]["Allay"..i.."RightWing"]:addChild(models.models.ex_skill_1.Allay.AllayBody.AllayRightWing.AllayRightWing:copy("Allay"..i.."RightWing"))
                                models.models.ex_skill_1.AnimAllays["Allay"..i]["Allay"..i.."Body"]["Allay"..i.."LeftWing"]:addChild(models.models.ex_skill_1.Allay.AllayBody.AllayLeftWing.AllayLeftWing:copy("Allay"..i.."LeftWing"))
                            end
                            models.models.ex_skill_1.AnimAllays:setPrimaryTexture("RESOURCE", "minecraft:textures/entity/allay/allay.png")
                            if host:isHost() then
                                for i = 1, 4 do
                                    models.models.ex_skill_1.WindowAnchor:newBlock("ex_skill_1_block_"..i):setBlock(self.parent.compatibilityUtils:checkBlock("minecraft:smooth_quartz_stairs", "[facing=south]")):setPos((i - 1) * 16 - 32, -40, -32)
                                end
                                for i = 1, 2 do
                                    for j = 1, 4 do
                                        models.models.ex_skill_1.WindowAnchor:newBlock("ex_skill_1_block_"..((i - 1) * 4 + (j - 1) + 5)):setBlock(self.parent.compatibilityUtils:checkBlock("minecraft:smooth_quartz")):setPos((i - 1) * 80 + -48, (j - 1) * 16 - 40, -24)
                                    end
                                end
                                for i = 1, 6 do
                                    models.models.ex_skill_1.WindowAnchor:newBlock("ex_skill_1_block_"..(i + 12)):setBlock(self.parent.compatibilityUtils:checkBlock("minecraft:smooth_quartz")):setPos((i - 1) * 16 + -48, 24, -24)
                                end
                                for i = 1, 2 do
                                    for j = 1, 5 do
                                        for k = 1, 5 do
                                            models.models.ex_skill_1.WindowAnchor:newBlock("ex_skill_1_block_"..((i - 1) * 25 + (j - 1) * 5 + (k - 1) + 19)):setBlock(self.parent.compatibilityUtils:checkBlock("minecraft:polished_andesite")):setPos((i - 1) * 112 - 64, (k - 1) * 16 - 40, (j - 1) * 16 - 24)
                                        end
                                    end
                                end
                                for i = 1, 6 do
                                    for j = 1, 5 do
                                        models.models.ex_skill_1.WindowAnchor:newBlock("ex_skill_1_block_"..((i - 1) * 5 + (j - 1) + 69)):setBlock(self.parent.compatibilityUtils:checkBlock("minecraft:polished_andesite")):setPos((i - 1) * 16 - 48, (j - 1) * 16 - 40, 40)
                                    end
                                end
                                for i = 1, 8 do
                                    for j = 1, 5 do
                                        models.models.ex_skill_1.WindowAnchor:newBlock("ex_skill_1_block_"..((i - 1) * 5 + (j - 1) + 99)):setBlock(self.parent.compatibilityUtils:checkBlock("minecraft:spruce_planks")):setPos((i - 1) * 16 - 64, -56, (j - 1) * 16 - 24)
                                    end
                                end
                                for i = 1, 8 do
                                    for j = 1, 5 do
                                        models.models.ex_skill_1.WindowAnchor:newBlock("ex_skill_1_block_"..((i - 1) * 5 + (j - 1) + 139)):setBlock(self.parent.compatibilityUtils:checkBlock("minecraft:polished_andesite")):setPos((i - 1) * 16 - 64, 40, (j - 1) * 16 - 24)
                                    end
                                end
                                for i = 1, 2 do
                                    for j = 1, 3 do
                                        models.models.ex_skill_1.WindowAnchor.WindowFrameAnchor1:newBlock("ex_skill_1_block_"..((i - 1) * 3 + (j - 1) + 179)):setBlock(self.parent.compatibilityUtils:checkBlock("minecraft:glass_pane", "[east=true,west=true]")):setPos((i - 1) * 16, (j - 1) * 16, -8)
                                    end
                                end
                                for i = 1, 2 do
                                    for j = 1, 3 do
                                        models.models.ex_skill_1.WindowAnchor.WindowFrameAnchor2:newBlock("ex_skill_1_block_"..((i - 1) * 3 + (j - 1) + 186)):setBlock(self.parent.compatibilityUtils:checkBlock("minecraft:glass_pane", "[east=true,west=true]")):setPos((i - 1) * 16 - 32, (j - 1) * 16, -8)
                                    end
                                end
                                models.models.ex_skill_1.WindowAnchor:newBlock("ex_skill_1_block_192"):setBlock(self.parent.compatibilityUtils:checkBlock("minecraft:potted_azure_bluet")):setPos(-24, -24, -28)
                            end
                            self.exSkill[1].init= true
                        end
                        if host:isHost() then
                            models.models.ex_skill_1.WindowAnchor:setVisible(true)
                            events.RENDER:register(function ()
                                models.models.ex_skill_1.Gui.Frame:setOpacity(models.models.ex_skill_1.Gui.FrameOpacity:getAnimScale().x)
                            end, "ex_skill_1_render")
                        end
                        self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "CLOSED", 13, true)
                    end;

                    onAnimationTick = function (self, tick)
                        if tick == 1 and host:isHost() then
                            models.models.ex_skill_1.Allay:setVisible(true)
                        elseif tick == 13 then
                            self.parent.faceParts:setEmotion("CENTER", "NORMAL", "CLOSED", 14, true)
                        elseif tick == 20 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.allay.ambient_with_item"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_1.Allay), 0.15, 1)
                        elseif tick == 27 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "CLOSED", 9, true)
                        elseif tick == 38 then
                            if host:isHost() then
                                models.models.ex_skill_1.WindowAnchor:setVisible(false)
                            end
                            for _, modelPart in ipairs({models.models.ex_skill_1.Allay, models.models.ex_skill_1.AnimAllays, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Book, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Cushion}) do
                                modelPart:setVisible(true)
                            end
                            self.parent.faceParts:setEmotion("CENTER", "NORMAL", "CLOSED", 65, true)
                        elseif tick == 64 and host:isHost() then
                            models.models.ex_skill_1.Gui.Frame:setScale(client:getScaledWindowSize():augmented(1))
                        elseif tick == 101 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.bat.takeoff"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_1.Bench), 0.15, 1.5)
                        elseif tick == 103 then
                            self.parent.faceParts:setEmotion("NORMAL", "CENTER", "CLOSED", 3, true)
                        elseif tick == 106 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "CLOSED", 2, true)
                        elseif tick == 108 then
                            self.parent.faceParts:setEmotion("NORMAL", "CENTER", "SMALL", 6, true)
                        elseif tick == 114 then
                            models.models.ex_skill_1.Allay:setVisible(false)
                            for i = 2, 7 do
                                models.models.ex_skill_1.AnimAllays["Allay"..i]:setVisible(false)
                            end
                            self.parent.faceParts:setEmotion("CENTER", "NORMAL", "SMALL", 19, true)
                        elseif tick == 133 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "SMALL", 2, true)
                        elseif tick == 134 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 1, 1.5)
                        elseif tick == 135 then
                            for i = 1, 3 do
                                models.models.main.Avatar.Head.NoticeEffects["NoticeEffect"..i]["NoticeEffect"..i.."Pivot"]:setOffsetPivot(-4, 0, 0)
                            end
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "SMALL", 16, true)
                        elseif tick == 146 then
                            if host:isHost() then
                                models.models.ex_skill_1.Gui.Frame:setUVPixels(16, 0)
                            end
                            local bodyYaw = player:getBodyYaw()
                            for _ = 1, 20 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:firework"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.Head):add(0, 0.25, 0)):setVelocity(vectors.rotateAroundAxis(math.random() * 120 - 60, vectors.rotateAroundAxis(bodyYaw * -1 + 30 - math.random() * 240, 0, 0, math.random() * 0.05 + 0.05, 0, 1, 0), 1, 0, 0)):setGravity(0):setLifetime(70)
                            end
                        elseif tick == 151 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "SMALL", 2, true)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 0.5, 1.5)
                        elseif tick == 153 then
                            for _, modelPart in ipairs({models.models.ex_skill_1.Allay, models.models.ex_skill_1.AnimAllays.Allay2}) do
                                modelPart:setVisible(true)
                            end
                            self.parent.faceParts:setEmotion("NARROW", "NARROW_CENTER", "OPENED", 63, true)
                        elseif tick == 160 then
                            models.models.ex_skill_1.AnimAllays.Allay3:setVisible(true)
                        elseif tick == 163 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.allay.ambient_with_item"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_1.AnimAllays.Allay3), 0.15, 1)
                        end

                        if tick >= 101 and tick < 114 then
                            particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:firework"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_1.Allay)):setScale(0.25):setColor(0.25, 1, 1):setGravity(0)
                            for i = 2, 7 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:firework"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_1.AnimAllays["Allay"..i])):setScale(0.25):setColor(0.25, 1, 1):setGravity(0)
                            end
                        end

                        if tick >= 38 and tick < 101 and math.random() >= 0.95 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.allay.ambient_with_item"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_1.Bench), 0.15, 1)
                        end

                        particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:cherry_leaves"), player:getPos():add(vectors.rotateAroundAxis( player:getBodyYaw() * -1, -3, 5, 4, 0, 1, 0)):add(math.random() * 5 - 2.5, 0, math.random() * 5 - 2.5))
                    end;

                    onPostAnimation = function (_, forcedStop)
                        if host:isHost() then
                            events.RENDER:remove("ex_skill_1_render")
                            models.models.ex_skill_1.Gui.Frame:setUVPixels()
                        end
                        for i = 4, 7 do
                            models.models.ex_skill_1.AnimAllays["Allay"..i]:setVisible(true)
                        end
                        for _, modelPart in ipairs({models.models.ex_skill_1.AnimAllays, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Book, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Cushion}) do
                            modelPart:setVisible(false)
                        end
                        for i = 1, 3 do
                            models.models.main.Avatar.Head.NoticeEffects["NoticeEffect"..i]["NoticeEffect"..i.."Pivot"]:setOffsetPivot()
                        end
                        if forcedStop then
                            if host:isHost() then
                                models.models.ex_skill_1.WindowAnchor:setVisible(false)
                            end
                            for i = 2, 3 do
                                models.models.ex_skill_1.AnimAllays["Allay"..i]:setVisible(true)
                            end
                        end
                    end;
                };

                ---このExスキルの初期化処理が行われたかどうか。
                ---@type boolean
                init = false;
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
                    if parts == "HELMET" and self.parent.allay.perchCount <= 0 and models.models.main.Avatar.Head.Allay ~= nil then
                        models.models.main.Avatar.Head.Allay:setPos(0, isVisible and 33 or 32, 3)
                    elseif parts == "CHEST_PLATE" then
                        if isVisible then
                            models.models.main.Avatar.UpperBody.Body.Hairs.FrontHair:setPos(0, 0, -1)
                            models.models.main.Avatar.UpperBody.Body.Hairs.BackHair:setPos(0, 0, 1)
                        else
                            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Hairs.FrontHair, models.models.main.Avatar.UpperBody.Body.Hairs.BackHair}) do
                                modelPart:setPos()
                            end
                        end
                    elseif parts == "LEGGINGS" then
                        if isVisible then
                            models.models.main.Avatar.UpperBody.Body.Skirt:setVisible(false)
                            self.physics.physicData[1].x.vertical.neutral = 0
                            self.physics.physicData[1].x.vertical.max = 0
                            self.physics.physicData[1].x.vertical.bodyX.max = 0
                            self.physics.physicData[1].x.vertical.bodyY.max = 0
                            self.physics.physicData[1].x.vertical.bodyRot.max = 0
                            self.physics.physicData[1].x.horizontal.neutral = 0
                            self.physics.physicData[1].x.horizontal.max = 0
                        else
                            models.models.main.Avatar.UpperBody.Body.Skirt:setVisible(true)
                            self.physics.physicData[1].x.vertical.neutral = -10
                            self.physics.physicData[1].x.vertical.max = -10
                            self.physics.physicData[1].x.vertical.bodyX.max = -10
                            self.physics.physicData[1].x.vertical.bodyY.max = -10
                            self.physics.physicData[1].x.vertical.bodyRot.max = -10
                            self.physics.physicData[1].x.horizontal.neutral = -10
                            self.physics.physicData[1].x.horizontal.max = -10
                        end
                    end

                    if self.parent.armor.isArmorVisible.chestplate or self.parent.armor.isArmorVisible.leggings then
                        self.physics.physicData[2].x.vertical.min = 0
                        self.physics.physicData[2].x.vertical.neutral = 0
                        self.physics.physicData[2].x.vertical.bodyX.min = 0
                        self.physics.physicData[2].x.vertical.bodyY.min = 0
                        self.physics.physicData[2].x.vertical.bodyRot.min = 0
                        self.physics.physicData[2].x.horizontal.min = 0
                        self.physics.physicData[2].x.horizontal.neutral = 0
                        self.physics.physicData[2].x.horizontal.bodyX.min = 0

                    else
                        self.physics.physicData[2].x.vertical.min = 5
                        self.physics.physicData[2].x.vertical.neutral = 5
                        self.physics.physicData[2].x.vertical.bodyX.min = 5
                        self.physics.physicData[2].x.vertical.bodyY.min = 5
                        self.physics.physicData[2].x.vertical.bodyRot.min = 5
                        self.physics.physicData[2].x.horizontal.min = 5
                        self.physics.physicData[2].x.horizontal.neutral = 5
                        self.physics.physicData[2].x.horizontal.bodyX.min = 5
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
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "SMILE", duration, true)
                        elseif type == "QUESTION" then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "ANXIOUS", duration, true)
                        elseif type == "SWEAT" then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "ANXIOUS", duration, true)
                        end
                    end
                end;

                onStop = function(self, _, forcedStop)
                    if forcedStop then
                        self.parent.faceParts:resetEmotion()
                    end
                end;
            };
        }

        instance.headBlock = {
            includeModels = {models.models.main.Avatar.UpperBody.Body.Hairs};

            callbacks = {
                onBeforeModelCopy = function ()
                    if models.models.main.Avatar.Head.Allay ~= nil then
                        models.models.main.Avatar.Head.Allay:setVisible(false)
                    end
                end;

                onAfterModelCopy = function ()
                    if models.models.main.Avatar.Head.Allay ~= nil then
                        models.models.main.Avatar.Head.Allay:setVisible(true)
                    end
                end;
            };
        }

        instance.portrait = {
            includeModels = {};
        }

        instance.deathAnimation = {
            callbacks = {
                onBeforeModelCopy = function ()
                    if models.models.main.Avatar.Head.Allay ~= nil then
                        models.models.main.Avatar.Head.Allay:setVisible(false)
                    end
                end;

                onAfterModelCopy = function ()
                    if models.models.main.Avatar.Head.Allay ~= nil then
                        models.models.main.Avatar.Head.Allay:setVisible(true)
                    end
                end;

                onPhase1 = function (_, dummyAvatar)
                    dummyAvatar.Head.Ears.RightEar:setRot(-60, -20, 0)
                    dummyAvatar.Head.Ears.LeftEar:setRot(-60, 20, 0)
                    dummyAvatar.UpperBody.Body.Hairs.FrontHair:setRot(35, 0, 0)
                    dummyAvatar.UpperBody.Body.Hairs.BackHair:setRot()
                    dummyAvatar.UpperBody.Body.Skirt:setRot(45, 0, 0)
                    dummyAvatar.UpperBody.Body.Tail:setRot(10, 0, 0)
                    for _, modelPart in ipairs({dummyAvatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeve, dummyAvatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftSleeve}) do
                        modelPart:setRot()
                        modelPart:setOffsetPivot()
                    end
                end;

                onPhase2 = function (_, dummyAvatar, costume)
                    dummyAvatar.UpperBody.Body.Hairs.FrontHair:setRot(15, 0, 0)
                    dummyAvatar.UpperBody.Body.Hairs.BackHair:setRot(-20, 0, 0)
                    dummyAvatar.UpperBody.Body.Skirt:setRot(25, 0, 0)
                    dummyAvatar.UpperBody.Body.Tail:setRot(80, 0, -10)
                    dummyAvatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeve:setRot(-40, 0, 0)
                end;
            };
        }

        instance.actionWheel = {
            isVehicleOptionEnabled = false;
        }

        instance.physics = {
            physicData = {
                {
                    models = {models.models.main.Avatar.UpperBody.Body.Hairs.BackHair},

                    x = {
                        vertical = {
                            min = -150;
                            neutral = -10;
                            max = -10;

                            bodyX = {
                                multiplayer = -80;
                                min = -90;
                                max = -10;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -150;
                                max = -10;
                            };

                            bodyRot = {
                                multiplayer = 0.05;
                                min = -90;
                                max = -10;
                            };
                        };

                        horizontal = {
                            min = -90;
                            neutral = -10;
                            max = -10;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Hairs.FrontHair};

                    x = {
                        vertical = {
                            min = 5;
                            neutral = 5;
                            max = 150;
                            sneakOffset = 30;

                            bodyX = {
                                multiplayer = -80;
                                min = 5;
                                max = 90;
                            };

                            bodyY = {
                                multiplayer = -80;
                                min = 5;
                                max = 150;
                            };

                            bodyRot = {
                                multiplayer = -0.05;
                                min = 5;
                                max = 90;
                            };
                        };

                        horizontal = {
                            min = 5;
                            neutral = 90;
                            max = 150;

                            bodyX = {
                                multiplayer = -80;
                                min = 5;
                                max = 150;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Tail};

                    x = {
                        vertical = {
                            min = -70;
                            neutral = 60;
                            max = 60;
                            sneakOffset = 30;

                            bodyX = {
                                multiplayer = -80;
                                min = 0;
                                max = 60;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -70;
                                max = 60;
                            };

                            bodyRot = {
                                multiplayer = 0.05;
                                min = 0;
                                max = 60;
                            };
                        };

                        horizontal = {
                            min = -70;
                            neutral = 0;
                            max = 60;
                            sneakOffset = 30;

                            bodyX = {
                                multiplayer = 160;
                                min = -70;
                                max = 60;
                            };
                        };
                    };

                    y = {
                        vertical = {
                            min = -50;
                            neutral = 0;
                            max = 50;

                            bodyZ = {
                                multiplayer = -160;
                                min = -50;
                                max = 50;
                            };
                        };

                        horizontal = {
                            min = -50;
                            neutral = 0;
                            max = 50;

                            bodyRot = {
                                multiplayer = 0.05;
                                min = -50;
                                max = 50;
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

        events.RENDER:register(function (_, context)
            if context == "FIRST_PERSON" then
                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeve:setRot(0, 0, -60)
                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeve:setOffsetPivot(1.5, 0, 0)
                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftSleeve:setRot(0, 0, 60)
                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftSleeve:setOffsetPivot(-1.5, 0, 0)
            elseif self.parent.exSkill.animationCount == -1 then
                local rightArmRot = math.clamp(((models.models.main.Avatar.UpperBody.Arms.RightArm:getParentType() == "RightArm" and not (context == "PAPERDOLL" and self.parent.gun.currentGunPosition ~= "NONE")) and vanilla_model.RIGHT_ARM:getOriginRot().x or 0) + models.models.main.Avatar.UpperBody.Arms.RightArm:getTrueRot().x, -60, 60)
                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeve:setRot(rightArmRot * -1, 0, 0)
                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeve:setOffsetPivot(0, 0, rightArmRot < 0 and 4 or 0)
                local leftArmRot = math.clamp(((models.models.main.Avatar.UpperBody.Arms.LeftArm:getParentType() == "LeftArm" and not (context == "PAPERDOLL" and self.parent.gun.currentGunPosition ~= "NONE")) and vanilla_model.LEFT_ARM:getOriginRot().x or 0) + models.models.main.Avatar.UpperBody.Arms.LeftArm:getTrueRot().x, -60, 60)
                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftSleeve:setRot(leftArmRot * -1, 0, 0)
                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftSleeve:setOffsetPivot(0, 0, leftArmRot < 0 and 4 or 0)
            else
                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeve:setRot()
                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeve:setOffsetPivot(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeve:getAnimRot().x >= 0 and 4 or 0)
                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftSleeve:setRot()
                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftSleeve:setOffsetPivot(models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftSleeve:getAnimRot().x >= 0 and 4 or 0)
            end
        end)
    end;
}