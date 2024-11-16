RegisterNetEvent('simplelighter:useLighter')
AddEventHandler('simplelighter:useLighter', function()
    local playerPed = PlayerPedId()
    local offset = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 1.3, -1.0)
    FreezeEntityPosition(playerPed, true)
    RequestAnimSet("move_ped_crouched")
    while not HasAnimSetLoaded("move_ped_crouched") do
        Citizen.Wait(100)
    end

    SetPedMovementClipset(playerPed, "move_ped_crouched", 0.25)

    RequestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
    while not HasAnimDictLoaded("anim@amb@clubhouse@tutorial@bkr_tut_ig3@") do
        Citizen.Wait(0)
    end

    TaskPlayAnim(playerPed, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, 1.0, -1, 49, 0, false, false, false)
    Citizen.Wait(5000) 
    ClearPedTasks(playerPed)
    ResetPedMovementClipset(playerPed, 0.25) 
    FreezeEntityPosition(playerPed, false)
    TriggerServerEvent('simplelighter:fireSync', offset)
end)

RegisterNetEvent('simplelighter:fireSync')
AddEventHandler('simplelighter:fireSync', function(coords, delay)
    local fire = StartScriptFire(coords, 15, false)
    Citizen.SetTimeout(delay, function()
        RemoveScriptFire(fire)
    end)
end)