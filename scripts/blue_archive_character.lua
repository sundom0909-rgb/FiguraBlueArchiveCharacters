---銃の構え方
---@alias BlueArchiveCharacter.GunHoldType
---| "NORMAL" バニラの弓やクロスボウの構え方と同じ
---| "CUSTOM" BBアニメーション"[models.main][gun_hold_right]"と"[models.main][gun_hold_left]"で構え方を定義する

---銃を持っていない場合の銃のモデルの扱い
---@alias BlueArchiveCharacter.GunPutType
---| "BODY" アバターのBodyに銃を移動させる
---| "HIDDEN" 銃を隠す

---生徒の配置タイプ
---@alias BlueArchiveCharacter.FormationType
---| "STRIKER" ストライカー（前衛）
---| "SPECIAL" スペシャル（後方支援）

---@class BlueArchiveCharacter （今後別のキャラを作る時に備えて、）キャラクター変数を保持するクラス。別のキャラクターに対してもここを変更するだけで対応できるようにする。
BlueArchiveCharacter = {
	---生徒の基本情報（氏名、誕生日等）
    BASIC = {
        ---生徒の名前
        firstName = {
            ---英語
            ---@type string
            en_us = "Serina",

            ---日本語
            ---@type string
            ja_jp = "セリナ"
        },

        ---生徒の苗字
        lastName = {
            ---英語
            ---@type string
            en_us = "Sumi",

            ---日本語
            ---@type string
            ja_jp = "鷲見"
        },

        ---生徒所属の部活名
        clubName = {
            ---英語
            ---@type string
            en_us = "Rescue Knights",

            ---日本語
            ---@type string
            ja_jp = "救護騎士団",
        },

        ---生徒の誕生日
        birth = {
            ---誕生月
            ---@type integer
            month = 11,

            ---誕生日
            ---@type integer
            day = 6
        }
    },

    ---目や口
    ---パーツ名を鍵として、インデックス1に、デフォルトパーツから見て右にx番目、インデックス2に、デフォルトパーツから見て下にy番目を入力する。
    ---右目と左目については"NORMAL", "CLOSED", "SURPLISED"が必須となる。
    FACE_PARTS = {
        ---右目
        RightEye = {
            NORMAL = {0, 0},
            SURPLISED = {2, 0},
            TIRED = {3, 0},
            CLOSED = {4, 0},
            CLOSED2 = {5, 0},
            INVERTED = {6, 0},
            NARROW = {8, 0}
        },

        ---左目
        LeftEye = {
            NORMAL = {0, 0},
            SURPLISED = {1, 0},
            TIRED = {2, 0},
            CLOSED = {3, 0},
            CLOSED2 = {4, 0},
            INVERTED = {6, 0},
            NARROW = {8, 0}
        },

        ---口
        Mouth = {
            SMILE = {0, 0},
            TIRED = {1, 0},
            OPENED_SMALL = {2, 0},
            OPENED = {3, 0}
        }

        ---表情のセット（省略可）
        --[[
        FacePartsSets = {
            ---ダメージを受けた時の表情（省略可）
            onDamage = {
                RightEye = "SURPLISED",
                LeftEye = "SURPLISED",
                Mouth = "CLOSED"
            }

            ---寝ている時の表情（省略可）
            onSleep = {
                RightEye = "CLOSED",
                LeftEye = "CLOSED",
                Mouth = "CLOSED"
            }
        }
        ]]
    },

    ---腕
    ARMS = {
        ---コールバック関数
        ---@type {[string]: function}
        callbacks = {
            ---右腕の追加処理（任意）
            ---@param state integer 新しい右腕の状態
            onAddtionalRightArmProcess = function (state)
                if state == 4 then
                    models.models.main.Avatar.UpperBody.Arms.RightArm:setParentType("Body")
                    events.TICK:register(function ()
                        if BlueArchiveCharacter.MedicalBoxPos == 0 then
                            Arms:setArmState(0, 0)
                        end
                    end, "right_arm_tick")
                    events.RENDER:register(function (delta, context)
                        local swingPos = (player:getSwingTime() + (player:isSwingingArm() and delta or 0)) / player:getSwingDuration()
                        for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Arms.RightArm, models.models.main.Avatar.UpperBody.Arms.LeftArm}) do
                            modelPart:setRot(swingPos < 0.25 and (360 * swingPos + 40) or (-120 * swingPos + 160), 0, 0)
                        end
                    end, "right_arm_render")
                end
            end,

            ---左腕の追加処理（任意）
            ---@param state integer 新しい左腕の状態
            onAddtionalLeftArmProcess = function (state)
                if state == 4 then
                    models.models.main.Avatar.UpperBody.Arms.LeftArm:setParentType("Body")
                end
            end
        }
    },

    ---スカート
    SKIRT = {
        ---スカートとして制御するモデルの配列
        ---@type ModelPart[]
        SkirtModels = {models.models.main.Avatar.UpperBody.Body.Skirt}
    },

    ---銃
    GUN = {
        ---銃の大きさの倍率（省略可）
        ---@type number
        scale = 1.5,

        ---構えている時
        hold = {
            ---構え方
            ---@type BlueArchiveCharacter.GunHoldType
            type = "NORMAL",

            ---一人称視点での位置オフセット（省略可）
            first_person_pos = {
                ---右手で構える場合（省略可）
                ---@type Vector3
                right = vectors.vec3(0, 1, -4),

                ---左手で構える場合（省略可）
                ---@type Vector3
                left = vectors.vec3(0, 1, -4)
            },

            --[[
            ---一人称視点での向きオフセット（省略可）
            first_person_rot = {
                ---右手で構える場合（省略可）
                ---@type Vector3
                right = vectors.vec3(),

                ---左手で構える場合（省略可）
                ---@type Vector3
                left = vectors.vec3()
            }
            ]]

            ---三人称視点での位置オフセット（省略可）
            third_person_pos = {
                ---右手で構える場合（省略可）
                ---@type Vector3
                right = vectors.vec3(-2, 1, -5),

                ---左手で構える場合（省略可）
                ---@type Vector3
                left = vectors.vec3(2, 1, -5)
            },

            --[[
            ---三人称視点での向きオフセット（省略可）
            third_person_rot = {
                ---右手で構える場合（省略可）
                ---@type Vector3
                right = vectors.vec3(),

                ---左手で構える場合（省略可）
                ---@type Vector3
                left = vectors.vec3()
            }
            ]]

            --[[
            ---装填済みクロスボウの位置オフセット（省略可）
            charged_crossbow_pos = {
                ---右手で構える場合（省略可）
                ---@type Vector3
                right = vectors.vec3(),

                ---左手で構える場合（省略可）
                ---@type Vector3
                left = vectors.vec3()
            }
            ]]

            ---装填済みクロスボウの向きオフセット（省略可）
            --[[
            charged_crossbow_rot = {
                ---右手で構える場合（省略可）
                ---@type Vector3
                right = vectors.vec3(),

                ---左手で構える場合（省略可）
                ---@type Vector3
                left = vectors.vec3()
            }
            ]]
        },

        ---構えていない時
        put = {
            ---構えていない時の銃の扱い方
            ---@type BlueArchiveCharacter.GunPutType
            type = "HIDDEN",

            ---位置オフセット（省略可）
            pos = {
                ---右手で構える場合（省略可）
                ---@type Vector3
                right = vectors.vec3(4.5, -3, 4),

                ---左手で構える場合（省略可）
                ---@type Vector3
                left = vectors.vec3(-4.5, -3, 4)
            },

            ---向きオフセット（省略可）
            rot = {
                ---右手で構える場合（省略可）
                ---@type Vector3
                right = vectors.vec3(-90, 0, 0),

                ---左手で構える場合（省略可）
                ---@type Vector3
                left = vectors.vec3(-90, 0, 0)
            }
        },

        ---射撃音
        sound = {
            ---使用するゲームの音源名
            ---@type Minecraft.soundID
            name = "minecraft:entity.firework_rocket.blast",

            ---音源のピッチ（0.5 ~ 2）
            ---@type number
            pitch = 1
        }

        --[[
        ---利き手が変更された時に呼び出される関数。利き手に応じた銃やアクセサリーの変更に利用できる。
        ---@param direction Gun.HandDirection 新たな利き手
        onMainHandChange = function (direction)
        end
        ]]
    },

    ---設置物
    PLACEMENT_OBJECT = {
        --[[
        ======== データテンプレート ========
        {
            ---設置物として扱うモデル
            ---指定したモデルをコピーして設置物とする。
            ---@type ModelPart
            placementModel = models.models.placement_object.PlacementObject,

            ---設置物の当たり判定
            boundingBox = {
                ---設置物の底の中心点のオフセット位置（任意）。基準点は(0, 0, 0)。
                ---@type Vector3
                offsetPos = vectors.vec3(),

                ---当たり判定の大きさ。BlockBenchでのサイズの値をそのまま入力する。基準点はモデルの底面の中心
                ---@type Vector3
                size = vectors.vec3(8, 8, 8)
            },

            ---設置物の設置モード
            ---@type PlacementObjectManager.PlecementMode
            placementMode = "MOVE",

            ---設置物にかかる重力（任意）。1が標準的な自由落下。0で空中静止。負の数で反重力。
            ---@type number
            gravity = 1,

            ---設置物に火炎耐性を付与するかどうか（任意）。trueにすると炎やマグマで焼かれなくなる。
            ---@type boolean
            hasFireResistance = false,

            ---コールバック関数
            callbacks = {
                ---設置物インスタンスが生成された直後に呼ばれる関数（任意）
                ---@param placementObject table 設置物インスタンス
                onInit = function (placementObject)
                end,

                ---設置物インスタンスが破棄される直前に呼ばれる関数（任意）
                ---@param placementObject table 設置物インスタンス
                onDeinit = function (placementObject)
                end,

                ---各ティック毎に呼ばれる関数（任意）
                ---@param placementObject table 設置物のインスタンス
                onTick = function (placementObject)
                end,

                ---各レンダーティック毎に呼ばれる関数（任意）
                ---@param delta number デルタ値
                ---@param context Event.Render.context レンダーコンテキスト
                ---@param matrix Matrix4 レンダーマトリックス
                ---@param placementObject table 設置物のインスタンス
                onRender = function (delta, context, matrix, placementObject)
                end,

                ---設置物が接地した瞬間に呼ばれる関数（任意）
                ---@param placementObject table 設置物のインスタンス
                onGround = function (placementObject)
                end
            }
        }
        ]]

        {
            ---設置物として扱うモデル
            ---指定したモデルをコピーして設置物とする。
            ---@type ModelPart
            placementModel = models.models.ex_skill_1.MedicalBox,

            ---設置物の当たり判定
            boundingBox = {
                --[[
                ---設置物の底の中心点のオフセット位置（任意）。基準点は(0, 0, 0)。
                ---@type Vector3
                offsetPos = vectors.vec3()
                ]]

                ---当たり判定の大きさ。BlockBenchでのサイズの値をそのまま入力する。基準点はモデルの底面の中心
                ---@type Vector3
                size = vectors.vec3(12, 8, 12)
            },

            ---設置物の設置モード
            ---@type PlacementObjectManager.PlecementMode
            placementMode = "COPY",

            --[[
            ---設置物にかかる重力（任意）。1が標準的な自由落下。0で空中静止。負の数で反重力。
            ---@type number
            gravity = 1
            ]]

            --[[
            ---設置物に火炎耐性を付与するかどうか（任意）。trueにすると炎やマグマで焼かれなくなる。
            ---@type boolean
            hasFireResistance = false
            ]]

            ---コールバック関数
            callbacks = {
                ---設置物インスタンスが生成された直後に呼ばれる関数（任意）
                ---@param placementObject table 設置物インスタンス
                onInit = function (placementObject)
                    placementObject.tick = 0
                end,

                ---各ティック毎に呼ばれる関数（任意）
                ---@param placementObject table 設置物のインスタンス
                onTick = function (placementObject)
                    local targetEntiry = raycast:entity(placementObject.currentPos, placementObject.currentPos:copy():add(0, 0.5, 0))
                    if targetEntiry ~= nil and targetEntiry:isPlayer() then
                        for _ = 1, 50 do
                            particles:newParticle(CompatibilityUtils:checkParticle("minecraft:effect"), placementObject.currentPos):setScale(1.2):setVelocity(vectors.rotateAroundAxis(math.random() * 360, 0, 0, math.random() * 0.25, 0, 1, 0)):setColor(0.961, 0.141, 0.137)
                        end
                        sounds:playSound(CompatibilityUtils:checkSound("minecraft:block.chest.open"), placementObject.currentPos, 1, 2)
                        --host:sendChatCommand("/effect give "..targetEntiry:getName().." minecraft:instant_health 1 1 true")
                        placementObject.remove()
                    else
                        if placementObject.tick % 2 == 0 then
                            particles:newParticle(CompatibilityUtils:checkParticle("minecraft:end_rod"), placementObject.currentPos:copy():add(math.random() - 0.5, math.random(), math.random() - 0.5)):setVelocity(0, 0.1, 0):setColor(1, 0.984, 0.4)
                        end
                        placementObject.tick = placementObject.tick + 1
                    end
                end
            }
        }
    },

	---Exスキル
	EX_SKILL = {
        --[[
        ======== データテンプレート ========
		{
            ---Exスキルの名前
            name = {
                ---英語
                ---日本語名を翻訳したものにする。
                ---@type string
                en_us = "Ex Skill",

                ---日本語
                ---実際のスキルの名前と同じにする。
                ---@type string
                ja_jp = "Exスキル"
            },

            ---Exスキルアニメーション開始時に表示し、Exスキルアニメーション終了時に非表示にするモデルパーツ
            ---@type ModelPart[]
			models = {models.models.main.Avatar},

            ---Exスキルアニメーションが含まれるモデルファイル名
            ---アニメーション名は"ex_skill_<Exスキルのインデックス番号>"にすること。
            ---@type string[]
			animations = {"main"},

            ---Exスキルアニメーションでのカメラワークのデータ
            camera = {
                ---Exスキルアニメーション開始時
                start = {
                    ---カメラの位置
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    pos = vectors.vec3(),

                    ---カメラの向き
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    rot = vectors.vec3()
                },

                ---Exスキルアニメーション終了時
                fin = {
                    ---カメラの位置
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    pos = vectors.vec3(),

                    ---カメラの向き
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    rot = vectors.vec3()
                }
            },

            ---コールバック関数
            callbacks = {
                ---Exスキルアニメーション開始前のトランジション開始前に実行されるコールバック関数（任意）
                ---@type fun()
                preTransition = function()
                end,

                ---Exスキルアニメーション開始前のトランジション終了後に実行されるコールバック関数（任意）
                ---@type fun()
                preAnimation = function()
                end,

                ---Exスキルアニメーション再生中のみ実行されるティック関数
                ---@type fun(tick: integer)
                ---@param tick integer アニメーションの現在位置を示す。単位はティック。
                animationTick = function(tick)
                    --Exスキルアニメーションを任意のティックで停止させるスニペット。デバッグ用。
                    --"<>"内を適切な値で置換すること。
                    if tick == <tick_int> then
                        for _, animation in ipairs(BlueArchiveCharacter.EX_SKILL[<ex_skill_index>].animations) do
                            animations["models."..animation]["ex_skill_"..<ex_skill_index>]:pause()
                        end
                    end
                end,

                ---Exスキルアニメーション終了後のトランジション開始前に実行されるコールバック関数（任意）
                ---@type fun(forcedStop: boolean)
                ---@param forcedStop boolean アニメーションが途中終了した場合は"true"、アニメーションが最後まで再生されて終了した場合は"false"が代入される。
                postAnimation = function(forcedStop)
                end,

                ---Exスキルアニメーション終了後のトランジション終了後に実行されるコールバック関数（任意）
                ---@type fun(forcedStop: boolean)
                ---@param forcedStop boolean アニメーションが途中終了した場合は"true"、アニメーションが最後まで再生されて終了した場合は"false"が代入される。
                postTransition = function(forcedStop)
                end
            }
		}
        ]]

		{
            ---Exスキルの名前
            name = {
                ---英語
                ---日本語名を翻訳したものにする。
                ---@type string
                en_us = "Intensive care set A",

                ---日本語
                ---実際のスキルの名前と同じにする。
                ---@type string
                ja_jp = "集中治療セットA"
            },

            ---Exスキルアニメーション開始時に表示し、Exスキルアニメーション終了時に非表示にするモデルパーツ
            ---@type ModelPart[]
			models = {models.models.main.Avatar.Head.Sweat},

            ---Exスキルアニメーションが含まれるモデルファイル名
            ---アニメーション名は"ex_skill_<Exスキルのインデックス番号>"にすること。
            ---@type string[]
			animations = {"main", "ex_skill_1"},

            ---Exスキルアニメーションでのカメラワークのデータ
            camera = {
                ---Exスキルアニメーション開始時
                start = {
                    ---カメラの位置
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    pos = vectors.vec3(-2.5, 13, -16),

                    ---カメラの向き
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    rot = vectors.vec3(-5, 190, -5)
                },

                ---Exスキルアニメーション終了時
                fin = {
                    ---カメラの位置
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    pos = vectors.vec3(-7, 10, -11),

                    ---カメラの向き
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    rot = vectors.vec3(-20, 210, -30)
                }
            },

            ---コールバック関数
            callbacks = {
                ---Exスキルアニメーション開始前のトランジション終了後に実行されるコールバック関数（任意）
                ---@type fun()
                preAnimation = function()
                    events.RENDER:register(function ()
                        models.models.main.Avatar.Head.Sweat:setOpacity(models.models.main.Avatar.Head.Sweat.SweatOpacity:getAnimScale().x)
                    end, "ex_skill_1_render")
                    PlacementObjectManager:removeAll()
                    models.models.ex_skill_1.MedicalBox:setPos()
                    models.models.ex_skill_1.MedicalBox:setRot()
                    models.models.ex_skill_1.MedicalBox:setScale()
                    models.models.ex_skill_1.MedicalBox:setParentType("None")
                    FaceParts:setEmotion("NORMAL", "NORMAL", "SMILE", 10, true)
                end,

                ---Exスキルアニメーション再生中のみ実行されるティック関数
                ---@type fun(tick: integer)
                ---@param tick integer アニメーションの現在位置を示す。単位はティック。
                animationTick = function(tick)
                    if tick == 10 then
                        FaceParts:setEmotion("CLOSED2", "CLOSED2", "SMILE", 3, true)
                    elseif tick == 13 then
                        FaceParts:setEmotion("CLOSED2", "CLOSED2", "TIRED", 11, true)
                    elseif tick == 15 then
                        particles:newParticle(CompatibilityUtils:checkParticle("minecraft:snowflake"), ModelUtils.getModelWorldPos(models.models.main.Avatar.Head.FaceParts.Mouth)):setScale(0.5):setVelocity(vectors.rotateAroundAxis(player:getBodyYaw() * -1, 0, -0.01, 0.01, 0, 1, 0)):setGravity(0):setLifetime(11)
                        sounds:playSound(CompatibilityUtils:checkSound("minecraft:entity.item.pickup"), player:getPos(), 0.1, 0.7)
                    elseif tick == 24 then
                        FaceParts:setEmotion("NORMAL", "NORMAL", "TIRED", 8, true)
                    elseif tick == 32 then
                        FaceParts:setEmotion("CLOSED2", "CLOSED2", "TIRED", 1, true)
                    elseif tick == 33 then
                        FaceParts:setEmotion("CLOSED2", "CLOSED2", "SMILE", 2, true)
                    elseif tick == 35 then
                        FaceParts:setEmotion("INVERTED", "NORMAL", "SMILE", 32, true)
                        local anchorPos = player:getPos():add(0, 0.8, 0)
                        local bodyYaw = player:getBodyYaw()
                        local isHost = host:isHost()
                        local colorTable = {vectors.vec3(0.337, 1, 1), vectors.vec3(0.984, 1, 0.533)}
                        for _ = 1, 10 do
                            particles:newParticle(CompatibilityUtils:checkParticle("minecraft:end_rod"), anchorPos):setVelocity(vectors.rotateAroundAxis(bodyYaw * -1, (math.random() < 0.5 and (isHost and -0.075 or -0.1) or 0.1) * (math.random() * 0.2 + 0.8), math.random() * 0.2 - 0.05, 0, 0, 1, 0)):setColor(colorTable[math.floor(math.random() * 2) + 1])
                        end
                        sounds:playSound(CompatibilityUtils:checkSound("minecraft:entity.item.pickup"), anchorPos, 1, 1.8)
                    end
                end,

                                ---Exスキルアニメーション終了後のトランジション開始前に実行されるコールバック関数（任意）
                ---@type fun(forcedStop: boolean)
                ---@param forcedStop boolean アニメーションが途中終了した場合は"true"、アニメーションが最後まで再生されて終了した場合は"false"が代入される。
                postAnimation = function(forcedStop)
                    events.RENDER:remove("ex_skill_1_render")
                    if not forcedStop then
                        PlacementObjectManager:place(1, player:getPos():add(vectors.rotateAroundAxis(player:getBodyYaw() * -1, 0, 3, 5, 0, 1, 0)), 0)
                    end
                    models.models.ex_skill_1.MedicalBox:setParentType("Item")
                end
            }
		},

		{
            ---Exスキルの名前
            name = {
                ---英語
                ---日本語名を翻訳したものにする。
                ---@type string
                en_us = "The sound of blessings",

                ---日本語
                ---実際のスキルの名前と同じにする。
                ---@type string
                ja_jp = "祝福の響き"
            },

            ---Exスキルアニメーション開始時に表示し、Exスキルアニメーション終了時に非表示にするモデルパーツ
            ---@type ModelPart[]
			models = {models.models.ex_skill_2.MusicStand},

            ---Exスキルアニメーションが含まれるモデルファイル名
            ---アニメーション名は"ex_skill_<Exスキルのインデックス番号>"にすること。
            ---@type string[]
			animations = {"main", "ex_skill_2"},

            ---Exスキルアニメーションでのカメラワークのデータ
            camera = {
                ---Exスキルアニメーション開始時
                start = {
                    ---カメラの位置
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    pos = vectors.vec3(12, 64.5, 5),

                    ---カメラの向き
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    rot = vectors.vec3(70, 60, 0)
                },

                ---Exスキルアニメーション終了時
                fin = {
                    ---カメラの位置
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    pos = vectors.vec3(-53.2, 17, -5),

                    ---カメラの向き
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    rot = vectors.vec3(-5, 270, 0)
                }
            },

            ---コールバック関数
            callbacks = {
                ---Exスキルアニメーション開始前のトランジション終了後に実行されるコールバック関数（任意）
                ---@type fun()
                preAnimation = function()
                    if not BlueArchiveCharacter.EX_SKILL[2].init then
                        models.models.ex_skill_2.MusicStand.MusicStandBookHolder:newText("music_stand_book_holder"):setText("§7Cherry Berry Merry"):setPos(3, 2.5, -1):setScale(0.03, 0.03, 0.03):setAlignment("CENTER")
                        BlueArchiveCharacter.EX_SKILL[2].init = true
                    end
                    models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell:setPos()
                    models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell:setRot()
                    models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell:setParentType("None")
                    FaceParts:setEmotion("NORMAL", "NORMAL", "SMILE", 17, true)
                end,

                ---Exスキルアニメーション再生中のみ実行されるティック関数
                ---@type fun(tick: integer)
                ---@param tick integer アニメーションの現在位置を示す。単位はティック。
                animationTick = function(tick)
                    if tick == 17 then
                        FaceParts:setEmotion("NORMAL", "INVERTED", "SMILE", 7, true)
                    elseif tick == 24 then
                        FaceParts:setEmotion("CLOSED2", "CLOSED2", "SMILE", 12, true)
                    elseif tick == 36 then
                        FaceParts:setEmotion("NORMAL", "NORMAL", "OPENED_SMALL", 5, true)
                    elseif tick == 41 then
                        FaceParts:setEmotion("CLOSED", "CLOSED", "SMILE", 4, true)
                    elseif tick == 45 then
                        FaceParts:setEmotion("CLOSED", "CLOSED", "OPENED", 14, true)
                    elseif tick == 59 then
                        FaceParts:setEmotion("CLOSED", "CLOSED", "SMILE", 6, true)
                    elseif tick == 65 then
                        FaceParts:setEmotion("NORMAL", "NORMAL", "SMILE", 5, true)
                    elseif tick == 70 then
                        FaceParts:setEmotion("NARROW", "NARROW", "SMILE", 44, true)
                    end
                end,

                ---Exスキルアニメーション終了後のトランジション開始前に実行されるコールバック関数（任意）
                ---@type fun(forcedStop: boolean)
                ---@param forcedStop boolean アニメーションが途中終了した場合は"true"、アニメーションが最後まで再生されて終了した場合は"false"が代入される。
                postAnimation = function(forcedStop)
                    models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell:setParentType("Item")
                end
            },

            ---初期化処理がされたかどうか
            ---@type boolean
            init = false
		}
	},


	---コスチューム
	COSTUME = {
        ---コスチュームのデータ
        ---コスチュームの内部名をインデックスとする。
        costumes = {
            --[[
            ======== データテンプレート ========
            costume_name = {
                ---コスチュームの内部名
                ---@type string
                name = "costume_name"

                ---コスチュームの表示名
                display_name = {
                    ---英語
                    ---@type string
                    en_us = "Costume",

                    ---日本語
                    ---@type string
                    ja_jp = "コスチューム"
                },

                ---この衣装での生徒の配置タイプ
                ---@type BlueArchiveCharacter.FormationType
                formationType = "STRIKER",

                ---コスチュームに対応するExスキルのインデックス番号
                ---@type integer
                exSkill = 1,

                ---コスチュームに対応するサブExスキルのインデックス番号（任意）
                ---@type integer
                subExSkill = 1
            }
            ]]

            {
                ---コスチュームの内部名
                ---@type string
                name = "default",

                ---コスチュームの表示名
                display_name = {
                    ---英語
                    ---@type string
                    en_us = "Default",

                    ---日本語
                    ---@type string
                    ja_jp = "デフォルト"
                },

                ---この衣装での生徒の配置タイプ
                ---@type BlueArchiveCharacter.FormationType
                formationType = "SPECIAL",

                ---コスチュームに対応するExスキルのインデックス番号
                ---@type integer
                exSkill = 1
            },

            {
                ---コスチュームの内部名
                ---@type string
                name = "christmas",

                ---コスチュームの表示名
                display_name = {
                    ---英語
                    ---@type string
                    en_us = "Christmas",

                    ---日本語
                    ---@type string
                    ja_jp = "クリスマス"
                },

                ---この衣装での生徒の配置タイプ
                ---@type BlueArchiveCharacter.FormationType
                formationType = "STRIKER",

                ---コスチュームに対応するExスキルのインデックス番号
                ---@type integer
                exSkill = 2,

                ---衣装の初期化処理がされたかどうか
                ---@type boolean
                init = false,

                ---クリスマスシーズン（12/24 ~ 12/26）はtrueにする。
                ---@type boolean
                isChristmas = false,

                ---ハンドベルの音の高さを決める値
                ---普段は0固定だが、クリスマスシーズン（12/24 ~ 12/26）のみ、初期値を1とし、ベルを鳴らす度にインクリメントする。
                ---普段の音は固定だが、クリスマスシーズンのみは曲になるようにする。
                ---@type integer
                bellStage = 0
            }
        },

        ---コールバック関数
        callbacks = {
            ---衣装が変更された時に実行されるコールバック関数
            ---デフォルトの衣装はここに含めない。
            ---@type fun(costumeId: integer)
            ---@param costumeId integer 新たな衣装のインデックス番号
            change = function(costumeId)
                events.ITEM_RENDER:remove("medical_box_item_render")
                Costume.setCostumeTextureOffset(1)
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
                if not BlueArchiveCharacter.COSTUME.costumes[2].init then
                    for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell.Handbell1_Top, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell.Handbell2_Top}) do
                        modelPart:setPrimaryTexture("RESOURCE", "minecraft:textures/block/bell_top.png")
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell.Handbell1_Side, models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell.Handbell2_Side}) do
                        modelPart:setPrimaryTexture("RESOURCE", "minecraft:textures/block/bell_side.png")
                    end
                    models.models.main.Avatar.UpperBody.Arms.LeftArm.LeftArmBottom.Handbell.Handbell2_Bottom:setPrimaryTexture("RESOURCE", "minecraft:textures/block/bell_bottom.png")
                    BlueArchiveCharacter.COSTUME.costumes[2].init = true
                end
                local today = client:getDate()
                BlueArchiveCharacter.COSTUME.costumes[2].isChristmas = today.month == 12 and today.day >= 24 and today.day <= 26
                --BlueArchiveCharacter.COSTUME.costumes[2].isChristmas = true
                BlueArchiveCharacter.COSTUME.costumes[2].bellStage = BlueArchiveCharacter.COSTUME.costumes[2].isChristmas and 1 or 0
                events.TICK:register(function ()
                    local isHoldingBell = player:getHeldItem().id == "minecraft:bell"
                    local targetBlock = player:getTargetedBlock(true, 4.5)
                    if player:isSwingingArm() and isHoldingBell and player:getSwingTime() == 0 and (targetBlock.id == "minecraft:air" or targetBlock.id == "minecraft:cave_air" or targetBlock.id == "minecraft:void_air") then
                        local pitch = 1.259921
                        if (BlueArchiveCharacter.COSTUME.costumes[2].bellStage >= 1 and BlueArchiveCharacter.COSTUME.costumes[2].bellStage <= 7) or BlueArchiveCharacter.COSTUME.costumes[2].bellStage == 11 or (BlueArchiveCharacter.COSTUME.costumes[2].bellStage >= 17 and BlueArchiveCharacter.COSTUME.costumes[2].bellStage <= 19) or (BlueArchiveCharacter.COSTUME.costumes[2].bellStage >= 26 and BlueArchiveCharacter.COSTUME.costumes[2].bellStage <= 32) or BlueArchiveCharacter.COSTUME.costumes[2].bellStage == 36 or (BlueArchiveCharacter.COSTUME.costumes[2].bellStage >= 42 and BlueArchiveCharacter.COSTUME.costumes[2].bellStage <= 44) then
                            --ラ
                            pitch = 1.189207
                        elseif BlueArchiveCharacter.COSTUME.costumes[2].bellStage == 8 or BlueArchiveCharacter.COSTUME.costumes[2].bellStage == 25 or BlueArchiveCharacter.COSTUME.costumes[2].bellStage == 33 or (BlueArchiveCharacter.COSTUME.costumes[2].bellStage >= 45 and BlueArchiveCharacter.COSTUME.costumes[2].bellStage <= 46) then
                            --ド
                            pitch = 1.414214
                        elseif BlueArchiveCharacter.COSTUME.costumes[2].bellStage == 9 or BlueArchiveCharacter.COSTUME.costumes[2].bellStage == 23 or BlueArchiveCharacter.COSTUME.costumes[2].bellStage == 34 or BlueArchiveCharacter.COSTUME.costumes[2].bellStage == 49 then
                            --ファ
                            pitch = 0.943874
                        elseif BlueArchiveCharacter.COSTUME.costumes[2].bellStage == 10 or (BlueArchiveCharacter.COSTUME.costumes[2].bellStage >= 20 and BlueArchiveCharacter.COSTUME.costumes[2].bellStage <= 22) or BlueArchiveCharacter.COSTUME.costumes[2].bellStage == 24 or BlueArchiveCharacter.COSTUME.costumes[2].bellStage == 35 or BlueArchiveCharacter.COSTUME.costumes[2].bellStage == 48 then
                            --ソ
                            pitch = 1.059463
                        elseif BlueArchiveCharacter.COSTUME.costumes[2].bellStage == 50 then
                            --ファ↑
                            pitch = 1.887749
                        end
                        sounds:playSound("minecraft:block.note_block.chime", player:getPos(), 1, pitch)
                        if BlueArchiveCharacter.COSTUME.costumes[2].isChristmas then
                            BlueArchiveCharacter.COSTUME.costumes[2].bellStage = BlueArchiveCharacter.COSTUME.costumes[2].bellStage + 1
                            if BlueArchiveCharacter.COSTUME.costumes[2].bellStage == 51 then
                                BlueArchiveCharacter.COSTUME.costumes[2].bellStage = 1
                            end
                        else
                            BlueArchiveCharacter.COSTUME.costumes[2].bellStage = 0
                        end
                    elseif not isHoldingBell then
                        BlueArchiveCharacter.COSTUME.costumes[2].bellStage = BlueArchiveCharacter.COSTUME.costumes[2].isChristmas and 1 or 0
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
            end,

            ---衣装がリセットされた時に実行されるコールバック関数
            ---あらゆる衣装からデフォルトの衣装へ推移できるようにする。
            ---@type fun()
            reset = function()
                events.TICK:remove("costume_christmas_hand_bell_tick")
                events.ITEM_RENDER:remove("costume_christmas_hand_bell_item_render")
                Costume.setCostumeTextureOffset(0)
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
                    events.ITEM_RENDER:register(BlueArchiveCharacter.MedicalBoxItemRender, "medical_box_item_render")
                end
            end,

            ---防具が変更された（防具が見える/見えない）時に実行されるコールバック関数
            ---@type fun(index: integer)
            ---@param parts Armor.ArmorPart 変更された防具の部位
            armorChange = function(parts)
                if parts == "HELMET" then
                    models.models.main.Avatar.Head.NurseCap:setVisible(not Armor.ArmorVisible[1])
                elseif parts == "CHEST_PLATE" then
                    models.models.main.Avatar.UpperBody.Body.Bag:setVisible(not Armor.ArmorVisible[2])
                elseif parts == "LEGGINGS" then
                    models.models.main.Avatar.UpperBody.Body.Skirt:setVisible(not Armor.ArmorVisible[3])
                end
            end
        }
	},

    ---吹き出しエモートガイド
    BUBBLE = {
        callbacks = {
            ---吹き出しエモートが再生された時に実行されるコールバック関数（任意）
            ---@type fun(type: Bubble.BubbleType)
            ---@param type Bubble.BubbleType 再生された吹き出しアニメーションの種類
            ---@param duration integer 吹き出しを再生する時間。-1は時間無制限を示す。
            ---@param showInGui boolean 一人称用にGUIに吹き出しを表示するかどうか
            onPlay = function(type, duration, showInGui)
            end,

            ---吹き出しアニメーション終了時に実行されるコールバック関数（任意）
            ---@type fun(type: Bubble.BubbleType, forcedStop: boolean)
            ---@param type Bubble.BubbleType 再生された吹き出しエモートの種類
            ---@param forcedStop boolean 吹き出しエモートが途中終了した場合は"true"、吹き出しエモートが最後まで再生されて終了した場合は"false"が代入される。
            onStop = function(type, forcedStop)
            end
        }
    },

    ---頭ブロック
    HEAD_BLOCK = {
        ---頭以外のモデルパーツで頭ブロックにアタッチしたいモデルパーツを配列形式で列挙する。
        ---@type ModelPart[]
        includeModels = {},

        ---頭のモデルパーツで頭ブロックから除外したいモデルパーツを配列形式で列挙する。
        ---@type ModelPart[]
        excludeModels = {}

        --[[
        ---モデルのコピー直前に実行される関数（省略可）
        onBeforeModelCopy = function ()
        end
        ]]

        --[[
        ---モデルのコピー直後に実行される関数（省略可）
        onAfterModelCopy = function ()
        end
        ]]
    },

    ---ポートレート
    PORTRAIT = {
        ---頭以外のモデルパーツでポートレートにアタッチしたいモデルパーツを配列形式で列挙する。
        ---@type ModelPart[]
        includeModels = {},

        ---頭のモデルパーツでポートレートから除外したいモデルパーツを配列形式で列挙する。
        ---@type ModelPart[]
        excludeModels = {}

        --[[
        ---モデルのコピー直前に実行される関数（省略可）
        onBeforeModelCopy = function ()
        end
        ]]

        --[[
        ---モデルのコピー直後に実行される関数（省略可）
        onAfterModelCopy = function ()
        end
        ]]
    },

    ---死亡アニメーションのダミーアバター
    DEATH_ANIMATION = {
        ---ダミーアバターから除外したいモデルパーツを配列形式で列挙する。
        ---@type ModelPart[]
        excludeModels = {},

        ---死亡アニメーションが再生された直後に実行される関数（省略可）
        ---@param dummyAvatar ModelPart ダミーアバターのルート
        ---@param costume integer ダミーアバターのコスチュームのインデックス
        onPhase1 = function (dummyAvatar, costume)
            for _, modelPart in ipairs({dummyAvatar.Head.HairTail, dummyAvatar.Head.HairTailRibbon.HairTailRibbonTip1, dummyAvatar.Head.HairTailRibbon.HairTailRibbonTip2, dummyAvatar.UpperBody.Body.Skirt}) do
                modelPart:setRot(30, 0, 0)
            end
            dummyAvatar.Head.Feather:setRot(55, 0, 0)
        end,

        ---ダミーアバターが縄ばしごにつかまった直後に実行される関数（省略可）
        ---@param dummyAvatar ModelPart ダミーアバターのルート
        ---@param costume integer ダミーアバターのコスチュームのインデックス
        onPhase2 = function (dummyAvatar, costume)
            for _, modelPart in ipairs({dummyAvatar.Head.HairTail, dummyAvatar.Head.HairTailRibbon.HairTailRibbonTip1, dummyAvatar.Head.HairTailRibbon.HairTailRibbonTip2}) do
                modelPart:setRot(-20, 0, 0)
            end
            dummyAvatar.LowerBody.Legs.RightLeg.RightLegBottom:setPivot(2, 6, -2)
            dummyAvatar.Head.Feather:setRot(-20, 0, 0)
        end

        --[[
        ---モデルのコピー直前に実行される関数（省略可）
        onBeforeModelCopy = function ()
        end
        ]]

        --[[
        ---モデルのコピー直後に実行される関数（省略可）
        onAfterModelCopy = function ()
        end
        ]]
    },

    ---アクションホイールに関わる設定
    ACTION_WHEEL = {
        ---乗り物のモデル置き換えオプションを有効にするかどうか。
        ---@type boolean
        vehicleOptionEnabled = false
    },

    ---物理演算
    PHYSICS = {
        data = {
            --[[
            ======== データテンプレート ========
            {
                ---この物理演算データを適用させるモデルパーツ
                ---@type ModelPart | ModelPart[]
                modelPart = models.models.main.Avatar,

                ---x軸回転における物理演算データ（省略可）
                x = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = 0,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 0,

                        ---スニーク時にこのモデルパーツの回転に加えられるオフセット値（省略可）
                        ---@type number
                        sneakOffset = 0,

                        ---頭の縦方向の回転と共にこのモデルパーツの回転に加えられる値の倍率（省略可）
                        ---@type number
                        headRotMultiplayer = 0,

                        ---頭を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        headX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---頭を基準とした、左右方向移動によるモデルパーツの回転データ（省略可）
                        headZ = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---頭の回転によるによるモデルパーツの回転データ（省略可）
                        headRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        bodyX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、上下方向移動によるモデルパーツの回転データ（省略可）
                        bodyY = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、左右方向移動によるモデルパーツの回転データ（省略可）
                        bodyZ = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体の回転によるによるモデルパーツの回転データ（省略可）
                        bodyRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        }
                    },

                    ---体が水平方向である時（水泳時、エリトラ飛行時）の物理演算データ（省略可）
                    horizontal = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = 0,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 0,

                        ---スニーク時にこのモデルパーツの回転に加えられるオフセット値（省略可）
                        ---@type number
                        sneakOffset = 0,

                        ---頭の縦方向の回転と共にこのモデルパーツの回転に加えられる値の倍率（省略可）
                        ---@type number
                        headRotMultiplayer = 0,

                        ---頭を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        headX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---頭を基準とした、左右方向移動によるモデルパーツの回転データ（省略可）
                        headZ = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---頭の回転によるによるモデルパーツの回転データ（省略可）
                        headRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        bodyX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、上下方向移動によるモデルパーツの回転データ（省略可）
                        bodyY = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、左右方向移動によるモデルパーツの回転データ（省略可）
                        bodyZ = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体の回転によるによるモデルパーツの回転データ（省略可）
                        bodyRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        }
                    }
                },

                ---y軸回転における物理演算データ（省略可）
                y = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = 0,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 0,

                        ---スニーク時にこのモデルパーツの回転に加えられるオフセット値（省略可）
                        ---@type number
                        sneakOffset = 0,

                        ---頭の縦方向の回転と共にこのモデルパーツの回転に加えられる値の倍率（省略可）
                        ---@type number
                        headRotMultiplayer = 0,

                        ---頭を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        headX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---頭を基準とした、左右方向移動によるモデルパーツの回転データ（省略可）
                        headZ = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---頭の回転によるによるモデルパーツの回転データ（省略可）
                        headRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        bodyX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、上下方向移動によるモデルパーツの回転データ（省略可）
                        bodyY = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、左右方向移動によるモデルパーツの回転データ（省略可）
                        bodyZ = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体の回転によるによるモデルパーツの回転データ（省略可）
                        bodyRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        }
                    },

                    ---体が水平方向である時（水泳時、エリトラ飛行時）の物理演算データ（省略可）
                    horizontal = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = 0,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 0,

                        ---スニーク時にこのモデルパーツの回転に加えられるオフセット値（省略可）
                        ---@type number
                        sneakOffset = 0,

                        ---頭の縦方向の回転と共にこのモデルパーツの回転に加えられる値の倍率（省略可）
                        ---@type number
                        headRotMultiplayer = 0,

                        ---頭を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        headX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---頭を基準とした、左右方向移動によるモデルパーツの回転データ（省略可）
                        headZ = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---頭の回転によるによるモデルパーツの回転データ（省略可）
                        headRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        bodyX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、上下方向移動によるモデルパーツの回転データ（省略可）
                        bodyY = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、左右方向移動によるモデルパーツの回転データ（省略可）
                        bodyZ = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体の回転によるによるモデルパーツの回転データ（省略可）
                        bodyRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        }
                    }
                },

                ---z軸回転における物理演算データ（省略可）
                z = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = 0,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 0,

                        ---スニーク時にこのモデルパーツの回転に加えられるオフセット値（省略可）
                        ---@type number
                        sneakOffset = 0,

                        ---頭の縦方向の回転と共にこのモデルパーツの回転に加えられる値の倍率（省略可）
                        ---@type number
                        headRotMultiplayer = 0,

                        ---頭を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        headX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---頭を基準とした、左右方向移動によるモデルパーツの回転データ（省略可）
                        headZ = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---頭の回転によるによるモデルパーツの回転データ（省略可）
                        headRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        bodyX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、上下方向移動によるモデルパーツの回転データ（省略可）
                        bodyY = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、左右方向移動によるモデルパーツの回転データ（省略可）
                        bodyZ = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体の回転によるによるモデルパーツの回転データ（省略可）
                        bodyRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        }
                    },

                    ---体が水平方向である時（水泳時、エリトラ飛行時）の物理演算データ（省略可）
                    horizontal = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = 0,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 0,

                        ---スニーク時にこのモデルパーツの回転に加えられるオフセット値（省略可）
                        ---@type number
                        sneakOffset = 0,

                        ---頭の縦方向の回転と共にこのモデルパーツの回転に加えられる値の倍率（省略可）
                        ---@type number
                        headRotMultiplayer = 0,

                        ---頭を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        headX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---頭を基準とした、左右方向移動によるモデルパーツの回転データ（省略可）
                        headZ = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---頭の回転によるによるモデルパーツの回転データ（省略可）
                        headRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        bodyX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、上下方向移動によるモデルパーツの回転データ（省略可）
                        bodyY = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、左右方向移動によるモデルパーツの回転データ（省略可）
                        bodyZ = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体の回転によるによるモデルパーツの回転データ（省略可）
                        bodyRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        }
                    }
                }
            }
            ]]

            {
                ---この物理演算データを適用させるモデルパーツ
                ---@type ModelPart | ModelPart[]
                modelPart = {models.models.main.Avatar.Head.HairTail, models.models.main.Avatar.Head.HairTailRibbon.HairTailRibbonTip1, models.models.main.Avatar.Head.HairTailRibbon.HairTailRibbonTip2},

                ---z軸回転における物理演算データ（省略可）
                x = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -90,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 90,

                        ---頭の縦方向の回転と共にこのモデルパーツの回転に加えられる値の倍率（省略可）
                        ---@type number
                        headRotMultiplayer = -1,

                        ---頭を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        headX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -80,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -90,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 90
                        }
                    },

                    ---体が水平方向である時（水泳時、エリトラ飛行時）の物理演算データ（省略可）
                    horizontal = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -45,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 45,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 45,

                        ---頭を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        headX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -80,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -45,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 45
                        }
                    }
                }
            },

            {
                ---この物理演算データを適用させるモデルパーツ
                ---@type ModelPart | ModelPart[]
                modelPart = models.models.main.Avatar.Head.HairTail.HairTailZPivot,

                ---z軸回転における物理演算データ（省略可）
                z = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -60,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = -5,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 0,

                        ---頭を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        headZ = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -80,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -60,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---頭の回転によるによるモデルパーツの回転データ（省略可）
                        headRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0.05,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -60,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---頭を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        bodyY = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 80,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -60,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        }
                    }
                }
            },

            {
                ---この物理演算データを適用させるモデルパーツ
                ---@type ModelPart | ModelPart[]
                modelPart = {models.models.main.Avatar.Head.HairTailRibbon.HairTailRibbonTip1.HairTailRibbonTip1ZPivot, models.models.main.Avatar.Head.HairTailRibbon.HairTailRibbonTip2.HairTailRibbonTip2ZPivot},

                ---z軸回転における物理演算データ（省略可）
                z = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -150,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = -5,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 0,

                        ---頭を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        headZ = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -160,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -80,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---頭の回転によるによるモデルパーツの回転データ（省略可）
                        headRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0.1,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -80,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---頭を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        bodyY = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 160,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -150,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        }
                    }
                }
            },

            {
                ---この物理演算データを適用させるモデルパーツ
                ---@type ModelPart | ModelPart[]
                modelPart = models.models.main.Avatar.Head.Feather,

                ---z軸回転における物理演算データ（省略可）
                x = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -90,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 90,

                        ---頭の縦方向の回転と共にこのモデルパーツの回転に加えられる値の倍率（省略可）
                        ---@type number
                        headRotMultiplayer = -1,

                        ---頭を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        headX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -120,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -90,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 90
                        }
                    },

                    ---体が水平方向である時（水泳時、エリトラ飛行時）の物理演算データ（省略可）
                    horizontal = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -45,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 45,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 45,

                        ---頭を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        headX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -120,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -45,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 45
                        }
                    }
                }
            },

            {
                ---この物理演算データを適用させるモデルパーツ
                ---@type ModelPart | ModelPart[]
                modelPart = models.models.main.Avatar.Head.Feather.FeatherZPivot,

                ---z軸回転における物理演算データ（省略可）
                z = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -160,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 75,

                        ---頭を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        headZ = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -120,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -80,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 75
                        },

                        ---頭の回転によるによるモデルパーツの回転データ（省略可）
                        headRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0.075,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -80,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 75
                        },

                        ---頭を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        bodyY = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 120,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -160,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        }
                    }
                }
            }
        }

        --[[
        ---物理演算処理後に実行されるコールバック関数（省略可）。ここでモデルパーツの向きを上書きできる。
        ---@param modelPart ModelPart 物理演算が処理されたモデルパーツ
        callback = function (modelPart)
        end
        ]]
    },

    --その他定数・変数

    ---救急箱の位置：0. 持っていない, 1. メインハンドに持っている, 2. オフハンドに持っている
    ---@type integer
    MedicalBoxPos = 0,

    ---@param item ItemStack
    ---@param mode Event.ItemRender.renderType
    ---@param pos Vector3
    ---@param rot Vector3
    ---@param scale Vector3
    ---@param lefthanded boolean
    MedicalBoxItemRender = function (item, mode, pos, rot, scale, lefthanded)
        local isLeftHanded = player:isLeftHanded()
        if (isLeftHanded and BlueArchiveCharacter.MedicalBoxPos == 2) or (not isLeftHanded and BlueArchiveCharacter.MedicalBoxPos == 1) then
            --右手に救急箱を持つ
            if mode == "THIRD_PERSON_RIGHT_HAND" then
                models.models.ex_skill_1.MedicalBox:setPos(-5.5, -4, 0)
                models.models.ex_skill_1.MedicalBox:setRot(45, 0, 0)
                models.models.ex_skill_1.MedicalBox:setScale(0.8, 0.8, 0.8)
                return models.models.ex_skill_1.MedicalBox
            elseif mode == "FIRST_PERSON_RIGHT_HAND" and Gun.ShowWeaponInFirstPerson then
                models.models.ex_skill_1.MedicalBox:setPos(-9, -3, 0)
                models.models.ex_skill_1.MedicalBox:setRot(0, 0, 0)
                models.models.ex_skill_1.MedicalBox:setScale(0.8, 0.8, 0.8)
                return models.models.ex_skill_1.MedicalBox
            end
        elseif (isLeftHanded and BlueArchiveCharacter.MedicalBoxPos == 1) or (not isLeftHanded and BlueArchiveCharacter.MedicalBoxPos == 2) then
            --左手に救急箱を持つ
            if mode == "THIRD_PERSON_LEFT_HAND" then
                models.models.ex_skill_1.MedicalBox:setPos(5.5, -4, 0)
                models.models.ex_skill_1.MedicalBox:setRot(45, 0, 0)
                models.models.ex_skill_1.MedicalBox:setScale(0.8, 0.8, 0.8)
                return models.models.ex_skill_1.MedicalBox
            elseif mode == "FIRST_PERSON_LEFT_HAND" and Gun.ShowWeaponInFirstPerson then
                models.models.ex_skill_1.MedicalBox:setPos(9, -3, 0)
                models.models.ex_skill_1.MedicalBox:setRot(0, 0, 0)
                models.models.ex_skill_1.MedicalBox:setScale(0.8, 0.8, 0.8)
                return models.models.ex_skill_1.MedicalBox
            end
        end
    end
}

--生徒固有初期化処理

events.ENTITY_INIT:register(function ()
    events.TICK:register(function ()
        if Gun.CurrentGunPosition == "NONE" and ExSkill.AnimationCount == -1 and Costume.CurrentCostume == 1 then
            local healingPotionPos = 0
            for i = 1, 2 do
                local heldItem = player:getHeldItem(i == 2)
                if (heldItem.id == "minecraft:potion" or heldItem.id == "minecraft:splash_potion" or heldItem.id == "minecraft:lingering_potion") and heldItem.tag.Potion ~= nil and heldItem.tag.Potion:match("minecraft:.*healing") ~= nil then
                    healingPotionPos = i
                    break
                end
            end
            BlueArchiveCharacter.MedicalBoxPos = healingPotionPos
        else
            BlueArchiveCharacter.MedicalBoxPos = 0
        end
        if BlueArchiveCharacter.MedicalBoxPos > 0 and Arms.ArmState.right ~= 4 then
            Arms:setArmState(4, 4)
        end
    end)
    if Costume.CurrentCostume == 1 then
        events.ITEM_RENDER:register(BlueArchiveCharacter.MedicalBoxItemRender, "medical_box_item_render")
    end
end)

return BlueArchiveCharacter