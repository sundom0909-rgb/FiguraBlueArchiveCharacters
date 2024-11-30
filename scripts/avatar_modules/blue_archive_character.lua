---@alias BlueArchiveCharacter.RightEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "ANGRY" # 上釣り目
---| "CLOSED2" # 横棒

---@alias BlueArchiveCharacter.LeftEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "ANGRY" # 怒った目
---| "CLOSED2" # 横棒

---@alias BlueArchiveCharacter.MouthTextures
---| "NORMAL" # 通常
---| "OPENED" # 開いた口
---| "CIRCLE" # 丸口
---| "SMILE" # にっこり
---| "SAD" # への口

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
---| "SWIMSUIT" # 水着

--[[ ******************************** ]]

---@class BlueArchiveCharacter : AvatarModule キャラクター変数を保持するクラス。別のキャラクターに対してもここを変更するだけで対応できるようにする。
---@field public basic BlueArchiveCharacter.BasicStruct 生徒の基本情報
---@field public faceParts BlueArchiveCharacter.instance.parent.facePartsStruct 目や口による表情
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

---@class BlueArchiveCharacter.instance.parent.facePartsStruct 目や口による表情のデータ構造体。UVマッピング情報は、デフォルトパーツから見て左からx番目、上からy番目とする。
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
---@field public callbacks BlueArchiveCharacter.DataSyncCallbacks データ同期のコールバック関数

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
---@field public onBeforeModelCopy? fun(self: BlueArchiveCharacter) モデルのコピー直前に実行される関数
---@field public onAfterModelCopy? fun(self: BlueArchiveCharacter) モデルのコピー直後に実行される関数

