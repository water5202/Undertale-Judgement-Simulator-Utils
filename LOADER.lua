local Library = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
Fluent:Notify({
        Title = "UJS [Interface]",
        Content = "1.0",
        SubContent = "made by water.5202 :D", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
})

local Window = Fluent:CreateWindow({
    Title = "UJS [Water's Utils] : " .. identifyexecutor(),
    SubTitle = "by dawid",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.Quote
})
