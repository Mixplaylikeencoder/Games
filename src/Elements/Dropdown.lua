local UserInputService = game:GetService("UserInputService")
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local Camera = game:GetService("Workspace").CurrentCamera

local Creator = require("../Creator")
local New = Creator.New
local Tween = Creator.Tween
local ConfigModule = require("../Config/config") -- Подключение конфигурации

local Element = {
    UICorner = 6,
    UIPadding = 8,
    MenuCorner = 14,
    MenuPadding = 7,
    TabPadding = 10,
}

function Element:New(Config)
    local Dropdown = {
        __type = "Dropdown",
        Title = Config.Title or "Dropdown",
        Desc = Config.Desc or nil,
        Locked = Config.Locked or false,
        Values = Config.Values or {},
        Value = Config.Value,
        AllowNone = Config.AllowNone,
        Multi = Config.Multi,
        Callback = Config.Callback or function() end,
        
        UIElements = {},
        
        Opened = false,
        Tabs = {}
    }
    
    local CanCallback = true
    
    -- Загрузка сохранённого значения из конфига
    Dropdown.Value = ConfigModule.settings[Dropdown.Title] or Dropdown.Value or (Dropdown.Multi and {})

    Dropdown.DropdownFrame = require("../Components/Element")({
        Title = Dropdown.Title,
        Desc = Dropdown.Desc,
        Parent = Config.Parent,
        Theme = Config.Theme,
        TextOffset = 160,
        Hover = false,
    })
    
    Dropdown.UIElements.Dropdown = New("TextButton",{
        BackgroundTransparency = .95,
        Text = "",
        FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
        TextSize = 15,
        TextTransparency = .4,
        TextXAlignment = "Left",
        BackgroundColor3 = Color3.fromHex(Config.Theme.Text),
        Parent = Dropdown.DropdownFrame.UIElements.Main,
        Size = UDim2.new(0,30*5,0,30),
        AnchorPoint = Vector2.new(1,0.5),
        TextTruncate = "AtEnd",
        Position = UDim2.new(1,0,0.5,0),
        ThemeTag = {
            BackgroundColor3 = "Text",
            TextColor3 = "Text"
        },
        ZIndex = 2
    }, {
        New("UICorner", {
            CornerRadius = UDim.new(0,Element.UICorner)
        }),
        New("UIStroke", {
            Color = Color3.fromHex(Config.Theme.Text),
            ThemeTag = {
                Color = "Text",
            },
            Transparency = .93,
            ApplyStrokeMode = "Border",
            Thickness = 1,
        }),
        New("UIPadding", {
            PaddingTop = UDim.new(0,Element.UIPadding),
            PaddingLeft = UDim.new(0,Element.UIPadding),
            PaddingRight = UDim.new(0,Element.UIPadding*2 + 18),
            PaddingBottom = UDim.new(0,Element.UIPadding),
        }),
        New("ImageLabel", {
            Image = Creator.Icon("chevron-down")[1],
            ImageRectOffset = Creator.Icon("chevron-down")[2].ImageRectPosition,
            ImageRectSize = Creator.Icon("chevron-down")[2].ImageRectSize,
            Size = UDim2.new(0,18,0,18),
            Position = UDim2.new(1,Element.UIPadding + 18,0.5,0),
            ThemeTag = {
                ImageColor3 = "Text"
            },
            AnchorPoint = Vector2.new(1,0.5),
        })
    })

    -- Функция для сохранения состояния Dropdown в конфиг
    local function SaveToConfig()
        ConfigModule.settings[Dropdown.Title] = Dropdown.Value
        ConfigModule:Save()
    end
    
    function Dropdown:Display()
        local Values = Dropdown.Values
        local Str = ""

        if Dropdown.Multi then
            for Idx, Value in next, Values do
                if table.find(Dropdown.Value, Value) then
                    Str = Str .. Value .. ", "
                end
            end
            Str = Str:sub(1, #Str - 2)
        else
            Str = Dropdown.Value or ""
        end

        Dropdown.UIElements.Dropdown.Text = (Str == "" and "--" or Str)
    end
    
    function Dropdown:Refresh(Values)
        for _, Elementt in next, Dropdown.UIElements.Menu.CanvasGroup.ScrollingFrame:GetChildren() do
            if not Elementt:IsA("UIListLayout") then
                Elementt:Destroy()
            end
        end
        
        Dropdown.Tabs = {}
        
        for Index, Tab in next, Values do
            local TabMain = {
                Name = Tab,
                Selected = false,
                UIElements = {},
            }
            TabMain.UIElements.TabItem = New("TextButton", {
                Size = UDim2.new(1,0,0,34),
                BackgroundTransparency = 1,
                Parent = Dropdown.UIElements.Menu.CanvasGroup.ScrollingFrame,
                Text = Tab,
                TextXAlignment = "Left",
                FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
                ThemeTag = {
                    TextColor3 = "Text",
                    BackgroundColor3 = "Text"
                },
                TextSize = 15,
            }, {
                New("UIPadding", {
                    PaddingTop = UDim.new(0,Element.TabPadding),
                    PaddingLeft = UDim.new(0,Element.TabPadding),
                    PaddingRight = UDim.new(0,Element.TabPadding),
                    PaddingBottom = UDim.new(0,Element.TabPadding),
                }),
                New("UICorner", {
                    CornerRadius = UDim.new(0,Element.MenuCorner - Element.MenuPadding)
                })
            })

            if Dropdown.Multi then
                TabMain.Selected = table.find(Dropdown.Value or {}, TabMain.Name)
            else
                TabMain.Selected = Dropdown.Value == TabMain.Name
            end
            
            if TabMain.Selected then
                TabMain.UIElements.TabItem.BackgroundTransparency = .93
            end
            
            Dropdown.Tabs[Index] = TabMain
            
            TabMain.UIElements.TabItem.MouseButton1Click:Connect(function()
                if Dropdown.Multi then
                    if not TabMain.Selected then
                        TabMain.Selected = true
                        Tween(TabMain.UIElements.TabItem, 0.1, {BackgroundTransparency = .93}):Play()
                        table.insert(Dropdown.Value, TabMain.Name)
                    else
                        if not Dropdown.AllowNone and #Dropdown.Value == 1 then
                            return
                        end
                        TabMain.Selected = false
                        Tween(TabMain.UIElements.TabItem, 0.1, {BackgroundTransparency = 1}):Play()
                        for i, v in ipairs(Dropdown.Value) do
                            if v == TabMain.Name then
                                table.remove(Dropdown.Value, i)
                                break
                            end
                        end
                    end
                else
                    for _, TabPisun in next, Dropdown.Tabs do
                        Tween(TabPisun.UIElements.TabItem, 0.1, {BackgroundTransparency = 1}):Play()
                        TabPisun.Selected = false
                    end
                    TabMain.Selected = true
                    Tween(TabMain.UIElements.TabItem, 0.1, {BackgroundTransparency = .93}):Play()
                    Dropdown.Value = TabMain.Name
                end

                SaveToConfig() -- Сохранение в конфиг
                Dropdown:Display()
                Dropdown.Callback(Dropdown.Value)
            end)
        end
    end

    Dropdown:Refresh(Dropdown.Values)
    Dropdown:Display()
    
    return Dropdown.__type, Dropdown
end

return Element
