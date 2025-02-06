RegisterNetEvent("naufal-limitfps:server:Kick")
AddEventHandler("naufal-limitfps:server:Kick", function()
    DropPlayer(source, string.format('Limit FPS : %s', Config.KickMsg))
end)