local Creator = require("../Creator")
local New = Creator.New
local Tween = Creator.Tween
local Config = require("../Config/config") -- Подключение конфигурации

local Element = {}

function Element:New(Config)
    local Toggle = {
        __type = "Toggle",
        Title = Config.Title or "Toggle",
        Desc = Config.Desc or nil,
        Value = Config.Value,
        Callback = Config.Callback or function() end,
        UIElements = {}
    }
    Toggle.ToggleFrame = require("../Components/Element")({
        Title = Toggle.Title,
        Desc = Toggle.Desc,
        Parent = Config.Parent,
        Theme = Config.Theme,
        TextOffset = 44,
        Hover = true,
    })

    local CanCallback = true

    -- Загружаем значение из конфигурации, если оно сохранено
    if Config.settings[Toggle.Title] ~= nil then
        Toggle.Value = Config.settings[Toggle.Title]
    elseif Toggle.Value == nil then
        Toggle.Value = false
    end

    Toggle.UIElements.Toggle = New("Frame", {
        BackgroundTransparency = .95,
        BackgroundColor3 = Color3.fromHex(Config.Theme.Text),
        ThemeTag = {
            BackgroundColor3 = "Text"
        },
        Parent = Toggle.ToggleFrame.UIElements.Main,
        Size = UDim2.new(0, 20 * 2.2, 0, 24),
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0)
    }, {
        New("UICorner", {
            CornerRadius = UDim.new(1, 0)
        }),
        New("UIStroke", {
            Color = Color3.fromHex(Config.Theme.Text),
            ThemeTag = {
                Color = "Text",
            },
            Transparency = .93,
            Thickness = 1,
        }),
        New("Frame", {
            Size = UDim2.new(0, 18, 0, 18),
            Position = UDim2.new(0, 3, 0.5, 0),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundTransparency = 0.15,
            BackgroundColor3 = Color3.fromHex(Config.Theme.Text),
            ThemeTag = {
                BackgroundColor3 = "Text"
            },
        }, {
            New("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }),
            New("Frame", {
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                ThemeTag = {
                    BackgroundColor3 = "Accent"
                },
            }, {
                New("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }),
            })
        })
    })

    function Toggle:Lock()
        CanCallback = false
        return Toggle.ToggleFrame:Lock()
    end

    function Toggle:Unlock()
        CanCallback = true
        return Toggle.ToggleFrame:Unlock()
    end

    if Toggle.Locked then
        Toggle:Lock()
    end

    local Toggled = Toggle.Value

    function Toggle:SetValue(newValue)
        Toggled = newValue or Toggled

        if Toggled then
            Tween(Toggle.UIElements.Toggle.Frame, 0.1, {
                Position = UDim2.new(1, -18 - 3, 0.5, 0),
                BackgroundTransparency = 1,
            }):Play()
            Tween(Toggle.UIElements.Toggle.Frame.Frame, 0.1, {
                BackgroundTransparency = 0.15,
            }):Play()
            Tween(Toggle.UIElements.Toggle, 0.1, {
                BackgroundTransparency = 0.15,
            }):Play()
        else
            Tween(Toggle.UIElements.Toggle.Frame, 0.1, {
                Position = UDim2.new(0, 3, 0.5, 0),
                BackgroundTransparency = 0.15,
            }):Play()
            Tween(Toggle.UIElements.Toggle.Frame.Frame, 0.1, {
                BackgroundTransparency = 1,
            }):Play()
            Tween(Toggle.UIElements.Toggle, 0.1, {
                BackgroundTransparency = 0.95,
            }):Play()
        end

        task.spawn(function()
            Toggle.Callback(Toggled)
        end)

        -- Сохраняем состояние в конфиг
        Config.settings[Toggle.Title] = Toggled
        Config:Save()

        Toggled = not Toggled
    end

    Toggle:SetValue(Toggled)

    Toggle.ToggleFrame.UIElements.Main.MouseButton1Click:Connect(function()
        if CanCallback then
            Toggle:SetValue(Toggled)
        end
    end)

    return Toggle.__type, Toggle
end

return Element
