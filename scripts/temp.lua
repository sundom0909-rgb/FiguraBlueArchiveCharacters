{
    ---この物理演算データを適用させるモデルパーツ
    ---@type ModelPart | ModelPart[]
    modelPart = models.models.main.Avatar.UpperBody.Body.Hairs.FrontHair,

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
    modelPart = models.models.main.Avatar.UpperBody.Body.Hairs.BackHair,

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
                multiplayer = -80,

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
                multiplayer = 80,

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
                multiplayer = 0.05,

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
    modelPart = models.models.main.Avatar.UpperBody.Body.Scarf.Scarf2,

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
            max = 140,

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
                max = 90
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
                max = 140
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
                max = 90
            }
        },

        ---体が水平方向である時（水泳時、エリトラ飛行時）の物理演算データ（省略可）
        horizontal = {
            ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
            ---@type number
            min = 0,

            ---このモデルパーツ、回転軸の中立の回転位置（度）
            ---@type number
            neutral = 90,

            ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
            ---@type number
            max = 90,

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
                max = 90
            }
        }
    }
},

{
    ---この物理演算データを適用させるモデルパーツ
    ---@type ModelPart | ModelPart[]
    modelPart = models.models.main.Avatar.UpperBody.Body.Scarf.Scarf3,

    ---x軸回転における物理演算データ（省略可）
    x = {
        ---体が垂直方向である時（通常時）の物理演算データ（省略可）
        vertical = {
            ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
            ---@type number
            min = 2,

            ---このモデルパーツ、回転軸の中立の回転位置（度）
            ---@type number
            neutral = 2,

            ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
            ---@type number
            max = 140,

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
                min = 2,

                ---この回転事象がモデルパーツに与える回転の最大値
                ---@type number
                max = 90
            },

            ---体を基準とした、上下方向移動によるモデルパーツの回転データ（省略可）
            bodyY = {
                ---この回転事象がモデルパーツに与える回転の倍率
                ---@type number
                multiplayer = -160,

                ---この回転事象がモデルパーツに与える回転の最小値
                ---@type number
                min = 2,

                ---この回転事象がモデルパーツに与える回転の最大値
                ---@type number
                max = 140
            },

            ---体の回転によるによるモデルパーツの回転データ（省略可）
            bodyRot = {
                ---この回転事象がモデルパーツに与える回転の倍率
                ---@type number
                multiplayer = -0.05,

                ---この回転事象がモデルパーツに与える回転の最小値
                ---@type number
                min = 2,

                ---この回転事象がモデルパーツに与える回転の最大値
                ---@type number
                max = 90
            }
        },

        ---体が水平方向である時（水泳時、エリトラ飛行時）の物理演算データ（省略可）
        horizontal = {
            ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
            ---@type number
            min = 2,

            ---このモデルパーツ、回転軸の中立の回転位置（度）
            ---@type number
            neutral = 90,

            ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
            ---@type number
            max = 90,

            ---体を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
            bodyX = {
                ---この回転事象がモデルパーツに与える回転の倍率
                ---@type number
                multiplayer = -160,

                ---この回転事象がモデルパーツに与える回転の最小値
                ---@type number
                min = 2,

                ---この回転事象がモデルパーツに与える回転の最大値
                ---@type number
                max = 90
            }
        }
    }
},

{
    ---この物理演算データを適用させるモデルパーツ
    ---@type ModelPart | ModelPart[]
    modelPart = {models.models.main.Avatar.UpperBody.Body.Scarf.Scarf2.Scarf2, models.models.main.Avatar.UpperBody.Body.Scarf.Scarf3.Scarf3, models.models.main.Avatar.UpperBody.Body.Scarf.Scarf4.Scarf4},

     ---z軸回転における物理演算データ（省略可）
    z = {
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

            ---体を基準とした、左右方向移動によるモデルパーツの回転データ（省略可）
            bodyZ = {
                ---この回転事象がモデルパーツに与える回転の倍率
                ---@type number
                multiplayer = -80,

                ---この回転事象がモデルパーツに与える回転の最小値
                ---@type number
                min = -90,

                ---この回転事象がモデルパーツに与える回転の最大値
                ---@type number
                max = 90
            },
        }
    }
},

{
    ---この物理演算データを適用させるモデルパーツ
    ---@type ModelPart | ModelPart[]
    modelPart = models.models.main.Avatar.UpperBody.Body.Scarf.Scarf4,

    ---x軸回転における物理演算データ（省略可）
    x = {
        ---体が垂直方向である時（通常時）の物理演算データ（省略可）
        vertical = {
            ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
            ---@type number
            min = -140,

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
                min = -90,

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
                min = -140,

                ---この回転事象がモデルパーツに与える回転の最大値
                ---@type number
                max = 0
            },

            ---体の回転によるによるモデルパーツの回転データ（省略可）
            bodyRot = {
                ---この回転事象がモデルパーツに与える回転の倍率
                ---@type number
                multiplayer = 0.05,

                ---この回転事象がモデルパーツに与える回転の最小値
                ---@type number
                min = -90,

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
    modelPart = models.models.main.Avatar.Head.CSwimsuitH,

    ---x軸回転における物理演算データ（省略可）
    x = {
        ---体が垂直方向である時（通常時）の物理演算データ（省略可）
        vertical = {
            ---このモデルパーツ、回転軸の絶対的な回転の最小値（度）
            ---@type number
            min = -140,

            ---このモデルパーツ、回転軸の中立の回転位置（度）
            ---@type number
            neutral = 0,

            ---このモデルパーツ、回転軸の絶対的な回転の最大値（度）
            ---@type number
            max = 0,

            ---頭の縦方向の回転と共にこのモデルパーツの回転に加えられる値の倍率（省略可）
            ---@type number
            headRotMultiplayer = -1,


            ---体を基準とした、前後方向移動によるモデルパーツの回転データ（省略可）
            bodyX = {
                ---この回転事象がモデルパーツに与える回転の倍率
                ---@type number
                multiplayer = -80,

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
                min = -140,

                ---この回転事象がモデルパーツに与える回転の最大値
                ---@type number
                max = 0
            },

            ---体の回転によるによるモデルパーツの回転データ（省略可）
            bodyRot = {
                ---この回転事象がモデルパーツに与える回転の倍率
                ---@type number
                multiplayer = 0.05,

                ---この回転事象がモデルパーツに与える回転の最小値
                ---@type number
                min = -90,

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
    modelPart = models.models.main.Avatar.Head.CSwimsuitH.HairTail,

     ---z軸回転における物理演算データ（省略可）
    z = {
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

            ---体を基準とした、左右方向移動によるモデルパーツの回転データ（省略可）
            bodyZ = {
                ---この回転事象がモデルパーツに与える回転の倍率
                ---@type number
                multiplayer = -80,

                ---この回転事象がモデルパーツに与える回転の最小値
                ---@type number
                min = -90,

                ---この回転事象がモデルパーツに与える回転の最大値
                ---@type number
                max = 90
            },
        }
    }
}