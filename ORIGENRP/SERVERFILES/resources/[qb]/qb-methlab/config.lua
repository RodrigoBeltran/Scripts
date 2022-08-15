Config = Config or {}

Config.MinZOffset = 30
Config.CurrentLab = 0
Config.CooldownActive = false

Config.Locations = {
    laboratories = {
        [1] = {
            coords = vector4(-297.0, -2201.8, 10.0, 145.0),
        },
    },
    exit = {
        coords = vector4(-297.8, -2203.0, 10.0, 325.0),
    },
    laptop = {
        coords = vector4(-295.0, -2206.0, 10.0, 325.0),
        inUse = false,
    }
}

Config.Tasks = {
    -- First step
    furnace = {
        coords = vector4(-299.3, -2207.2, 10.0, 145.0),
        duration = 120,
        items = {
            needed = {
                acetone = 3,
                ephedrine = 3,
                hydrochloricacid = 3,
            },
            given = {
                methtray = 3,
            },
        },
        timeremaining = 0,
        started = false,
        done = false,
    },
    -- Second step
    breakMeth = {
        coords = vector4(-297.6, -2208.5, 10.0, 145.0),
        duration = {
            min = 10000,
            max = 12000,
        },
        items = {
            needed = {
                methtray = 1,
                -- puremethtray = 1,
            },
            given = {
                meth = {
                    min = 8,
                    max = 12,
                },
                -- puremeth = {
                --     min = 8,
                --     max = 12,
                -- },
            },
        },
    },
}

-- Meth runs.
Config.StartMethPayment = 0 -- How much you pay at the start to start the run
Config.RunAmount = math.random(7,10) -- How many drop offs the player does before it automatixally stops.
Config.Payment = math.random(50, 120) -- How much you get paid when RN Jesus doesnt give you Meth, divided by 2 for when it does.
-- Config.Item = "ephedrine" -- The item you receive from the Meth run. Should be Meth right??
Config.MethChance = 999 -- Percentage chance of getting Meth on the run. Multiplied by 100. 10% = 100, 20% = 200, 50% = 500, etc. Default 55%.
Config.MethAmount = 1 -- How much Meth you get when RN Jesus gives you Meth. Default: 1.
Config.BigRewarditemChance = 1 -- Percentage of getting rare item on Meth run. Multiplied by 100. 0.1% = 1, 1% = 10, 20% = 200, 50% = 500, etc. Default 0.1%.
Config.BigRewarditem = "security_card_02" -- Put a rare item here which will have 0.1% chance of being given on the run.
Config.MethCars = "CHECK THE CODE" -- Cars
Config.DropOffs = "CHECK THE CODE" -- Drop off spots

--Robbery

Config.Pharmacy = {
    ["takeables"] = {
        [1] = {
            x = -170.39, 
            y = 6386.89, 
            z = 31.50,
            isDone = false,
            isBusy = false,
            reward =  {name = "psuedoephedrine", amount = 3},
        },
        [2] = {
            x = -174.28, 
            y = 6386.15, 
            z = 31.50,
            isDone = false,
            isBusy = false,
            reward =  {name = "psuedoephedrine", amount = 4},
        },
        [3] = {
            x = -175.06, 
            y = 6381.07, 
            z = 31.50,
            isDone = false,
            isBusy = false,
            reward =  {name = "psuedoephedrine", amount = 3},
        },
        [4] = {
            x = -176.59, 
            y = 6382.70, 
            z = 31.50,
            isDone = false,
            isBusy = false,
            reward =  {name = "psuedoephedrine", amount = 5},
        },
        [5] = {
            x = -176.37, 
            y = 6383.89, 
            z = 31.50,
            isDone = false,
            isBusy = false,
            reward =  {name = "psuedoephedrine", amount = 4},
        },
    },
}
