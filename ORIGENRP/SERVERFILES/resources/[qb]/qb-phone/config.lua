Config = Config or {}

Config.RepeatTimeout = 2000
Config.CallRepeats = 10
Config.OpenPhone = 244
Config.PhoneApplications = {
    ["phone"] = {
        app = "phone",
        color = "#FFFFFF",
        icon = "fa fa-phone-alt",
        tooltipText = "Teléfono",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 1,
        Alerts = 0,
    },
    ["whatsapp"] = {
        app = "whatsapp",
        color = "#FFFFFF",
        icon = "fab fa-whatsapp",
        tooltipText = "Whatsapp",
        tooltipPos = "top",
        style = "font-size: 2.8vh";
        job = false,
        blockedjobs = {},
        slot = 2,
        Alerts = 0,
    },
    ["darkchat"] = {
        app = "darkchat",
        color = "#FFFFFF",
        icon = "fas fa-mask",
        tooltipText = "Dark Chat",
        tooltipPos = "top",
        style = "padding-right: .08vh; font-size: 2.3vh";
        job = false,
        blockedjobs = {},
        slot = 3,
        Alerts = 0,
    },
    ["twitter"] = {
        app = "twitter",
        color = "#FFFFFF",
        icon = "fab fa-twitter",
        tooltipText = "Twitter",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 4,
        Alerts = 0,
    },
    ["mail"] = {
        app = "mail",
        color = "#FFFFFF",
        icon = "fas fa-envelope",
        tooltipText = "Correo",
        job = false,
        blockedjobs = {},
        slot = 5,
        Alerts = 0,
    },
    ["advert"] = {
        app = "advert",
        color = "#FFFFFF",
        icon = "fas fa-newspaper",
        tooltipText = "Anuncios",
        job = false,
        blockedjobs = {},
        slot = 6,
        Alerts = 0,
    },
    ["bank"] = {
        app = "bank",
        color = "#FFFFFF",
        icon = "fas fa-university",
        tooltipText = "Banco",
        job = false,
        blockedjobs = {},
        slot = 7,
        Alerts = 0,
    },
    ["settings"] = {
        app = "settings",
        color = "#FFFFFF",
        icon = "fa fa-cog",
        tooltipText = "Ajustes",
        style = "padding-right: .08vh; font-size: 2.3vh";
        job = false,
        blockedjobs = {},
        slot = 8,
        Alerts = 0,
    },
   --[[ ["store"] = {
        app = "store",
        color = "#27ae60",
        icon = "fas fa-cart-arrow-down",
        tooltipText = "App Store",
        tooltipPos = "right",
        style = "padding-right: .3vh; font-size: 2.2vh";
        job = false,
        blockedjobs = {},
        slot = 14,
        Alerts = 0,
    },]]
    -- ["trucker"] = {
    --     app = "trucker",
    --     color = "#cccc33",
    --     icon = "fas fa-truck-moving",
    --     tooltipText = "Dumbo",
    --     tooltipPos = "right",
    --     job = false,
    --     blockedjobs = {},
    --     slot = 17,
    --     Alerts = 0,
    -- },
}
Config.MaxSlots = 20

Config.StoreApps = {
    ["territory"] = {
        app = "territory",
        color = "#FFFFFF",
        icon = "fas fa-globe-europe",
        tooltipText = "Territorium",
        tooltipPos = "right",
        style = "";
        job = false,
        blockedjobs = {},
        slot = 15,
        Alerts = 0,
        password = true,
        creator = "Qbus",
        title = "Territory",
    },
}
