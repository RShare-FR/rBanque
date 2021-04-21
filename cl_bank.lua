ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent("solde:argent")
AddEventHandler("solde:argent", function(money, cash)
    PlayerMoney = tonumber(money)
end)


Citizen.CreateThread(function()
    while true do
        Config.GetPlayerMoney()
        Wait(2500)
    end
end)


function ShowHelpNotification2(msg, thisFrame)
	AddTextEntry('HelpNotification', msg)
	DisplayHelpTextThisFrame('HelpNotification', false)
end


Citizen.CreateThread(function()
    while true do
        local pPed = GetPlayerPed(-1)
        local pCoords = GetEntityCoords(pPed)
		local pacifi = false
		local dst = GetDistanceBetweenCoords(pCoords, true)
        for k,v in pairs(config.pacique) do
            if #(pCoords - v.pos) < 1.5 then
                DrawMarker(22, v.pos.x, v.pos.y, v.pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 170, 106, 7, 170, 1, 1, 2, 0, nil, nil, 0)
                pacifi = true
                ShowHelpNotification2("Appuyez sur ~INPUT_PICKUP~ pour ouvrir la gestion de votre compte.")
				if IsControlJustReleased(0, 38) then
					openP(v)
				end
            end
        end

        if pacifi then
            Wait(1)
        else
            Wait(500)
        end
	end
end)






-- Pacifique Banque

local openPacifique
RMenu.Add('rBanqueP', 'main', RageUI.CreateMenu(nil, "", 10,222,"pacifique", "interaction_bgd"))
RMenu:Get('rBanqueP', 'main'):SetSubtitle('     ')
RMenu:Get('rBanqueP', 'main').EnableMouse = false
RMenu:Get('rBanqueP', 'main').Closed = function()
	openPacifique = false
end





function openP()
	if not openPacifique then
		openPacifique = true
        RageUI.Visible(RMenu:Get('rBanqueP', 'main'), true)
        
    Citizen.CreateThread(function()
        while openPacifique do
            
			Citizen.Wait(1)
                RageUI.IsVisible(RMenu:Get('rBanqueP', 'main'), true, true, true, function()
                    RageUI.Separator("Votre solde : ~o~".. PlayerMoney .."$")

                    RageUI.ButtonWithStyle("Déposer de l'argent", "~o~Permet de déposer de l'argent." ,{RightLabel = "→"}, true, function(Hovered, Active, Selected) 
						if (Selected) then 
							depot_argentp()
						end 
					end)
					RageUI.ButtonWithStyle("Retirer de l'argent", "~o~Permet de retirer de l'argent. \nSi vous retirer beaucoup d'argent protegez vous !", {RightLabel = "→"}, true, function(Hovered, Active, Selected) 
						if (Selected) then 
							retire_argentp()
						end 
					end)
				end)
			end
		end)
	end
end

-- Fleeca banque 
local openBanque = false
RMenu.Add('rBanque', 'main', RageUI.CreateMenu(nil, "", 10,222,"fleeca", "interaction_bgd"))
RMenu:Get('rBanque', 'main'):SetSubtitle("rBanque")
RMenu:Get('rBanque', 'main').EnableMouse = false
RMenu:Get('rBanque', 'main').Closed = function()
	openBanque = false
end





function openT()
	if not openBanque then
		openBanque = true
        RageUI.Visible(RMenu:Get('rBanque', 'main'), true)
        
    Citizen.CreateThread(function()
        while openBanque do
            
			Citizen.Wait(1)
                RageUI.IsVisible(RMenu:Get('rBanque', 'main'), true, true, true, function()
                    RageUI.Separator("Votre solde : ~g~".. PlayerMoney .."$")

                    RageUI.ButtonWithStyle("Déposer de l'argent", "~b~Permet de déposer de l'argent. \nVous ne pouvez pas déposer plus de 9999$ \n~r~(Allez à la Pacifique Banque pour plus)" ,{RightLabel = "→"}, true, function(Hovered, Active, Selected) 
						if (Selected) then 
							depot_argent()
						end 
					end)
					RageUI.ButtonWithStyle("Retirer de l'argent", "~b~Permet de retirer de l'argent. \nVous ne pouvez pas retirer plus de 9999$ \n~r~(Allez à la Pacifique Banque pour plus)", {RightLabel = "→"}, true, function(Hovered, Active, Selected) 
						if (Selected) then 
							retire_argent()
						end 
					end)
				end)
			end
		end)
	end
