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
            en_us = "Mari",

            ---日本語
            ---@type string
            ja_jp = "マリー"
        },

        ---生徒の苗字
        lastName = {
            ---英語
            ---@type string
            en_us = "Iochi",

            ---日本語
            ---@type string
            ja_jp = "伊落"
        },

        ---生徒所属の部活名
        clubName = {
            ---英語
            ---@type string
            en_us = "Sisterhood",

            ---日本語
            ---@type string
            ja_jp = "シスターフッド",
        },

        ---生徒の誕生日
        birth = {
            ---誕生月
            ---@type integer
            month = 9,

            ---誕生日
            ---@type integer
            day = 12
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
            NARROW1 = {5, 0},
            NARROW2 = {0, 1},
            CLOSED2 = {1, 1},
            INVERTED = {2, 1},
            TEAR = {4, 1},
            UNEQUAL = {5, 1}
        },

        ---左目
        LeftEye = {
            NORMAL = {0, 0},
            SURPLISED = {1, 0},
            TIRED = {2, 0},
            CLOSED = {3, 0},
            NARROW1 = {5, 0},
            NARROW2 = {-1, 1},
            CLOSED2 = {0, 1},
            INVERTED = {2, 1},
            TEAR = {3, 1},
            UNEQUAL = {4, 1}
        },

        ---口
        Mouth = {
            STRAIGHT = {1, 0},
            SMILE = {0, 1},
            OPENED = {1, 1},
            ANXIOUS = {2, 1},
            TRIANGLE = {3, 1},
            TRIANGLE2 = {0, 2},
            TIRED = {1, 2},
            OPENED2 = {0, 3},
            SMALL = {1, 3}
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
            --[[
            ---腕の状態が変更された際のコールバック関数（任意）
            ---@param right integer 新しい右腕の状態
            ---@param left integer 新しい左腕の状態
            ---@return {right?: integer, left?: integer}|nil overriddenArmState 返した値で腕の状態を上書きできる。
            onArmStateChanged = function (right, left)
            end
            ]]

            --[[
            ---右腕の追加処理（任意）
            ---@param state integer 新しい右腕の状態
            onAddtionalRightArmProcess = function (state)
            end
            ]]

            --[[
            ---左腕の追加処理（任意）
            ---@param state integer 新しい左腕の状態
            onAddtionalLeftArmProcess = function (state)
            end
            ]]
        }
    },

    ---スカート
    SKIRT = {
        ---スカートとして制御するモデルの配列
        ---@type ModelPart[]
        SkirtModels = {models.models.main.Avatar.UpperBody.Body.Robe, models.models.main.Avatar.UpperBody.Body.CIdolB.Skirt}
    },

    ---銃
    GUN = {
        ---銃の大きさの倍率（省略可）
        ---@type number
        scale = 0.75,

        ---構えている時
        hold = {
            ---構え方
            ---@type BlueArchiveCharacter.GunHoldType
            type = "NORMAL",

            ---一人称視点での位置オフセット（省略可）
            first_person_pos = {
                ---右手で構える場合（省略可）
                ---@type Vector3
                right = vectors.vec3(-0.5, 0, -5),

                ---左手で構える場合（省略可）
                ---@type Vector3
                left = vectors.vec3(1, 0, -5)
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
                right = vectors.vec3(0, -0.5, -5),

                ---左手で構える場合（省略可）
                ---@type Vector3
                left = vectors.vec3(0, -0.5, -5)
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
                right = vectors.vec3(-8.1, 1, 1.6),

                ---左手で構える場合（省略可）
                ---@type Vector3
                left = vectors.vec3(8.25, 1, 0)
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

            --[[
            ---位置オフセット（省略可）
            pos = {
                ---右手で構える場合（省略可）
                ---@type Vector3
                right = vectors.vec3(4.5, -3, 4),

                ---左手で構える場合（省略可）
                ---@type Vector3
                left = vectors.vec3(-4.5, -3, 4)
            }
            ]]

            --[[
            ---向きオフセット（省略可）
            rot = {
                ---右手で構える場合（省略可）
                ---@type Vector3
                right = vectors.vec3(-90, 0, 0),

                ---左手で構える場合（省略可）
                ---@type Vector3
                left = vectors.vec3(-90, 0, 0)
            }
            ]]
        },

        ---射撃音
        sound = {
            ---使用するゲームの音源名
            ---@type Minecraft.soundID
            name = "minecraft:entity.iron_golem.hurt",

            ---音源のピッチ（0.5 ~ 2）
            ---@type number
            pitch = 2
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
                en_us = "Holy Blessing",

                ---日本語
                ---実際のスキルの名前と同じにする。
                ---@type string
                ja_jp = "聖なる加護"
            },

            ---Exスキルアニメーション開始時に表示し、Exスキルアニメーション終了時に非表示にするモデルパーツ
            ---@type ModelPart[]
			models = {},

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
                    pos = vectors.vec3(25, 25, -21),

                    ---カメラの向き
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    rot = vectors.vec3(0, 150, -3)
                },

                ---Exスキルアニメーション終了時
                fin = {
                    ---カメラの位置
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    pos = vectors.vec3(0, 23, -36),

                    ---カメラの向き
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    rot = vectors.vec3(0, 180)
                }
            },

            ---コールバック関数
            callbacks = {
                ---Exスキルアニメーション再生中のみ実行されるティック関数
                ---@type fun(tick: integer)
                ---@param tick integer アニメーションの現在位置を示す。単位はティック。
                animationTick = function(tick)
                    if tick == 0 then
                        FaceParts:setEmotion("NORMAL", "NORMAL", "STRAIGHT", 14, true)
                    elseif tick == 5 then
                        local anchorPos = ModelUtils.getModelWorldPos(models.models.main.Avatar.ExSkill1ParticleAnchor1)
                        local bodyYaw = player:getBodyYaw()
                        for _ = 1, 30 do
                            particles:newParticle(CompatibilityUtils:checkParticle("minecraft:cherry_leaves"), anchorPos:copy():add(math.random() - 0.5, math.random() * 2 - 1, math.random() - 0.5)):setColor(0.2, 1, 0.2):setVelocity(vectors.rotateAroundAxis(-bodyYaw, 0.1, 0, 0, 0, 1, 0))
                        end
                    elseif tick == 14 then
                        FaceParts:setEmotion("NARROW1", "NARROW1", "STRAIGHT", 2, true)
                    elseif tick == 16 then
                        FaceParts:setEmotion("NARROW2", "NARROW2", "STRAIGHT", 2, true)
                    elseif tick == 18 then
                        FaceParts:setEmotion("CLOSED2", "CLOSED2", "STRAIGHT", 66, true)
                    elseif tick == 59 then
                        local playerPos = player:getPos()
                        for _ = 1, 100 do
                            particles:newParticle(CompatibilityUtils.getDustParticleId(vectors.vec3(100000000, 100000000, 100000000), 1), playerPos:copy():add(math.random() * 4 - 2, 0, math.random() * 4 - 2)):setLifetime(100):setVelocity()
                        end
                        local anchorPos = ModelUtils.getModelWorldPos(models.models.main.Avatar.ExSkill1ParticleAnchor3)
                        local bodyYaw = player:getBodyYaw()
                        for _ = 1, 50 do
                            particles:newParticle(CompatibilityUtils.getDustParticleId(vectors.vec3(100000000, 100000000, 100000000), 1), anchorPos:copy():add(vectors.rotateAroundAxis(-bodyYaw, vectors.rotateAroundAxis(math.random() * 360, 0, 1.25, 0, 0, 0, 1), 0, 1, 0))):setLifetime(40):setVelocity(vectors.rotateAroundAxis(-bodyYaw, 0, 0, math.random() * 0.1 + 0.05, 0, 1, 0))
                        end
                        sounds:playSound(CompatibilityUtils:checkSound("minecraft:block.beacon.activate"), playerPos, 1, 1.5)
                    end
                    if tick >= 24 then
                        local anchorPos = ModelUtils.getModelWorldPos(models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.ExSkill1ParticleAnchor2)
                        for _ = 1, 2 do
                            particles:newParticle(CompatibilityUtils:checkParticle("minecraft:wax_off"), anchorPos:copy():add(math.random() * 0.4 - 0.2, 0, math.random() * 0.4 - 0.2)):setScale(0.15):setVelocity(0, math.random() * 0.025, 0):setColor(1, 1, 0.875)
                        end
                    end
                    if tick % 3 == 0 and tick <= 50 then
                        sounds:playSound(CompatibilityUtils:checkSound("minecraft:entity.parrot.ambient"), player:getPos(), (50 - tick) / 50, 1.5)
                    end
                end
            }
		},

        {
            ---Exスキルの名前
            name = {
                ---英語
                ---日本語名を翻訳したものにする。
                ---@type string
                en_us = "Please have some water",

                ---日本語
                ---実際のスキルの名前と同じにする。
                ---@type string
                ja_jp = "お水をどうぞ"
            },

            ---Exスキルアニメーション開始時に表示し、Exスキルアニメーション終了時に非表示にするモデルパーツ
            ---@type ModelPart[]
			models = {models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.DrinkBottle1, models.models.main.Avatar.UpperBody.Body.DrinkBottle2, models.models.main.Avatar.UpperBody.Body.DrinkBottle3, models.models.ex_skill_2.Mobs},

            ---Exスキルアニメーションが含まれるモデルファイル名
            ---アニメーション名は"ex_skill_<Exスキルのインデックス番号>"にすること。
            ---@type string[]
			animations = {"main", "costume_tracksuit", "ex_skill_2"},

            ---Exスキルアニメーションでのカメラワークのデータ
            camera = {
                ---Exスキルアニメーション開始時
                start = {
                    ---カメラの位置
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    pos = vectors.vec3(-1, 27, -12),

                    ---カメラの向き
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    rot = vectors.vec3(-5, 180, 0)
                },

                ---Exスキルアニメーション終了時
                fin = {
                    ---カメラの位置
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    pos = vectors.vec3(21, 20, -30),

                    ---カメラの向き
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    rot = vectors.vec3(0, 150, 0)
                }
            },

            ---コールバック関数
            callbacks = {
                ---Exスキルアニメーション開始前のトランジション終了後に実行されるコールバック関数（任意）
                ---@type fun()
                preAnimation = function()
                    if not BlueArchiveCharacter.EX_SKILL[2].init then
                        if host:isHost() then
                            models.models.ex_skill_2.Gui.AnxiousFrame:setColor(0.282, 0.29, 0.725)
                        end
                        BlueArchiveCharacter.EX_SKILL[2].init = true
                    end
                end,

                ---Exスキルアニメーション再生中のみ実行されるティック関数
                ---@type fun(tick: integer)
                ---@param tick integer アニメーションの現在位置を示す。単位はティック。
                animationTick = function(tick)
                    if tick == 0 then
                        FaceParts:setEmotion("CLOSED", "CLOSED", "SMILE", 7, true)
                    elseif tick == 7 then
                        FaceParts:setEmotion("NORMAL", "NORMAL", "OPENED", 11, true)
                    elseif tick == 18 then
                        FaceParts:setEmotion("NORMAL", "INVERTED", "OPENED", 6, true)
                    elseif tick == 24 then
                        FaceParts:setEmotion("CLOSED2", "CLOSED2", "CLOSED", 8, true)
                    elseif tick == 32 then
                        FaceParts:setEmotion("NORMAL", "NORMAL", "OPENED", 10, true)
                    elseif tick == 38 and host:isHost() then
                        for _, modelPart in ipairs({models.models.ex_skill_2.Mobs.Mob1, models.models.ex_skill_2.Mobs.Mob4}) do
                            modelPart:setVisible(false)
                        end
                    elseif tick == 42 then
                        FaceParts:setEmotion("INVERTED", "NORMAL", "OPENED", 5, true)
                    elseif tick == 45 then
                        FaceParts:setEmotion("CLOSED2", "CLOSED2", "CLOSED", 3, true)
                        if host:isHost() then
                            local windowSize = client:getScaledWindowSize()
                            models.models.ex_skill_2.Gui.AnxiousFrame:setScale(windowSize.x, windowSize.y, 1)
                            models.models.ex_skill_2.Gui.AnxiousFrame:setVisible(true)
                            sounds:playSound(CompatibilityUtils:checkSound("minecraft:entity.wither.spawn"), player:getPos(), 0.15, 2)
                        end
                    elseif tick == 50 then
                        FaceParts:setEmotion("INVERTED", "NORMAL", "ANXIOUS", 6, true)
                    elseif tick == 56 then
                        FaceParts:setEmotion("NORMAL", "INVERTED", "ANXIOUS", 10, true)
                    elseif tick == 66 then
                        FaceParts:setEmotion("NORMAL", "INVERTED", "TRIANGLE", 5, true)
                    elseif tick == 71 then
                        FaceParts:setEmotion("INVERTED", "NORMAL", "TRIANGLE", 10, true)
                    elseif tick == 80 then
                        models.models.main.Avatar:setColor()
                        models.models.ex_skill_2.Gui.AnxiousFrame:setVisible(false)
                    elseif tick == 81 then
                        FaceParts:setEmotion("CLOSED2", "CLOSED2", "CLOSED", 4, true)
                    elseif tick == 85 then
                        FaceParts:setEmotion("TEAR", "TEAR", "TRIANGLE2", 15, true)
                    elseif tick == 100 then
                        for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.DrinkBottle2, models.models.main.Avatar.UpperBody.Body.DrinkBottle3, models.models.ex_skill_2.Mobs}) do
                            modelPart:setVisible(false)
                        end
                        BlueArchiveCharacter.EX_SKILL_2_STAIRS:setVisible(true)
                        models.models.main.Avatar.UpperBody.Body.CTracksuitB.Bag:moveTo(models.models.main)
                        models.models.main.Avatar.Head.FaceShadow:setVisible(true)
                        FaceParts:setEmotion("TIRED", "TIRED", "TIRED", 43, true)
                        local bodyYaw = player:getBodyYaw()
                        particles:newParticle(CompatibilityUtils:checkParticle("minecraft:soul"), ModelUtils.getModelWorldPos(models.models.main.Avatar.Head.FaceParts.Mouth):add(vectors.rotateAroundAxis(-bodyYaw, 0.1, 0.17, 0.35, 0, 1, 0))):setScale(0.75):setVelocity(vectors.rotateAroundAxis(-bodyYaw, -0.01, 0, 0, 0, 1, 0)):setLifetime(40)
                        local playerPos = player:getPos()
                        for _ = 1, 50 do
                            particles:newParticle(CompatibilityUtils:checkParticle("minecraft:entity_effect"), playerPos:copy():add(math.random() * 1.5 - 0.75, math.random() * 1.5 + 0.5, math.random() * 1.5 - 0.75)):setGravity(0.1):setLifetime(40)
                        end
                        sounds:playSound(CompatibilityUtils:checkSound("minecraft:block.beacon.deactivate"), playerPos, 1, 2)
                    end
                    if tick >= 45 and tick <= 56 then
                        models.models.main.Avatar:setColor(vectors.vec3(1, 1, 1):scale(1 - math.map(tick, 45, 56, 0, 0.25)))
                        if host:isHost() then
                            models.models.ex_skill_2.Gui.AnxiousFrame:setOpacity(math.map(tick, 45, 56, 0, 1))
                        end
                    end
                    if tick >= 8 and tick < 80 then
                        particles:newParticle(CompatibilityUtils:checkParticle("minecraft:splash"), ModelUtils.getModelWorldPos(models.models.main.Avatar.Head)):setPower(2)
                        if tick % 4 == 0 then
                            sounds:playSound(CompatibilityUtils:checkSound("minecraft:block.bubble_column.bubble_pop"), player:getPos(), 0.15, 2 - math.random() * 0.5)
                        end
                    elseif tick >= 85 and tick < 100 and tick % 2 == 0 then
                        sounds:playSound(CompatibilityUtils:checkSound("minecraft:entity.experience_orb.pickup"), player:getPos(), 0.5, 2)
                    end
                end,

                ---Exスキルアニメーション終了後のトランジション開始前に実行されるコールバック関数（任意）
                ---@type fun(forcedStop: boolean)
                ---@param forcedStop boolean アニメーションが途中終了した場合は"true"、アニメーションが最後まで再生されて終了した場合は"false"が代入される。
                postAnimation = function(forcedStop)
                    if models.models.main.Bag ~= nil then
                        models.models.main.Bag:moveTo(models.models.main.Avatar.UpperBody.Body.CTracksuitB)
                    end
                    BlueArchiveCharacter.EX_SKILL_2_STAIRS:setVisible(false)
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
                end
            },

            ---Exスキルの初期化処理が行われたかどうか
            ---@type boolean
            init = false
		},

		{
            ---Exスキルの名前
            name = {
                ---英語
                ---日本語名を翻訳したものにする。
                ---@type string
                en_us = "Overflowing heart",

                ---日本語
                ---実際のスキルの名前と同じにする。
                ---@type string
                ja_jp = "溢れるハート"
            },

            ---Exスキルアニメーション開始時に表示し、Exスキルアニメーション終了時に非表示にするモデルパーツ
            ---@type ModelPart[]
			models = {models.models.ex_skill_3.Gui},

            ---Exスキルアニメーションが含まれるモデルファイル名
            ---アニメーション名は"ex_skill_<Exスキルのインデックス番号>"にすること。
            ---@type string[]
			animations = {"main", "costume_tracksuit", "costume_idol", "ex_skill_3"},

            ---Exスキルアニメーションでのカメラワークのデータ
            camera = {
                ---Exスキルアニメーション開始時
                start = {
                    ---カメラの位置
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    pos = vectors.vec3(0, 25, -22),

                    ---カメラの向き
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    rot = vectors.vec3(0, 180, 0)
                },

                ---Exスキルアニメーション終了時
                fin = {
                    ---カメラの位置
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    pos = vectors.vec3(-6, 50, -18),

                    ---カメラの向き
                    ---BBアニメーション上での値をそのまま入力する。
                    ---@type Vector3
                    rot = vectors.vec3(-20, 200, -10)
                }
            },

            ---コールバック関数
            callbacks = {
                ---Exスキルアニメーション開始前のトランジション終了後に実行されるコールバック関数（任意）
                ---@type fun()
                preAnimation = function()
                    Costume.setCostumeTextureOffset(3)
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
                    if not BlueArchiveCharacter.EX_SKILL[3].init then
                        models.models.main.Avatar.UpperBody.Body.BTrinityLogo:setColor(0.357, 0.365, 0.475)
                        for _, modelPart in ipairs({models.models.ex_skill_3.Stage.StageFloor, models.models.ex_skill_3.Stage.StageStair1, models.models.ex_skill_3.Stage.StageStair2, models.models.ex_skill_3.Stage.StageStair3, models.models.ex_skill_3.Stage.StageStair4}) do
                            modelPart:setPrimaryTexture("RESOURCE", "minecraft:textures/block/gray_concrete.png")
                        end
                        --ペンライトの作成
                        local penLightColors = {vectors.vec3(1, 0.855, 0.584), vectors.vec3(0.698, 1, 0.97), vectors.vec3(0.81, 1, 0.698)}
                        for i = 1, 100 do
                            local model = models.models.ex_skill_3.Stage.PenLights["PenLight"..i]
                            if model == nil then
                                model = ModelUtils:copyModel(models.models.ex_skill_3.Stage.PenLights.PenLight1, "PenLight"..i, true)
                                models.models.ex_skill_3.Stage.PenLights:addChild(model)
                            end
                            model.PenLightEmissive:setColor(penLightColors[math.floor(math.random() * 3) + 1])
                        end
                        if host:isHost() then
                            --モデルのコピー
                            models.models.main.Avatar.Head.FaceParts.Mouth:setVisible(true)
                            for i = 1, 4 do
                                models.models.ex_skill_3.Gui.Scrollable.Characters["Pose"..i]:addChild(ModelUtils:copyModel(models.models.main.Avatar))
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
                            models.models.ex_skill_3.Gui.Scrollable.Characters.Pose1.Avatar.Head.FaceParts.Eyes.EyeLeft:setUVPixels(BlueArchiveCharacter.FACE_PARTS.RightEye.CLOSED[1] * 6, BlueArchiveCharacter.FACE_PARTS.RightEye.CLOSED[2] * 6)
                            models.models.ex_skill_3.Gui.Scrollable.Characters.Pose1.Avatar.Head.FaceParts.Mouth:setUVPixels(BlueArchiveCharacter.FACE_PARTS.Mouth.OPENED2[1] * 16, BlueArchiveCharacter.FACE_PARTS.Mouth.OPENED2[2] * 8)
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
                            models.models.ex_skill_3.Gui.Scrollable.Characters.Pose2.Avatar.Head.FaceParts.Mouth:setUVPixels(BlueArchiveCharacter.FACE_PARTS.Mouth.SMILE[1] * 16, BlueArchiveCharacter.FACE_PARTS.Mouth.SMILE[2] * 8)
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
                            models.models.ex_skill_3.Gui.Scrollable.Characters.Pose3.Avatar.Head.FaceParts.Eyes.EyeLeft:setUVPixels(BlueArchiveCharacter.FACE_PARTS.RightEye.UNEQUAL[1] * 6, BlueArchiveCharacter.FACE_PARTS.RightEye.UNEQUAL[2] * 6)
                            models.models.ex_skill_3.Gui.Scrollable.Characters.Pose3.Avatar.Head.FaceParts.Eyes.EyeRight:setUVPixels(BlueArchiveCharacter.FACE_PARTS.LeftEye.UNEQUAL[1] * 6, BlueArchiveCharacter.FACE_PARTS.LeftEye.UNEQUAL[2] * 6)
                            models.models.ex_skill_3.Gui.Scrollable.Characters.Pose3.Avatar.Head.FaceParts.Mouth:setUVPixels(BlueArchiveCharacter.FACE_PARTS.Mouth.TRIANGLE[1] * 16, BlueArchiveCharacter.FACE_PARTS.Mouth.TRIANGLE[2] * 8)
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
                            models.models.ex_skill_3.Gui.Scrollable.Characters.Pose4.Avatar.Head.FaceParts.Mouth:setUVPixels(BlueArchiveCharacter.FACE_PARTS.Mouth.SMALL[1] * 16, BlueArchiveCharacter.FACE_PARTS.Mouth.SMALL[2] * 8)
                            --白い縁取りと影の作成
                            local outlineTexture = textures:newTexture("ex_skill_3_character_outline", 1, 1)
                            outlineTexture:fill(0, 0, 1, 1, 1, 1, 1)
                            for i = 1, 4 do
                                local outlineaAvatar = models.models.ex_skill_3.Gui.Scrollable.Characters["Pose"..i].Avatar:copy("OutlineAvatar")
                                outlineaAvatar:setPrimaryRenderType("EMISSIVE_SOLID")
                                outlineaAvatar:setPrimaryTexture("CUSTOM", outlineTexture)
                                ---@diagnostic disable-next-line: discard-returns
                                models.models.ex_skill_3.Gui.Scrollable.Characters["Pose"..i]:newPart("Outline")
                                models.models.ex_skill_3.Gui.Scrollable.Characters["Pose"..i].Outline:setPos(0, 0, 50)
                                models.models.ex_skill_3.Gui.Scrollable.Characters["Pose"..i].Outline:setScale(1.2, 1.2, 0)
                                models.models.ex_skill_3.Gui.Scrollable.Characters["Pose"..i].Outline:addChild(outlineaAvatar)
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
                        BlueArchiveCharacter.EX_SKILL[3].init = true
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
                        BlueArchiveCharacter.EX_SKILL[3].penLightSwingOffsets[i] = math.random()
                    end
                    FaceParts:setEmotion("NORMAL", "NORMAL", "SMALL", 56, true)
                end,

                ---Exスキルアニメーション再生中のみ実行されるティック関数
                ---@type fun(tick: integer)
                ---@param tick integer アニメーションの現在位置を示す。単位はティック。
                animationTick = function(tick)
                    if tick == 50 and host:isHost() then
                        models.models.ex_skill_3.Gui.Transition:setVisible(true)
                    elseif tick == 53 and host:isHost() then
                        for _, modelPart in ipairs({models.models.ex_skill_3.Gui.Scrollable, models.models.ex_skill_3.Gui.Scrollable2, models.models.ex_skill_3.Gui.Background}) do
                            modelPart:setVisible(false)
                        end
                    elseif tick == 56 then
                        FaceParts:setEmotion("CLOSED2", "CLOSED2", "SMALL", 5, true)
                        if host:isHost() then
                            models.models.ex_skill_3.Gui.Transition:setVisible(false)
                        end
                    elseif tick == 61 then
                        FaceParts:setEmotion("CLOSED2", "CLOSED2", "STRAIGHT", 36, true)
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
                        models.models.main.Avatar.Head.Ears.RightEarPivot:setRot(-45, -10, 0)
                        models.models.ex_skill_3.Stage:setVisible(true)
                        events.RENDER:register(function (delta)
                            for i = 1, 100 do
                                models.models.ex_skill_3.Stage.PenLights["PenLight"..i]:setRot(0, 0, math.sin((BlueArchiveCharacter.EX_SKILL[3].penLightSwingOffsets[i] + delta * 0.1) * 2 * math.pi) * 40)
                            end
                        end, "ex_skill_3_pen_light_render")
                    elseif tick == 81 and host:isHost() then
                        events.RENDER:remove("ex_skill_3_background_render")
                        for _, modelPart in ipairs({models.models.ex_skill_3.Gui.WhiteScreen, models.models.ex_skill_3.Camera}) do
                            modelPart:setVisible(false)
                        end
                        models.models.main.Avatar:setColor(1, 1, 1)
                    elseif tick == 97 then
                        FaceParts:setEmotion("CLOSED2", "CLOSED2", "ANXIOUS", 3, true)
                    elseif tick == 100 then
                        FaceParts:setEmotion("CLOSED2", "CLOSED2", "TRIANGLE", 12, true)
                    elseif tick == 112 then
                        FaceParts:setEmotion("CLOSED2", "CLOSED2", "SMALL", 16, true)
                    elseif tick == 128 then
                        FaceParts:setEmotion("NARROW1", "NARROW1", "SMILE", 2, true)
                    elseif tick == 130 then
                        FaceParts:setEmotion("NORMAL", "NORMAL", "SMILE", 17, true)
                    elseif tick == 147 then
                        FaceParts:setEmotion("CLOSED", "CLOSED", "OPENED2", 2, true)
                    elseif tick == 149 then
                        FaceParts:setEmotion("INVERTED", "NORMAL", "OPENED2", 22, true)
                    elseif tick == 171 then
                        FaceParts:setEmotion("CLOSED", "CLOSED", "SMILE", 4, true)
                    elseif tick == 172 and host:isHost() then
                        models.models.ex_skill_3.Gui.WhiteScreen:setVisible(true)
                    elseif tick == 175 then
                        FaceParts:setEmotion("NORMAL", "NORMAL", "OPENED2", 38, true)
                    elseif tick == 176 and host:isHost() then
                        local windowSize = client:getScaledWindowSize()
                        models.models.ex_skill_3.Gui.Frame:setScale(windowSize.x, windowSize.y, 1)
                        models.models.ex_skill_3.Gui.Frame:setVisible(true)
                    elseif tick == 178 and host:isHost() then
                        models.models.ex_skill_3.Gui.WhiteScreen:setVisible(false)
                    end

                    for _ = 1, 12 do
                        models.models.ex_skill_3.Stage.StageEmissives:setUVPixels(tick * -1, 0)
                    end
                    if tick >= 69 and tick < 81 then
                        models.models.ex_skill_3.Camera.Background:setUVPixels((tick - 69) * -10, 0)
                    end
                    if tick >= 69 then
                        for i = 1, 100 do
                            BlueArchiveCharacter.EX_SKILL[3].penLightSwingOffsets[i] = BlueArchiveCharacter.EX_SKILL[3].penLightSwingOffsets[i] + 0.1
                            BlueArchiveCharacter.EX_SKILL[3].penLightSwingOffsets[i] = BlueArchiveCharacter.EX_SKILL[3].penLightSwingOffsets[i] > 1 and BlueArchiveCharacter.EX_SKILL[3].penLightSwingOffsets[i] - 1 or BlueArchiveCharacter.EX_SKILL[3].penLightSwingOffsets[i]
                        end
                    end
                end,

                ---Exスキルアニメーション終了後のトランジション開始前に実行されるコールバック関数（任意）
                ---@type fun(forcedStop: boolean)
                ---@param forcedStop boolean アニメーションが途中終了した場合は"true"、アニメーションが最後まで再生されて終了した場合は"false"が代入される。
                postAnimation = function(forcedStop)
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
                        models.models.main.Avatar.Head.Ears.RightEarPivot:setRot(-45, -10, 0)
                        if host:isHost() then
                            events.RENDER:remove("ex_skill_3_background_render")
                            for _, modelPart in ipairs({models.models.ex_skill_3.Gui.Transition, models.models.ex_skill_3.Gui.WhiteScreen, models.models.ex_skill_3.Camera}) do
                                modelPart:setVisible(false)
                            end
                            models.models.main.Avatar:setColor(1, 1, 1)
                        end
                    end
                end
            },

            ---Exスキルの初期化処理が行われたかどうか
            ---@type boolean
            init = false,

            ---ペンライトの振り時間のオフセット値
            ---@type number[]
            penLightSwingOffsets = {}
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
                name = "no_veil",

                ---コスチュームの表示名
                display_name = {
                    ---英語
                    ---@type string
                    en_us = "Default (no veil)",

                    ---日本語
                    ---@type string
                    ja_jp = "デフォルト（ベールなし）"
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
                name = "tracksuit",

                ---コスチュームの表示名
                display_name = {
                    ---英語
                    ---@type string
                    en_us = "Tracksuit",

                    ---日本語
                    ---@type string
                    ja_jp = "体操服"
                },

                ---この衣装での生徒の配置タイプ
                ---@type BlueArchiveCharacter.FormationType
                formationType = "STRIKER",

                ---コスチュームに対応するExスキルのインデックス番号
                ---@type integer
                exSkill = 2
            },

            {
                ---コスチュームの内部名
                ---@type string
                name = "idol",

                ---コスチュームの表示名
                display_name = {
                    ---英語
                    ---@type string
                    en_us = "Idol",

                    ---日本語
                    ---@type string
                    ja_jp = "アイドル"
                },

                ---この衣装での生徒の配置タイプ
                ---@type BlueArchiveCharacter.FormationType
                formationType = "STRIKER",

                ---コスチュームに対応するExスキルのインデックス番号
                ---@type integer
                exSkill = 3
            }
        },

        ---コールバック関数
        callbacks = {
            ---衣装が変更された時に実行されるコールバック関数
            ---デフォルトの衣装はここに含めない。
            ---@type fun(costumeId: integer)
            ---@param costumeId integer 新たな衣装のインデックス番号
            change = function(costumeId)
                models.models.main.Avatar.Head.Ears:setVisible(true)
                for _, modelPart in ipairs({models.models.main.Avatar.Head.Veil, models.models.main.Avatar.UpperBody.Body.VeilBody}) do
                    modelPart:setVisible(false)
                end
                if costumeId <= 3 then
                    models.models.main.Avatar.Head.Accessory:setPos(0, -1, 0)
                end
                if costumeId == 3 then
                    Costume.setCostumeTextureOffset(1)
                    for _, modelPart in ipairs({models.models.main.Avatar.Head.CTracksuitH, models.models.main.Avatar.UpperBody.Body.CTracksuitB}) do
                        modelPart:setVisible(true)
                    end
                    for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.TrinityLogo, models.models.main.Avatar.UpperBody.Body.FrontHair, models.models.main.Avatar.UpperBody.Body.Robe, models.models.main.Avatar.UpperBody.Body.BackRibbon}) do
                        modelPart:setVisible(false)
                    end
                elseif costumeId == 4 then
                    Costume.setCostumeTextureOffset(2)
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
                end
            end,

            ---衣装がリセットされた時に実行されるコールバック関数
            ---あらゆる衣装からデフォルトの衣装へ推移できるようにする。
            ---@type fun()
            reset = function()
                Costume.setCostumeTextureOffset(0)
                for _, modelPart in ipairs({models.models.main.Avatar.Head.Ears, models.models.main.Avatar.Head.CTracksuitH, models.models.main.Avatar.UpperBody.Body.CTracksuitB, models.models.main.Avatar.Head.CIdolH, models.models.main.Avatar.UpperBody.Body.CIdolB, models.models.main.Avatar.LowerBody.Legs.RightLeg.RightLegBottom.CIdolRLB, models.models.main.Avatar.LowerBody.Legs.LeftLeg.LeftLegBottom.CIdolLLB}) do
                    modelPart:setVisible(false)
                end
                for _, modelPart in ipairs({models.models.main.Avatar.Head.Veil, models.models.main.Avatar.UpperBody.Body.VeilBody, models.models.main.Avatar.UpperBody.Body.TrinityLogo, models.models.main.Avatar.UpperBody.Body.FrontHair, models.models.main.Avatar.Head.Accessory}) do
                    modelPart:setVisible(true)
                end
                for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Robe, models.models.main.Avatar.UpperBody.Body.BackRibbon}) do
                    modelPart:setVisible(not Armor.ArmorVisible[3])
                end
                for _, modelPart in ipairs({models.models.main.Avatar.Head.Head, models.models.main.Avatar.Head.HatLayer}) do
                    modelPart:setUVPixels()
                end
                models.models.main.Avatar.Head.Accessory:setPos()
                models.models.main.Avatar.Head.Ears.RightEarPivot:setRot()
            end,

            ---防具が変更された（防具が見える/見えない）時に実行されるコールバック関数
            ---@type fun(index: integer)
            ---@param parts Armor.ArmorPart 変更された防具の部位
            armorChange = function(parts)
                if parts == "HELMET" then
                    if Armor.ArmorVisible[1] then
                        for _, modelPart in ipairs({models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon, models.models.main.Avatar.Head.CTracksuitH.HairTail}) do
                            modelPart:setPos(0, 0, 1)
                        end
                    else
                        for _, modelPart in ipairs({models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon, models.models.main.Avatar.Head.CTracksuitH.HairTail}) do
                            modelPart:setPos()
                        end
                    end
                elseif parts == "CHEST_PLATE" then
                    if Armor.ArmorVisible[2] then
                        for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.FrontHair, models.models.main.Avatar.UpperBody.Body.CTracksuitB.FrontHair}) do
                            modelPart:setPos(0, 0, -1)
                        end
                        models.models.main.Avatar.UpperBody.Body.VeilBody:setPos(0, 0, 1)
                    else
                        for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.FrontHair, models.models.main.Avatar.UpperBody.Body.VeilBody, models.models.main.Avatar.UpperBody.Body.CTracksuitB.FrontHair}) do
                            modelPart:setPos()
                        end
                    end
                elseif parts == "LEGGINGS" then
                    if Armor.ArmorVisible[3] then
                        for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Robe, models.models.main.Avatar.UpperBody.Body.BackRibbon}) do
                            modelPart:setVisible(false)
                        end
                    elseif Costume.CurrentCostume <= 2 then
                        for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Robe, models.models.main.Avatar.UpperBody.Body.BackRibbon}) do
                            modelPart:setVisible(true)
                        end
                    end
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
                if duration > 0 then
                    if type == "GOOD" then
                        FaceParts:setEmotion("CLOSED", "CLOSED", "SMILE", duration, true)
                    elseif type == "HEART" then
                        FaceParts:setEmotion("NORMAL", "NORMAL", "SMILE", duration, true)
                    elseif type == "NOTE" then
                        FaceParts:setEmotion("CLOSED", "CLOSED", "OPENED", duration, true)
                    elseif type == "QUESTION" then
                        FaceParts:setEmotion("NORMAL", "NORMAL", "ANXIOUS", duration, true)
                    elseif type == "SWEAT" then
                        FaceParts:setEmotion("TEAR", "TEAR", "TIRED", duration, true)
                    end
                end
            end,

            ---吹き出しアニメーション終了時に実行されるコールバック関数（任意）
            ---@type fun(type: Bubble.BubbleType, forcedStop: boolean)
            ---@param type Bubble.BubbleType 再生された吹き出しエモートの種類
            ---@param forcedStop boolean 吹き出しエモートが途中終了した場合は"true"、吹き出しエモートが最後まで再生されて終了した場合は"false"が代入される。
            onStop = function(type, forcedStop)
                if forcedStop then
                    FaceParts:resetEmotion()
                end
            end
        }
    },

    ---頭ブロック
    HEAD_BLOCK = {
        ---頭以外のモデルパーツで頭ブロックにアタッチしたいモデルパーツを配列形式で列挙する。
        ---@type ModelPart[]
        includeModels = {models.models.main.Avatar.UpperBody.Body.FrontHair, models.models.main.Avatar.UpperBody.Body.VeilBody, models.models.main.Avatar.UpperBody.Body.CTracksuitB.FrontHair},

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
        excludeModels = {models.models.main.Avatar.Head.Ears, models.models.main.Avatar.Head.Veil.VeilEar, models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon, models.models.main.Avatar.Head.CTracksuitH.HairTail}

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
            if costume == 1 then
                dummyAvatar.Head.Veil.VeilEar.RightVeilEarPivot:setRot(-30, 0, 0)
                dummyAvatar.Head.Veil.VeilEar.LeftVeilEarPivot:setRot(-30, 0, 0)
            else
                dummyAvatar.Head.Ears.RightEarPivot:setRot(-30, 0, 0)
                dummyAvatar.Head.Ears.LeftEarPivot:setRot(-30, 0, 0)
            end
            if costume == 3 then
                dummyAvatar.Head.CTracksuitH.HairTail:setRot(17.5, 0, 0)
                dummyAvatar.UpperBody.Body.CTracksuitB.Bag:setPos(3, 2, 0)
                dummyAvatar.UpperBody.Body.CTracksuitB.Bag:setRot(0, 0, -25)
            else
                dummyAvatar.LowerBody:setVisible(false)
                dummyAvatar.UpperBody.Body.Robe:setScale(1.5, 0.35, 2)
            end
        end,

        ---ダミーアバターが縄ばしごにつかまった直後に実行される関数（省略可）
        ---@param dummyAvatar ModelPart ダミーアバターのルート
        ---@param costume integer ダミーアバターのコスチュームのインデックス
        onPhase2 = function (dummyAvatar, costume)
            if costume == 3 then
                dummyAvatar.Head.CTracksuitH.HairTail:setRot(-5, 0, -17.5)
                dummyAvatar.UpperBody.Body.CTracksuitB.Bag:setPos()
                dummyAvatar.UpperBody.Body.CTracksuitB.Bag:setRot()
            else
                dummyAvatar.LowerBody:setVisible(true)
                dummyAvatar.UpperBody.Body.Robe:setRot(30, 0, 0)
                dummyAvatar.UpperBody.Body.Robe:setScale(1.2, 1, 1)
            end
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
                modelPart = models.models.main.Avatar.UpperBody.Body.VeilBody,

                ---x軸回転における物理演算データ（省略可）
                x = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -80,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 0,

                        ---体を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        bodyX = {
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

                        ---体を基準とした、上下方向移動によるモデルパーツの回転データ（省略可）
                        bodyY = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 160,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -80,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体の回転によるによるモデルパーツの回転データ（省略可）
                        bodyRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0.1,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -80,

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
                modelPart = {models.models.main.Avatar.UpperBody.Body.FrontHair, models.models.main.Avatar.UpperBody.Body.CTracksuitB.FrontHair},

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
                        max = 80,

                        ---スニーク時にこのモデルパーツの回転に加えられるオフセット値（省略可）
                        ---@type number
                        sneakOffset = 30,

                        ---体を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        bodyX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -80,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 80
                        },

                        ---体を基準とした、上下方向移動によるモデルパーツの回転データ（省略可）
                        bodyY = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -80,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 80
                        },

                        ---体の回転によるによるモデルパーツの回転データ（省略可）
                        bodyRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -0.05,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 80
                        }
                    },

                    ---体が水平方向である時（水泳時、エリトラ飛行時）の物理演算データ（省略可）
                    horizontal = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = 0,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 80,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 80,

                        ---体を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        bodyX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -160,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 80
                        }
                    }
                }
            },

            {
                ---この物理演算データを適用させるモデルパーツ
                ---@type ModelPart | ModelPart[]
                modelPart = models.models.main.Avatar.UpperBody.Body.BackRibbon.BackRibbonBottom,

                ---x軸回転における物理演算データ（省略可）
                x = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -150,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 0,

                        ---体を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        bodyX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -80,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -65,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、上下方向移動によるモデルパーツの回転データ（省略可）
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
                        },

                        ---体の回転によるによるモデルパーツの回転データ（省略可）
                        bodyRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0.1,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -65,

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
                modelPart = models.models.main.Avatar.Head.CTracksuitH.HairTail,

                ---x軸回転における物理演算データ（省略可）
                x = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -170,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 30,

                        ---スニーク時にこのモデルパーツの回転に加えられるオフセット値（省略可）
                        ---@type number
                        sneakOffset = -20,

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
                            max = 10
                        },

                        ---頭の回転によるによるモデルパーツの回転データ（省略可）
                        headRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0.05,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -90,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、上下方向移動によるモデルパーツの回転データ（省略可）
                        bodyY = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 80,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -170,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        }
                    },

                    ---体が水平方向である時（水泳時、エリトラ飛行時）の物理演算データ（省略可）
                    horizontal = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -135,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = -30,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = -30,

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
                            max = -30
                        }
                    }
                }
            },

            {
                ---この物理演算データを適用させるモデルパーツ
                ---@type ModelPart | ModelPart[]
                modelPart = models.models.main.Avatar.Head.CTracksuitH.HairTail.HairTailZPivot,

                ---x軸回転における物理演算データ（省略可）
                z = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -80,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 80,

                        ---頭を基準とした、左右方向移動によるモデルパーツの回転データ（省略可）
                        headZ = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -80,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -80,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 80
                        }
                    }
                }
            },

            {
                ---この物理演算データを適用させるモデルパーツ
                ---@type ModelPart | ModelPart[]
                modelPart = models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon.HairBandRibbonTopLeftYPivot,

                ---x軸回転における物理演算データ（省略可）
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
                        max = 80,

                        ---頭の縦方向の回転と共にこのモデルパーツの回転に加えられる値の倍率（省略可）
                        ---@type number
                        headRotMultiplayer = 0.5,

                        ---頭を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        headX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 160,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 80
                        },

                        ---頭の回転によるによるモデルパーツの回転データ（省略可）
                        headRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -0.1,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 80
                        }
                    }
                }
            },

            {
                ---この物理演算データを適用させるモデルパーツ
                ---@type ModelPart | ModelPart[]
                modelPart = models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon.HairBandRibbonTopLeftYPivot.HairBandRibbonTopLeftZPivot,

                ---x軸回転における物理演算データ（省略可）
                z = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -40,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 40,

                        ---体を基準とした、上下方向移動によるモデルパーツの回転データ（省略可）
                        bodyY = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 20,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -40,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 40
                        }
                    }
                }
            },

            {
                ---この物理演算データを適用させるモデルパーツ
                ---@type ModelPart | ModelPart[]
                modelPart = models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon.HairBandRibbonTopRightYPivot,

                ---x軸回転における物理演算データ（省略可）
                y = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -80,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 0,

                        ---頭の縦方向の回転と共にこのモデルパーツの回転に加えられる値の倍率（省略可）
                        ---@type number
                        headRotMultiplayer = -0.5,

                        ---頭を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        headX = {
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
                        }
                    }
                }
            },

            {
                ---この物理演算データを適用させるモデルパーツ
                ---@type ModelPart | ModelPart[]
                modelPart = models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon.HairBandRibbonTopRightYPivot.HairBandRibbonTopRightZPivot,

                ---x軸回転における物理演算データ（省略可）
                z = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -40,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 40,

                        ---体を基準とした、上下方向移動によるモデルパーツの回転データ（省略可）
                        bodyY = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -20,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -40,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 40
                        }
                    }
                }
            },

            {
                ---この物理演算データを適用させるモデルパーツ
                ---@type ModelPart | ModelPart[]
                modelPart = {models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon.HairBandRibbonBottom.HairBandRibbonBottomLeftXPivot, models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon.HairBandRibbonBottom.HairBandRibbonBottomRightXPivot},

                ---x軸回転における物理演算データ（省略可）
                x = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -170,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 0,

                        ---頭の縦方向の回転と共にこのモデルパーツの回転に加えられる値の倍率（省略可）
                        ---@type number
                        headRotMultiplayer = -1,

                        ---頭を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        headX = {
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

                        ---体を基準とした、上下方向移動によるモデルパーツの回転データ（省略可）
                        bodyY = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 160,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -170,

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
                modelPart = models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon.HairBandRibbonBottom.HairBandRibbonBottomLeftXPivot.HairBandRibbonBottomLeftZPivot,

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
                        max = 30,

                        ---頭を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        headX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 20,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 30
                        },

                        ---頭の回転によるによるモデルパーツの回転データ（省略可）
                        headRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -0.1,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 30
                        },

                        ---体を基準とした、上下方向移動によるモデルパーツの回転データ（省略可）
                        bodyY = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 20,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 30
                        }
                    }
                }
            },

            {
                ---この物理演算データを適用させるモデルパーツ
                ---@type ModelPart | ModelPart[]
                modelPart = models.models.main.Avatar.Head.CTracksuitH.HairBandRibbon.HairBandRibbonBottom.HairBandRibbonBottomRightXPivot.HairBandRibbonBottomRightZPivot,

                ---z軸回転における物理演算データ（省略可）
                z = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -30,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 0,

                        ---頭を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        headX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -20,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -30,

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
                            min = -30,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、上下方向移動によるモデルパーツの回転データ（省略可）
                        bodyY = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -20,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -30,

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
                modelPart = {models.models.main.Avatar.UpperBody.Body.CTracksuitB.Bag.BagHooks.BagHookNorth.IDCard.IDCardXPivot, models.models.main.Avatar.UpperBody.Body.CTracksuitB.Bag.BagBaseFastener1XPivot, models.models.main.Avatar.UpperBody.Body.CTracksuitB.Bag.BagBaseFastener2XPivot, models.models.main.Avatar.UpperBody.Body.CTracksuitB.Bag.BackPocket.BackPocketFastenerXPivot, models.models.main.Avatar.UpperBody.Body.CIdolB.NeckRibbon.NeckRibbonBottom},

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
                        max = 80,

                        ---スニーク時にこのモデルパーツの回転に加えられるオフセット値（省略可）
                        ---@type number
                        sneakOffset = 30,

                        ---体を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        bodyX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -160,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 80
                        },

                        ---体を基準とした、上下方向移動によるモデルパーツの回転データ（省略可）
                        bodyY = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -160,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 80
                        },

                        ---体の回転によるによるモデルパーツの回転データ（省略可）
                        bodyRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -0.1,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 80
                        }
                    }
                }
            },

            {
                ---この物理演算データを適用させるモデルパーツ
                ---@type ModelPart | ModelPart[]
                modelPart =  {models.models.main.Avatar.UpperBody.Body.CTracksuitB.Bag.BagHooks.BagHookNorth.IDCard.IDCardXPivot.IDCardZPivot, models.models.main.Avatar.UpperBody.Body.CTracksuitB.Bag.BagBaseFastener1XPivot.BagBaseFastener1ZPivot, models.models.main.Avatar.UpperBody.Body.CTracksuitB.Bag.BagBaseFastener2XPivot.BagBaseFastener2ZPivot, models.models.main.Avatar.UpperBody.Body.CTracksuitB.Bag.BackPocket.BackPocketFastenerXPivot.BackPocketFastenerZPivot, models.models.main.Avatar.UpperBody.Body.CIdolB.NeckRibbon.NeckRibbonBottom.NeckRibbonBottomZPivot},

                ---x軸回転における物理演算データ（省略可）
                z = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -80,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 80,

                        ---頭を基準とした、左右方向移動によるモデルパーツの回転データ（省略可）
                        headZ = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -160,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -80,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 80
                        }
                    }
                }
            },

            {
                ---この物理演算データを適用させるモデルパーツ
                ---@type ModelPart | ModelPart[]
                modelPart = models.models.main.Avatar.Head.CIdolH.HairTails.HairTailLeft.HairLeftBottom,

                ---x軸回転における物理演算データ（省略可）
                x = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -165,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 10,

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
                            min = -82.5,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 10
                        },

                        ---頭の回転によるによるモデルパーツの回転データ（省略可）
                        headRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0.05,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -82.5,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、上下方向移動によるモデルパーツの回転データ（省略可）
                        bodyY = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 80,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -165,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 7.5
                        }
                    },

                    ---体が水平方向である時（水泳時、エリトラ飛行時）の物理演算データ（省略可）
                    horizontal = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -155,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = -45,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = -45
                    }
                }
            },

            {
                ---この物理演算データを適用させるモデルパーツ
                ---@type ModelPart | ModelPart[]
                modelPart = models.models.main.Avatar.Head.CIdolH.HairTails.HairTailLeft.HairLeftBottom.HairLeftBottomZ,

                ---z軸回転における物理演算データ（省略可）
                z = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -80,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 100,

                        ---頭を基準とした、左右方向移動によるモデルパーツの回転データ（省略可）
                        headZ = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -80,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -80,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 100
                        }
                    },

                    ---体が水平方向である時（水泳時、エリトラ飛行時）の物理演算データ（省略可）
                    horizontal = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -80,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 100
                    }
                }
            },

            {
                ---この物理演算データを適用させるモデルパーツ
                ---@type ModelPart | ModelPart[]
                modelPart = models.models.main.Avatar.Head.CIdolH.HairTails.HairTailRight.HairRightBottom,

                ---x軸回転における物理演算データ（省略可）
                x = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -165,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 10,

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
                            min = -82.5,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 10
                        },

                        ---頭の回転によるによるモデルパーツの回転データ（省略可）
                        headRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 0.05,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -82.5,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 0
                        },

                        ---体を基準とした、上下方向移動によるモデルパーツの回転データ（省略可）
                        bodyY = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = 80,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -165,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 7.5
                        }
                    },

                    ---体が水平方向である時（水泳時、エリトラ飛行時）の物理演算データ（省略可）
                    horizontal = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -155,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = -45,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = -45
                    }
                }
            },

            {
                ---この物理演算データを適用させるモデルパーツ
                ---@type ModelPart | ModelPart[]
                modelPart = models.models.main.Avatar.Head.CIdolH.HairTails.HairTailRight.HairRightBottom.HairRightBottomZ,

                ---z軸回転における物理演算データ（省略可）
                z = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -100,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 80,

                        ---頭を基準とした、左右方向移動によるモデルパーツの回転データ（省略可）
                        headZ = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -80,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -100,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 80
                        }
                    },

                    ---体が水平方向である時（水泳時、エリトラ飛行時）の物理演算データ（省略可）
                    horizontal = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -100,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = -20,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 80
                    }
                }
            },

            {
                ---この物理演算データを適用させるモデルパーツ
                ---@type ModelPart | ModelPart[]
                modelPart = models.models.main.Avatar.Head.CIdolH.Hat.HatVeil,

                x = {
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

                        ---頭の縦方向の回転と共にこのモデルパーツの回転に加えられる値の倍率（省略可）
                        ---@type number
                        headRotMultiplayer = -1,
                    }
                },

                ---z軸回転における物理演算データ（省略可）
                z = {
                    ---体が垂直方向である時（通常時）の物理演算データ（省略可）
                    vertical = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -35,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 0,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 150,

                        ---体を基準とした、上下方向移動によるモデルパーツの回転データ（省略可）
                        bodyY = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -80,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 150
                        },

                        ---頭を基準とした、左右方向移動によるモデルパーツの回転データ（省略可）
                        headZ = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -80,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = -35,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 90
                        },

                        ---頭の回転によるによるモデルパーツの回転データ（省略可）
                        headRot = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -0.05,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 90
                        }
                    },

                    ---体が水平方向である時（水泳時、エリトラ飛行時）の物理演算データ（省略可）
                    horizontal = {
                        ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
                        ---@type number
                        min = -35,

                        ---このモデルパーツ、回転軸の中立の回転位置（度）
                        ---@type number
                        neutral = 10,

                        ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
                        ---@type number
                        max = 150,

                        ---体を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
                        bodyX = {
                            ---この回転事象がモデルパーツに与える回転の倍率
                            ---@type number
                            multiplayer = -80,

                            ---この回転事象がモデルパーツに与える回転の最小値
                            ---@type number
                            min = 0,

                            ---この回転事象がモデルパーツに与える回転の最大値
                            ---@type number
                            max = 150
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
    ---@diagnostic disable-next-line: undefined-field
    EX_SKILL_2_STAIRS = models.models.main:newBlock("ex_skill_2_stairs"):setPos(6, 0, 6):setRot(0, 180, 0):setBlock("minecraft:oak_stairs"):setVisible(false)
}

--生徒固有初期化処理
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

---脚と丈の長いスカートの調整が有効かどうか
---@type boolean
local legAdjustmentEnabled = true

---前ティックに脚とスカートの調整をしたかどうか
---@type boolean
local legAdjustedPrev = false

---前ティックは脚を隠すべきだったかどうか
---@type boolean
local shouldHideLegsPrev = false

events.TICK:register(function ()
    local robeVisible = models.models.main.Avatar.UpperBody.Body.Robe:getVisible()
    local shouldHideLegs = robeVisible and player:getVehicle() ~= nil
    if shouldHideLegs and not shouldHideLegsPrev then
        models.models.main.Avatar.LowerBody.Legs:setVisible(false)
        models.models.main.Avatar.UpperBody.Body.Robe:setScale(1.5, 0.35, 2)
    elseif not shouldHideLegs and shouldHideLegsPrev then
        models.models.main.Avatar.LowerBody.Legs:setVisible(true)
        models.models.main.Avatar.UpperBody.Body.Robe:setScale()
    end
    local shouldAdjustLegs = legAdjustmentEnabled and robeVisible and not shouldHideLegs
    if shouldAdjustLegs and not legAdjustedPrev then
        events.RENDER:register(function ()
            local rightLegRotX = vanilla_model.RIGHT_LEG:getOriginRot().x
            models.models.main.Avatar.LowerBody.Legs.RightLeg:setRot(rightLegRotX * -0.55, 0, 0)
            models.models.main.Avatar.LowerBody.Legs.LeftLeg:setRot(vanilla_model.LEFT_LEG:getOriginRot().x * -0.55, 0, 0)
            local rightLegRotAbs = math.abs(rightLegRotX)
            models.models.main.Avatar.UpperBody.Body.Robe:setScale(1, 1, rightLegRotAbs * 0.0025 + 1)
            local robeScale2 = vectors.vec3(rightLegRotAbs * -0.000625 + 1, 1, rightLegRotAbs * 0.00125 + 1)
            models.models.main.Avatar.UpperBody.Body.Robe.Robe2:setScale(robeScale2)
            models.models.main.Avatar.UpperBody.Body.Robe.Robe2.Robe3:setScale(robeScale2)
        end, "skirt_render")
    elseif not shouldAdjustLegs and legAdjustedPrev then
        events.RENDER:remove("skirt_render")
        for _, modelPart in ipairs({models.models.main.Avatar.LowerBody.Legs.RightLeg, models.models.main.Avatar.LowerBody.Legs.LeftLeg}) do
            modelPart:setRot()
        end
        if not shouldHideLegs then
            for _, modelPart in ipairs({models.models.main.Avatar.UpperBody.Body.Robe, models.models.main.Avatar.UpperBody.Body.Robe.Robe2, models.models.main.Avatar.UpperBody.Body.Robe.Robe2.Robe3}) do
                modelPart:setScale()
            end
        end
    end
    shouldHideLegsPrev = shouldHideLegs
    legAdjustedPrev = shouldAdjustLegs
end)

for i = 1, 2 do
    models.models.main.Avatar.Head.CIdolH.Hat["Feather"..i]:setPrimaryTexture("RESOURCE", "minecraft:textures/item/feather.png")
    models.models.main.Avatar.Head.CIdolH.Hat["Feather"..i]:setColor(0.65, 0.65, 0.65)
end

return BlueArchiveCharacter