local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module('vrp', 'lib/Proxy')
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vRP_gunshop")
hasMoney = false

RegisterNetEvent("FNR:checkParachuteMoney")
AddEventHandler("FNR:checkParachuteMoney", function()
    local source = source
    user_id = vRP.getUserId({source})
    local bankBalance = vRP.getBankMoney({user_id})
    if bankBalance >= 15000 then
        newBalance = bankBalance - 15000
        vRP.setBankMoney({user_id, newBalance})
        hasMoney = true
        vRPclient.notify(user_id, {"~g~You have paid £15,000 to parachute."})
        TriggerClientEvent("FNR:PlaySound", source, 1)
        TriggerClientEvent("FNR:goParachuting", source, 1)
    else
        vRPclient.notify(user_id, {"~r~You do not have enough money."})
    end
end)