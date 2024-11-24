---@alias BlueArchiveCharacter.RightEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "NARROW1" # 狭めの目1
---| "NARROW2" # 狭めの目2
---| "CLOSED2" # 横線目
---| "INVERTED" # 反対側を見る目
---| "TEAR" # 横線目+涙
---| "UNEQUAL" # ><

---@alias BlueArchiveCharacter.LeftEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "NARROW1" # 狭めの目1
---| "NARROW2" # 狭めの目2
---| "CLOSED2" # 横線目
---| "INVERTED" # 反対側を見る目
---| "TEAR" # 横線目+涙
---| "UNEQUAL" # ><

---@alias BlueArchiveCharacter.MouthTextures
---| "NORMAL" # 通常
---| "CLOSED" # 閉じた口
---| "SMILE" # にっこり
---| "OPENED" # 開いた口1
---| "ANXIOUS" # への口
---| "TRIANGLE" # 三角口1
---| "TRIANGLE2" # 三角口2
---| "TIRED" # げっそり口
---| "OPENED2" # 開いた口2
---| "SMALL" # 小さく開いた口

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
---| "NO_VEIL" # デフォルト（ベールなし）
---| "TRACKSUIT" # 体操服
---| "IDOL" # アイドル

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
                en_us = "Mari";
                ja_jp = "マリー";
            };

            lastName = {
                en_us = "Iochi";
                ja_jp = "伊落";
            };

            clubName = {
                en_us = "Sisterhood";
                ja_jp = "シスターフッド";
            };

            birth = {
                month = 9;
                day = 12;
            };
        }

        instance.faceParts = {
            rightEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(2, 0); --必須
                TIRED = vectors.vec2(3, 0); --必須
                CLOSED = vectors.vec2(4, 0); --必須
                NARROW1 = vectors.vec2(5, 0);
                NARROW2 = vectors.vec2(0, 1);
                CLOSED2 = vectors.vec2(1, 1);
                INVERTED = vectors.vec2(2, 1);
                TEAR = vectors.vec2(4, 1);
                UNEQUAL = vectors.vec2(5, 1);
            };

            leftEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(1, 0); --必須
                TIRED = vectors.vec2(2, 0); --必須
                CLOSED = vectors.vec2(3, 0); --必須
                NARROW1 = vectors.vec2(5, 0);
                NARROW2 = vectors.vec2(-1, 1);
                CLOSED2 = vectors.vec2(0, 1);
                INVERTED = vectors.vec2(2, 1);
                TEAR = vectors.vec2(3, 1);
                UNEQUAL = vectors.vec2(4, 1);
            };

            mouth = {
                CLOSED = vectors.vec2(1, 0);
                SMILE = vectors.vec2(0, 1);
                OPENED = vectors.vec2(1, 1);
                ANXIOUS = vectors.vec2(2, 1);
                TRIANGLE = vectors.vec2(3, 1);
                TRIANGLE2 = vectors.vec2(0, 2);
                TIRED = vectors.vec2(1, 2);
                OPENED2 = vectors.vec2(0, 3);
                SMALL = vectors.vec2(1, 3);
            };
        }

        instance.arms = {

        }

        instance.skirt = {
            skirtModels = {models.models.main.Avatar.UpperBody.Body.Robe, models.models.main.Avatar.UpperBody.Body.CIdolB.Skirt};
        }

        instance.gun = {
            scale = 0.75;

            gunPosition = {
                hold = {
                    type = "NORMAL";

                    firstPersonPos = {
                        right = vectors.vec3(-0.5, 0, -5);
                        left = vectors.vec3(1, 0, -5);
                    };

                    thirdPersonPos = {
                        right = vectors.vec3(0, -0.5, -5);
                        left = vectors.vec3(0, -0.5, -5);
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
                    en_us = "Holy Blessing";
                    ja_jp = "聖なる加護";
                };

                formationType = "SPECIAL";

                models = {};

                animations = {"main"};

                camera = {
                    start = {
                        rot = vectors.vec3(0, 150, -3);
                        pos = vectors.vec3(25, 25, -21);
                    };

                    fin = {
                        rot = vectors.vec3(0, 180, 0);
                        pos = vectors.vec3(0, 23, -36);
                    };
                };

                callbacks = {
                    onAnimationTick = function (tick)
                        if tick == 0 then
                            instance.parent.faceParts:setEmotion("NORMAL", "NORMAL", "CLOSED", 14, true)
                        elseif tick == 5 then
                            local anchorPos = instance.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.ExSkill1ParticleAnchor1)
                            local bodyYaw = player:getBodyYaw()
                            for _ = 1, 30 do
                                particles:newParticle(instance.parent.compatibilityUtils:checkParticle("minecraft:cherry_leaves"), anchorPos:copy():add(math.random() - 0.5, math.random() * 2 - 1, math.random() - 0.5)):setColor(0.2, 1, 0.2):setVelocity(vectors.rotateAroundAxis(-bodyYaw, 0.1, 0, 0, 0, 1, 0))
                            end
                        elseif tick == 14 then
                            instance.parent.faceParts:setEmotion("NARROW1", "NARROW1", "CLOSED", 2, true)
                        elseif tick == 16 then
                            instance.parent.faceParts:setEmotion("NARROW2", "NARROW2", "CLOSED", 2, true)
                        elseif tick == 18 then
                            instance.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "CLOSED", 66, true)
                        elseif tick == 59 then
                            local playerPos = player:getPos()
                            for _ = 1, 100 do
                                particles:newParticle(instance.parent.compatibilityUtils.getDustParticleId(vectors.vec3(100000000, 100000000, 100000000), 1), playerPos:copy():add(math.random() * 4 - 2, 0, math.random() * 4 - 2)):setLifetime(100):setVelocity()
                            end
                            local anchorPos = instance.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.ExSkill1ParticleAnchor3)
                            local bodyYaw = player:getBodyYaw()
                            for _ = 1, 50 do
                                particles:newParticle(instance.parent.compatibilityUtils.getDustParticleId(vectors.vec3(100000000, 100000000, 100000000), 1), anchorPos:copy():add(vectors.rotateAroundAxis(-bodyYaw, vectors.rotateAroundAxis(math.random() * 360, 0, 1.25, 0, 0, 0, 1), 0, 1, 0))):setLifetime(40):setVelocity(vectors.rotateAroundAxis(-bodyYaw, 0, 0, math.random() * 0.1 + 0.05, 0, 1, 0))
                            end
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:block.beacon.activate"), playerPos, 1, 1.5)
                        end
                        if tick >= 24 then
                            local anchorPos = instance.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.ExSkill1ParticleAnchor2)
                            for _ = 1, 2 do
                                particles:newParticle(instance.parent.compatibilityUtils:checkParticle("minecraft:wax_off"), anchorPos:copy():add(math.random() * 0.4 - 0.2, 0, math.random() * 0.4 - 0.2)):setScale(0.15):setVelocity(0, math.random() * 0.025, 0):setColor(1, 1, 0.875)
                            end
                        end
                        if tick % 3 == 0 and tick <= 50 then
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.parrot.ambient"), player:getPos(), (50 - tick) / 50, 1.5)
                        end
                    end
                };
            };

            {
                name = {
                    en_us = "Please have some water";
                    ja_jp = "お水をどうぞ";
                };

                formationType = "STRIKER";

                models = {models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.DrinkBottle1, models.models.main.Avatar.UpperBody.Body.DrinkBottle2, models.models.main.Avatar.UpperBody.Body.DrinkBottle3, models.models.ex_skill_2.Mobs};

                animations = {"main", "costume_tracksuit", "ex_skill_2"};

                camera = {
                    start = {
                        rot = vectors.vec3(-5, 180, 0);
                        pos = vectors.vec3(-1, 27, -12);
                    };

                    fin = {
                        rot = vectors.vec3(0, 150, 0);
                        pos = vectors.vec3(21, 20, -30);
                    };
                };

                callbacks = {
                    onPreAnimation = function ()
                        if not instance.exSkill[2].init then
                            for _, modelPart in ipairs({models.models.ex_skill_2.Mobs.Mob1.Mob1Head.Mob1HeadColor, models.models.ex_skill_2.Mobs.Mob1.Mob1Head.Mob1HeadLayerColor}) do
                                modelPart:setColor(0.318, 0.235, 0.282)
                            end
                            for _, modelPart in ipairs({models.models.ex_skill_2.Mobs.Mob1.Mob1UpperBody.Mob1Body.Mob1BodyColor, models.models.ex_skill_2.Mobs.Mob1.Mob1UpperBody.Mob1Body.Mob1BodyLayerColor, models.models.ex_skill_2.Mobs.Mob1.Mob1UpperBody.Mob1Arms.Mob1RightArm.Mob1RightArmColor, models.models.ex_skill_2.Mobs.Mob1.Mob1UpperBody.Mob1Arms.Mob1RightArm.Mob1RightArmLayerColor, models.models.ex_skill_2.Mobs.Mob1.Mob1UpperBody.Mob1Arms.Mob1LeftArm.Mob1LeftArmColor, models.models.ex_skill_2.Mobs.Mob1.Mob1UpperBody.Mob1Arms.Mob1LeftArm.Mob1LeftArmLayerColor, models.models.ex_skill_2.Mobs.Mob1.Mob1LowerBody.Mob1Legs.Mob1RightLeg.Mob1RightLegColor, models.models.ex_skill_2.Mobs.Mob1.Mob1LowerBody.Mob1Legs.Mob1RightLeg.Mob1RightLegLayerColor, models.models.ex_skill_2.Mobs.Mob1.Mob1LowerBody.Mob1Legs.Mob1LeftLeg.Mob1LeftLegColor, models.models.ex_skill_2.Mobs.Mob1.Mob1LowerBody.Mob1Legs.Mob1LeftLeg.Mob1LeftLegLayerColor}) do
                                modelPart:setColor(0.788, 0.263, 0.275)
                            end
                            for _, modelPart in ipairs({models.models.ex_skill_2.Mobs.Mob1.Mob1Head.Mob1HeadRing, models.models.ex_skill_2.Mobs.Mob2.Mob2Head.Mob2HeadRing, models.models.ex_skill_2.Mobs.Mob3.Mob3Head.Mob3HeadRing}) do
                                modelPart:setColor(0.996, 0.824, 0.843)
                            end
                            for _, modelPart in ipairs({models.models.ex_skill_2.Mobs.Mob2.Mob2Head.Mob2HeadColor, models.models.ex_skill_2.Mobs.Mob2.Mob2Head.Mob2HeadLayerColor, models.models.ex_skill_2.Mobs.Mob2.Mob2Head.Mob2HairTail}) do
                                modelPart:setColor(0.502, 0.369, 0.408)
                            end
                            for _, modelPart in ipairs({models.models.ex_skill_2.Mobs.Mob2.Mob2UpperBody.Mob2Body.Mob2BodyColor, models.models.ex_skill_2.Mobs.Mob2.Mob2UpperBody.Mob2Body.Mob2BodyLayerColor, models.models.ex_skill_2.Mobs.Mob2.Mob2UpperBody.Mob2Arms.Mob2RightArm.Mob2RightArmColor, models.models.ex_skill_2.Mobs.Mob2.Mob2UpperBody.Mob2Arms.Mob2RightArm.Mob2RightArmLayerColor, models.models.ex_skill_2.Mobs.Mob2.Mob2UpperBody.Mob2Arms.Mob2LeftArm.Mob2LeftArmColor, models.models.ex_skill_2.Mobs.Mob2.Mob2UpperBody.Mob2Arms.Mob2LeftArm.Mob2LeftArmLayerColor, models.models.ex_skill_2.Mobs.Mob2.Mob2LowerBody.Mob2Legs.Mob2RightLeg.Mob2RightLegColor, models.models.ex_skill_2.Mobs.Mob2.Mob2LowerBody.Mob2Legs.Mob2RightLeg.Mob2RightLegLayerColor, models.models.ex_skill_2.Mobs.Mob2.Mob2LowerBody.Mob2Legs.Mob2LeftLeg.Mob2LeftLegColor, models.models.ex_skill_2.Mobs.Mob2.Mob2LowerBody.Mob2Legs.Mob2LeftLeg.Mob2LeftLegLayerColor}) do
                                modelPart:setColor(0.596, 0.6, 0.757)
                            end
                            for _, modelPart in ipairs({models.models.ex_skill_2.Mobs.Mob3.Mob3Head.Mob3HeadColor, models.models.ex_skill_2.Mobs.Mob3.Mob3Head.Mob3HeadLayerColor, models.models.ex_skill_2.Mobs.Mob3.Mob3Head.Mob3Bun}) do
                                modelPart:setColor(0.275, 0.212, 0.227)
                            end
                            for _, modelPart in ipairs({models.models.ex_skill_2.Mobs.Mob3.Mob3UpperBody.Mob3Body.Mob3BodyColor, models.models.ex_skill_2.Mobs.Mob3.Mob3UpperBody.Mob3Body.Mob3BodyLayerColor, models.models.ex_skill_2.Mobs.Mob3.Mob3UpperBody.Mob3Arms.Mob3RightArm.Mob3RightArmColor, models.models.ex_skill_2.Mobs.Mob3.Mob3UpperBody.Mob3Arms.Mob3RightArm.Mob3RightArmLayerColor, models.models.ex_skill_2.Mobs.Mob3.Mob3UpperBody.Mob3Arms.Mob3LeftArm.Mob3LeftArmColor, models.models.ex_skill_2.Mobs.Mob3.Mob3UpperBody.Mob3Arms.Mob3LeftArm.Mob3LeftArmLayerColor, models.models.ex_skill_2.Mobs.Mob3.Mob3LowerBody.Mob3Legs.Mob3RightLeg.Mob3RightLegColor, models.models.ex_skill_2.Mobs.Mob3.Mob3LowerBody.Mob3Legs.Mob3RightLeg.Mob3RightLegLayerColor, models.models.ex_skill_2.Mobs.Mob3.Mob3LowerBody.Mob3Legs.Mob3LeftLeg.Mob3LeftLegColor, models.models.ex_skill_2.Mobs.Mob3.Mob3LowerBody.Mob3Legs.Mob3LeftLeg.Mob3LeftLegLayerColor}) do
                                modelPart:setColor(0.231, 0.298, 0.22)
                            end
                            for _, modelPart in ipairs({models.models.ex_skill_2.Mobs.Mob4.Mob4Head.Mob4HeadColor, models.models.ex_skill_2.Mobs.Mob4.Mob4Head.Mob4HeadLayerColor, models.models.ex_skill_2.Mobs.Mob4.Mob4Head.Mob4Bun}) do
                                modelPart:setColor(0.345, 0.251, 0.251)
                            end
                            for _, modelPart in ipairs({models.models.ex_skill_2.Mobs.Mob4.Mob4UpperBody.Mob4Body.Mob4BodyColor, models.models.ex_skill_2.Mobs.Mob4.Mob4UpperBody.Mob4Body.Mob4BodyLayerColor, models.models.ex_skill_2.Mobs.Mob4.Mob4UpperBody.Mob4Arms.Mob4RightArm.Mob4RightArmColor, models.models.ex_skill_2.Mobs.Mob4.Mob4UpperBody.Mob4Arms.Mob4RightArm.Mob4RightArmLayerColor, models.models.ex_skill_2.Mobs.Mob4.Mob4UpperBody.Mob4Arms.Mob4LeftArm.Mob4LeftArmColor, models.models.ex_skill_2.Mobs.Mob4.Mob4UpperBody.Mob4Arms.Mob4LeftArm.Mob4LeftArmLayerColor, models.models.ex_skill_2.Mobs.Mob4.Mob4LowerBody.Mob4Legs.Mob4RightLeg.Mob4RightLegColor, models.models.ex_skill_2.Mobs.Mob4.Mob4LowerBody.Mob4Legs.Mob4RightLeg.Mob4RightLegLayerColor, models.models.ex_skill_2.Mobs.Mob4.Mob4LowerBody.Mob4Legs.Mob4LeftLeg.Mob4LeftLegColor, models.models.ex_skill_2.Mobs.Mob4.Mob4LowerBody.Mob4Legs.Mob4LeftLeg.Mob4LeftLegLayerColor}) do
                                modelPart:setColor(0.49, 0.42, 0.522)
                            end
                            for _, modelPart in ipairs({models.models.ex_skill_2.Mobs.Mob4.Mob4Head.Mob4HeadRing, models.models.ex_skill_2.Mobs.Mob5.Mob5Head.Mob5HeadRing, models.models.ex_skill_2.Mobs.Mob6.Mob6Head.Mob6HeadRing}) do
                                modelPart:setColor(1, 0.98, 0.804)
                            end
                            for _, modelPart in ipairs({models.models.ex_skill_2.Mobs.Mob5.Mob5Head.Mob5HeadColor, models.models.ex_skill_2.Mobs.Mob5.Mob5Head.Mob5HeadLayerColor}) do
                                modelPart:setColor(0.349, 0.286, 0.365)
                            end
                            for _, modelPart in ipairs({models.models.ex_skill_2.Mobs.Mob5.Mob5UpperBody.Mob5Body.Mob5BodyColor, models.models.ex_skill_2.Mobs.Mob5.Mob5UpperBody.Mob5Body.Mob5BodyLayerColor, models.models.ex_skill_2.Mobs.Mob5.Mob5UpperBody.Mob5Arms.Mob5RightArm.Mob5RightArmColor, models.models.ex_skill_2.Mobs.Mob5.Mob5UpperBody.Mob5Arms.Mob5RightArm.Mob5RightArmLayerColor, models.models.ex_skill_2.Mobs.Mob5.Mob5UpperBody.Mob5Arms.Mob5LeftArm.Mob5LeftArmColor, models.models.ex_skill_2.Mobs.Mob5.Mob5UpperBody.Mob5Arms.Mob5LeftArm.Mob5LeftArmLayerColor, models.models.ex_skill_2.Mobs.Mob5.Mob5LowerBody.Mob5Legs.Mob5RightLeg.Mob5RightLegColor, models.models.ex_skill_2.Mobs.Mob5.Mob5LowerBody.Mob5Legs.Mob5RightLeg.Mob5RightLegLayerColor, models.models.ex_skill_2.Mobs.Mob5.Mob5LowerBody.Mob5Legs.Mob5LeftLeg.Mob5LeftLegColor, models.models.ex_skill_2.Mobs.Mob5.Mob5LowerBody.Mob5Legs.Mob5LeftLeg.Mob5LeftLegLayerColor}) do
                                modelPart:setColor(0.294, 0.337, 0.49)
                            end
                            for _, modelPart in ipairs({models.models.ex_skill_2.Mobs.Mob6.Mob6Head.Mob6HeadColor, models.models.ex_skill_2.Mobs.Mob6.Mob6Head.Mob6HeadLayerColor, models.models.ex_skill_2.Mobs.Mob6.Mob6Head.Mob6HairTail}) do
                                modelPart:setColor(0.506, 0.369, 0.322)
                            end
                            for _, modelPart in ipairs({models.models.ex_skill_2.Mobs.Mob6.Mob6UpperBody.Mob6Body.Mob6BodyColor, models.models.ex_skill_2.Mobs.Mob6.Mob6UpperBody.Mob6Body.Mob6BodyLayerColor, models.models.ex_skill_2.Mobs.Mob6.Mob6UpperBody.Mob6Arms.Mob6RightArm.Mob6RightArmColor, models.models.ex_skill_2.Mobs.Mob6.Mob6UpperBody.Mob6Arms.Mob6RightArm.Mob6RightArmLayerColor, models.models.ex_skill_2.Mobs.Mob6.Mob6UpperBody.Mob6Arms.Mob6LeftArm.Mob6LeftArmColor, models.models.ex_skill_2.Mobs.Mob6.Mob6UpperBody.Mob6Arms.Mob6LeftArm.Mob6LeftArmLayerColor, models.models.ex_skill_2.Mobs.Mob6.Mob6LowerBody.Mob6Legs.Mob6RightLeg.Mob6RightLegColor, models.models.ex_skill_2.Mobs.Mob6.Mob6LowerBody.Mob6Legs.Mob6RightLeg.Mob6RightLegLayerColor, models.models.ex_skill_2.Mobs.Mob6.Mob6LowerBody.Mob6Legs.Mob6LeftLeg.Mob6LeftLegColor, models.models.ex_skill_2.Mobs.Mob6.Mob6LowerBody.Mob6Legs.Mob6LeftLeg.Mob6LeftLegLayerColor}) do
                                modelPart:setColor(0.58, 0.231, 0.29)
                            end

                            models.models.main.Avatar.Head.FaceShadow:setOpacity(0.5)

                            instance.exSkill[2].stairs:setPos(6, 0, 6)
                            instance.exSkill[2].stairs:setRot(0, 180, 0)
                            instance.exSkill[2].stairs:setBlock(instance.parent.compatibilityUtils:checkBlock("minecraft:oak_stairs"))
                            instance.exSkill[2].stairs:setVisible(false)
                            if host:isHost() then
                                models.models.ex_skill_2.Gui.AnxiousFrame:setColor(0.282, 0.29, 0.725)
                            end
                            instance.exSkill[2].init = true
                        end
                    end;

                    onAnimationTick = function (tick)
                        if tick == 0 then
                            instance.parent.faceParts:setEmotion("CLOSED", "CLOSED", "SMILE", 7, true)
                        elseif tick == 7 then
                            instance.parent.faceParts:setEmotion("NORMAL", "NORMAL", "OPENED", 11, true)
                        elseif tick == 18 then
                            instance.parent.faceParts:setEmotion("NORMAL", "INVERTED", "OPENED", 6, true)
                        elseif tick == 24 then
                            instance.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "CLOSED", 8, true)
                        elseif tick == 32 then
                            instance.parent.faceParts:setEmotion("NORMAL", "NORMAL", "OPENED", 10, true)
                        elseif tick == 38 and host:isHost() then
                            for _, modelPart in ipairs({models.models.ex_skill_2.Mobs.Mob1, models.models.ex_skill_2.Mobs.Mob4}) do
                                modelPart:setVisible(false)
                            end
                        elseif tick == 42 then
                            instance.parent.faceParts:setEmotion("INVERTED", "NORMAL", "OPENED", 5, true)
                        elseif tick == 45 then
                            instance.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "CLOSED", 3, true)
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.wither.spawn"), player:getPos(), 0.15, 2)
                            if host:isHost() then
                                local windowSize = client:getScaledWindowSize()
                                models.models.ex_skill_2.Gui.AnxiousFrame:setScale(windowSize.x, windowSize.y, 1)
                                models.models.ex_skill_2.Gui.AnxiousFrame:setVisible(true)
                            end
                        elseif tick == 50 then
                            instance.parent.faceParts:setEmotion("INVERTED", "NORMAL", "ANXIOUS", 6, true)
                        elseif tick == 56 then
                            instance.parent.faceParts:setEmotion("NORMAL", "INVERTED", "ANXIOUS", 10, true)
                        elseif tick == 66 then
                            instance.parent.faceParts:setEmotion("NORMAL", "INVERTED", "TRIANGLE", 5, true)
                        elseif tick == 71 then
                            instance.parent.faceParts:setEmotion("INVERTED", "NORMAL", "TRIANGLE", 10, true)
                        elseif tick == 80 then
                            models.models.main.Avatar:setColor()
                            models.models.ex_skill_2.Gui.AnxiousFrame:setVisible(false)
                        elseif tick == 81 then
                            instance.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "CLOSED", 4, true)
                        elseif tick == 85 then
                            instance.parent.faceParts:setEmotion("TEAR", "TEAR", "TRIANGLE2", 15, true)
                        elseif tick == 100 then
                            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.DrinkBottle2, models.models.main.Avatar.UpperBody.Body.DrinkBottle3, models.models.ex_skill_2.Mobs}) do
                                modelPart:setVisible(false)
                            end
                            instance.exSkill[2].stairs:setVisible(true)
                            models.models.main.Avatar.UpperBody.Body.CTracksuitB.Bag:moveTo(models.models.main)
                            models.models.main.Avatar.Head.FaceShadow:setVisible(true)
                            instance.parent.faceParts:setEmotion("TIRED", "TIRED", "TIRED", 43, true)
                            local bodyYaw = player:getBodyYaw()
                            particles:newParticle(instance.parent.compatibilityUtils:checkParticle("minecraft:soul"), instance.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.Head.FaceParts.Mouth):add(vectors.rotateAroundAxis(-bodyYaw, 0.1, 0.17, 0.35, 0, 1, 0))):setScale(0.75):setVelocity(vectors.rotateAroundAxis(-bodyYaw, -0.01, 0, 0, 0, 1, 0)):setLifetime(40)
                            local playerPos = player:getPos()
                            for _ = 1, 50 do
                                particles:newParticle(instance.parent.compatibilityUtils:checkParticle("minecraft:entity_effect"), playerPos:copy():add(math.random() * 1.5 - 0.75, math.random() * 1.5 + 0.5, math.random() * 1.5 - 0.75)):setGravity(0.1):setLifetime(40)
                            end
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:block.beacon.deactivate"), playerPos, 1, 2)
                        end
                        if tick >= 45 and tick <= 56 then
                            models.models.main.Avatar:setColor(vectors.vec3(1, 1, 1):scale(1 - math.map(tick, 45, 56, 0, 0.25)))
                            if host:isHost() then
                                models.models.ex_skill_2.Gui.AnxiousFrame:setOpacity(math.map(tick, 45, 56, 0, 1))
                            end
                        end
                        if tick >= 8 and tick < 80 then
                            particles:newParticle(instance.parent.compatibilityUtils:checkParticle("minecraft:splash"), instance.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.Head)):setPower(2)
                            if tick % 4 == 0 then
                                sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:block.bubble_column.bubble_pop"), player:getPos(), 0.15, 2 - math.random() * 0.5)
                            end
                        elseif tick >= 85 and tick < 100 and tick % 2 == 0 then
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.experience_orb.pickup"), player:getPos(), 0.5, 2)
                        end
                    end;

                    onPostAnimation = function (forcedStop)
                        if models.models.main.Bag ~= nil then
                            models.models.main.Bag:moveTo(models.models.main.Avatar.UpperBody.Body.CTracksuitB)
                        end
                        instance.exSkill[2].stairs:setVisible(false)
                        models.models.main.Avatar.Head.FaceShadow:setVisible(false)
                        if host:isHost() then
                            for _, modelPart in ipairs({models.models.ex_skill_2.Mobs.Mob1, models.models.ex_skill_2.Mobs.Mob4}) do
                                modelPart:setVisible(true)
                            end
                        end
                        if forcedStop then
                            models.models.main.Avatar:setColor()
                            if host:isHost() then
                                models.models.ex_skill_2.Gui.AnxiousFrame:setVisible(false)
                            end
                        end
                    end;
                };

                ---Exスキルの初期化処理が行われたかどうか
                ---@type boolean
                init = false;

                ---Exスキル2で使用する階段ブロック
                ---@type BlockTask
                stairs = models.models.main:newBlock("ex_skill_2_stairs")
            };

            {
                name = {
                    en_us = "Overflowing heart";
                    ja_jp = "溢れるハート";
                };

                formationType = "STRIKER";

                models = {models.models.ex_skill_3.Gui};

                animations = {"main", "costume_tracksuit", "costume_idol", "ex_skill_3"};

                camera = {
                    start = {
                        rot = vectors.vec3(0, 180, 0);
                        pos = vectors.vec3(0, 25, -22);
                    };

                    fin = {
                        rot = vectors.vec3(-20, 200, -10);
                        pos = vectors.vec3(-6, 50, -18);
                    };
                };

                callbacks = {
                    onPreAnimation = function ()
                        instance.parent.costume.setCostumeTextureOffset(3)
                        for _, modelPart in ipairs({models.models.main.Avatar.Head.Head, models.models.main.Avatar.Head.HatLayer}) do
                            modelPart:setUVPixels()
                        end
                        for _, modelPart in ipairs({models.models.main.Avatar.Head.CIdolH, models.models.main.Avatar.UpperBody.Body.CIdolB, models.models.main.Avatar.LowerBody.Legs.RightLeg.RightLegBottom.CIdolRLB, models.models.main.Avatar.LowerBody.Legs.LeftLeg.LeftLegBottom.CIdolLLB, models.models.main.Avatar.Head.CTracksuitH.HairbandFront, models.models.main.Avatar.Head.CTracksuitH.Hairband, models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon, models.models.main.Avatar.UpperBody.Body.CTracksuitB.TrinityLogo, models.models.main.Avatar.UpperBody.Body.CTracksuitB.Fastener, models.models.main.Avatar.UpperBody.Body.CTracksuitB.Bag}) do
                            modelPart:setVisible(false)
                        end
                        for _, modelPart in ipairs({models.models.main.Avatar.Head.CTracksuitH, models.models.main.Avatar.UpperBody.Body.CTracksuitB, models.models.main.Avatar.UpperBody.Body.BTrinityLogo}) do
                            modelPart:setVisible(true)
                        end
                        models.models.main.Avatar.Head.Ears.RightEarPivot:setRot()

                        if not instance.exSkill[3].init then
                            models.models.main.Avatar.UpperBody.Body.BTrinityLogo:setColor(0.357, 0.365, 0.475)
                            for _, modelPart in ipairs({models.models.ex_skill_3.Stage.StageFloor, models.models.ex_skill_3.Stage.StageStair1, models.models.ex_skill_3.Stage.StageStair2, models.models.ex_skill_3.Stage.StageStair3, models.models.ex_skill_3.Stage.StageStair4}) do
                                modelPart:setPrimaryTexture("RESOURCE", "minecraft:textures/block/gray_concrete.png")
                            end
                            --ペンライトの作成
                            local penLightColors = {vectors.vec3(1, 0.855, 0.584), vectors.vec3(0.698, 1, 0.97), vectors.vec3(0.81, 1, 0.698)}
                            for i = 1, 100 do
                                local model = models.models.ex_skill_3.Stage.PenLights["PenLight"..i]
                                if model == nil then
                                    model = instance.parent.modelUtils:copyModel(models.models.ex_skill_3.Stage.PenLights.PenLight1, "PenLight"..i, true)
                                    models.models.ex_skill_3.Stage.PenLights:addChild(model)
                                end
                                model.PenLightEmissive:setColor(penLightColors[math.floor(math.random() * 3) + 1])
                            end
                            if host:isHost() then
                                --モデルのコピー
                                models.models.main.Avatar.Head.FaceParts.Mouth:setVisible(true)
                                models.models.main.Avatar.UpperBody.Body.Gun:setVisible(false)
                                local armorVisible = {
                                    helmet = instance.parent.armor.isArmorVisible.helmet;
                                    chestplate = instance.parent.armor.isArmorVisible.chestplate;
                                    leggings = instance.parent.armor.isArmorVisible.leggings;
                                    boots = instance.parent.armor.isArmorVisible.boots;
                                }
                                if armorVisible.helmet then
                                    instance.parent.armor:setHelmet(world.newItem(instance.parent.compatibilityUtils:checkItem("minecraft:air")))
                                    models.models.main.Avatar.Head.Ears.RightEarPivot:setRot()
                                end
                                if armorVisible.chestplate then
                                    Armor:setChestPlate(world.newItem(instance.parent.compatibilityUtils:checkItem("minecraft:air")))
                                end
                                if armorVisible.leggings then
                                    Armor:setLeggings(world.newItem(instance.parent.compatibilityUtils:checkItem("minecraft:air")))
                                end
                                if armorVisible.boots then
                                    Armor:setBoots(world.newItem(instance.parent.compatibilityUtils:checkItem("minecraft:air")))
                                end
                                for i = 1, 4 do
                                    models.models.ex_skill_3.Gui.Scrollable.Characters["Pose"..i]:addChild(instance.parent.modelUtils:copyModel(models.models.main.Avatar))
                                end
                                models.models.main.Avatar.Head.FaceParts.Mouth:setVisible(false)
                                --ポーズの作成
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose1.Avatar:setRot(-2.7199, 19.8217, -7.9753)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose1.Avatar.Head:setRot(2.664, -14.7669, -10.3453)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose1.Avatar.Head.Ears.RightEarPivot:setRot(0, 0, -15)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose1.Avatar.Head.Ears.LeftEarPivot:setRot(0, 0, -15)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose1.Avatar.Head.CTracksuitH.HairTail:setRot(-22.5, 0, 20)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose1.Avatar.UpperBody.Body.CTracksuitB.FrontHair:setRot(15, 0, 0)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose1.Avatar.UpperBody.Arms.RightArm:setRot(0, 0, 22.5)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose1.Avatar.UpperBody.Arms.LeftArm:setRot(0, 90, -110)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose1.Avatar.LowerBody.Legs.RightLeg:setRot(52.0721, 46.6851, 28.5204)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose1.Avatar.LowerBody.Legs.RightLeg.RightLegBottom:setRot(-60, 0, 0)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose1.Avatar.LowerBody.Legs.LeftLeg:setRot(0, 0, 15)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose1.Avatar.Head.FaceParts.Eyes.EyeLeft:setUVPixels(instance.faceParts.rightEye.CLOSED:copy():scale(6))
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose1.Avatar.Head.FaceParts.Mouth:setUVPixels(instance.faceParts.mouth.OPENED2:copy():mul(16, 8))
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose2.Avatar:setRot(-0.9096, -19.9801, 2.6602)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose2.Avatar.Head:setRot(-2.7199, 19.8217, -7.9753)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose2.Avatar.Head.CTracksuitH.HairTail:setRot(0, 0, 5)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose2.Avatar.UpperBody.Body.CTracksuitB.FrontHair:setRot(22.5, 0, 0)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose2.Avatar.UpperBody.Arms.RightArm:setRot(32.5, 67.5, 0)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose2.Avatar.UpperBody.Arms.RightArm.RightArmBottom:setRot(70, 0, 0)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose2.Avatar.UpperBody.Arms.LeftArm:setRot(103.7833, -8.4773, 119.2288)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose2.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom:setRot(10, 0, 0)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose2.Avatar.LowerBody.Legs.RightLeg:setRot(0, 12.5, 0)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose2.Avatar.LowerBody.Legs.LeftLeg:setRot(0, 0, -10)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose2.Avatar.Head.FaceParts.Mouth:setUVPixels(instance.faceParts.mouth.SMILE:copy():mul(16, 8))
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose3.Avatar:setRot(-98.9287, -27.6048, -13.6459)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose3.Avatar.Head:setRot(85, 0, 0)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose3.Avatar.Head.Ears.RightEarPivot:setRot(-30, 0, -10)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose3.Avatar.Head.Ears.LeftEarPivot:setRot(-30, 0, 10)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose3.Avatar.Head.CTracksuitH.HairTail:setRot(-87.5, -22.5, 0)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose3.Avatar.UpperBody.Body.CTracksuitB.FrontHair:setPos(0, 3, 2)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose3.Avatar.UpperBody.Body.CTracksuitB.FrontHair:setRot(90, 0, 0)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose3.Avatar.UpperBody.Arms.RightArm:setRot(-180, 0, -7.5)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose3.Avatar.UpperBody.Arms.LeftArm:setRot(-180, 0, 7.5)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose3.Avatar.LowerBody.Legs.RightLeg:setRot(-39.8593, 2.2494, 7.1566)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose3.Avatar.LowerBody.Legs.RightLeg.RightLegBottom:setRot(-40, 0, 0)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose3.Avatar.LowerBody.Legs.LeftLeg:setRot(-4.7697, -1.5018, -17.4374)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose3.Avatar.LowerBody.Legs.LeftLeg.LeftLegBottom:setRot(-25, 0, 0)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose3.Avatar.Head.FaceParts.Eyes.EyeLeft:setUVPixels(instance.faceParts.rightEye.UNEQUAL:copy():scale(6))
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose3.Avatar.Head.FaceParts.Eyes.EyeRight:setUVPixels(instance.faceParts.leftEye.UNEQUAL:copy():scale(6))
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose3.Avatar.Head.FaceParts.Mouth:setUVPixels(instance.faceParts.mouth.TRIANGLE:copy():mul(16, 8))
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose4.Avatar:setRot(-30, 30, 0)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose4.Avatar.Head:setRot(9.8511, 1.7279, -9.8511)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose4.Avatar.Head.Ears.RightEarPivot:setRot(-40, 0, -10)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose4.Avatar.Head.Ears.LeftEarPivot:setRot(-40, 0, 10)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose4.Avatar.Head.CTracksuitH.HairTail:setRot(-5, 0, 15)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose4.Avatar.UpperBody.Body.CTracksuitB.FrontHair:setRot(25, 0, 0)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose4.Avatar.UpperBody.Arms.RightArm:setRot(62.5, 65, 0)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose4.Avatar.UpperBody.Arms.RightArm.RightArmBottom:setRot(47.5, 0, 0)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose4.Avatar.UpperBody.Arms.LeftArm:setRot(28.8384, -8.6474, 15.2727)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose4.Avatar.LowerBody.Legs.RightLeg:setRot(60, 0, 0)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose4.Avatar.LowerBody.Legs.RightLeg.RightLegBottom:setRot(-37.5, 0, 0)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose4.Avatar.LowerBody.Legs.LeftLeg:setRot(60, 0, 0)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose4.Avatar.LowerBody.Legs.LeftLeg.LeftLegBottom:setRot(-37.5, 0, 0)
                                models.models.ex_skill_3.Gui.Scrollable.Characters.Pose4.Avatar.Head.FaceParts.Mouth:setUVPixels(instance.faceParts.mouth.SMALL:copy():mul(16, 8))
                                if armorVisible.helmet then
                                    instance.parent.armor:setHelmet(instance.parent.armor.armorSlotItems[1])
                                end
                                if armorVisible.chestplate then
                                    instance.parent.armor:setChestplate(instance.parent.armor.armorSlotItems[2])
                                end
                                if armorVisible.leggings then
                                    instance.parent.armor:setLeggings(instance.parent.armor.armorSlotItems[3])
                                end
                                if armorVisible.boots then
                                    instance.parent.armor:setBoots(instance.parent.armor.armorSlotItems[4])
                                end
                                --白い縁取りと影の作成
                                local outlineTexture = textures:newTexture("ex_skill_3_character_outline", 1, 1)
                                outlineTexture:fill(0, 0, 1, 1, 1, 1, 1)
                                for i = 1, 4 do
                                    local outlineAvatar = models.models.ex_skill_3.Gui.Scrollable.Characters["Pose"..i].Avatar:copy("OutlineAvatar")
                                    outlineAvatar:setPrimaryRenderType("EMISSIVE_SOLID")
                                    outlineAvatar:setPrimaryTexture("CUSTOM", outlineTexture)
                                    ---@diagnostic disable-next-line: discard-returns
                                    models.models.ex_skill_3.Gui.Scrollable.Characters["Pose"..i]:newPart("Outline")
                                    models.models.ex_skill_3.Gui.Scrollable.Characters["Pose"..i].Outline:setPos(0, 0, 50)
                                    models.models.ex_skill_3.Gui.Scrollable.Characters["Pose"..i].Outline:setScale(1.2, 1.2, 0)
                                    models.models.ex_skill_3.Gui.Scrollable.Characters["Pose"..i].Outline:addChild(outlineAvatar)
                                    local shaderAvatar = models.models.ex_skill_3.Gui.Scrollable.Characters["Pose"..i].Outline.OutlineAvatar:copy("ShaderAvatar")
                                    shaderAvatar:setPos(-1, -1, 0)
                                    shaderAvatar:setColor(0.478, 0.631, 0.98)
                                    ---@diagnostic disable-next-line: discard-returns
                                    models.models.ex_skill_3.Gui.Scrollable.Characters["Pose"..i]:newPart("Shader")
                                    models.models.ex_skill_3.Gui.Scrollable.Characters["Pose"..i].Shader:setPos(i <= 2 and 2 or -0.25, -0.25, 51)
                                    models.models.ex_skill_3.Gui.Scrollable.Characters["Pose"..i].Shader:setScale(1.2, 1.2, 0)
                                    models.models.ex_skill_3.Gui.Scrollable.Characters["Pose"..i].Shader:addChild(shaderAvatar)
                                end
                                --波型背景の作成
                                models.models.ex_skill_3.Gui.Scrollable.WaveBackground.UpperWave:setPos(0, 0, 600)
                                models.models.ex_skill_3.Gui.Background.UpperLine:setPos(0, 0, 601)
                                ---背景の円とキラキラを作成
                                models.models.ex_skill_3.Gui.Scrollable2:setPos(0, 0, 602)
                                for i = 2, 10 do
                                    models.models.ex_skill_3.Gui.Scrollable2:addChild(models.models.ex_skill_3.Gui.Scrollable2.Circle1:copy("Circle"..i))
                                end
                                for i = 2, 20 do
                                    models.models.ex_skill_3.Gui.Scrollable2:addChild(models.models.ex_skill_3.Gui.Scrollable2.Shine1:copy("Shine"..i))
                                end
                                ---グラデーション背景の作成
                                models.models.ex_skill_3.Gui.Background.GradientBackground:setPos(0, 0, 603)
                                models.models.ex_skill_3.Gui.Background.GradientBackground:setColor(0.463, 0.875, 0.996)
                                models.models.ex_skill_3.Gui.Background.GradientBackground.GradientBackground1:setPos(-150, 182, 0)
                                --縞背景の作成
                                models.models.ex_skill_3.Gui.Background.StripeBackground:setPos(0, 0, 604)
                                models.models.ex_skill_3.Gui.Background.StripeBackground.StripeBackground1:setPos(0, 6, 0)
                                --トランジションの円棒の作成
                                for i = 2, 20 do
                                    models.models.ex_skill_3.Gui.Transition.CirclePillars:addChild(models.models.ex_skill_3.Gui.Transition.CirclePillars.Pillar1:copy("Pillar"..i))
                                end
                                models.models.ex_skill_3.Gui.Frame:setColor(1, 0.875, 1)
                                models.models.ex_skill_3.Gui.Frame:setOpacity(0.75)
                            end
                            for i = 2, 3 do
                                models.models.ex_skill_3.Stage.SpotLights["SpotLight"..i]["SpotLight"..i.."Core"].SpotLightEmissive:setColor(0.729, 1, 0.996)
                            end
                            instance.exSkill[3].init = true
                        end

                        if host:isHost() then
                            local windowSize = client:getScaledWindowSize()
                            --キャラクターの位置調整
                            local characterScale = windowSize.y / 270
                            models.models.ex_skill_3.Gui.Scrollable.Characters:setPos((windowSize.x - windowSize.y / 0.5625) / 2 * -1)
                            models.models.ex_skill_3.Gui.Scrollable.Characters:setScale(vectors.vec3(1, 1, 0):scale(characterScale):add(0, 0, 1))
                            --波型背景の配置
                            models.models.ex_skill_3.Gui.Scrollable.WaveBackground.LowerWave:setPos(0, windowSize.y * -1 + 30, 600)
                            for i = 1, (windowSize.x + 160 * characterScale) / 92 + 1 do
                                if models.models.ex_skill_3.Gui.Scrollable.WaveBackground.UpperWave["UpperWave"..i] == nil then
                                    local upperWave = models.models.ex_skill_3.Gui.Scrollable.WaveBackground.UpperWave.UpperWave1:copy("UpperWave"..i)
                                    upperWave:setPos((i - 1) * -92, 0, 0)
                                    models.models.ex_skill_3.Gui.Scrollable.WaveBackground.UpperWave:addChild(upperWave)
                                end
                                if models.models.ex_skill_3.Gui.Scrollable.WaveBackground.LowerWave.LowerWave1["LowerWave"..i] == nil then
                                    local lowerWave = models.models.ex_skill_3.Gui.Scrollable.WaveBackground.LowerWave.LowerWave1:copy("LowerWave"..i)
                                    lowerWave:setPos((i - 1) * -92, 0, 0)
                                    models.models.ex_skill_3.Gui.Scrollable.WaveBackground.LowerWave:addChild(lowerWave)
                                end
                            end
                            models.models.ex_skill_3.Gui.Background.UpperLine:setScale(windowSize.x, 1, 1)
                            models.models.ex_skill_3.Gui.Background.LowerLine:setPos(0, windowSize.y * -1 + 48, 601)
                            models.models.ex_skill_3.Gui.Background.LowerLine:setScale(windowSize.x, 1, 1)
                            --グラデーション背景の配置
                            local gradientPanelSize = windowSize.y / math.sqrt(2) * 2
                            models.models.ex_skill_3.Gui.Background.GradientBackground.GradientBackground1:setScale(1, gradientPanelSize, 1)
                            for i = 1, (windowSize.x + windowSize.y) / math.sqrt(2) / 150 + 1 do
                                local model = models.models.ex_skill_3.Gui.Background.GradientBackground["GradientBackground"..i]
                                if model == nil then
                                    model = models.models.ex_skill_3.Gui.Background.GradientBackground.GradientBackground1:copy("GradientBackground"..i)
                                    models.models.ex_skill_3.Gui.Background.GradientBackground:addChild(model)
                                end
                                model:setPos((i - 1) * -150, (i - 1) * 150 + 32, 0)
                                model:setScale(1, gradientPanelSize, 1)
                            end
                            --背景の円とキラキラの配置
                            for i = 1, 10 do
                                models.models.ex_skill_3.Gui.Scrollable2["Circle"..i]:setPos((math.random() * (windowSize.x + 100 * math.sqrt(2)) - 100 * math.sqrt(2)) * -1, math.random() * (windowSize.y + 100 * math.sqrt(2)) * -1, 0)
                                models.models.ex_skill_3.Gui.Scrollable2["Circle"..i]:setScale(vectors.vec3(1, 1, 1):scale(math.random() * 0.1 + 0.95))
                            end
                            for i = 1, 20 do
                                models.models.ex_skill_3.Gui.Scrollable2["Shine"..i]:setPos((math.random() * (windowSize.x + 100 * math.sqrt(2)) - 100 * math.sqrt(2)) * -1, math.random() * (windowSize.y + 100 * math.sqrt(2)) * -1, 0)
                            end
                            --縞背景の配置
                            local stripePanelSize = windowSize.y / math.sqrt(2) + 3
                            models.models.ex_skill_3.Gui.Background.StripeBackground.StripeBackground1:setScale(1, stripePanelSize, 1)
                            for i = 2, (windowSize.x + windowSize.y) / (6 * math.sqrt(2)) + 2 do
                                local model = models.models.ex_skill_3.Gui.Background.StripeBackground["StripeBackground"..i]
                                if model == nil then
                                    model = models.models.ex_skill_3.Gui.Background.StripeBackground.StripeBackground1:copy("StripeBackground"..i)
                                    models.models.ex_skill_3.Gui.Background.StripeBackground:addChild(model)
                                end
                                model:setPos((i - 1) * -6, 6 * (i - 1), 0)
                                model:setScale(1, stripePanelSize, 1)
                            end
                            --トランジションの配置
                            local transitionCenter = vectors.vec3(windowSize.x / 2 * -1, windowSize.y / 2 * -1, -200 * characterScale)
                            local rearTransitionSize = (windowSize.x + windowSize.y) / math.sqrt(2)
                            models.models.ex_skill_3.Gui.Transition.Background:setScale(rearTransitionSize, rearTransitionSize, 1)
                            --トランジションの円棒の配置
                            local colorPalette = {vectors.vec3(0.482, 0.91, 1), vectors.vec3(0.749, 1, 0.996), vectors.vec3(1, 1, 0.663)}
                            for i = 1, 20 do
                                models.models.ex_skill_3.Gui.Transition.CirclePillars["Pillar"..i]:setPos((math.random() * 2 - 1) * (rearTransitionSize / 2), (math.random() * 2 - 1) * (rearTransitionSize / 2 * 1.2), 0)
                                local pillarScaleFactor = math.random() * 0.75 + 0.25
                                models.models.ex_skill_3.Gui.Transition.CirclePillars["Pillar"..i]:setScale(vectors.vec3(4, 4, 4):scale(pillarScaleFactor))
                                local pillarHeight = -160 * pillarScaleFactor + 220
                                models.models.ex_skill_3.Gui.Transition.CirclePillars["Pillar"..i].CenterCircle:setScale(1, pillarHeight, 1)
                                models.models.ex_skill_3.Gui.Transition.CirclePillars["Pillar"..i].UpperCircle:setPos(0, pillarHeight / 2 - 1, 0)
                                models.models.ex_skill_3.Gui.Transition.CirclePillars["Pillar"..i].LowerCircle:setPos(0, pillarHeight / 2 * -1 + 1, 0)
                                models.models.ex_skill_3.Gui.Transition.CirclePillars["Pillar"..i]:setColor(colorPalette[math.floor(math.random() * 3) + 1])
                            end
                            --レンダーイベント
                            events.RENDER:register(function ()
                                models.models.ex_skill_3.Gui.Scrollable:setPos(models.models.ex_skill_3.ScrollableAnchor:getAnimPos():scale(characterScale))
                                models.models.ex_skill_3.Gui.Transition:setPos(transitionCenter:copy():add(models.models.ex_skill_3.TransitionAnchor:getAnimPos():scale(rearTransitionSize)))
                                models.models.ex_skill_3.Gui.WhiteScreen:setOpacity(models.models.ex_skill_3.Gui.WhiteScreen.GOpacity:getAnimScale().x)
                            end, "ex_skill_3_render")
                        end

                        events.RENDER:register(function ()
                            local strength = models.models.ex_skill_3.Stage.StageEmissiveStrength:getAnimScale().x
                            models.models.ex_skill_3.Stage.StageEmissives:setColor(vectors.vec3(1, 1, 1):scale(strength))
                            models.models.ex_skill_3.Stage.SpotLights.SpotLight1.SpotLight1Core.SpotLightEmissive:setColor(vectors.vec3(1, 0.875, 1):scale(strength))
                        end, "ex_skill_3_render_global")

                        for i = 1, 100 do
                            models.models.ex_skill_3.Stage.PenLights["PenLight"..i]:setPos(math.map(math.random(), 0, 1, -160, 160), 32, math.map(math.random(), 0, 1, -400, -80))
                            instance.exSkill[3].penLightSwingOffsets[i] = math.random()
                        end
                        instance.parent.faceParts:setEmotion("NORMAL", "NORMAL", "SMALL", 56, true)
                    end;

                    onAnimationTick = function (tick)
                        if tick == 9 and host:isHost() then
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), player:getPos(), 0.5, 1.5)
                        elseif tick == 23 and host:isHost() then
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.player.hurt"), player:getPos(), 0.5, 1.2)
                        elseif tick == 39 and host:isHost() then
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), player:getPos(), 0.5, 1.5)
                        elseif tick == 50 and host:isHost() then
                            models.models.ex_skill_3.Gui.Transition:setVisible(true)
                        elseif tick == 53 and host:isHost() then
                            for _, modelPart in ipairs({models.models.ex_skill_3.Gui.Scrollable, models.models.ex_skill_3.Gui.Scrollable2, models.models.ex_skill_3.Gui.Background}) do
                                modelPart:setVisible(false)
                            end
                        elseif tick == 56 then
                            instance.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "SMALL", 5, true)
                            if host:isHost() then
                                models.models.ex_skill_3.Gui.Transition:setVisible(false)
                            end
                        elseif tick == 61 then
                            instance.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "CLOSED", 36, true)
                        elseif tick == 66 and host:isHost() then
                            local windowSize = client:getWindowSize()
                            models.models.ex_skill_3.Gui.WhiteScreen:setVisible(true)
                            models.models.ex_skill_3.Gui.WhiteScreen:setScale(windowSize.x, windowSize.y, 1)
                            models.models.ex_skill_3.Camera.Background:setScale(vectors.vec3(windowSize.x / windowSize.y, 1, 1):scale(40))
                            events.RENDER:register(function (delta, context)
                                models.models.ex_skill_3.Camera:setVisible(context == "RENDER")
                                local backgroundPos = vectors.rotateAroundAxis(player:getBodyYaw(delta) + 180, renderer:getCameraOffsetPivot():copy():add(0, 1.62, 0):add(client:getCameraDir():copy():scale(1.75)), 0, 1, 0):scale(16 / 0.9375)
                                models.models.ex_skill_3.Camera:setOffsetPivot(backgroundPos)
                                models.models.ex_skill_3.Camera.Background:setPos(backgroundPos)
                                local opacity = models.models.ex_skill_3.Camera.COpacity:getAnimScale().x
                                models.models.ex_skill_3.Camera.Background:setOpacity(opacity)
                                models.models.main.Avatar:setColor(vectors.vec3(1, 1, 1):scale(1 - opacity))
                            end, "ex_skill_3_background_render")
                        elseif tick == 69 then
                            Costume.setCostumeTextureOffset(2)
                            for _, modelPart in ipairs({models.models.main.Avatar.Head.Head, models.models.main.Avatar.Head.HatLayer}) do
                                modelPart:setUVPixels(0, 16)
                            end
                            for _, modelPart in ipairs({models.models.main.Avatar.Head.CTracksuitH, models.models.main.Avatar.UpperBody.Body.CTracksuitB, models.models.main.Avatar.UpperBody.Body.BTrinityLogo}) do
                                modelPart:setVisible(false)
                            end
                            for _, modelPart in ipairs({models.models.main.Avatar.Head.CIdolH, models.models.main.Avatar.UpperBody.Body.CIdolB, models.models.main.Avatar.LowerBody.Legs.RightLeg.RightLegBottom.CIdolRLB, models.models.main.Avatar.LowerBody.Legs.LeftLeg.LeftLegBottom.CIdolLLB, models.models.main.Avatar.Head.CTracksuitH.HairbandFront, models.models.main.Avatar.Head.CTracksuitH.Hairband, models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon, models.models.main.Avatar.UpperBody.Body.CTracksuitB.TrinityLogo, models.models.main.Avatar.UpperBody.Body.CTracksuitB.Fastener, models.models.main.Avatar.UpperBody.Body.CTracksuitB.Bag}) do
                                modelPart:setVisible(true)
                            end
                            if not instance.parent.armor.isArmorVisible.helmet then
                                models.models.main.Avatar.Head.Ears.RightEarPivot:setRot(-45, -10, 0)
                            end
                            models.models.ex_skill_3.Stage:setVisible(true)
                            events.RENDER:register(function (delta)
                                for i = 1, 100 do
                                    models.models.ex_skill_3.Stage.PenLights["PenLight"..i]:setRot(0, 0, math.sin((instance.exSkill[3].penLightSwingOffsets[i] + delta * 0.1) * 2 * math.pi) * 40)
                                end
                            end, "ex_skill_3_pen_light_render")
                        elseif tick == 81 and host:isHost() then
                            events.RENDER:remove("ex_skill_3_background_render")
                            for _, modelPart in ipairs({models.models.ex_skill_3.Gui.WhiteScreen, models.models.ex_skill_3.Camera}) do
                                modelPart:setVisible(false)
                            end
                            models.models.main.Avatar:setColor(1, 1, 1)
                        elseif tick == 97 then
                            instance.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "ANXIOUS", 3, true)
                        elseif tick == 100 then
                            instance.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "TRIANGLE", 12, true)
                        elseif tick == 112 then
                            instance.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "SMALL", 16, true)
                        elseif tick == 128 then
                            instance.parent.faceParts:setEmotion("NARROW1", "NARROW1", "SMILE", 2, true)
                        elseif tick == 130 then
                            instance.parent.faceParts:setEmotion("NORMAL", "NORMAL", "SMILE", 17, true)
                        elseif tick == 136 then
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), player:getPos():add(0, 2, 0), 0.1, 2)
                        elseif tick == 147 then
                            instance.parent.faceParts:setEmotion("CLOSED", "CLOSED", "OPENED2", 2, true)
                        elseif tick == 148 then
                            for _ = 1, 4 do
                                table.insert(instance.exSkill[3].particleAnchors, {vectors.rotateAroundAxis(math.random() * 360, 0, math.random() * 1.5 + 0.5, 1.5, 0, 1, 0), vectors.hsvToRGB(math.random() * 0.28 + 0.9, 0.5, 1), math.random()})
                            end
                        elseif tick == 149 then
                            instance.parent.faceParts:setEmotion("INVERTED", "NORMAL", "OPENED2", 22, true)
                        elseif tick == 171 then
                            instance.parent.faceParts:setEmotion("CLOSED", "CLOSED", "SMILE", 4, true)
                        elseif tick == 172 and host:isHost() then
                            models.models.ex_skill_3.Gui.WhiteScreen:setVisible(true)
                        elseif tick == 175 then
                            instance.parent.faceParts:setEmotion("NORMAL", "NORMAL", "OPENED2", 38, true)
                        elseif tick == 176 and host:isHost() then
                            local windowSize = client:getScaledWindowSize()
                            models.models.ex_skill_3.Gui.Frame:setScale(windowSize.x, windowSize.y, 1)
                            models.models.ex_skill_3.Gui.Frame:setVisible(true)
                        elseif tick == 178 then
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), player:getPos():add(0, 2, 0), 1, 1.5)
                            if host:isHost() then
                                models.models.ex_skill_3.Gui.WhiteScreen:setVisible(false)
                            end
                        end

                        for _ = 1, 12 do
                            models.models.ex_skill_3.Stage.StageEmissives:setUVPixels(tick * -1, 0)
                        end
                        if tick >= 69 and tick < 81 then
                            models.models.ex_skill_3.Camera.Background:setUVPixels((tick - 69) * -10, 0)
                        end
                        if tick >= 69 then
                            for i = 1, 100 do
                                instance.exSkill[3].penLightSwingOffsets[i] = instance.exSkill[3].penLightSwingOffsets[i] + 0.1
                                instance.exSkill[3].penLightSwingOffsets[i] = instance.exSkill[3].penLightSwingOffsets[i] > 1 and instance.exSkill[3].penLightSwingOffsets[i] - 1 or instance.exSkill[3].penLightSwingOffsets[i]
                            end
                            if (tick - 69) % 8 == 0 then
                                sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:weather.rain"), player:getPos():add(vectors.rotateAroundAxis(player:getBodyYaw() * -1, 0, 1, 8, 0, 1, 0)), 0.5, 1.5)
                            end
                        end
                        if tick >= 136 then
                            local bodyYaw = player:getBodyYaw()
                            local anchorPos = player:getPos():add(vectors.rotateAroundAxis(bodyYaw * -1, -6, 3, -4, 0, 1, 0))
                            for _ = 1, 2 do
                                particles:newParticle(instance.parent.compatibilityUtils:checkParticle("minecraft:firework"), anchorPos:copy():add(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 12, math.random() * 6, math.random() * 6, 0, 1, 0))):setColor(1, 1, 0.6)
                            end
                        end
                        if tick >= 148 and tick < 166 then
                            local playerPos = player:getPos():add(0, 2, 0)
                            local bodyYaw = player:getBodyYaw() * -1 + models.models.main.Avatar:getAnimRot().y * 0.5
                            for i = 1, 4 do
                                local anchorPos = playerPos:copy():add(vectors.rotateAroundAxis(bodyYaw, instance.exSkill[3].particleAnchors[i][1]:copy():add(0, math.sin(((tick - 148) / 18 + instance.exSkill[3].particleAnchors[i][3]) * 8 * math.pi) * 0.25, 0), 0, 1, 0))
                                particles:newParticle(instance.parent.compatibilityUtils:checkParticle("minecraft:firework"), anchorPos):setScale(1):setVelocity(anchorPos:copy():sub(playerPos):normalize():mul(0.05, 0, 0.05)):setColor(instance.exSkill[3].particleAnchors[i][2]):setGravity(0):setLifetime(213 - tick)
                            end
                        end
                        if tick >= 148 and tick < 176 then
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.experience_orb.pickup"), player:getPos():add(0, 2, 0), 0.5, 1 + ((tick - 148) / 28))
                        end
                    end;

                    onPostAnimation = function (forcedStop)
                        for _, eventName in ipairs({"ex_skill_3_render_global", "ex_skill_3_pen_light_render"}) do
                            events.RENDER:remove(eventName)
                        end
                        models.models.ex_skill_3.Stage:setVisible(false)
                        if host:isHost() then
                            events.RENDER:remove("ex_skill_3_render")
                            for _, modelPart in ipairs({models.models.ex_skill_3.Gui.Scrollable, models.models.ex_skill_3.Gui.Scrollable2, models.models.ex_skill_3.Gui.Background}) do
                                modelPart:setVisible(true)
                            end
                            models.models.ex_skill_3.Gui.Frame:setVisible(false)
                        end
                        if forcedStop then
                            instance.parent.costume.setCostumeTextureOffset(2)
                            for _, modelPart in ipairs({models.models.main.Avatar.Head.Head, models.models.main.Avatar.Head.HatLayer}) do
                                modelPart:setUVPixels(0, 16)
                            end
                            for _, modelPart in ipairs({models.models.main.Avatar.Head.CTracksuitH, models.models.main.Avatar.UpperBody.Body.CTracksuitB, models.models.main.Avatar.UpperBody.Body.BTrinityLogo}) do
                                modelPart:setVisible(false)
                            end
                            for _, modelPart in ipairs({models.models.main.Avatar.Head.CIdolH, models.models.main.Avatar.UpperBody.Body.CIdolB, models.models.main.Avatar.LowerBody.Legs.RightLeg.RightLegBottom.CIdolRLB, models.models.main.Avatar.LowerBody.Legs.LeftLeg.LeftLegBottom.CIdolLLB, models.models.main.Avatar.Head.CTracksuitH.HairbandFront, models.models.main.Avatar.Head.CTracksuitH.Hairband, models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon, models.models.main.Avatar.UpperBody.Body.CTracksuitB.TrinityLogo, models.models.main.Avatar.UpperBody.Body.CTracksuitB.Fastener, models.models.main.Avatar.UpperBody.Body.CTracksuitB.Bag}) do
                                modelPart:setVisible(true)
                            end
                            if not instance.parent.armor.isArmorVisible.helmet then
                                models.models.main.Avatar.Head.Ears.RightEarPivot:setRot(-45, -10, 0)
                            end
                            instance.exSkill[3].penLightSwingOffsets = {}
                            instance.exSkill[3].particleAnchors = {}
                            if host:isHost() then
                                events.RENDER:remove("ex_skill_3_background_render")
                                for _, modelPart in ipairs({models.models.ex_skill_3.Gui.Transition, models.models.ex_skill_3.Gui.WhiteScreen, models.models.ex_skill_3.Camera}) do
                                    modelPart:setVisible(false)
                                end
                                models.models.main.Avatar:setColor(1, 1, 1)
                            end
                        end
                    end;
                };

                ---Exスキルの初期化処理が行われたかどうか
                ---@type boolean
                init = false;

                ---ペンライトの振り時間のオフセット値
                ---@type number[]
                penLightSwingOffsets = {};

                ---くるりんぱする時のパーティクルのアンカー位置
                ---@type table[]
                particleAnchors = {};
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

                    ---前ティックに脚とスカートの調整をしたかどうか
                    ---@type boolean
                    shouldAdjustLegsPrev = false;

                    ---前ティックは脚を隠すべきだったかどうか
                    ---@type boolean
                    shouldHideLegsPrev = false;

                    ---衣装適用時に実行するティック関数
                    ---@type fun()
                    tick = function()
                        if not client:isPaused() then
                            local robeVisible = models.models.main.Avatar.UpperBody.Body.Robe:getVisible()
                            local shouldHideLegs = robeVisible and player:getVehicle() ~= nil
                            if shouldHideLegs and not instance.costume.costumes[1].shouldHideLegsPrev then
                                models.models.main.Avatar.LowerBody.Legs:setVisible(false)
                                models.models.main.Avatar.UpperBody.Body.Robe:setScale(1.5, 0.35, 2)
                            elseif not shouldHideLegs and instance.costume.costumes[1].shouldHideLegsPrev then
                                models.models.main.Avatar.LowerBody.Legs:setVisible(true)
                                models.models.main.Avatar.UpperBody.Body.Robe:setScale()
                            end

                            local shouldAdjustLegs = robeVisible and not shouldHideLegs
                            if shouldAdjustLegs and not instance.costume.costumes[1].shouldAdjustLegsPrev then
                                events.RENDER:register(function ()
                                    local rightLegRotX = vanilla_model.RIGHT_LEG:getOriginRot().x
                                    models.models.main.Avatar.LowerBody.Legs.RightLeg:setRot(rightLegRotX * -0.55, 0, 0)
                                    models.models.main.Avatar.LowerBody.Legs.LeftLeg:setRot(vanilla_model.LEFT_LEG:getOriginRot().x * -0.55, 0, 0)
                                    local rightLegRotAbs = math.abs(rightLegRotX)
                                    models.models.main.Avatar.UpperBody.Body.Robe:setScale(1, 1, rightLegRotAbs * 0.0025 + 1)
                                    local robeScale2 = vectors.vec3(rightLegRotAbs * -0.000625 + 1, 1, rightLegRotAbs * 0.00125 + 1)
                                    models.models.main.Avatar.UpperBody.Body.Robe.Robe2:setScale(robeScale2)
                                    models.models.main.Avatar.UpperBody.Body.Robe.Robe2.Robe3:setScale(robeScale2)
                                end, "costume_default_render")
                            elseif not shouldAdjustLegs and instance.costume.costumes[1].shouldAdjustLegsPrev then
                                events.RENDER:remove("costume_default_render")
                                for _, modelPart in ipairs({models.models.main.Avatar.LowerBody.Legs.RightLeg, models.models.main.Avatar.LowerBody.Legs.LeftLeg}) do
                                    modelPart:setRot()
                                end
                                if not shouldHideLegs then
                                    for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Robe, models.models.main.Avatar.UpperBody.Body.Robe.Robe2, models.models.main.Avatar.UpperBody.Body.Robe.Robe2.Robe3}) do
                                        modelPart:setScale()
                                    end
                                end
                            end

                            instance.costume.costumes[1].shouldHideLegsPrev = shouldHideLegs
                            instance.costume.costumes[1].shouldAdjustLegsPrev = shouldAdjustLegs
                        end
                    end;
                };

                {
                    name = "no_veil";

                    displayName = {
                        en_us = "Default (no veil)";
                        ja_jp = "デフォルト（ベールなし）";
                    };

                    exSkill = 1;
                };

                {
                    name = "tracksuit";

                    displayName = {
                        en_us = "Tracksuit";
                        ja_jp = "体操服";
                    };

                    exSkill = 2;
                };

                {
                    name = "idol";

                    displayName = {
                        en_us = "Idol";
                        ja_jp = "アイドル";
                    };

                    exSkill = 3;

                    ---この衣装の初期化処理が行われたかどうか
                    ---@type boolean
                    init = false;
                };
            };

            callbacks = {
                onChange = function (costumeId)
                    models.models.main.Avatar.Head.Ears:setVisible(true)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.Veil, models.models.main.Avatar.UpperBody.Body.VeilBody}) do
                        modelPart:setVisible(false)
                    end
                    if costumeId == "NO_VEIL" then
                        models.models.main.Avatar.Head.Accessory:setPos(0, -1, 0)
                    end
                    if costumeId == "TRACKSUIT" then
                        instance.parent.costume.setCostumeTextureOffset(1)
                        for _, modelPart in ipairs({models.models.main.Avatar.Head.CTracksuitH, models.models.main.Avatar.UpperBody.Body.CTracksuitB}) do
                            modelPart:setVisible(true)
                        end
                        for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.TrinityLogo, models.models.main.Avatar.UpperBody.Body.FrontHair, models.models.main.Avatar.UpperBody.Body.Robe, models.models.main.Avatar.UpperBody.Body.BackRibbon}) do
                            modelPart:setVisible(false)
                        end
                    elseif costumeId == "IDOL" then
                        instance.parent.costume.setCostumeTextureOffset(2)
                        models.models.main.Avatar.Head.Ears.RightEarPivot:setRot(-45, -10, 0)
                        for _, modelPart in ipairs({models.models.main.Avatar.Head.Head, models.models.main.Avatar.Head.HatLayer}) do
                            modelPart:setUVPixels(0, 16)
                        end
                        for _, modelPart in ipairs({models.models.main.Avatar.Head.CIdolH, models.models.main.Avatar.UpperBody.Body.CIdolB, models.models.main.Avatar.LowerBody.Legs.RightLeg.RightLegBottom.CIdolRLB, models.models.main.Avatar.LowerBody.Legs.LeftLeg.LeftLegBottom.CIdolLLB}) do
                            modelPart:setVisible(true)
                        end
                        for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.TrinityLogo, models.models.main.Avatar.UpperBody.Body.FrontHair, models.models.main.Avatar.UpperBody.Body.Robe, models.models.main.Avatar.UpperBody.Body.BackRibbon, models.models.main.Avatar.Head.Accessory}) do
                            modelPart:setVisible(false)
                        end

                        if not instance.costume.costumes[4].init then
                            for i = 1, 2 do
                                models.models.main.Avatar.Head.CIdolH.Hat["Feather"..i]:setPrimaryTexture("RESOURCE", "minecraft:textures/item/feather.png")
                                models.models.main.Avatar.Head.CIdolH.Hat["Feather"..i]:setColor(0.65, 0.65, 0.65)
                            end
                            instance.costume.costumes[4].init = true
                        end
                    end
                    if costumeId == "TRACKSUIT" or costumeId == "IDOL" then
                        events.TICK:remove("costume_default_tick")
                        events.RENDER:remove("costume_default_render")
                        models.models.main.Avatar.LowerBody.Legs:setVisible(true)
                        for _, modelPart in ipairs({models.models.main.Avatar.LowerBody.Legs.RightLeg, models.models.main.Avatar.LowerBody.Legs.LeftLeg}) do
                            modelPart:setRot()
                        end
                    end
                end;

                onReset = function ()
                    instance.parent.costume.setCostumeTextureOffset(0)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.Ears, models.models.main.Avatar.Head.CTracksuitH, models.models.main.Avatar.UpperBody.Body.CTracksuitB, models.models.main.Avatar.Head.CIdolH, models.models.main.Avatar.UpperBody.Body.CIdolB, models.models.main.Avatar.LowerBody.Legs.RightLeg.RightLegBottom.CIdolRLB, models.models.main.Avatar.LowerBody.Legs.LeftLeg.LeftLegBottom.CIdolLLB}) do
                        modelPart:setVisible(false)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.Veil, models.models.main.Avatar.UpperBody.Body.VeilBody, models.models.main.Avatar.UpperBody.Body.TrinityLogo, models.models.main.Avatar.UpperBody.Body.FrontHair, models.models.main.Avatar.Head.Accessory, models.models.main.Avatar.UpperBody.Body.Robe, models.models.main.Avatar.UpperBody.Body.BackRibbon}) do
                        modelPart:setVisible(true)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.Head, models.models.main.Avatar.Head.HatLayer}) do
                        modelPart:setUVPixels()
                    end
                    models.models.main.Avatar.Head.Accessory:setPos()
                    models.models.main.Avatar.Head.Ears.RightEarPivot:setRot()

                    if events.TICK:getRegisteredCount("costume_default_tick") == 0 then
                        events.TICK:register(instance.costume.costumes[1].tick, "costume_default_tick")
                    end
                end;

                onArmorChange = function (parts, isVisible)
                    if parts == "HELMET" then
                        if isVisible then
                            for _, modelPart in ipairs({models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon, models.models.main.Avatar.Head.CTracksuitH.HairTail}) do
                                modelPart:setPos(0, 0, 1)
                            end
                            models.models.main.Avatar.Head.CIdolH.Hat:setVisible(false)
                            models.models.main.Avatar.Head.Ears.RightEarPivot:setRot()
                        else
                            for _, modelPart in ipairs({models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon, models.models.main.Avatar.Head.CTracksuitH.HairTail}) do
                                modelPart:setPos()
                            end
                            models.models.main.Avatar.Head.CIdolH.Hat:setVisible(true)
                            if instance.parent.costume.currentCostume == 4 then
                                models.models.main.Avatar.Head.Ears.RightEarPivot:setRot(-45, -10, 0)
                            end
                        end
                    elseif parts == "CHEST_PLATE" then
                        if isVisible then
                            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.FrontHair, models.models.main.Avatar.UpperBody.Body.CTracksuitB.FrontHair}) do
                                modelPart:setPos(0, 0, -1)
                            end
                            models.models.main.Avatar.UpperBody.Body.VeilBody:setPos(0, 0, 1)
                            models.models.main.Avatar.UpperBody.Body.CIdolB.NeckRibbon.NeckRibbonBottom:setVisible(false)
                        else
                            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.FrontHair, models.models.main.Avatar.UpperBody.Body.VeilBody, models.models.main.Avatar.UpperBody.Body.CTracksuitB.FrontHair}) do
                                modelPart:setPos()
                            end
                            models.models.main.Avatar.UpperBody.Body.CIdolB.NeckRibbon.NeckRibbonBottom:setVisible(true)
                        end
                    elseif parts == "LEGGINGS" then
                        if isVisible then
                            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Robe, models.models.main.Avatar.UpperBody.Body.BackRibbon, models.models.main.Avatar.UpperBody.Body.CIdolB.Skirt}) do
                                modelPart:setVisible(false)
                            end
                        else
                            if instance.parent.costume.currentCostume <= 2 then
                                for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Robe, models.models.main.Avatar.UpperBody.Body.BackRibbon}) do
                                    modelPart:setVisible(true)
                                end
                            end
                            models.models.main.Avatar.UpperBody.Body.CIdolB.Skirt:setVisible(true)
                        end
                    end
                end
            };
        }

        instance.bubble = {
            callbacks = {
                onPlay = function(type, duration)
                    if duration > 0 then
                        if type == "GOOD" then
                            instance.parent.faceParts:setEmotion("CLOSED", "CLOSED", "SMILE", duration, true)
                        elseif type == "HEART" then
                            instance.parent.faceParts:setEmotion("NORMAL", "NORMAL", "SMILE", duration, true)
                        elseif type == "NOTE" then
                            instance.parent.faceParts:setEmotion("CLOSED", "CLOSED", "OPENED", duration, true)
                        elseif type == "QUESTION" then
                            instance.parent.faceParts:setEmotion("NORMAL", "NORMAL", "ANXIOUS", duration, true)
                        elseif type == "SWEAT" then
                            instance.parent.faceParts:setEmotion("TEAR", "TEAR", "TIRED", duration, true)
                        end
                    end
                end;

                onStop = function(_, forcedStop)
                    if forcedStop then
                        instance.parent.faceParts:resetEmotion()
                    end
                end;
            };
        }

        instance.headBlock = {
            includeModels = {models.models.main.Avatar.UpperBody.Body.FrontHair, models.models.main.Avatar.UpperBody.Body.VeilBody, models.models.main.Avatar.UpperBody.Body.CTracksuitB.FrontHair};
        }

        instance.portrait = {
            includeModels = {};
        }

        instance.deathAnimation = {
            callbacks = {
                onPhase1 = function (dummyAvatar, costume)
                    if costume == "DEFAULT" then
                        for _, modelPart in ipairs({dummyAvatar.Head.Veil.VeilEar.RightVeilEarPivot, dummyAvatar.Head.Veil.VeilEar.LeftVeilEarPivot}) do
                            modelPart:setRot(-30, 0, 0)
                        end
                    elseif costume == "IDOL" then
                        dummyAvatar.Head.Ears.RightEarPivot:setRot(-45, -10, 0)
                        dummyAvatar.Head.Ears.LeftEarPivot:setRot(-30, 0, 0)
                    else
                        for _, modelPart in ipairs({dummyAvatar.Head.Ears.RightEarPivot, dummyAvatar.Head.Ears.LeftEarPivot}) do
                            modelPart:setRot(-30, 0, 0)
                        end
                    end
                    if costume == "TRACKSUIT" then
                        dummyAvatar.Head.CTracksuitH.HairTail:setRot(17.5, 0, 0)
                        dummyAvatar.UpperBody.Body.CTracksuitB.Bag:setPos(3, 2, 0)
                        dummyAvatar.UpperBody.Body.CTracksuitB.Bag:setRot(0, 0, -25)
                    elseif costume == "IDOL" then
                        dummyAvatar.UpperBody.Body.CIdolB.Skirt:setRot(50, 0, 0)
                        for _, modelPart in ipairs({dummyAvatar.Head.CIdolH.HairTails.HairTailRight.HairRightBottom, dummyAvatar.Head.CIdolH.HairTails.HairTailLeft.HairLeftBottom}) do
                            modelPart:setRot(30, 0, 0)
                        end
                    else
                        dummyAvatar.LowerBody:setVisible(false)
                        dummyAvatar.UpperBody.Body.Robe:setScale(1.5, 0.35, 2)
                    end
                end;

                onPhase2 = function (dummyAvatar, costume)
                    if costume == "TRACKSUIT" then
                        dummyAvatar.Head.CTracksuitH.HairTail:setRot(-5, 0, -17.5)
                        dummyAvatar.UpperBody.Body.CTracksuitB.Bag:setPos()
                        dummyAvatar.UpperBody.Body.CTracksuitB.Bag:setRot()
                    elseif costume == "IDOL" then
                        dummyAvatar.UpperBody.Body.CIdolB.Skirt:setRot(30, 0, 0)
                        for _, modelPart in ipairs({dummyAvatar.Head.CIdolH.HairTails.HairTailRight.HairRightBottom, dummyAvatar.Head.CIdolH.HairTails.HairTailLeft.HairLeftBottom}) do
                            modelPart:setRot(-20, 0, 0)
                        end
                    else
                        dummyAvatar.LowerBody:setVisible(true)
                        dummyAvatar.UpperBody.Body.Robe:setRot(30, 0, 0)
                        dummyAvatar.UpperBody.Body.Robe:setScale(1.2, 1, 1)
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
                    models = {models.models.main.Avatar.UpperBody.Body.VeilBody};

                    x = {
                        vertical = {
                            min = -80;
                            neutral = 0;
                            max = 0;

                            bodyX = {
                                multiplayer = -160;
                                min = -80;
                                max = 0;
                            };

                            bodyY = {
                                multiplayer = 160;
                                min = -80;
                                max = 0;
                            };

                            bodyRot = {
                                multiplayer = 0.1;
                                min = -80;
                                max = 0;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.FrontHair, models.models.main.Avatar.UpperBody.Body.CTracksuitB.FrontHair};

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
                    ---この物理演算データを適用させるモデルパーツ
                    ---@type ModelPart | ModelPart[]
                    models = {models.models.main.Avatar.UpperBody.Body.BackRibbon.BackRibbonBottom};

                    x = {
                        vertical = {
                            min = -150;
                            neutral = 0;
                            max = 0;

                            bodyX = {
                                multiplayer = -80;
                                min = -65;
                                max = 0;
                            };

                            bodyY = {
                                multiplayer = 160;
                                min = -150;
                                max = 0;
                            };

                            bodyRot = {
                                multiplayer = 0.1;
                                min = -65;
                                max = 0;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CTracksuitH.HairTail};

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
                    models = {models.models.main.Avatar.Head.CTracksuitH.HairTail.HairTailZPivot};

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
                    models = {models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon.HairBandRibbonTopLeftYPivot};

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
                    models = {models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon.HairBandRibbonTopLeftYPivot.HairBandRibbonTopLeftZPivot};

                    z = {
                        vertical = {
                            min = -40;
                            neutral = 0;
                            max = 40;

                            bodyY = {
                                multiplayer = 20;
                                min = -40;
                                max = 40;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon.HairBandRibbonTopRightYPivot};

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
                    models = {models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon.HairBandRibbonTopRightYPivot.HairBandRibbonTopRightZPivot};

                    z = {
                        vertical = {
                            min = -40;
                            neutral = 0;
                            max = 40;

                            bodyY = {
                                multiplayer = -20;
                                min = -40;
                                max = 40;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon.HairBandRibbonBottom.HairBandRibbonBottomLeftXPivot, models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon.HairBandRibbonBottom.HairBandRibbonBottomRightXPivot};

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
                    models = {models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon.HairBandRibbonBottom.HairBandRibbonBottomLeftXPivot.HairBandRibbonBottomLeftZPivot};

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
                    models = {models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon.HairBandRibbonBottom.HairBandRibbonBottomRightXPivot.HairBandRibbonBottomRightZPivot};

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
                    models = {models.models.main.Avatar.UpperBody.Body.CTracksuitB.Bag.BagHooks.BagHookNorth.IDCard.IDCardXPivot, models.models.main.Avatar.UpperBody.Body.CTracksuitB.Bag.BagBaseFastener1XPivot, models.models.main.Avatar.UpperBody.Body.CTracksuitB.Bag.BagBaseFastener2XPivot, models.models.main.Avatar.UpperBody.Body.CTracksuitB.Bag.BackPocket.BackPocketFastenerXPivot, models.models.main.Avatar.UpperBody.Body.CIdolB.NeckRibbon.NeckRibbonBottom},

                    x = {
                        vertical = {
                            min = 0;
                            neutral = 0;
                            max = 80;
                            sneakOffset = 30;

                            bodyX = {
                                multiplayer = -160;
                                min = 0;
                                max = 80;
                            };

                            bodyY = {
                                multiplayer = -160;
                                min = 0;
                                max = 80
                            };

                            bodyRot = {
                                multiplayer = -0.1;
                                min = 0;
                                max = 80;
                            };
                        };
                    };
                };

                {
                    models =  {models.models.main.Avatar.UpperBody.Body.CTracksuitB.Bag.BagHooks.BagHookNorth.IDCard.IDCardXPivot.IDCardZPivot, models.models.main.Avatar.UpperBody.Body.CTracksuitB.Bag.BagBaseFastener1XPivot.BagBaseFastener1ZPivot, models.models.main.Avatar.UpperBody.Body.CTracksuitB.Bag.BagBaseFastener2XPivot.BagBaseFastener2ZPivot, models.models.main.Avatar.UpperBody.Body.CTracksuitB.Bag.BackPocket.BackPocketFastenerXPivot.BackPocketFastenerZPivot, models.models.main.Avatar.UpperBody.Body.CIdolB.NeckRibbon.NeckRibbonBottom.NeckRibbonBottomZPivot},

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
                    models = {models.models.main.Avatar.Head.CIdolH.HairTails.HairTailLeft.HairLeftBottom};

                    x = {
                        vertical = {
                            min = -165;
                            neutral = 0;
                            max = 10;
                            headRotMultiplayer = -1;

                            headX = {
                                multiplayer = -80;
                                min = -82.5;
                                max = 10;
                            };

                            headRot = {
                                multiplayer = 0.05;
                                min = -82.5;
                                max = 0;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -165;
                                max = 7.5;
                            };
                        };

                        horizontal = {
                            min = -155;
                            neutral = -45;
                            max = -45;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CIdolH.HairTails.HairTailLeft.HairLeftBottom.HairLeftBottomZ};

                    z = {
                        vertical = {
                            min = -80;
                            neutral = 0;
                            max = 100;

                            headZ = {
                                multiplayer = -80;
                                min = -80;
                                max = 100;
                            };
                        };

                        horizontal = {
                            min = -80;
                            neutral = 0;
                            max = 100;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CIdolH.HairTails.HairTailRight.HairRightBottom};

                    x = {
                        vertical = {
                            min = -165;
                            neutral = 0;
                            max = 10;
                            headRotMultiplayer = -1;

                            headX = {
                                multiplayer = -80;
                                min = -82.5;
                                max = 10;
                            };

                            headRot = {
                                multiplayer = 0.05;
                                min = -82.5;
                                max = 0;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -165;
                                max = 7.5;
                            };
                        };

                        horizontal = {
                            min = -155;
                            neutral = -45;
                            max = -45;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CIdolH.HairTails.HairTailRight.HairRightBottom.HairRightBottomZ};

                    z = {
                        vertical = {
                            min = -100;
                            neutral = 0;
                            max = 80;

                            headZ = {
                                multiplayer = -80;
                                min = -100;
                                max = 80;
                            };
                        };

                        horizontal = {
                            min = -100;
                            neutral = -20;
                            max = 80;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CIdolH.Hat.HatVeil};

                    x = {
                        vertical = {
                            min = 0;
                            neutral = 0;
                            max = 0;
                            headRotMultiplayer = -1;
                        };
                    };

                    z = {
                        vertical = {
                            min = -35;
                            neutral = 0;
                            max = 150;

                            bodyY = {
                                multiplayer = -80;
                                min = 0;
                                max = 150;
                            };

                            headZ = {
                                multiplayer = -80;
                                min = -35;
                                max = 90;
                            };

                            headRot = {
                                multiplayer = -0.05;
                                min = 0;
                                max = 90;
                            };
                        };

                        horizontal = {
                            min = -35;
                            neutral = 10;
                            max = 150;

                            bodyX = {
                                multiplayer = -80;
                                min = 0;
                                max = 150;
                            };
                        };
                    };
                };
            };

            callbacks = {
                onPhysicPerformed = function (model)
                    if model == models.models.main.Avatar.Head.CTracksuitH.HairTail then
                        model:setRot(math.min(model:getRot().x, 20), 0, 0)
                    elseif model == models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon.HairBandRibbonTopRightYPivot then
                        model:setRot(0, math.min(model:getRot().y, 0), 0)
                    elseif model == models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon.HairBandRibbonTopLeftYPivot then
                        model:setRot(0, math.max(model:getRot().y, 0), 0)
                    elseif model == models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon.HairBandRibbonBottom.HairBandRibbonBottomRightXPivot or model == models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon.HairBandRibbonBottom.HairBandRibbonBottomLeftXPivot then
                        model:setRot(math.min(model:getRot().x, 0), 0, 0)
                    end
                end
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
        events.TICK:register(self.costume.costumes[1].tick, "costume_default_tick")
    end;
}