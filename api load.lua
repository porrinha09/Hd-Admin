-- api load;
-- by: wes

-- notificação
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local mensagem = "bem vindo"

game.StarterGui:SetCore("SendNotification", {
    Title = "Hd admin api:",
    Text = mensagem,
    Duration = 5 -- Duração em segundos
})
