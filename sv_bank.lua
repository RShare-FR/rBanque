ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)










RegisterServerEvent("RetireArgent")
AddEventHandler("RetireArgent", function(money)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local total = money
    local xMoney = xPlayer.getBank()
    
    if xMoney >= total then

     xPlayer.removeAccountMoney('bank', total)
     xPlayer.addMoney(total)
         TriggerClientEvent('esx:showAdvancedNotification', _source, '~g~Fleeca Bank', '~g~Fleeca', "~g~Vous avez retiré "..total.." $ de la banque", 'CHAR_BANK_FLEECA', 10)
    else
         TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas tout cette d\'argent !")
    end    
end) 

RegisterServerEvent("PoserArgent")
AddEventHandler("PoserArgent", function(money)
     local _source = source
     local xPlayer = ESX.GetPlayerFromId(_source)
     local total = money
     local xMoney = xPlayer.getMoney()
    
     if xMoney >= total then

     xPlayer.addAccountMoney('bank', total)
     xPlayer.removeMoney(total)
          TriggerClientEvent('esx:showAdvancedNotification', _source, '~g~Fleeca Bank', '~g~Fleeca', "~g~Vous avez déposer "..total.." $ en banque", 'CHAR_BANK_FLEECA', 10)
    else
         TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas tout cette d\'argent !")
    end    
end)


-- Pacifique 


RegisterServerEvent("RetireArgentP")
AddEventHandler("RetireArgentP", function(money)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local total = money
    local xMoney = xPlayer.getBank()
    
    if xMoney >= total then

    xPlayer.removeAccountMoney('bank', total)
    xPlayer.addMoney(total)
 
         TriggerClientEvent('esx:showAdvancedNotification', _source, '~o~Pacifique Banque', '~o~Pacifique', "~o~Vous avez retiré "..total.." $ de la banque", 'CHAR_MP_PROF_BOSS', 10)
    else
         TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas tout cette d\'argent !")
    end    
end) 

RegisterServerEvent("PoserArgentP")
AddEventHandler("PoserArgentP", function(money)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local total = money
    local xMoney = xPlayer.getMoney()
    
    if xMoney >= total then

    xPlayer.addAccountMoney('bank', total)
    xPlayer.removeMoney(total)
         TriggerClientEvent('esx:showAdvancedNotification', _source, '~o~Pacifique Banque', '~o~Pacifique', "~o~Vous avez déposer "..total.." $ en banque", 'CHAR_MP_PROF_BOSS', 10)
    else
         TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas tout cette d\'argent !")
    end    
end)



RegisterServerEvent("bank:solde") 
AddEventHandler("bank:solde", function(action, amount)
     local _source = source
     local xPlayer = ESX.GetPlayerFromId(_source)
     local playerMoney = xPlayer.getBank()
     if xPlayer ~= nil then
          TriggerClientEvent("solde:argent", _source, playerMoney)
     end
end)




