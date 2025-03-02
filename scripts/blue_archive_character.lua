---@alias BlueArchiveCharacter.RightEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "ANGRY" # 怒った目
---| "CLOSED2" # 閉じた目2
---| "INVERTED" # 反対側を見る目
---| "ANGRY_INVERTED" # 怒りつつ反対側を見る目
---| "NARROW" # 半閉じ目

---@alias BlueArchiveCharacter.LeftEyeTextures
---| "NORMAL" # 通常
---| "SURPRISED" # 驚いた目（ダメージを受けたときなど）
---| "TIRED" # 疲れた目（死亡アニメーションなど）
---| "CLOSED" # 閉じた目（瞬き、睡眠中など）
---| "INVERTED" # 反対側を見る目
---| "ANGRY" # 怒った目
---| "ANGRY_CENTER" # 怒りつつ少し反対側を見る目
---| "ANGRY_INVERTED" # 怒りつつ反対側を見る目
---| "CLOSED2" # 閉じた目2
---| "NARROW" # 半閉じ目

---@alias BlueArchiveCharacter.MouthTextures
---| "NORMAL" # 通常
---| "OPENED" # 開いた口
---| "CLOSED" # 閉じた口
---| "W" # ω
---| "YAWN" あくび
---| "OUT_OF_BREATH" # 息切れ口
---| "TEETH" 食いしばる口
---| "SAD" # への口

---@alias BlueArchiveCharacter.GunPutType
---| "BODY" # アバターのBodyに銃を移動させる
---| "HIDDEN" # 銃を隠す

---@alias BlueArchiveCharacter.FormationType
---| "STRIKER" # ストライカー（前衛）
---| "SPECIAL" # スペシャル（後方支援）

