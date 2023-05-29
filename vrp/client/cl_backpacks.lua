--[[local backpacks = {}
local selectedBackPack = nil
local playerRecentCustomizations = nil
local bool = false
local currentBackPack = nil

RMenu.Add('vRPBackpacks', 'main', RageUI.CreateMenu("", "Backpack Store",1300, 50, "banners", "garages"))
RMenu.Add('vRPBackpacks', 'submenu', RageUI.CreateMenu("", "Backpack Purchase",1300, 50, "banners", "garages"))
RageUI.CreateWhile(1.0, RMenu:Get('vRPBackpacks', 'main'), nil, function()
    RageUI.IsVisible(RMenu:Get('vRPBackpacks', 'main'), true, false, true, function() 
        for k,v in pairs() do 
            RageUI.Button(v[1], v[2], {RightLabel = "→→→"}, true, function(Hovered, Active, Selected)
            end, RMenu:Get('vRPBackpacks', 'submenu'))
        end
    end)
end)

function previewBackpack(selectedBackPack)
    local prop0,prop1,prop2,backpackname,price,size,backpackstorename=selectedBackPack[1],selectedBackPack[2],selectedBackPack[3],selectedBackPack[4],selectedBackPack[5],selectedBackPack[6],selectedBackPack[7]
    SetPedComponentVariation(GetPlayerPed(PlayerId()),prop0,prop1,prop2,2)
end
function removeBackpack()
    if currentBackPack~=nil then 
        ped=GetPlayerPed(PlayerId())
        SetPedComponentVariation(GetPlayerPed(PlayerId()),5,0,0,2)
        currentBackPack=nil
        selectedBackPack=nil 
    end 
end
RegisterNetEvent("FNR:boughtBackpack")
AddEventHandler("FNR:boughtBackpack",function(prop0,prop1,prop2,size,backpackname)
    currentBackPack=backpackname
    SetPedComponentVariation(GetPlayerPed(PlayerId()),prop0,prop1,prop2,2)
    notify("~g~"..backpackname.." Purchased")
    playerRecentCustomizations=nil
    Wait(250)
    EnableAllControlActions(1)
end)
RegisterNetEvent("FNR:removeBackpack2")
AddEventHandler("FNR:removeBackpack2",function()
    removeBackpack()
end)
RegisterCommand("storebackpack",function()
    if currentBackPack~=nil then 
        TriggerServerEvent("FNR:storeBackpack",currentBackPack,true,false)
    end 
end)
Citizen.CreateThread(function()
    if true then
        --if isInArea(backpacks.coords, v.blipWidth) and not inRedZone then 
        Wait(1)
    end
end)

RegisterNetEvent("vRP:getBackPacks")
AddEventHandler("vRP:getBackPacks", function(a)
    if a ~= nil then
        backpacks = a
    end
    for k,v in pairs(backpacks) do
        for c,d in paurs(v) do
            if c=="_config" then
                local l,w,x,y,z,A,B,C=table.unpack(u)
                if C then
                    local blip = AddBlipForRadius(x,y,z,A)
                    SetBlipColour(blip, 2)
                    SetBlipAlpha(blip, 170)
                end
            end
        end
    end
end)]]