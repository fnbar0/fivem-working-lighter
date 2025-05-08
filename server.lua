local ESX = exports["es_extended"]:getSharedObject()
ESX.RegisterUsableItem('lighter', function(source)
	TriggerClientEvent('simplelighter:useLighter', source)
end)
RegisterCommand('lighter', function(source)
    TriggerClientEvent('simplelighter:useLighter', source)
end)
RegisterNetEvent('simplelighter:fireSync')
AddEventHandler('simplelighter:fireSync', function(coords)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local ped = GetPlayerPed(_source)
    if #(GetEntityCoords(ped) - coords) > 10 then return print(("Player [%d] tried to start fire while being too far from the target coords"):format(_source)) end
    if xPlayer.getInventoryItem("lighter").count <= 0 then return print(("Player [%d] tried to start fire without lighter"):format(_source)) end
    local randomDelay = math.random(10000, 20000)
    TriggerClientEvent('simplelighter:fireSync', -1, coords, randomDelay)
end)