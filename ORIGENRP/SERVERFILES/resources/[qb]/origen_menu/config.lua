HHMenu = {
    Menus = {
        [1] = {
            shoudclose = false,
            label = "Menú Personal",
            icon = "fas fa-user",
            submenu = {
                {
                    shoudclose = false,
                    label = "Enseñar DNI",
                    submenu = false,
                    icon = "fas fa-address-card",
                    type = "client",
                    event = "origen_menu:pressedIdCardClose"
                },
                {
                    shoudclose = false,
                    label = "Ver DNI",
                    submenu = false,
                    icon = "fas fa-address-card",
                    type = "client",
                    event = "origen_menu:pressedIdCard"
                },
                {
                    shoudclose = true,
                    label = "Cachear",
                    submenu = false,
                    icon = "fas fa-theater-masks",
                    type = "client",
                    event = "origen_menu:cachear"
                },
                {
                    shoudclose = true,
                    label = "Habilidades",
                    submenu = false,
                    icon = "fas fa-running",
                    type = "client",
                    event = "skills_users:abrirMenu"
                },
                {
                    shoudclose = false,
                    label = "Otros",
                    submenu = {
                        {
                            shoudclose = false,
                            label = "Documentos",
                            submenu = false,
                            icon = "fas fa-file-alt",
                            type = "client",
                            event = "evento:pendiente"
                        },
                        {
                            shoudclose = true,
                            label = "Sugerir contacto",
                            submenu = false,
                            icon = "fas fa-mobile-alt",
                            type = "client",
                            event = "qb-phone:client:GiveContactDetails"
                        },
                        {
                            shoudclose = false,
                            label = "Vender Drogas",
                            submenu = false,
                            icon = "fas fa-cannabis",
                            type = "client",
                            event = "qb-drugs:client:cornerselling"
                        },
                    },
                    icon = "fas fa-plus-circle",
                    type = "client",
                    event = "evento:pendiente"
                }
                
            }
        },
        [2] = {
            shoudclose = false,
            label = "Animaciones",
            icon = "fas fa-child",
            submenu = {
                {
                    shoudclose = true,
                    label = "Cancelar Animación",
                    submenu = false,
                    type = "client",
                    event = "origen_menu:cancelAnim",
                    icon = "fas fa-times"
                },
                {
                    shoudclose = true,
                    label = "Todas las animaciones",
                    submenu = false,
                    type = "client",
                    event = "origen_menu:opendpmenu",
                    icon = "fas fa-plus"
                },
                {
                    shoudclose = true,
                    label = "Formas de caminar",
                    submenu = false,
                    type = "client",
                    event = "origen_menu:opendpmenu",
                    icon = "fas fa-walking"
                },
                {
                    shoudclose = true,
                    label = "Sentarse",
                    submenu = false,
                    type = "client",
                    event = "origen_menu:sit",
                    icon = "fas fa-child"
                },
                {
                    shoudclose = true,
                    label = "Tumbarse",
                    submenu = false,
                    type = "client",
                    event = "origen_menu:tumbarse",
                    icon = "fas fa-child"
                },
                {
                    shoudclose = true,
                    label = "Aplaudir",
                    submenu = false,
                    type = "client",
                    event = "origen_menu:aplaudir",
                    icon = "fas fa-child"
                },
                {
                    shoudclose = true,
                    label = "Fumar",
                    submenu = false,
                    type = "client",
                    event = "origen_menu:fumar",
                    icon = "fas fa-child"
                },
                {
                    shoudclose = true,
                    label = "Rendirse",
                    submenu = false,
                    type = "client",
                    event = "origen_menu:rendirse",
                    icon = "fas fa-child"
                },
                {
                    shoudclose = true,
                    label = "Facepalm",
                    submenu = false,
                    type = "client",
                    event = "origen_menu:facepalm",
                    icon = "fas fa-child"
                },
                {
                    shoudclose = true,
                    label = "Saludar",
                    submenu = false,
                    type = "client",
                    event = "origen_menu:saludar",
                    icon = "fas fa-child"
                },
                {
                    shoudclose = true,
                    label = "Apoyarse",
                    submenu = false,
                    type = "client",
                    event = "origen_menu:apoyarse",
                    icon = "fas fa-child"
                },
                
            }
        },

        [3] = {
            shoudclose = true,
            label = "Vehículo",
            icon = "fas fa-car-alt",
            submenu = {
                {
                    shoudclose = false,
                    label = "Máscara",
                    submenu = false,
                    type = "client",
                    event = "cliente:pendiente",
                    icon = "fas fa-mask"
                },
            }
        },
        [4] = {
            shoudclose = true,
            label = "Ropa",
            submenu = {
                {
                    shoudclose = false,
                    label = "Máscara",
                    submenu = false,
                    type = "client",
                    event = "qb-radialmenu:ToggleClothing",
                    parameter = "Mask",
                    icon = "fas fa-mask"
                },
                {
                    shoudclose = false,
                    label = "Sombrero",
                    submenu = false,
                    type = "client",
                    event = "qb-radialmenu:ToggleProps",
                    parameter = "Hat",
                    icon = "fas fa-hat-cowboy-side"
                },
                {
                    shoudclose = false,
                    label = "Gafas",
                    submenu = false,
                    type = "client",
                    event = "qb-radialmenu:ToggleProps",
                    parameter = "Glasses",
                    icon = "fas fa-glasses"
                },
                {
                    shoudclose = false,
                    label = "Pelo",
                    submenu = false,
                    type = "client",
                    event = "qb-radialmenu:ToggleClothing",
                    parameter = "Hair",
                    icon = "fas fa-user"
                },
                {
                    shoudclose = false,
                    label = "Orejas",
                    submenu = false,
                    type = "client",
                    event = "qb-radialmenu:ToggleProps",
                    parameter = "Ear",
                    icon = "fas fa-assistive-listening-systems"
                },
                {
                    shoudclose = false,
                    label = "Cuello",
                    submenu = false,
                    type = "client",
                    event = "qb-radialmenu:ToggleClothing",
                    parameter = "Neck",
                    icon = "fas fa-user"
                },
                {
                    shoudclose = false,
                    label = "Top",
                    submenu = false,
                    type = "client",
                    event = 'qb-radialmenu:ToggleClothing',
                    parameter = "Top",
                    icon = "fas fa-tshirt"
                },
                {
                    shoudclose = false,
                    label = "Camiseta",
                    submenu = false,
                    type = "client",
                    event = "qb-radialmenu:ToggleClothing",
                    parameter = "Shirt",
                    icon = "fas fa-tshirt"
                },
                {
                    shoudclose = false,
                    label = "Pantalones",
                    submenu = false,
                    type = "client",
                    event = "qb-radialmenu:ToggleClothing",
                    parameter = "Pants",
                    icon = "fas fa-user"
                },
                {
                    shoudclose = false,
                    label = "Zapatos",
                    submenu = false,
                    type = "client",
                    event = 'qb-radialmenu:ToggleClothing',
                    parameter = "Shoes",
                    icon = "fas fa-shoe-prints"
                },
                {
                    shoudclose = false,
                    label = "Extras",
                    submenu = {
                        
                    
                        
                        {
                            shoudclose = false,
                            label = "Chaqueta",
                            submenu = false,
                            type = "client",
                            event = 'qb-radialmenu:ToggleClothing',
                            parameter = 'Top',
                            icon = "fas fa-tshirt"
                        },
                        {
                            shoudclose = false,
                            label = "Bolsas",
                            submenu = false,
                            type = "client",
                            event = "qb-radialmenu:ToggleClothing",
                            parameter = "Bagoff",
                            icon = "fas fa-briefcase"
                        },
                        {
                            shoudclose = false,
                            label = "Pulsera",
                            submenu = false,
                            type = "client",
                            event = 'qb-radialmenu:ToggleProps',
                            parameter = "Bracelet",
                            icon = "fas fa-hand-point-right"
                        },
                        {
                            shoudclose = false,
                            label = "Reloj",
                            submenu = false,
                            type = "client",
                            event = 'qb-radialmenu:ToggleProps',
                            parameter = "Watch",
                            icon = "fas fa-clock"
                        },
                        {
                            shoudclose = false,
                            label = "Guantes",
                            submenu = false,
                            type = "client",
                            event = 'qb-radialmenu:ToggleProps',
                            parameter = "Gloves",
                            icon = "fas fa-mitten"
                        },
                    },
                    type = "client",
                    
                    icon = "fas fa-plus-circle"
                },
            },
            icon = "fas fa-tshirt"
        },
        [5] = {
            shoudclose = true,
            label = "Objetos",
            submenu = {
                {
                    shoudclose = true,
                    label = "Más objetos",
                    submenu = false,
                    type = "client",
                    event = "cliente:pendiente",
                    icon = "fas fa-plus-circle"
                },
                {
                    shoudclose = true,
                    label = "Cerveza",
                    submenu = false,
                    type = "client",
                    event = "origen_menu:cerveza",
                    icon = "fas fa-beer"
                },
                {
                    shoudclose = true,
                    label = "Whisky",
                    submenu = false,
                    type = "client",
                    event = "origen_menu:whiskey",
                    icon = "fas fa-glass-whiskey"
                },
                {
                    shoudclose = true,
                    label = "Cámara",
                    submenu = false,
                    type = "client",
                    event = "origen_menu:camara",
                    icon = "fas fa-camera"
                },
                {
                    shoudclose = true,
                    label = "Bloc de Notas",
                    submenu = false,
                    type = "client",
                    event = "origen_menu:notepad",
                    icon = "fas fa-clipboard"
                }
                
            },
       
            icon = "fas fa-box",
            
        },

    },
    WorkMenu = {
        ["vehiculo"] = {
            {
                shoudclose = false,
                label = "On/Off Motor",
                submenu = false,
                type = "client",
                event = "origen_menu:motor",
                icon = "fas fa-car-alt"
            },
            {
                shoudclose = false,
                label = "Drift On/Off",
                submenu = false,
                type = "client",
                event = "origen_menu:drift",
                icon = "fas fa-car-alt"
            },
            -- {
            --     shoudclose = true,
            --     label = "Puertas",
            --     submenu = {
            --         {
            --             shoudclose = false,
            --             label = "Piloto",
            --             submenu = false,
            --             type = "client",
            --             event = "origen_menu:openDoor",
            --             parameter = "door0",
            --             icon = "fas fa-car-alt"
            --         },
            --         {
            --             shoudclose = false,
            --             label = "Copiloto",
            --             submenu = false,
            --             type = "client",
            --             event = "origen_menu:openDoor",
            --             parameter = "door1",
            --             icon = "fas fa-car-alt"
            --         },
            --         {
            --             shoudclose = false,
            --             label = "Trasera derecha",
            --             submenu = false,
            --             type = "client",
            --             event = "origen_menu:openDoor",
            --             parameter = "door3",
            --             icon = "fas fa-car-alt"
            --         },
            --         {
            --             shoudclose = false,
            --             label = "Trasera izquierda",
            --             submenu = false,
            --             type = "client",
            --             event = "origen_menu:openDoor",
            --             parameter = "door2",
            --             icon = "fas fa-car-alt"
            --         },
            --     },                
            --     icon = "fas fa-car-alt"
            -- },
           
            {
                shoudclose = true,
                label = "Acrobacias",
                submenu = {
                    {
                        shoudclose = true,
                        label = "Animación 1",
                        submenu = false,
                        type = "client",
                        event = "tricks:animation1",
                        parameter = -1,
                        icon = "fas fa-motorcycle"
                    },
                    {
                        shoudclose = true,
                        label = "Animación 2",
                        submenu = false,
                        type = "client",
                        event = "tricks:animation2",
                        parameter = 0,
                        icon = "fas fa-motorcycle"
                    },
                    {
                        shoudclose = true,
                        label = "Animación 3",
                        submenu = false,
                        type = "client",
                        event = "fas fa-motorcycle",
                        parameter = 2,
                        icon = "fas fa-motorcycle"
                    },
                    {
                        shoudclose = true,
                        label = "Animación 4",
                        submenu = false,
                        type = "client",
                        event = "tricks:animation4",
                        parameter = 1,
                        icon = "fas fa-motorcycle"
                    },
                    {
                        shoudclose = true,
                        label = "Animación 5",
                        submenu = false,
                        type = "client",
                        event = "tricks:animation5",
                        parameter = 1,
                        icon = "fas fa-motorcycle"
                    },
                },

                icon = "fas fa-motorcycle"
            },
            {
                shoudclose = false,
                label = "Maletero",
                submenu = false,
                type = "client",
                event = "origen_menu:openDoor",
                parameter = "door5",
                icon = "fas fa-car-alt"
            },
            {
                shoudclose = true,
                label = "Dar llaves",
                submenu = false,
                type = "client",
                event = "qb-vehiclekeys:giveKeysWithMenu",
                icon = "fas fa-key"
            }
        }
       
    }
}

