---@alias BlueArchiveCharacter.RightEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "CLOSED2" # 閉じた目2
---| "INVERTED" # 反対側を見る目
---| "NARROW" # 少し閉じた目

---@alias BlueArchiveCharacter.LeftEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "CLOSED2" # 閉じた目2
---| "INVERTED" # 反対側を見る目
---| "NARROW" # 少し閉じた目
---| "CENTER" # 少し反対側を見る目

---@alias BlueArchiveCharacter.MouthTextures
---| "NORMAL" # 通常
---| "SMILE" # にっこり
---| "OPENED_SMALL" # 小さく開いた口
---| "OPENED" # 開いた口
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
---| "CHRISTMAS" # クリスマス

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
                en_us = "Serina";
                ja_jp = "セリナ";
            };

            lastName = {
                en_us = "Sumi";
                ja_jp = "鷲見";
            };

            clubName = {
                en_us = "Rescue Knights";
                ja_jp = "救護騎士団";
            };

            birth = {
                month = 11;
                day = 16;
            };
        }

        instance.faceParts = {
            rightEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(2, 0); --必須
                TIRED = vectors.vec2(3, 0); --必須
                CLOSED = vectors.vec2(4, 0); --必須
                CLOSED2 = vectors.vec2(5, 0);
                INVERTED = vectors.vec2(6, 0);
                NARROW = vectors.vec2(8, 0);
            };

            leftEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(1, 0); --必須
                TIRED = vectors.vec2(2, 0); --必須
                CLOSED = vectors.vec2(3, 0); --必須
                CLOSED2 = vectors.vec2(4, 0);
                INVERTED = vectors.vec2(6, 0);
                NARROW = vectors.vec2(8, 0);
                CENTER = vectors.vec2(-1, 1);
            };

            mouth = {
                SMILE = vectors.vec2(0, 0);
                TIRED = vectors.vec2(1, 0);
                OPENED_SMALL = vectors.vec2(2, 0);
                OPENED = vectors.vec2(3, 0);
                SAD = vectors.vec2(0, 1)
            };
        }

        instance.arms = {
            callbacks = {
                onAdditionalRightArmProcess = function (self, state)
                    if state == 4 then
                        models.models.main.Avatar.UpperBody.Arms.RightArm:setParentType("Body")
                        events.TICK:register(function ()
                            if self.costume.costumes[1].medicalBoxPos == 0 then
                                self.parent.arms:setArmState(0, 0)
                            end
                        end, "right_arm_tick")
                        events.RENDER:register(function (delta)
                            local swingPos = (player:getSwingTime() + (player:isSwingingArm() and delta or 0)) / player:getSwingDuration()
                            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Arms.RightArm, models.models.main.Avatar.UpperBody.Arms.LeftArm}) do
                                modelPart:setRot(swingPos < 0.25 and (360 * swingPos + 40) or (-120 * swingPos + 160), 0, 0)
                            end
                        end, "right_arm_render")
                    end
                end;

                onAdditionalLeftArmProcess = function (_, state)
                    if state == 4 then
                        models.models.main.Avatar.UpperBody.Arms.LeftArm:setParentType("Body")
                    end
                end;
            };
        }

        instance.skirt = {
            skirtModels = {models.models.main.Avatar.UpperBody.Body.Skirt};
        }

        instance.gun = {
            scale = 1.5;

            gunPosition = {
                hold = {
                    type = "NORMAL";

                    firstPersonPos = {
                        right = vectors.vec3(0, 1, -4);
                        left = vectors.vec3(0, 1, -4);
                    };

                    thirdPersonPos = {
                        right = vectors.vec3(-2, 1, -5);
                        left = vectors.vec3(2, 1, -5);
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
                model = models.models.ex_skill_1.MedicalBox;

                boundingBox = {
                    size = vectors.vec3(12, 8, 12)
                };

                placementMode = "COPY";

                callbacks = {
                    onInit = function (_, placementObject)
                        placementObject.tick = 0
                    end;

                    onTick = function (self, placementObject)
                        local targetEntry = raycast:entity(placementObject.currentPos, placementObject.currentPos:copy():add(0, 0.5, 0))
                        if  targetEntry ~= nil and  targetEntry:isPlayer() then
                            for _ = 1, 50 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:effect"), placementObject.currentPos):setScale(1.2):setVelocity(vectors.rotateAroundAxis(math.random() * 360, 0, 0, math.random() * 0.25, 0, 1, 0)):setColor(0.961, 0.141, 0.137)
                            end
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.chest.open"), placementObject.currentPos, 1, 2)
                            --host:sendChatCommand("/effect give "..targetEntry:getName().." minecraft:instant_health 1 1 true")
                            self.parent.placementObjectManager:remove(placementObject.index)
                        else
                            if placementObject.tick % 2 == 0 then
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:end_rod"), placementObject.currentPos:copy():add(math.random() - 0.5, math.random(), math.random() - 0.5)):setVelocity(0, 0.1, 0):setColor(1, 0.984, 0.4)
                            end
                            placementObject.tick = placementObject.tick + 1
                        end
                    end;
                };
            };
        }

        instance.exSkill = {
            {
                name = {
                    en_us = "Intensive care set A";
                    ja_jp = "集中治療セットA";
                };

                formationType = "SPECIAL";

                models = {models.models.main.Avatar.Head.Sweat};

                animations = {"main", "ex_skill_1"};

                camera = {
                    start = {
                        rot = vectors.vec3(-5, 190, -5);
                        pos = vectors.vec3(-2.5, 13, -16);
                    };

                    fin = {
                        rot = vectors.vec3(-20, 210, -30);
                        pos = vectors.vec3(-7, 10, -11);
                    };
                };

                callbacks = {
                    onPreAnimation = function (self)
                        events.RENDER:register(function ()
                            models.models.main.Avatar.Head.Sweat:setOpacity(models.models.main.Avatar.Head.Sweat.SweatOpacity:getAnimScale().x)
                        end, "ex_skill_1_render")
                        self.parent.placementObjectManager:removeAll()
                        models.models.ex_skill_1.MedicalBox:setPos()
                        models.models.ex_skill_1.MedicalBox:setRot()
                        models.models.ex_skill_1.MedicalBox:setScale()
                        models.models.ex_skill_1.MedicalBox:setParentType("None")
                        self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "SMILE", 10, true)
                    end;

                    onAnimationTick = function (self, tick)
                        if tick == 10 then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "SMILE", 3, true)
                        elseif tick == 13 then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "TIRED", 11, true)
                        elseif tick == 15 then
                            particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:snowflake"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.Head.FaceParts.Mouth)):setScale(0.5):setVelocity(vectors.rotateAroundAxis(player:getBodyYaw() * -1, 0, -0.01, 0.01, 0, 1, 0)):setGravity(0):setLifetime(11)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), player:getPos(), 0.1, 0.7)
                        elseif tick == 24 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "TIRED", 8, true)
                        elseif tick == 32 then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "TIRED", 1, true)
                        elseif tick == 33 then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "SMILE", 2, true)
                        elseif tick == 35 then
                            self.parent.faceParts:setEmotion("INVERTED", "NORMAL", "SMILE", 32, true)
                            local anchorPos = player:getPos():add(0, 0.8, 0)
                            local bodyYaw = player:getBodyYaw()
                            local isHost = host:isHost()
                            local colorTable = {vectors.vec3(0.337, 1, 1), vectors.vec3(0.984, 1, 0.533)}
                            for _ = 1, 10 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:end_rod"), anchorPos):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, (math.random() < 0.5 and (isHost and -0.075 or -0.1) or 0.1) * (math.random() * 0.2 + 0.8), math.random() * 0.2 - 0.05, 0, 0, 1, 0)):setColor(colorTable[math.floor(math.random() * 2) + 1])
                            end
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), anchorPos, 1, 1.8)
                        end
                    end;

                    onPostAnimation = function (self, forcedStop)
                        events.RENDER:remove("ex_skill_1_render")
                        if not forcedStop then
                            self.parent.placementObjectManager:spawn(1, player:getPos():add(vectors.rotateAroundAxis(player:getBodyYaw() * -1, 0, 3, 5, 0, 1, 0)), 0)
                        end
                        models.models.ex_skill_1.MedicalBox:setParentType("Item")
                    end;
                };
            };

            {
                name = {
                    en_us = "The sound of blessings";
                    ja_jp = "祝福の響き";
                };

                formationType = "STRIKER";

                models = {models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell.Camera, models.models.ex_skill_2.MusicStand, models.models.ex_skill_2.Bag, models.models.ex_skill_2.Presents, models.models.ex_skill_2.StuffedWolf, models.models.ex_skill_2.GroundEffect, models.models.ex_skill_2.Gui};

                animations = {"main", "ex_skill_2"};

                camera = {
                    start = {
                        rot = vectors.vec3(70, 60, 0);
                        pos = vectors.vec3(12, 64.5, 5);
                    };

                    fin = {
                        rot = vectors.vec3(-5, 270, 0);
                        pos = vectors.vec3(-53.2, 17, -5);
                    };
                };

                callbacks = {
                    onPreAnimation = function (self)
                        if not self.exSkill[2].init then
                            models.models.ex_skill_2.MusicStand.MusicStandBookHolder:newText("music_stand_book_holder"):setText("§8Cherry Berry Merry"):setPos(3, 2.5, -1):setScale(0.03, 0.03, 0.03):setWrap(true):setWidth(120):setAlignment("CENTER")
                            self.exSkill[2].init = true
                        end
                        events.RENDER:register(function ()
                            for _, modelPart in ipairs({models.models.ex_skill_2.GroundEffect, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell.Camera.HandbellEffect1, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell.Camera.HandbellEffect2}) do
                                local opacity = modelPart[modelPart:getName().."Opacity"]:getAnimScale().x
                                modelPart:setOpacity(opacity)
                                modelPart:setColor(vectors.vec3(1, 1, 1):scale(opacity))
                            end
                            if host:isHost() then
                                models.models.ex_skill_2.Gui.Frame:setOpacity(models.models.ex_skill_2.Gui.FrameOpacity:getAnimScale().x)
                            end
                        end, "ex_skill_2_render")
                        models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell:setPos()
                        models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell:setRot()
                        models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell:setParentType("None")
                        self.exSkill[2].noteParticleSpawnCount = math.random(2, 3)
                        self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "SMILE", 17, true)
                        pings.selectChristmasSong(math.random(1, 5))
                        self.costume.costumes[2].bellStage = 1
                    end;

                    onAnimationTick = function (self, tick)
                        if tick == 3 then
                            self.exSkill[2].spawnHandbellParticles(self)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.note_block.chime"), player:getPos(), 1, 1.887749)
                        elseif tick == 6 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.note_block.chime"), player:getPos(), 0.25, 1.887749)
                        elseif tick == 13 then
                            self.exSkill[2].spawnHandbellParticles(self)
                        elseif tick == 17 then
                            self.parent.faceParts:setEmotion("NORMAL", "INVERTED", "SMILE", 7, true)
                        elseif tick == 24 then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "SMILE", 12, true)
                        elseif tick == 36 then
                            self.parent.faceParts:setEmotion("NORMAL", "CENTER", "OPENED_SMALL", 5, true)
                        elseif tick == 41 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "SMILE", 4, true)
                            local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.Head):add(0, 0.25, 0)
                            local bodyYaw = player:getBodyYaw()
                            for i = 0, 7 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:end_rod"), anchorPos):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, math.cos(i / 4 * math.pi) * 0.075, math.sin(i / 4 * math.pi) * 0.075, 0, 0, 1, 0)):setScale(2):setColor(1, 0.443, 0.631):setLifetime(20)
                            end
                            if host:isHost() then
                                local windowSize = client:getScaledWindowSize()
                                models.models.ex_skill_2.Gui.Frame:setScale(windowSize.x, windowSize.y, 1)
                            end
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.note_block.chime"), player:getPos(), 1, 1.887749)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.note_block.chime"), player:getPos(), 0.5, 0.943874)
                        elseif tick == 44 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.note_block.chime"), player:getPos(), 0.75, 1.887749)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.note_block.chime"), player:getPos(), 0.375, 0.943874)
                        elseif tick == 45 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "OPENED", 14, true)
                        elseif tick == 50 then
                            models.models.ex_skill_2.GroundEffect:setVisible(false)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.note_block.chime"), player:getPos(), 0.5, 1.887749)
                        elseif tick == 59 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "SMILE", 6, true)
                        elseif tick == 65 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "SMILE", 5, true)
                        elseif tick == 70 then
                            self.parent.faceParts:setEmotion("NARROW", "NARROW", "SMILE", 44, true)
                        elseif tick == 71 then
                            self.exSkill[2].spawnHandbellParticles(self)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.note_block.chime"), player:getPos(), 1, 1.887749)
                        elseif tick == 74 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.note_block.chime"), player:getPos(), 0.25, 1.887749)
                        end

                        local melodyParticlePos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.ExSkill2ParticleAnchor1)
                        local melodyParticleDir = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.ExSkill2ParticleAnchor1.ExSkill2ParticleAnchor2):sub(melodyParticlePos):normalize():scale(0.1)
                        if tick >= 1 then
                            for i = 1, 8 do
                                local offsetPos = melodyParticlePos:copy():sub(self.exSkill[2].melodyParticlePosPrev):scale(0.125 * i)
                                local offsetDir = melodyParticleDir:copy():sub(self.exSkill[2].melodyParticleDirPrev):scale(0.125 * i)
                                for j = 1, 5 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:firework"), self.exSkill[2].melodyParticlePosPrev:copy():add(offsetPos):add(self.exSkill[2].melodyParticleDirPrev:copy():add(offsetDir):normalize():scale(0.1 * j))):setScale(0.1):setColor(1, 0.902, 0.576):setGravity(0)
                                end
                            end
                        end
                        if self.exSkill[2].noteParticleSpawnCount == 0 then
                            local offsetPos = math.random(0, 10) * 0.5
                            self.parent.melodyParticleManager:spawn(melodyParticlePos:copy():add(melodyParticleDir:copy():scale(offsetPos + (offsetPos >= 2.5 and 0 or 2))), models.models.ex_skill_2.ExSkill2ParticleAnchor1:getAnimRot():mul(-1, 1, -1), vectors.vec2(0.8, 0.8), vectors.vec3(), 60, false)
                            if offsetPos >= 2.5 then
                                self.parent.melodyParticleManager.objects[#self.parent.melodyParticleManager.objects].subObject:setScale(1, -1, 1)
                            end
                            self.exSkill[2].noteParticleSpawnCount = math.random(2, 3)
                        else
                            self.exSkill[2].noteParticleSpawnCount = self.exSkill[2].noteParticleSpawnCount - 1
                        end
                        self.exSkill[2].melodyParticlePosPrev = melodyParticlePos:copy()
                        self.exSkill[2].melodyParticleDirPrev = melodyParticleDir:copy()
                    end;

                    onPostAnimation = function (self, forcedStop)
                        events.RENDER:remove("ex_skill_2_render")
                        models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell:setParentType("Item")
                    end;
                };

                ---このExスキルの初期化処理が行われたかどうか
                ---@type boolean
                init = false;

                ---前ティックの楽譜のパーティクルのアンカー位置
                ---@type Vector3
                melodyParticlePosPrev = vectors.vec3();

                ---前ティックの楽譜のパーティクルのアンカー方向
                ---@type Vector3
                melodyParticleDirPrev = vectors.vec3();

                ---楽譜の音符パーティクルをスポーンさせるまでのカウンター
                ---@type integer
                noteParticleSpawnCount = 0;

                ---ハンドベルの音符パーティクルを表示する。
                ---@param self BlueArchiveCharacter
                spawnHandbellParticles = function (self)
                    local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell.Camera.HandbellEffect1)
                    for _ = 1, 5 do
                        self.parent.melodyParticleManager:spawn(anchorPos, vectors.vec3(), vectors.vec2(0.25, 0.25), vectors.vec3(math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1):normalize():scale(0.02), 20, true)
                    end
                end;
            }
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

                    ---救急箱の位置：0. 持っていない, 1. メインハンドに持っている, 2. オフハンドに持っている
                    ---@type integer
                    medicalBoxPos = 0;

                    ---@param mode Event.ItemRender.renderType
                    medicalBoxItemRender = function (_, mode)
                        local isLeftHanded = player:isLeftHanded()
                        if (isLeftHanded and instance.costume.costumes[1].medicalBoxPos == 2) or (not isLeftHanded and instance.costume.costumes[1].medicalBoxPos == 1) then
                            --右手に救急箱を持つ
                            if mode == "THIRD_PERSON_RIGHT_HAND" then
                                models.models.ex_skill_1.MedicalBox:setPos(-5.5, -4, 0)
                                models.models.ex_skill_1.MedicalBox:setRot(45, 0, 0)
                                models.models.ex_skill_1.MedicalBox:setScale(0.8, 0.8, 0.8)
                                return models.models.ex_skill_1.MedicalBox
                            elseif mode == "FIRST_PERSON_RIGHT_HAND" and instance.parent.gun.shouldShowWeaponInFirstPerson then
                                models.models.ex_skill_1.MedicalBox:setPos(-9, -3, 0)
                                models.models.ex_skill_1.MedicalBox:setRot(0, 0, 0)
                                models.models.ex_skill_1.MedicalBox:setScale(0.8, 0.8, 0.8)
                                return models.models.ex_skill_1.MedicalBox
                            end
                        elseif (isLeftHanded and instance.costume.costumes[1].medicalBoxPos == 1) or (not isLeftHanded and instance.costume.costumes[1].medicalBoxPos == 2) then
                            --左手に救急箱を持つ
                            if mode == "THIRD_PERSON_LEFT_HAND" then
                                models.models.ex_skill_1.MedicalBox:setPos(5.5, -4, 0)
                                models.models.ex_skill_1.MedicalBox:setRot(45, 0, 0)
                                models.models.ex_skill_1.MedicalBox:setScale(0.8, 0.8, 0.8)
                                return models.models.ex_skill_1.MedicalBox
                            elseif mode == "FIRST_PERSON_LEFT_HAND" and instance.parent.gun.shouldShowWeaponInFirstPerson then
                                models.models.ex_skill_1.MedicalBox:setPos(9, -3, 0)
                                models.models.ex_skill_1.MedicalBox:setRot(0, 0, 0)
                                models.models.ex_skill_1.MedicalBox:setScale(0.8, 0.8, 0.8)
                                return models.models.ex_skill_1.MedicalBox
                            end
                        end
                    end;
                };

                {
                    name = "christmas";

                    displayName = {
                        en_us = "Christmas";
                        ja_jp = "クリスマス";
                    };

                    exSkill = 2;

                    ---衣装の初期化処理がされたかどうか
                    ---@type boolean
                    init = false;

                    ---ハンドベルで演奏する曲データ
                    ---音階をintegerで表す。
                    ---@type integer[][]
                    songs = {
                        -- 1. ジングルベル（Jingle Bells） - https://youtu.be/iyj1SJ5QhjE?si=WEVd-lbmTmJrSlFV
                        {6, 6, 15, 13, 11, 6, 6, 6, 15, 13, 11, 8, 8, 8, 16, 15, 13, 10, 18, 20, 18, 16, 13, 15, 6, 6, 15, 13, 11, 6, 6, 6, 15, 13, 11, 8, 8, 8, 16, 15, 13, 18, 18, 18, 18, 20, 18, 16, 13, 11, 15, 15, 15, 15, 15, 15, 15, 15, 18, 11, 13, 15, 16, 16, 16, 16, 16, 15, 15, 15, 15, 13, 13, 11, 13, 18, 15, 15, 15, 15, 15, 15, 15, 18, 11, 13, 15, 16, 16, 16, 16, 16, 15, 15, 15, 18, 18, 16, 13, 11};

                        -- 2. We Wish You A Merry Christmas - https://youtu.be/qzLf6vkgCYA?si=FnAuabFiLweN5mgf
                        {8, 13, 13, 15, 13, 12, 10, 10, 10, 15, 15, 17, 15, 13, 12, 8, 8, 17, 17, 18, 17, 15, 13, 10, 8, 8, 10, 15, 12, 13, 8, 13, 13, 13, 12, 12, 13, 12, 10, 8, 15, 17, 15, 13, 20, 8, 8, 8, 10, 15, 12, 13};

                        -- 3. サンタが街にやってくる（Santa Claus is coming to town）- https://youtu.be/fm-YVXMjZw4?si=GIh685jacZ1e8A5V
                        {13, 10, 11, 13, 13, 13, 15, 17, 18, 18, 10, 11, 13, 13, 13, 15, 13, 11, 11, 10, 13, 6, 10, 8, 11, 5, 6, 13, 10, 11, 13, 13, 13, 15, 17, 18, 18, 10, 11, 13, 13, 13, 15, 13, 11, 11, 10, 13, 6, 10, 8, 11, 5, 6, 18, 20, 18, 17, 18, 15, 15, 18, 20, 18, 17, 18, 15, 20, 22, 20, 19, 20, 17, 17, 17, 17, 18, 20, 18, 17, 15, 13, 13, 13, 10, 11, 13, 13, 13, 15, 17, 18, 18, 10, 11, 13, 13, 13, 15, 13, 11, 11, 10, 13, 6, 10, 8, 11, 20, 18, 30};

                        -- 4. きよしこの夜（Silent Night） - https://youtu.be/IgTv3Osi_oU?si=XdnJgwDeH2jeXDl0
                        {13, 15, 13, 10, 13, 15, 13, 10, 20, 20, 17, 18, 18, 13, 15, 15, 18, 17, 15, 13, 15, 13, 10, 15, 15, 18, 17, 15, 13, 15, 13, 10, 20, 20, 23, 20, 17, 18, 22, 18, 13, 10, 13, 11, 8, 6};

                        -- 5. もろびとこぞりて（Joy to the World!） - https://youtu.be/Zk9AB0RfubI?si=Q_O7tJA_-fpgZ73b
                        {20, 19, 17, 15, 13, 12, 10, 8, 15, 17, 17, 19, 19, 20, 20, 20, 19, 17, 15, 15, 13, 12, 20, 20, 19, 17, 15, 15, 13, 12, 12, 12, 12, 12, 12, 13, 15, 13, 12, 10, 10, 10, 10, 12, 13, 12, 10, 8, 20, 17, 15, 13, 12, 13, 12, 10, 8};
                    };

                    ---ハンドベルで演奏する曲のインデックス番号
                    ---0では固定音を出す。
                    ---@type integer
                    songIndex = 0;

                    ---曲の進行度合い
                    ---@type integer
                    bellStage = 1;
                };
            };

            callbacks = {
                onChange = function (self)
                    events.ITEM_RENDER:remove("medical_box_item_render")
                    self.parent.costume.setCostumeTextureOffset(1)
                    models.models.main.Avatar.UpperBody.Body.Skirt:setUVPixels(0, 14)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.CChristmasH, models.models.main.Avatar.UpperBody.Body.CChristmasB, models.models.main.Avatar.UpperBody.Arms.RightArm.CChristmasRA, models.models.main.Avatar.UpperBody.Arms.LeftArm.CChristmasLA}) do
                        modelPart:setVisible(true)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.NurseCap, models.models.main.Avatar.Head.HairTail, models.models.main.Avatar.Head.HairTailRibbon, models.models.main.Avatar.UpperBody.Body.Bag, models.models.main.Avatar.UpperBody.Arms.LeftArm.Cross}) do
                        modelPart:setVisible(false)
                    end
                    models.models.main.Avatar.UpperBody.Body.ChestRibbon:moveTo(models.models.main.Avatar.Head)
                    models.models.main.Avatar.UpperBody.Body:removeChild(models.models.main.Avatar.Head.ChestRibbon)
                    models.models.main.Avatar.Head.ChestRibbon:setPos(-4.25, 10, 1.5)
                    models.models.main.Avatar.Head.ChestRibbon:setRot(0, 90, 0)
                    models.models.main.Avatar.Head.ChestRibbon:setScale(1.2, 1.2, 1.2)
                    if not self.costume.costumes[2].init then
                        for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell.Handbell1_Top, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell.Handbell2_Top}) do
                            modelPart:setPrimaryTexture("RESOURCE", "minecraft:textures/block/bell_top.png")
                        end
                        for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell.Handbell1_Side, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell.Handbell2_Side}) do
                            modelPart:setPrimaryTexture("RESOURCE", "minecraft:textures/block/bell_side.png")
                        end
                        models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell.Handbell2_Bottom:setPrimaryTexture("RESOURCE", "minecraft:textures/block/bell_bottom.png")
                        self.costume.costumes[2].init = true
                    end
                    events.TICK:register(function ()
                        local isHoldingBell = player:getHeldItem().id == "minecraft:bell"
                        local targetBlock = player:getTargetedBlock(true, 4.5)
                        if player:isSwingingArm() and isHoldingBell and player:getSwingTime() == 0 and (targetBlock.id == "minecraft:air" or targetBlock.id == "minecraft:cave_air" or targetBlock.id == "minecraft:void_air") then
                            local scale = self.costume.costumes[2].songIndex >= 1 and self.costume.costumes[2].songs[self.costume.costumes[2].songIndex][self.costume.costumes[2].bellStage] or 23
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.note_block.chime"), player:getPos(), 1, 2 ^ ((scale - 12) / 12))
                            if self.costume.costumes[2].songIndex >= 1 then
                                if self.costume.costumes[2].bellStage == #self.costume.costumes[2].songs[self.costume.costumes[2].songIndex] then
                                    self.costume.costumes[2].bellStage = 1
                                else
                                    self.costume.costumes[2].bellStage = self.costume.costumes[2].bellStage + 1
                                end
                            else
                                self.costume.costumes[2].bellStage = 1
                            end
                            self.dataSync.syncData.bellStage = self.costume.costumes[2].bellStage
                        elseif not isHoldingBell then
                            self.costume.costumes[2].bellStage = 1
                            self.dataSync.syncData.bellStage = 1
                        end
                    end, "costume_christmas_hand_bell_tick")
                    events.ITEM_RENDER:register(function (item, mode)
                        if item.id == "minecraft:bell" then
                            if mode == "FIRST_PERSON_LEFT_HAND" then
                                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell:setPos(4, -13.5, 0.5)
                                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell:setRot(-90, -30, 180)
                            elseif mode == "FIRST_PERSON_RIGHT_HAND" then
                                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell:setPos(7, -13.5, 0.5)
                                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell:setRot(-90, 30, 180)
                            elseif mode == "THIRD_PERSON_LEFT_HAND" then
                                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell:setPos(5.5, -13.5, 0.5)
                                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell:setRot(-90, 0, 180)
                            elseif mode == "THIRD_PERSON_RIGHT_HAND" then
                                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell:setPos(5.5, -13.5, 0.5)
                                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell:setRot(-90, 0, 180)
                            end
                            return models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell
                        end
                    end, "costume_christmas_hand_bell_item_render")
                end;

                onReset = function (self)
                    events.TICK:remove("costume_christmas_hand_bell_tick")
                    events.ITEM_RENDER:remove("costume_christmas_hand_bell_item_render")
                    self.parent.costume.setCostumeTextureOffset(0)
                    models.models.main.Avatar.UpperBody.Body.Skirt:setUVPixels()
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.CChristmasH, models.models.main.Avatar.UpperBody.Body.CChristmasB, models.models.main.Avatar.UpperBody.Arms.RightArm.CChristmasRA, models.models.main.Avatar.UpperBody.Arms.LeftArm.CChristmasLA}) do
                        modelPart:setVisible(false)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.NurseCap, models.models.main.Avatar.Head.HairTail, models.models.main.Avatar.Head.HairTailRibbon, models.models.main.Avatar.UpperBody.Body.Bag, models.models.main.Avatar.UpperBody.Arms.LeftArm.Cross}) do
                        modelPart:setVisible(true)
                    end
                    if models.models.main.Avatar.Head.ChestRibbon ~= nil then
                        models.models.main.Avatar.Head.ChestRibbon:moveTo(models.models.main.Avatar.UpperBody.Body)
                        models.models.main.Avatar.Head:removeChild(models.models.main.Avatar.UpperBody.Body.ChestRibbon)
                        models.models.main.Avatar.UpperBody.Body.ChestRibbon:setPos()
                        models.models.main.Avatar.UpperBody.Body.ChestRibbon:setRot()
                        models.models.main.Avatar.UpperBody.Body.ChestRibbon:setScale()
                    end
                    if events.ITEM_RENDER:getRegisteredCount("medical_box_item_render") == 0 then
                        events.ITEM_RENDER:register(self.costume.costumes[1].medicalBoxItemRender, "medical_box_item_render")
                    end
                end;

                onArmorChange = function (self, parts, isVisible)
                    if parts == "HELMET" then
                        if self.parent.costume.currentCostume == 1 then
                            models.models.main.Avatar.Head.NurseCap:setVisible(not isVisible)
                        else
                            for _, modelPart in ipairs({models.models.main.Avatar.Head.CChristmasH.Hat, models.models.main.Avatar.Head.CChristmasH.Bun}) do
                                modelPart:setVisible(not isVisible)
                            end
                        end
                    elseif parts == "CHEST_PLATE" then
                        models.models.main.Avatar.UpperBody.Body.Bag:setVisible(not isVisible and self.parent.costume.currentCostume == 1)
                    elseif parts == "LEGGINGS" then
                        models.models.main.Avatar.UpperBody.Body.Skirt:setVisible(not isVisible)
                    end
                end;
            };
        }

        instance.bubble = {
            callbacks = {
                onPlay = function (self, type, duration)
                    if duration > 0 then
                        if type == "GOOD" then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "SMILE", duration, true)
                        elseif type == "HEART" then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "OPENED", duration, true)
                        elseif type == "NOTE" then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "OPENED_SMALL", duration, true)
                        elseif type == "QUESTION" then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "TIRED", duration, true)
                        elseif type == "SWEAT" then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "SAD", duration, true)
                        end
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
                onPhase1 = function (_, dummyAvatar, costume)
                    if costume == "DEFAULT" then
                        for _, modelPart in ipairs({dummyAvatar.Head.HairTail, dummyAvatar.Head.HairTailRibbon.HairTailRibbonTip1, dummyAvatar.Head.HairTailRibbon.HairTailRibbonTip2}) do
                            modelPart:setRot(30, 0, 0)
                        end
                    end
                    dummyAvatar.UpperBody.Body.Skirt:setRot(30, 0, 0)
                    dummyAvatar.Head.Feather:setRot(55, 0, 0)
                end;

                onPhase2 = function (_, dummyAvatar, costume)
                    if costume == "DEFAULT" then
                        for _, modelPart in ipairs({dummyAvatar.Head.HairTail, dummyAvatar.Head.HairTailRibbon.HairTailRibbonTip1, dummyAvatar.Head.HairTailRibbon.HairTailRibbonTip2}) do
                            modelPart:setRot(-20, 0, 0)
                        end
                    end
                    dummyAvatar.LowerBody.Legs.RightLeg.RightLegBottom:setPivot(2, 6, -2)
                    dummyAvatar.Head.Feather:setRot(-20, 0, 0)
                end;

                onBeforeModelCopy = function ()
                    models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell:setVisible(false)
                end;

                onAfterModelCopy = function ()
                    models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell:setVisible(true)
                end;
            };
        }

        instance.actionWheel = {
            isVehicleOptionEnabled = false;
        }

        instance.physics = {
            physicData = {
                {
                    models = {models.models.main.Avatar.Head.HairTail, models.models.main.Avatar.Head.HairTailRibbon.HairTailRibbonTip1, models.models.main.Avatar.Head.HairTailRibbon.HairTailRibbonTip2};

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
                    models = {models.models.main.Avatar.Head.HairTail.HairTailZPivot};

                    z = {
                        vertical = {
                            min = -60;
                            neutral = -5;
                            max = 0;

                            headZ = {
                                multiplayer = -80;
                                min = -60;
                                max = 0;
                            };

                            headRot = {
                                multiplayer = 0.05;
                                min = -60;
                                max = 0;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -60;
                                max = 0;
                            };
                        };
                    };
                };
                {
                    models = {models.models.main.Avatar.Head.HairTailRibbon.HairTailRibbonTip1.HairTailRibbonTip1ZPivot, models.models.main.Avatar.Head.HairTailRibbon.HairTailRibbonTip2.HairTailRibbonTip2ZPivot};

                    z = {
                        vertical = {
                            min = -150;
                            neutral = -5;
                            max = 0;

                            headZ = {
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
                                min = -150;
                                max = 0;
                            };
                        };
                    };
                };
                {
                    models = {models.models.main.Avatar.Head.Feather};

                    x = {
                        vertical = {
                            min = -90;
                            neutral = 0;
                            max = 90;

                            headRotMultiplayer = -1;

                            headX = {
                                multiplayer = -120;
                                min = -90;
                                max = 90;
                            };
                        };

                        horizontal = {
                            min = -45;
                            neutral = 45;
                            max = 45;

                            headX = {
                                multiplayer = -120;
                                min = -45;
                                max = 45;
                            };
                        };
                    };
                };
                {
                    models = {models.models.main.Avatar.Head.Feather.FeatherZPivot};

                    z = {
                        vertical = {
                            min = -160;
                            neutral = 0;
                            max = 75;

                            headZ = {
                                multiplayer = -120;
                                min = -80;
                                max = 75;
                            };

                            headRot = {
                                multiplayer = 0.075;
                                min = -80;
                                max = 75;
                            };

                            bodyY = {
                                multiplayer = 120;
                                min = -160;
                                max = 0;
                            };
                        };
                    };
                };
            };
        }

        instance.dataSync = {
            syncData = {
                songIndex = 1;
                bellStage = 1;
            };

            callbacks = {
                onDataSynced = function (self)
                    self.costume.costumes[2].songIndex = self.dataSync.syncData.songIndex
                    self.costume.costumes[2].bellStage = self.dataSync.syncData.bellStage
                end;
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
        self.parent.avatarEvents.SCRIPT_INIT:register(function ()
            events.TICK:register(function ()
                if self.parent.gun.currentGunPosition == "NONE" and self.parent.exSkill.animationCount == -1 and self.parent.costume.currentCostume == 1 then
                    local healingPotionPos = 0
                    for i = 1, 2 do
                        local heldItem = player:getHeldItem(i == 2)
                        if (heldItem.id == "minecraft:potion" or heldItem.id == "minecraft:splash_potion" or heldItem.id == "minecraft:lingering_potion") and heldItem.tag.Potion ~= nil and heldItem.tag.Potion:match("minecraft:.*healing") ~= nil then
                            healingPotionPos = i
                            break
                        end
                    end
                    self.costume.costumes[1].medicalBoxPos = healingPotionPos
                else
                    self.costume.costumes[1].medicalBoxPos = 0
                end
                if self.costume.costumes[1].medicalBoxPos > 0 and self.parent.arms.armState.right ~= 4 then
                    self.parent.arms:setArmState(4, 4)
                end
            end)

            if self.parent.costume.currentCostume == 1 then
                events.ITEM_RENDER:register(self.costume.costumes[1].medicalBoxItemRender, "medical_box_item_render")
            end
        end)
    end;
}

---Exスキル2後のハンドベルで演奏できるクリスマスソングを決める。
---@param index integer 曲のインデックス番号
function pings.selectChristmasSong(index)
    AvatarInstance.characterData.costume.costumes[2].songIndex = index
    local songNames = {"Jingle Bells", "We Wish You A Merry Christmas", "Santa Claus is coming to town", "Silent Night", "Joy to the World!"}
    local task = models.models.ex_skill_2.MusicStand.MusicStandBookHolder:getTask("music_stand_book_holder")
    if task ~= nil then
        task:setText("§8"..songNames[AvatarInstance.characterData.costume.costumes[2].songIndex])
    end
    if host:isHost() then
        AvatarInstance.characterData.dataSync.syncData.songIndex = index
    end
end