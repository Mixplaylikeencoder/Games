local Creator = require("../Creator")
local New = Creator.New
local Config = require("../Config/config") -- Подключение конфигурации

local Element = {}

local HoldingSlider = false

function Element:New(Config)
    local Slider = {
        __type = "Slider",
        Title = Config.Title or "Slider",
        Desc = Config.Desc or nil,
        Locked = Config.Locked or nil,
        Value = Config.Value or {},
        Step = Config.Step or 1,
        Callback = Config.Callback or function() end,
        UIElements = {},
        IsFocusing = false,
    }
    local isTouch
    local moveconnection
    local releaseconnection

    -- Загрузка значения из конфига
    local savedValue = Config.settings[Slider.Title]
    local Value = savedValue or Slider.Value.Default or Slider.Value.Min or 0

    local LastValue = Value
    local delta = (Value - (Slider.Value.Min or 0)) / ((Slider.Value.Max or 100) - (Slider.Value.Min or 0))
    local CanCallback = true

    Slider.SliderFrame = require("../Components/Element")({
        Title = Slider.Title,
        Desc = Slider.Desc,
        Parent = Config.Parent,
        Theme = Config.Theme,
        TextOffset = 160,
        Hover = false,
    })

    Slider.UIElements.SliderIcon = New("ImageLabel", {
        ImageTransparency = .9,
        BackgroundTransparency = 1,
        Image = "rbxassetid://18747052224",
        ScaleType = "Crop",
        Size = UDim2.new(0, 126, 0, 3),
        Name = "Frame",
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        ThemeTag = {
            ImageColor3 = "Text"
        }
    }, {
        New("UICorner", {
            CornerRadius = UDim.new(1, 0),
        }),
        New("ImageLabel", {
            Name = "Frame",
            Size = UDim2.new(delta, 0, 1, 0),
            Image = "rbxassetid://18747052224",
            ScaleType = "Crop",
            BackgroundTransparency = 1,
            ImageTransparency = .4,
            ThemeTag = {
                ImageColor3 = "Text"
            }
        }, {
            New("UICorner", {
                CornerRadius = UDim.new(1, 0),
            }),
            New("ImageLabel", {
                Size = UDim2.new(0, 13, 0, 13),
                Position = UDim2.new(1, 0, 0.5, 0),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = "rbxassetid://18747052224",
                BackgroundTransparency = 1,
                ThemeTag = {
                    ImageColor3 = "Text",
                },
            })
        })
    })

    Slider.UIElements.SliderContainer = New("Frame", {
        Size = UDim2.new(0, 0, 0, 0),
        AutomaticSize = "XY",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
        BackgroundTransparency = 1,
        Parent = Slider.SliderFrame.UIElements.Main,
    }, {
        New("UIListLayout", {
            Padding = UDim.new(0, 8),
            FillDirection = "Horizontal",
            VerticalAlignment = "Center",
        }),
        Slider.UIElements.SliderIcon,
        New("TextBox", {
            Size = UDim2.new(0, 60, 0, 0),
            TextXAlignment = "Right",
            Text = tostring(Value),
            TextColor3 = Color3.fromHex(Config.Theme.Text),
            ThemeTag = {
                TextColor3 = "Text"
            },
            TextTransparency = .4,
            AutomaticSize = "Y",
            TextSize = 15,
            FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
            BackgroundTransparency = 1,
            LayoutOrder = -1,
        })
    })

    function Slider:Lock()
        CanCallback = false
        return Slider.SliderFrame:Lock()
    end

    function Slider:Unlock()
        CanCallback = true
        return Slider.SliderFrame:Unlock()
    end

    if Slider.Locked then
        Slider:Lock()
    end

    function Slider:Set(Value, input)
        if CanCallback then
            if not Slider.IsFocusing and not HoldingSlider and (not input or (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch)) then
                Value = math.clamp(Value, Slider.Value.Min or 0, Slider.Value.Max or 100)

                local delta = math.clamp((Value - (Slider.Value.Min or 0)) / ((Slider.Value.Max or 100) - (Slider.Value.Min or 0)), 0, 1)
                Value = math.floor((Slider.Value.Min + delta * (Slider.Value.Max - Slider.Value.Min)) / Slider.Step + 0.5) * Slider.Step

                if Value ~= LastValue then
                    Slider.UIElements.SliderIcon.Frame.Size = UDim2.new(delta, 0, 1, 0)
                    Slider.UIElements.SliderContainer.TextBox.Text = tostring(Value)
                    LastValue = Value
                    Slider.Callback(Value)

                    -- Сохраняем значение в конфиг
                    Config.settings[Slider.Title] = Value
                    Config:Save()
                end
            end
        end
    end

    Slider.UIElements.SliderContainer.TextBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local newValue = tonumber(Slider.UIElements.SliderContainer.TextBox.Text)
            if newValue then
                Slider:Set(newValue)
            else
                Slider.UIElements.SliderContainer.TextBox.Text = tostring(LastValue)
            end
        end
    end)

    Slider.UIElements.SliderContainer.InputBegan:Connect(function(input)
        Slider:Set(Value, input)
    end)

    return Slider.__type, Slider
end

return Element