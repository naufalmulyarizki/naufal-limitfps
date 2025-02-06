local LimitFPS = false

CreateThread(function()
    while true do
        Wait(Config.CheckTimer)
        local startCount = GetFrameCount()
        Wait(1000)
        local endCount = GetFrameCount()
        fps = endCount - startCount
        if fps > (Config.MaxFPS + 2) and not LimitFPS then
            startTimer()
            LimitFPS = true
        elseif fps < (Config.MaxFPS + 2) and LimitFPS then
            LimitFPS = false
        end
    end
end)

function startTimer()
    local timer = Config.Timer

    CreateThread(function()
        while timer > 0 and LimitFPS do
            Wait(1000)
            timer = timer - 1
            if timer == 0 then
                LimitFPS = false
                TriggerServerEvent("naufal-limitfps:server:Kick")
            else
                lib.notify({
                    title = 'FPS Warning',
                    description = string.format(Config.ChangeResMsg, timer, Config.MaxFPS),
                    type = 'warning',
                    position = 'center'
                })
            end
        end
    end)
end