---@alias BlueArchiveCharacter.Costumes
---| "DEFAULT" # デフォルト衣装
---| "MASKED" # 覆面水着団
---| "SWIMSUIT" # 水着
---| "BATTLE" # 臨戦

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
                en_us = "Hoshino";
                ja_jp = "ホシノ";
            };

            lastName = {
                en_us = "Takanashi";
                ja_jp = "小鳥遊";
            };

            clubName = {
                en_us = "Countermeasure Council";
                ja_jp = "対策委員会";
            };

            birth = {
                month = 1;
                day = 2;
            };
        }

        instance.faceParts = {
            rightEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(2, 0); --必須
                TIRED = vectors.vec2(4, 0); --必須
                CLOSED = vectors.vec2(6, 0); --必須
                ANGRY = vectors.vec2(7, 0);
                CLOSED2 = vectors.vec2(0, 1);
                INVERTED = vectors.vec2(1, 1);
                ANGRY_INVERTED = vectors.vec2(2, 1);
                NARROW = vectors.vec2(4, 1);
            };

            leftEye = {
                NORMAL = vectors.vec2(0, 0); --必須
                SURPRISED = vectors.vec2(2, 0); --必須
                TIRED = vectors.vec2(4, 0); --必須
                CLOSED = vectors.vec2(5, 0); --必須
                ANGRY = vectors.vec2(7, 0);
                ANGRY_CENTER = vectors.vec2(8, 0);
                ANGRY_INVERTED = vectors.vec2(2, 1);
                CLOSED2 = vectors.vec2(-1, 1);
                NARROW = vectors.vec2(4, 1);
                INVERTED = vectors.vec2(5, 1);
            };

            mouth = {
                CLOSED = vectors.vec2(1, 0);
                W = vectors.vec2(2, 0);
                YAWN = vectors.vec2(3, 0);
                OPENED = vectors.vec2(0, 0);
                OUT_OF_BREATH = vectors.vec2(0, 1);
                TEETH = vectors.vec2(1, 1);
                SAD = vectors.vec2(2, 1);
            };

            emotionSet = {
                onSleep = {
                    rightEye = "CLOSED";
                    leftEye = "CLOSED";
                    mouth = "YAWN";
                };
            };
        }

        instance.arms = {
            callbacks = {
                onArmStateChanged = function (self, right, left)
                    if self.parent.whaleFloat ~= nil then
                        if right == 0 and left == 0 and self.parent.whaleFloat.whaleFloatEnabled and not self.parent.whaleFloat.isAfk then
                            return {right = 5, left = 5}
                        elseif right == 1 and left == 2 then
                            local isLeftHanded = player:isLeftHanded()
                            if (player:getHeldItem(true).id == "minecraft:shield" and not isLeftHanded) or (player:getHeldItem().id == "minecraft:shield" and isLeftHanded) then
                                return {right = 1, left = 4}
                            elseif self.parent.whaleFloat.isAfk then
                                return {right = 0, left = 0}
                            end
                        elseif right == 2 and left == 1 then
                            local isLeftHanded = player:isLeftHanded()
                            if (player:getHeldItem().id == "minecraft:shield" and not isLeftHanded) or (player:getHeldItem(true).id == "minecraft:shield" and isLeftHanded) then
                                return {right = 4, left = 1}
                            elseif self.parent.whaleFloat.isAfk then
                                return {right = 0, left = 0}
                            end
                        end
                    end
                end;

                onAdditionalRightArmProcess = function (self, state)
                    if state == 1 then
                        events.RENDER:register(function ()
                            if self.parent.whaleFloat ~= nil and self.parent.whaleFloat.whaleFloatEnabled then
                                models.models.main.Avatar.UpperBody.Arms.RightArm:setRot(models.models.main.Avatar.UpperBody.Arms.RightArm:getRot():add(10, 0, 0))
                            end
                        end, "right_arm_render")
                    elseif state == 2 then
                        events.TICK:remove("right_arm_tick")
                        events.TICK:register(function ()
                            local isLeftHanded = player:isLeftHanded()
                            if ((player:getHeldItem().id == "minecraft:shield" and not isLeftHanded) or (player:getHeldItem(true).id == "minecraft:shield" and isLeftHanded)) and self.parent.arms.armState.right == 2 then
                                self.parent.arms:setArmState(4, nil)
                            elseif self.parent.subGun.hasSubGun then
                                self.parent.arms:setArmState(1, 1)
                            end
                        end, "right_arm_tick")
                        events.RENDER:register(function ()
                            if self.parent.whaleFloat ~= nil and self.parent.whaleFloat.whaleFloatEnabled then
                                models.models.main.Avatar.UpperBody.Arms.RightArm:setRot(models.models.main.Avatar.UpperBody.Arms.RightArm:getRot():add(10, 0, 0))
                            end
                        end, "right_arm_render")
                    elseif state == 4 then
                        events.TICK:remove("right_arm_tick")
                        events.TICK:register(function ()
                            self.parent.arms:processArmSwingCount()
                            local isLeftHanded = player:isLeftHanded()
                            if ((player:getHeldItem().id ~= "minecraft:shield" and not isLeftHanded) or (player:getHeldItem(true).id ~= "minecraft:shield" and isLeftHanded)) and self.parent.arms.armState.right == 4 then
                                self.parent.arms:setArmState(2, nil)
                            end
                        end, "right_arm_tick")
                        events.RENDER:remove("right_arm_render")
                        events.RENDER:register(function (delta, context)
                            local isSwingingArm = player:isSwingingArm() and not player:isLeftHanded()
                            models.models.main.Avatar.UpperBody.Arms.RightArm:setParentType((isSwingingArm or context == "FIRST_PERSON") and "RightArm" or "Body")
                            models.models.main.Avatar.UpperBody.Arms.RightArm:setRot(isSwingingArm and vectors.vec3() or vectors.vec3(math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * 2.5 + 40, 30, 0))
                        end, "right_arm_render")
                    elseif state == 5 then
                        events.TICK:remove("right_arm_tick")
                        events.TICK:register(function ()
                            if self.parent.arms.armState.left == 5 then
                                local activeHand = player:getActiveHand()
                                local isLeftHanded = player:isLeftHanded()
                                models.models.main.Avatar.UpperBody.Arms.RightArm:setRot(player:getActiveItem().id ~= "minecraft:air" and ((activeHand == "MAIN_HAND" and not isLeftHanded) or (activeHand == "OFF_HAND" and isLeftHanded)) and vectors.vec3() or vectors.vec3(20, 0, 20))
                            end
                        end, "right_arm_tick")
                    end
                end;

                onAdditionalLeftArmProcess = function (self, state)
                    if state == 1 then
                        events.RENDER:register(function ()
                            if self.parent.whaleFloat ~= nil and self.parent.whaleFloat.whaleFloatEnabled then
                                models.models.main.Avatar.UpperBody.Arms.LeftArm:setRot(models.models.main.Avatar.UpperBody.Arms.LeftArm:getRot():add(10, 0, 0))
                            end
                        end, "left_arm_render")
                    elseif state == 2 then
                        events.TICK:remove("left_arm_tick")
                        events.TICK:register(function ()
                            local isLeftHanded = player:isLeftHanded()
                            if ((player:getHeldItem().id == "minecraft:shield" and isLeftHanded) or (player:getHeldItem(true).id == "minecraft:shield" and not isLeftHanded)) and self.parent.arms.armState.left == 2 then
                                self.parent.arms:setArmState(nil, 4)
                            elseif self.parent.subGun.hasSubGun then
                                self.parent.arms:setArmState(1, 1)
                            end
                        end, "left_arm_tick")
                        events.RENDER:register(function ()
                            if self.parent.whaleFloat ~= nil and self.parent.whaleFloat.whaleFloatEnabled then
                                models.models.main.Avatar.UpperBody.Arms.LeftArm:setRot(models.models.main.Avatar.UpperBody.Arms.LeftArm:getRot():add(10, 0, 0))
                            end
                        end, "left_arm_render")
                    elseif state == 4 then
                        events.TICK:remove("left_arm_tick")
                        events.TICK:register(function ()
                            self.parent.arms:processArmSwingCount()
                            local isLeftHanded = player:isLeftHanded()
                            if ((player:getHeldItem().id ~= "minecraft:shield" and isLeftHanded) or (player:getHeldItem(true).id ~= "minecraft:shield" and not isLeftHanded)) and self.parent.arms.armState.left == 4 then
                                self.parent.arms:setArmState(nil, 2)
                            end
                        end, "left_arm_tick")
                        events.RENDER:remove("left_arm_render")
                        events.RENDER:register(function (delta, context)
                            local isSwingingArm = player:isSwingingArm() and player:isLeftHanded()
                            models.models.main.Avatar.UpperBody.Arms.LeftArm:setParentType((isSwingingArm or context == "FIRST_PERSON") and "LeftArm" or "Body")
                            models.models.main.Avatar.UpperBody.Arms.LeftArm:setRot(isSwingingArm and vectors.vec3() or vectors.vec3(math.sin((self.parent.arms.swingCount + delta) / 100 * math.pi * 2) * -2.5 + 40, -30, 0))
                        end, "left_arm_render")
                    elseif state == 5 then
                        events.TICK:remove("left_arm_tick")
                        events.TICK:register(function ()
                            if self.parent.arms.armState.left == 5 then
                                local activeHand = player:getActiveHand()
                                local isLeftHanded = player:isLeftHanded()
                                models.models.main.Avatar.UpperBody.Arms.LeftArm:setRot(player:getActiveItem().id ~= "minecraft:air" and ((activeHand == "OFF_HAND" and not isLeftHanded) or (activeHand == "MAIN_HAND" and isLeftHanded)) and vectors.vec3() or vectors.vec3(20, 0, -20))
                            end
                        end, "left_arm_tick")
                    end
                end
            };
        }

        instance.skirt = {
            skirtModels = {models.models.main.Avatar.UpperBody.Body.Skirt};
        }

        instance.gun = {
            scale = 1.3;

            gunPosition = {
                hold = {
                    firstPersonPos = {
                        right = vectors.vec3(-1, 0, -8);
                        left = vectors.vec3(1, 0, -8);
                    };

                    thirdPersonPos = {
                        right = vectors.vec3(-1.75, 0, -8);
                        left = vectors.vec3(1.75, 0, -8);
                    };
                };

                put = {
                    type = "BODY";

                    pos = {
                        right = vectors.vec3(-3, 3.5, 3);
                        left = vectors.vec3(3, 3.5, 3);
                    };

                    rot = {
                        right = vectors.vec3(-45, -90, 0);
                        left = vectors.vec3(-45, 90, 0);
                    };
                };
            };

            sound = {
                name = "minecraft:entity.generic.explode";
                pitch = 2;
            };

            callbacks = {
                onMainHandChange = function (_, direction)
                    if direction == "RIGHT" then
                        models.models.main.Avatar.UpperBody.Body.CSwimsuitB.GunBag:setPos()
                        models.models.main.Avatar.UpperBody.Body.CSwimsuitB.GunBag:setRot(0, 0, 45)
                        models.models.main.Avatar.UpperBody.Body.CSwimsuitB.GunBag.ShoulderRope:setRot(0, 0, -2.5)
                        models.models.main.Avatar.UpperBody.Body.CSwimsuitB.GunBag.ShoulderRope.ShoulderRopeKnob:setRot()
                        models.models.main.Avatar.UpperBody.Body.CSwimsuitB.GunBag.BagTop.WhaleStrap:setPos()
                        models.models.main.Avatar.UpperBody.Body.CSwimsuitB.GunBag.BagTop.WhaleStrap:setRot(0, 0, -45)
                    else
                        models.models.main.Avatar.UpperBody.Body.CSwimsuitB.GunBag:setPos(6, 0, 0)
                        models.models.main.Avatar.UpperBody.Body.CSwimsuitB.GunBag:setRot(0, 180, -45)
                        models.models.main.Avatar.UpperBody.Body.CSwimsuitB.GunBag.ShoulderRope:setRot(0, 180, 1)
                        models.models.main.Avatar.UpperBody.Body.CSwimsuitB.GunBag.ShoulderRope.ShoulderRopeKnob:setRot(0, 180, 0)
                        models.models.main.Avatar.UpperBody.Body.CSwimsuitB.GunBag.BagTop.WhaleStrap:setPos(0, 0, 2.3)
                        models.models.main.Avatar.UpperBody.Body.CSwimsuitB.GunBag.BagTop.WhaleStrap:setRot(0, 180, -45)
                    end
                end;
            };
        }

        instance.placementObjects = {
        }

        instance.exSkill = {
            {
                name = {
                    en_us = "Tactical Suppression";
                    ja_jp = "戦術的鎮圧";
                };

                formationType = "STRIKER";

                models = {models.models.main.Avatar.UpperBody.Body.Gun.Barrel.ShineEffect};

                animations = {"main", "gun", "ex_skill_1"};

                camera = {
                    start = {
                        rot = vectors.vec3(0, -160, 0);
                        pos = vectors.vec3(-4.5, 7.75, -44.5);
                    };

                    fin = {
                        rot = vectors.vec3(-15, 215, 0);
                        pos = vectors.vec3(-13.5, 13.5, -25);
                    };
                };

                callbacks = {
                    onPreAnimation = function (self)
                        models.models.main.Avatar.UpperBody.Body.Gun.Barrel.ShineEffect:setColor(client:hasShaderPack() and vectors.vec3(1, 0.5, 0.5) or vectors.vec3(1, 1, 1))
                        self.parent.faceParts:setEmotion("ANGRY", "ANGRY", "CLOSED", 53, true)
                    end;

                    onAnimationTick = function (self, tick)
                        if tick == 0 then
                            self.parent.modelUtils.moveTo(models.models.main.Avatar.UpperBody.Body.Gun, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom, models.models.main.Avatar.UpperBody.Body)
                            models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun:setPos()
                            models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun:setRot()
                            models.models.main.Avatar.UpperBody.Body.Shield.Section2.ShoulderBelt:setVisible(false)
                        elseif tick == 8 or tick == 15 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.chest.locked"), player:getPos(), 1, 2)
                        elseif tick == 12 then
                            local bodyYaw = player:getBodyYaw()
                            local particlePos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Body.Shield.Section2):add(vectors.rotateAroundAxis(bodyYaw * -1, 0, 3.66, -1, 0, 1, 0):scale(0.0625))
                            for _ = 1, 10 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), particlePos):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 0.6 - 0.3, math.random() * 0.2 - 0.1, 0, 0, 1, 0)):setColor(1, 0.64, 0.59):setLifetime(4)
                            end
                        elseif tick == 19 then
                            local bodyYaw = player:getBodyYaw()
                            local particlePos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Body.Shield.Section2.Section1):add(vectors.rotateAroundAxis(bodyYaw * -1, 0, 3.66, -1, 0, 1, 0):scale(0.0625))
                            for _ = 1, 10 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), particlePos):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 0.6 - 0.3, math.random() * 0.2 - 0.1, 0, 0, 1, 0)):setColor(1, 0.64, 0.59):setLifetime(4)
                            end
                        elseif tick == 36 or tick == 45 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.anvil.place"), player:getPos(), 1, 2)
                        elseif tick == 38 then
                            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Shield.Section2.Section1.GasCylinder1.GasPiston1, models.models.main.Avatar.UpperBody.Body.Shield.Section2.Section1.GasCylinder2.GasPiston2}) do
                                local bodyYaw = player:getBodyYaw()
                                local particlePos = self.parent.modelUtils.getModelWorldPos(modelPart):add(vectors.rotateAroundAxis(bodyYaw * -1, 0, 0, -0.5, 0, 1, 0):scale(0.0625))
                                for _ = 1, 5 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), particlePos):setScale(0.25):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 0.06 - 0.03, -0.05, 0, 0, 1, 0)):setColor(1, 0.64, 0.59):setLifetime(4)
                                end
                            end
                        elseif tick == 47 then
                            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Shield.Section2.GasCylinder3.GasPiston3, models.models.main.Avatar.UpperBody.Body.Shield.Section2.GasCylinder4.GasPiston4}) do
                                local bodyYaw = player:getBodyYaw()
                                local particlePos = self.parent.modelUtils.getModelWorldPos(modelPart):add(vectors.rotateAroundAxis(bodyYaw * -1, 0, 0, -0.5, 0, 1, 0):scale(0.0625))
                                for _ = 1, 5 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), particlePos):setScale(0.25):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 0.06 - 0.03, -0.025, 0, 0, 1, 0)):setColor(1, 0.64, 0.59):setLifetime(4)
                                end
                            end
                        elseif tick == 53 then
                            self.parent.modelUtils.moveTo(models.models.main.Avatar.UpperBody.Body.Shield, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom, models.models.main.Avatar.UpperBody.Body)
                            self.parent.faceParts:setEmotion("ANGRY", "ANGRY_CENTER", "CLOSED", 19, true)
                        elseif tick == 55 then
                            local bodyYaw = player:getBodyYaw()
                            local particlePos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Shield.Section2):add(vectors.rotateAroundAxis(bodyYaw * -1, 0, 10, 4, 0, 1, 0):scale(0.0625))
                            for _ = 1, 5 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), particlePos):setScale(0.5):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 0.25 - 0.125, math.random() * 0.25 - 0.125, 0, 0, 1, 0)):setColor(0.973, 0.714, 0.29):setLifetime(2)
                            end
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.anvil.place"), player:getPos(), 0.25, 4)
                        elseif tick == 70 then
                            local bodyYaw = player:getBodyYaw()
                            local particlePos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Shield.Section2):add(vectors.rotateAroundAxis(bodyYaw * -1, -2, 3, 4, 0, 1, 0):scale(0.0625))
                            for _ = 1, 5 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), particlePos):setScale(0.5):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 0.25 - 0.125, math.random() * 0.25 - 0.125, 0, 0, 1, 0)):setColor(0.973, 0.714, 0.29):setLifetime(2)
                            end
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.anvil.place"), player:getPos(), 0.25, 4)
                        elseif tick == 72 then
                            self.parent.faceParts:setEmotion("ANGRY", "CLOSED2", "CLOSED", 32, true)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.flintandsteel.use"), player:getPos(), 1, 2)
                        elseif tick == 79 then
                            local particlePos = player:getPos():add(vectors.rotateAroundAxis(player:getBodyYaw() * -1, 1, 0, -3, 0, 1, 0))
                            particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:explosion_emitter"), particlePos)
                            for _ = 1, 100 do
                                local particleOffset = vectors.vec3(math.random() - 0.5, math.random() * 0.5, math.random() - 0.5)
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:poof"), particlePos:copy():add(particleOffset)):setScale(5):setVelocity(particleOffset)
                            end
                            local particleBlock = world.getBlockState(particlePos:copy():add(0, -1, 0)).id
                            if particleBlock ~= "minecraft:air" and particleBlock ~= "minecraft:void_air" and particleBlock ~= "minecraft:cave_air" then
                                for _ = 1, 50 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:block", particleBlock), particlePos):setScale(0.75):setVelocity(math.random() * 0.8 - 0.4, math.random() * 1, math.random() * 0.8 - 0.4):setLifetime(40)
                                end
                            end
                            local playerPos = player:getPos()
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.iron_door.open"), playerPos, 1, 2)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.levelup"), playerPos, 0.5, 1.5)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.generic.explode"), playerPos, 0.5, 0.5)
                        end

                        if tick % 2 == 0 then
                            local particlePos = math.random()
                            if particlePos < 0.4 then
                                self.exSkill[1].showAmmoParticle(self, player:getPos():add(vectors.rotateAroundAxis(player:getBodyYaw() * -1, -1, particlePos * 7.5, 4, 0, 1, 0)))
                            elseif particlePos < 0.6 then
                                self.exSkill[1].showAmmoParticle(self, player:getPos():add(vectors.rotateAroundAxis(player:getBodyYaw() * -1, (particlePos - 0.4) * 10 - 1, 3, 4, 0, 1, 0)))
                            else
                                self.exSkill[1].showAmmoParticle(self, player:getPos():add(vectors.rotateAroundAxis(player:getBodyYaw() * -1, 1, (particlePos - 0.6) * 7.5, 4, 0, 1, 0)))
                            end
                        end
                    end;

                    onPostAnimation = function (self, forcedStop)
                        if models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun ~= nil then
                            self.parent.modelUtils.moveTo(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun, models.models.main.Avatar.UpperBody.Body, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom)
                        end
                        if player:isLeftHanded() then
                            models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(0, 12, 0):add(self.gun.gunPosition.put.pos.left))
                            models.models.main.Avatar.UpperBody.Body.Gun:setRot(self.gun.gunPosition.put.rot.left)
                        else
                            models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(0, 12, 0):add(self.gun.gunPosition.put.pos.right))
                            models.models.main.Avatar.UpperBody.Body.Gun:setRot(self.gun.gunPosition.put.rot.right)
                        end
                        if models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Shield ~= nil then
                            self.parent.modelUtils.moveTo(models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Shield, models.models.main.Avatar.UpperBody.Body, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom)
                        end
                        if self.parent.exSkill.animationCount >= 0 then
                            models.models.main.Avatar.UpperBody.Body.Shield.Section2.ShoulderBelt:setVisible(true)
                        end
                    end;
                };

                ---銃弾を表現するパーティクル
                ---@param self BlueArchiveCharacter
                ---@param pos Vector3 パーティクルをスポーンさせる場所
                showAmmoParticle = function (self, pos)
                    local bodyYaw = player:getBodyYaw()
                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:flame"), pos):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, 0, 0, -1, 0, 1, 0)):setLifetime(20)
                    local smokePos = pos:copy()
                    for _ = 1, 5 do
                        particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:smoke"), smokePos:add(vectors.rotateAroundAxis(bodyYaw * -1, 0, 0, 0.5, 0, 1, 0))):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, 0, 0, -0.5, 0, 1, 0)):setGravity(0):setLifetime(20)
                    end
                end;
            };

            {
                name = {
                    en_us = "Aquatic Support";
                    ja_jp = "水上支援";
                };

                formationType = "STRIKER";

                models = {models.models.main.Avatar.LowerBody.WhaleFloat, models.models.ex_skill_2.Waves};

                animations = {"main", "costume_swimsuit", "ex_skill_2"};

                camera = {
                    start = {
                        rot = vectors.vec3(-15, -150, 0);
                        pos = vectors.vec3(-54, 100.6, -147.4);
                    };

                    ---Exスキルアニメーション終了時
                    fin = {
                        rot = vectors.vec3(-15, -180, 30);
                        pos = vectors.vec3(-248, 17.6, -340.6);
                    };
                };

                callbacks = {
                    onPreAnimation = function (self)
                        if not self.exSkill[2].init then
                            for _, modelPart in ipairs({models.models.ex_skill_2.Waves.Surface, models.models.ex_skill_2.Waves.Wave1}) do
                                modelPart:setPrimaryTexture("RESOURCE", "textures/block/water_still.png")
                            end
                            models.models.ex_skill_2.Waves.Wave2:setPrimaryTexture("RESOURCE", "textures/block/water_flow.png")
                            self.exSkill[2].init = true
                        end
                        self.exSkill[2].resetExSkill2Feature()
                        models.models.ex_skill_2.Waves:setColor(world.getBiome(player:getPos()):getWaterColor())
                        self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "W", 13, true)
                    end;

                    onAnimationTick = function (self, tick)
                        if tick == 3 then
                            local modelPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Waves.Wave1):add(0, 7, 0)
                            local bodyYaw = player:getBodyYaw()
                            for _ = 1, 500 do
                                local offset = vectors.vec3(math.random() * 32 - 16, 0, math.random() * 5)
                                local particleOffset = offset:copy()
                                particleOffset.x = particleOffset.x * (math.random() * 0.025 + 0.025)
                                particleOffset.y = 0.25
                                particleOffset.z = (particleOffset.z - 2.5) * (math.random() * 0.025 + 0.025)
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:dust", "1 1 1 1"), modelPos:copy():add(vectors.rotateAroundAxis(bodyYaw * -1, offset, 0, 1, 0))):setScale(3):setColor(1, 1, 1):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, particleOffset, 0, 1, 0)):setGravity(1):setLifetime(40)
                            end
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.bucket.empty"), modelPos, 1, 0.5)
                        elseif tick == 13 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "OPENED", 29, true)
                        elseif tick == 39 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.generic.splash"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.WhaleFloat.WhaleParticleAnchor1), 1, 0.5)
                        elseif tick == 42 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "W", 13, true)
                        elseif tick == 52 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.generic.swim"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.WhaleFloat.WhaleParticleAnchor1), 1, 0.5)
                        elseif tick == 55 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "W", 13, true)
                        elseif tick == 68 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "OPENED", 2, true)
                        elseif tick == 70 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "OPENED", 12, true)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.generic.swim"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.WhaleFloat.WhaleParticleAnchor1), 1, 0.5)
                        elseif tick == 82 then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "OPENED", 4, true)
                        elseif tick == 85 then
                            self.parent.faceParts:setEmotion("INVERTED", "CLOSED", "OPENED", 28, true)
                        elseif tick == 86 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.bucket.empty"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.WhaleFloat.WhaleParticleAnchor1), 1, 0.5)
                        end

                        if tick >= 8 and tick < 28 then
                            local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_2.Waves.Wave2.Wave2ParticleAnchor)
                            local bodyYaw = player:getBodyYaw()
                            for _ = 1, 20 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:dust", "1 1 1 1"), anchorPos:copy():add(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 32 - 16, 0, 0, 0, 1, 0))):setScale(3):setColor(1, 1, 1):setVelocity(math.random() * 0.2 - 0.1, 0.5, math.random() * 0.2 - 0.1):setGravity(1):setLifetime(20)
                            end
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.bucket.empty"), anchorPos, 1, 0.5)
                        elseif tick >= 41 then
                            local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.WhaleFloat.WhaleParticleAnchor1)
                            local dirVector = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.WhaleFloat.WhaleParticleAnchor2):sub(anchorPos):normalize()
                            local YVector = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.LowerBody.WhaleFloat.WhaleParticleAnchor3):sub(anchorPos):normalize()
                            for _ = 1, 20 do
                                local particleDirection = math.random() * 60 - 30
                                particleDirection = particleDirection > 0 and particleDirection + 30 or particleDirection - 30
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:dust", "1 1 1 1"), anchorPos):setScale(2):setColor(1, 1, 1):setVelocity(vectors.rotateAroundAxis(particleDirection, dirVector, YVector):add(YVector:copy():scale(math.random())):normalize():scale(0.5)):setGravity(0.5):setLifetime(10)
                            end
                            if tick % 2 == 0 then
                                sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.bucket.empty"), anchorPos, 0.1, 0.5)
                            end
                        end

                        if tick % 2 == 0 then
                            for _, modelPart in ipairs({models.models.ex_skill_2.Waves.Surface, models.models.ex_skill_2.Waves.Wave1}) do
                                modelPart:setUVPixels(0, modelPart:getUVPixels().y + 16)
                            end
                        end
                        models.models.ex_skill_2.Waves.Wave2:setUVPixels(0, models.models.ex_skill_2.Waves.Wave2.Wave2:getUVPixels().y + 16)
                    end;

                    onPostTransition = function (self, forcedStop)
                        if not forcedStop then
                            local playerPos = player:getPos()
                            for i = 1, 6 do
                                for j = 0, 35 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:dust", "1 1 1 1"), playerPos):setScale(2):setColor(1, 1, 1):setVelocity(vectors.rotateAroundAxis(j * 12, 0, -0.25, i * 0.05, 0, 1, 0)):setPower(0.25):setColor((i - 1) * 0.2, 1, 1)
                                end
                            end
                            self.parent.waveParticleManager:play()
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.bucket.empty"), playerPos, 1, 0.5)
                            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.CSwimsuitB.RashGuardB, models.models.main.Avatar.UpperBody.Arms.RightArm.CSwimsuitRA, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.CSwimsuitRAB, models.models.main.Avatar.UpperBody.Arms.LeftArm.CSwimsuitLA, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.CSwimsuitLAB, models.models.main.Avatar.LowerBody.Legs.RightLeg.CSwimsuitRL, models.models.main.Avatar.LowerBody.Legs.LeftLeg.CSwimsuitLL}) do
                                modelPart:setVisible(false)
                            end
                            models.models.main.Avatar.Head.CSwimsuitH.Glasses:setPos(0, -4, 0)
                            self.exSkill[2].costumeChangeTimer = 1000
                            events.TICK:register(function ()
                                if not client:isPaused() then
                                    if self.exSkill[2].costumeChangeTimer == 0 then
                                        self.exSkill[2].resetExSkill2Feature()
                                    end
                                    self.exSkill[2].costumeChangeTimer = self.exSkill[2].costumeChangeTimer - 1
                                end
                            end, "ex_skill_2_post_tick")
                        end
                    end;
                };

                ---このExスキルの初期化処理が行われたかどうか
                ---@type boolean
                init = false;

                ---Exスキル2で衣装を変化させる時間を測るタイマー
                ---@type integer
                costumeChangeTimer = 1000;

                ---Exスキル2の衣装変化機能をリセットする
                resetExSkill2Feature = function ()
                    for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.CSwimsuitB.RashGuardB, models.models.main.Avatar.UpperBody.Arms.RightArm.CSwimsuitRA, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.CSwimsuitRAB, models.models.main.Avatar.UpperBody.Arms.LeftArm.CSwimsuitLA, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.CSwimsuitLAB, models.models.main.Avatar.LowerBody.Legs.RightLeg.CSwimsuitRL, models.models.main.Avatar.LowerBody.Legs.LeftLeg.CSwimsuitLL}) do
                        modelPart:setVisible(true)
                    end
                    models.models.main.Avatar.Head.CSwimsuitH.Glasses:setPos()
                    events.TICK:remove("ex_skill_2_post_tick")
                end;
            };

            {
                name = {
                    en_us = "Hardened defensive posture";
                    ja_jp = "防御姿勢強化";
                };

                formationType = "STRIKER";

                models = {models.models.ex_skill_3.Illagers};

                animations = {"main", "gun", "costume_battle", "ex_skill_3"};

                camera = {
                    start = {
                        rot = vectors.vec3(0, -123, 0);
                        pos = vectors.vec3(96.8, 40.4, -27);
                    };
                    fin = {
                        rot = vectors.vec3(-10, -155, -10);
                        pos = vectors.vec3(-9, 14.9, -30);
                    };
                };

                callbacks = {
                    onPreAnimation = function (self)
                        if not self.exSkill[3].init then
                            models.models.ex_skill_3.Illagers.Ravager:setPrimaryTexture("RESOURCE", "minecraft:textures/entity/illager/ravager.png")
                            for index, modelPart in ipairs({models.models.ex_skill_3.Illagers.Ravager.Pillager1, models.models.ex_skill_3.Illagers.Pillager2}) do
                                modelPart:setPrimaryTexture("RESOURCE", "minecraft:textures/entity/illager/pillager.png")
                                modelPart["P"..index.."RightArm"]:newItem("pillager_"..index.."_crossbow"):setItem(self.parent.compatibilityUtils:checkItem("minecraft:crossbow")):setPos(0, -15, -2.5):setRot(0, 0, -135)
                            end
                            for i = 1, 2 do
                                models.models.ex_skill_3.Illagers["Vindicator"..i]:setPrimaryTexture("RESOURCE", "minecraft:textures/entity/illager/vindicator.png")
                                models.models.ex_skill_3.Illagers["Vindicator"..i]["V"..i.."RightArm"]:newItem("vindicator_"..i.."_iron_axe"):setItem(self.parent.compatibilityUtils:checkItem("minecraft:iron_axe")):setPos(1, -9, -5):setRot(-90, -45, -90)
                            end
                            models.models.ex_skill_3.Firework:setPrimaryTexture("RESOURCE", "minecraft:textures/item/firework_rocket.png")
                            self.exSkill[3].init = true
                        end
                        self.parent.faceParts:setEmotion("ANGRY", "ANGRY", "OUT_OF_BREATH", 20, true)
                    end;

                    onAnimationTick = function (self, tick)
                        if tick == 0 then
                            models.models.main.Avatar.UpperBody.Body.Gun:setPos()
                            models.models.main.Avatar.UpperBody.Body.Gun:setRot()
                            self.parent.modelUtils.moveTo(models.models.main.Avatar.UpperBody.Body.Gun, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom, models.models.main.Avatar.UpperBody.Body)
                        elseif tick == 1 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.attack.sweep"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 0.5, 0.5)
                        elseif tick == 13 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.chest.locked"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Body.Shield), 0.5, 2)
                        elseif tick == 14 then
                            models.models.main.Avatar.UpperBody.Body.Shield.Section2.ShoulderBelt:setVisible(false)
                            self.parent.modelUtils.moveTo(models.models.main.Avatar.UpperBody.Body.Shield, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom, models.models.main.Avatar.UpperBody.Body)
                        elseif tick == 19 then
                            local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar):add(0, 0.25, 0)
                            local bodyYaw = player:getBodyYaw()
                            for _ = 1, 10 do
                                local offset = vectors.vec3(math.random() * 1 - 0.5, 0, math.random() * 1 - 0.5)
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:campfire_cosy_smoke"), anchorPos:copy():add(offset)):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, -0.1, 0, offset.z * -0.1, 0, 1, 0)):setLifetime(20)
                            end
                        elseif tick == 20 then
                            self.parent.faceParts:setEmotion("ANGRY", "ANGRY", "CLOSED", 68, true)
                        elseif tick == 21 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.anvil.place"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Shield), 0.15, 2)
                        elseif tick == 23 and host:isHost() then
                            self.parent.compatibilityUtils.setPostEffect("phosphor")
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.attack.sweep"), self.parent.modelUtils.getModelWorldPos(models.models.main.CameraAnchor), 0.15, 0.5)
                        elseif tick == 36 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.vindicator.ambient"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_3.Illagers.Vindicator1), 1, 1)
                        elseif tick == 38 and host:isHost() then
                            self.parent.compatibilityUtils.setPostEffect()
                        elseif tick == 42 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.ravager.roar"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_3.Illagers.Ravager), 1, 1)
                        elseif tick == 46 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.pillager.ambient"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_3.Illagers.Pillager2), 1, 1)
                        elseif tick == 49 then
                            models.models.ex_skill_3.Firework:setVisible(true)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:item.crossbow.shoot"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_3.Illagers.Ravager.Pillager1), 1, 1)
                            self.exSkill[3].fireworkSound = sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.firework_rocket.launch"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_3.Firework), 1, 0.5)
                        elseif tick == 88 then
                            self.parent.faceParts:setEmotion("ANGRY", "ANGRY_INVERTED", "TEETH", 21, true)
                        elseif tick == 97 and host:isHost() then
                            models.models.ex_skill_3.Gui:setScale(client:getScaledWindowSize():augmented(1))
                            models.models.ex_skill_3.Gui:setVisible(true)
                        elseif tick == 99 and host:isHost() then
                            models.models.ex_skill_3.Gui.Filter:setUVPixels(1, 0)
                        elseif tick == 100 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.anvil.place"), player:getPos(), 0.15, 2)
                            self.exSkill[3].grindstoneSound = sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.grindstone.use"), player:getPos(), 1, 1.25)
                        elseif tick == 102 and host:isHost() then
                            models.models.ex_skill_3.Gui:setVisible(false)
                        elseif tick == 109 then
                            self.exSkill[3].grindstoneSound:stop()
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:block.anvil.place"), player:getPos(), 0.5, 0.75)
                            particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:sweep_attack"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_3.Firework.ExSkill3ParticleAnchor2):add(vectors.rotateAroundAxis(player:getBodyYaw() * -1, 0.75, 0, -0.4, 0, 1, 0))):setColor(1, 0.98, 0.69)
                            self.parent.faceParts:setEmotion("ANGRY_INVERTED", "ANGRY", "OUT_OF_BREATH", 17, true)
                        elseif tick == 122 then
                            local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_3.Firework)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.generic.explode"), anchorPos, 1, 0.75)
                            for _ = 1, 100 do
                                local particleOffset = vectors.vec3(math.random() - 0.5, math.random() * 0.5, math.random() - 0.5)
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:poof"), anchorPos:copy():add(particleOffset)):setScale(10):setVelocity(particleOffset:mul(1, 0.5, 1):scale(2)):setColor(vectors.vec3(0.45, 0.35, 0.35):scale(math.random() * 0.2 - 0.1 + 1)):setGravity(math.random() * -0.1):setLifetime(120)
                            end
                            models.models.ex_skill_3.Explosion:setColor(client:hasShaderPack() and vectors.vec3(1, 0.85, 0.5) or vectors.vec3(1, 1, 1))
                            models.models.ex_skill_3.Firework:setVisible(false)
                            models.models.ex_skill_3.Explosion:setVisible(true)
                        elseif tick == 126 then
                            self.parent.faceParts:setEmotion("ANGRY_INVERTED", "ANGRY", "W", 14, true)
                        elseif tick == 131 then
                            models.models.ex_skill_3.Explosion:setVisible(false)
                        elseif tick == 138 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.attack.sweep"), player:getPos(), 0.5, 0.75)
                        elseif tick == 140 then
                            self.parent.faceParts:setEmotion("ANGRY", "ANGRY", "W", 48, true)
                        end
                        if tick >= 49 and tick <= 109 then
                            self.exSkill[3].fireworkSound:setPos(self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_3.Firework))
                            local anchor2Pos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_3.Firework.ExSkill3ParticleAnchor2)
                            local anchorPos = anchor2Pos:copy()
                            if host:isHost() and tick < 100 then
                                anchorPos:add(vectors.rotateAroundAxis(player:getBodyYaw() * -1, 0, 0, -1.5, 0, 1, 0))
                            elseif tick >= 100 then
                                local bodyYaw = player:getBodyYaw()
                                anchorPos:add(vectors.rotateAroundAxis(bodyYaw * -1, 0, 0, 0.3, 0, 1, 0))
                                for _ = 0, 3 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), anchor2Pos):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, math.random() * 0.2 - 0.1, math.random() * 0.2 - 0.1, 0.05, 0, 1, 0)):setColor(1, 0.804, 0.357):setLifetime(2)
                                end
                            end
                            local axisVector = anchor2Pos:copy():sub(self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_3.Firework.ExSkill3ParticleAnchor1))
                            for i = 0, 3 do
                                local offset = vectors.rotateAroundAxis(i * 90 + tick * 20, 0, 0.1, 0, axisVector)
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:cloud"), anchorPos:copy():add(offset)):setScale(0.5):setVelocity(offset:scale(0.5)):setGravity(0):setColor(0.5, 0.5, 0.5):setLifetime(4)
                            end
                        end
                        if tick >= 49 and tick < 122 then
                            local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_3.Firework.ExSkill3ParticleAnchor1)
                            if host:isHost() and tick < 100 then
                                anchorPos:add(vectors.rotateAroundAxis(player:getBodyYaw() * -1, 0, 0, -1.5, 0, 1, 0))
                            end
                            particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:firework"), anchorPos):setColor(1, 0.804, 0.357)
                        end
                    end;

                    onPostAnimation = function (self, forcedStop)
                        if models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun ~= nil then
                            self.parent.modelUtils.moveTo(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun, models.models.main.Avatar.UpperBody.Body, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom)
                        end
                        if player:isLeftHanded() then
                            models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(0, 12, 0):add(self.gun.gunPosition.put.pos.left))
                            models.models.main.Avatar.UpperBody.Body.Gun:setRot(self.gun.gunPosition.put.rot.left)
                        else
                            models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(0, 12, 0):add(self.gun.gunPosition.put.pos.right))
                            models.models.main.Avatar.UpperBody.Body.Gun:setRot(self.gun.gunPosition.put.rot.right)
                        end
                        if models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Shield ~= nil then
                            self.parent.modelUtils.moveTo(models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Shield, models.models.main.Avatar.UpperBody.Body, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom)
                        end
                        models.models.main.Avatar.UpperBody.Body.Shield.Section2.ShoulderBelt:setVisible(true)
                        self.exSkill[3].fireworkSound = nil
                        self.exSkill[3].grindstoneSound = nil
                        if forcedStop then
                            for _, modelPart in ipairs({models.models.ex_skill_3.Firework, models.models.ex_skill_3.Explosion}) do
                                modelPart:setVisible(false)
                            end
                            models.models.ex_skill_3.Gui.Filter:setUVPixels()
                            if host:isHost() then
                                self.parent.compatibilityUtils.setPostEffect()
                                models.models.ex_skill_3.Gui:setVisible(false)
                            end
                        end
                    end;
                };

                ---このExスキルの初期化処理が行われたかどうか
                ---@type boolean
                init = false;

                ---花火の音のインスタンス
                ---@type Sound|nil
                fireworkSound = nil;

                ---砥石の音のインスタンス
                ---@type Sound|nil
                grindstoneSound = nil;
            };

            {
                name = {
                    en_us = "Concentrated breakthrough";
                    ja_jp = "集中突破";
                };

                formationType = "STRIKER";

                models = {models.models.ex_skill_4.Zombie, models.models.ex_skill_4.Creeper, models.models.main.Avatar.UpperBody.Body.Gun.MuzzleFlash};

                animations = {"main", "gun", "costume_battle", "ex_skill_4"};

                camera = {
                    start = {
                        rot = vectors.vec3(0, 30, -10);
                        pos = vectors.vec3(17, 12, 7);
                    };

                    fin = {
                        rot = vectors.vec3(-5, 30, 15);
                        pos = vectors.vec3(-1, 10, -235);
                    };
                };

                callbacks = {
                    onPreAnimation = function (self)
                        if not self.exSkill[4].init then
                            models.models.ex_skill_4.Zombie:setPrimaryTexture("RESOURCE", "minecraft:textures/entity/zombie/zombie.png")
                            local gameVersion = client:getVersion()
                            for _, modelPart in ipairs({models.models.ex_skill_4.Zombie.ZHead.ZHelmet, models.models.ex_skill_4.Zombie.ZUpperBody.ZBody.ZChestPlateB, models.models.ex_skill_4.Zombie.ZUpperBody.ZArms.ZRightArm.ZChestPlateRA, models.models.ex_skill_4.Zombie.ZUpperBody.ZArms.ZLeftArm.ZChestPlateLA, models.models.ex_skill_4.Zombie.ZLowerBody.ZLegs.ZRightLeg.ZBootsRL, models.models.ex_skill_4.Zombie.ZLowerBody.ZLegs.ZLeftLeg.ZBootsLL}) do
                                modelPart:setPrimaryTexture("RESOURCE", gameVersion >="1.21.2" and "minecraft:textures/entity/equipment/humanoid/iron.png" or "minecraft:textures/models/armor/iron_layer_1.png")
                            end
                            for _, modelPart in ipairs({models.models.ex_skill_4.Zombie.ZUpperBody.ZBody.ZLeggingsB,models.models.ex_skill_4.Zombie.ZLowerBody.ZLegs.ZRightLeg.ZLeggingsRL, models.models.ex_skill_4.Zombie.ZLowerBody.ZLegs.ZLeftLeg.ZLeggingsLL}) do
                                modelPart:setPrimaryTexture("RESOURCE", gameVersion >="1.21.2" and "minecraft:textures/entity/equipment/humanoid_leggings/iron.png" or "minecraft:textures/models/armor/iron_layer_2.png")
                            end
                            models.models.ex_skill_4.Creeper:setPrimaryTexture("RESOURCE", "minecraft:textures/entity/creeper/creeper.png")
                            self.exSkill[4].init = true
                        end
                        self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "CLOSED", 18, true)
                    end;

                    onAnimationTick = function (self, tick)
                        if tick == 0 then
                            models.models.main.Avatar.UpperBody.Body.Gun:setPos()
                            models.models.main.Avatar.UpperBody.Body.Gun:setRot()
                            self.parent.modelUtils.moveTo(models.models.main.Avatar.UpperBody.Body.Gun, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom, models.models.main.Avatar.UpperBody.Body)
                            models.models.main.Avatar.UpperBody.Body.SubGun:setPos()
                            models.models.main.Avatar.UpperBody.Body.SubGun:setRot()
                            models.models.main.Avatar.UpperBody.Body.SubGun:setScale(1.5, 1.5, 1.5)
                            models.models.main.Avatar.UpperBody.Body.SubGun:setParentType("None")
                            self.parent.modelUtils.moveTo(models.models.main.Avatar.UpperBody.Body.SubGun, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom, models.models.main.Avatar.UpperBody.Body)
                            models.models.main.Avatar.UpperBody.Body.Shield.Section2.ShoulderBelt:setVisible(false)
                        elseif tick == 1 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.zombie.ambient"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 0.5, 1)
                            local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar)
                            for _ = 1, 50 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:campfire_cosy_smoke"), anchorPos:copy():add(math.random() * 5 - 2.5, 0.5, math.random() * 5 - 2.5)):scale(5):setVelocity(0, 0.01, 0):setLifetime(60)
                            end
                        elseif tick == 18 then
                            self.parent.faceParts:setEmotion("NARROW", "NARROW", "CLOSED", 22, true)
                        elseif tick == 40 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "CLOSED", 19, true)
                        elseif tick == 50 then
                            models.models.main.Avatar.Head.EyeShine:setVisible(true)
                        elseif tick == 52 and host:isHost() then
                            self.parent.compatibilityUtils.setPostEffect("phosphor")
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.player.attack.sweep"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar), 1, 0.5)
                        elseif tick == 59 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "CLOSED", 16, true)
                            if host:isHost() then
                                self.parent.compatibilityUtils.setPostEffect()
                            end
                        elseif tick == 66 then
                            models.models.main.Avatar.Head.EyeShine:setVisible(false)
                        elseif tick == 70 or tick == 82 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.zombie.hurt"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_4.Zombie), 1, 1)
                            if tick == 70 then
                                local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_4.Zombie.ZUpperBody.ZBody.ExSkill4ParticleAnchor1)
                                local bodyYaw = player:getBodyYaw()
                                for _ = 1, 50 do
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), anchorPos):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1 + 90, math.random() * 0.6 - 0.3, math.random() * 0.6 - 0.3, math.random() * 0.4, 0, 1, 0)):setColor(1, 0.877, 0.436):setLifetime(4)
                                end
                            end
                        elseif tick == 75 then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "CLOSED", 4, true)
                        elseif tick == 79 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "CLOSED", 11, true)
                        elseif tick == 86 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.zombie.death"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_4.Zombie), 1, 1)
                        elseif tick == 90 then
                            self.parent.faceParts:setEmotion("NORMAL", "INVERTED", "CLOSED", 31, true)
                        elseif tick == 95 or tick == 98 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.creeper.hurt"), self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_4.Creeper), 1, 1)
                        elseif tick == 117 then
                            local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun.MuzzleAnchor)
                            local dirVector = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun.ExSkill4Anchor3):sub(anchorPos):normalize()
                            local normalVector = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun.ExSkill4Anchor4):sub(anchorPos):normalize()
                            for i = 0, 4 do
                                for j = 0, 11 do
                                    local offsetLength = i / 4
                                    particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), anchorPos):setVelocity(dirVector:copy():scale(math.cos(offsetLength * math.pi / 2) * 0.5):add(vectors.rotateAroundAxis(j * 30, normalVector:copy():scale(offsetLength * 0.45), dirVector))):setScale(5):setColor(1, 0.877, 0.436):setLifetime(8)
                                    if i == 0 then
                                        break
                                    end
                                end
                            end
                            for _ = 1, 10 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:large_smoke"), anchorPos:copy():add(math.random() * 0.5 - 0.25, math.random() * 0.5 - 0.25, math.random() * 0.5 - 0.25))
                            end
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.firework_rocket.large_blast"),  anchorPos, 1, 0.75)
                            local anchorPos2 = self.parent.modelUtils.getModelWorldPos(models.models.ex_skill_4.Creeper)
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.creeper.death"), anchorPos2, 1, 1)
                            particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:explosion_emitter"), anchorPos2)
                            for _ = 1, 30 do
                                local offset = vectors.vec3(math.random() - 0.5, math.random() - 0.5, math.random() - 0.5)
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:poof"), anchorPos2:copy():add(offset.x * 2, offset.y * 2 + 0.5, offset.z * 2)):setVelocity(offset:copy():scale(0.5))
                            end
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.generic.explode"), anchorPos2, 1, 1)
                            models.models.ex_skill_4.Creeper:setVisible(false)
                        elseif tick == 121 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "CLOSED", 11, true)
                        elseif tick == 124 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "CLOSED", 25, true)
                        elseif tick == 149 then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "CLOSED", 39, true)
                        elseif tick == 150 then
                            models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun.MuzzleFlash:setColor(client:hasShaderPack() and vectors.vec3(1, 0.85, 0.5) or vectors.vec3(1, 1, 1))
                        elseif tick == 152 then
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.generic.explode"), self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.Head), 1, 0.5)
                        elseif tick == 157 then
                            local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun.MuzzleFlash)
                            for _ = 1, 50 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:lava"), anchorPos):setVelocity(math.random() * 0.25 - 0.125, math.random() * 0.1, math.random() * 0.25 - 0.125):setColor(1, 0.877, 0.436):setLifetime(30)
                            end
                        end
                        if tick == 70 or tick == 82 or tick == 86 or tick == 95 or tick == 98 then
                            --ピストル発砲
                            local anchorPos = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.SubGun.MuzzleAnchor2)
                            local velocityVector = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.SubGun.ExSkill4Anchor1):sub(anchorPos):normalize():scale(0.5)
                            local offsetVector = self.parent.modelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.SubGun.ExSkill4Anchor2):sub(anchorPos):normalize():scale(0.25)
                            for i = 0, 5 do
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:electric_spark"), anchorPos):setVelocity(velocityVector:copy():add(vectors.rotateAroundAxis(i * 60, offsetVector, velocityVector))):setScale(1.5):setColor(1, 0.877, 0.436):setLifetime(2)
                                particles:newParticle(self.parent.compatibilityUtils:checkParticle("minecraft:smoke"), anchorPos:copy():add(math.random() * 0.1 - 0.05, math.random() * 0.1 - 0.05, math.random() * 0.1 - 0.05))
                            end
                            sounds:playSound(self.parent.compatibilityUtils:checkSound("minecraft:entity.firework_rocket.blast"), anchorPos, 1, 0.5)
                        end
                    end;

                    onPostAnimation = function (self, forcedStop)
                        models.models.main.Avatar.UpperBody.Body.Shield.Section2.ShoulderBelt:setVisible(true)
                        if models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun ~= nil then
                            self.parent.modelUtils.moveTo(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.Gun, models.models.main.Avatar.UpperBody.Body, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom)
                        end
                        if models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.SubGun ~= nil then
                            self.parent.modelUtils.moveTo(models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.SubGun, models.models.main.Avatar.UpperBody.Body, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom)
                        end
                        if player:isLeftHanded() then
                            models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(0, 12, 0):add(self.gun.gunPosition.put.pos.left))
                            models.models.main.Avatar.UpperBody.Body.Gun:setRot(self.gun.gunPosition.put.rot.left)
                        else
                            models.models.main.Avatar.UpperBody.Body.Gun:setPos(vectors.vec3(0, 12, 0):add(self.gun.gunPosition.put.pos.right))
                            models.models.main.Avatar.UpperBody.Body.Gun:setRot(self.gun.gunPosition.put.rot.right)
                        end
                        models.models.main.Avatar.UpperBody.Body.SubGun:setPos(-1, 17.5, -1.9)
                        models.models.main.Avatar.UpperBody.Body.SubGun:setRot(-30, 90, 0)
                        models.models.main.Avatar.UpperBody.Body.SubGun:setScale()
                        if forcedStop then
                            models.models.main.Avatar.Head.EyeShine:setVisible(false)
                            if host:isHost() then
                                self.parent.compatibilityUtils.setPostEffect()
                            end
                        end
                    end;
                };

                ---このExスキルの初期化処理が行われたかどうか
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
                    name = "masked";

                    displayName = {
                        en_us = "Masked Swimsuit Group";
                        ja_jp = "覆面水着団";
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

                {
                    name = "battle";

                    displayName = {
                        en_us = "Battle";
                        ja_jp = "臨戦";
                    };

                    exSkill = 3;
                    subExSkill = 4;
                };
            };

            callbacks = {
                onChange = function (self, costumeId)
                    if costumeId == "MASKED" then
                        --覆面水着団
                        for _, modelPart in ipairs({models.models.main.Avatar.Head.CMaskedH}) do
                            modelPart:setVisible(true)
                        end
                        for _, modelPart in ipairs({models.models.main.Avatar.Head.HairEnds, models.models.main.Avatar.UpperBody.Body.Hairs}) do
                            modelPart:setVisible(false)
                        end
                    elseif costumeId == "SWIMSUIT" then
                        --水着
                        self.parent.costume.setCostumeTextureOffset(1)
                        models.models.main.Avatar.Head.HatLayer:setUVPixels(0, 16)
                        for _, modelPart in ipairs({models.models.main.Avatar.Head.CSwimsuitH, models.models.main.Avatar.UpperBody.Body.CSwimsuitB, models.models.main.Avatar.UpperBody.Arms.RightArm.CSwimsuitRA, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.CSwimsuitRAB, models.models.main.Avatar.UpperBody.Arms.LeftArm.CSwimsuitLA, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.CSwimsuitLAB, models.models.main.Avatar.LowerBody.Legs.RightLeg.CSwimsuitRL, models.models.main.Avatar.LowerBody.Legs.LeftLeg.CSwimsuitLL}) do
                            modelPart:setVisible(true)
                        end
                        for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Hairs, models.models.main.Avatar.UpperBody.Body.IDCard, models.models.main.Avatar.UpperBody.Body.Tie, models.models.main.Avatar.UpperBody.Body.Skirt, models.models.main.Avatar.UpperBody.Body.Shield}) do
                            modelPart:setVisible(false)
                        end
                        if self.parent.whaleFloat ~= nil then
                            self.parent.whaleFloat:enable()
                        else
                            self.parent.avatarEvents.SCRIPT_INIT:register(function ()
                                self.parent.whaleFloat:enable()
                            end)
                        end
                    elseif costumeId == "BATTLE" then
                        --臨戦
                        self.parent.costume.setCostumeTextureOffset(2)
                        for _, modelPart in ipairs({models.models.main.Avatar.Head.Head, models.models.main.Avatar.Head.HatLayer}) do
                            modelPart:setUVPixels(0, 16)
                        end
                        for _, modelPart in ipairs({models.models.main.Avatar.Head.CBattleH, models.models.main.Avatar.UpperBody.Body.SubGun, models.models.main.Avatar.UpperBody.Body.CBattleB}) do
                            modelPart:setVisible(true)
                        end
                        for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Hairs, models.models.main.Avatar.UpperBody.Body.IDCard, models.models.main.Avatar.UpperBody.Body.Tie}) do
                            modelPart:setVisible(false)
                        end
                        if self.parent.subGun ~= nil then
                            self.parent.subGun:enable()
                        else
                            self.parent.avatarEvents.SCRIPT_INIT:register(function ()
                                self.parent.subGun:enable()
                            end)
                        end
                    end
                end;

                onReset = function (self)
                    self.parent.costume.setCostumeTextureOffset(0)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.Head, models.models.main.Avatar.Head.HatLayer}) do
                        modelPart:setUVPixels()
                    end
                    models.models.main.Avatar.Head.HatLayer:setUVPixels()
                    self.exSkill[2]:resetExSkill2Feature()
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.CMaskedH, models.models.main.Avatar.Head.CSwimsuitH, models.models.main.Avatar.UpperBody.Body.CSwimsuitB, models.models.main.Avatar.UpperBody.Arms.RightArm.CSwimsuitRA, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.CSwimsuitRAB, models.models.main.Avatar.UpperBody.Arms.LeftArm.CSwimsuitLA, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.CSwimsuitLAB, models.models.main.Avatar.LowerBody.Legs.RightLeg.CSwimsuitRL, models.models.main.Avatar.LowerBody.Legs.LeftLeg.CSwimsuitLL, models.models.main.Avatar.Head.CBattleH, models.models.main.Avatar.UpperBody.Body.CBattleB, models.models.main.Avatar.UpperBody.Body.SubGun}) do
                        modelPart:setVisible(false)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.HairEnds, models.models.main.Avatar.UpperBody.Body.Hairs, models.models.main.Avatar.UpperBody.Body.IDCard, models.models.main.Avatar.UpperBody.Body.Tie, models.models.main.Avatar.UpperBody.Body.Skirt, models.models.main.Avatar.UpperBody.Body.Shield}) do
                        modelPart:setVisible(true)
                    end
                    if self.parent.whaleFloat ~= nil and self.parent.subGun ~= nil then
                        self.parent.whaleFloat:disable()
                        self.parent.subGun:disable()
                    end
                end;

                onArmorChange = function (self, parts, isVisible)
                    if parts == "CHEST_PLATE" then
                        if isVisible then
                            models.models.main.Avatar.UpperBody.Body.Hairs.BackHair:setPos(0, 0, 1)
                            models.models.main.Avatar.UpperBody.Body.CBattleB:setVisible(false)
                        else
                            models.models.main.Avatar.UpperBody.Body.Hairs.BackHair:setPos()
                            models.models.main.Avatar.UpperBody.Body.CBattleB:setVisible(self.parent.costume.currentCostume == 4)
                        end
                    elseif parts == "LEGGINGS" then
                        models.models.main.Avatar.UpperBody.Body.Skirt:setVisible(self.parent.costume.currentCostume <= 2 and not isVisible)
                    end
                end;
            };
        }

        instance.bubble = {
            callbacks = {
                onPlay = function(self, type, duration)
                    if duration > 0 then
                        if type == "GOOD" then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "W", duration, true)
                        elseif type == "HEART" then
                            self.parent.faceParts:setEmotion("NORMAL", "NORMAL", "YAWN", duration, true)
                        elseif type == "NOTE" then
                            self.parent.faceParts:setEmotion("CLOSED", "CLOSED", "W", duration, true)
                        elseif type == "QUESTION" then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "YAWN", duration, true)
                        elseif type == "SWEAT" then
                            self.parent.faceParts:setEmotion("CLOSED2", "CLOSED2", "SAD", duration, true)
                        end
                    end
                end;

                onStop = function(self, _, forcedStop)
                    if forcedStop then
                        self.parent.faceParts:resetEmotion()
                    end
                    models.models.main.Avatar.Head.FaceParts.Face:setUVPixels()
                end
            };
        }

        instance.headBlock = {
            includeModels = {models.models.main.Avatar.UpperBody.Body.Hairs};

            callbacks = {
                onBeforeModelCopy = function ()
                    models.models.main.Avatar.Head.FaceParts.Face:setUVPixels()
                end;

                onAfterModelCopy = function (self)
                    if self.parent.bubble ~= nil and self.parent.bubble.emoji == "SWEAT" and self.parent.bubble.bubbleCount ~= 0 then
                        models.models.main.Avatar.Head.FaceParts.Face:setUVPixels(6, 0)
                    end
                end;
            };
        }

        instance.portrait = {
            includeModels = {};

            callbacks = {
                onBeforeModelCopy = function ()
                    models.models.main.Avatar.Head.FaceParts.Face:setUVPixels()
                end;

                onAfterModelCopy = function (self)
                    if self.parent.bubble ~= nil and self.parent.bubble.emoji == "SWEAT" and self.parent.bubble.bubbleCount ~= 0 then
                        models.models.main.Avatar.Head.FaceParts.Face:setUVPixels(6, 0)
                    end
                end;
            };
        }

        instance.deathAnimation = {
            callbacks = {
                onPhase1 = function (_, dummyAvatar, costume)
                    if costume ~= "SWIMSUIT" then
                        dummyAvatar.UpperBody.Body.Skirt:setRot(25, 0, 0)
                        dummyAvatar.UpperBody.Body.Shield:setPos(4.5, -2.5, 0)
                        dummyAvatar.UpperBody.Body.Shield:setRot(70, 90, 0)
                        dummyAvatar.UpperBody.Body.Shield.Section2.ShoulderBelt:setRot(-55, 0, 0)
                        if costume == "DEFAULT" then
                            dummyAvatar.UpperBody.Body.Hairs.BackHair:setRot(-35, 0, 0)
                        elseif costume == "BATTLE" then
                            dummyAvatar.Head.CBattleH.HairTail:setRot(12, 0, 0)
                            dummyAvatar.UpperBody.Body.SubGun:setPos(-1, 17.5, -1.9)
                            dummyAvatar.UpperBody.Body.SubGun:setRot(-30, 90, 0)
                            dummyAvatar.UpperBody.Body.SubGun:setScale()
                        end
                    else
                        for _, modelPart in ipairs({dummyAvatar.Head.CSwimsuitH.HairTails.HairTailLeft.HairLeftBottom, dummyAvatar.Head.CSwimsuitH.HairTails.HairTailRight.HairRightBottom}) do
                            modelPart:setRot(25, 0, 0)
                        end
                    end
                end;

                onPhase2 = function (_, dummyAvatar, costume)
                    if costume ~= "SWIMSUIT" then
                        dummyAvatar.UpperBody.Body.Shield:setPos()
                        dummyAvatar.UpperBody.Body.Shield:setRot(0, 90, 0)
                        dummyAvatar.UpperBody.Body.Shield.Section2.ShoulderBelt:setRot()
                        if costume == "DEFAULT" then
                            dummyAvatar.UpperBody.Body.Hairs.BackHair:setRot(-9.6599, -3.2113, -12.0868)
                        elseif costume == "BATTLE" then
                            dummyAvatar.Head.CBattleH.HairTail:setRot(-20, 0, 0)
                        end
                    else
                        dummyAvatar.Head.CSwimsuitH.HairTails.HairTailLeft.HairLeftBottom:setRot(-15, 0, 30)
                        dummyAvatar.Head.CSwimsuitH.HairTails.HairTailRight.HairRightBottom:setRot(-15, 0, -10)
                    end
                end;

                onBeforeModelCopy = function (self)
                    self.deathAnimation.hasShield = self.parent.shield.hasShield
                    if self.deathAnimation.hasShield then
                        self.parent.shield:setShield(false, false)
                    end
                    models.models.main.Avatar.Head.FaceParts.Face:setUVPixels()
                    models.models.main.Avatar.LowerBody.WhaleFloat:setVisible(false)
                end;

                onAfterModelCopy = function (self)
                    if self.deathAnimation.hasShield then
                        self.parent.shield:setShield(true, false)
                    end
                end;
            };

            ---盾を持っているかどうか
            ---@type boolean
            hasShield = false;
        }

        instance.actionWheel = {
            isVehicleOptionEnabled = true;
        }

        instance.physics = {
            physicData = {

                {
                    models = {models.models.main.Avatar.UpperBody.Body.Hairs.BackHair};

                    x = {
                        vertical = {
                            min = -150;
                            neutral = -5;
                            max = -5;

                            bodyX = {
                                multiplayer = -80;
                                min = -90;
                                max = -5;
                            };

                            bodyY = {
                                multiplayer = 80;
                                min = -150;
                                max = -5;
                            };

                            bodyRot = {
                                multiplayer = 0.05;
                                min = -90;
                                max = -5;
                            };
                        };

                        horizontal = {
                            min = -90;
                            neutral = -5;
                            max = -5;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.Cowlick};

                    x = {
                        vertical = {
                            min = -30;
                            neutral = -20;
                            max = 0;

                            bodyY = {
                                multiplayer = -40;
                                min = -30;
                                max = 0;
                            };
                        };

                        horizontal = {
                            min = -30;
                            neutral = -20;
                            max = 0;

                            bodyX = {
                                multiplayer = -80;
                                min = 0;
                                max = 150;
                            };
                        };
                    };

                    y = {
                        vertical = {
                            min = 40;
                            neutral = 40;
                            max = 40;
                        };

                        horizontal = {
                            min = 40;
                            neutral = 40;
                            max = 40;
                        };
                    };
                };

                {
                    models = {models.models.main.Avatar.Head.CSwimsuitH.HairTails.HairTailLeft.HairLeftBottom};

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
                    models = {models.models.main.Avatar.Head.CSwimsuitH.HairTails.HairTailLeft.HairLeftBottom.HairLeftBottomZ};

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
                    models = {models.models.main.Avatar.Head.CSwimsuitH.HairTails.HairTailRight.HairRightBottom};

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
                    models = {models.models.main.Avatar.Head.CSwimsuitH.HairTails.HairTailRight.HairRightBottom.HairRightBottomZ};

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
                    models = {models.models.main.Avatar.Head.CBattleH.HairTail};

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
                    models = {models.models.main.Avatar.Head.CBattleH.HairTail.HairTailZPivot};

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
            };

            callbacks = {
                onPhysicPerformed = function (_, model)
                    if model == models.models.main.Avatar.Head.CBattleH.HairTail then
                        local modelRot = model:getRot()
                        local headRotY = math.deg(math.asin(player:getLookDir().y))
                        if headRotY < 0 then
                            modelRot.x = math.min(modelRot.x, 30)
                        end
                        model:setRot(modelRot)
                    end
                end;
            };
        }

        instance.dataSync = {
            syncData = {

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
        events.TICK:register(function()
            if self.parent.costume.currentCostume == 3 and not self.parent.shield.hasShield then
                models.models.main.Avatar.UpperBody.Body.Shield:setVisible(false)
            end
        end)
    end;
}