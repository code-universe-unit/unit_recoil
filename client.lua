local recoilEnabled = true -- Переключатель для включения/выключения отдачи
local recoilAmount = 100.01 -- Интенсивность отдачи (измените значение по своему усмотрению)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        local playerPed = PlayerPedId()
        
        -- Проверяем, что игрок находится в режиме стрельбы и отдача включена
        if IsPedShooting(playerPed) and recoilEnabled then
            local pitch, roll, yaw = GetGameplayCamRot(2)
            
            -- Генерируем случайную отдачу вокруг оси Y (горизонтальное отклонение)
            local recoilY = math.random() * recoilAmount * 2 - recoilAmount
            
            -- Генерируем случайную отдачу вокруг оси X (вертикальное отклонение)
            local recoilX = math.random() * recoilAmount * 2 - recoilAmount
            
            -- Применяем отдачу к положению камеры
            SetGameplayCamRelativePitch(recoilX, 0.2)
            --SetGameplayCamRelativeHeading(recoilY)
        end
    end
end)


