---@alias BlueArchiveCharacter.RightEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "SURPRISED2" # 驚いて下を見る目
---| "ANGRY" # 怒っている目
---| "ANXIOUS" # 不満な目
---| "UNEQUAL" # ><
---| "ANGRY_CENTER" # 怒りつつ少し反対側を見る目

---@alias BlueArchiveCharacter.LeftEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "SURPRISED2" # 驚いて下を見る目
---| "ANGRY" # 怒っている目
---| "ANGRY2" # 怒っている目
---| "ANXIOUS" # 不満な目
---| "UNEQUAL" # ><
---| "ANGRY_INVERTED" # 怒りつつ反対側を見る目
---| "CENTER" # 少し反対側を見る目

---@alias BlueArchiveCharacter.MouthTextures
---| "NORMAL" # 通常
---| "FUN" # 「美味しそう」な口
---| "ANXIOUS" # 口を膨らませる
---| "SHOCK" # あんぐり
---| "OPENED" # 開いた口
---| "SMILE" # こっちを舐め腐っているにっこり
---| "TRIANGLE" # 三角口

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
---| "MAID" # メイド

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
---@field public onArmStateChanged? fun(right: integer, left: integer): {right?: integer, left?: integer}|nil 腕の状態が変更された際のコールバック関数
---@field public onAdditionalRightArmProcess? fun(state: integer) 右腕の追加処理
---@field public onAdditionalLeftArmProcess? fun(state: integer) 左腕の追加処理

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
---@field public onMainHandChange? fun(direction: Gun.HandDirection) 利き手が変更されたときに呼び出される関数

---@class (exact) BlueArchiveCharacter.PlacementObjectBoundingBoxSet 設置物の当たり判定のデータセット
---@field public offsetPos? Vector3 設置物の底の中心点のオフセット位置（任意）。基準点は(0, 0, 0)。
---@field public size? Vector3 当たり判定の大きさ。BlockBenchでのサイズの値をそのまま入力する。基準点はモデルの底面の中心。

---@class (exact) BlueArchiveCharacter.PlacementObjectCallbacksSet 設置物のコールバック関数のセット
---@field public onInit? fun(placementObject: PlacementObject) 設置物インスタンスが生成された直後に呼ばれる関数
---@field public onDeinit? fun(placementObject: PlacementObject) 設置物インスタンスが破棄される直前に呼ばれる関数
---@field public onTick? fun(placementObject: PlacementObject) 各ティック毎に呼ばれる関数
---@field public onRender? fun(placementObject: PlacementObject) 各レンダーティック毎に呼ばれる関数
---@field public onGround? fun(placementObject: PlacementObject) 設置物が接地した瞬間に呼ばれる関数

---@class (exact) BlueArchiveCharacter.ExSkillCameraSet Exスキルアニメーション中のカメラワークのセット
---@field public start BlueArchiveCharacter.ExSkillCameraPositionSet Exスキルアニメーション開始地点
---@field public fin BlueArchiveCharacter.ExSkillCameraPositionSet Exスキルアニメーション終了地点

---@class (exact) BlueArchiveCharacter.ExSkillCameraPositionSet Exスキルアニメーション中のカメラワークの開始/終了地点の位置のデータセット
---@field public pos Vector3 カメラの位置
---@field public rot Vector3 カメラの方向

---@class (exact) BlueArchiveCharacter.ExSkillCallbacks Exスキルのコールバック関数のセット
---@field public onPreTransition? fun() Exスキルアニメーション開始前のトランジション開始前に実行されるコールバック関数
---@field public onPreAnimation? fun() Exスキルアニメーション開始前のトランジション終了後に実行されるコールバック関数
---@field public onAnimationTick? fun(tick: integer) Exスキルアニメーション再生中のみ実行されるティック関数
---@field public onPostAnimation? fun(forcedStop: boolean) Exスキルアニメーション終了後のトランジション開始前に実行されるコールバック関数
---@field public onPostTransition? fun(forcedStop: boolean) Exスキルアニメーション終了後のトランジション終了後に実行されるコールバック関数

---@class BlueArchiveCharacter.CostumeDataSet コスチュームのデータセット
---@field public name string コスチュームの内部名
---@field public displayName BlueArchiveCharacter.LocaleStringSet コスチュームの表示名
---@field public exSkill integer コスチュームに対応するExスキルのインデックス番号
---@field public subExSkill? integer コスチュームに対応するサブExスキルのインデックス番号

---@class (exact) BlueArchiveCharacter.CostumeCallbacks コスチュームのコールバック関数のセット
---@field public onChange? fun(costumeId: BlueArchiveCharacter.Costumes) 衣装が変更されたときに実行されるコールバック関数。デフォルトの衣装はここに含めない。
---@field public onReset? fun() 衣装がリセットされたときに実行されるコールバック関数。あらゆる衣装からデフォルトの衣装へ推移できるようにする。
---@field public onArmorChange? fun(parts: Armor.ArmorPart, isVisible: boolean) 防具が変更された（防具が見える/見えない）ときに実行されるコールバック関数

---@class (exact) BlueArchiveCharacter.BubbleCallbacks 吹き出しエモートのコールバック関数のセット
---@field public onPlay? fun(type: Bubble.BubbleType, duration: integer, showInGui: boolean) 吹き出しエモートが再生された時に実行されるコールバック関数
---@field public  onStop? fun(type: Bubble.BubbleType, forcedStop: boolean) 吹き出しアニメーション終了時に実行されるコールバック関数

---@class (exact) BlueArchiveCharacter.HeadBlockCallbacks 頭ブロックのコールバック関数のセット
---@field public onBeforeModelCopy? fun() モデルのコピー直前に実行される関数
---@field public onAfterModelCopy? fun() モデルのコピー直後に実行される関数

