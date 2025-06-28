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
Wins:SetTitle(ws .. "Wins")
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

local BypassShopInteract = Tabs.Utils:AddToggle("Instant Shop", {Title = "Instant Shop Interaction", Default = nil })

BypassShopInteract:OnChanged(function(Value)
if Value == true then
workspace.Lobby:GetChildren()[90].h.ProximityPrompt.HoldDuration = 0
Fluent:Notify({
Title = "UJS [Interface]",
Content = "Disabled Cooldown",
SubContent = "",
Duration = 5
})
else
workspace.Lobby:GetChildren()[90].h.ProximityPrompt.HoldDuration = 0.5
Fluent:Notify({
Title = "UJS [Interface]",
Content = "Enabled Cooldown",
SubContent = "Ensure to walk away from the button and back to fix not being able to click!",
Duration = 5
})
end
end)

local ToggleShop = Tabs.Utils:AddToggle("Instant Shop1", {Title = "Show Shop", Default = nil })

ToggleShop:OnChanged(function(Value)
if Value == true then
game:GetService("Players").LocalPlayer.PlayerGui.FunnyCatShop.Sh.Visible = true
else
game:GetService("Players").LocalPlayer.PlayerGui.FunnyCatShop.Sh.Visible = false
end
end)

