local isLightsOn = false
local isSirenOn = false
local currentVehicle = nil
local vehicleType = nil

-- Register keybinds for toggling lights and sirens
RegisterKeyMapping('toggleLights', 'Toggle Emergency Lights', 'keyboard', 'Q') -- Default: Q
RegisterKeyMapping('toggleSiren', 'Toggle Emergency Siren', 'keyboard', 'LCONTROL') -- Default: Left Ctrl

-- Function to check if the player is in an emergency vehicle
function isEmergencyVehicle()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle and DoesEntityExist(vehicle) then
        local model = GetEntityModel(vehicle)
        if Config.EmergencyVehicles[model] then
            currentVehicle = vehicle
            vehicleType = Config.EmergencyVehicles[model].type
            return true
        end
    end
    return false
end

-- Function to toggle lights
function toggleLights()
    if isEmergencyVehicle() then
        isLightsOn = not isLightsOn
        SetVehicleSiren(currentVehicle, isLightsOn)

        -- Disable the radio when lights are toggled
        if isLightsOn then
            SetVehicleRadioEnabled(currentVehicle, false)
        end

        -- Disable the default siren sound
        DisableVehicleDefaultSirenSound(currentVehicle)
    end
end

-- Function to disable the default siren sound
function DisableVehicleDefaultSirenSound(vehicle)
    SetVehicleHasMutedSirens(vehicle, true) -- Mutes the default siren sound
end

-- Function to toggle siren
function toggleSiren()
    if isEmergencyVehicle() and isLightsOn then
        isSirenOn = not isSirenOn
        local vehicleNetId = VehToNet(currentVehicle) -- Get the vehicle's network ID
        TriggerServerEvent('sirenControl:syncSiren', vehicleNetId, isSirenOn)
    end
end

-- Event to update siren state for all players
RegisterNetEvent('sirenControl:updateSiren', function(vehicleNetId, sirenState)
    local vehicle = NetToVeh(vehicleNetId) -- Convert network ID back to vehicle entity
    if vehicle and DoesEntityExist(vehicle) then
        SetVehicleHasMutedSirens(vehicle, not sirenState) -- Enable/disable siren sound
    end
end)

-- Register commands for keybinds
RegisterCommand('toggleLights', function()
    toggleLights()
end, false)

RegisterCommand('toggleSiren', function()
    toggleSiren()
end, false)

-- Key controls
CreateThread(function()
    while true do
        Wait(0)
        if isEmergencyVehicle() then
            -- Disable the default E keybind for toggling lights
            DisableControlAction(0, 86, true) -- 86 = E (light toggle)
        end
    end
end)