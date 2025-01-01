Config = {}

-- Define emergency vehicles and their types
Config.EmergencyVehicles = {
    [`gbpolbisonhf`] = { type = 'police' },
    [`gbpolbisonstx`] = { type = 'police' },
    [`gbpolcometcl`] = { type = 'police' },
    [`gbpolcomets2r`] = { type = 'police' },
    [`gbpoldominatorgsx`] = { type = 'police' },
    [`gbpoltr3s`] = { type = 'police' },
    [`gbpolprospero`] = { type = 'police' },
    [`gbpolsolace`] = { type = 'police' },
    [`gbpolstanierle`] = { type = 'police' },
    [`gbpolstarlight`] = { type = 'police' },
    [`gbpolsultanrsx`] = { type = 'police' },
    [`gbtahomagt`] = { type = 'police' },
    [`gbpoltahomagt`] = { type = 'police' },
    [`gbpolturismogt`] = { type = 'police' },
    [`gbemsbisonstx`] = { type = 'ems' },
    [`gbfirevoyager`] = { type = 'fire' }
}

-- Define siren sounds for each type
Config.SirenSounds = {
    police = { 'VEHICLES_HORNS_SIREN_1', 'VEHICLES_HORNS_SIREN_2' }, -- Police sirens
    ems = { 'VEHICLES_HORNS_AMBULANCE_WARNING' }, -- EMS sirens
    fire = { 'VEHICLES_HORNS_FIRETRUCK_WARNING' } -- Fire truck sirens
}