end



Citizen.CreateThread(function()
    while true do
        local pPed = GetPlayerPed(-1)
        local pCoords = GetEntityCoords(pPed)
		local shops = false
		local dst = GetDistanceBetweenCoords(pCoords, true)
        for k,v in pairs(config.banque) do
			if #(pCoords - v.pos) < 1.5 then
                shops = true
                ShowHelpNotification2("Appuyez sur ~INPUT_PICKUP~ pour ouvrir la gestion de votre compte.")
				if IsControlJustReleased(0, 38) then
					openT(v)
				end
            end
        end

        if shops then
            Wait(1)
        else
            Wait(500)
        end
	end
end)


Citizen.CreateThread(function()
    while true do
        local pPed = GetPlayerPed(-1)
        local pCoords = GetEntityCoords(pPed)
		local atm = false
		local dst = GetDistanceBetweenCoords(pCoords, true)
        for k,v in pairs(config.atm) do
			if #(pCoords - v.pos) < 1.5 then
                atm = true
                ShowHelpNotification2("Appuyez sur ~INPUT_PICKUP~ pour ouvrir la gestion de votre compte.")
				if IsControlJustReleased(0, 38) then
					openT(v)
				end
            end
        end

        if atm then
            Wait(1)
        else
            Wait(500)
        end
	end
end)


-- Function



function retire_argentp()
    local amount = KeyboardInput('RShare', ('Retirer de l\'argent à la Fleeca'), '', 20)

    if amount ~= nil then
        amount = tonumber(amount)

        if type(amount) == 'number' then
            TriggerServerEvent('RetireArgentP', amount)
        end
    end
end	



function depot_argentp()
    local amount = KeyboardInput('RShare', ('Déposer de l\'argent à la Fleeca'), '', 20)

    if amount ~= nil then
        amount = tonumber(amount)

        if type(amount) == 'number' then
            TriggerServerEvent('PoserArgentP', amount)
        end
    end
end



function retire_argent()
    local amount = KeyboardInput('PRL V4', ('Retirer de l\'argent à la Fleeca'), '', 4)

    if amount ~= nil then
        amount = tonumber(amount)

        if type(amount) == 'number' then
            TriggerServerEvent('RetireArgent', amount)
        end
    end
end	



function depot_argent()
    local amount = KeyboardInput('RShare', ('Déposer de l\'argent à la Fleeca'), '', 4)

    if amount ~= nil then
        amount = tonumber(amount)

        if type(amount) == 'number' then
            TriggerServerEvent('PoserArgent', amount)
        end
    end
end




function DrawMissionText(msg, time)
    ClearPrints()
    SetTextEntry_2('STRING')
    AddTextComponentString(msg)
    DrawSubtitleTimed(time, 1)
  end

function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)
    blockinput = true 	
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return result
    else
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end

blips = true
Citizen.CreateThread(function()
        Citizen.Wait(0)
         if blips then
            for _, info in pairs(config.blips) do
            info.blip = AddBlipForCoord(info.x, info.y, info.z)
            SetBlipSprite(info.blip, info.id)
            SetBlipDisplay(info.blip, 4)
            SetBlipScale(info.blip, 0.7)
            SetBlipColour(info.blip, info.color)
            SetBlipAsShortRange(info.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(info.name)
            EndTextCommandSetBlipName(info.blip)
        end
    end
end)


RegisterCommand("position", function(source, args, rawCommand)
    print(GetEntityCoords(GetPlayerPed(-1)) .. " - "..GetEntityHeading(GetPlayerPed(-1)))
end, false)