Config = {}
Config.Commands = {
    ["top"] = {
        Func = function() ToggleClothing("Top") end,
        Sprite = "top",
        Desc = "Take your shirt off/on",
        Button = 1,
        Name = "Torso"
    },
    ["gloves"] = {
        Func = function() ToggleClothing("Gloves") end,
        Sprite = "gloves",
        Desc = "Take your gloves off/on",
        Button = 2,
        Name = "Gloves"
    },
    ["visor"] = {
        Func = function() ToggleProps("Visor") end,
        Sprite = "visor",
        Desc = "Toggle hat variation",
        Button = 3,
        Name = "Visor"
    },
    ["bag"] = {
        Func = function() ToggleClothing("Bag") end,
        Sprite = "bag",
        Desc = "Opens or closes your bag",
        Button = 8,
        Name = "Bag"
    },
    ["shoes"] = {
        Func = function() ToggleClothing("Shoes") end,
        Sprite = "shoes",
        Desc = "Take your shoes off/on",
        Button = 5,
        Name = "Shoes"
    },
    ["vest"] = {
        Func = function() ToggleClothing("Vest") end,
        Sprite = "vest",
        Desc = "Take your vest off/on",
        Button = 14,
        Name = "Vest"
    },
    ["hair"] = {
        Func = function() ToggleClothing("Hair") end,
        Sprite = "hair",
        Desc = "Put your hair up/down/in a bun/ponytail.",
        Button = 7,
        Name = "Hair"
    },
    ["hat"] = {
        Func = function() ToggleProps("Hat") end,
        Sprite = "hat",
        Desc = "Take your hat off/on",
        Button = 4,
        Name = "Hat"
    },
    ["glasses"] = {
        Func = function() ToggleProps("Glasses") end,
        Sprite = "glasses",
        Desc = "Take your glasses off/on",
        Button = 9,
        Name = "Glasses"
    },
    ["ear"] = {
        Func = function() ToggleProps("Ear") end,
        Sprite = "ear",
        Desc = "Take your ear accessory off/on",
        Button = 10,
        Name = "Ear"
    },
    ["neck"] = {
        Func = function() ToggleClothing("Neck") end,
        Sprite = "neck",
        Desc = "Take your neck accessory off/on",
        Button = 11,
        Name = "Neck"
    },
    ["watch"] = {
        Func = function() ToggleProps("Watch") end,
        Sprite = "watch",
        Desc = "Take your watch off/on",
        Button = 12,
        Name = "Watch",
        Rotation = 5.0
    },
    ["bracelet"] = {
        Func = function() ToggleProps("Bracelet") end,
        Sprite = "bracelet",
        Desc = "Take your bracelet off/on",
        Button = 13,
        Name = "Bracelet"
    },
    ["mask"] = {
        Func = function() ToggleClothing("Mask") end,
        Sprite = "mask",
        Desc = "Take your mask off/on",
        Button = 6,
        Name = "Mask"
    }
}