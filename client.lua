local button = 244 
local commandEnabled = false


Citizen.CreateThread(function()
    if commandEnabled then
        RegisterCommand('engine', function() 
            toggleEngine()
        end, false)
    end
    while true do
        Citizen.Wait(0)
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        
        if (IsControlJustReleased(0, button) or IsDisabledControlJustReleased(0, button)) and vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
            toggleEngine()
        end
        
    end
end)

function toggleEngine()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
        SetVehicleEngineOn(vehicle, (not GetIsVehicleEngineRunning(vehicle)), false, true)
    end
end

