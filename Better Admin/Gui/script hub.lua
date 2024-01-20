local gui = Instance.new("ScreenGui")
gui.Name = "MinhaGUI"
gui.Parent = game.Players.LocalPlayer.PlayerGui

local screenWidth, screenHeight = workspace.CurrentCamera.ViewportSize

local janela = Instance.new("Frame")
janela.BackgroundColor3 = Color3.new(0, 0, 0)
janela.Size = UDim2.new(0, 300, 0, 220) 
janela.Position = UDim2.new(0.5, -150, 0.5, -110)
janela.Parent = gui

local textoTopo = Instance.new("TextLabel")
textoTopo.Text = "Better Admin - opções"
textoTopo.TextColor3 = Color3.new(1, 1, 1)
textoTopo.TextSize = 18
textoTopo.Size = UDim2.new(1, 0, 0, 30)
textoTopo.BackgroundColor3 = Color3.new(0, 0, 0) 
textoTopo.Parent = janela

local fecharBotao = Instance.new("TextButton")
fecharBotao.BackgroundColor3 = Color3.new(1, 0, 0)
fecharBotao.TextColor3 = Color3.new(1, 1, 1)
fecharBotao.TextSize = 18
fecharBotao.Size = UDim2.new(0, 100, 0, 30)
fecharBotao.Position = UDim2.new(1, -110, 1, -40)
fecharBotao.Text = "Close"
fecharBotao.Parent = janela

fecharBotao.MouseButton1Click:Connect(function()
    gui:Destroy() 
end)

-- buttons

local button1 = Instance.new("TextButton")
button1.BackgroundColor3 = Color3.new(0, 0, 0)
button1.TextColor3 = Color3.new(1, 1, 1)
button1.TextSize = 14
button1.Size = UDim2.new(0, 100, 0, 30)
button1.Position = UDim2.new(0, 10, 0, 40)
button1.Text = "Hd admin"
button1.Parent = janela

button1.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/porrinha09/Hd-Admin/main/HdAdmin.lua",true))()
end)

local button2 = Instance.new("TextButton")
button2.BackgroundColor3 = Color3.new(0, 0, 0)
button2.TextColor3 = Color3.new(1, 1, 1)
button2.TextSize = 14
button2.Size = UDim2.new(0, 100, 0, 30)
button2.Position = UDim2.new(0, 130, 0, 40)
button2.Text = "infinite yield"
button2.Parent = janela

button2.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local button3 = Instance.new("TextButton")
button3.BackgroundColor3 = Color3.new(0, 0, 0)
button3.TextColor3 = Color3.new(1, 1, 1)
button3.TextSize = 14
button3.Size = UDim2.new(0, 100, 0, 30)
button3.Position = UDim2.new(0, 10, 0, 80)
button3.Text = "fly"
button3.Parent = janela

button3.MouseButton1Click:Connect(function()
     loadstring(game:HttpGet('https://pastebin.com/raw/YSL3xKYU'))()
end)

local button4 = Instance.new("TextButton")
button4.BackgroundColor3 = Color3.new(0, 0, 0)
button4.TextColor3 = Color3.new(1, 1, 1)
button4.TextSize = 14
button4.Size = UDim2.new(0, 100, 0, 30)
button4.Position = UDim2.new(0, 130, 0, 80)
button4.Text = "vfly"
button4.Parent = janela

button4.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()
end)
