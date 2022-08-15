Config = {}

Config.enableVehiclePics = false

Config.enableRobberyPics = false

-- Credits to enp-forzar -> https://github.com/69Terminator69/enp-forzar/blob/main/enp-forzar/config.lua

Config.Locale = 'es'

-- Set the time (in minutes) during the player is outlaw
Config.Timer = 1

-- Set if show alert when player use gun
Config.GunshotAlert = true

-- Set if show when player do carjacking
Config.CarJackingAlert = false

-- Set if show when player fight in melee
Config.MeleeAlert = false

-- In seconds
Config.BlipGunTime = 30 -- 15 saniye  boyunca blip gösterir.

-- Blip radius, in float value!
Config.BlipGunRadius = 50.0

-- In seconds
Config.BlipMeleeTime = 30 -- 10 saniye  boyunca blip gösterir.

-- Blip radius, in float value!
Config.BlipMeleeRadius = 50.0

-- In seconds
Config.BlipJackingTime = 30 -- 20 saniye  boyunca blip gösterir.

-- Blip radius, in float value!
Config.BlipJackingRadius = 50.0

-- Show notification when cops steal too?
Config.ShowCopsMisbehave = false

-- Jobs in this table are considered as cops
Config.WhitelistedCops = {
    'police'
}

Config.Colors = {
	[0] = "Negro Metalizado",
    [1] = "Negro Grafito Metalizado",
    [2] = "Negro Acero Metalizado",
    [3] = "Plata oscura Metalizado",
    [4] = "Plata Metalizado",
    [5] = "Azul Plateado Metalizado",
    [6] = "Gris Acero Metalizado",
    [7] = "Sombra Plateado Metalizado",
    [8] = "Piedra Plateada Metalizado",
    [9] = "Plateado Media noche Metalizado",
    [10] = "Metal de pistola Metalizado",
    [11] = "Gris Antracita Metalizado",
    [12] = "Negro Mate",
    [13] = "Gris Mate",
    [14] = "Gris Claro Mate",
    [15] = "Negro Nacarado",
    [16] = "Negro Nacarado 2",
    [17] = "Plateado Oscuro Nacarado",
    [18] = "Plateado Nacarado",
    [19] = "Metal de Pistola Nacarado",
    [20] = "Sombra Plateado Nacarado",
    [21] = "Negro Desgastado",
    [22] = "Negro Grafito Desgastado",
    [23] = "Gris Plateado Desgastado",
    [24] = "Plateado Desgastado",
    [25] = "Azul Plateado Desgastado",
    [26] = "Sombra Plateado Desgastado",
    [27] = "Rojo Metalizado",
    [28] = "Rojo Torino Metalizado",
    [29] = "Rojo Formula Metalizado",
    [30] = "Rojo Fuego Metalizado",
    [31] = "Rojo Elegante Metalizado",
    [32] = "Granate Metalizado",
    [33] = "Rojo Desierto Metalizado",
    [34] = "Rojo Vino Metalizado",
    [35] = "Rojo Caramelo Metalizado",
    [36] = "Naranja Amanecer Metalizado",
    [37] = "Oro Clasico Metalizado",
    [38] = "Naranja Metalizado",
    [39] = "Rojo Mate",
    [40] = "Rojo Oscuro Mate",
    [41] = "Naranja Mate",
    [42] = "Amarillo Mate",
    [43] = "Rojo Nacarado",
    [44] = "Rojo Brillante Nacarado",
    [45] = "Granate Nacarado",
    [46] = "Rojo Desgastado",
    [47] = "Rojo Dorado Desgastado",
    [48] = "Rojo Oscuro Desgastado",
    [49] = "Verde Oscuro Metalizado",
    [50] = "Verde de Carreras Metalizado",
    [51] = "Verde Mar Metalizado",
    [52] = "Verde Oliva Metalizado",
    [53] = "Verde Metalizado",
    [54] = "Verde Azulado Metalizado",
    [55] = "Verde Lima Mate",
    [56] = "Verde Oscuro Nacarado",
    [57] = "Verde Nacarado",
    [58] = "Verde Oscuro Desgastado",
    [59] = "Verde Desgastado",
    [60] = "Mar Desgastado",
    [61] = "Azul Media Noche Metalizado",
    [62] = "Azul Oscuro Metalizado",
    [63] = "Azul Sajonia Metalizado",
    [64] = "Azul Metalizado",
    [65] = "Azul Marino Metalizado",
    [66] = "Azul Puerto Metalizado",
    [67] = "Azul Diamante Metalizado",
    [68] = "Azul Surf Metalizado",
    [69] = "Azul Nautico Metalizado",
    [70] = "Azul Brillante Metalizado",
    [71] = "Morado Azulado Metalizado",
    [72] = "Azul balón Metalizado",
    [73] = "Azul Ultra Metalizado",
    [74] = "Azul Brillante Metalizado",
    [75] = "Azul Oscuro Nacarado",
    [76] = "Azul Media Noche Nacarado",
    [77] = "Azul Nacarado",
    [78] = "Azul Coral Nacarado",
    [79] = "Azul Relámpago Nacarado",
    [80] = "Azul Maui Poly Nacarado",
    [81] = "Azul Brillante Nacarado",
    [82] = "Azul Oscuro Mate",
    [83] = "Azul Mate",
    [84] = "Azul Media Noche Mate",
    [85] = "Azul Oscuro Desgastado",
    [86] = "Azul Desgastado",
    [87] = "Azul Claro Desgastado",
    [88] = "Amarillo Taxi Metalizado",
    [89] = "Amarillo de Carreras Metalizado",
    [90] = "Bronce Metalizado",
    [91] = "Amarillo Pajaro Metalizado ",
    [92] = "Lima Metalizado",
    [93] = "Champan Metalizado",
    [94] = "Beige Metalizado",
    [95] = "Marfíl Oscuro Metalizado",
    [96] = "Marron Chocolate Metalizado",
    [97] = "Marron Dorado Metalizado",
    [98] = "Marron Claro Metalizado",
    [99] = "Beige Paja Metalizado",
    [100] = "Marron Musgo Metalizado",
    [101] = "Marron Pan Metalizado",
    [102] = "Marron Madera Metalizado",
    [103] = "Marron Madera Oscuro Metalizado",
    [104] = "Naranja Chocolate Metalizado",
    [105] = "Arena Metalizado",
    [106] = "Arena Blanca Metalizado",
    [107] = "Crema Metalizado",
    [108] = "Marron Nacarado",
    [109] = "Marron Normal Nacarado",
    [110] = "Marron Claro Nacarado",
    [111] = "Blanco Metalizado",
    [112] = "Blanco Hielo Metalizado",
    [113] = "Beige Miel Desgastado",
    [114] = "Marron Desgastado",
    [115] = "Marron Oscuro Desgastado",
    [116] = "Beige Paja Desgastado",
    [117] = "Acero Cepillado",
    [118] = "Acero Oscuro Cepillado",
    [119] = "Aluminio Cepillado",
    [120] = "Cromado",
    [121] = "Blanco Desgastado",
    [122] = "Blanco Nacarado",
    [123] = "Naranja Desgastado",
    [124] = "Naranja Claro Desgastado",
    [125] = "Verde Esperanza Metalizado",
    [126] = "Amarillo Taxi Desgastado",
    [127] = "Azul de Policia",
    [128] = "Verde Mate",
    [129] = "Marron Mate",
    [130] = "Naranja Desgastado",
    [131] = "Blanco Mate",
    [132] = "Blanco Desgastado",
    [133] = "Verde Militar Desgastado",
    [134] = "Blanco Puro",
    [135] = "Rosa",
    [136] = "Rosa Salmon",
    [137] = "Rosa Bermellon Metalizado",
    [138] = "Naranja",
    [139] = "Verde",
    [140] = "Azul",
    [141] = "Negro Azulado Metalizado",
    [142] = "Morado Ennegrecido Metalizado",
    [143] = "Rojo Ennegrecido Metalizado",
    [144] = "Verde Cazador",
    [145] = "Morado Metalizado",
    [146] = "Azul Oscuro Metalizado",
    [147] = "Negro",
    [148] = "Morado Mate",
    [149] = "Morado Oscuro Mate",
    [150] = "Rojo Lava Metalizado",
    [151] = "Verde Bosque Mate",
    [152] = "Verde Triste Mate",
    [153] = "Marron Desierto Mate",
    [154] = "Bronce Desierto Mate",
    [155] = "Verde Follaje Mate",
    [156] = "Aleación Predeterminado",
    [157] = "Azul Epsilon",
    [158] = "Oro Puro",
    [159] = "Oro Cepillado",
}