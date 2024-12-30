local Creator = require("../Creator")
local New = Creator.New
local Tween = Creator.Tween
local ConfigModule = require("../Config/config") -- Подключение конфигурации

local Element = {
    UICorner = 6,
    UIPadding = 8
}

function Element:New(Config)
    local Colorpicker = {
        __type = "Colorpicker",
        Title = Config.Title or "Colorpicker",
        Desc = Config.Desc or nil,
        Locked = Config.Locked or false,
        Default = Config.Default or Color3.new(1, 1, 1),
        Callback = Config.Callback or function() end,
        Window = Config.Window,
        Transparency = Config.Transparency,
        UIElements = {}
    }
    
    local CanCallback = true
    
    -- Загружаем сохранённое значение из конфигурации
    local savedColor = ConfigModule.settings[Colorpicker.Title]
    if savedColor then
        Colorpicker.Default = Color3.fromRGB(savedColor.R, savedColor.G, savedColor.B)
        Colorpicker.Transparency = savedColor.Transparency or Colorpicker.Transparency
    end

    Colorpicker.ColorpickerFrame = require("../Components/Element")({
        Title = Colorpicker.Title,
        Desc = Colorpicker.Desc,
        Parent = Config.Parent,
        Theme = Config.Theme,
        TextOffset = 40,
        Hover = false,
    })
    
    Colorpicker.UIElements.Colorpicker = New("TextButton", {
        BackgroundTransparency = 0,
        Text = "",
        FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
        TextSize = 15,
        TextTransparency = .4,
        Active = false,
        TextXAlignment = "Left",
        BackgroundColor3 = Colorpicker.Default,
        Parent = Colorpicker.ColorpickerFrame.UIElements.Main,
        Size = UDim2.new(0, 30, 0, 30),
        AnchorPoint = Vector2.new(1, 0.5),
        TextTruncate = "AtEnd",
        Position = UDim2.new(1, 0, 0.5, 0),
        ThemeTag = {
            TextColor3 = "Text"
        },
        ZIndex = 2
    }, {
        New("UICorner", {
            CornerRadius = UDim.new(0, Element.UICorner)
        }),
        New("UIStroke", {
            ThemeTag = {
                Color = "Text",
            },
            Transparency = .93,
            ApplyStrokeMode = "Border",
            Thickness = 1,
        }),
    })
    
    function Colorpicker:Lock()
        CanCallback = false
        return Colorpicker.ColorpickerFrame:Lock()
    end
    function Colorpicker:Unlock()
        CanCallback = true
        return Colorpicker.ColorpickerFrame:Unlock()
    end
    
    if Colorpicker.Locked then
        Colorpicker:Lock()
    end

    -- Функция обновления цвета
    function Colorpicker:Update(Color, Transparency)
        Colorpicker.UIElements.Colorpicker.BackgroundTransparency = Transparency or 0
        Colorpicker.UIElements.Colorpicker.BackgroundColor3 = Color
        Colorpicker.Default = Color
        if Transparency then
            Colorpicker.Transparency = Transparency
        end

        -- Сохранение в конфигурацию
        ConfigModule.settings[Colorpicker.Title] = {
            R = math.floor(Color.R * 255),
            G = math.floor(Color.G * 255),
            B = math.floor(Color.B * 255),
            Transparency = Colorpicker.Transparency or 0
        }
        ConfigModule:Save()
    end
    
    local clrpckr = Element:Colorpicker(Colorpicker, function(color, transparency)
        if CanCallback then
            Colorpicker:Update(color, transparency)
            Colorpicker.Default = color
            Colorpicker.Transparency = transparency
            Colorpicker.Callback(color, transparency)
        end
    end)
    
    Colorpicker:Update(Colorpicker.Default, Colorpicker.Transparency)

    Colorpicker.UIElements.Colorpicker.MouseButton1Click:Connect(function()
        if CanCallback then
            clrpckr.ColorpickerFrame:Open()
        end
    end)
    
    return Colorpicker.__type, Colorpicker
end

return Element