---@class (exact) BlueArchiveCharacter.DeathAnimationCallbacks 死亡アニメーションのコールバック関数のセット
---@field public onPhase1? fun(dummyAvatar: ModelPart, costume: BlueArchiveCharacter.Costumes) 死亡アニメーションが再生された直後に実行される関数
---@field public onPhase2? fun(dummyAvatar: ModelPart, costume: BlueArchiveCharacter.Costumes) ダミーアバターが縄ばしごにつかまった直後に実行される関数
---@field public onBeforeModelCopy? fun() モデルのコピー直前に実行される関数
---@field public onAfterModelCopy? fun() モデルのコピー直後に実行される関数

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
---@field public onPhysicPerformed? fun(model: ModelPart) 物理演算処理後に実行されるコールバック関数（省略可）。ここでモデルパーツの向きを上書きできる。

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
                en_us = "Momoi";
                ja_jp = "モモイ";
            };

            lastName = {
                en_us = "Saiba";
                ja_jp = "才羽";
            };

            clubName = {
                en_us = "Game Development Club";
                ja_jp = "ゲーム開発部";
            };

            birth = {
                month = 12;
                day = 8;
            };
        }

        instance.faceParts = {
            rightEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(2, 0); --必須
                TIRED = vectors.vec2(4, 0); --必須
                CLOSED = vectors.vec2(3, 0); --必須
                SURPRISED2 = vectors.vec2(5, 0);
                ANGRY = vectors.vec2(6, 0);
                ANXIOUS = vectors.vec2(1, 1);
                UNEQUAL = vectors.vec2(3, 1);
                ANGRY_CENTER = vectors.vec2(7, 0);
            };

            leftEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(1, 0); --必須
                TIRED = vectors.vec2(3, 0); --必須
                CLOSED = vectors.vec2(2, 0); --必須
                SURPRISED2 = vectors.vec2(4, 0);
                ANGRY2 = vectors.vec2(-1, 1);
                ANXIOUS = vectors.vec2(1, 1);
                UNEQUAL = vectors.vec2(2, 1);
                ANGRY = vectors.vec2(7, 0);
                ANGRY_INVERTED = vectors.vec2(8, 0);
                CENTER = vectors.vec2(3, 1);
            };

            mouth = {
                OPENED = vectors.vec2(0, 0);
                FUN = vectors.vec2(3, 0);
                ANXIOUS = vectors.vec2(2, 0);
                SHOCK = vectors.vec2(1, 0);
                ANGRY = vectors.vec2(0, 1);
                SMILE = vectors.vec2(2, 1);
                TRIANGLE = vectors.vec2(3, 1);
            };

            emotionSet = {
                onDamage = {
                    rightEye = "SURPRISED";
                    leftEye = "SURPRISED";
                    mouth = "SHOCK";
                };
                onDied = {
                    rightEye = "SURPRISED";
                    leftEye = "SURPRISED";
                    mouth = "SHOCK";
                };
            };
        }

        instance.arms = {

        }

        instance.skirt = {
            skirtModels = {models.models.main.Avatar.UpperBody.Body.Skirt, models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1};
        }

        instance.gun = {
            scale = 1.5;

            gunPosition = {
                hold = {
                    type = "NORMAL";

                    firstPersonPos = {
                        right = vectors.vec3(-0.5, 3, -8);
                        left = vectors.vec3(0.5, 3, -8);
                    };

                    thirdPersonPos = {
                        right = vectors.vec3(-2, 3, -6);
                        left = vectors.vec3(2, 3, -6);
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
        }

        instance.exSkill = {
            {
                name = {
                    en_us = "The anguish of creation";
                    ja_jp = "生みの苦しみ";
                };

                formationType = "STRIKER";

                models = {models.models.main.Avatar.Head.EffectPanel, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.GameConsole1, models.models.ex_skill_1.Midori, models.models.ex_skill_1.Gui};

                animations = {"main", "ex_skill_1"};

                camera = {
                    start = {
                        rot = vectors.vec3(-10, 200, -25);
                        pos = vectors.vec3(-12, 7, -28);
                    };

                    fin = {
                        rot = vectors.vec3(10, 40, 0);
                        pos = vectors.vec3(4, 18, 15);
                    };
                };

                callbacks = {
                    onPreAnimation = function ()
                        if not instance.exSkill[1].init then
                            models.models.ex_skill_1.Midori.MidoriUpperBody.MidoriArms.MidoriLeftArm.MidoriLeftArmBottom.GameConsole2:addChild(models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.GameConsole1:copy("GameConsole2"))
                            --BlueArchiveCharacter.ExSkill1TextAnimations = {ExSkillTextAnimation.new("damage_indicator_1", "4"), ExSkillTextAnimation.new("damage_indicator_2", "3"), ExSkillTextAnimation.new("damage_indicator_3", "5")}
                            if host:isHost() then
                                models.models.ex_skill_1.Gui.UI:newText("ex_skill_1_ko"):setText("§cK.O."):setScale(1.5, 1.5, 1.5):setAlignment("CENTER"):setOutline(true):setOutlineColor(0.33, 0, 0):setVisible(false)
                                models.models.ex_skill_1.Gui.TextAnchor:newText("ex_skill_1:text"):setText("§d§lMOMOI"):setScale(4, 4, 4):setAlignment("RIGHT"):setOutline(true):setOutlineColor(1, 1, 1)
                                models.models.ex_skill_1.Gui.UI.MomoiUI.Background:setColor(0.71, 0.082, 0.067)
                                for _, modelPart in ipairs({models.models.ex_skill_1.Gui.UI.MomoiUI.YellowBar, models.models.ex_skill_1.Gui.UI.MomoiUI.RedBar}) do
                                    modelPart:setPrimaryRenderType("EMISSIVE_SOLID")
                                end
                                models.models.ex_skill_1.Gui.UI.MomoiUI:newText("ex_skill_1_momoi_name"):setText("§d§lMOMOI"):setPos(130, 13, 0):setScale(1.5, 1.5, 1.5):setOutline(true):setOutlineColor(1, 1, 1)
                                models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll:setScale(2.3, 2.3, 2.3)
                                models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll:addChild(instance.parent.modelUtils:copyModel(models.script_head_block.Head, "MomoiPaperDollHead"))
                                models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead:setPos(models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll:getTruePivot():add(0, -24, 0))
                                models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.HeadRing:setPrimaryRenderType("CUTOUT_EMISSIVE_SOLID")
                                models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts:addChild(models.models.main.Avatar.Head.FaceParts.Mouth:copy("Mouth"))
                                models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.Mouth:setUVPixels(16, 16)
                                models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.Mouth:setVisible(true)
                                models.models.ex_skill_1.Gui.UI.DeadEye:moveTo(models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts)
                                for _, modelPart in ipairs(models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll:getChildren()) do
                                    modelPart:setVisible(false)
                                end
                                models.models.ex_skill_1.Gui.UI:addChild(instance.parent.modelUtils:copyModel(models.models.ex_skill_1.Gui.UI.MomoiUI, "MidoriUI"))
                                for _, modelPart in ipairs(models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll:getChildren()) do
                                    modelPart:setVisible(true)
                                end
                                models.models.ex_skill_1.Gui.UI.MidoriUI.Frame:setRot(0, 180, 0)
                                models.models.ex_skill_1.Gui.UI.MidoriUI.Background:setPos(-139.5, 0, 0)
                                models.models.ex_skill_1.Gui.UI.MidoriUI.Background:setColor(0.098, 0.2, 0.686)
                                models.models.ex_skill_1.Gui.UI.MidoriUI.YellowBar:setPos(36, 0, 0)
                                models.models.ex_skill_1.Gui.UI.MidoriUI.YellowBar:setOffsetPivot(-135, 0, 0)
                                models.models.ex_skill_1.Gui.UI.MidoriUI.YellowBar:setScale(0.7, 1, 1)
                                models.models.ex_skill_1.Gui.UI.MidoriUI.YellowBar:setPrimaryRenderType("EMISSIVE_SOLID")
                                models.models.ex_skill_1.Gui.UI.MidoriUI.RedBar:remove()
                                models.models.ex_skill_1.Gui.UI.MidoriPaperDollBody:moveTo(models.models.ex_skill_1.Gui.UI.MidoriUI.PaperDoll)
                                models.models.ex_skill_1.Gui.UI.MidoriUI.PaperDoll.MidoriPaperDollBody:setPos(-139, 0, 0)
                                models.models.ex_skill_1.Gui.UI.MidoriUI.PaperDoll:setPos(0, 0, 0)
                                models.models.ex_skill_1.Gui.UI.MidoriUI.PaperDoll:setRot(0, -15, 0)
                                models.models.ex_skill_1.Gui.UI.MidoriUI.PaperDoll:setOffsetPivot(-139, 0, 0)
                                models.models.ex_skill_1.Gui.UI.MidoriUI.PaperDoll:addChild(instance.parent.modelUtils:copyModel(models.models.ex_skill_1.Midori.MidoriHead, "MidoriPaperDollHead"))
                                models.models.ex_skill_1.Gui.UI.MidoriUI.PaperDoll.MidoriPaperDollHead:setPos(models.models.ex_skill_1.Gui.UI.MidoriUI.PaperDoll:getTruePivot():add(0, -24, 0))
                                models.models.ex_skill_1.Gui.UI.MidoriUI.PaperDoll.MidoriPaperDollHead.MidoriHeadRing:setPrimaryRenderType("CUTOUT_EMISSIVE_SOLID")
                                models.models.ex_skill_1.Gui.UI.MidoriUI:newText("ex_skill_1_midori_name"):setText("§a§lMIDORI"):setPos(48, 13, 0):setScale(1.5, 1.5, 1.5):setOutline(true):setOutlineColor(1, 1, 1):setAlignment("RIGHT")
                            end
                            instance.exSkill[1].init = true
                        end
                        if host:isHost() then
                            models.models.ex_skill_1.Gui.UI.MidoriUI:setPos(client:getScaledWindowSize().x * -1 + 220, 0, 0)
                        end
                    end;

                    onAnimationTick = function (tick)
                        if tick == 0 then
                            instance.parent.faceParts:setEmotion("NORMAL", "NORMAL", "FUN", 16, true)
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:block.note_block.bit"), player:getPos(), 1, 1.5)
                        elseif tick == 1 then
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:block.note_block.bit"), player:getPos(), 1, 1.75)
                        elseif tick == 2 then
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:block.note_block.bit"), player:getPos(), 1, 2)
                        elseif tick == 14 then
                            for _, modelPart in ipairs({models.models.ex_skill_1.Midori.MidoriHead.MidoriFaceParts.Eyes.EyeLeft, models.models.ex_skill_1.Midori.MidoriHead.MidoriFaceParts.Eyes.EyeRight}) do
                                modelPart:setUVPixels(12, 0)
                            end
                        elseif tick == 16 then
                            instance.parent.faceParts:setEmotion("ANXIOUS", "ANXIOUS", "ANXIOUS", 24, true)
                        elseif tick == 24 then
                            --BlueArchiveCharacter.ExSkill1TextAnimations[1]:play()
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.generic.hurt"), player:getPos(), 0.25, 1)
                            if host:isHost() then
                                models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll:setColor(1, 0.75, 0.75)
                                models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.Eyes.EyeRight:setUVPixels(6, 0)
                                models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.Eyes.EyeLeft:setUVPixels(12, 0)
                                models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.Mouth:setUVPixels(16, 0)
                            end
                        elseif tick == 27 and host:isHost() then
                            models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll:setColor()
                            for _, modelPart in ipairs({models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.Eyes.EyeRight, models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.Eyes.EyeLeft}) do
                                modelPart:setUVPixels()
                            end
                            models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.Mouth:setUVPixels(16, 16)
                        elseif tick == 31 then
                            --BlueArchiveCharacter.ExSkill1TextAnimations[2]:play()
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.generic.hurt"), player:getPos(), 0.25, 1)
                            if host:isHost() then
                                models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll:setColor(1, 0.75, 0.75)
                                models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.Eyes.EyeRight:setUVPixels(6, 0)
                                models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.Eyes.EyeLeft:setUVPixels(12, 0)
                                models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.Mouth:setUVPixels(16, 0)
                            end
                        elseif tick == 34 and host:isHost() then
                            models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll:setColor()
                            for _, modelPart in ipairs({models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.Eyes.EyeRight, models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.Eyes.EyeLeft}) do
                                modelPart:setUVPixels()
                            end
                            models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.Mouth:setUVPixels(16, 16)
                        elseif tick == 36 then
                            --BlueArchiveCharacter.ExSkill1TextAnimations[3]:play()
                            local playerPos = player:getPos()
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.generic.hurt"), playerPos, 0.25, 1)
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), playerPos, 1, 1.5)
                            if host:isHost() then
                                models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll:setColor(1, 0.75, 0.75)
                                models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.Eyes:setVisible(false)
                                models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.Mouth:setUVPixels(16, 8)
                                models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.DeadEye:setVisible(true)
                                local task = models.models.ex_skill_1.Gui.UI:getTask("ex_skill_1_ko")
                                task:setPos(client:getScaledWindowSize().x / 2 * -1, -12, -30)
                                task:setVisible(true)
                                events.RENDER:register(function (delta)
                                    local count = instance.parent.exSkill.animationCount - 37 + delta
                                    task:setScale(vectors.vec3(1, 1, 1):scale(count <= 1.5 and (-1.667 * count + 5) or (count + 1)))
                                end, "ex_skill_1_ko_render")
                            end
                        elseif tick == 38 then
                            models.models.ex_skill_1.Midori.MidoriHead.MidoriFaceParts.Eyes.EyeLeft:setUVPixels(24, 0)
                            models.models.ex_skill_1.Midori.MidoriHead.MidoriFaceParts.Eyes.EyeRight:setUVPixels(18, 0)
                            if host:isHost() then
                                events.RENDER:remove("ex_skill_1_ko_render")
                                models.models.ex_skill_1.Gui.UI:getTask("ex_skill_1_ko"):setScale(3, 3, 3)
                            end
                        elseif tick == 40 then
                            instance.parent.faceParts:setEmotion("CLOSED", "CLOSED", "ANXIOUS", 3, true)
                            models.models.ex_skill_1.Midori.MidoriUpperBody.MidoriArms.MidoriLeftArm.MidoriLeftArmBottom.GameConsole2:moveTo(models.models.ex_skill_1.Midori.MidoriLowerBody.MidoriLegs)
                            for _, modelPart in ipairs({models.models.ex_skill_1.Midori.MidoriHead.MidoriFaceParts.Eyes.EyeLeft, models.models.ex_skill_1.Midori.MidoriHead.MidoriFaceParts.Eyes.EyeRight}) do
                                modelPart:setUVPixels()
                            end
                        elseif tick == 43 then
                            instance.parent.faceParts:setEmotion("SURPRISED2", "SURPRISED2", "SHOCK", 24, true)
                        elseif tick == 66 then
                            models.models.ex_skill_1.Midori.MidoriHead.MidoriFaceParts.Eyes.EyeLeft:setUVPixels(24, 0)
                            models.models.ex_skill_1.Midori.MidoriHead.MidoriFaceParts.Eyes.EyeRight:setUVPixels(18, 0)
                        elseif tick == 67 then
                            models.models.ex_skill_1.Gui.UI:setVisible(false)
                            instance.parent.faceParts:setEmotion("ANGRY", "ANGRY2", "ANGRY", 41, true)
                            models.models.main.Avatar.Head.EffectPanel:setUVPixels(9, 0)
                            if host:isHost() then
                                models.models.ex_skill_1.Gui.TextAnchor:setVisible(true)
                                events.RENDER:register(function ()
                                    local windowSize = client:getScaledWindowSize()
                                    models.models.ex_skill_1.Gui.TextAnchor:setPos(models.models.ex_skill_1.Gui.TextAnchor:getAnimPos():scale(windowSize.y / 2 / 100):add(0, windowSize.y * -1 + 30, 0))
                                end, "ex_skill_1_text_render")
                            end
                        elseif tick == 83 then
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.generic.explode"), player:getPos(), 0.25, 0.5)
                        end
                        if tick <= 38 and math.random() >= 0.75 then
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:block.note_block.bit"), player:getPos(), 0.1, 2)
                        end
                        if tick <= 38 and tick % 3 == 0 and host:isHost() then
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.player.attack.nodamage"), player:getPos(), 0.25, 1)
                        end
                    end;

                    onPostAnimation = function (forcedStop)
                        for _, modelPart in ipairs({models.models.main.Avatar.Head.EffectPanel, models.models.ex_skill_1.Midori.MidoriHead.MidoriFaceParts.Eyes.EyeLeft, models.models.ex_skill_1.Midori.MidoriHead.MidoriFaceParts.Eyes.EyeRight}) do
                            modelPart:setUVPixels()
                        end
                        if models.models.ex_skill_1.Midori.MidoriLowerBody.MidoriLegs.GameConsole2 ~= nil then
                            models.models.ex_skill_1.Midori.MidoriLowerBody.MidoriLegs.GameConsole2:moveTo(models.models.ex_skill_1.Midori.MidoriUpperBody.MidoriArms.MidoriLeftArm.MidoriLeftArmBottom)
                        end
                        if forcedStop then
                            for i = 1, 3 do
                                --BlueArchiveCharacter.ExSkill1TextAnimations[i]:stop()
                            end
                        end
                        if host:isHost() then
                            for _, modelPart in ipairs({models.models.ex_skill_1.Gui.UI, models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.Eyes}) do
                                modelPart:setVisible(true)
                            end
                            for _, modelPart in ipairs({models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.DeadEye, models.models.ex_skill_1.Gui.TextAnchor}) do
                                modelPart:setVisible(false)
                            end
                            models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.Mouth:setUVPixels(16, 16)
                            models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll:setColor()
                            models.models.ex_skill_1.Gui.UI:getTask("ex_skill_1_ko"):setVisible(false)
                            for _, eventName in ipairs ({"ex_skill_1_text_render", "ex_skill_1_ko_render"}) do
                                events.RENDER:remove(eventName)
                            end
                            if forcedStop then
                                for _, modelPart in ipairs({models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.Eyes.EyeRight, models.models.ex_skill_1.Gui.UI.MomoiUI.PaperDoll.MomoiPaperDollHead.FaceParts.Eyes.EyeLeft}) do
                                    modelPart:setUVPixels()
                                end
                            end
                        end
                    end;
                };

                ---このExスキルの初期化処理が行われたかどうか
                ---@type boolean
                init = false;
            };

            {
                name = {
                    en_us = "Virtual・Maid・Weapon!";
                    ja_jp = "バーチャル・メイドウェポン！";
                };

                formationType = "STRIKER";

                models = {models.models.ex_skill_2};

                animations = {"main", "costume_maid", "gun", "ex_skill_2"};

                camera = {
                    start = {
                        rot = vectors.vec3(20, -155, 0);
                        pos = vectors.vec3(9, 32, -47);
                    };
                    fin = {
                        rot = vectors.vec3(45, -210, 0);
                        pos = vectors.vec3(19, 36.1, -14.5);
                    };
                };

                callbacks = {
                    onPreAnimation = function ()
                        if not instance.exSkill[2].init then
                            for _, modelPart in ipairs({models.models.ex_skill_2.Pillagers.Pillager1.Pillager1Head.PillagerHead, models.models.ex_skill_2.Pillagers.Pillager1.Pillager1Head.Pillager1Nose, models.models.ex_skill_2.Pillagers.Pillager1.Pillager1Body, models.models.ex_skill_2.Pillagers.Pillager1.Pillager1RightArm, models.models.ex_skill_2.Pillagers.Pillager1.Pillager1LeftArm, models.models.ex_skill_2.Pillagers.Pillager1.Pillager1RightLeg, models.models.ex_skill_2.Pillagers.Pillager1.Pillager1LeftLeg}) do
                                modelPart:setPrimaryTexture("RESOURCE", "minecraft:textures/entity/illager/pillager.png")
                            end
                            for _, part in ipairs({"Head", "Body", "RightArm", "LeftArm", "RightLeg", "LeftLeg"}) do
                                for i = 2, 3 do
                                    models.models.ex_skill_2.Pillagers["Pillager"..i]["Pillager"..i..part]:addChild(instance.parent.modelUtils:copyModel(models.models.ex_skill_2.Pillagers.Pillager1["Pillager1"..part]))
                                end
                            end
                            for y = 0, 1 do
                                for x = 0, 1 do
                                    models.models.ex_skill_2.Covers.CoverLeft:newBlock("ex_skill_2_block_"..y * 2 + x):setBlock(instance.parent.compatibilityUtils:checkBlock("minecraft:barrel", "[facing=up]")):setPos(x * 16, y * 16, 0)
                                end
                            end
                            models.models.ex_skill_2.Covers.CoverLeft:newBlock("ex_skill_2_block_4"):setBlock(instance.parent.compatibilityUtils:checkBlock("minecraft:barrel", "[facing=up]")):setPos(16, 0, -16)
                            --models.models.ex_skill_2.Covers.CoverLeft:newBlock("ex_skill_2_block_5"):setBlock(instance.parent.compatibilityUtils:checkBlock("minecraft:decorated_pot")):setPos(16, 16, -16) --ブロックタスクで何故か飾り壺が描画されない...
                            for i = 0, 1 do
                                models.models.ex_skill_2.Covers.CoverRight:newBlock("ex_skill_2_block_"..6 + i):setBlock(instance.parent.compatibilityUtils:checkBlock("minecraft:barrel", "[facing=up]")):setPos(-16, i * 16, 0)
                            end
                            for i = 0, 1 do
                                models.models.ex_skill_2.Covers.CoverRight:newBlock("ex_skill_2_block_"..8 + i):setBlock(instance.parent.compatibilityUtils:checkBlock("minecraft:barrel", "[facing=up]")):setPos(-32, 0, i * -16)
                            end
                            for i = 0, 1 do
                                models.models.ex_skill_2.Covers.CoverBack1:newBlock("ex_skill_2_block_"..10 + i):setBlock(instance.parent.compatibilityUtils:checkBlock("minecraft:barrel", "[facing=up]")):setPos(i * 16, 0, 0)
                            end
                            models.models.ex_skill_2.Covers.CoverBack1:newBlock("ex_skill_2_block_12"):setBlock(instance.parent.compatibilityUtils:checkBlock("minecraft:barrel", "[facing=up]")):setPos(16, 16, 0)
                            --models.models.ex_skill_2.Covers.CoverBack1:newBlock("ex_skill_2_block_13"):setBlock(instance.parent.compatibilityUtils:checkBlock("minecraft:decorated_pot")):setPos(0, 16, 0) --ブロックタスクで何故か飾り壺が描画されない...
                            for i = 0, 1 do
                                models.models.ex_skill_2.Covers.CoverBack2:newBlock("ex_skill_2_block_"..14 + i):setBlock(instance.parent.compatibilityUtils:checkBlock( "minecraft:chiseled_bookshelf", "[facing=north,slot_0_occupied=true,slot_1_occupied=true,slot_2_occupied=true,slot_3_occupied=true,slot_4_occupied=true,slot_5_occupied=true]")):setPos(-8, i * 16, -8)
                            end
                            for i = 0, 1 do
                                models.models.ex_skill_2.Covers.CoverBack3:newBlock("ex_skill_2_block_"..16 + i):setBlock(instance.parent.compatibilityUtils:checkBlock("minecraft:red_wool")):setPos(-8, i * 16, -8)
                            end
                            models.models.ex_skill_2.Covers.CoverBack4:newBlock("ex_skill_2_block_18"):setBlock(instance.parent.compatibilityUtils:checkBlock("minecraft:dark_oak_planks")):setPos(0, 0, 0)
                            --models.models.ex_skill_2.Covers.CoverBack4:newBlock("ex_skill_2_block_19"):setBlock(instance.parent.compatibilityUtils:checkBlock("minecraft:decorated_pot")):setPos(-16, 16, 0) --ブロックタスクで何故か飾り壺が描画されない...
                            for y = 0, 6 do
                                for x = 0, 8 do
                                    local blockCount = y * 9 + x
                                    if blockCount == 13 or blockCount == 22 or blockCount == 29 or blockCount == 30 or blockCount == 32 or blockCount == 33 or blockCount == 40 or blockCount == 49 then
                                        models.models.ex_skill_2.Wall:newBlock("ex_skill_2_block_"..20 + blockCount):setBlock(instance.parent.compatibilityUtils:checkBlock("minecraft:dark_oak_log", "[axis=z]")):setPos(x * 16, y * 16, 0)
                                    end
                                    models.models.ex_skill_2.Wall:newBlock("ex_skill_2_block_"..20 + blockCount):setBlock( instance.parent.compatibilityUtils:checkBlock("minecraft:dark_oak_planks")):setPos(x * 16, y * 16, 0)
                                end
                            end
                            for j = 0, 1 do
                                for i = 0, 6 do
                                    models.models.ex_skill_2.Wall:newBlock("ex_skill_2_block_"..83 + j * 7 + i):setBlock(instance.parent.compatibilityUtils:checkBlock("minecraft:dark_oak_planks")):setPos(j * 128, i * 16, -16)
                                end
                            end
                            --models.models.ex_skill_2.Wall.Paintings.MainPainting:newEntity("ex_skill_2_entity_1"):setPos(0, 32, 0):setRot(0, 180, 0):setLight(15, 15) --謎の影ができて、それが消せない...
                            models.models.ex_skill_2.Covers.CoverLeft.DecoratedPod1.Base_Side:setPrimaryTexture("RESOURCE", "minecraft:textures/entity/decorated_pot/decorated_pot_side.png")
                            for _, potPart in ipairs({models.models.ex_skill_2.Covers.CoverLeft.DecoratedPod1.Base_Top, models.models.ex_skill_2.Covers.CoverLeft.DecoratedPod1.Neck1, models.models.ex_skill_2.Covers.CoverLeft.DecoratedPod1.Neck2}) do
                                potPart:setPrimaryTexture("RESOURCE", "minecraft:textures/entity/decorated_pot/decorated_pot_base.png")
                            end
                            for index, modelPart in ipairs({models.models.ex_skill_2.Covers.CoverBack1, models.models.ex_skill_2.Covers.CoverBack4}) do
                                modelPart:addChild(models.models.ex_skill_2.Covers.CoverLeft.DecoratedPod1:copy("DecoratedPod"..(index + 1)))
                            end
                            models.models.ex_skill_2.Covers.CoverBack1.DecoratedPod2:setPos(0, 0, 160)
                            models.models.ex_skill_2.Covers.CoverBack4.DecoratedPod3:setPos(-128, 0, 176)
                            models.models.ex_skill_2.Wall.Paintings.MainPainting.Painting_Back:setPrimaryTexture("RESOURCE", "minecraft:textures/painting/back.png")
                            for _, modelPart in ipairs({models.models.ex_skill_2.Midori.MidoriHead.MidoriHeadRing, models.models.ex_skill_2.Wall.SpecialItemGroup}) do
                                modelPart:setLight(15)
                            end
                            for i = 1, 3 do
                                models.models.ex_skill_2.Pillagers["Pillager"..i]["Pillager"..i.."RightArm"]:newItem("ex_skill_2_pillager_"..i.."_crossbow"):setItem(instance.parent.compatibilityUtils:checkItem("minecraft:crossbow")):setPos(0, -12, -2):setRot(0, 0, -135)
                            end
                            if host:isHost() then
                                models.models.ex_skill_2.Gui.UI.MomoiUI:addChild(models.models.ex_skill_2.Gui.UI.MomoiUI.UI1:copy("UI1Shadow"))
                                models.models.ex_skill_2.Gui.UI.MomoiUI.UI1Shadow:setPos(-1, -1, 1)
                                models.models.ex_skill_2.Gui.UI.MomoiUI.UI1Shadow:setColor(0, 0, 0)
                                models.models.ex_skill_2.Gui.UI.MomoiUI:addChild(models.models.main.Avatar.UpperBody.Body.Gun:copy("GunIcon"))
                                models.models.ex_skill_2.Gui.UI.MomoiUI.GunIcon:setPos(27, 15, 0)
                                models.models.ex_skill_2.Gui.UI.MomoiUI.GunIcon:setRot(0, 90, 0)
                                models.models.ex_skill_2.Gui.UI.MomoiUI.GunIcon:setScale(2.5, 2.5, 2.5)
                                models.models.ex_skill_2.Gui.UI.MomoiUI.GunIcon:setVisible(true)
                                for i = 2, 3 do
                                    local icon = models.models.ex_skill_2.Gui.UI.MomoiUI.LifeIcon1:copy("LifeIcon"..i)
                                    models.models.ex_skill_2.Gui.UI.MomoiUI:addChild(icon)
                                    icon:setPos((i - 1) * -15, 0, 0)
                                end
                                for _, modelPart in ipairs(models.models.ex_skill_2.Gui.UI.MomoiUI.Bullets.RearBullets:getChildren()) do
                                    modelPart:setColor(0.5, 0.5, 0.5)
                                end
                                for _, modelPart in ipairs({models.models.ex_skill_2.Gui.UI.MomoiUI.GunIcon, models.models.ex_skill_2.Gui.UI.MomoiUI.Bullets}) do
                                    modelPart:setVisible(false)
                                end
                                models.models.ex_skill_2.Gui.UI.MomoiUI:setVisible(true)
                                models.models.ex_skill_2.Gui.UI:addChild(instance.parent.modelUtils:copyModel(models.models.ex_skill_2.Gui.UI.MomoiUI, "MidoriUI"))
                                for _, modelPart in ipairs({models.models.ex_skill_2.Gui.UI.MomoiUI.GunIcon, models.models.ex_skill_2.Gui.UI.MomoiUI.Bullets}) do
                                    modelPart:setVisible(true)
                                end
                                for _, modelPart in ipairs({models.models.ex_skill_2.Gui.UI.MidoriUI.UI1, models.models.ex_skill_2.Gui.UI.MidoriUI.UI1Shadow, models.models.ex_skill_2.Gui.UI.MidoriUI.UI2}) do
                                    modelPart:setRot(0, 180, 0)
                                end
                                models.models.ex_skill_2.Gui.UI.MidoriUI:addChild(models.models.ex_skill_2.Midori.MidoriUpperBody.MidoriArms.MidoriRightArm.MidoriRightArmBottom.Gun2:copy("GunIcon"))
                                models.models.ex_skill_2.Gui.UI.MidoriUI.GunIcon:setPos(116, 15, 0)
                                models.models.ex_skill_2.Gui.UI.MidoriUI.GunIcon:setRot(0, 90, 0)
                                models.models.ex_skill_2.Gui.UI.MidoriUI.GunIcon:setScale(1.67, 1.67, 1.67)
                                for i = 1, 3 do
                                    models.models.ex_skill_2.Gui.UI.MidoriUI["LifeIcon"..i]:setPos(22 - (i - 1) * 15, 0, 0)
                                end
                                models.models.ex_skill_2.Gui.UI.MidoriUI:newText("ex_skill_2_reload_text"):setText("§4§lRELOAD"):setPos(154, 190, 0):setScale(1.6, 1.6, 1.6):setVisible(false)
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI:addChild(models.models.ex_skill_2.Gui.UI.MomoiHeadUI.Frame:copy("FrameShadow"))
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI.FrameShadow:setPos(-1, -1, 1)
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI.FrameShadow:setColor(0, 0, 0)
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI.Background:setColor(1, 0.643, 0.71)
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll:addChild(instance.parent.modelUtils:copyModel(models.script_head_block.Head, "MomoiPaperDollHead"))
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll.MomoiPaperDollHead:setPos(models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll:getTruePivot():add(0, -24, 0))
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll.MomoiPaperDollHead.HeadRing:setPrimaryRenderType("CUTOUT_EMISSIVE_SOLID")
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll:setScale(4.1, 4.1, 4.1)
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll.MomoiPaperDollHead.FaceParts:addChild(models.models.main.Avatar.Head.FaceParts.Mouth:copy("Mouth"))
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll.MomoiPaperDollHead.FaceParts.Mouth:setUVPixels(0, 16)
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll.MomoiPaperDollHead.FaceParts.Mouth:setVisible(true)
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll:setVisible(false)
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI:setVisible(true)
                                models.models.ex_skill_2.Gui.UI:addChild(instance.parent.modelUtils:copyModel(models.models.ex_skill_2.Gui.UI.MomoiHeadUI, "MidoriHeadUI"))
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll:setVisible(true)
                                models.models.ex_skill_2.Gui.UI.MidoriHeadUI.Background:setColor(0.573, 0.98, 0.604)
                                ---@diagnostic disable-next-line: discard-returns
                                models.models.ex_skill_2.Gui.UI.MidoriHeadUI:newPart("MidoriPaperDoll", "None")
                                models.models.ex_skill_2.Gui.UI.MidoriHeadUI.MidoriPaperDoll:setScale(4.1, 4.1, 4.1)
                                models.models.ex_skill_2.Gui.UI.MidoriHeadUI.MidoriPaperDoll:setOffsetPivot(33.25, 12.5, 16)
                                models.models.ex_skill_2.Gui.UI.MidoriHeadUI.MidoriPaperDoll:setRot(0, -15, 0)
                                models.models.ex_skill_2.Gui.UI.MidoriHeadUI.MidoriPaperDoll:addChild(instance.parent.modelUtils:copyModel(models.models.ex_skill_2.Midori.MidoriHead, "MidoriPaperDollHead"))
                                models.models.ex_skill_2.Gui.UI.MidoriHeadUI.MidoriPaperDoll.MidoriPaperDollHead:setPrimaryRenderType("CUTOUT")
                                models.models.ex_skill_2.Gui.UI.MidoriHeadUI.MidoriPaperDoll.MidoriPaperDollHead:setPos(18.25, -88.5, -57)
                                models.models.ex_skill_2.Gui.UI.MidoriHeadUI.MidoriPaperDoll.MidoriPaperDollHead.MidoriHeadRing:setPrimaryRenderType("CUTOUT_EMISSIVE_SOLID")
                                models.models.ex_skill_2.Gui.UI.MidoriHeadUI.MidoriPaperDoll.MidoriPaperDollHead.MidoriFaceParts.Eyes.EyeRight:setUVPixels(-6, 0)
                                models.models.ex_skill_2.Gui.UI.MidoriHeadUI.MidoriPaperDoll:addChild(instance.parent.modelUtils:copyModel(models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll.MomoiPaperDollBody, "MidoriPaperDollBody"))
                            end
                            instance.exSkill[2].init = true
                        end
                        if host:isHost() then
                            models.models.ex_skill_2.Gui:setVisible(true)
                            local windowsSize = client:getScaledWindowSize()
                            models.models.ex_skill_2.Gui.UI.MomoiUI:setPos(-90, (windowsSize.y - 20) * -1, 0)
                            models.models.ex_skill_2.Gui.UI.MidoriUI:setPos(windowsSize.x * -1 + 10, (windowsSize.y - 20) * -1, 0)
                            models.models.ex_skill_2.Gui.UI.MidoriHeadUI:setPos(windowsSize.x * -1 + 88, 0, 0)
                            models.models.ex_skill_2.Gui.UI.MidoriHeadUI:setOffsetPivot(windowsSize.x * -1 + 88, 0, 0)
                        end
                        instance.parent.gun:setGunPosition("NONE")
                        instance.parent.modelUtils.moveTo(models.models.main.Avatar.UpperBody.Body.Gun, models.models.main.Avatar.UpperBody.Arms.RightArm, models.models.main.Avatar.UpperBody.Body)
                        models.models.main.Avatar.UpperBody.Arms.RightArm.Gun:setPos()
                        models.models.main.Avatar.UpperBody.Arms.RightArm.Gun:setRot()
                        models.models.main.Avatar.UpperBody.Arms.RightArm.Gun:setVisible(true)
                        local specialItemValue = math.random() --0.80未満で「金のマガジン」、0.80~0.90未満で「エメラルド」、0.90~1.00未満で「ダイヤモンド」
                        if specialItemValue >= 0.8 then
                            models.models.ex_skill_2.Wall.SpecialItemGroup.SpecialItem.GoldenMagazine:setVisible(false)
                            models.models.ex_skill_2.Wall.SpecialItemGroup.SpecialItem:newItem("special_item"):setItem(instance.parent.compatibilityUtils:checkItem(specialItemValue < 0.9 and "minecraft:emerald" or "minecraft:diamond"))
                        else
                            models.models.ex_skill_2.Wall.SpecialItemGroup.SpecialItem.GoldenMagazine:setVisible(true)
                        end
                        instance.exSkill[2].glowColor = specialItemValue < 0.8 and vectors.vec3(1, 0.984, 0.4) or (specialItemValue < 0.9 and vectors.vec3(0.686, 0.992, 0.804) or vectors.vec3(0.631, 0.984, 0.91))
                        models.models.ex_skill_2.Wall.SpecialItemGroup.GlowEffects:setColor(instance.exSkill[2].glowColor)
                        local paintingResources = {"minecraft:textures/painting/pointer.png", "minecraft:textures/painting/pigscene.png", "minecraft:textures/painting/burning_skull.png"}
                        models.models.ex_skill_2.Wall.Paintings.MainPainting.Painting_Front:setPrimaryTexture("RESOURCE", paintingResources[math.ceil(math.random() * #paintingResources)])
                        --[[
                            local paintingVarients = {"minecraft:pointer", "minecraft:pigscene", "minecraft:burning_skull"}
                            ---@diagnostic disable-next-line: undefined-field
                            models.models.ex_skill_2.Wall.Paintings.MainPainting:getTask("ex_skill_2_entity_1"):setNbt("minecraft:painting", toJson({variant = paintingVarients[math.ceil(math.random() * #paintingVarients)]}))
                        ]]
                        ---@diagnostic disable-next-line: discard-returns
                        models.models.ex_skill_2.Covers.CoverBack4:newPart("MissText", "Camera")
                        models.models.ex_skill_2.Covers.CoverBack4.MissText:setOffsetPivot(8, 24, 8)
                        --BlueArchiveCharacter.EX_SKILL_2_MISS_TEXT_1 = ExSkill2TextAnimation.new(models.models.ex_skill_2.Covers.CoverBack4.MissText)
                        ---@diagnostic disable-next-line: discard-returns
                        models.models.ex_skill_2.Covers.CoverBack1:newPart("MissText", "Camera")
                        models.models.ex_skill_2.Covers.CoverBack1.MissText:setOffsetPivot(8, 24, 8)
                        --BlueArchiveCharacter.EX_SKILL_2_MISS_TEXT_2 = ExSkill2TextAnimation.new(models.models.ex_skill_2.Covers.CoverBack1.MissText)
                        instance.parent.faceParts:setEmotion("ANGRY_CENTER", "ANGRY", "OPENED", 4, true)
                    end;

                    onAnimationTick = function (tick)
                        if tick == 1 then
                            local playerPos = instance.parent.modelUtils.getModelWorldPos(models.models.main.Avatar)
                            local bodyYaw = player:getBodyYaw()
                            particles:newParticle(instance.parent.compatibilityUtils:checkParticle("minecraft:end_rod"), vectors.rotateAroundAxis(bodyYaw * -1, -0.75, 1.25, 0, 0, 1, 0):add(playerPos)):setScale(1):setColor(1, 0.984, 0.4):setLifetime(20)
                            particles:newParticle(instance.parent.compatibilityUtils:checkBlock("minecraft:end_rod"), vectors.rotateAroundAxis(bodyYaw * -1, 0.65, 1.9, 0, 0, 1, 0):add(playerPos)):setScale(0.5):setColor(1, 0.984, 0.4):setLifetime(20)
                        elseif tick == 4 then
                            instance.parent.faceParts:setEmotion("ANGRY_CENTER", "ANGRY", "SMILE", 6, true)
                        elseif tick == 10 then
                            instance.parent.faceParts:setEmotion("CLOSED", "CLOSED", "SMILE", 4, true)
                        elseif tick == 14 then
                            instance.parent.faceParts:setEmotion("ANGRY", "ANGRY_INVERTED", "SMILE", 11, true)
                        elseif tick == 25 then
                            instance.parent.faceParts:setEmotion("ANGRY", "ANGRY", "SMILE", 22, true)
                        elseif tick == 28 and host:isHost() then
                            local windowSize = client:getScaledWindowSize()
                            local centerX = windowSize.x / 2 * -1
                            local centerY = windowSize.y / 2 * -1
                            models.models.ex_skill_2.Gui.ReticuleAnchor:setPos(centerX, centerY, 0)
                            models.models.ex_skill_2.Gui.Reticule:setVisible(true)
                            events.RENDER:register(function ()
                                models.models.ex_skill_2.Gui.Reticule:setPos(vectors.vec3(centerX, centerY, 0):add(models.models.ex_skill_2.Gui.ReticuleAnchor:getAnimPos():scale(windowSize.y / 270)))
                            end, "ex_skill_2_render")
                        elseif tick == 35 then
                            models.models.ex_skill_2.Midori.MidoriHead.MidoriFaceParts.Eyes.EyeRight:setUVPixels(-6, 0)
                        elseif tick == 42 then
                            instance.exSkill[2].spawnBulletParticle(instance, models.models.ex_skill_2.Covers.CoverBack2.ExSkill2ParticleAnchor1)
                            instance.exSkill[2].playShotSound(instance)
                            if host:isHost() then
                                models.models.ex_skill_2.Gui.UI.MomoiUI.Bullets.RearBullets.Bullet24:setColor()
                            end
                        elseif tick == 44 then
                            instance.exSkill[2].spawnBulletParticle(instance, models.models.ex_skill_2.Covers.CoverBack3.ExSkill2ParticleAnchor2)
                            instance.exSkill[2].playShotSound(instance)
                        elseif tick == 47 then
                            instance.parent.faceParts:setEmotion("ANGRY", "ANGRY2", "ANGRY", 33, true)
                            instance.exSkill[2].spawnBulletParticle(instance, models.models.ex_skill_2.Covers.CoverBack4.ExSkill2ParticleAnchor3)
                            instance.exSkill[2].playShotSound(instance)
                            instance.exSkill[2].playPotBreak(instance, models.models.ex_skill_2.Covers.CoverBack4.DecoratedPod3)
                            --BlueArchiveCharacter.EX_SKILL_2_MISS_TEXT_1:play()
                            if host:isHost() then
                                models.models.ex_skill_2.Gui.UI.MomoiUI.LifeIcon1:setVisible(false)
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI:setColor(1, 0.75, 0.75)
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll.MomoiPaperDollHead.FaceParts.Eyes.EyeLeft:setUVPixels(12, 0)
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll.MomoiPaperDollHead.FaceParts.Eyes.EyeRight:setUVPixels(6, 0)
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll.MomoiPaperDollHead.FaceParts.Mouth:setUVPixels(16, 0)
                                models.models.ex_skill_2.Gui.UI.MomoiUI.Bullets.RearBullets.Bullet23:setColor()
                            end
                        elseif tick == 50 then
                            instance.exSkill[2].spawnBulletParticle(instance, models.models.ex_skill_2.Covers.CoverBack3.ExSkill2ParticleAnchor4)
                            instance.exSkill[2].playShotSound(instance)
                            if host:isHost() then
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI:setColor()
                            end
                        elseif tick == 52 then
                            instance.exSkill[2].spawnBulletParticle(instance, models.models.ex_skill_2.Wall.Paintings.MainPainting.ExSkill2ParticleAnchor5)
                            instance.exSkill[2].playShotSound(instance)
                            if host:isHost() then
                                models.models.ex_skill_2.Gui.UI.MomoiUI.Bullets.RearBullets.Bullet22:setColor()
                            end
                        elseif tick == 55 then
                            instance.exSkill[2].spawnBulletParticle(instance, models.models.ex_skill_2.Wall.ExSkill2ParticleAnchor6)
                            instance.exSkill[2].playShotSound(instance)
                        elseif tick == 60 and host:isHost() then
                            for _, modelPart in ipairs({models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll.MomoiPaperDollHead.FaceParts.Eyes.EyeLeft, models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll.MomoiPaperDollHead.FaceParts.Eyes.EyeRight}) do
                                modelPart:setUVPixels()
                            end
                            models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll.MomoiPaperDollHead.FaceParts.Mouth:setUVPixels(0, 16)
                        elseif tick == 68 then
                            instance.exSkill[2].spawnBulletParticle(instance, models.models.ex_skill_2.Wall.ExSkill2ParticleAnchor7)
                            instance.exSkill[2].playShotSound(instance)
                            if host:isHost() then
                                models.models.ex_skill_2.Gui.UI.MomoiUI.Bullets.RearBullets.Bullet21:setColor()
                            end
                        elseif tick == 70 then
                            instance.exSkill[2].spawnBulletParticle(instance, models.models.ex_skill_2.Covers.CoverBack1.ExSkill2ParticleAnchor8)
                            instance.exSkill[2].playShotSound(instance)
                            instance.exSkill[2].playPotBreak(instance, models.models.ex_skill_2.Covers.CoverBack1.DecoratedPod2)
                            --BlueArchiveCharacter.EX_SKILL_2_MISS_TEXT_2:play()
                            if host:isHost() then
                                models.models.ex_skill_2.Gui.UI.MomoiUI.LifeIcon2:setVisible(false)
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI:setColor(1, 0.75, 0.75)
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll.MomoiPaperDollHead.FaceParts.Eyes.EyeLeft:setUVPixels(12, 0)
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll.MomoiPaperDollHead.FaceParts.Eyes.EyeRight:setUVPixels(6, 0)
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll.MomoiPaperDollHead.FaceParts.Mouth:setUVPixels(16, 0)
                            end
                        elseif tick == 72 then
                            instance.exSkill[2].spawnBulletParticle(instance, models.models.ex_skill_2.Covers.CoverBack1.ExSkill2ParticleAnchor9)
                            instance.exSkill[2].playShotSound(instance)
                            if host:isHost() then
                                models.models.ex_skill_2.Gui.UI.MomoiUI.Bullets.RearBullets.Bullet20:setColor()
                            end
                        elseif tick == 73 and host:isHost() then
                            models.models.ex_skill_2.Gui.UI.MomoiHeadUI:setColor()
                        elseif tick == 80 then
                            instance.parent.faceParts:setEmotion("SURPRISED", "SURPRISED", "SHOCK", 35, true)
                            instance.exSkill[2].spawnBulletParticle(instance, models.models.ex_skill_2.Covers.CoverBack1.ExSkill2ParticleAnchor10)
                            instance.exSkill[2].playShotSound(instance)
                        elseif tick == 83 then
                            instance.exSkill[2].spawnBulletParticle(instance, models.models.ex_skill_2.Covers.CoverBack1.ExSkill2ParticleAnchor11)
                            instance.exSkill[2].playShotSound(instance)
                            if host:isHost() then
                                models.models.ex_skill_2.Gui.UI.MomoiUI.Bullets.RearBullets.Bullet19:setColor()
                            end
                        elseif tick == 86 then
                            local anchorPos = instance.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Covers.CoverBack1.ExSkill2ParticleAnchor12)
                            local bodyYaw = player:getBodyYaw()
                            for _ = 1, 5 do
                                particles:newParticle(instance.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), anchorPos):setScale(1):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, 0.1, math.random() * 0.25 - 0.125, math.random() * 0.25 - 0.125, 0, 1, 0)):setColor(0.98, 0.843, 0.341):setLifetime(2)
                            end
                            instance.exSkill[2].playShotSound(instance)
                        elseif tick == 88 or tick == 99 then
                            instance.exSkill[2].playShotSound(instance)
                            if host:isHost() then
                                models.models.ex_skill_2.Gui.UI.MomoiUI.Bullets.RearBullets.Bullet18:setColor()
                            end
                        elseif tick == 105 then
                            instance.exSkill[2].spawnBulletParticle(instance, models.models.ex_skill_2.Covers.CoverBack2.ExSkill2ParticleAnchor13)
                            instance.exSkill[2].playShotSound(instance)
                            if host:isHost() then
                                models.models.ex_skill_2.Gui.UI.MomoiUI.Bullets.RearBullets.Bullet17:setColor()
                            end
                        elseif tick == 108 then
                            instance.exSkill[2].spawnBulletParticle(instance, models.models.ex_skill_2.Covers.CoverBack3.ExSkill2ParticleAnchor14)
                            instance.exSkill[2].playShotSound(instance)
                        elseif tick == 110 then
                            instance.exSkill[2].spawnBulletParticle(instance, models.models.ex_skill_2.Wall.Paintings.MainPainting.ExSkill2ParticleAnchor15)
                            instance.exSkill[2].playShotSound(instance)
                            if host:isHost() then
                                models.models.ex_skill_2.Gui.UI.MomoiUI.Bullets.RearBullets.Bullet16:setColor()
                            end
                        elseif tick == 112 then
                            instance.exSkill[2].spawnBulletParticle(instance, models.models.ex_skill_2.Wall.Paintings.MainPainting.ExSkill2ParticleAnchor16)
                            instance.exSkill[2].playShotSound(instance)
                        elseif tick == 113 then
                            instance.exSkill[2].spawnBulletParticle(instance, models.models.ex_skill_2.Wall.Paintings.MainPainting.ExSkill2ParticleAnchor17)
                            instance.exSkill[2].playShotSound(instance)
                            if host:isHost() then
                                models.models.ex_skill_2.Gui.UI.MomoiUI.Bullets.RearBullets.Bullet15:setColor()
                            end
                        elseif tick == 115 then
                            instance.parent.faceParts:setEmotion("NORMAL", "NORMAL", "TRIANGLE", 36, true)
                            instance.exSkill[2].spawnBulletParticle(instance, models.models.ex_skill_2.Wall.Paintings.MainPainting.ExSkill2ParticleAnchor18)
                            instance.exSkill[2].playShotSound(instance)
                            if host:isHost() then
                                models.models.ex_skill_2.Gui.Reticule:setVisible(false)
                                events.RENDER:remove("ex_skill_2_render")
                            end
                        elseif tick == 116 then
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.zombie.break_wooden_door"), instance.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Wall.Paintings.MainPainting), 0.25, 2)
                        elseif tick == 128 then
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), instance.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Wall.SpecialItemGroup), 1, 1)
                        elseif tick == 132 then
                            local anchorPos = vectors.rotateAroundAxis(player:getBodyYaw() * -1, 0, -0.75, 2, 0, 1, 0):add(instance.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Wall.Paintings.MainPainting))
                            for _ = 1, 20 do
                                local xOffset = math.random() * 4 - 2
                                local zOffset = math.random() * 4 - 2
                                particles:newParticle(instance.parent.compatibilityUtils:checkParticle("minecraft:campfire_cosy_smoke"), anchorPos:copy():add(xOffset, 0, zOffset)):setScale(5):setVelocity(xOffset * 0.03, 0.025, zOffset * 0.03)
                            end
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.zombie.attack_wooden_door"), anchorPos, 0.25, 2)
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.pillager.hurt"), instance.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Pillagers.Pillager1), 1, 1)
                        elseif tick == 138 then
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.zombie.attack_wooden_door"), instance.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Wall.Paintings.MainPainting), 0.05, 2)
                        elseif tick == 148 and host:isHost() then
                            local windowSize = client:getScaledWindowSize()
                            models.models.ex_skill_2.Gui.TransitionFilter:setScale(windowSize.x, windowSize.y, 1)
                            models.models.ex_skill_2.Gui.TransitionFilter:setVisible(true)
                            events.RENDER:register(function (delta)
                                if instance.parent.exSkill.animationCount <= 151 then
                                    models.models.ex_skill_2.Gui.TransitionFilter:setOpacity((instance.parent.exSkill.animationCount - 149 + delta) * 0.3333)
                                else
                                    models.models.ex_skill_2.Gui.TransitionFilter:setOpacity((instance.parent.exSkill.animationCount - 152 + delta) * -0.3333 + 1)
                                end
                            end, "ex_skill_2_transition_filter_render")
                        elseif tick == 151 then
                            instance.parent.modelUtils.moveTo(models.models.main.Avatar.UpperBody.Arms.RightArm.Gun, models.models.main.Avatar.UpperBody.Body, models.models.main.Avatar.UpperBody.Arms.RightArm)
                            models.models.ex_skill_2.Wall.SpecialItemGroup:moveTo(models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom)
                            instance.parent.faceParts:setEmotion("NORMAL", "CENTER", "TRIANGLE", 3, true)
                            if host:isHost() then
                                models.models.ex_skill_2.Gui.UI:setVisible(false)
                            end
                        elseif tick == 154 then
                            instance.parent.faceParts:setEmotion("CLOSED", "CLOSED", "TRIANGLE", 2, true)
                            if host:isHost() then
                                events.RENDER:remove("ex_skill_2_transition_filter_render")
                                models.models.ex_skill_2.Gui.TransitionFilter:setVisible(false)
                            end
                        elseif tick == 156 then
                            instance.parent.faceParts:setEmotion("NORMAL", "NORMAL", "TRIANGLE", 7, true)
                        elseif tick == 163 then
                            instance.parent.faceParts:setEmotion("CLOSED", "CLOSED", "TRIANGLE", 2, true)
                        elseif tick == 165 then
                            instance.parent.faceParts:setEmotion("NORMAL", "CENTER", "TRIANGLE", 6, true)
                        elseif tick == 171 then
                            instance.parent.faceParts:setEmotion("CLOSED", "CLOSED", "TRIANGLE", 3, true)
                        elseif tick == 174 then
                            instance.parent.faceParts:setEmotion("ANGRY", "ANGRY_INVERTED", "OPENED", 36, true)
                        elseif tick == 178 then
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), player:getPos(), 1, 1.5)
                        end
                        if tick >= 128 and tick < 151 then
                            local anchorPos = instance.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Wall.SpecialItemGroup)
                            local bodyYaw = player:getBodyYaw()
                            for _ = 1, 5 do
                                particles:newParticle(instance.parent.compatibilityUtils:checkParticle("minecraft:end_rod"), vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 3 - 1.5, math.random() * 3 - 1.5, 0, 0, 1, 0):add(anchorPos)):setVelocity(0, 0.1, 0):setColor(instance.exSkill[2].glowColor):setLifetime(8)
                            end
                        elseif tick >= 151 and tick < 170 then
                            local anchorPos = instance.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.SpecialItemGroup)
                            local bodyYaw = player:getBodyYaw()
                            for _ = 1, 2 do
                                particles:newParticle(instance.parent.compatibilityUtils:checkParticle("minecraft:end_rod"), vectors.rotateAroundAxis(bodyYaw * -1 + 35, math.random() * 0.5 - 0.25, math.random() * 0.5 - 0.25, 0, 0, 1, 0):add(anchorPos)):setScale(0.25):setVelocity(0, 0.016, 0):setColor(instance.exSkill[2].glowColor):setLifetime(8)
                            end
                        end
                        if tick < 124 then
                            for i = 1, 3 do
                                if math.random() >= 0.99 then
                                    sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:entity.pillager.ambient"), instance.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Pillagers["Pillager"..i]), 0.5, 1)
                                end
                            end
                        end
                        if tick >= 105 and tick < 124 and math.random() >= 0.95 then
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:item.crossbow.shoot"), instance.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Pillagers.Pillager1), 0.5, 1)
                        end
                        if tick >= 70 and tick < 124 and math.random() >= 0.95 then
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:item.crossbow.shoot"), instance.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Pillagers.Pillager2), 0.5, 1)
                        end
                        if tick >= 54 and tick < 124 and math.random() >= 0.95 then
                            sounds:playSound(instance.parent.compatibilityUtils:checkSound("minecraft:item.crossbow.shoot"), instance.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Pillagers.Pillager3), 0.5, 1)
                        end
                        if tick >= 22 and tick < 151 and host:isHost() then
                            if (tick - 22) % 30 == 0 then
                                models.models.ex_skill_2.Gui.UI.MidoriUI:getTask("ex_skill_2_reload_text"):setVisible(true)
                            elseif (tick - 22) % 30 == 20 then
                                models.models.ex_skill_2.Gui.UI.MidoriUI:getTask("ex_skill_2_reload_text"):setVisible(false)
                            end
                        end
                    end;

                    onPostAnimation = function (forcedStop)
                        for _, modelPart in ipairs({models.models.ex_skill_2.Covers.CoverBack1.DecoratedPod2, models.models.ex_skill_2.Covers.CoverBack4.DecoratedPod3}) do
                            modelPart:setVisible(true)
                        end
                        models.models.ex_skill_2.Midori.MidoriHead.MidoriFaceParts.Eyes.EyeRight:setUVPixels()
                        if models.models.main.Avatar.UpperBody.Arms.RightArm.Gun ~= nil then
                            models.models.main.Avatar.UpperBody.Arms.RightArm.Gun:setVisible(false)
                            instance.parent.modelUtils.moveTo(models.models.main.Avatar.UpperBody.Arms.RightArm.Gun, models.models.main.Avatar.UpperBody.Body, models.models.main.Avatar.UpperBody.Arms.RightArm)
                        elseif models.models.main.Avatar.UpperBody.Body.Gun ~= nil then
                            models.models.main.Avatar.UpperBody.Body.Gun:setVisible(false)
                        end
                        if models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.SpecialItemGroup ~= nil then
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.SpecialItemGroup:moveTo(models.models.ex_skill_2.Wall)
                        end
                        models.models.ex_skill_2.Wall.SpecialItemGroup.SpecialItem:removeTask("special_item")
                        if host:isHost() then
                            for _, modelPart in ipairs({models.models.ex_skill_2.Gui, models.models.ex_skill_2.Gui.Reticule}) do
                                modelPart:setVisible(false)
                            end
                            for _, modelPart in ipairs({models.models.ex_skill_2.Gui.UI, models.models.ex_skill_2.Gui.UI.MomoiUI.LifeIcon1, models.models.ex_skill_2.Gui.UI.MomoiUI.LifeIcon2}) do
                                modelPart:setVisible(true)
                            end
                            for _, modelPart in ipairs({models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll.MomoiPaperDollHead.FaceParts.Eyes.EyeLeft, models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll.MomoiPaperDollHead.FaceParts.Eyes.EyeRight}) do
                                modelPart:setUVPixels()
                            end
                            models.models.ex_skill_2.Gui.UI.MomoiHeadUI.MomoiPaperDoll.MomoiPaperDollHead.FaceParts.Mouth:setUVPixels(0, 16)
                            for i = 15, 24 do
                                models.models.ex_skill_2.Gui.UI.MomoiUI.Bullets.RearBullets["Bullet"..i]:setColor(0.5, 0.5, 0.5)
                            end
                            models.models.ex_skill_2.Gui.UI.MidoriUI:getTask("ex_skill_2_reload_text"):setVisible(false)
                            if forcedStop then
                                models.models.ex_skill_2.Gui.TransitionFilter:setVisible(false)
                                models.models.ex_skill_2.Gui.UI.MomoiHeadUI:setColor()
                                for _, event in ipairs({"ex_skill_2_render", "ex_skill_2_transition_filter_render"}) do
                                    events.RENDER:remove(event)
                                end
                            end
                        end
                    end;
                };

                ---このExスキルの初期化処理が行われたかどうか
                ---@type boolean
                init = false;

                ---キラキラエフェクトの色
                ---@type Vector3
                glowColor = vectors.vec3();

                ---銃弾のパーティクルを出す。
                ---@param self BlueArchiveCharacter
                ---@param anchor ModelPart パーティクルを出す場所を示すアンカーポイント
                spawnBulletParticle = function (self, anchor)
                    local anchorPos = self.parent.modelUtils.getModelWorldPos(anchor)
                    local bodyYaw = player:getBodyYaw()
                    for _ = 1, 5 do
                        particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), anchorPos):setScale(1):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 0.25 - 0.125, math.random() * 0.25 - 0.125, 0.1, 0, 1, 0)):setColor(0.98, 0.843, 0.341):setLifetime(2)
                    end
                    local muzzleAnchorPos =  self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.RightArm.Gun.MuzzleAnchor)

                    for _ = 1, 5 do
                        particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:smoke"), muzzleAnchorPos)
                    end
                end;

                ---射撃音を再生する。
                ---@param self BlueArchiveCharacter
                playShotSound = function (self)
                    sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.firework_rocket.blast"), self.parent.modelUtils.getModelWorldPos(host:isHost() and models.models.main.CameraAnchor or models.models.main.Avatar), 1, math.random() * 0.25 + 0.5)
                end;

                ---飾り壺を割った時の演出を再生する
                ---@param self BlueArchiveCharacter
                ---@param potModel ModelPart 飾り壺のモデルパーツ
                playPotBreak = function (self, potModel)
                    local potPos = self.parent.modelUtils.getModelWorldPos(potModel)
                    for _ = 1, 32 do
                        particles:newParticle(self.parent.compatibilityUtils.getBlockParticleId(self.parent.compatibilityUtils:checkBlock("minecraft:decorated_pot")), potPos:copy():add(math.random() - 0.5, math.random(), math.random() - 0.5))
                    end
                    sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.glass.break"), potPos, 1, 0.5)
                    potModel:setVisible(false)
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

                {
                    name = "maid";

                    displayName = {
                        en_us = "Maid";
                        ja_jp = "メイド";
                    };

                    exSkill = 2;

                    ---前ティックに脚とスカートの調整をしたかどうか
                    ---@type boolean
                    shouldAdjustLegsPrev = false;

                    ---前ティックは脚を隠すべきだったかどうか
                    ---@type boolean
                    shouldHideLegsPrev = false;
                };
            };

            callbacks = {
                onChange = function ()
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.Head, models.models.main.Avatar.Head.HatLayer}) do
                        modelPart:setUVPixels(0, 16)
                    end
                    Costume.setCostumeTextureOffset(1)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.HairRibbons, models.models.main.Avatar.UpperBody.Body.CoatRibbon, models.models.main.Avatar.UpperBody.Body.Skirt, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightCoat, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftCoat}) do
                        modelPart:setVisible(false)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.CMaidH, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.CMaidRAB, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.CMaidLAB, models.models.main.Avatar.UpperBody.Body.CMaidB}) do
                        modelPart:setVisible(true)
                    end

                    events.TICK:register(function ()
                        if not client:isPaused() then
                            local skirtVisible = models.models.main.Avatar.UpperBody.Body.CMaidB:getVisible()
                            local shouldHideLegs = skirtVisible and player:getVehicle() ~= nil
                            if shouldHideLegs and not instance.costume.costumes[2].shouldHideLegsPrev then
                                models.models.main.Avatar.LowerBody.Legs:setVisible(false)
                                models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1:setScale(1.2, 0.35, 1.5)
                            elseif not shouldHideLegs and instance.costume.costumes[2].shouldHideLegsPrev then
                                models.models.main.Avatar.LowerBody.Legs:setVisible(true)
                                models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1:setScale()
                            end

                            local shouldAdjustLegs = skirtVisible and not shouldHideLegs
                            if shouldAdjustLegs and not instance.costume.costumes[2].shouldAdjustLegsPrev then
                                events.RENDER:register(function ()
                                    local rightLegRotX = vanilla_model.RIGHT_LEG:getOriginRot().x
                                    models.models.main.Avatar.LowerBody.Legs.RightLeg:setRot(rightLegRotX * -0.45, 0, 0)
                                    models.models.main.Avatar.LowerBody.Legs.LeftLeg:setRot(vanilla_model.LEFT_LEG:getOriginRot().x * -0.45, 0, 0)
                                    local rightLegRotAbs = math.abs(rightLegRotX)
                                    local playerPose = player:getPose()
                                    local skirtFlipVal = math.min(math.abs(instance.parent.physics.velocityAverage[7][2]) * 0.00025 + ((playerPose == "SWIMMING" or playerPose == "FALL_FLYING") and 0 or math.max(instance.parent.physics.velocityAverage[2][2] * -0.25, 0)), 0.5)
                                    models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1:setScale(1 + skirtFlipVal, 1 - skirtFlipVal, rightLegRotAbs * 0.001 + 1 + skirtFlipVal)
                                    models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1.Skirt2:setScale(rightLegRotAbs * -0.0001 + 1, 1, rightLegRotAbs * 0.001 + 1)
                                    models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1.Skirt2.Skirt3:setScale(rightLegRotAbs * -0.0001 + 1, 1, rightLegRotAbs * 0.001 + 1)
                                    models.models.main.Avatar.UpperBody.Body.CMaidB.Skirt1.Skirt2.Skirt3.Skirt4:setScale(rightLegRotAbs * -0.00005 + 1, 1, rightLegRotAbs * 0.0005 + 1)
                                end, "costume_maid_render")
                            elseif not shouldAdjustLegs and instance.costume.costumes[2].shouldAdjustLegsPrev then
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

                            instance.costume.costumes[2].shouldHideLegsPrev = shouldHideLegs
                            instance.costume.costumes[2].shouldAdjustLegsPrev = shouldAdjustLegs
                        end
                    end,"costume_maid_tick")
                end;

                onReset = function ()
                    events.TICK:remove("costume_maid_tick")
                    events.RENDER:remove("costume_maid_render")
                    models.models.main.Avatar.LowerBody.Legs:setVisible(true)
                    for _, modelPart in ipairs({models.models.main.Avatar.LowerBody.Legs.RightLeg, models.models.main.Avatar.LowerBody.Legs.LeftLeg}) do
                        modelPart:setRot()
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.Head, models.models.main.Avatar.Head.HatLayer}) do
                        modelPart:setUVPixels()
                    end
                    Costume.setCostumeTextureOffset(0)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.HairRibbons, models.models.main.Avatar.UpperBody.Body.CoatRibbon, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightCoat, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftCoat, models.models.main.Avatar.UpperBody.Body.Skirt}) do
                        modelPart:setVisible(true)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.CMaidH, models.models.main.Avatar.UpperBody.Body.CMaidB}) do
                        modelPart:setVisible(false)
                    end
                end;

                onArmorChange = function (parts, isVisible)
                    if parts == "HELMET" then
                        models.models.main.Avatar.Head.EffectPanel:setPos(0, 0, isVisible and -1 or 0)
                    elseif parts == "LEGGINGS" then
                        if instance.parent.costume.currentCostume == 1 then
                            models.models.main.Avatar.UpperBody.Body.Skirt:setVisible(not isVisible)
                        else
                            models.models.main.Avatar.UpperBody.Body.CMaidB:setVisible(not isVisible)
                        end
                    end
                end;
            };
        }

        instance.bubble = {
            callbacks = {
                onPlay = function(type, duration)
                    if duration > 0 then
                        if type == "GOOD" then
                            instance.parent.faceParts:setEmotion("NORMAL", "NORMAL", "FUN", duration, true)
                        elseif type == "HEART" then
                            instance.parent.faceParts:setEmotion("UNEQUAL", "UNEQUAL", "OPENED", duration, true)
                        elseif type == "NOTE" then
                            instance.parent.faceParts:setEmotion("ANGRY", "ANGRY", "SMILE", duration, true)
                        elseif type == "QUESTION" then
                            instance.parent.faceParts:setEmotion("SURPRISED", "SURPRISED", "SHOCK", duration, true)
                        elseif type == "SWEAT" then
                            instance.parent.faceParts:setEmotion("ANGRY", "ANGRY2", "ANGRY", duration, true)
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
            includeModels = {};
        }

        instance.portrait = {
            includeModels = {};
        }

        instance.deathAnimation = {
            callbacks = {
                onPhase1 = function (dummyAvatar, costume)
                    if costume == "DEFAULT" then
                        dummyAvatar.UpperBody.Body.Skirt:setRot(70, 0, 0)
                    elseif costume == "MAID" then
                        dummyAvatar.LowerBody.Legs:setVisible(false)
                        dummyAvatar.UpperBody.Body.CMaidB.Skirt1:setScale(1.2, 0.35, 1.5)
                        for _, modelPart in ipairs({dummyAvatar.UpperBody.Body.CMaidB.BackRibbon.RibbonBottomRight, dummyAvatar.UpperBody.Body.CMaidB.BackRibbon.RibbonBottomLeft}) do
                            modelPart:setRot(-40, 0, 0)
                        end
                    end
                end;

                onPhase2 = function (dummyAvatar, costume)
                    if costume == "DEFAULT" then
                        dummyAvatar.UpperBody.Body.Skirt:setRot(22.5, 0, 0)
                    elseif costume == "MAID" then
                        dummyAvatar.LowerBody.Legs:setVisible(true)
                        dummyAvatar.UpperBody.Body.CMaidB.Skirt1:setScale(1, 1, 1)
                        dummyAvatar.UpperBody.Body.CMaidB.Skirt1:setRot(32.5, 0, 0)
                        dummyAvatar.UpperBody.Body.CMaidB.BackRibbon.RibbonBottomRight:setRot(20, 0, 5)
                        dummyAvatar.UpperBody.Body.CMaidB.BackRibbon.RibbonBottomLeft:setRot(20, 0, -25)
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

                {
                    models = {models.models.main.Avatar.Head.CMaidH.HairTails.RightHairTail, models.models.main.Avatar.Head.CMaidH.HairTails.LeftHairTail},

                    y = {
                        vertical = {
                            min = -20;
                            neutral = 0;
                            max = 20;
                        };

                        horizontal = {
                            min = -20;
                            neutral = 0;
                            max = 20;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CMaidH.HairTails.RightHairTail.RightHairTailZPivot, models.models.main.Avatar.Head.CMaidH.HairTails.LeftHairTail.LeftHairTailZPivot},

                    z = {
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
                onPhysicPerformed = function (model)
                    local playerPose = player:getPose()
                    local isHorizontal = playerPose == "SWIMMING" or playerPose == "FALL_FLYING"
                    if model:getName():match("^RightHairTail") then
                        local velocityY = math.clamp(instance.parent.physics.velocityAverage[1][2] * -40, -20, 20)
                        local velocityZ = math.clamp(instance.parent.physics.velocityAverage[2][2] * (isHorizontal and 160 or -40), -10, 10)
                        local lookRotY = math.deg(math.asin(player:getLookDir().y)) / 90
                        local rotY = velocityY * (1 - math.abs(lookRotY)) + velocityZ * lookRotY
                        local rotZ = velocityZ * (1 - math.abs(lookRotY)) + velocityY * lookRotY * -1
                        if model == models.models.main.Avatar.Head.CMaidH.HairTails.RightHairTail then
                            models.models.main.Avatar.Head.CMaidH.HairTails.RightHairTail:setRot(0, isHorizontal and rotZ or rotY, 0)
                        elseif model == models.models.main.Avatar.Head.CMaidH.HairTails.RightHairTail.RightHairTailZPivot then
                            models.models.main.Avatar.Head.CMaidH.HairTails.RightHairTail.RightHairTailZPivot:setRot(0, 0, isHorizontal and rotY or rotZ)
                        end
                    elseif model:getName():match("^LeftHairTail") then
                        local velocityY = math.clamp(instance.parent.physics.velocityAverage[1][2] * 40, -20, 20)
                        local velocityZ = math.clamp(instance.parent.physics.velocityAverage[2][2] * (isHorizontal and -160 or 40), -10, 10)
                        local lookRotY = math.deg(math.asin(player:getLookDir().y)) / 90
                        local rotY = velocityY * (1 - math.abs(lookRotY)) + velocityZ * lookRotY
                        local rotZ = velocityZ * (1 - math.abs(lookRotY)) + velocityY * lookRotY * -1
                        if model == models.models.main.Avatar.Head.CMaidH.HairTails.LeftHairTail then
                            models.models.main.Avatar.Head.CMaidH.HairTails.LeftHairTail:setRot(0, isHorizontal and rotZ or rotY, 0)
                        elseif model == models.models.main.Avatar.Head.CMaidH.HairTails.LeftHairTail.LeftHairTailZPivot then
                            models.models.main.Avatar.Head.CMaidH.HairTails.LeftHairTail.LeftHairTailZPivot:setRot(0, 0, isHorizontal and rotY or rotZ)
                        end
                    elseif (model == models.models.main.Avatar.UpperBody.Body.CMaidB.BackRibbon.RibbonBottomRight or model == models.models.main.Avatar.UpperBody.Body.CMaidB.BackRibbon.RibbonBottomLeft) and isHorizontal then
                        model:setRot(model:getRot():scale(1 - math.clamp(instance.parent.physics.velocityAverage[5][2], 0, 1.6) / 1.6))
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
    end;
}