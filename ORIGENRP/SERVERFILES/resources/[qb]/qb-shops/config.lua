Config = {}

Config.Products = {
    ["normal"] = {
        [1] = {
            name = "tosti",
            price = 20,
            amount = 10000,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "water_bottle",
            price = 20,
            amount = 10000,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "phone",
            price = 850,
            amount = 10000,
            info = {},
            type = "item",
            slot = 3,
        },
    },
    ["hardware"] = {
        [1] = {
            name = "lockpick",
            price = 200,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "repairkit",
            price = 500,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "screwdriverset",
            price = 350,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "binoculars",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "cleaningkit",
            price = 150,
            amount = 150,
            info = {},
            type = "item",
            slot = 5,
        },
    },
    ["coffeeshop"] = {
        [1] = {
            name = "joint",
            price = 10,
            amount = 1000,
            info = {},
            type = "item",
            slot = 1,
        }
    },
    ["gearshop"] = {
        [1] = {
            name = "diving_gear",
            price = 2500,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "jerry_can",
            price = 200,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
    },
    ["leisureshop"] = {
        [1] = {
            name = "parachute",
            price = 100,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "binoculars",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },    
        [3] = {
            name = "diving_gear",
            price = 2500,
            amount = 10,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "rod",
            price = 2500,
            amount = 10,
            info = {},
            type = "item",
            slot = 4,
        },
        -- [4] = {
        --     name = "smoketrailred",
        --     price = 250,
        --     amount = 50,
        --     info = {},
        --     type = "item",
        --     slot = 4,
        -- },
    },   
    ["mustapha"] = {
        [1] = {
            name = "parachute",
            price = 100,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "binoculars",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },    
        [3] = {
            name = "diving_gear",
            price = 2500,
            amount = 10,
            info = {},
            type = "item",
            slot = 3,
        },
    },    
    ["weapons"] = {
    },
    ["coffeeplace"] = {
        [1] = {
            name = "coffee",
            price = 5,
            amount = 2000,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "lighter",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
    },
    ["casino"] = {
        [1] = {
            name = 'casinochips',
            price = 100,
            amount = 999999,
            info = {},
            type = 'item',
            slot = 1,
        }
    },
}

Config.Locations = {
    ["casino"] = {
        ["label"] = "Diamond Casino",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(978.09631, 40.819992, 74.881919)
        },
        ["products"] = Config.Products["casino"],
        ["showblip"] = true,
    },
    ["robsliquor6"] = {
        ["label"] = "Casino Bar",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(964.24298, 33.837673, 74.876853)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["robsliquor"] = {
        ["label"] = "Rob's Liqour",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-1222.77, -907.19, 12.32)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["ltdgasoline2"] = {
        ["label"] = "LTD Gasoline",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-715.99, -911.24, 19.21),
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = false,
    },
    ["robsliquor2"] = {
        ["label"] = "Rob's Liqour",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-1487.7, -378.53, 40.16)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["robsliquor3"] = {
        ["label"] = "Rob's Liqour",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-2967.79, 391.64, 15.04)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["247supermarket6"] = {
        ["label"] = "24/7",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(1965.12, 3745.6, 32.34)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = false,
    },
    ["robsliquor4"] = {
        ["label"] = "Rob's Liqour",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(1165.28, 2709.4, 38.15)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["delvecchioliquor"] = {
        ["label"] = "Licoreria Del Vecchio",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-159.36, 6321.59, 31.58),
            [2] = vector3(-160.66, 6322.85, 31.58)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["donscountrystore"] = {
        ["label"] = "Licoreria Don's Country",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(161.41, 6640.78, 31.69),
            [2] = vector3(163.04, 6642.45, 31.70)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["robsliquor5"] = {
        ["label"] = "Rob's Liqour",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(1135.66, -982.76, 46.41)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
    },
    ["hardware"] = {
        ["label"] = "Tienda de Herramientas",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = vector3(45.55, -1749.01, 29.6)
        },
        ["products"] = Config.Products["hardware"],
        ["showblip"] = true,
    },
    ["hardware2"] = {
        ["label"] = "Tienda de Herramientas",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = vector3(2747.8, 3472.86, 55.67)
        },
        ["products"] = Config.Products["hardware"],
        ["showblip"] = true,
    },
    ["hardware3"] = {
        ["label"] = "Tienda de Herramientas",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = vector3(-421.84, 6136.09, 31.78)
        },
        ["products"] = Config.Products["hardware"],
        ["showblip"] = true,
    },   
    ["coffeeshop"] = {
        ["label"] = "Superfly",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = vector3(-1172.43, -1572.24, 4.66)
        },
        ["products"] = Config.Products["coffeeshop"],
        ["showblip"] = true,
    },
    ["ammunation1"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(-662.1, -935.3, 21.8)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
    },
    ["ammunation2"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(810.2, -2157.3, 29.6)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
    },
    ["ammunation3"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(1693.4, 3759.5, 34.7)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
    },
    ["ammunation4"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(-330.2, 6083.8, 31.4)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
    },
    ["ammunation5"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(252.3, -50.0, 69.9)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
    },
    ["ammunation6"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(22.0, -1107.2, 29.8)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
    },
    ["ammunation7"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(2567.6, 294.3, 108.7)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
    },
    ["ammunation8"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(-1117.5, 2698.6, 18.5)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
    },
    ["ammunation9"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(842.4, -1033.4, 28.1)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
    },
    ["seaword1"] = {
        ["label"] = "Sea Word",
        ["type"] = "sea",
        ["coords"] = {
            [1] = vector3(-1686.9, -1072.23, 13.15)
        },
        ["products"] = Config.Products["gearshop"],
        ["showblip"] = true,
    },
    ["leisureshop"] = {
        ["label"] = "Tienda de Ocio",
        ["type"] = "leisure",
        ["coords"] = {
            [1] = vector3(-1505.76, 1512.67, 115.29)
        },
        ["products"] = Config.Products["leisureshop"],
        ["showblip"] = true,
    },
}
