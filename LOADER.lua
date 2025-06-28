local Library = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
Fluent:Notify({
        Title = "UJS [Interface]",
        Content = "1.0",
        SubContent = "made by water.5202 :D",
        Duration = 5
})

local Window = Fluent:CreateWindow({
    Title = "UJS [Water's Utils] : " .. identifyexecutor(),
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.Quote
})

local Tabs = {
    Utils = Window:AddTab({ Title = "Utilites", Icon = "hammer" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}
Window:SelectTab(1)