---@class (exact) BlueArchiveCharacter.DeathAnimationCallbacks 死亡アニメーションのコールバック関数のセット
---@field public onPhase1? fun(self: BlueArchiveCharacter, dummyAvatar: ModelPart, costume: BlueArchiveCharacter.Costumes) 死亡アニメーションが再生された直後に実行される関数
---@field public onPhase2? fun(self: BlueArchiveCharacter, dummyAvatar: ModelPart, costume: BlueArchiveCharacter.Costumes) ダミーアバターが縄ばしごにつかまった直後に実行される関数
---@field public onBeforeModelCopy? fun(self: BlueArchiveCharacter) モデルのコピー直前に実行される関数
---@field public onAfterModelCopy? fun(self: BlueArchiveCharacter) モデルのコピー直後に実行される関数

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
                en_us = "Izuna";
                ja_jp = "イズナ";
            };

            lastName = {
            en_us = "Kuda";
            ja_jp = "久田";
            };

            clubName = {
                en_us = "Ninjutsu Research Club";
                ja_jp = "忍術研究部";
            };

            birth = {
                month = 12;
                day = 16;
            };
        }

        instance.faceParts = {
            rightEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(2, 0); --必須
                TIRED = vectors.vec2(3, 0); --必須
                CLOSED = vectors.vec2(4, 0); --必須
                ANGRY = vectors.vec2(5, 0);
                CLOSED2 = vectors.vec2(7, 0);
            };

            leftEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(1, 0); --必須
                TIRED = vectors.vec2(2, 0); --必須
                CLOSED = vectors.vec2(3, 0); --必須
                ANGRY = vectors.vec2(5, 0);
                CLOSED2 = vectors.vec2(6, 0);
            };

            mouth = {
                OPENED = vectors.vec2(1, 0);
                CIRCLE = vectors.vec2(2, 0);
                SMILE = vectors.vec2(3, 0);
                SAD = vectors.vec2(2, 1);
            };
        }

        instance.arms = {

        }

        instance.skirt = {
            skirtModels = {models.models.main.Avatar.UpperBody.Body.Skirt};
        }

        instance.gun = {
            scale = 1.2;

            gunPosition = {
                hold = {
                    type = "NORMAL";

                    firstPersonPos = {
                        right = vectors.vec3(0, 2, -6);
                        left = vectors.vec3(2.25, 2, -6);
                    };

                    thirdPersonPos = {
                        right = vectors.vec3(-1, 0, -7);
                        left = vectors.vec3(3, 0, -7);
                    }
                };

                put = {
                    type = "BODY";

                    pos = {
                        right = vectors.vec3(0, 1, 3);
                        left = vectors.vec3(2, 1, 3);
                    };

                    rot = {
                        right = vectors.vec3(-20, 90, 0);
                        left = vectors.vec3(-20, -90, 0);
                    };
                };
            };

            sound = {
                name = "minecraft:entity.firework_rocket.blast";
                pitch = 0.75;
            };
        }

        instance.placementObjects = {
            {
                model = models.models.ex_skill_1.PlacementObject;

                boundingBox = {
                    size = vectors.vec3(12, 19, 12)
                };

                placementMode = "MOVE";

                callbacks = {
                    onInit = function ()
                        animations["models.ex_skill_1"]["swing"]:play()
                    end;
                };
            };
        }

        instance.exSkill = {
            {
                name = {
                    en_us = "This is The Izuna-Style Ninjutsu!";
                    ja_jp = "これぞイズナ流忍法！";
                };

                formationType = "STRIKER";

                models = {};

                animations = {"main"};

                camera = {
                    start = {
                        rot = vectors.vec3(10, -160, 10);
                        pos = vectors.vec3(-36.3, 26, -27);
                    };

                    fin = {
                        rot = vectors.vec3(-50, -160, 0);
                        pos = vectors.vec3(-3, 16, -104);
                    };

                    fixMode = true;
                };

                callbacks = {
                    onPreTransition = function (self)
                        self.parent.placementObjectManager:removeAll()
                    end;

                    onAnimationTick = function (self, tick)
                        if tick == 0 then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "NORMAL", 19, true)
                        elseif tick == 19 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "NORMAL", 3, true)
                        elseif tick == 22 then
                            self.parent.faceParts:setEmotion("ANGRY", "ANGRY", "CIRCLE", 5, true)
                        elseif tick == 27 then
                            self.parent.faceParts:setEmotion("ANGRY", "ANGRY", "SMILE", 24, true)
                        elseif tick == 29 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.attack.weak"), player:getPos(), 0.5, 1.5)
                        elseif tick == 31 then
                            self.parent.textObjectManager:spawn(vectors.vec2(2, 5.5), "神")
                        elseif tick == 34 then
                            self.parent.textObjectManager:spawn(vectors.vec2(2, 0.5), "出")
                        elseif tick == 35 or tick == 40 or tick == 43 or tick == 48 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.attack.weak"), player:getPos(), 0.25, 1.5)
                        elseif tick == 38 then
                            self.parent.textObjectManager:spawn(vectors.vec2(-5.5, 5.5), "鬼")
                        elseif tick == 41 then
                            self.parent.textObjectManager:spawn(vectors.vec2(-5.5, 0.5), "没")
                        elseif tick == 49 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.attack.sweep"), player:getPos(), 0.5, 1.5)
                        elseif tick == 50 and host:isHost() then
                            models.models.main.CameraBackground:setVisible(true)
                            local backgroundPos = vectors.rotateAroundAxis(player:getBodyYaw() + 180, renderer:getCameraOffsetPivot():copy():add(0, 1.62, 0):add(client:getCameraDir():copy():scale(1.75)), 0, 1, 0):scale(16 / 0.9375)
                            models.models.main.CameraBackground:setOffsetPivot(backgroundPos)
                            models.models.main.CameraBackground.Background:setPos(backgroundPos)
                            local windowSize = client:getWindowSize()
                            models.models.main.CameraBackground.Background:setScale(vectors.vec3(windowSize.x / windowSize.y, 1, 1):scale(40))
                            models.models.main.Avatar:setColor(0, 0, 0)
                            self.parent.textObjectManager:setBlack(true)
                            renderer:setPostEffect("invert")
                        elseif tick == 51 then
                            self.parent.faceParts:setEmotion("ANGRY", "ANGRY", "CIRCLE", 10, true)
                        elseif tick == 53 and host:isHost() then
                            models.models.main.CameraBackground:setVisible(false)
                            models.models.main.Avatar:setColor(1, 1, 1)
                            self.parent.textObjectManager:setBlack(false)
                            renderer:setPostEffect()
                        elseif tick == 58 then
                            local playerPos = player:getPos()
                            for _ = 1, 70 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:poof"), playerPos:copy():add(math.random() * 2 - 1, math.random() * 3 - 0.5, math.random() * 2 - 1))
                            end
                        elseif tick == 61 then
                            self.parent.textObjectManager:removeAll()
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "OPENED", 12, true)
                        elseif tick == 73 then
                            self.parent.faceParts:setEmotion("NORMAL", "CLOSED", "OPENED", 27, true)
                            local avatarPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar)
                            for _ = 1, 100 do
                                local offset = vectors.vec3(math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1)
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:cherry_leaves"), avatarPos:copy():add(offset)):setVelocity(offset:scale(0.1))
                            end
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.armor.equip_leather"), avatarPos)
                        elseif tick == 98 then
                            if math.random() >= 0.95 then
                                self.placementObjects[1].model:setPrimaryTexture("RESOURCE", "textures/entity/fox/snow_fox.png")
                            else
                                self.placementObjects[1].model:setPrimaryTexture("PRIMARY")
                            end
                            self.parent.placementObjectManager:spawn(1, self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), player:getBodyYaw() * -1 + 180)
                        end
                        if tick <= 10 then
                            local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.main.ExSkill1Anchor1)
                            local velocityRot = vectors.rotateAroundAxis(-player:getBodyYaw(), -0.1, 0, 0, 0, 1, 0)
                            for _ = 1, 2 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:cherry_leaves"), anchorPos:copy():add(math.random() * 3 -  1.5, math.random() * 3, math.random() * 3 - 1.5)):setVelocity(velocityRot)
                            end
                        end
                    end;

                    onPostAnimation = function (self, forcedStop)
                        if forcedStop then
                            self.parent.textObjectManager:removeAll()
                            if host:isHost() then
                                models.models.main.CameraBackground:setVisible(false)
                                models.models.main.Avatar:setColor(1, 1, 1)
                            end
                        end
                    end;
                };
            };

            {
                name = {
                    en_us = "Izuna-Style Ninjutsu・Summer Version!";
                    ja_jp = "イズナ流忍法・夏バージョン";
                };

                formationType = "STRIKER";

                models = {models.models.costume_swimsuit.BeachBall};

                animations = {"main", "costume_swimsuit"};

                camera = {
                    start = {
                        rot = vectors.vec3(0, -160, -10);
                        pos = vectors.vec3(-6, 30, -60);
                    };

                    fin = {
                        rot = vectors.vec3(-10, -150, -10);
                        pos = vectors.vec3(-4, 154, -350);
                    };

                    fixMode = true;
                };

                callbacks = {
                    onAnimationTick = function (self, tick)
                        if tick < 25 then
                            if tick == 0 then
                                self.parent.faceParts:setEmotion("ANGRY", "ANGRY", "NORMAL", 19, true)
                            elseif tick == 19 then
                                self.parent.faceParts:setEmotion("ANGRY", "ANGRY", "CIRCLE", 2, true)
                            elseif tick == 21 then
                                self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "CIRCLE", 22, true)
                            end
                            local anchor1Pos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.ExSkill2Anchor1)
                            local particleBlock = world.getBlockState(anchor1Pos:copy() - 1).id
                            if particleBlock ~= "minecraft:air" and particleBlock ~= "minecraft:void_air" then
                                for _ = 1, 50 do
                                    particles:newParticle(self.parent.compatibilityUtils.getBlockParticleId(particleBlock), anchor1Pos:copy():add(math.random() - 0.5, 0, math.random() - 0.5)):setVelocity(math.random() * 0.5 - 0.25, math.random() * 0.5, math.random() * 0.5 - 0.25)
                                end
                            end
                        elseif tick == 25 then
                            models.models.main.Avatar:setVisible(false)
                            local anchor1Pos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.ExSkill2Anchor1)
                            for _ = 1, 30 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:poof"), anchor1Pos:copy():add(math.random() - 0.5, math.random() * 2, math.random() - 0.5))
                            end
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.bat.takeoff"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 1, 2)
                        elseif tick == 28 then
                            renderer:setPostEffect("phosphor")
                        elseif tick == 38 then
                            renderer:setPostEffect()
                        elseif tick == 43 then
                            models.models.main.Avatar:setVisible(true)
                            self.parent.faceParts:setEmotion("ANGRY", "ANGRY", "SMILE", 42, true)
                        elseif tick == 44 then
                            local avatarPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar):add(0, -1.5, 0)
                            for _ = 1, 30 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:poof"), avatarPos:copy():add(math.random() - 0.5, math.random() * 2, math.random() - 0.5))
                            end
                        elseif tick >= 45 and tick <= 60 then
                            local avatarPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Body)
                            if tick == 45 then
                                local bodyYaw = player:getBodyYaw()
                                local particleDirection = vectors.rotateAroundAxis(-bodyYaw, vectors.rotateAroundAxis(40, 0, 0, 1, 1, 0, 0), 0, 1, 0)
                                for i = 1, 30 do
                                    for j = 0.7, 1.5, 0.1 do
                                        particles:newParticle(self.parent.compatibilityUtils.getDustParticleId(vectors.vec3(100, 1000000000, 1000000000), 1), vectors.rotateAroundAxis(-bodyYaw, vectors.rotateAroundAxis(40, math.cos(math.rad(i * 12)) * j, math.sin(math.rad(i * 12)) * j, 0, 1, 0, 0), 0, 1, 0):add(avatarPos)):setVelocity(particleDirection:copy():scale(math.random() * 0.1 + 0.2)):setLifetime(math.random() * 10 + 10)
                                    end
                                    local particlePos = vectors.rotateAroundAxis(-bodyYaw, vectors.rotateAroundAxis(40, math.cos(math.rad(i * 12)) * 1.5, math.sin(math.rad(i * 12)) * 1.5, 0, 1, 0, 0), 0, 1, 0):add(avatarPos)
                                    particles:newParticle(self.parent.compatibilityUtils.getDustParticleId(vectors.vec3(100, 1000000000, 1000000000), 1), particlePos):setVelocity(particleDirection:copy():scale(math.random() * 0.1 + 0.2)):setLifetime(math.random() * 10 + 10)
                                end
                            end
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.bucket.empty"), avatarPos, 1 - math.map(tick, 45, 60, 0, 0.5), 0.75)
                        elseif tick == 79 and host:isHost() then
                            models.models.main.CameraBackground:setVisible(true)
                            local windowSize = client:getWindowSize()
                            models.models.main.CameraBackground.Background:setScale(vectors.vec3(windowSize.x / windowSize.y, 1, 1):scale(45))
                            events.RENDER:register(function (delta, context)
                                models.models.main.CameraBackground:setVisible(context == "RENDER")
                                local backgroundPos = vectors.rotateAroundAxis(player:getBodyYaw(delta) + 180, renderer:getCameraOffsetPivot():copy():add(0, 1.62, 0):add(client:getCameraDir():copy():scale(2)), 0, 1, 0):scale(16 / 0.9375)
                                models.models.main.CameraBackground:setOffsetPivot(backgroundPos)
                                models.models.main.CameraBackground.Background:setPos(backgroundPos)
                            end, "ex_skill_2_background_render")
                            models.models.main.Avatar:setColor(0, 0, 0)
                            for _, modelPart in ipairs({models.models.main.Avatar, models.models.costume_swimsuit.BeachBall}) do
                                modelPart:setColor(0, 0, 0)
                            end
                        elseif tick == 80 then
                            renderer:setPostEffect("invert")
                        elseif tick == 84 then
                            renderer:setPostEffect()
                        elseif tick == 85 then
                            self.parent.faceParts:setEmotion("ANGRY", "ANGRY", "OPENED", 16, true)
                            models.models.costume_swimsuit.BeachBall:setUVPixels(0, 7)
                            models.models.costume_swimsuit.BeachBall:setPrimaryRenderType("EMISSIVE_SOLID")
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.blaze.death"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 1, 2)
                        elseif tick == 86 then
                            local bodyYaw = player:getBodyYaw()
                            local anchor2Pos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.Legs.RightLeg.RightLegBottom.ExSkill2Anchor2):add(vectors.rotateAroundAxis(-bodyYaw, -0.1, 0, 0, 0, 1, 0)):add(0, 0.4, 0)
                            local particleAxis = vectors.rotateAroundAxis(-bodyYaw, vectors.rotateAroundAxis(30, 0, 0, 1, 1, 0, 0), 0, 1, 0)
                            local particleVelocityDirection = vectors.rotateAroundAxis(-bodyYaw, vectors.rotateAroundAxis(-50, 0, 0, 1, 1, 0, 0), 0, 1, 0)
                            for i = 1, 60 do
                                local currentParticleVelocityDirection = vectors.rotateAroundAxis(i * 6, particleVelocityDirection, particleAxis)
                                for _, particleData in ipairs({{0.5, 0.4, 0.1}, {0.25, 0.6, 0.025}, {0.375, 2, 0.05}}) do --[1]. 輪っかの半径, [2]. 輪っかの位置のスケール, [3]. 輪っかの拡散速度のスケール
                                    particles:newParticle(self.parent.compatibilityUtils.getDustParticleId(vectors.vec3(1000000000, 0, 0), 1), vectors.rotateAroundAxis(i * 6, 0, particleData[1], 0, particleAxis):add(anchor2Pos):add(0, -0.3, 0):add(particleAxis:copy():scale(particleData[2]))):setVelocity(currentParticleVelocityDirection:copy():scale(particleData[3])):setLifetime(20)
                                    particles:newParticle(self.parent.compatibilityUtils.getDustParticleId(vectors.vec3(0, 0, 0), 1), vectors.rotateAroundAxis(i * 6, 0, particleData[1] * 1.5, 0, particleAxis):add(anchor2Pos):add(0, -0.3, 0):add(particleAxis:copy():scale(particleData[2]))):setVelocity(currentParticleVelocityDirection:copy():scale(particleData[3])):setLifetime(20)
                                end
                            end
                            if host:isHost() then
                                models.models.main.CameraBackground:setVisible(false)
                                events.RENDER:remove("ex_skill_2_background_render")
                                for _, modelPart in ipairs({models.models.main.Avatar, models.models.costume_swimsuit.BeachBall}) do
                                    modelPart:setColor()
                                end
                            end
                        elseif tick >= 101 then
                            local bodyYaw = player:getBodyYaw()
                            local anchor2Pos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.Legs.RightLeg.RightLegBottom.ExSkill2Anchor2):add(vectors.rotateAroundAxis(-bodyYaw, -0.1, 0, 0, 0, 1, 0)):add(0, -0.3, 0)
                            local particleAxis = vectors.rotateAroundAxis(-bodyYaw, vectors.rotateAroundAxis(30, 0, 0, 1, 1, 0, 0), 0, 1, 0)
                            local particleVelocityDirection = vectors.rotateAroundAxis(-bodyYaw, vectors.rotateAroundAxis(-50, 0, 0, 1, 1, 0, 0), 0, 1, 0)
                            if tick == 101 then
                                self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "OPENED", 42, true)
                                models.models.costume_swimsuit.BeachBall:setUVPixels(0, 14)
                                for i = 1, 60 do
                                    local currentParticleVelocityDirection = vectors.rotateAroundAxis(i * 6, particleVelocityDirection, particleAxis)
                                    for _, particleData in ipairs({{0.3, 3.5, 0.01, 0.5}, {0.5, 3.5, 0.01, 0.5}, {0.25, 7.9, 0.003, 0.2}, {0.28, 7.89, 0.003, 0.2}, {0.45, 7.85, 0.003, 0.5}}) do --[1]. 輪っかの半径, [2]. 輪っかの位置のスケール, [3]. 輪っかの拡散速度のスケール, [4]. 輪っかのパーティクルの大きさ
                                        particles:newParticle(self.parent.compatibilityUtils.getDustParticleId(vectors.vec3(1000000000, 1, 1), particleData[4]), vectors.rotateAroundAxis(i * 6, 0, particleData[1], 0, particleAxis):add(anchor2Pos):add(particleAxis:copy():scale(particleData[2]))):setVelocity(currentParticleVelocityDirection:copy():scale(particleData[3])):setLifetime(45)
                                    end
                                end
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.lightning_bolt.thunder"), self.parent.modelUtils.getModelWorldPos(models.models.costume_swimsuit.BeachBall), 1, 2)
                            end
                            for _ = 1, 10 do
                                particles:newParticle(self.parent.compatibilityUtils.getDustParticleId(vectors.vec3(1000000000, 1, 1), 1), anchor2Pos:copy():add(particleAxis:copy():scale(7.5)):add(vectors.rotateAroundAxis(-bodyYaw, -0.3, 0, 0, 0, 1, 0)):add(math.random() * 0.2 - 0.1, math.random() * 0.2 - 0.1 - 0.4, math.random() * 0.2 - 0.1)):setVelocity(particleAxis:copy():scale(-1))
                            end
                        end
                        if tick <= 28 and tick % 4 == 0 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.sand.step"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar))
                        end
                    end;

                    onPostAnimation = function (_, forcedStop)
                        models.models.main.Avatar:setVisible(true)
                        models.models.costume_swimsuit.BeachBall:setUVPixels()
                        models.models.costume_swimsuit.BeachBall:setPrimaryRenderType("CUTOUT")
                        if host:isHost() then
                            models.models.main.CameraBackground.Background:setColor()
                            models.models.main.CameraBackground.Background:setOpacity(1)
                            if forcedStop then
                                events.RENDER:remove("ex_skill_2_background_render")
                                models.models.main.CameraBackground:setVisible(false)
                                for _, modelPart in ipairs({models.models.main.Avatar, models.models.costume_swimsuit.BeachBall}) do
                                    modelPart:setColor()
                                end
                                renderer:setPostEffect()
                            end
                        end
                    end;
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

                    exSkill = 2;
                };
            };

            callbacks = {
                onChange = function (self)
                    self.parent.costume.setCostumeTextureOffset(1)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.HairAccessories.FoxAccessory, models.models.main.Avatar.UpperBody.Body.Skirt, models.models.main.Avatar.UpperBody.Body.Scarfs, models.models.main.Avatar.UpperBody.Body.BackRibbon, models.models.main.Avatar.UpperBody.Arms.RightArm.RightSleeveTop, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeveBottom, models.models.main.Avatar.LowerBody.Legs.RightLeg.Kunais}) do
                        modelPart:setVisible(false)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.CSwimsuitB, models.models.main.Avatar.Head.CSwimsuitH, models.models.main.Avatar.LowerBody.Legs.LeftLeg.CSwimsuitLL}) do
                        modelPart:setVisible(true)
                    end
                    models.models.main.Avatar.Head.CSwimsuitH.SunflowerAccessory.Sunflower:setPrimaryTexture("RESOURCE", "textures/block/sunflower_front.png")

                    events.RENDER:register(function ()
                        if models.models.main.Avatar.LowerBody.Legs.LeftLeg.CSwimsuitLL:getVisible() then
                            models.models.main.Avatar.LowerBody.Legs.LeftLeg.CSwimsuitLL:setRot((vanilla_model.LEFT_LEG:getOriginRot().x + models.models.main.Avatar.LowerBody.Legs.LeftLeg:getTrueRot().x) * -1, 0, 0)
                        end
                    end, "costume_swimsuit_render")
                end;

                onReset = function (self)
                    events.RENDER:remove("costume_swimsuit_render")
                    self.parent.costume.setCostumeTextureOffset(0)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.HairAccessories.FoxAccessory, models.models.main.Avatar.UpperBody.Body.Scarfs, models.models.main.Avatar.UpperBody.Arms.RightArm.RightSleeveTop, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeveBottom, models.models.main.Avatar.LowerBody.Legs.RightLeg.Kunais, models.models.main.Avatar.UpperBody.Body.Skirt, models.models.main.Avatar.UpperBody.Body.BackRibbon}) do
                        modelPart:setVisible(true)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.CSwimsuitH, models.models.main.Avatar.UpperBody.Body.CSwimsuitB, models.models.main.Avatar.LowerBody.Legs.LeftLeg.CSwimsuitLL}) do
                        modelPart:setVisible(false)
                    end
                end;

                onArmorChange = function (self, parts, isVisible)
                    if parts == "HELMET" then
                        if isVisible then
                            models.models.main.Avatar.Head.CSwimsuitH:setVisible(false)
                        else
                            models.models.main.Avatar.Head.CSwimsuitH:setVisible(self.parent.costume.currentCostume == 2)
                        end
                    elseif parts == "CHEST_PLATE" then
                        if isVisible then
                            models.models.main.Avatar.UpperBody.Body.Scarfs:setPos(0, 0, 1)
                            models.models.main.Avatar.UpperBody.Body.CSwimsuitB:setPos(0, 0, -1)
                            models.models.main.Avatar.UpperBody.Body.BackRibbon:setVisible(false)
                        else
                            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Scarfs, models.models.main.Avatar.UpperBody.Body.CSwimsuitB}) do
                                modelPart:setPos()
                            end
                            models.models.main.Avatar.UpperBody.Body.BackRibbon:setVisible(self.parent.costume.currentCostume == 1 and not isVisible)
                        end
                    elseif parts == "LEGGINGS" then
                        if isVisible then
                            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Skirt, models.models.main.Avatar.LowerBody.Legs.LeftLeg.CSwimsuitLL}) do
                                modelPart:setVisible(false)
                            end
                            models.models.main.Avatar.UpperBody.Body.BackRibbon:setVisible(false)
                        else
                            models.models.main.Avatar.UpperBody.Body.Skirt:setVisible(self.parent.costume.currentCostume == 1)
                            models.models.main.Avatar.LowerBody.Legs.LeftLeg.CSwimsuitLL:setVisible(self.parent.costume.currentCostume == 2)
                            models.models.main.Avatar.UpperBody.Body.BackRibbon:setVisible(self.parent.costume.currentCostume == 1 and not isVisible)
                        end
                    end
                end;
            };
        }

        instance.bubble = {
            callbacks = {
                onPlay = function(self, type, duration)
                    if duration > 0 then
                        if type == "GOOD" then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "OPENED", duration, true)
                        elseif type == "HEART" then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "OPENED", duration, true)
                        elseif type == "NOTE" then
                            self.parent.faceParts:setEmotion("ANGRY", "ANGRY", "OPENED", duration, true)
                        elseif type == "QUESTION" then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "SAD", duration, true)
                        elseif type == "SWEAT" then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "SAD", duration, true)
                        end
                    end
                end;

                onStop = function(self, _, forcedStop)
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
                onPhase1 = function (_, dummyAvatar, costume)
                    dummyAvatar.Head.Ears.RightEarPivot:setRot(-49.02, -11.44, -9.77)
                    dummyAvatar.Head.Ears.LeftEarPivot:setRot(-49.02, 11.44, 9.77)
                    dummyAvatar.Head.HairAccessories.HairAccessoryRight.HairTail:setRot(30, 0, 0)
                    dummyAvatar.Head.HairAccessories.HairAccessoryRight.Braid:setRot(30, 0, 0)
                    dummyAvatar.UpperBody.Body.Tail:setRot(25, 0, 0)
                    if costume == 1 then
                        dummyAvatar.UpperBody.Body.Skirt:setRot(30, 0, 0)
                        dummyAvatar.UpperBody.Body.Scarfs.Scarf1:setRot(40, 0, 0)
                        dummyAvatar.UpperBody.Body.Scarfs.Scarf2:setRot(40, 0, 0)
                    end
                end;

                onPhase2 = function (_, dummyAvatar, costume)
                    dummyAvatar.Head.HairAccessories.HairAccessoryRight.HairTail:setRot(-15, 0, 0)
                    dummyAvatar.Head.HairAccessories.HairAccessoryRight.Braid:setRot(-15, 0, 0)
                    dummyAvatar.UpperBody.Body.Tail:setRot(30, 0, 0)
                    if costume == 1 then
                        dummyAvatar.UpperBody.Body.Scarfs.Scarf1:setRot(75, 20, 0)
                        dummyAvatar.UpperBody.Body.Scarfs.Scarf1.Scarf1YPivot:setRot(0, 0, -20)
                        dummyAvatar.UpperBody.Body.Scarfs.Scarf2:setRot(75, 20, 0)
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
                    models = {models.models.main.Avatar.UpperBody.Body.Scarfs.Scarf1, models.models.main.Avatar.UpperBody.Body.Scarfs.Scarf2};

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
                                multiplayer = 20;
                                min = -15;
                                max = 0;
                            };

                            bodyZ = {
                                multiplayer = -80;
                                min = -80;
                                max = 70;
                            };

                            bodyRot = {
                                multiplayer = -0.01;
                                min = -15;
                                max = 0;
                            };
                        };

                        horizontal = {
                            min = -80;
                            neutral = -15;
                            max = 70;

                            bodyX = {
                                multiplayer = 20;
                                min = 0;
                                max = -15;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.HairAccessories.HairAccessoryRight.HairTail};

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
                                multiplayer = -80;
                                min = -45;
                                max = 45;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.HairAccessories.HairAccessoryRight.HairTail.HairTailZPivot};

                    z = {
                        vertical = {
                            min = 0;
                            neutral = 0;
                            max = 60;

                            headZ = {
                                multiplayer = -80;
                                min = 0;
                                max = 60;
                            };

                            headRot = {
                                multiplayer = -0.05;
                                min = 0;
                                max = 60;
                            };

                            bodyY = {
                                multiplayer = -80;
                                min = 0;
                                max = 60;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.HairAccessories.HairAccessoryRight.Braid};

                    x = {
                        vertical = {
                            min = -90;
                            neutral = 0;
                            max = 90;
                            headRotMultiplayer = -1;

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
                        };
                    };

                    z = {
                        vertical = {
                            min = 0;
                            neutral = 0;
                            max = 60;

                            bodyY = {
                                multiplayer = -80;
                                min = 0;
                                max = 60;
                            };

                            headZ = {
                                multiplayer = -160;
                                min = 0;
                                max = 60;
                            };

                            headRot = {
                                multiplayer = -0.05;
                                min = 0;
                                max = 60;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CSwimsuitH.SunflowerAccessory.WhiteRibbon};

                    z = {
                        vertical = {
                            min = -40;
                            neutral = -20;
                            max = 160;

                            bodyY = {
                                multiplayer = -160;
                                min = -20;
                                max = 160;
                            };

                            headZ = {
                                multiplayer = -160;
                                min = -40;
                                max = 70;
                            };

                            headRot = {
                                multiplayer = -0.1;
                                min = -20;
                                max = 70;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.CSwimsuitB.Scarf};

                    x = {
                        vertical = {
                            min = 0;
                            neutral = 0;
                            max = 90;
                            sneakOffset = 30;

                            bodyX = {
                                multiplayer = -160;
                                min = 0;
                                max = 90;
                            };

                            bodyY = {
                                multiplayer = -160;
                                min = 0;
                                max = 90;
                            };

                            bodyRot = {
                                multiplayer = -0.1;
                                min = 0;
                                max = 90;
                            };
                        };

                        horizontal = {
                            min = 0;
                            neutral = 90;
                            max = 90;

                            headX = {
                                multiplayer = -160;
                                min = 0;
                                max = 90;
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