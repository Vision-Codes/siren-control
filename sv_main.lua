-- Event to sync siren state across all players
RegisterServerEvent('sirenControl:syncSiren', function(vehicleNetId, sirenState)
    TriggerClientEvent('sirenControl:updateSiren', -1, vehicleNetId, sirenState)
end)