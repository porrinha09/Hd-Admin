-- versão
Version = '2.0.1'

-- by
dono = " Kelvin"

 -- load
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/porrinha09/lib_orion/main/soure.lua')))()
local Window = OrionLib:MakeWindow({Name = "HD Admin - v" .. Version, HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

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
	Name = "by:" .. dono
})

local Tab = Window:MakeTab({
	Name = "Comandos",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "comandos"
})
Tab:AddButton({
	Name = ";bola",
	Callback = function()
      	                local UserInputService = game:GetService("UserInputService")
                local RunService = game:GetService("RunService")
                local Camera = workspace.CurrentCamera
                
                local SPEED_MULTIPLIER = 30
                local JUMP_POWER = 60
                local JUMP_GAP = 0.3
                
                local character = game.Players.LocalPlayer.Character
                
                for i,v in ipairs(character:GetDescendants()) do
                   if v:IsA("BasePart") then
                       v.CanCollide = false
                   end
                end
                
                local ball = character.HumanoidRootPart
                ball.Shape = Enum.PartType.Ball
                ball.Size = Vector3.new(5,5,5)
                local humanoid = character:WaitForChild("Humanoid")
                local params = RaycastParams.new()
                params.FilterType = Enum.RaycastFilterType.Blacklist
                params.FilterDescendantsInstances = {character}
                
                local tc = RunService.RenderStepped:Connect(function(delta)
                   ball.CanCollide = true
                   humanoid.PlatformStand = true
                if UserInputService:GetFocusedTextBox() then return end
                if UserInputService:IsKeyDown("W") then
                ball.RotVelocity -= Camera.CFrame.RightVector * delta * SPEED_MULTIPLIER
                end
                if UserInputService:IsKeyDown("A") then
                ball.RotVelocity -= Camera.CFrame.LookVector * delta * SPEED_MULTIPLIER
                end
                if UserInputService:IsKeyDown("S") then
                ball.RotVelocity += Camera.CFrame.RightVector * delta * SPEED_MULTIPLIER
                end
                if UserInputService:IsKeyDown("D") then
                ball.RotVelocity += Camera.CFrame.LookVector * delta * SPEED_MULTIPLIER
                end
                --ball.RotVelocity = ball.RotVelocity - Vector3.new(0,ball.RotVelocity.Y/50,0)
                end)
                
                UserInputService.JumpRequest:Connect(function()
                local result = workspace:Raycast(
                ball.Position,
                Vector3.new(
                0,
                -((ball.Size.Y/2)+JUMP_GAP),
                0
                ),
                params
                )
                if result then
                ball.Velocity = ball.Velocity + Vector3.new(0,JUMP_POWER,0)
                end
                end)
                
                Camera.CameraSubject = ball
                humanoid.Died:Connect(function() tc:Disconnect() end)
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
	Name = ";desativar pulo infinito",
	Callback = function()
      		local infinjump = false
game:GetService("UserInputService").jumpRequest:Connect(function()
    if infinjump then
        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)
  	end    
})

