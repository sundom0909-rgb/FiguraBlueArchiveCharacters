---@alias BlueArchiveCharacter.RightEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "INVERTED" # 困りつつ、反対側を見る目
---| "UNEQUAL" # ><

---@alias BlueArchiveCharacter.LeftEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "UNEQUAL" # ><
---| "CENTER" # 少し反対側を見る目

---@alias BlueArchiveCharacter.MouthTextures
---| "NORMAL" # 通常
---| "OPENED" # 開いた口
---| "TRIANGLE" # 三角形の口
---| "FRUST" # ぐじゅぐじゅ口
---| "SMILE" # にっこり
---| "WORRY" # 困った口

---@alias BlueArchiveCharacter.GunPutType
---| "BODY" # アバターのBodyに銃を移動させる
---| "HIDDEN" # 銃を隠す

---@alias BlueArchiveCharacter.FormationType
---| "STRIKER" # ストライカー（前衛）
---| "SPECIAL" # スペシャル（後方支援）

---@alias BlueArchiveCharacter.Costumes
---| "DEFAULT" # デフォルト衣装
---| "SWIMSUIT" # 水着

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
                en_us = "Shizuko";
                ja_jp = "シズコ";
            };

            lastName = {
                en_us = "Kawawa";
                ja_jp = "河和";
            };

            clubName = {
                en_us = "Festival Management Committee";
                ja_jp = "お祭り運営委員会";
            };

            birth = {
                month = 7;
                day = 7;
            };
        }

        instance.faceParts = {
            rightEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(3, 0); --必須
                TIRED = vectors.vec2(4, 0); --必須
                CLOSED = vectors.vec2(0, 1); --必須
                INVERTED = vectors.vec2(2, 1);
                UNEQUAL = vectors.vec2(1, 1);
            };

            leftEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(2, 0); --必須
                TIRED = vectors.vec2(3, 0); --必須
                CLOSED = vectors.vec2(-1, 1); --必須
                UNEQUAL = vectors.vec2(0, 1);
                CENTER = vectors.vec2(1, 0);
            };

            mouth = {
                OPENED = vectors.vec2(0, 1);
                TRIANGLE = vectors.vec2(1, 1);
                FRUST = vectors.vec2(0, 2);
                SMILE = vectors.vec2(1, 2);
                WORRY = vectors.vec2(0, 0);
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
                        right = vectors.vec3(0, 1, -7);
                        left = vectors.vec3(0, 1, -7);
                    };

                    thirdPersonPos = {
                        right = vectors.vec3(-1.5, -0.25, -8);
                        left = vectors.vec3(1.5, -0.25, -8);
                    };
                };

                put = {
                    type = "BODY";

                    pos = {
                        right = vectors.vec3(-1.5, 4, 3.5);
                        left = vectors.vec3(1.5, 4, 3.5);
                    };

                    rot = {
                        right = vectors.vec3(0, 90, -45);
                        left = vectors.vec3(45, -90, 0);
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
                model = models.models.ex_skill_1.Stall;

                boundingBox = {
                    size = vectors.vec3(20, 38, 20);
                };

                placementMode = "COPY";
            };
        }

        instance.exSkill = {
            {
                name = {
                    en_us = "Momoya Hall Take-out!";
                    ja_jp = "百夜堂出張サービス！";
                };

                formationType = "SPECIAL";

                models = {models.models.ex_skill_1.Stall, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.TeaSet};

                animations = {"main", "ex_skill_1"};

                camera = {
                    start = {
                        rot = vectors.vec3(0, 180, 0);
                        pos = vectors.vec3(-5, 23, -16);
                    };

                    fin = {
                        rot = vectors.vec3(10, -100, 0);
                        pos = vectors.vec3(-203, 24, 23);
                    };

                    fixMode = true;
                };

                callbacks = {
                    onPreTransition = function (self)
                        self.parent.placementObjectManager:removeAll()
                    end;

                    onPreAnimation = function (self)
                        if not self.exSkill[1].init then
                            models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.TeaSet.WaterSpill:setPrimaryTexture("RESOURCE", "textures/block/water_still.png")
                            models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.TeaSet.WaterSpill:setColor(0.25, 0.39, 0.67)
                            self.exSkill[1].init = true
                        end
                        self.parent.faceParts:setEmotion("NORMAL", "CENTER", "OPENED", 22, true)
                    end;

                    onAnimationTick = function (self, tick)
                        if tick == 22 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "OPENED", 2, true)
                        elseif tick == 24 then
                            self.parent.faceParts:setEmotion("INVERTED", "NORMAL", "WORRY", 1, true)
                        elseif tick == 25 then
                            self.exSkill[1].textTask:setVisible(true)
                            self.parent.faceParts:setEmotion("INVERTED", "NORMAL", "TRIANGLE", 8, true)
                        elseif tick == 33 then
                            self.exSkill[1].textTask:setVisible(false)
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "TRIANGLE", 1, true)
                        elseif tick == 34 then
                            self.parent.faceParts:setEmotion("UNEQUAL", "UNEQUAL", "FRUST", 1, true)
                        elseif tick == 35 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "FRUST", 1, true)
                        elseif tick == 36 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "TRIANGLE", 10, true)
                        elseif tick == 46 then
                            self.parent.faceParts:setEmotion("UNEQUAL", "UNEQUAL", "TRIANGLE", 1, true)
                        elseif tick == 47 then
                            self.parent.faceParts:setEmotion("UNEQUAL", "UNEQUAL", "FRUST", 6, true)
                        elseif tick == 53 then
                            self.parent.faceParts:setEmotion("SURPRISED", "SURPRISED", "TRIANGLE", 14, true)
                            if host:isHost() then
                                models.models.ex_skill_1.CameraBackground:setVisible(true)
                                local windowSize = client:getWindowSize()
                                models.models.ex_skill_1.CameraBackground.Background:setScale(vectors.vec3(windowSize.x / windowSize.y, 1, 1):scale(45))
                                events.RENDER:register(function (delta, context)
                                    models.models.ex_skill_1.CameraBackground:setVisible(context == "RENDER")
                                    local backgroundPos = vectors.rotateAroundAxis(player:getBodyYaw(delta) + 180, renderer:getCameraOffsetPivot():copy():add(0, 1.62, 0):add(client:getCameraDir():copy():scale(1.75)), 0, 1, 0):scale(16 / 0.9375)
                                    models.models.ex_skill_1.CameraBackground:setOffsetPivot(backgroundPos)
                                    models.models.ex_skill_1.CameraBackground.Background:setPos(backgroundPos)
                                end, "ex_skill_1_background_render")
                            end
                            local particleAnchor = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar):add(0, 5, 0)
                            local fireworkColor = vectors.hsvToRGB(math.random(), 0.8, 1)
                            particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:flash"), particleAnchor):setColor(fireworkColor)
                            for _ = 1, 400 do
                                local particleAngleX = math.random() * math.pi * 2
                                    local particleAngleY = math.random() * math.pi * 2
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:firework"), particleAnchor):setVelocity(math.cos(particleAngleX) * math.cos(particleAngleY) * 0.2, math.sin(particleAngleY) * 0.2, math.sin(particleAngleX) * math.cos(particleAngleY) * 0.2):setColor(fireworkColor)
                            end
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.firework_rocket.large_blast"), player:getPos())
                        elseif tick == 56 then
                            models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.TeaSet:moveTo(models.models.main)
                        elseif tick == 67 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "WORRY", 8, true)
                            if host:isHost() then
                                models.models.ex_skill_1.CameraBackground:setVisible(false)
                                events.RENDER:remove("ex_skill_1_background_render")
                            end
                        elseif tick == 69 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.glass.break"), self.parent.modelUtils.getModelWorldPos(models.models.main.TeaSet.ExSkill1SoundAnchor2), 1, 0.5)
                            local particleAnchor1Pos = self.parent.modelUtils.getModelWorldPos(models.models.main.TeaSet.WaterSpill)
                            for _ = 1, 20 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:splash"), particleAnchor1Pos:copy():add(math.random() - 0.5, 0, math.random() - 0.5)):setLifetime(10)
                            end
                        elseif tick == 74 then
                            self.parent.faceParts:setEmotion("UNEQUAL", "UNEQUAL", "FRUST", 21, true)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.generic.small_fall"), player:getPos(), 1)
                            local particleAnchor1Pos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.Head.ExSkill1ParticleAnchor1)
                            for i = 0, 5 do
                                local particleRot = math.rad(i * 60)
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:wax_off"), particleAnchor1Pos):setColor(1, 1, 0):setLifetime(12):setVelocity(math.cos(particleRot) * 0.05, 0.1, math.sin(particleRot) * 0.05):setGravity(0.5)
                            end
                        end

                        if tick >= 25 and tick < 33 then
                            self.exSkill[1].textTask:setPos(vectors.vec3(-9, 8, -8):add(math.random() * 0.5 - 0.25, math.random() * 0.5 - 0.25))
                            if (tick - 25) % 2 == 0 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.experience_orb.pickup"), player:getPos(), 1, 2)
                            end
                        end
                        if tick < 56 and tick % 4 == 0 then
                            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.TeaSet.Yunomi1.ExSkill1ParticleAnchor2, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.TeaSet.Yunomi2.ExSkill1ParticleAnchor3}) do
                                local particleAnchorPos = self.parent.modelUtils.getModelWorldPos(modelPart)
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("poof"), particleAnchorPos):setScale(0.2):setVelocity():setLifetime(15)
                            end
                        end
                        if tick % 2 == 0 and tick >= 70 then
                            local particleAnchor5Pos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_1.Stall.ExSkill1ParticleAnchor5)
                            for i = 0, 11 do
                                local particleRot = i * (math.pi / 6)
                                particles:newParticle(self.parent.compatibilityUtils.getBlockParticleId(self.parent.compatibilityUtils:checkBlock("minecraft:dirt")), particleAnchor5Pos:copy():add(math.cos(particleRot) * 0.6, 0, math.sin(particleRot) * 0.6))
                            end
                        end
                        if tick % math.ceil((animations["models.main"]["ex_skill_1"]:getLength() * 20 - tick) / 20) == 0 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.boat.paddle_land"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_1.Stall.Wheels.ExSkill1SoundAnchor1))
                        end
                    end;

                    onPostAnimation = function (self, forcedStop)
                        if models.models.main.TeaSet ~= nil then
                            models.models.main.TeaSet:moveTo(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom)
                        end
                        if forcedStop then
                            if host:isHost() then
                                models.models.ex_skill_1.CameraBackground:setVisible(false)
                                events.RENDER:remove("ex_skill_1_background_render")
                            end
                            self.exSkill[1].textTask:setVisible(false)
                        else
                            local bodyYaw = player:getBodyYaw() % 360
                            self.parent.placementObjectManager:spawn(1, vectors.rotateAroundAxis(bodyYaw * -1, -10.75, 1, -2.1875, 0, 1, 0):add(player:getPos()), 180 + bodyYaw * -1)
                        end
                    end;
                };

                ---初期化処理が行われたかどうか
                ---@type boolean
                init = false;

                ---アニメーションに表示する「!!!」のテキストレンダータスク
                ---@type TextTask
                textTask = models.models.main.CameraAnchor:newText("ex_skill_1_text_1"):setVisible(false):setText("§c! !"):setRot(0, 180, 5):setScale(0.8, 0.8, 0.8):setOutline(true):setOutlineColor(1, 1, 1);
            };

            {
                name = {
                    en_us = "Business trip, Momoya summer stall!";
                    ja_jp = "出張、夏の百夜堂出店！";
                };

                formationType = "SPECIAL";

                models = {models.models.ex_skill_2.Plate, models.models.ex_skill_2.Gui, models.models.main.Avatar.Head.WinkEffect};

                animations = {"main", "costume_swimsuit", "ex_skill_2"};

                camera = {
                    start = {
                        pos = vectors.vec3(35.5, 25, 10),
                        rot = vectors.vec3(-10, 210, 0)
                    };

                    fin = {
                        pos = vectors.vec3(8.9, 29, -13.25),
                        rot = vectors.vec3(10, 170, -5)
                    };
                };

                callbacks = {
                    onPreTransition = function ()
                        for _, modelPart in ipairs({models.models.ex_skill_2.Stall, models.models.ex_skill_2.SoftCream}) do
                            modelPart:setVisible(true)
                        end
                    end;

                    onPreAnimation = function (self)
                        if not self.exSkill[2].init then
                            models.models.ex_skill_2.Plate.ShavedIceGroup.Wave:setPrimaryTexture("RESOURCE", "minecraft:textures/block/water_flow.png")
                            models.models.ex_skill_2.Plate.ShavedIceGroup.Wave:setColor(0.4, 0.961, 1)
                            self.exSkill[2].init = true
                        end
                        for _, modelPart in ipairs({models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce1, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce2, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce3, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce4, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce5, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIceEars.ShavedIceEarLeft, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIceEars.ShavedIceEarRight}) do
                            modelPart:setUVPixels(1, 0)
                        end
                        if host:isHost() then
                            local windowSize = client:getScaledWindowSize()
                            models.models.ex_skill_2.Gui.Frame:setScale(windowSize.x, windowSize.y)
                            events.RENDER:register(function ()
                                models.models.ex_skill_2.Gui.Frame:setOpacity(models.models.ex_skill_2.Gui.FrameOpacity:getAnimScale().x)
                            end, "ex_skill_2_render")
                        end
                        self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "OPENED", 71, true)
                    end;

                    onAnimationTick = function (self, tick)
                        if tick == 9 then
                            for _, modelPart in ipairs({models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce1, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce2, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce3, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce4, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce5, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIceEars.ShavedIceEarLeft, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIceEars.ShavedIceEarRight}) do
                                modelPart:setUVPixels(2, 0)
                            end
                        elseif tick == 12 then
                            for _, modelPart in ipairs({models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce1, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce2, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce3, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce4, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce5, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIceEars.ShavedIceEarLeft, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIceEars.ShavedIceEarRight}) do
                                modelPart:setUVPixels(3, 0)
                            end
                        elseif tick == 16 then
                            for _, modelPart in ipairs({models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce1, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce2, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce3, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce4, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce5, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIceEars.ShavedIceEarLeft, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIceEars.ShavedIceEarRight}) do
                                modelPart:setUVPixels(4, 0)
                            end
                        elseif tick == 19 then
                            for _, modelPart in ipairs({models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce1, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce2, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce3, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce4, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce5, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIceEars.ShavedIceEarLeft, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIceEars.ShavedIceEarRight}) do
                                modelPart:setUVPixels(5, 0)
                            end
                        elseif tick == 23 then
                            for _, modelPart in ipairs({models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce1, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce2, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce3, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce4, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIce5, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIceEars.ShavedIceEarLeft, models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIceEars.ShavedIceEarRight}) do
                                modelPart:setUVPixels()
                            end
                        elseif tick == 27 then
                            models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIceFace:setVisible(true)
                            models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIceFace:setUVPixels(8, 0)
                        elseif tick == 28 then
                            models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIceFace:setVisible(false)
                        elseif tick == 29 then
                            models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIceFace:setVisible(true)
                            models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIceFace:setUVPixels(math.random() > 0.95 and 16 or 0, 0)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce), 1, 0.75)
                        elseif tick == 33 or tick == 50 then
                            local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Plate.ShavedIceGroup)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.bucket.empty"), anchorPos, tick == 33 and 1 or 0.25, 0.75)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.bucket.empty"), anchorPos, tick == 33 and 1 or 0.25, 0.5)
                        elseif tick == 52 then
                            models.models.ex_skill_2.Plate:moveTo(models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom)
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Plate.ShavedIceGroup.Wave.WaveScaler:setOffsetPivot(48, 0)
                        elseif tick == 71 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "OPENED", 3, true)
                        elseif tick == 74 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "WORRY", 9, true)
                        elseif tick == 85 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "WORRY", 3, true)
                        elseif tick == 87 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "OPENED", 5, true)
                        elseif tick == 92 then
                            self.parent.faceParts:setEmotion("NORMAL", "CLOSED", "OPENED", 25, true)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.experience_orb.pickup"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.Head.FaceParts.Eyes.ExSkill2SoundAnchor3), 1, 2)
                            if host:isHost() then
                                local windowSize = client:getScaledWindowSize()
                                local center = vectors.vec2(windowSize.x * -0.5, windowSize.y * -0.5)
                                for _ = 1, 100 do
                                    local rot = 2 * math.pi * math.random()
                                    local pos = vectors.vec2(math.cos(rot) * (windowSize.x / 2 * (math.random() * 0.5 + 0.5)) + center.x, math.sin(rot) * (windowSize.y / 2 * (math.random() * 0.5 + 0.5)) + center.y)
                                    self.parent.exSkill2FrameParticleManager:spawn(pos, pos:copy():sub(center):scale(0.1))
                                end
                            end
                        end

                        if tick <= 5 then
                            local particleAnchor1Pos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce):add(0, 1.5, 0)
                            for _ = 1, 2 do
                                particles:newParticle(self.parent.compatibilityUtils.getBlockParticleId(self.parent.compatibilityUtils:checkBlock("minecraft:snow")), particleAnchor1Pos):setPower(0.25):setLifetime(10)
                            end
                        elseif tick <= 26 then
                            local particleAnchor1Pos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce):add(0, 1.5, 0)
                            for _ = 1, 4 do
                                particles:newParticle(self.parent.compatibilityUtils.getBlockParticleId(self.parent.compatibilityUtils:checkBlock("minecraft:light_blue_concrete")), particleAnchor1Pos):setPower(0):setLifetime(10)
                            end
                        end
                        if (tick >= 33 and tick <= 41) or (tick >= 50 and tick <= 61) then
                            local root = tick < 52 and models.models.ex_skill_2.Plate.ShavedIceGroup.Wave.WaveScaler or models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Plate.ShavedIceGroup.Wave.WaveScaler
                            local anchorPos = self.parent.modelUtils.getModelWorldPos(tick < 50 and root.WaveParticleAnchor1 or root.WaveParticleAnchor3)
                            local particleRot = self.parent.modelUtils.getModelWorldPos(tick < 50 and root.WaveParticleAnchor2 or root.WaveParticleAnchor4):sub(anchorPos)
                            for _ = 0, 15 do
                                particles:newParticle(self.parent.compatibilityUtils.getDustParticleId(vectors.vec3(1000000000, 1000000000, 1000000000), 1), anchorPos):setScale(0.5):setColor(math.random() * 0.5 + 0.5, 1, 1):setVelocity(math.random() * 0.1 - 0.05, math.random() * 0.1 + 0.05, math.random() * 0.1 - 0.05):setGravity(0.5):setLifetime(20)
                                anchorPos:add(particleRot)
                            end
                        end

                        if tick % 4 then
                            local modelPart = tick < 52 and models.models.ex_skill_2.Plate.ShavedIceGroup.Wave or models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Plate.ShavedIceGroup.Wave
                            modelPart:setUVPixels(0, tick * 4 * 16)
                        end
                    end;

                    onPostAnimation = function (self, forcedStop)
                        if models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Plate ~= nil then
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Plate:moveTo( models.models.ex_skill_2)
                        end
                        models.models.ex_skill_2.Plate.ShavedIceGroup.ShavedIce.ShavedIce2.ShavedIceFace:setVisible(false)
                        models.models.ex_skill_2.Plate.ShavedIceGroup.Wave.WaveScaler:setOffsetPivot()
                        if host:isHost() then
                            events.RENDER:remove("ex_skill_2_render")
                            self.parent.exSkill2FrameParticleManager:removeAll()
                        end
                    end;

                    onPostTransition = function ()
                        for _, modelPart in ipairs({models.models.ex_skill_2.Stall, models.models.ex_skill_2.SoftCream}) do
                            modelPart:setVisible(false)
                        end
                    end;
                };

                ---初期化処理が行われたかどうか
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

                {
                    name = "swimsuit";

                    displayName = {
                        en_us = "Swimsuit";
                        ja_jp = "水着";
                    };

                    exSkill = 2;
                };
            };

            callbacks = {
                onChange = function (self)
                    self.parent.costume.setCostumeTextureOffset(1)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.Brim, models.models.main.Avatar.UpperBody.Body.BackRibbon, models.models.main.Avatar.UpperBody.Body.Skirt, models.models.main.Avatar.UpperBody.Body.Hairs, models.models.main.Avatar.UpperBody.Arms.RightArm.RightSleeveTop, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeveBottom, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftSleeveTop, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftSleeveBottom}) do
                        modelPart:setVisible(false)
                    end

                    for _, modelPart in ipairs({models.models.main.Avatar.Head.CSwimsuitH, models.models.main.Avatar.UpperBody.Body.CSwimsuitB, models.models.main.Avatar.Head.CSwimsuitH.Brim, models.models.main.Avatar.Head.CSwimsuitH.EarAccessories}) do
                        modelPart:setVisible(true)
                    end
                end;

                onReset = function ()
                    for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Hairs, models.models.main.Avatar.UpperBody.Arms.RightArm.RightSleeveTop, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeveBottom, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftSleeveTop, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftSleeveBottom, models.models.main.Avatar.Head.Brim, models.models.main.Avatar.UpperBody.Body.BackRibbon, models.models.main.Avatar.UpperBody.Body.Skirt}) do
                        modelPart:setVisible(true)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.CSwimsuitH, models.models.main.Avatar.UpperBody.Body.CSwimsuitB}) do
                        modelPart:setVisible(false)
                    end
                end;

                onArmorChange = function (self, parts, isVisible)
                    if parts == "HELMET" then
                        if isVisible then
                            for _, modelPart in ipairs({models.models.main.Avatar.Head.Brim, models.models.main.Avatar.Head.HairTails, models.models.main.Avatar.Head.CSwimsuitH.Brim, models.models.main.Avatar.Head.CSwimsuitH.EarAccessories}) do
                                modelPart:setVisible(false)
                            end
                        else
                            models.models.main.Avatar.Head.HairTails:setVisible(true)
                            if self.parent.costume.currentCostume == 1 then
                                models.models.main.Avatar.Head.Brim:setVisible(true)
                            elseif self.parent.costume.currentCostume == 2 then
                                for _, modelPart in ipairs({models.models.main.Avatar.Head.CSwimsuitH.Brim, models.models.main.Avatar.Head.CSwimsuitH.EarAccessories}) do
                                    modelPart:setVisible(true)
                                end
                            end
                        end
                    elseif parts == "CHEST_PLATE" then
                        if isVisible then
                            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.BackRibbon, models.models.main.Avatar.UpperBody.Body.Skirt}) do
                                modelPart:setVisible(false)
                            end
                            models.models.main.Avatar.UpperBody.Body.Hairs.FrontHair:setPos(0, 0, -1)
                            models.models.main.Avatar.UpperBody.Body.Hairs.BackHair:setPos(0, 0, 1)
                            self.physics.physicData[1].x.vertical.neutral = 0
                            self.physics.physicData[1].x.vertical.max = 0
                            self.physics.physicData[1].x.vertical.bodyX.max = 0
                            self.physics.physicData[1].x.vertical.bodyY.max = 0
                            self.physics.physicData[1].x.vertical.bodyRot.max = 0
                            self.physics.physicData[1].x.horizontal.neutral = 0
                            self.physics.physicData[1].x.horizontal.max = 0
                        else
                            if self.parent.costume.currentCostume == 1 then
                                for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.BackRibbon, models.models.main.Avatar.UpperBody.Body.Skirt}) do
                                    modelPart:setVisible(true)
                                end
                            end
                            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Hairs.FrontHair, models.models.main.Avatar.UpperBody.Body.Hairs.BackHair}) do
                                modelPart:setPos()
                            end
                            self.physics.physicData[1].x.vertical.neutral = -10
                            self.physics.physicData[1].x.vertical.max = -10
                            self.physics.physicData[1].x.vertical.bodyX.max = -10
                            self.physics.physicData[1].x.vertical.bodyY.max = -10
                            self.physics.physicData[1].x.vertical.bodyRot.max = -10
                            self.physics.physicData[1].x.horizontal.neutral = -10
                            self.physics.physicData[1].x.horizontal.max = -10
                        end
                    end
                end;
            };
        }

        instance.bubble = {
            callbacks = {
                onPlay = function (self, type, duration)
                    if duration > 0 then
                        if type == "GOOD" then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "OPENED", duration, true)
                        elseif type == "HEART" then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "OPENED", duration, true)
                        elseif type == "NOTE" then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "SMILE", duration, true)
                        elseif type == "QUESTION" then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "WORRY", duration, true)
                        elseif type == "SWEAT" then
                            self.parent.faceParts:setEmotion("SURPRISED", "SURPRISED", "TRIANGLE", duration, true)
                            models.models.main.Avatar.Head.FaceLayer:setVisible(true)
                        end
                    end
                end;

                onStop = function (self, _, forcedStop)
                    if not forcedStop then
                        self.parent.faceParts:resetEmotion()
                    end
                    models.models.main.Avatar.Head.FaceLayer:setVisible(false)
                end;
            }
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
                    if costume == 1 then
                        dummyAvatar.UpperBody.Body.Skirt:setRot(35, 0, 0)
                    elseif costume == 2 then
                        dummyAvatar.Head.CSwimsuitH.HairTailsBottom.HairTailBottomRight:setRot(29.3063, 5.6842, -13.9042)
                        dummyAvatar.Head.CSwimsuitH.HairTailsBottom.HairTailBottomLeft:setRot(29.3063, -5.6842, 13.9042)
                    end
                end;

                onPhase2 = function (_, dummyAvatar, costume)
                    if costume == 1 then
                        dummyAvatar.UpperBody.Body.Skirt:setRot(15, 0, 0)
                    elseif costume == 2 then
                        dummyAvatar.Head.CSwimsuitH.HairTailsBottom.HairTailBottomRight:setRot(1.5523, -7.3011, -23.9759)
                        dummyAvatar.Head.CSwimsuitH.HairTailsBottom.HairTailBottomLeft:setRot(-10.0014, -13.1248, -21.4687)
                    end
                end
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
                            min = 0;
                            neutral = 0;
                            max = 150;
                            sneakOffset = 30;

                            bodyX = {
                                multiplayer = -80;
                                min = 0;
                                max = 90;
                            };

                            bodyY = {
                                multiplayer = -80;
                                min = 0;
                                max = 150;
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
                            max = 150;

                            bodyX = {
                                multiplayer = -80;
                                min = 0;
                                max = 150;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.HairTails.HairTailLeft};

                    z = {
                        vertical = {
                            min = 20;
                            neutral = 30;
                            max = 140;

                            bodyY = {
                                multiplayer = -80;
                                min = 20;
                                max = 140;
                            };
                        };

                        horizontal = {
                            min = 20;
                            neutral = 30;
                            max = 140;

                            bodyX = {
                                multiplayer = -80;
                                min = 20;
                                max = 140;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.HairTails.HairTailRight};

                    z = {
                        vertical = {
                            min = -140;
                            neutral = -30;
                            max = -20;

                            bodyY = {
                                multiplayer = 80;
                                min = -140;
                                max = -20;
                            };
                        };

                        horizontal = {
                            min = -140;
                            neutral = -30;
                            max = -20;

                            bodyX = {
                                multiplayer = 80;
                                min = -140;
                                max = -20;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.Brim.BrimRibbon.BrimLines.BrimLineLeft, models.models.main.Avatar.Head.Brim.BrimRibbon.BrimLines.BrimLineRight, models.models.main.Avatar.Head.CSwimsuitH.Brim.BrimRibbonRight.BrimLines.BrimLineLeft, models.models.main.Avatar.Head.CSwimsuitH.Brim.BrimRibbonRight.BrimLines.BrimLineRight};

                    x = {
                        vertical = {
                            min = 0;
                            neutral = 0;
                            max = 150;
                            headRotMultiplayer = -1;

                            headX = {
                                multiplayer = -160;
                                min = 0;
                                max = 90;
                            };

                            headRot = {
                                multiplayer = -0.1;
                                min = 0;
                                max = 90;
                            };

                            bodyY = {
                                multiplayer = -160;
                                min = 0;
                                max = 150;
                            };
                        };

                        horizontal = {
                            min = 0;
                            neutral = 45;
                            max = 150;

                            headX = {
                                multiplayer = -16;
                                min = 0;
                                max = 150;
                            };
                        };
                    };

                    z = {
                        vertical = {
                            min = -60;
                            neutral = 0;
                            max = 0;

                            headZ = {
                                multiplayer = -160;
                                min = -60;
                                max = 0;
                            };
                        };

                        horizontal = {
                            min = -60;
                            neutral = 0;
                            max = 0;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CSwimsuitH.HairTailsBottom.HairTailBottomLeft};
                    x = {
                        vertical = {
                            min = -150;
                            neutral = -7.5;
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
                                min = -150;
                                max = -7.5;
                            };
                        };

                        horizontal = {
                            min = -150;
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
                            neutral = 5;
                            max = 70;

                            headZ = {
                                multiplayer = -80;
                                min = -70;
                                max = 70;
                            };
                        };

                        horizontal = {
                            min = -150;
                            neutral = 20;
                            max = 70;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CSwimsuitH.HairTailsBottom.HairTailBottomRight};

                    x = {
                        vertical = {
                            min = -150;
                            neutral = -7.5;
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
                                min = -150;
                                max = -7.5;
                            };
                        };

                        horizontal = {
                            min = -150;
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
                            neutral = -5;
                            max = 70;

                            headZ = {
                                multiplayer = -80;
                                min = -70;
                                max = 70;
                            };
                        };

                        horizontal = {
                            min = -150;
                            neutral = -20;
                            max = 70;
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