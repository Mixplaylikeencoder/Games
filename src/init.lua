local WindUI = {
    Window = nil,
    Theme = nil,
    Themes = nil,
    Transparent = false,
    
    TransparencyValue = .25
}
local RunService = game:GetService("RunService")

local Themes = require("./Themes/init")
local Creator = require("./Creator")
local New = Creator.New
local Tween = Creator.Tween

local LocalPlayer = game:GetService("Players") and game:GetService("Players").LocalPlayer or nil

WindUI.Themes = Themes

local ProtectGui = protectgui or (syn and syn.protect_gui) or function() end

local ConfigModule = require("./Config/config") -- Подключение конфигурации

WindUI.ScreenGui = New("ScreenGui", {
    Name = "WindUI",
    Parent = RunService:IsStudio() and LocalPlayer.PlayerGui or game:GetService("CoreGui"),
    IgnoreGuiInset = true,
}, {
    New("Folder", {
        Name = "Window"
    }),
    New("Folder", {
        Name = "Notifications"
    }),
    New("Folder", {
        Name = "Dropdowns"
    }),
    New("Folder", {
        Name = "KeySystem"
    })
})
ProtectGui(WindUI.ScreenGui)

local Notify = require("./Components/Notification")
local Holder = Notify.Init(WindUI.ScreenGui.Notifications)

function WindUI:Notify(Config)
    return Notify.New({
        Title = Config.Title,
        Content = Config.Content,
        Duration = Config.Duration,
        Icon = Config.Icon,
        CanClose = Config.CanClose,
        Buttons = Config.Buttons ,
        Window = WindUI.Window,
        Holder = Holder,
    })
end

function WindUI:SaveConfig()
    ConfigModule.settings.Window = {
        Size = WindUI.Window.UIElements.Main.Size,
        Transparent = WindUI.Transparent,
        Theme = WindUI.Theme.Name,
    }
    ConfigModule:Save()
end

function WindUI:SetFont(FontId)
    Creator.UpdateFont(FontId)
end

function WindUI:AddTheme(LTheme)
    Themes[LTheme.Name] = LTheme
    return LTheme
end

function WindUI:SetTheme(Value)
    if Themes[Value] then
        WindUI.Theme = Themes[Value]
        Creator.SetTheme(Themes[Value])
        Creator.UpdateTheme()
        
        -- Сохраняем выбранную тему
        WindUI:SaveConfig()
        
        return Themes[Value]
    end
    return nil
end

function WindUI:CreateWindow(Config)
    local CreateWindow = require("./Components/Window")
    
    if WindUI.Window then
        warn("You cannot create more than one window")
        return
    end
    
    local CanLoadWindow = true

    -- Загрузка сохранённой конфигурации
    local savedConfig = ConfigModule.settings.Window or {}
    local Theme = Themes[savedConfig.Theme] or Themes[Config.Theme or "Dark"]
    WindUI.Theme = Theme
    Creator.SetTheme(Theme)
    
    WindUI.Transparent = savedConfig.Transparent or Config.Transparent

    local Window = CreateWindow({
        Title = Config.Title,
        Author = Config.Author,
        Size = savedConfig.Size or Config.Size,
        Transparent = WindUI.Transparent,
        Icon = Config.Icon,
        Folder = Config.Folder,
        HasOutline = Config.HasOutline,
        Theme = Theme,
        WindUI = WindUI,
        Parent = WindUI.ScreenGui.Window,
        SideBarWidth = Config.SideBarWidth
    })

    WindUI.Window = Window

    function Window:ToggleTransparency(Value)
        WindUI.Transparent = Value
        Window.UIElements.Main.Background.BackgroundTransparency = Value and WindUI.TransparencyValue or 0
        Window.UIElements.Main.Gradient.UIGradient.Transparency = NumberSequence.new{
            NumberSequenceKeypoint.new(0, 1), 
            NumberSequenceKeypoint.new(1, Value and 0.85 or 0.7),
        }
        
        -- Сохраняем состояние прозрачности
        WindUI:SaveConfig()
    end

    return Window
end

return WindUI
