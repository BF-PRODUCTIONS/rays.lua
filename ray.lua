-- Carregando Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Criando a Window com KeySystem
local Window = Rayfield:CreateWindow({
   Name = "RAYS HUB",
   Icon = 0,
   LoadingTitle = "LOADING ...",
   LoadingSubtitle = "by SCRIPT FORGE",
   ShowText = "RAYS",
   Theme = "AmberGlow",

   ToggleUIKeybind = "K",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "MeuHubConfigs",
      FileName = "MeuHub"
   },

   Discord = {
      Enabled = false,
      Invite = "",
      RememberJoins = false
   },

   KeySystem = true,
   KeySettings = {
      Title = "RAYS KEY SISTEM",
      Subtitle = "ACESSE   ",
      Note = "SITE  https://rekonise.com/key-1-o1nv0",
      FileName = "MeuHubKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"IOMMELHORSTTAELLKEY@@*163"} -- Coloque suas keys aqui
   }
})

----------------------------------------------------------------
-- 📂 STEAL TAB
----------------------------------------------------------------
local StealTab = Window:CreateTab("Steal", 4483362458)

local InfiniteJump = StealTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "InfiniteJump",
   Callback = function(Value)
      getgenv().InfiniteJumpEnabled = Value
      local UserInputService = game:GetService("UserInputService")
      UserInputService.JumpRequest:Connect(function()
         if getgenv().InfiniteJumpEnabled then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
         end
      end)
   end,
})

local SpeedSlider = StealTab:CreateSlider({
   Name = "Speed Boost",
   Range = {16, 100},
   Increment = 1,
   Suffix = "WalkSpeed",
   CurrentValue = 16,
   Flag = "SpeedBoost",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

local Skywalk = StealTab:CreateToggle({
   Name = "Skywalk",
   CurrentValue = false,
   Flag = "Skywalk",
   Callback = function(Value)
      getgenv().SkywalkEnabled = Value
   end,
})

----------------------------------------------------------------
-- 📂 MISC TAB
----------------------------------------------------------------
local MiscTab = Window:CreateTab("Misc", 4483362458)

local GodMode = MiscTab:CreateToggle({
   Name = "God Mode",
   CurrentValue = false,
   Flag = "GodMode",
   Callback = function(Value)
      -- Exemplo simples
      if Value then
         print("GodMode ativado")
      else
         print("GodMode desativado")
      end
   end,
})

local Bhop = MiscTab:CreateToggle({
   Name = "Bhop",
   CurrentValue = false,
   Flag = "Bhop",
   Callback = function(Value)
      getgenv().BhopEnabled = Value
      local UIS = game:GetService("UserInputService")
      UIS.InputBegan:Connect(function(input, processed)
         if not processed and input.KeyCode == Enum.KeyCode.Space and getgenv().BhopEnabled then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
         end
      end)
   end,
})

local Noclip = MiscTab:CreateToggle({
   Name = "Noclip",
   CurrentValue = false,
   Flag = "Noclip",
   Callback = function(Value)
      getgenv().NoclipEnabled = Value
      game:GetService("RunService").Stepped:Connect(function()
         if getgenv().NoclipEnabled then
            for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
               if part:IsA("BasePart") then
                  part.CanCollide = false
               end
            end
         end
      end)
   end,
})

local FlySlider = MiscTab:CreateSlider({
   Name = "Fly Speed",
   Range = {10, 200},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 50,
   Flag = "FlySpeed",
   Callback = function(Value)
      getgenv().FlySpeed = Value
   end,
})

local Fly = MiscTab:CreateToggle({
   Name = "Fly",
   CurrentValue = false,
   Flag = "Fly",
   Callback = function(Value)
      getgenv().FlyEnabled = Value
      local Player = game.Players.LocalPlayer
      local Mouse = Player:GetMouse()
      local RunService = game:GetService("RunService")

      RunService.RenderStepped:Connect(function()
         if getgenv().FlyEnabled and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            local HRP = Player.Character.HumanoidRootPart
            if Mouse then
               HRP.CFrame = HRP.CFrame + (Mouse.Hit.p - HRP.Position).Unit * (getgenv().FlySpeed or 50) * RunService.RenderStepped:Wait()
            end
         end
      end)
   end,
})

----------------------------------------------------------------
-- 📂 ESP TAB
----------------------------------------------------------------
local ESPTab = Window:CreateTab("ESP", 4483362458)

local ESPBlue = ESPTab:CreateToggle({
   Name = "ESP Highlight Blue",
   CurrentValue = false,
   Flag = "ESPBlue",
   Callback = function(Value)
      for _, player in pairs(game.Players:GetPlayers()) do
         if player ~= game.Players.LocalPlayer and player.Character then
            local highlight = player.Character:FindFirstChildOfClass("Highlight")
            if Value then
               if not highlight then
                  highlight = Instance.new("Highlight")
                  highlight.FillColor = Color3.fromRGB(0, 0, 255)
                  highlight.FillTransparency = 0.5
                  highlight.OutlineColor = Color3.fromRGB(0, 0, 255)
                  highlight.Parent = player.Character
               end
            else
               if highlight then
                  highlight:Destroy()
               end
            end
         end
      end
   end,
})

local ESPRed = ESPTab:CreateToggle({
   Name = "ESP Highlight Red",
   CurrentValue = false,
   Flag = "ESPRed",
   Callback = function(Value)
      for _, player in pairs(game.Players:GetPlayers()) do
         if player ~= game.Players.LocalPlayer and player.Character then
            local highlight = player.Character:FindFirstChildOfClass("Highlight")
            if Value then
               if not highlight then
                  highlight = Instance.new("Highlight")
                  highlight.FillColor = Color3.fromRGB(255, 0, 0)
                  highlight.FillTransparency = 0.5
                  highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
                  highlight.Parent = player.Character
               end
            else
               if highlight then
                  highlight:Destroy()
               end
            end
         end
      end
   end,
})

local ESPName = ESPTab:CreateToggle({
   Name = "ESP Name",
   CurrentValue = false,
   Flag = "ESPName",
   Callback = function(Value)
      for _, player in pairs(game.Players:GetPlayers()) do
         if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            if Value then
               if not player.Character.Head:FindFirstChild("NameTag") then
                  local billboard = Instance.new("BillboardGui")
                  billboard.Name = "NameTag"
                  billboard.Size = UDim2.new(0, 200, 0, 50)
                  billboard.AlwaysOnTop = true
                  billboard.Adornee = player.Character.Head

                  local label = Instance.new("TextLabel")
                  label.Size = UDim2.new(1, 0, 1, 0)
                  label.Text = player.Name
                  label.TextColor3 = Color3.new(1, 1, 1)
                  label.BackgroundTransparency = 1
                  label.Parent = billboard

                  billboard.Parent = player.Character.Head
               end
            else
               if player.Character.Head:FindFirstChild("NameTag") then
                  player.Character.Head.NameTag:Destroy()
               end
            end
         end
      end
   end,
})
