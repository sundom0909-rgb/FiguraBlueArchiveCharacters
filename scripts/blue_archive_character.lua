---@alias BlueArchiveCharacter.RightEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "CLOSED2" # 閉じた目2

---@alias BlueArchiveCharacter.LeftEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "CLOSED2" # 閉じた目2
---| "CENTER" # 少し反対側を見る目

---@alias BlueArchiveCharacter.MouthTextures
---| "NORMAL" # 通常
---| "ANXIOUS" # への口
---| "TRIANGLE" # 三角口
---| "SMILE" # にっこり

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
                en_us = "Hikari";
                ja_jp = "ヒカリ";
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
            };

            leftEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(1, 0); --必須
                TIRED = vectors.vec2(2, 0); --必須
                CLOSED = vectors.vec2(3, 0); --必須
                CLOSED2 = vectors.vec2(4, 0);
                CENTER = vectors.vec2(5, 0);
            };

            mouth = {
                ANXIOUS = vectors.vec2(0, 0);
                TRIANGLE = vectors.vec2(1, 0);
                SMILE = vectors.vec2(2, 0);
            };
        }

        instance.arms = {
            callbacks = {
                onArmStateChanged = function (_, right, left)
                    local armState = {right = right, left = left}
                    armState.right = armState.right == 2 and 0 or armState.right
                    armState.left = armState.left == 2 and 0 or armState.left
                    return armState
                end;
            };
        }

        instance.skirt = {
            skirtModels = {models.models.main.Avatar.UpperBody.Body.Skirt};
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
                        right = vectors.vec3(-4.5, -9, 0);
                        left = vectors.vec3(-4.5, -9, 0);
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
            {
                model = models.models.placement_object.PlacementObject;

                boundingBox = {
                    size = vectors.vec3(8, 8, 8)
                };

                placementMode = "COPY";
            };
        }

        instance.exSkill = {
            {
                name = {
                    en_us = "Ti~cket~ check";
                    ja_jp = "にゅ～きょ～の時間";
                };

                formationType = "STRIKER";

                models = {models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Puncher, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Ticket};

                animations = {"main", "ex_skill_1"};

                camera = {
                    start = {
                        rot = vectors.vec3(0, 180, 0);
                        pos = vectors.vec3(-61, 32, -77);
                    };

                    fin = {
                        rot = vectors.vec3(-10, 135, 5);
                        pos = vectors.vec3(16, 25, -8.25);
                    };
                };

                callbacks = {
                    onPreAnimation = function (self)
                        if not self.exSkill[1].didInit then
                            ---@diagnostic disable-next-line: discard-returns
                            models.models.ex_skill_1:newPart("VillagerArea")
                            for i = 1, 8 do
                                models.models.ex_skill_1.VillagerArea:newEntity("ex_skill_1_villager_"..i):setNbt("minecraft:villager", "{}")
                            end
                            models.models.ex_skill_1.VillagerArea:getTask("ex_skill_1_villager_1"):setPos(12, 0, -18):setRot(0, -30, 0)
                            models.models.ex_skill_1.VillagerArea:getTask("ex_skill_1_villager_2"):setPos(-12, 0, -18):setRot(0, 30, 0)
                            models.models.ex_skill_1.VillagerArea:getTask("ex_skill_1_villager_3"):setPos(64, 0, -64):setRot(0, -45, 0)
                            models.models.ex_skill_1.VillagerArea:getTask("ex_skill_1_villager_4"):setPos(28, 0, -64):setRot(0, -25, 0)
                            models.models.ex_skill_1.VillagerArea:getTask("ex_skill_1_villager_5"):setPos(48, 0, -40):setRot(0, -50, 0)
                            models.models.ex_skill_1.VillagerArea:getTask("ex_skill_1_villager_6"):setPos(24, 0, -40):setRot(0, -35, 0)
                            models.models.ex_skill_1.VillagerArea:getTask("ex_skill_1_villager_7"):setPos(0, 0, -64):setRot(0, 0, 0)
                            models.models.ex_skill_1.VillagerArea:getTask("ex_skill_1_villager_8"):setPos(-24, 0, -40):setRot(0, 35, 0)
                            for i = 1, 2 do
                                models.models.ex_skill_1.VillagerArea:addChild(models.models.ex_skill_1.ShockEffect:copy("ShockEffect"..i))
                                models.models.ex_skill_1.VillagerArea["ShockEffect"..i]:setVisible(true)
                            end
                            models.models.ex_skill_1.VillagerArea.ShockEffect1:setPos(-9, 29, -22)
                            models.models.ex_skill_1.VillagerArea.ShockEffect1:setRot(0, -60, 0)
                            models.models.ex_skill_1.VillagerArea.ShockEffect2:setPos(62, 29, -64)
                            models.models.ex_skill_1.VillagerArea.ShockEffect2:setRot(0, 45, 0)
                            for i = 1, 2 do
                                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Ticket.Stamp1["Stamp1ShineEffect"..i]:setColor(0.996, 1, 0.663)
                                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Ticket.Stamp2["Stamp2ShineEffect"..i]:setColor(1, 0.698, 0.624)
                                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Ticket.Stamp3["Stamp3ShineEffect"..i]:setColor(0.714, 0.996, 0.812)
                                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Ticket.Stamp4["Stamp4ShineEffect"..i]:setColor(0.714, 0.996, 0.812)
                                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Ticket.Stamp6["Stamp6ShineEffect"..i]:setColor(1, 0.769, 0.988)
                                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Ticket.Stamp7["Stamp7ShineEffect"..i]:setColor(1, 0.635, 0.996)
                            end
                            self.exSkill[1].didInit = true
                        else
                            models.models.ex_skill_1.VillagerArea:setVisible(true)
                        end
                        local villagerTypes = client.getRegistry("minecraft:villager_type")
                        local villagerProfessions = client.getRegistry("minecraft:villager_profession")
                        for i = 1, 8 do
                            models.models.ex_skill_1.VillagerArea:getTask("ex_skill_1_villager_"..i):setNbt("minecraft:villager", "{\"VillagerData\": {\"level\": "..math.random(1, 5)..", \"profession\": \""..villagerProfessions[math.random(1, #villagerProfessions)].."\", \"type\": \""..villagerTypes[math.random(1, #villagerTypes)].."\"}}")
                        end
                        for i = 15, 54 do
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Ticket["Hole"..i]:setVisible(false)
                        end
                        self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "ANXIOUS", 47, true)
                    end;

                    onAnimationTick = function (self, tick)
                        if tick == 9 then
                            self.exSkill[1].playAngryVillagerEffect(self, player:getPos():add(vectors.rotateAroundAxis(player:getBodyYaw() * -1, -1.5, 0, 2.5, 0, 1, 0)))
                        elseif tick == 22 then
                            self.exSkill[1].playAngryVillagerEffect(self, player:getPos():add(vectors.rotateAroundAxis(player:getBodyYaw() * -1, -1.75, 0, 4, 0, 1, 0)))
                        elseif tick == 39 then
                            self.exSkill[1].playAngryVillagerEffect(self, player:getPos():add(vectors.rotateAroundAxis(player:getBodyYaw() * -1, 0, 0, 4, 0, 1, 0)))
                        elseif tick == 47 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "TRIANGLE", 15, true)
                        elseif tick == 62 then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "TRIANGLE", 2, true)
                        elseif tick == 64 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "TRIANGLE", 48, true)
                        elseif tick == 86 then
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Ticket.Hole15:setVisible(true)
                            for i = 23, 54 do
                                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Ticket["Hole"..i]:setVisible(true)
                            end
                        elseif tick == 88 then
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Ticket.Hole22:setVisible(true)
                        elseif tick == 91 then
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Ticket.Hole21:setVisible(true)
                        elseif tick == 93 then
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Ticket.Hole20:setVisible(true)
                        elseif tick == 94 then
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Ticket.Hole19:setVisible(true)
                        elseif tick == 96 then
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Ticket.Hole18:setVisible(true)
                        elseif tick == 99 then
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Ticket.Hole17:setVisible(true)
                        elseif tick == 100 then
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Ticket.Hole16:setVisible(true)
                        elseif tick >= 111 and tick <= 121 and (tick - 111) % 2 == 0 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), player:getPos(), 0.5, 1.85)
                        elseif tick == 112 then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "SMILE", 22, true)
                        elseif tick == 134 then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "ANXIOUS", 16, true)
                        elseif tick == 143 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.attack.sweep"), player:getPos(), 0.25, 1)
                        elseif tick == 150 then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "TRIANGLE", 2, true)
                        elseif tick == 152 then
                            self.parent.faceParts:setEmotion("NORMAL", "CENTER", "TRIANGLE", 40, true)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), player:getPos(), 1, 1.5)
                        elseif tick == 160 then
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Ticket.ShineEffect:setOffsetPivot(-0.5, 0, 0)
                        end

                        for _, villagerId in ipairs({1, 5}) do
                            local anchorPos = player:getPos():add(vectors.rotateAroundAxis(player:getBodyYaw() * -1, models.models.ex_skill_1.VillagerArea:getTask("ex_skill_1_villager_"..villagerId):getPos():scale(-0.0575):add(0, 1.5, 0), 0, 1, 0))
                            particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:splash"), anchorPos):setPower(1.2)
                        end
                        if tick < 47 and tick % 4 == 0 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.bubble_column.bubble_pop"), player:getPos(), 0.25, 2 - math.random() * 0.5)
                        elseif ((tick >= 47 and tick < 61) or (tick >= 69 and tick < 108)) and (tick - 47) % 6 == 0 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.sheep.shear"), player:getPos(), 0.25, 2)
                        end
                        if tick < 86 and tick % 2 == 0 then
                            particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:angry_villager"), player:getPos():add(vectors.rotateAroundAxis(player:getBodyYaw() * -1, math.random() * 2 - 1, math.random() * 2, 0, 0, 1, 0)))
                        end
                        if math.random() > 0.95 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.villager.ambient"), player:getPos(), 0.25, 1)
                        end
                    end;

                    onPostAnimation = function (self, forcedStop)
                        models.models.ex_skill_1.VillagerArea:setVisible(false)
                        for i = 15, 54 do
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Ticket["Hole"..i]:setVisible(false)
                        end
                        models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Ticket.ShineEffect:setOffsetPivot()
                    end;
                };

                ---このExスキルの初期化処理がされたかどうか
                ---@type boolean
                didInit = false;

                ---村人が怒っている演出を再生する。
                playAngryVillagerEffect = function (self, anchorPos)
                    for _ = 1, 5 do
                        particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:angry_villager"), anchorPos:copy():add(math.random() * 1 - 0.5, math.random() * 1 + 0.5, math.random() * 1 - 0.5))
                    end
                    sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.villager.no"), anchorPos, 1, 1)
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

        }

        instance.bubble = {

        }

        instance.headBlock = {
            includeModels = {models.models.main.Avatar.UpperBody.Body.Hairs};
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
                    models = {models.models.main.Avatar.UpperBody.Body.Hairs.BackHair},

                    x = {
                        vertical = {
                            min = -150;
                            neutral = -17.5;
                            max = -17.5;

                            bodyX = {
                                multiplayer = -80;
                                min = -90;
                                max = -17.5;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -150;
                                max = -17.5;
                            };

                            bodyRot = {
                                multiplayer = 0.05;
                                min = -90;
                                max = -17.5;
                            };
                        };

                        horizontal = {
                            min = -90;
                            neutral = -10;
                            max = -17.5;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Hairs.FrontHair};

                    x = {
                        vertical = {
                            min = 2.5;
                            neutral = 2.5;
                            max = 150;
                            sneakOffset = 30;

                            bodyX = {
                                multiplayer = -80;
                                min = 2.5;
                                max = 90;
                            };

                            bodyY = {
                                multiplayer = -80;
                                min = 2.5;
                                max = 150;
                            };

                            bodyRot = {
                                multiplayer = -0.05;
                                min = 2.5;
                                max = 90;
                            };
                        };

                        horizontal = {
                            min = 2.5;
                            neutral = 90;
                            max = 150;

                            bodyX = {
                                multiplayer = -80;
                                min = 2.5;
                                max = 150;
                            };
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.UpperBody.Body.BeltAccessories};

                    x = {
                        vertical = {
                            min = 22.5;
                            neutral = 22.5;
                            max = 155;
                            sneakOffset = 30;

                            bodyX = {
                                multiplayer = -160;
                                min = 22.5;
                                max = 90;
                            };

                            bodyY = {
                                multiplayer = -160;
                                min = 22.5;
                                max = 155;
                            };
                        };

                        horizontal = {
                            min = 22.5;
                            neutral = 90;
                            max = 155;

                            bodyX = {
                                multiplayer = 22.5;
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