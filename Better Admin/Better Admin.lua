-- nome
Nome = "Better Admin"

-- tema
theme = "https://raw.githubusercontent.com/porrinha09/Hd-Admin/main/temas/opera%20gx%20dark.lua"

-- versão
Versao = '1.0'

-- by
Dono = " Kelvin"

local OrionLib = loadstring(game:HttpGet(theme))()
local Window = OrionLib:MakeWindow({Name = "Better Admin☃️ - v" .. Versao, HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

wait(1)
-- api load
loadstring(game:HttpGet("https://raw.githubusercontent.com/porrinha09/Hd-Admin/main/api%20load.lua"))()

local player = game.Players.LocalPlayer
local name = player.DisplayName

local mapa = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

-- tabs
local Tab = Window:MakeTab({
	Name = "início",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddLabel("bem vindo: " .. name)
Tab:AddLabel("jogo: " .. mapa)
local Section = Tab:AddSection({
	Name = "by:" .. Dono
})

local Tab = Window:MakeTab({
	Name = "comandos",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "comandos"
})
Tab:AddTextbox({
	Name = ";speed",
	Default = "16",
	TextDisappear = false,
	Callback = function(Value)
		local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid.WalkSpeed = (Value)
	end	  
})
Tab:AddTextbox({
	Name = ";jump",
	Default = "50",
	TextDisappear = false,
	Callback = function(Value)
		local player = game.Players.LocalPlayer
local character = player.Character

local jumpHeight = (Value)

local humanoid = character:WaitForChild("Humanoid")

humanoid.JumpPower = jumpHeight
	end	  
})
Tab:AddTextbox({
	Name = ";fov",
	Default = "70",
	TextDisappear = false,
	Callback = function(Value)
		game.Workspace.CurrentCamera.FieldOfView = (Value)
	end	  
})
Tab:AddButton({
	Name = ";noclip",
	Callback = function()
      		local player = game.Players.LocalPlayer 
local character = player.Character or player.CharacterAdded:Wait()

local noclip = true

local function enableNoclip()
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then 
            part.CanCollide = false
        end
    end
end

local function disableNoclip()
    for _, part in pairs(character:GetDescendants()) do 
        if part:IsA("BasePart") then 
            part.CanCollide = true 
        end
    end
end

game:GetService("RunService").Heartbeat:Connect(function()
    if noclip then
        enableNoclip()
    else
        disableNoclip()
    end
end)

noclip = true
  	end    
})
Tab:AddButton({
	Name = ";clip",
	Callback = function()
      		local player = game.Players.LocalPlayer 
local character = player.Character or player.CharacterAdded:Wait()

local noclip = true

local function enableNoclip()
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then 
            part.CanCollide = false
        end
    end
end

local function disableNoclip()
    for _, part in pairs(character:GetDescendants()) do 
        if part:IsA("BasePart") then 
            part.CanCollide = true 
        end
    end
end

game:GetService("RunService").Heartbeat:Connect(function()
    if noclip then
        enableNoclip()
    else
        disableNoclip()
    end
end)

noclip = false
  	end    
})
Tab:AddButton({
	Name = ";sit",
	Callback = function()
      		local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function onJump()
    humanoid.Sit = false
end

humanoid.Sit = true
humanoid.Jumping:Connect(onJump)
  	end    
})
Tab:AddButton({
	Name = ";pulo infinito",
	Callback = function()
      		local infinjump = true
game:GetService("UserInputService").jumpRequest:Connect(function()
    if infinjump then
        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)
  	end    
})
Tab:AddButton({
	Name = ";rtx",
	Callback = function()
      		-- Credits to Instance Serializer for helping me convert the Tokyowami shrine whatever thing to luau
if not game:IsLoaded() then
    game.Loaded:Wait()
end
local Bloom = Instance.new("BloomEffect")
Bloom.Intensity = 0.1
Bloom.Threshold = 0
Bloom.Size = 100

local Tropic = Instance.new("Sky")
Tropic.Name = "Tropic"
Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
Tropic.StarCount = 100
Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
Tropic.Parent = Bloom

local Sky = Instance.new("Sky")
Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
Sky.CelestialBodiesShown = false
Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
Sky.Parent = Bloom

Bloom.Parent = game:GetService("Lighting")

local Bloom = Instance.new("BloomEffect")
Bloom.Enabled = false
Bloom.Intensity = 0.35
Bloom.Threshold = 0.2
Bloom.Size = 56

local Tropic = Instance.new("Sky")
Tropic.Name = "Tropic"
Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
Tropic.StarCount = 100
Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
Tropic.Parent = Bloom

local Sky = Instance.new("Sky")
Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
Sky.CelestialBodiesShown = false
Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
Sky.Parent = Bloom

Bloom.Parent = game:GetService("Lighting")
local Blur = Instance.new("BlurEffect")
Blur.Size = 2

Blur.Parent = game:GetService("Lighting")
local Efecto = Instance.new("BlurEffect")
Efecto.Name = "Efecto"
Efecto.Enabled = false
Efecto.Size = 2

Efecto.Parent = game:GetService("Lighting")
local Inaritaisha = Instance.new("ColorCorrectionEffect")
Inaritaisha.Name = "Inari taisha"
Inaritaisha.Saturation = 0.05
Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)

Inaritaisha.Parent = game:GetService("Lighting")
local Normal = Instance.new("ColorCorrectionEffect")
Normal.Name = "Normal"
Normal.Enabled = false
Normal.Saturation = -0.2
Normal.TintColor = Color3.fromRGB(255, 232, 215)

Normal.Parent = game:GetService("Lighting")
local SunRays = Instance.new("SunRaysEffect")
SunRays.Intensity = 0.05

SunRays.Parent = game:GetService("Lighting")
local Sunset = Instance.new("Sky")
Sunset.Name = "Sunset"
Sunset.SkyboxUp = "rbxassetid://323493360"
Sunset.SkyboxLf = "rbxassetid://323494252"
Sunset.SkyboxBk = "rbxassetid://323494035"
Sunset.SkyboxFt = "rbxassetid://323494130"
Sunset.SkyboxDn = "rbxassetid://323494368"
Sunset.SunAngularSize = 14
Sunset.SkyboxRt = "rbxassetid://323494067"

Sunset.Parent = game:GetService("Lighting")
local Takayama = Instance.new("ColorCorrectionEffect")
Takayama.Name = "Takayama"
Takayama.Enabled = false
Takayama.Saturation = -0.3
Takayama.Contrast = 0.1
Takayama.TintColor = Color3.fromRGB(235, 214, 204)

Takayama.Parent = game:GetService("Lighting")
local L = game:GetService("Lighting")
L.Brightness = 2.14
L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
L.ClockTime = 6.7
L.FogColor = Color3.fromRGB(94, 76, 106)
L.FogEnd = 1000
L.FogStart = 0
L.ExposureCompensation = 0.24
L.ShadowSoftness = 0
L.Ambient = Color3.fromRGB(59, 33, 27)

local Bloom = Instance.new("BloomEffect")
Bloom.Intensity = 0.1
Bloom.Threshold = 0
Bloom.Size = 100

local Tropic = Instance.new("Sky")
Tropic.Name = "Tropic"
Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
Tropic.StarCount = 100
Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
Tropic.Parent = Bloom

local Sky = Instance.new("Sky")
Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
Sky.CelestialBodiesShown = false
Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
Sky.Parent = Bloom

Bloom.Parent = game:GetService("Lighting")

local Bloom = Instance.new("BloomEffect")
Bloom.Enabled = false
Bloom.Intensity = 0.35
Bloom.Threshold = 0.2
Bloom.Size = 56

local Tropic = Instance.new("Sky")
Tropic.Name = "Tropic"
Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
Tropic.StarCount = 100
Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
Tropic.Parent = Bloom

local Sky = Instance.new("Sky")
Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
Sky.CelestialBodiesShown = false
Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
Sky.Parent = Bloom

Bloom.Parent = game:GetService("Lighting")
local Blur = Instance.new("BlurEffect")
Blur.Size = 2

Blur.Parent = game:GetService("Lighting")
local Efecto = Instance.new("BlurEffect")
Efecto.Name = "Efecto"
Efecto.Enabled = false
Efecto.Size = 2

Efecto.Parent = game:GetService("Lighting")
local Inaritaisha = Instance.new("ColorCorrectionEffect")
Inaritaisha.Name = "Inari taisha"
Inaritaisha.Saturation = 0.05
Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)

Inaritaisha.Parent = game:GetService("Lighting")
local Normal = Instance.new("ColorCorrectionEffect")
Normal.Name = "Normal"
Normal.Enabled = false
Normal.Saturation = -0.2
Normal.TintColor = Color3.fromRGB(255, 232, 215)

Normal.Parent = game:GetService("Lighting")
local SunRays = Instance.new("SunRaysEffect")
SunRays.Intensity = 0.05

SunRays.Parent = game:GetService("Lighting")
local Sunset = Instance.new("Sky")
Sunset.Name = "Sunset"
Sunset.SkyboxUp = "rbxassetid://323493360"
Sunset.SkyboxLf = "rbxassetid://323494252"
Sunset.SkyboxBk = "rbxassetid://323494035"
Sunset.SkyboxFt = "rbxassetid://323494130"
Sunset.SkyboxDn = "rbxassetid://323494368"
Sunset.SunAngularSize = 14
Sunset.SkyboxRt = "rbxassetid://323494067"

Sunset.Parent = game:GetService("Lighting")
local Takayama = Instance.new("ColorCorrectionEffect")
Takayama.Name = "Takayama"
Takayama.Enabled = false
Takayama.Saturation = -0.3
Takayama.Contrast = 0.1
Takayama.TintColor = Color3.fromRGB(235, 214, 204)

Takayama.Parent = game:GetService("Lighting")
local L = game:GetService("Lighting")
L.Brightness = 2.14
L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
L.ClockTime = 6.7
L.FogColor = Color3.fromRGB(94, 76, 106)
L.FogEnd = 1000
L.FogStart = 0
L.ExposureCompensation = 0.24
L.ShadowSoftness = 0
L.Ambient = Color3.fromRGB(59, 33, 27)
  	end    
})
Tab:AddButton({
	Name = ";TP Tool",
	Callback = function()
      	 mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Equip to Click TP"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
tool.Parent = game.Players.LocalPlayer.Backpack
  	end    
})
Tab:AddButton({
	Name = ";F3x",
	Callback = function()
      		loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
  	end    
})
Tab:AddButton({
	Name = ";tp pessoas mais próximas",
	Callback = function()
      		local p = game.Players.LocalPlayer

local function teleportToClosestPlayer()
    local c = nil
    local d = math.huge
    
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= p then
            local dist = (plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")) and
                             (p.Character and p.Character:FindFirstChild("HumanoidRootPart")) and
                             (plr.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude or math.huge
            
            if dist < d then
                d = dist
                c = plr
            end
        end
    end
    
    if c then
        p.Character:MoveTo(c.Character.HumanoidRootPart.Position)
    end
end

teleportToClosestPlayer()
  	end    
})
Tab:AddButton({
	Name = ";copy your nick",
	Callback = function()
      		local Players = game:GetService("Players")

    local playerName = player.Name
    setclipboard(playerName)
  	end    
})
Tab:AddButton({
	Name = ";ocultar chat",
	Callback = function()
      		local StarterGui = game:GetService("StarterGui")
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
  	end    
})
Tab:AddButton({
	Name = ";descultar chat",
	Callback = function()
      		local StarterGui = game:GetService("StarterGui")
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
  	end    
})
Tab:AddButton({
	Name = ";console",
	Callback = function()
      		game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
  	end    
})
Tab:AddButton({
	Name = ";primeira pessoa",
	Callback = function()
       local player = game.Players.LocalPlayer

player.CameraMode = Enum.CameraMode.LockFirstPerson

player.PlayerGui.MouseIconEnabled = false
  	end    
})
Tab:AddButton({
	Name = ";desativar primeira pessoa",
	Callback = function()
      		local player = game.Players.LocalPlayer

player.CameraMode = Enum.CameraMode.Classic

player.PlayerGui.MouseIconEnabled = true
  	end    
})
Tab:AddButton({
	Name = ";tirar sombras",
	Callback = function()
      		game.Lighting.GlobalShadows = false
  	end    
})
Tab:AddButton({
	Name = ";ativar sombras",
	Callback = function()
      		game.Lighting.GlobalShadows = true
  	end    
})
Tab:AddButton({
	Name = ";desativar movimentos",
	Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

character:WaitForChild("Humanoid")

local function disableMovement()
    character:WaitForChild("Humanoid").WalkSpeed = 0
end

disableMovement()
  	end    
})
Tab:AddButton({
	Name = ";ativar movimentos",
	Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

character:WaitForChild("Humanoid")

local function enableMovement()
    character:WaitForChild("Humanoid").WalkSpeed = 16 -- Pode ajustar para a velocidade desejada
end

enableMovement()
  	end    
})
Tab:AddButton({
	Name = ";andar reto",
	Callback = function()
      		local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function onJump()
    humanoid.AutoRotate = true
    humanoid.MoveDirection = Vector3.new(0, 0, 0)
    humanoid:MoveTo(humanoid.RootPart.Position)
end

humanoid.AutoRotate = false
humanoid.Jumping:Connect(onJump)
  	end    
})
Tab:AddTextbox({
	Name = ";health",
	Default = "100",
	TextDisappear = false,
	Callback = function(Value)
		local jogador = game.Players.LocalPlayer

jogador.Character.Humanoid.Health = (Value)
	end	  
})
Tab:AddButton({
	Name = ";resetar",
	Callback = function()
      		game.Players.LocalPlayer.Character.Humanoid.Health = 0
  	end    
})
Tab:AddButton({
	Name = ";rejoin",
	Callback = function()
      		wait(1)	
game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
  	end    
})
Tab:AddButton({
	Name = ";sair",
	Callback = function()
      		game:shutdown() 
  	end    
})

local Tab = Window:MakeTab({
	Name = "config",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "configurações"
})
Tab:AddButton({
	Name = "script hub menu",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/porrinha09/Hd-Admin/main/Better%20Admin/Gui/script%20hub.lua",true))()
  	end   
})
