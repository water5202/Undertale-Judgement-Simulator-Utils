local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Players = game:GetService("Players")
local currentplayer

Fluent:Notify({
        Title = "UJS [Interface]",
        Content = "1.0",
        SubContent = "made by water.5202 :D",
        Duration = 5
})

local Window = Fluent:CreateWindow({
    Title = "UJS [Water's Utils] │ " .. identifyexecutor(),
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.P
})

local Tabs = {
    Utils = Window:AddTab({ Title = "Utilites", Icon = "hammer" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}
Window:SelectTab(1)

local CurrentPlayers = Tabs.Utils:AddParagraph({
        Title = "",
        Content = ""
})

spawn(function()
currentplayer = #Players:GetPlayers()
CurrentPlayers:SetTitle(currentplayer .. " │ Players")
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

local BypassShopInteract = Tabs.Utils:AddToggle("Instant Shop", {Title = "Instant Shop Interaction", Default = false })

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
SubContent = "Make sure to walk away from the button and back to fix not being able to click",
Duration = 5
})
end
end)

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
