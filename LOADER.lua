if not game:IsLoaded() then
	game.Loaded:Wait()
end

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Players = game:GetService("Players")
local currentplayer
local hp
local maxhp
local dc
local g
local player = Players.LocalPlayer

Fluent:Notify({
        Title = "UJS [Interface]",
        Content = "1.0",
        SubContent = "made by water.5202 :D",
        Duration = 5
})

local Window = Fluent:CreateWindow({
    Title = "UJS [Water's Utils] │ " .. identifyexecutor(),
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 360),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.P
})

local Tabs = {
    Utils = Window:AddTab({ Title = "Utilites", Icon = "hammer" }),
    Visuals = Window:AddTab({ Title = "Visual", Icon = "eye" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}
Window:SelectTab(1)

    Tabs.Settings:AddButton({
        Title = "Infinite Yield",
        Description = "Loads Infinite Yield for debugging",
        Callback = function()
            Window:Dialog({
                Title = "Execute?",
                Content = nil,
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                        end
                    }
                }
            })
        end
    })

local Health = Tabs.Utils:AddParagraph({
        Title = "",
        Content = ""
})

local CurrentPlayers = Tabs.Utils:AddParagraph({
        Title = "",
        Content = ""
})

local DodgeCount = Tabs.Utils:AddParagraph({
        Title = "",
        Content = ""
})

local Wins = Tabs.Utils:AddParagraph({
        Title = "",
        Content = ""
})

local Gold = Tabs.Utils:AddParagraph({
        Title = "",
        Content = ""
})

spawn(function()
while true do
g = game:GetService("Players").LocalPlayer.leaderstats.G.Value
Gold:SetTitle(g .. "G")
task.wait(0.7)
end
end)

spawn(function()
while true do
ws = game:GetService("Players").LocalPlayer.leaderstats.Wins.Value
Wins:SetTitle(ws .. " Wins")
task.wait(0.7)
end
end)

spawn(function()
while true do
dc = game:GetService("Players").LocalPlayer.PlayerGui.Main.Frame.DodgeCounter.Text
DodgeCount:SetTitle(dc)
task.wait(0.7)
end
end)

spawn(function()
while true do
hp = game.Players.LocalPlayer.Character.Humanoid.Health
maxhp = game.Players.LocalPlayer.Character.Humanoid.MaxHealth
Health:SetTitle(hp .. "│" .. maxhp .. " Health")
task.wait(0.7)
end
end)

spawn(function()
while true do
currentplayer = #Players:GetPlayers()
CurrentPlayers:SetTitle(currentplayer .. " │ Players")
task.wait(0.7)
end
end)

Tabs.Utils:AddButton({
    Title = "Lobby TP",
    Description = "Lobby Teleport",
    Callback = function()
        Window:Dialog({
            Title = "Teleport to Lobby?",
            Content = nil,
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        local player = game.Players.LocalPlayer
                        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                            hrp.CFrame = CFrame.new(
                                64.5012894, 4.00011635, -124.729019,
                                -0.00950993411, 0, 0.99995476,
                                0, 1, 0,
                                -0.99995476, 0, -0.00950993411
                            )
                            task.wait(1)
                            Fluent:Notify({
                                Title = "UJS [Interface]",
                                Content = "Teleported to lobby",
                                SubContent = "",
                                Duration = 5
                            })
                        else
                            Fluent:Notify({
                                Title = "UJS [Interface]",
                                Content = "Failed to Teleport",
                                SubContent = "",
                                Duration = 5
                            })
                        end
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                    end
                }
            }
        })
    end
})

Tabs.Utils:AddButton({
        Title = "Reset",
        Description = "Sets Health to 0",
        Callback = function()
            Window:Dialog({
                Title = "Reset Character?",
                Content = nil,
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.LocalPlayer.Character.Humanoid.Health = 0
			Fluent:Notify({
                                Title = "UJS [Interface]",
                                Content = "Set Health to 0",
                                SubContent = "",
                                Duration = 5
                            })
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                        end
                    }
                }
            })
        end
})

local ToggleShop = Tabs.Utils:AddToggle("Instant Shop1", {Title = "Show Shop", Default = nil })

ToggleShop:OnChanged(function(Value)
if Value == true then
game:GetService("Players").LocalPlayer.PlayerGui.FunnyCatShop.Sh.Visible = true
while Value == true do
game:GetService("Players").LocalPlayer.PlayerGui.FunnyCatShop.Sh.Balance.heya.Text = g
task.wait(0.1)
end
else
game:GetService("Players").LocalPlayer.PlayerGui.FunnyCatShop.Sh.Visible = false
game:GetService("Players").LocalPlayer.PlayerGui.FunnyCatShop.Sh.Balance.heya.Text = 0
end
end)

local HideHP = Tabs.Visuals:AddToggle("Hides Health bar", {Title = "Hide Health Bar", Default = nil })

HideHP:OnChanged(function(Value)
if Value == true then
game:GetService("Players").LocalPlayer.PlayerGui.BetterHealthBar.HealthGui.Visible = false
		else
game:GetService("Players").LocalPlayer.PlayerGui.BetterHealthBar.HealthGui.Visible = true
end
end)

local ShowTrueValue = Tabs.Visuals:AddToggle("Shows the Errored Out text", {Title = "Error 404 Price (Item)", Default = nil })
local textLabel = player.PlayerGui:WaitForChild("FunnyCatShop")
	:WaitForChild("Sh")
	:WaitForChild("Items")
	:WaitForChild("Error404")
	:WaitForChild("Name")

local loopThread = nil

ShowTrueValue:OnChanged(function(Value)
	if Value then
		if loopThread == nil then
			loopThread = coroutine.create(function()
				while ShowTrueValue.Value do
					textLabel.Text = "Error 404 [6666G]"
					wait(0.7)
				end
				loopThread = nil
			end)
			coroutine.resume(loopThread)
		end
	else
	     textLabel.Text = "$#@!%_ - %$#%"
	end
end)

local Players = game:GetService("Players")
local runHighlight = false

local EspToggle = Tabs.Visuals:AddToggle("ESPVAL", {
    Title = "ESP",
    Description = "Shows all Players except you",
    Default = false,
    Callback = function(state)
        runHighlight = state
        if state then
            task.spawn(function()
                while runHighlight do
                    for _, plr in pairs(Players:GetPlayers()) do
                        if plr ~= Players.LocalPlayer and plr.Character then
                            if not plr.Character:FindFirstChild("ESPHighlight") then
                                local highlight = Instance.new("Highlight")
                                highlight.Name = "ESPHighlight"
                                highlight.FillTransparency = 1
                                highlight.OutlineTransparency = 0
                                highlight.OutlineColor = Color3.new(1, 1, 1)
                                highlight.Parent = plr.Character
                            end
                        end
                    end
                    task.wait(0.7)
                end
            end)
        else
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= Players.LocalPlayer and plr.Character then
                    local highlight = plr.Character:FindFirstChild("ESPHighlight")
                    if highlight then
                        highlight:Destroy()
                    end
                end
            end
        end
    end
})

