local QBCore = exports['qb-core']:GetCoreObject()

Ve1n.KitDataVerDayi = function(kit)
    if Ve1n.Items[kit] then
        return Ve1n.Items[kit].items, Ve1n.Items[kit].notify, Ve1n.Items[kit].meslek
    end
    return false
end

CreateThread(function()
    for kitName, _ in pairs(Ve1n.Items) do
        QBCore.Functions.CreateUseableItem(kitName, function(source, item)
            local src = source
            local Player = QBCore.Functions.GetPlayer(src)
            if Player.Functions.GetItemByName(item.name) then
                local items, notify, meslekKontrol = Ve1n.KitDataVerDayi(kitName)
                if items then
                    local adaminmesleki = Player.PlayerData.job.name
                    
                    if meslekKontrol and meslekKontrol.kontroletsinmi then
                        local adamgereklimeslektemi = false
                        for _, job in pairs(meslekKontrol.meslekler) do
                            if adaminmesleki == job then
                                adamgereklimeslektemi = true
                                break
                            end
                        end
                        
                        if not adamgereklimeslektemi then
                            TriggerClientEvent('QBCore:Notify', src, "Bu itemi kullanmak için gerekli mesleğe sahip deilsin!", "error")
                            return
                        end
                    end

                    for k, v in pairs(items) do
                        Player.Functions.AddItem(v.item, v.adet)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[v.item], "add")
                    end
                    Player.Functions.RemoveItem(item.name, 1)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], "remove")
                    
                    if notify and notify.atsinmi then
                        TriggerClientEvent('QBCore:Notify', src, notify.mesaj, "success")
                    end
                end
            end
        end)
    end
end)
