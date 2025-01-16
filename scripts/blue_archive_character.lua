---@alias BlueArchiveCharacter.RightEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "CENTER" # 少し反対側を見る目
---| "ANGRY" # 怒った目
---| "UNEQUAL" # 不等号目

---@alias BlueArchiveCharacter.LeftEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "CENTER" # 少し反対側を見る目
---| "ANGRY_CENTER" # 怒りつつ少し反対側を見る目
---| "UNEQUAL" # 不等号目
---| "ANGRY" # 怒った目
---| "INVERTED" # 反対側を見る目

---@alias BlueArchiveCharacter.MouthTextures
---| "NORMAL" # 通常
---| "ANXIOUS" # 小さく空いている口
---| "OPENED" # 全力の開け口
---| "OPENED_SMALL" # 小さく開いている口
---| "YUMMY" # 舌をペロッとしている口
---| "SMILE" # にっこり
---| "W" # W
---| "SHOCK" # あんぐり口
---| "O" # 丸い口

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
                en_us = "Ibuki";
                ja_jp = "イブキ";
            };

            lastName = {
                en_us = "Tanga";
                ja_jp = "丹花";
            };

            clubName = {
                en_us = "Pandemonium Society";
                ja_jp = "万魔殿";
            };

            birth = {
                month = 4;
                day = 14;
            };
        }

        instance.faceParts = {
            rightEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(2, 0); --必須
                TIRED = vectors.vec2(3, 0); --必須
                CLOSED = vectors.vec2(4, 0); --必須
                CENTER = vectors.vec2(5, 0);
                ANGRY = vectors.vec2(7, 0);
                UNEQUAL = vectors.vec2(9, 0);
            };

            leftEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(1, 0); --必須
                TIRED = vectors.vec2(2, 0); --必須
                CLOSED = vectors.vec2(3, 0); --必須
                CENTER = vectors.vec2(5, 0);
                ANGRY_CENTER = vectors.vec2(7, 0);
                UNEQUAL = vectors.vec2(8, 0);
                ANGRY = vectors.vec2(-1, 1);
                INVERTED = vectors.vec2(0, 1);
            };

            mouth = {
                ANXIOUS = vectors.vec2(0, 0);
                OPENED = vectors.vec2(1, 0);
                OPENED_SMALL = vectors.vec2(2, 0);
                YUMMY = vectors.vec2(3, 0);
                SMILE = vectors.vec2(0, 1);
                W = vectors.vec2(1, 1);
                SHOCK = vectors.vec2(2, 1);
                O = vectors.vec2(3, 1);
            };

            emotionSet = {
                onDamage = {
                    rightEye = "UNEQUAL";
                    leftEye = "UNEQUAL";
                    mouth = "SHOCK";
                };
            };
        }

        instance.arms = {
            callbacks = {
                onArmStateChanged = function (self, right, left)
                    if self.costume.costumes[1].isRidingTank then
                        if self.costume.costumes[1].tankTick < 21 then
                            return {right = 0, left = 0}
                        else
                            return {right = right == 1 and 5 or (right == 2 and 6 or (right == 0 and 4 or right)), left = left == 1 and 5 or (left == 2 and 6 or (left == 0 and 4 or left))}
                        end
                    end
                end;

                onAdditionalRightArmProcess = function (self, state)
                    if state == 4 then
                        --虎丸搭乗中
                        events.TICK:register(function ()
                            if self.costume.costumes[1].isRidingTank then
                                local isLeftHanded = player:isLeftHanded()
                                local activeHand = player:getActiveHand()
                                models.models.main.Avatar.UpperBody.Arms.RightArm:setRot(player:getActiveItem().id ~= "minecraft:air" and ((activeHand == "MAIN_HAND" and not isLeftHanded) or (activeHand == "OFF_HAND" and isLeftHanded)) and 0 or 52.5, 0, 0)
                            end
                        end, "right_arm_tick")
                    elseif state == 5 then
                        --虎丸搭乗中の武器の構え
                        events.TICK:register(function ()
                            self.parent.arms:processArmWingCount()
                            if player:isSwingingArm() and not player:isLeftHanded() and self.costume.costumes[1].shootTick == -1 then
                                models.models.main.Avatar.UpperBody.Arms.RightArm:setParentType("RightArm")
                            else
                                models.models.main.Avatar.UpperBody.Arms.RightArm:setParentType("Body")
                            end
                            if player:getActiveItem().id == "minecraft:crossbow" then
                                self.parent.arms:setArmState(3, 3)
                            end
                        end, "right_arm_tick")
                        events.RENDER:register(function (delta)
                            local lookDir = player:getLookDir()
                            local dir = ((math.deg(math.atan2(lookDir.z, lookDir.x)) - 90) % 360 - player:getBodyYaw() % 360) % 360
                            dir = dir > 180 and dir - 360 or dir
                            local headRot = vanilla_model.HEAD:getOriginRot()
                            models.models.main.Avatar.UpperBody.Arms.RightArm:setRot((player:isSwingingArm() and not player:isLeftHanded()) and vectors.vec3() or vectors.vec3(headRot.x + math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * 2.5 + 90 + (player:isCrouching() and 30 or 0), math.clamp(dir * -1 + 90, -70, 78), 0))
                        end, "right_arm_render")
                    elseif state == 6 then
                        --虎丸搭乗中の武器を持っていない手
                        events.TICK:register(function ()
                            self.parent.arms:processArmWingCount()
                            if player:isSwingingArm() and not player:isLeftHanded() and self.costume.costumes[1].shootTick == -1 then
                                models.models.main.Avatar.UpperBody.Arms.RightArm:setParentType("RightArm")
                            else
                                models.models.main.Avatar.UpperBody.Arms.RightArm:setParentType("Body")
                            end
                        end, "right_arm_tick")
                        events.RENDER:register(function (delta)
                            local lookDir = player:getLookDir()
                            local dir = ((math.deg(math.atan2(lookDir.z, lookDir.x)) - 120) % 360 - player:getBodyYaw() % 360) % 360
                            dir = dir > 180 and dir - 360 or dir
                            local headRot = vanilla_model.HEAD:getOriginRot()
                            models.models.main.Avatar.UpperBody.Arms.RightArm:setRot((player:isSwingingArm() and player:isLeftHanded()) and vectors.vec3() or vectors.vec3(headRot.x + math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * 2.5 + 90 + (player:isCrouching() and 30 or 0), math.clamp(dir * -1 + 90, -70, 78), 0))
                        end, "right_arm_render")
                    end
                end;

                onAdditionalLeftArmProcess = function (self, state)
                    if state == 4 then
                        --虎丸搭乗中
                        events.TICK:register(function ()
                            if self.costume.costumes[1].isRidingTank then
                                local isLeftHanded = player:isLeftHanded()
                                local activeHand = player:getActiveHand()
                                models.models.main.Avatar.UpperBody.Arms.LeftArm:setRot(player:getActiveItem().id ~= "minecraft:air" and ((activeHand == "MAIN_HAND" and isLeftHanded) or (activeHand == "OFF_HAND" and not isLeftHanded)) and 0 or 52.5, 0, 0)
                            end
                        end, "left_arm_tick")
                    elseif state == 5 then
                        --虎丸搭乗中の武器の構え
                        events.TICK:register(function ()
                            self.parent.arms:processArmWingCount()
                            if player:isSwingingArm() and player:isLeftHanded() and self.costume.costumes[1].shootTick == -1 then
                                models.models.main.Avatar.UpperBody.Arms.LeftArm:setParentType("LeftArm")
                            else
                                models.models.main.Avatar.UpperBody.Arms.LeftArm:setParentType("Body")
                            end
                            if player:getActiveItem().id == "minecraft:crossbow" then
                                self.parent.arms:setArmState(3, 3)
                            end
                        end, "right_arm_tick")
                        events.RENDER:register(function (delta)
                            local lookDir = player:getLookDir()
                            local dir = ((math.deg(math.atan2(lookDir.z, lookDir.x)) - 90) % 360 - player:getBodyYaw() % 360) % 360
                            dir = dir > 180 and dir - 360 or dir
                            local headRot = vanilla_model.HEAD:getOriginRot()
                            models.models.main.Avatar.UpperBody.Arms.LeftArm:setRot(((player:isSwingingArm() and player:isLeftHanded()) or self.costume.costumes[1].shootTick >= 0) and vectors.vec3() or vectors.vec3(headRot.x + math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * 2.5 + 90, math.clamp(dir * -1 + 90, -70, 90), 0))
                        end, "left_arm_render")
                    elseif state == 6 then
                        --虎丸搭乗中の武器を持っていない手
                        events.TICK:register(function ()
                            self.parent.arms:processArmWingCount()
                            if player:isSwingingArm() and player:isLeftHanded() and self.costume.costumes[1].shootTick == -1 then
                                models.models.main.Avatar.UpperBody.Arms.LeftArm:setParentType("LeftArm")
                            else
                                models.models.main.Avatar.UpperBody.Arms.LeftArm:setParentType("Body")
                            end
                        end, "left_arm_tick")
                        events.RENDER:register(function (delta)
                            local lookDir = player:getLookDir()
                            local dir = ((math.deg(math.atan2(lookDir.z, lookDir.x)) - 60) % 360 - player:getBodyYaw() % 360) % 360
                            dir = dir > 180 and dir - 360 or dir
                            local headRot = vanilla_model.HEAD:getOriginRot()
                            models.models.main.Avatar.UpperBody.Arms.LeftArm:setRot((player:isSwingingArm() and player:isLeftHanded()) and vectors.vec3() or vectors.vec3(headRot.x + math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * 2.5 + 90 + (player:isCrouching() and 30 or 0), math.clamp(dir * -1 + 90, -70, 90), 0))
                        end, "left_arm_render")
                    end
                end;
            };
        }

        instance.skirt = {

        }

        instance.gun = {
            scale = 1.5;

            gunPosition = {
                hold = {
                    type = "NORMAL";

                    firstPersonPos = {
                        right = vectors.vec3(-0.5, 1.5, -2);
                        left = vectors.vec3(0.5, 1.5, -2);
                    };

                    thirdPersonPos = {
                        right = vectors.vec3(-1.75, 0, -4);
                        left = vectors.vec3(1.75, 0, -4);
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
                    en_us = "Ibuki's Magic Time!";
                    ja_jp = "イブキのお絵描きタイム！";
                };

                formationType = "STRIKER";

                models = {models.models.ex_skill_1.Table, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.SketchBook, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Crayon1, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Crayon2, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Crayon3, models.models.main.Avatar.Head.NoticeEffects, models.models.main.Avatar.SpinEffects};

                animations = {"main", "ex_skill_1"};

                camera = {
                    start = {
                        rot = vectors.vec3(0, -160, 0);
                        pos = vectors.vec3(-2, 17, -19);
                    };

                    fin = {
                        rot = vectors.vec3(10, -160, 0);
                        pos = vectors.vec3(-7, 32.2, -15);
                    };
                };

                callbacks = {
                    onPreAnimation = function (self)
                        if not self.exSkill[1].init then
                            models.models.ex_skill_1.Table.TableTop:setPrimaryTexture("RESOURCE", "minecraft:textures/block/oak_planks.png")
                            for i = 1, 4 do
                                models.models.ex_skill_1.Table["TableFeet"..i.."_side"]:setPrimaryTexture("RESOURCE", "minecraft:textures/block/stripped_birch_log.png")
                                models.models.ex_skill_1.Table["TableFeet"..i.."_bottom"]:setPrimaryTexture("RESOURCE", "minecraft:textures/block/stripped_birch_log_top.png")
                            end
                            self.exSkill[1].init = true
                        end
                        for i = 0, 5 do
                            local offsetPos = vectors.rotateAroundAxis(180 / 5 * i * -1, -4, 0, 0, 0, 0, 1)
                            self.parent.exSkillSpriteManager:spawn(models.models.main.Avatar.Head.FlowerEffectArea1, 1, offsetPos, offsetPos, math.random() * 60 - 30, math.random() * 2 + 3, models.models.main.Avatar.Head.FlowerEffectArea1.FlowerEffectArea1Scale, 25, false, 1)
                        end
                        self.parent.faceParts:setEmotion("CENTER", "NORMAL", "ANXIOUS", 11, true)
                    end;

                    onAnimationTick = function (self, tick)
                        if tick == 10 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), player:getPos(), 1, 1.5)
                        elseif tick == 11 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "ANXIOUS", 3, true)
                        elseif tick == 12 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), player:getPos(), 0.5, 1.6)
                        elseif tick == 14 then
                            self.parent.faceParts:setEmotion("NORMAL", "CENTER", "OPENED", 9, true)
                        elseif tick == 23 then
                            self.parent.faceParts:setEmotion("ANGRY", "ANGRY_CENTER", "W", 2, true)
                        elseif tick == 25 then
                            self.parent.faceParts:setEmotion("UNEQUAL", "UNEQUAL", "W", 1, true)
                        elseif tick == 26 then
                            self.parent.faceParts:setEmotion("UNEQUAL", "UNEQUAL", "OPENED", 37, true)
                        elseif tick == 27 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.attack.sweep"), player:getPos(), 0.2, 0.85)
                        elseif tick == 39 then
                            for i = 0, 4 do
                                self.parent.exSkillSpriteManager:spawn(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.SketchBook.SketchBookEffects, 4, vectors.rotateAroundAxis(i <= 2 and i * -25 - 10 or (i - 3) * -25 - 140, -4.5 + math.random() * -1.5, 0, -2, 0, 0, 1), vectors.vec3(), 0, math.random() * 1.5 + 0.5, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.SketchBook.SketchBookEffects.SketchBookEffects2, 20, false, 1)
                            end
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), player:getPos(), 1, 1.5)
                        elseif tick == 58 then
                            models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.SketchBook.SketchBookCanvas:setUVPixels(0, 24)
                        elseif tick == 63 then
                            models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.SketchBook:moveTo(models.models.ex_skill_1.Table)
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "OPENED_SMALL", 10, true)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.chiseled_bookshelf.insert"), player:getPos(), 1, 1)
                        elseif tick == 73 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "OPENED_SMALL", 1, true)
                        elseif tick == 74 then
                            self.parent.faceParts:setEmotion("ANGRY", "ANGRY", "YUMMY", 59, true)
                        elseif tick == 79 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), player:getPos(), 0.5, 1.5)
                        elseif tick == 80 then
                            models.models.ex_skill_1.Table.SketchBook.SketchBookCanvas:setUVPixels(0, 48)
                        elseif tick == 90 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), player:getPos(), 0.5, 1.5)
                        elseif tick == 91 then
                            models.models.ex_skill_1.Table.SketchBook.SketchBookCanvas:setUVPixels(0, 72)
                        elseif tick == 96 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), player:getPos(), 0.5, 1.5)
                        elseif tick == 99 then
                            models.models.ex_skill_1.Table.SketchBook.SketchBookCanvas:setUVPixels(0, 96)
                        elseif tick == 111 then
                            models.models.ex_skill_1.Table.SketchBook.SketchBookCanvas:setUVPixels(0, 120)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), player:getPos(), 0.5, 1.5)
                        elseif tick == 129 then
                            models.models.ex_skill_1.Table.SketchBook:moveTo(models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.chiseled_bookshelf.insert"), player:getPos(), 1, 1)
                        elseif tick == 133 then
                            if host:isHost() then
                                local windowSize = client:getScaledWindowSize()
                                self.parent.exSkillSpriteManager:spawn(models.models.ex_skill_1.FlowerEffectArea3, math.random(1, 3), vectors.vec3(-40, -40, 1), vectors.vec3(), -30, 120, models.models.ex_skill_1.FlowerEffectArea3.FlowerEffectArea3Scale, 17, false, 1)
                                self.parent.exSkillSpriteManager:spawn(models.models.ex_skill_1.FlowerEffectArea3, math.random(1, 3), vectors.vec3(-80, -20, 1), vectors.vec3(), -30, 80, models.models.ex_skill_1.FlowerEffectArea3.FlowerEffectArea3Scale, 17, false, 1)
                                self.parent.exSkillSpriteManager:spawn(models.models.ex_skill_1.FlowerEffectArea3, math.random(1, 3), vectors.vec3(windowSize.x * - 1 + 40, -10, 1), vectors.vec3(), -30, 120, models.models.ex_skill_1.FlowerEffectArea3.FlowerEffectArea3Scale, 17, false, 1)
                                self.parent.exSkillSpriteManager:spawn(models.models.ex_skill_1.FlowerEffectArea3, math.random(1, 3), vectors.vec3(-50, windowSize.y * -1 + 20, 1), vectors.vec3(), -30, 120, models.models.ex_skill_1.FlowerEffectArea3.FlowerEffectArea3Scale, 17, false, 1)
                                self.parent.exSkillSpriteManager:spawn(models.models.ex_skill_1.FlowerEffectArea3, math.random(1, 3), vectors.vec3(windowSize.x * -1 + 30, windowSize.y * -1 + 30, 1), vectors.vec3(), -30, 100, models.models.ex_skill_1.FlowerEffectArea3.FlowerEffectArea3Scale, 17, false, 1)
                                self.parent.exSkillSpriteManager:spawn(models.models.ex_skill_1.FlowerEffectArea3, math.random(1, 3), vectors.vec3(windowSize.x * -1 + 90, windowSize.y * -1 + 10, 1), vectors.vec3(), -30, 60, models.models.ex_skill_1.FlowerEffectArea3.FlowerEffectArea3Scale, 17, false, 1)
                            end
                            local anchorPos = player:getPos()
                            local bodyYaw = player:getBodyYaw()
                            for _ = 1, 8 do
                                self.parent.exSkillSpriteManager:spawn(models.models.ex_skill_1.FlowerEffectArea2, math.random(1, 3), anchorPos:copy():add(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 2 - 1, math.random() * 0.25 + 0.675, math.random() * 1 - 0.5, 0, 1, 0)):scale(16), vectors.vec3(0, 10, 0), math.random() * 60 - 30, 3,models.models.ex_skill_1.FlowerEffectArea3.FlowerEffectArea3Scale, 17, true, 1)
                            end
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "YUMMY", 1, true)
                        elseif tick == 134 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "SMILE", 17, true)
                        elseif tick == 146 and host:isHost() then
                            models.models.ex_skill_1.FlowerEffectArea3.Transition:setScale(client:getScaledWindowSize():augmented(0))
                            models.models.ex_skill_1.FlowerEffectArea3.Transition:setVisible(true)
                            events.RENDER:register(function ()
                                models.models.ex_skill_1.FlowerEffectArea3.Transition:setOpacity(models.models.ex_skill_1.FlowerEffectArea3.TransitionOpacity:getAnimScale().x)
                            end, "ex_skill_1_render")
                        elseif tick == 147 then
                            if math.random() >= 0.95 then
                                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.SketchBook.SketchBookCanvas:setUVPixels(0, 168)
                            else
                                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.SketchBook.SketchBookCanvas:setUVPixels(0, 144)
                            end
                        elseif tick == 148 and host:isHost() then
                            models.models.ex_skill_1.FlowerEffectArea3.ScreenFrame:setVisible(true)
                            models.models.ex_skill_1.FlowerEffectArea3.ScreenFrame:setScale(client:getScaledWindowSize():augmented(0))
                            models.models.ex_skill_1.FlowerEffectArea3.ScreenFrame:setOpacity(0.75)
                        elseif tick == 151 then
                            if host:isHost() then
                                local windowSize = client:getScaledWindowSize()
                                for i = 0, 7 do
                                    local velocity = vectors.rotateAroundAxis(i <= 1 and (20 + i * 10) or (i <= 3 and (-35 + (i - 2) * -10) or (-210 + 20 * (i - 4))), -120 - math.random() * 30, 0, 0, 0, 0, 1)
                                    self.parent.exSkillSpriteManager:spawn(models.models.ex_skill_1.FlowerEffectArea3, math.random(1, 2), windowSize:copy():scale(-0.5):augmented(1):add(velocity), velocity, 30 * (math.random() >= 0.5 and 1 or -1), math.random() * 40 + 40, nil, 44, false, 0.85)
                                end
                                for i = 0, 5 do
                                    local velocity = vectors.rotateAroundAxis(60 * i, -120 - math.random() * 30, 0, 0, 0, 0, 1):mul(1, windowSize.y / windowSize.x, 1)
                                    self.parent.exSkillSpriteManager:spawn(models.models.ex_skill_1.FlowerEffectArea3, 4, windowSize:copy():scale(-0.5):augmented(1):add(velocity), velocity, 10 * (math.random() >= 0.5 and 1 or -1), i == 0 and 20 or (math.random() * 40 + 40), nil, 44, false, 0.85)
                                end
                            end
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "OPENED", 44, true)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), player:getPos(), 1, 1)
                        elseif tick == 154 and host:isHost() then
                            models.models.ex_skill_1.FlowerEffectArea3.Transition:setVisible(false)
                            events.RENDER:remove("ex_skill_1_render")
                        end

                        if tick >= 24 and tick < 39 then
                            for i = 1, 4 do
                                local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.SpinEffects["SpinEffect"..i]["SpinEffect"..i.."_1"]["SpinEffect"..i.."Anchor1"])
                                self.parent.exSkillSpriteManager:spawn(models.models.ex_skill_1.FlowerEffectArea2, 1, anchorPos:copy():scale(16), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.SpinEffects["SpinEffect"..i]["SpinEffect"..i.."_1"]["SpinEffect"..i.."Anchor2"]):sub(anchorPos):normalize():scale(30), 0, 2, nil, math.min(39 - tick, 8), true, 1)
                            end
                        end
                    end;

                    onPostAnimation = function (self, forcedStop)
                        if models.models.ex_skill_1.Table.SketchBook ~= nil then
                            models.models.ex_skill_1.Table.SketchBook:moveTo(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom)
                        elseif models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.SketchBook ~= nil then
                            models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.SketchBook:moveTo(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom)
                        end
                        models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.SketchBook.SketchBookCanvas:setUVPixels()
                        self.parent.exSkillSpriteManager:removeAll()
                        if host:isHost() then
                            models.models.ex_skill_1.FlowerEffectArea3.ScreenFrame:setVisible(false)
                            if forcedStop then
                                events.RENDER:remove("ex_skill_1_render")
                                models.models.ex_skill_1.FlowerEffectArea3.Transition:setVisible(false)
                            end
                        end
                    end
                };

                ---このExスキルの初期化処理が行われたかどうか。
                ---@type boolean
                init = false;
            };

            {
                name = {
                    en_us = "Happy Patrolling with Iroha!";
                    ja_jp = "イロハ先輩とパトロール！";
                };

                formationType = "STRIKER";

                models = {models.models.ex_skill_2.Tank, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.SpyGlassAnchor, models.models.main.Avatar.Head.FlowerEffectArea1.NoticeEffects2};

                animations = {"main", "ex_skill_1", "ex_skill_2"};

                camera = {
                    start = {
                        rot = vectors.vec3(0, -140, 0);
                        pos = vectors.vec3(-28, 64, 260);
                    };

                    fin = {
                        rot = vectors.vec3(-15, -150, 0);
                        pos = vectors.vec3(-30, 41, -1214.23);
                    };
                };

                callbacks = {
                    onPreAnimation = function (self)
                        if not self.exSkill[2].init then
                            for _, modelPart in ipairs({models.models.ex_skill_2.Tank.TankBody.PSLogo1, models.models.ex_skill_2.Tank.TankBody.Turret.PSLogo2, models.models.ex_skill_2.Tank.TankBody.Turret.PSLogo3}) do
                                modelPart:newText("toramaru_logo_text"):setText("§e万魔殿"):setPos(0, 2.25, 0):setScale(0.2):setAlignment("CENTER"):setOutline(true):setOutlineColor(0.404, 0.306, 0.051)
                            end
                            models.models.ex_skill_2.Tank.TankBody.Turret.Cannon.HangingSign:setPrimaryTexture("RESOURCE", "minecraft:textures/entity/signs/hanging/oak.png")
                            models.models.ex_skill_2.Tank.TankBody.Turret.Cannon.HangingSign:newText("toramaru_sign_text_1"):setText("§0§l巡回中"):setPos(-1, -9, 0.5):setRot(0, 90, 0):setScale(0.5):setAlignment("CENTER")
                            models.models.ex_skill_2.Tank.TankBody.Turret.Cannon.HangingSign:newText("toramaru_sign_text_2"):setText("§0§l巡回中"):setPos(1, -9, -0.5):setRot(0, -90, 0):setScale(0.5):setAlignment("CENTER")
                            for i = 0, 1 do
                                for j = 0, 9 do
                                    models.models.ex_skill_2.Tank.TankBody.BaseBase1:newBlock("toramaru_log_"..(i * 10 + j)):setBlock(self.parent.compatibilityUtils:checkBlock("minecraft:oak_log").."[axis=z]"):setPos(36 + i * -80, -2, j * 8 - 41):setScale(0.5)
                                end
                            end
                            models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.SpyGlassAnchor:newItem("ex_skill_2_spyglass"):setItem(self.parent.compatibilityUtils:checkItem("minecraft:spyglass"))
                            self.exSkill[2].init = true
                        end
                        events.RENDER:register(function ()
                            models.models.main.Avatar:setPos(models.models.ex_skill_2.Tank.TankBody:getAnimPos())
                            if host:isHost() then
                                models.models.ex_skill_1.FlowerEffectArea3.ScreenFrame:setOpacity(models.models.ex_skill_1.FlowerEffectArea3.TransitionOpacity:getAnimScale().x)
                            end
                        end, "ex_skill_2_render")
                        self.parent.faceParts:setEmotion("NORMAL", "UNEQUAL", "W", 30, true)
                    end;

                    onAnimationTick = function (self, tick)
                        if tick == 30 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "O", 20, true)
                        elseif tick == 31 or tick == 36 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.experience_orb.pickup"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 0.5, 1.5)
                        elseif tick == 43 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.spyglass.use"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 1, 1)
                        elseif tick == 50 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "O", 2, true)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 0.5, 2)
                        elseif tick == 52 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "O", 2, true)
                        elseif tick == 54 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "O", 2, true)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 0.5, 2)
                        elseif tick == 56 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "O", 20, true)
                        elseif tick == 59 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.iron_trapdoor.open"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Tank.TankBody.Turret.Hatch1), 1, 0.5)
                        elseif tick == 63 then
                            models.models.ex_skill_2.Tank.TankBody.Turret.Iroha:setVisible(true)
                        elseif tick == 72 then
                            models.models.ex_skill_2.Tank.TankBody.Turret.Iroha.IrohaHead.IrohaFaceParts.IrohaEyes.IrohaEyeRight:setUVPixels(6, 0)
                            models.models.ex_skill_2.Tank.TankBody.Turret.Iroha.IrohaHead.IrohaFaceParts.IrohaEyes.IrohaEyeLeft:setUVPixels(12, 0)
                        elseif tick == 74 then
                            models.models.ex_skill_2.Tank.TankBody.Turret.Iroha.IrohaHead.IrohaFaceParts.IrohaEyes.IrohaEyeRight:setUVPixels(0, 0)
                            models.models.ex_skill_2.Tank.TankBody.Turret.Iroha.IrohaHead.IrohaFaceParts.IrohaEyes.IrohaEyeLeft:setUVPixels(18, 0)
                            models.models.ex_skill_2.Tank.TankBody.Turret.Iroha.IrohaHead.IrohaFaceParts.IrohaMouth:setUVPixels(16, 0)
                        elseif tick == 76 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "OPENED", 1, true)
                        elseif tick == 77 then
                            self.parent.faceParts:setEmotion("NORMAL", "INVERTED", "OPENED", 26, true)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.experience_orb.pickup"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 0.5, 2)
                        elseif tick == 97 then
                            models.models.ex_skill_2.Tank.TankBody.Turret.Iroha.IrohaHead.IrohaFaceParts.IrohaEyes.IrohaEyeRight:setUVPixels(0, 0)
                            models.models.ex_skill_2.Tank.TankBody.Turret.Iroha.IrohaHead.IrohaFaceParts.IrohaEyes.IrohaEyeLeft:setUVPixels(18, 0)
                            models.models.ex_skill_2.Tank.TankBody.Turret.Iroha.IrohaHead.IrohaFaceParts.IrohaMouth:setUVPixels(32, 0)
                        elseif tick == 103 then
                            if host:isHost() then
                                local windowSize = client:getScaledWindowSize()
                                self.parent.exSkillSpriteManager:spawn(models.models.ex_skill_1.FlowerEffectArea3, 1, vectors.vec3(-60, -40, 1), vectors.vec3(), -60, 60, models.models.ex_skill_1.FlowerEffectArea3.FlowerEffectArea3Scale, 51, false, 1)
                                self.parent.exSkillSpriteManager:spawn(models.models.ex_skill_1.FlowerEffectArea3, 1, vectors.vec3(-30, -90, 1), vectors.vec3(), -60, 30, models.models.ex_skill_1.FlowerEffectArea3.FlowerEffectArea3Scale, 51, false, 1)
                                self.parent.exSkillSpriteManager:spawn(models.models.ex_skill_1.FlowerEffectArea3, 1, vectors.vec3(-50, windowSize.y * -1 + 30, 1), vectors.vec3(), -60, 40, models.models.ex_skill_1.FlowerEffectArea3.FlowerEffectArea3Scale, 51, false, 1)
                                self.parent.exSkillSpriteManager:spawn(models.models.ex_skill_1.FlowerEffectArea3, 1, vectors.vec3(windowSize.x * -0.5, -30, 1), vectors.vec3(), -60, 30, models.models.ex_skill_1.FlowerEffectArea3.FlowerEffectArea3Scale, 51, false, 1)
                                self.parent.exSkillSpriteManager:spawn(models.models.ex_skill_1.FlowerEffectArea3, 3, vectors.vec3(windowSize.x * -1 + 70, -50, 1), vectors.vec3(), -60, 40, models.models.ex_skill_1.FlowerEffectArea3.FlowerEffectArea3Scale, 51, false, 1)
                                self.parent.exSkillSpriteManager:spawn(models.models.ex_skill_1.FlowerEffectArea3, 3, vectors.vec3(windowSize.x * -1 + 40, windowSize.y * -1 + 60, 1), vectors.vec3(), -60, 50, models.models.ex_skill_1.FlowerEffectArea3.FlowerEffectArea3Scale, 51, false, 1)
                                models.models.ex_skill_1.FlowerEffectArea3.ScreenFrame:setScale(client:getScaledWindowSize():augmented(0))
                                models.models.ex_skill_1.FlowerEffectArea3.ScreenFrame:setColor(1, 1, 0.7258)
                                models.models.ex_skill_1.FlowerEffectArea3.ScreenFrame:setVisible(true)
                            end
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "W", 40, true)
                        elseif tick == 143 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "OPENED_SMALL", 10, true)
                        elseif tick == 144 then
                            models.models.ex_skill_2.Tank.TankBody.Turret.Iroha.IrohaHead.IrohaFaceParts.IrohaEyes.IrohaEyeRight:setUVPixels(6, 0)
                            models.models.ex_skill_2.Tank.TankBody.Turret.Iroha.IrohaHead.IrohaFaceParts.IrohaEyes.IrohaEyeLeft:setUVPixels(12, 0)
                        elseif tick == 146 then
                            models.models.ex_skill_2.Tank.TankBody.Turret.Iroha.IrohaHead.IrohaFaceParts.IrohaEyes.IrohaEyeRight:setUVPixels(18, 0)
                            models.models.ex_skill_2.Tank.TankBody.Turret.Iroha.IrohaHead.IrohaFaceParts.IrohaEyes.IrohaEyeLeft:setUVPixels(0, 0)
                            models.models.ex_skill_2.Tank.TankBody.Turret.Iroha.IrohaHead.IrohaFaceParts.IrohaMouth:setUVPixels(48, 0)
                        elseif tick == 153 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "OPENED_SMALL", 1, true)
                        elseif tick == 154 then
                            self.parent.faceParts:setEmotion("UNEQUAL", "UNEQUAL", "OPENED", 54, true)
                        elseif tick == 160 then
                            models.models.ex_skill_1.FlowerEffectArea3.ScreenFrame:setVisible(false)
                        elseif tick == 161 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 1, 1.5):setAttenuation(2)
                        end

                        if tick < 27 then
                            local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Tank)
                            for _ = 1, 5 do
                                local offsetPos = vectors.vec3(math.random() * 7 - 3.5, 0, math.random() * 7 - 3.5)
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:campfire_cosy_smoke"), anchorPos:copy():add(offsetPos)):setScale(5):setVelocity(offsetPos:copy():scale(0.01):add(0, 0.025, 0))
                            end
                            if tick % 7 == 0 then
                                self.parent.exSkillSpriteManager:spawn(models.models.main.Avatar.Head.FlowerEffectArea1, 4, vectors.rotateAroundAxis(math.random() * -210 + 15, -12, 0, 0, 0, 0, 1), vectors.vec3(), 0, 6, nil, 14, false, 1)
                            end
                        elseif tick >= 154 then
                            local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Tank)
                            local bodyYaw = player:getBodyYaw()
                            for _ = 1, 5 do
                                local offsetPos = vectors.vec3(math.random() * 7 - 3.5, math.random() * 2, math.random() * 7 - 3.5)
                                local velocity = vectors.rotateAroundAxis(bodyYaw * -1, offsetPos.x / -35, 0.025 + offsetPos.y * 0.1, 0, 0, 1, 0)
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:campfire_cosy_smoke"), anchorPos:copy():add(offsetPos)):setScale(5):setVelocity(offsetPos:copy():scale(0.01):add(velocity))
                            end
                            if tick % 2 == 0 then
                                local anchorPos2 = vectors.rotateAroundAxis(bodyYaw * -1, 0, 48, -20, 0, 1, 0):add(self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Tank):scale(16))
                                local xOffset = math.random() * 48 - 24
                                local offsetPos = vectors.rotateAroundAxis(bodyYaw * -1, xOffset, math.random() * 16, 0, 0, 1, 0)
                                self.parent.exSkillSpriteManager:spawn(models.models.ex_skill_1.FlowerEffectArea2, math.random() >= 0.5 and 1 or 3, anchorPos2:copy():add(offsetPos), vectors.rotateAroundAxis(bodyYaw * -1, xOffset, 16 + math.random() * 16, 350, 0, 1, 0), math.random() >= 0.5 and 90 or -90, 8, nil, 200, true, 1)
                                local soundPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Tank)
                                local pitch = 0.2 + (tick - 154) / 370
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.piston.extend"), soundPos, 0.5, pitch)
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.piston.contract"), soundPos, 0.5, pitch)
                            end
                        end

                        if tick < 16 and tick % 2 == 0 then
                            local soundPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Tank)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.piston.extend"), soundPos, 0.25, 0.2)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.piston.contract"), soundPos, 0.25, 0.2)
                        end

                        if tick >= 104 and tick < 141 and (tick - 104) % 10 == 0 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.item.pickup"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 1, 1.5)
                        end
                    end;

                    onPostAnimation = function (self, forcedStop)
                        events.RENDER:remove("ex_skill_2_render")
                        models.models.main.Avatar:setPos()
                        models.models.ex_skill_2.Tank.TankBody.Turret.Iroha:setVisible(false)
                        self.parent.exSkillSpriteManager:removeAll()
                        if host:isHost() then
                            models.models.ex_skill_1.FlowerEffectArea3.ScreenFrame:setColor()
                            if forcedStop then
                                models.models.ex_skill_1.FlowerEffectArea3.ScreenFrame:setVisible(false)
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
                    subExSkill = 2;

                    ---戦車に乗っているかどうか
                    ---@type boolean
                    isRidingTank = false;

                    ---前ティックに戦車に乗っていたかどうか
                    ---@type boolean
                    isRidingTankPrev = false;

                    ---前ティックに戦車のエンジンが起動していたかどうか
                    ---@type boolean
                    isEngineActivePrev = false;

                    ---戦車に乗っているときのティックカウンター
                    ---@type integer
                    tankTick = 0;

                    ---砲弾を撃つ際のティックカウンター
                    ---@type integer
                    shootTick = -1;

                    ---前ティックに虎丸が爆散したかどうか
                    ---@type boolean
                    isTankDiedPrev = false;
                };
            };

            callbacks = {
                onArmorChange = function (self, parts, isVisible)
                    if parts == "HELMET" then
                        if isVisible then
                            models.models.main.Avatar.Head.Hat:setVisible(false)
                            models.models.main.Avatar.Head.Horns:setVisible(true)
                        else
                            models.models.main.Avatar.Head.Hat:setVisible(true)
                            models.models.main.Avatar.Head.Horns:setVisible(false)
                        end
                    elseif parts == "CHEST_PLATE" then
                        models.models.main.Avatar.UpperBody.Body.BearPouch:setVisible(not isVisible)
                    end
                end;
            };
        }

        instance.bubble = {
            callbacks = {
                onPlay = function (self, type, duration, showInGui)
                    if type == "GOOD" then
                        self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "OPENED", duration, true)
                    elseif type == "HEART" then
                        self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "W", duration, true)
                    elseif type == "NOTE" then
                        self.parent.faceParts:setEmotion("UNEQUAL", "UNEQUAL", "OPENED", duration, true)
                    elseif type == "QUESTION" then
                        self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "ANXIOUS", duration, true)
                    elseif type == "SWEAT" then
                        if showInGui then
                            self.parent.faceParts:setEmotion("UNEQUAL", "UNEQUAL", "SHOCK", duration, true)
                        else
                            self.parent.faceParts:setEmotion("UNEQUAL", "UNEQUAL", "SHOCK", 60, true)
                        end
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
                onBeforeModelCopy = function ()
                    models.models.main.Avatar:setVisible(true)
                    models.models.main.Avatar:setPos()
                    for _, modelPart in ipairs({models.models.main.Avatar, models.models.main.Avatar.Head, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeve, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftSleeve}) do
                        modelPart:setRot()
                    end
                    models.models.main.Avatar.LowerBody:setVisible(true)
                end;

                onPhase1 = function (_, dummyAvatar)
                    dummyAvatar.Head.HairTail:setRot(30, 0, 0)
                end;

                onPhase2 = function (_, dummyAvatar)
                    dummyAvatar.Head.HairTail:setRot(-15, 0, 0)
                    dummyAvatar.UpperBody.Body.BearPouch.SecurityAlarm:setRot(-7.5, 0, -10)
                    dummyAvatar.LowerBody.Legs.RightLeg.RightLegBottom:setOffsetPivot(0, 0, -2)
                end
            };
        }

        instance.actionWheel = {
            isVehicleOptionEnabled = false;
        }

        instance.physics = {
            physicData = {
                {
                    models = {models.models.main.Avatar.Head.HairTail};

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
                    models = {models.models.main.Avatar.Head.HairTail.HairTail};

                    z = {
                        vertical = {
                            min = -60;
                            neutral = 0;
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
                    models = {models.models.main.Avatar.UpperBody.Body.BearPouch.SecurityAlarm},

                    x = {
                        vertical = {
                            min = 0;
                            neutral = 0;
                            max = 170;
                            sneakOffset = 30;

                            bodyX = {
                                multiplayer = -80;
                                min = 0;
                                max = 170;
                            };

                            bodyY = {
                                multiplayer = -80;
                                min = 0;
                                max = 170;
                            };

                            bodyRot = {
                                multiplayer = -0.05;
                                min = 0;
                                max = 170;
                            };
                        };
                    };
                };

                {
                    models =  {models.models.main.Avatar.UpperBody.Body.BearPouch.SecurityAlarm.SecurityAlarmZPivot},

                    z = {
                        vertical = {
                            min = -90;
                            neutral = 0;
                            max = 90;

                            headZ = {
                                multiplayer = -80;
                                min = -90;
                                max = 90;
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

        events.TICK:register(function ()
            if not client:isPaused() then
                local vehicle = player:getVehicle()
                self.costume.costumes[1].isRidingTank = false
                if vehicle ~= nil then
                    local passengers = vehicle:getPassengers()
                    self.costume.costumes[1].isRidingTank = vehicle:getType() == "minecraft:camel" and passengers[1]:hasAvatar() and world.avatarVars()[passengers[1]:getUUID()].FBAC_Iroha ~= nil
                end
                if self.costume.costumes[1].isRidingTank ~= self.costume.costumes[1].isRidingTankPrev then
                    if self.costume.costumes[1].isRidingTank then
                        self.parent.arms:setArmState(0, 0)
                        self.parent.faceParts:setEmotion("UNEQUAL", "UNEQUAL", "OPENED", 21, true)
                        animations["models.main"].tank_start:play()

                        events.TICK:register(function ()
                            if not client:isPaused() and self.costume.costumes[1].isRidingTank then
                                if self.parent.faceParts.blinkCount == 0 and self.parent.faceParts.emotionCount == 0 and self.costume.costumes[1].shootTick == -1 and not self.costume.costumes[1].isTankDied then
                                    self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "W", 2, true)
                                else
                                    self.parent.faceParts:setEmotion("NORMAL", "INVERTED", "W", 1)
                                end
                                local irohaUUID = vehicle:getPassengers()[1]:getUUID()
                                local avatarVars = world.avatarVars()
                                local isEngineActive = avatarVars[irohaUUID].isEngineActive and self.costume.costumes[1].tankTick >= 1
                                if isEngineActive ~= self.costume.costumes[1].isEngineActivePrev then
                                    if isEngineActive then
                                        animations["models.main"].tank_idle_powered:play()
                                        animations["models.main"].tank_idle_powered:setTime(avatarVars[irohaUUID].engineAnimTime + 0.05)
                                    else
                                        animations["models.main"].tank_idle_powered:stop()
                                    end
                                end
                                if self.costume.costumes[1].tankTick == 1 then
                                    for i = 0, 6 do
                                        self.parent.exSkillSpriteManager:spawn(models.models.main.Avatar.Head.FlowerEffectArea1, 4, vectors.vec3(), vectors.rotateAroundAxis(i * -30, -100, 0, 0, 0, 0, 1), 0, 6, nil, 14, false, 0.7)
                                    end
                                    sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), player:getPos(), 0.5, 1.5)
                                elseif self.costume.costumes[1].tankTick == 21 then
                                    models.models.main.Avatar.Head:setRot(0, 65, 0)
                                    if self.parent.gun.currentGunPosition == "RIGHT" then
                                        self.parent.arms:setArmState(5, 6)
                                    elseif self.parent.gun.currentGunPosition == "LEFT" then
                                        self.parent.arms:setArmState(6, 5)
                                    else
                                        self.parent.arms:setArmState(4, 4)
                                    end
                                end
                                if avatarVars[irohaUUID].shootingStart then
                                    animations["models.main"].tank_shoot:play()
                                    self.parent.arms:setArmState(0, 0)
                                    self.parent.faceParts:setEmotion("UNEQUAL", "UNEQUAL", "OPENED", 36, true)
                                    self.costume.costumes[1].shootTick = 0
                                elseif self.costume.costumes[1].shootTick == 36 then
                                    if self.parent.gun.currentGunPosition == "RIGHT" then
                                        self.parent.arms:setArmState(5, 6)
                                    elseif self.parent.gun.currentGunPosition == "LEFT" then
                                        self.parent.arms:setArmState(6, 5)
                                    else
                                        self.parent.arms:setArmState(4, 4)
                                    end
                                    self.costume.costumes[1].shootTick = -1
                                end
                                local isTankDied = avatarVars[irohaUUID].isTankDied
                                if isTankDied and not self.costume.costumes[1].isTankDiedPrev then
                                    self.parent.bubble:play("SWEAT", 20, vectors.vec2(), 40, false)
                                end
                                self.costume.costumes[1].tankTick = self.costume.costumes[1].tankTick + 1
                                self.costume.costumes[1].isEngineActivePrev = isEngineActive
                                self.costume.costumes[1].shootTick = self.costume.costumes[1].shootTick >= 0 and self.costume.costumes[1].shootTick + 1 or -1
                                self.costume.costumes[1].isTankDiedPrev = isTankDied
                            end
                        end, "tank_tick")

                        events.RENDER:register(function (delta, context)
                            if not client:isPaused() and self.costume.costumes[1].isRidingTank then
                                local bodyYaw = player:getBodyYaw(delta)
                                local heightOffset = (player:getPos(delta):sub(vehicle:getPos(delta)):length() - 1.51017) * -1.35 - 0.1
                                if context == "MINECRAFT_GUI" or context == "FIGURA_GUI" or context == "PAPERDOLL" or context == "FIRST_PERSON" then
                                    models.models.main.Avatar:setParentType("None")
                                    models.models.main.Avatar:setPos()
                                    models.models.main.Avatar:setRot()
                                    models.models.main.Avatar.LowerBody:setVisible(true)
                                else
                                    models.models.main.Avatar:setParentType("WORLD")
                                    models.models.main.Avatar:setPos(vectors.rotateAroundAxis(bodyYaw * -1, -0.85, 0.7 + heightOffset, 1.1, 0, 1, 0):add(player:getPos(delta)):scale(16))
                                    models.models.main.Avatar:setRot(0, bodyYaw * -1 + 90, 0)
                                    models.models.main.Avatar.LowerBody:setVisible(false)
                                end
                                if renderer:isFirstPerson() then
                                    self.parent.cameraManager.setCameraPivot(vectors.rotateAroundAxis(bodyYaw * -1, -0.85, 0.675 + heightOffset, 1.1, 0, 1, 0))
                                    renderer:setEyeOffset(vectors.rotateAroundAxis(bodyYaw * -1, -0.85, 1 + heightOffset, 1.1, 0, 1, 0))
                                else
                                    self.parent.cameraManager.setCameraPivot(vectors.rotateAroundAxis(bodyYaw * -1, -0.85, 0.5 + heightOffset, 1.1, 0, 1, 0))
                                    renderer:setEyeOffset(vectors.rotateAroundAxis(bodyYaw * -1, -0.85, 1, 1.1 + heightOffset, 0, 1, 0))
                                end
                                if self.costume.costumes[1].shootTick >= 0 then
                                    models.models.main.Avatar:setPos(vectors.rotateAroundAxis(bodyYaw * -1 + 180, models.models.main.TankShootAnimAnchor:getAnimPos(), 0, 1, 0):add(models.models.main.Avatar:getPos()))
                                end
                            end
                        end, "tank_render")
                    else
                        events.TICK:remove("tank_tick")
                        events.RENDER:remove("tank_render")
                        models.models.main.Avatar:setVisible(true)
                        models.models.main.Avatar:setParentType("None")
                        models.models.main.Avatar:setPos()
                        for _, modelPart in ipairs({models.models.main.Avatar, models.models.main.Avatar.Head}) do
                            modelPart:setRot()
                        end
                        models.models.main.Avatar.LowerBody:setVisible(true)
                        for _, animName in ipairs({"tank_start", "tank_idle_powered"}) do
                            animations["models.main"][animName]:stop()
                        end
                        self.parent.cameraManager.setCameraPivot()
                        renderer:setEyeOffset()
                        if self.parent.gun.currentGunPosition == "RIGHT" then
                            self.parent.arms:setArmState(1, 2)
                        elseif self.parent.gun.currentGunPosition == "LEFT" then
                            self.parent.arms:setArmState(2, 1)
                        else
                            self.parent.arms:setArmState(0, 0)
                        end
                        self.costume.costumes[1].tankTick = 0
                        self.costume.costumes[1].shootTick = -1
                        self.costume.costumes[1].isTankDiedPrev = false
                    end
                end
                self.costume.costumes[1].isRidingTankPrev = self.costume.costumes[1].isRidingTank
            end
        end)

        events.RENDER:register(function (_, context)
            if context == "FIRST_PERSON" then
                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeve:setRot(0, 0, -60)
                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeve:setOffsetPivot(1.5, 0, 0)
                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftSleeve:setRot(0, 0, 60)
                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftSleeve:setOffsetPivot(-1.5, 0, 0)
            elseif self.parent.exSkill.animationCount == -1 then
                local isInTank = self.costume.costumes[1].isRidingTank and self.costume.costumes[1].tankTick >= 21
                local rightArmRot = math.clamp(((models.models.main.Avatar.UpperBody.Arms.RightArm:getParentType() == "RightArm" and not (context == "PAPERDOLL" and self.parent.gun.currentGunPosition ~= "NONE")) and vanilla_model.RIGHT_ARM:getOriginRot().x or 0) + models.models.main.Avatar.UpperBody.Arms.RightArm:getTrueRot().x, -60, isInTank and 20 or 60)
                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeve:setRot(rightArmRot * -1, 0, 0)
                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeve:setOffsetPivot(0, 0, rightArmRot < 0 and 4 or 0)
                local leftArmRot = math.clamp(((models.models.main.Avatar.UpperBody.Arms.LeftArm:getParentType() == "LeftArm" and not (context == "PAPERDOLL" and self.parent.gun.currentGunPosition ~= "NONE")) and vanilla_model.LEFT_ARM:getOriginRot().x or 0) + models.models.main.Avatar.UpperBody.Arms.LeftArm:getTrueRot().x, -60, isInTank and 20 or 60)
                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftSleeve:setRot(leftArmRot * -1, 0, 0)
                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftSleeve:setOffsetPivot(0, 0, leftArmRot < 0 and 4 or 0)
            else
                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeve:setRot()
                models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeve:setOffsetPivot(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.RightSleeve:getAnimRot().x >= 0 and 4 or 0)
                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftSleeve:setRot()
                models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftSleeve:setOffsetPivot(models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.LeftSleeve:getAnimRot().x >= 0 and 4 or 0)
            end

            local wingRotOffset = math.map(vanilla_model.RIGHT_LEG:getOriginRot().x, -90, 90, 20, 0)
            models.models.main.Avatar.UpperBody.Body.Wings.RightWing:setRot(0, -20 - wingRotOffset, 0)
            models.models.main.Avatar.UpperBody.Body.Wings.LeftWing:setRot(0, 20 + wingRotOffset, 0)
        end)

        avatar:store("FBAC_Ibuki", true)
    end;
}