
--db items and found/notfound

ESX = nil

TriggerEvent("esx:getSharedObject", function(response)
    ESX = response
end)

RegisterServerEvent('krp_pickweed:getItem')
AddEventHandler('krp_pickweed:getItem', function()


        local xPlayer = ESX.GetPlayerFromId(source)
        local sourceItem = xPlayer.getInventoryItem('weed')
        local quantity = 1
        local itemfound = ESX.GetItemLabel(randomItems)

    if sourceItem.limit ~= -1 and (sourceItem.count + quantity) > sourceItem.limit then 
        TriggerClientEvent('esx:showNotification', source, '~r~You have enough weed')
    else
        xPlayer.addInventoryItem('weed', quantity)
        TriggerClientEvent('esx:showNotification', source, 'You found ' .. quantity .. ' gram of ' .. itemfound)
    end
end)