local Tab = Window:MakeTab({
	Name = "player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "player"
})
Tab:AddTextbox({
	Name = "speed",
	Default = "16",
	TextDisappear = false,
	Callback = function(Value)
		local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid.WalkSpeed = (Value)
	end	  
})
Tab:AddTextbox({
	Name = "jump",
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
	Name = "fov",
	Default = "70",
	TextDisappear = false,
	Callback = function(Value)
		game.Workspace.CurrentCamera.FieldOfView = (Value)
	end	  
})
local Section = Tab:AddSection({
	Name = "resetar speed/jump/fov"
})
Tab:AddButton({
	Name = "speed",
	Callback = function()
      		local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid.WalkSpeed = 16
  	end    
})
Tab:AddButton({
	Name = "jump",
	Callback = function()
      		local player = game.Players.LocalPlayer
local character = player.Character

local jumpHeight = 50

local humanoid = character:WaitForChild("Humanoid")

humanoid.JumpPower = jumpHeight
  	end    
})
Tab:AddButton({
	Name = "fov",
	Callback = function()
      		game.Workspace.CurrentCamera.FieldOfView = 70
  	end    
})
local Section = Tab:AddSection({
	Name = "básicos"
})
Tab:AddButton({
	Name = "resetar",
	Callback = function()
      		game.Players.LocalPlayer.Character.Humanoid.Health = 0
  	end    
})
Tab:AddButton({
	Name = "rejoin",
	Callback = function()
      		wait(1)	
game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
  	end    
})
Tab:AddTextbox({
	Name = "chat",
	Default = "oi",
	TextDisappear = false,
	Callback = function(Value)
		local args = {
    [1] = (Value) ,
    [2] = "All"
}

game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(unpack(args))
	end	  
})
local Section = Tab:AddSection({
	Name = "movimentação"
})
Tab:AddButton({
	Name = "desativar movimentos",
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
	Name = "ativar movimentos",
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
	Name = "andar reto",
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
Tab:AddLabel("para desativar e só pular")


local Tab = Window:MakeTab({
	Name = "script hub",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddLabel("script hub:")
local Section = Tab:AddSection({
	Name = "admin"
})
Tab:AddButton({
	Name = "infinite yield",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  	end    
})
Tab:AddButton({
	Name = "Reviz admin",
	Callback = function()
      		loadstring(game:HttpGetAsync("https://pastebin.com/raw/Caniwq2N"))()
  	end    
})
local Section = Tab:AddSection({
	Name = "fly"
})
Tab:AddButton({
	Name = "fly v3",
	Callback = function()
      		loadstring(game:HttpGet('https://pastebin.com/raw/YSL3xKYU'))()
  	end    
})
Tab:AddButton({
	Name = "vfly",
	Callback = function()
      		loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()
  	end    
})
local Section = Tab:AddSection({
	Name = "scripts bom"
})
Tab:AddButton({
	Name = "tirar sombras",
	Callback = function()
      		game.Lighting.GlobalShadows = false
  	end    
})
Tab:AddButton({
	Name = "f3x",
	Callback = function()
      		loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
  	end    
})
local Section = Tab:AddSection({
	Name = "poderes"
})
Tab:AddButton({
	Name = "andar na parede",
	Callback = function()
      		loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Walk-on-Walls-Or-ceilings-1469"))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "teleporte",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "teleporte"
})
Tab:AddButton({
	Name = "tp pessoas mais próximas",
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
	Name = "tp pessoas mais longe",
	Callback = function()
      		local players = game.Players:GetPlayers()
local farthestPlayer = nil
local farthestDistance = 0

for i, player in ipairs(players) do
    local distance = (player.Character.HumanoidRootPart.Position - Vector3.new(x, y, z)).Magnitude
    if distance > farthestDistance then
        farthestPlayer = player
        farthestDistance = distance
    end
end

if farthestPlayer then
    farthestPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
end
  	end    
})
Tab:AddButton({
	Name = "TP Tool",
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

local Tab = Window:MakeTab({
	Name = "Loops",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Loops em vc:"
})
Tab:AddLabel("n tem como desativar, então usem com cuidado")
Tab:AddButton({
	Name = "pular loop",
	Callback = function()
      		while true do
   -- Faz o personagem pular
local character = game.Players.LocalPlayer.Character
character:WaitForChild("Humanoid").Jump = true
    wait(1) 
end
  	end    
})
Tab:AddButton({
	Name = "morrer loop",
	Callback = function()
      		while true do 
game.Players.LocalPlayer.Character.Humanoid.Health = 0
    wait(1) 
end
  	end    
})

local Tab = Window:MakeTab({
	Name = "prison life tp",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "prison life tp"
})
Tab:AddButton({
	Name = "base",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-946.5443115234375, 94.1287612915039, 2065.466552734375)
  	end    
})
Tab:AddButton({
	Name = "matar jogadores",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(818.3822631835938, 130.03990173339844, 2583.103271484375)
  	end    
})
Tab:AddButton({
	Name = "arma policial",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(823.9112548828125, 99.98998260498047, 2257.491943359375)
  	end    
})

local Tab = Window:MakeTab({
	Name = "prison life scripts",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "scripts"
})
Tab:AddButton({
	Name = "aimbot",
	Callback = function()
      		local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local GetPlayers = Players.GetPlayers
local Camera = workspace.CurrentCamera
local WTSP = Camera.WorldToScreenPoint
local FindFirstChild = game.FindFirstChild
local Vector2_new = Vector2.new
local Mouse = LocalPlayer.GetMouse(LocalPlayer)
function ClosestChar()
    local Max, Close = math.huge
    for I,V in pairs(GetPlayers(Players)) do
        if V ~= LocalPlayer and V.Team ~= LocalPlayer.Team and V.Character then
            local Head = FindFirstChild(V.Character, "Head")
            if Head then
                local Pos, OnScreen = WTSP(Camera, Head.Position)
                if OnScreen then
                    local Dist = (Vector2_new(Pos.X, Pos.Y) - Vector2_new(Mouse.X, Mouse.Y)).Magnitude
                    if Dist < Max then
                        Max = Dist
                        Close = V.Character
                    end
                end
            end
        end
    end
    return Close
end

local MT = getrawmetatable(game)
local __namecall = MT.__namecall
setreadonly(MT, false)
MT.__namecall = newcclosure(function(self, ...)
    local Method = getnamecallmethod()
    if Method == "FindPartOnRay" and not checkcaller() and tostring(getfenv(0).script) == "GunInterface" then
        local Character = ClosestChar()
        if Character then
            return Character.Head, Character.Head.Position
        end
    end

    return __namecall(self, ...)
end)
setreadonly(MT, true)
  	end    
})
Tab:AddButton({
	Name = "esp lines",
	Callback = function()
local function AddLine(player)
  local Camera = workspace.Camera
  local Line = Drawing.new("Line")
  Line.Thickness = 1
  Line.Color3 = player.TeamColor or Color3.fromRGB(255, 0, 0)
  Line.Visible = true
  
  local plrChar = game.Players.LocalPlayer.Character
  if plrChar and player.Character then
    task.spawn(function()
      while task.wait() do
        local Vector, OnScreen = Camera:worldToViewportPoint(player.Character.PrimaryPart.Position)
        
        if OnScreen then
          Line.Visible = true
          Line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 1)
          Line.To = Vector2.new(Vector.X, Vector.Y)
        else
          Line.Visible = false
        end
      end
    end)
  else
    Line.Visible = false
  end
end

for _,v in pairs(game:GetService("Players"):GetPlayers()) do
  if v.Name ~= game.Players.LocalPlayer.Name then
    AddLine(v)
  end
end
  	end    
})
Tab:AddButton({
	Name = "desativar esp",
	Callback = function()
      		Line.Visible = false
  	end    
})
local Section = Tab:AddSection({
	Name = "munição infinito"
})
Tab:AddButton({
	Name = "M9",
	Callback = function()
      	wait(1)
	-- Generated by Hydroxide's Upvalue Scanner: https://github.com/Upbolt/Hydroxide

local aux = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/ohaux.lua"))()

local scriptPath = game:GetService("Players").LocalPlayer.Backpack.M9.GunInterface
local closureName = "createRay"
local upvalueIndex = 1
local closureConstants = {
	[1] = "Bullets",
	[2] = "magnitude",
	[3] = 10,
	[4] = "math",
	[5] = "random",
	[7] = "Vector3"
}

local closure = aux.searchClosure(scriptPath, closureName, upvalueIndex, closureConstants)
local value = 9000
local elementIndex = "CurrentAmmo"


-- DO NOT RELY ON THIS FEATURE TO PRODUCE 100% FUNCTIONAL SCRIPTS
debug.getupvalue(closure, upvalueIndex)[elementIndex] = value

wait(1)

-- Generated by Hydroxide's Upvalue Scanner: https://github.com/Upbolt/Hydroxide

local aux = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/ohaux.lua"))()

local scriptPath = game:GetService("Players").LocalPlayer.Backpack.M9.GunInterface
local closureName = "createRay"
local upvalueIndex = 1
local closureConstants = {
	[1] = "Bullets",
	[2] = "magnitude",
	[3] = 10,
	[4] = "math",
	[5] = "random",
	[7] = "Vector3"
}

local closure = aux.searchClosure(scriptPath, closureName, upvalueIndex, closureConstants)
local value = 9000
local elementIndex = "MaxAmmo"


-- DO NOT RELY ON THIS FEATURE TO PRODUCE 100% FUNCTIONAL SCRIPTS
debug.getupvalue(closure, upvalueIndex)[elementIndex] = value
  	end    
})
Tab:AddLabel("n ta funcionando")

local Tab = Window:MakeTab({
	Name = "ocultar ui",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Roblox sistema"
})
Tab:AddButton({
	Name = "ocultar chat",
	Callback = function()
      		local StarterGui = game:GetService("StarterGui")
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
  	end    
})
Tab:AddButton({
	Name = "descultar chat",
	Callback = function()
      		local StarterGui = game:GetService("StarterGui")
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
  	end    
})

local Tab = Window:MakeTab({
	Name = "teclado",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "teclado"
})
Tab:AddButton({
	Name = "teclado v1",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
  	end    
})
Tab:AddButton({
	Name = "criar teclas",
	Callback = function()
      		loadstring(game:HttpGet(('https://pastefy.app/Ujm4HWxh/raw'),true))()
  	end    
})

-- criar scripts
local Tab = Window:MakeTab({
	Name = "criar scripts",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "criar scripts"
})
Tab:AddButton({
	Name = "simple spy",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
  	end    
})
Tab:AddButton({
	Name = "hydroxide",
	Callback = function()
      		local owner = "Hosvile"
local branch = "revision"

local function webImport(file)
    return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/MC-Hydroxide/%s/%s.lua"):format(owner, branch, file)), file .. '.lua')()
end

webImport("init")
webImport("ui/main")
  	end    
})
Tab:AddButton({
	Name = "criar teleporte",
	Callback = function()
      		loadstring(game:HttpGet(('https://raw.githubusercontent.com/ZetraDDoS/Roblox-Zetra/main/Zetra%20HUB.lua'),true))()
  	end    
})
Tab:AddButton({
	Name = "abrir console",
	Callback = function()
      		game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
  	end    
})

-- brookhaven
local Tab = Window:MakeTab({
	Name = "brookhaven",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "brookhaven"
})
Tab:AddButton({
	Name = "Ice hub",
	Callback = function()
      		loadstring(game:HttpGet('https://icehub.cf/IceHubLoader'))()
  	end    
})
Tab:AddButton({
	Name = "redz hub",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/REDzHUB/main/REDzHUB"))()
  	end    
})
Tab:AddButton({
	Name = "nome colorido",
	Callback = function()
      		while true do 
      local args = {
    [1] = "PickingRPNameColor",
    [2] = Color3.new(0, 0.2550922632217407, 1)
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eColo1r"):FireServer(unpack(args))
wait(1)
local args = {
    [1] = "PickingRPNameColor",
    [2] = Color3.new(0, 1, 0.11916005611419678)
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eColo1r"):FireServer(unpack(args))
wait(1)
local args = {
    [1] = "PickingRPNameColor",
    [2] = Color3.new(1, 0, 0.09715032577514648)
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eColo1r"):FireServer(unpack(args))
wait(1)
local args = {
    [1] = "PickingRPNameColor",
    [2] = Color3.new(1, 0, 0.834061861038208)
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eColo1r"):FireServer(unpack(args))
wait(1)
local args = {
    [1] = "PickingRPNameColor",
    [2] = Color3.new(0.6147799491882324, 0, 1)
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eColo1r"):FireServer(unpack(args))
wait(1)
local args = {
    [1] = "PickingRPNameColor",
    [2] = Color3.new(1, 0.8638885617256165, 0)
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eColo1r"):FireServer(unpack(args))
wait(1)
local args = {
    [1] = "PickingRPNameColor",
    [2] = Color3.new(1, 0.6158433556556702, 0)
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eColo1r"):FireServer(unpack(args))
    wait(1) 
end
  	end    
})

-- prison life
local Tab = Window:MakeTab({
	Name = "prison life",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "prison life"
})
Tab:AddButton({
	Name = "Tiger Admin",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/dalloc2/Roblox/main/TigerAdmin.lua"))()
  	end    
})
Tab:AddButton({
	Name = "prisonware",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))();
  	end    
})

local Tab = Window:MakeTab({
	Name = "arsenal",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "arsenal"
})
Tab:AddButton({
	Name = "tect menu",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Arsenalscript.txt"))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "config",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddLabel("configurações")
Tab:AddButton({
	Name = "ocultar ui",
	Callback = function()
      		OrionLib:Destroy()
  	end    
})
Tab:AddButton({
	Name = "ocultar infinite yield",
	Callback = function()
      		function maximizeHolder()
					if StayOpen == false then
						pcall(function()
						Holder:TweenPosition(UDim2.new(1, Holder.Position.X.Offset, 1, -220), "InOut", "Quart", 0.2, true, nil)
						end)
					end
				end

				minimizeNum = -20
				function minimizeHolder()
					if StayOpen == false then
						pcall(function()
							Holder:TweenPosition(UDim2.new(1, Holder.Position.X.Offset, 1, minimizeNum), "InOut", "Quart", 0.5, true, nil)
						end)
					end
				end

				function execCmd(cmdStr,speaker,store)
					return
				end			

                		Holder.Parent:Destroy()
				getgenv().IY_LOADED = false
  	end   
})

OrionLib:Init()
