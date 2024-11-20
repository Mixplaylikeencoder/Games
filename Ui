local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local HTTPService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

-- Variables

local LocalPlayer = Players.LocalPlayer
local Viewport = workspace.CurrentCamera.ViewportSize
local Mouse = LocalPlayer:GetMouse()

-- Library

local Library = {}

function Library:Tween(Object, Goal, Callback)
    if not Object then return end
    local Tween = TweenService:Create(Object, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), Goal)
    Tween.Completed:Connect(Callback or function() end)
    Tween:Play()
end

function Library:Validate(Defaults, Options)
    Options = Options or {}

    for Index, Option in pairs(Defaults) do
        if Options[Index] == nil and Options[Index] ~= false then
            Options[Index] = Option
        end
    end

    return Options
end

function Library:CreateWindow(Options)
    Options = Library:Validate({
        Name = "Emperion Library"
    }, Options)

    local Window = {
        ActiveTab = nil	
    }

    -- StarterGui.Emperion
    Window["1"] = Instance.new("ScreenGui", (RunService:IsStudio() and Players.LocalPlayer:WaitForChild("PlayerGui") or CoreGui))
    Window["1"].Name = [[Emperion]]
    Window["1"].IgnoreGuiInset = true
    
    Window["21"] = Instance.new("UIScale", Window["1"])

    -- StarterGui.Emperion.Main
    Window["2"] = Instance.new("Frame", Window["1"])
    Window["2"].BorderSizePixel = 0
    -- Изменён цвет фона на фиолетовый
    Window["2"].BackgroundColor3 = Color3.fromRGB(50, 0, 100)
    Window["2"].AnchorPoint = Vector2.new(0.5, 0.5)
    Window["2"].Size = UDim2.new(0, 550, 0, 400)
    Window["2"].Position = UDim2.new(0.5, 0, 0.5, 0)
    Window["2"].BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window["2"].Name = [[Main]]

    -- StarterGui.Emperion.Main.UICorner
    Window["3"] = Instance.new("UICorner", Window["2"])

    -- StarterGui.Emperion.Main.DropShadowHolder
    Window["4"] = Instance.new("Frame", Window["2"])
    Window["4"].ZIndex = 0
    Window["4"].BorderSizePixel = 0
    Window["4"].Size = UDim2.new(1, 0, 1, 0)
    Window["4"].Name = [[DropShadowHolder]]
    Window["4"].BackgroundTransparency = 1

    -- StarterGui.Emperion.Main.DropShadowHolder.DropShadow
    Window["5"] = Instance.new("ImageLabel", Window["4"])
    Window["5"].ZIndex = 0
    Window["5"].BorderSizePixel = 0
    Window["5"].SliceCenter = Rect.new(49, 49, 450, 450)
    Window["5"].ScaleType = Enum.ScaleType.Slice
    Window["5"].ImageTransparency = 0.5
    -- Изменён цвет тени на фиолетовый оттенок
    Window["5"].ImageColor3 = Color3.fromRGB(50, 0, 100)
    Window["5"].AnchorPoint = Vector2.new(0.5, 0.5)
    Window["5"].Image = [[rbxassetid://6014261993]]
    Window["5"].Size = UDim2.new(1, 47, 1, 47)
    Window["5"].BackgroundTransparency = 1
    Window["5"].Name = [[DropShadow]]
    Window["5"].Position = UDim2.new(0.5, 0, 0.5, 0)

    -- StarterGui.Emperion.Main.TopBar
    Window["6"] = Instance.new("Frame", Window["2"])
    Window["6"].BorderSizePixel = 0
    -- Изменён цвет TopBar на фиолетовый
    Window["6"].BackgroundColor3 = Color3.fromRGB(75, 0, 130)
    Window["6"].Size = UDim2.new(1, 0, 0, 40)
    Window["6"].BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window["6"].Name = [[TopBar]]

    -- StarterGui.Emperion.Main.TopBar.Border
    Window["7"] = Instance.new("Frame", Window["6"])
    Window["7"].ZIndex = 2
    Window["7"].BorderSizePixel = 0
    Window["7"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Window["7"].AnchorPoint = Vector2.new(0, 1)
    Window["7"].Size = UDim2.new(1, 0, 0, 1)
    Window["7"].Position = UDim2.new(0, 0, 1, 0)
    Window["7"].BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window["7"].Name = [[Border]]
    Window["7"].BackgroundTransparency = 0.95

    -- Создаём контейнер для "M" и заголовка
    Window["TitleContainer"] = Instance.new("Frame", Window["6"])
    Window["TitleContainer"].BackgroundTransparency = 1
    Window["TitleContainer"].Size = UDim2.new(1, -60, 1, 0) -- Подстройте под ваши нужды
    Window["TitleContainer"].Position = UDim2.new(0, 10, 0, 0)

    -- Добавляем UIListLayout для автоматического размещения элементов
    local titleLayout = Instance.new("UIListLayout", Window["TitleContainer"])
    titleLayout.FillDirection = Enum.FillDirection.Horizontal
    titleLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    titleLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    titleLayout.Padding = UDim.new(0, 7) -- Отступ между "M" и заголовком

    -- Добавление буквы "M" в левый верхний угол TitleContainer
    Window["MLabel"] = Instance.new("TextLabel", Window["TitleContainer"])
    Window["MLabel"].Text = "M"
    Window["MLabel"].Font = Enum.Font.GothamBold
    Window["MLabel"].TextSize = 24
    Window["MLabel"].TextColor3 = Color3.fromRGB(255, 255, 255)
    Window["MLabel"].BackgroundTransparency = 1
    Window["MLabel"].Size = UDim2.new(0, 20, 0, 20)
    Window["MLabel"].Name = "MLabel"

    -- StarterGui.Emperion.Main.TopBar.Title
    Window["8"] = Instance.new("TextLabel", Window["TitleContainer"])
    Window["8"].BorderSizePixel = 0
    Window["8"].TextXAlignment = Enum.TextXAlignment.Left
    Window["8"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Window["8"].TextSize = 18
    Window["8"].FontFace = Font.new([[rbxassetid://11702779517]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    Window["8"].TextColor3 = Color3.fromRGB(255, 255, 255)
    Window["8"].BackgroundTransparency = 1
    Window["8"].Size = UDim2.new(1, 0, 1, 0)
    Window["8"].BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window["8"].Text = Options.Name
    Window["8"].Name = [[Title]]

    -- StarterGui.Emperion.Main.TopBar.Title.UIPadding
    Window["9"] = Instance.new("UIPadding", Window["8"])
    Window["9"].PaddingLeft = UDim.new(0, 14)

    -- StarterGui.Emperion.Main.TopBar.Exit
    Window["a"] = Instance.new("ImageLabel", Window["6"])
    Window["a"].BorderSizePixel = 0
    Window["a"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Window["a"].AnchorPoint = Vector2.new(1, 0)
    Window["a"].Image = [[rbxassetid://10747384394]]
    Window["a"].Size = UDim2.new(0, 20, 0, 20)
    Window["a"].BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window["a"].BackgroundTransparency = 1
    Window["a"].Name = [[Exit]]
    Window["a"].Position = UDim2.new(1, -8, 0, 10)
    
    -- StarterGui.Emperion.Main.TopBar.Minimize
    Window["b"] = Instance.new("ImageLabel", Window["6"])
    Window["b"].BorderSizePixel = 0
    Window["b"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Window["b"].AnchorPoint = Vector2.new(1, 0)
    Window["b"].Image = [[rbxassetid://10734896206]]
    Window["b"].Size = UDim2.new(0, 20, 0, 20)
    Window["b"].BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window["b"].BackgroundTransparency = 1
    Window["b"].Name = [[Minimize]]
    Window["b"].Position = UDim2.new(1, -33, 0, 10)
    
    -- StarterGui.Emperion.Main.TopBar.UICorner
    Window["c"] = Instance.new("UICorner", Window["6"])
    
    -- StarterGui.Emperion.Main.TopBar.Extension
    Window["d"] = Instance.new("Frame", Window["6"])
    Window["d"].BorderSizePixel = 0
    -- Изменён цвет фона на фиолетовый
    Window["d"].BackgroundColor3 = Color3.fromRGB(75, 0, 130)
    Window["d"].AnchorPoint = Vector2.new(0, 1)
    Window["d"].Size = UDim2.new(1, 0, 0.25, 0)
    Window["d"].Position = UDim2.new(0, 0, 1, 0)
    Window["d"].BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window["d"].Name = [[Extension]]
    
    -- StarterGui.Emperion.Main.ContentContainer
    Window["20"] = Instance.new("Frame", Window["2"])
    Window["20"].BorderSizePixel = 0
    -- Изменён цвет фона на фиолетовый
    Window["20"].BackgroundColor3 = Color3.fromRGB(50, 0, 100)
    Window["20"].AnchorPoint = Vector2.new(1, 0)
    Window["20"].Size = UDim2.new(1, -180, 1, -40)
    Window["20"].Position = UDim2.new(1, 0, 0, 40)
    Window["20"].BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window["20"].Name = [[ContentContainer]]
    Window["20"].BackgroundTransparency = 1
    
    -- StarterGui.Emperion.Main.Navigation
    Window["e"] = Instance.new("Frame", Window["2"])
    Window["e"].BorderSizePixel = 0
    -- Изменён цвет фона на фиолетовый
    Window["e"].BackgroundColor3 = Color3.fromRGB(75, 0, 130)
    Window["e"].Size = UDim2.new(0, 180, 1, -41)
    Window["e"].Position = UDim2.new(0, 0, 0, 40)
    Window["e"].BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window["e"].Name = [[Navigation]]
    
    -- StarterGui.Emperion.Main.Navigation.UICorner
    Window["f"] = Instance.new("UICorner", Window["e"])
    
    -- StarterGui.Emperion.Main.Navigation.Hide (верхний скрывающий элемент)
    Window["10"] = Instance.new("Frame", Window["e"])
    Window["10"].BorderSizePixel = 0
    Window["10"].BackgroundColor3 = Color3.fromRGB(75, 0, 130)
    Window["10"].Size = UDim2.new(1, 0, 0, 20)
    Window["10"].BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window["10"].Name = [[Hide]]
    
    -- StarterGui.Emperion.Main.Navigation.Hide (нижний скрывающий элемент)
    Window["11"] = Instance.new("Frame", Window["e"])
    Window["11"].BorderSizePixel = 0
    Window["11"].BackgroundColor3 = Color3.fromRGB(75, 0, 130)
    Window["11"].AnchorPoint = Vector2.new(0, 1)
    Window["11"].Size = UDim2.new(1, 0, 0, 20)
    Window["11"].Position = UDim2.new(0, 0, 1, 0)
    Window["11"].BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window["11"].Name = [[Hide]]
    
    -- StarterGui.Emperion.Main.Navigation.Border
    Window["12"] = Instance.new("Frame", Window["e"])
    Window["12"].ZIndex = 2
    Window["12"].BorderSizePixel = 0
    Window["12"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Window["12"].AnchorPoint = Vector2.new(1, 0)
    Window["12"].Size = UDim2.new(0, 1, 1, 0)
    Window["12"].Position = UDim2.new(1, 0, 0, 0)
    Window["12"].BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window["12"].Name = [[Border]]
    Window["12"].BackgroundTransparency = 0.95
    
    -- StarterGui.Emperion.Main.Navigation.Holder
    Window["13"] = Instance.new("Frame", Window["e"])
    Window["13"].BorderSizePixel = 0
    Window["13"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Window["13"].Size = UDim2.new(1, 0, 1, 0)
    Window["13"].BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window["13"].Name = [[Holder]]
    Window["13"].BackgroundTransparency = 1
    
    -- StarterGui.Emperion.Main.Navigation.Holder.UIPadding
    Window["14"] = Instance.new("UIPadding", Window["13"])
    Window["14"].PaddingTop = UDim.new(0, 8)
    Window["14"].PaddingRight = UDim.new(0, 10)
    Window["14"].PaddingLeft = UDim.new(0, 10)
    Window["14"].PaddingBottom = UDim.new(0, 8)

    	-- StarterGui.Emperion.Notifications
	Window["16"] = Instance.new("Frame", Window["1"]);
	Window["16"]["BorderSizePixel"] = 0;
	Window["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	Window["16"]["AnchorPoint"] = Vector2.new(1, 0);
	Window["16"]["Size"] = UDim2.new(0, 300, 1, -10);
	Window["16"]["Position"] = UDim2.new(1, 0, 0, 0);
	Window["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	Window["16"]["Name"] = [[Notifications]];
	Window["16"]["BackgroundTransparency"] = 1;

	-- StarterGui.Emperion.Notifications.UIListLayout
	Window["17"] = Instance.new("UIListLayout", Window["16"]);
	Window["17"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
	Window["17"]["Padding"] = UDim.new(0, 10);
	Window["17"]["VerticalAlignment"] = Enum.VerticalAlignment.Bottom;
	Window["17"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

    -- StarterGui.Emperion.Main.Navigation.Holder.UIListLayout
    Window["15"] = Instance.new("UIListLayout", Window["13"])
    Window["15"].Padding = UDim.new(0, 7)
    Window["15"].SortOrder = Enum.SortOrder.LayoutOrder
        
        function Window:Activate()
            if not Window.Active then
                Window.Active = true
                Library:Tween(Window["2"], {BackgroundTransparency = 0.8})
            end
        end
    
        function Window:Deactivate()
            if Window.Active then
                Window.Active = false
                Library:Tween(Window["2"], {BackgroundTransparency = 1})
            end
        end
    
        -- Обработчики событий для кнопок выхода и сворачивания окна
        Window["a"].InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
    
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                Window:Destroy()
            end
        end)
    
        Window["b"].InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
    
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                if Window["21"].Visible then
                    Library:Tween(Window["21"], {Size = UDim2.new(0, 0, 1, -40)}, function()
                        Window["21"].Visible = false
                    end)
                else
                    Window["21"].Visible = true
                    Library:Tween(Window["21"], {Size = UDim2.new(1, -180, 1, -40)})
                end
            end
        end)
    
        -- Dragging functionality
        local Drag = Window["6"]
    
        local Dragging
        local DragInput
        local DragStart
        local StartPos
    
        function Library:_UpdatePosition(Input)
            local Delta = Input.Position - DragStart
            Window["2"].Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
        end
    
        Drag.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPos = Window["2"].Position
    
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        Dragging = false
                    end
                end)
            end
        end)
    
        Drag.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                DragInput = input
            end
        end)
    
        UserInputService.InputChanged:Connect(function(input)
            if input == DragInput and Dragging then
                Library:_UpdatePosition(input)
            end
        end)
        
	function Window:Notification(Options)
	    -- Проверка и валидирование переданных параметров
	    Options = Library:Validate({
	        Title = "Notification",
	        Description = "This is an example notification!",
	        Button = {
	            Name = "Okay!",
	            Callback = function()
	                -- По умолчанию ничего не делает
	            end,
	        },
	        Duration = 5, -- Продолжительность в секундах до автозакрытия (по умолчанию)
	        BackgroundColor = Color3.fromRGB(23, 23, 23), -- Цвет фона уведомления
	        StrokeColor = Color3.fromRGB(255, 255, 255), -- Цвет обводки уведомления
	    }, Options)
	    
	    -- Создаем структуру для уведомления
	    local Notification = {
	        Hover = false,
	        MouseDown = false
	    }
	
	    -- Создаем основную рамку уведомления
	    Notification["3"] = Instance.new("Frame", Window["16"])
	    Notification["3"]["BorderSizePixel"] = 0
	    Notification["3"]["BackgroundColor3"] = Options.BackgroundColor
	    Notification["3"]["AnchorPoint"] = Vector2.new(1, 1)
	    Notification["3"]["Size"] = UDim2.new(0, 279, 0, 155)
	    Notification["3"]["Position"] = UDim2.new(1, -10, 1, -10)
	    Notification["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	    Notification["3"]["Name"] = "Notification"
	
	    -- Скругление углов
	    Notification["4"] = Instance.new("UICorner", Notification["3"])
	
	    -- Масштаб
	    Notification["12"] = Instance.new("UIScale", Notification["3"])
	    Notification["12"]["Scale"] = 0.5
	
	    -- Обводка
	    Notification["5"] = Instance.new("UIStroke", Notification["3"])
	    Notification["5"]["Transparency"] = 0.9
	    Notification["5"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
	    Notification["5"]["Color"] = Options.StrokeColor
	
	    -- Кнопка "Okay!"
	    Notification["6"] = Instance.new("TextButton", Notification["3"])
	    Notification["6"]["BorderSizePixel"] = 0
	    Notification["6"]["BackgroundColor3"] = Color3.fromRGB(29, 29, 29)
	    Notification["6"]["TextSize"] = 16
	    Notification["6"]["TextTransparency"] = 0.2
	    Notification["6"]["FontFace"] = Font.new("rbxassetid://11702779517", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	    Notification["6"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
	    Notification["6"]["AnchorPoint"] = Vector2.new(0, 1)
	    Notification["6"]["Size"] = UDim2.new(1, -20, 0, 35)
	    Notification["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	    Notification["6"]["Text"] = Options.Button.Name
	    Notification["6"]["Name"] = "Button"
	    Notification["6"]["Position"] = UDim2.new(0, 10, 1.008, -10)
	    Notification["6"]["Visible"] = false
	    Notification["6"]["ZIndex"] = 10
	
	    -- Скругление углов кнопки
	    Notification["7"] = Instance.new("UICorner", Notification["6"])
	    Notification["7"]["CornerRadius"] = UDim.new(0, 5)
	
	    -- Обводка кнопки
	    Notification["8"] = Instance.new("UIStroke", Notification["6"])
	    Notification["8"]["Transparency"] = 0.96
	    Notification["8"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
	    Notification["8"]["Color"] = Color3.fromRGB(255, 255, 255)
	
	    -- Верхняя панель уведомления
	    Notification["9"] = Instance.new("Frame", Notification["3"])
	    Notification["9"]["BorderSizePixel"] = 0
	    Notification["9"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25)
	    Notification["9"]["Size"] = UDim2.new(1, 0, -0.06107, 40)
	    Notification["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	    Notification["9"]["Name"] = "TopBar"
	
	    -- Нижняя линия верхней панели
	    Notification["a"] = Instance.new("Frame", Notification["9"])
	    Notification["a"]["ZIndex"] = 2
	    Notification["a"]["BorderSizePixel"] = 0
	    Notification["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	    Notification["a"]["AnchorPoint"] = Vector2.new(0, 1)
	    Notification["a"]["Size"] = UDim2.new(1, 0, 0, 1)
	    Notification["a"]["Position"] = UDim2.new(0, 0, 1, 0)
	    Notification["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	    Notification["a"]["Name"] = "Border"
	    Notification["a"]["BackgroundTransparency"] = 0.95
	
	    -- Заголовок уведомления
	    Notification["b"] = Instance.new("TextLabel", Notification["9"])
	    Notification["b"]["BorderSizePixel"] = 0
	    Notification["b"]["TextXAlignment"] = Enum.TextXAlignment.Left
	    Notification["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	    Notification["b"]["TextSize"] = 18
	    Notification["b"]["FontFace"] = Font.new("rbxassetid://11702779517", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	    Notification["b"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
	    Notification["b"]["BackgroundTransparency"] = 1
	    Notification["b"]["Size"] = UDim2.new(1, 0, 1, 0)
	    Notification["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	    Notification["b"]["Text"] = Options.Title
	    Notification["b"]["Name"] = "Title"
	
	    -- Отступы для заголовка
	    Notification["c"] = Instance.new("UIPadding", Notification["b"])
	    Notification["c"]["PaddingLeft"] = UDim.new(0, 10)
	
	    -- Скругление углов верхней панели
	    Notification["d"] = Instance.new("UICorner", Notification["9"])
	
	    -- Дополнительная панель верхней панели (если необходимо)
	    Notification["e"] = Instance.new("Frame", Notification["9"])
	    Notification["e"]["BorderSizePixel"] = 0
	    Notification["e"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25)
	    Notification["e"]["AnchorPoint"] = Vector2.new(0, 1)
	    Notification["e"]["Size"] = UDim2.new(1, 0, 0.25, 0)
	    Notification["e"]["Position"] = UDim2.new(0, 0, 1, 0)
	    Notification["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	    Notification["e"]["Name"] = "Extension"
	
	    -- Локальный скрипт для дополнительной функциональности (можно оставить пустым или добавить)
	    Notification["f"] = Instance.new("LocalScript", Notification["9"])
	
	    -- Кнопка закрытия уведомления
	    Notification["10"] = Instance.new("ImageButton", Notification["9"])
	    Notification["10"]["BorderSizePixel"] = 0
	    Notification["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	    Notification["10"]["AnchorPoint"] = Vector2.new(1, 0)
	    Notification["10"]["Image"] = "rbxassetid://10747384394" -- Замените на нужный ID изображения
	    Notification["10"]["Size"] = UDim2.new(0, 20, 0, 20)
	    Notification["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	    Notification["10"]["BackgroundTransparency"] = 1
	    Notification["10"]["Name"] = "Exit"
	    Notification["10"]["Position"] = UDim2.new(1, -8, 0, 5)
	    Notification["10"]["ZIndex"] = 10
	
	    -- Основной текст уведомления
	    Notification["11"] = Instance.new("TextLabel", Notification["3"])
	    Notification["11"]["TextWrapped"] = true
	    Notification["11"]["BorderSizePixel"] = 0
	    Notification["11"]["TextXAlignment"] = Enum.TextXAlignment.Left
	    Notification["11"]["TextYAlignment"] = Enum.TextYAlignment.Top
	    Notification["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	    Notification["11"]["TextSize"] = 18
	    Notification["11"]["FontFace"] = Font.new("rbxassetid://11702779517", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	    Notification["11"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
	    Notification["11"]["BackgroundTransparency"] = 1
	    Notification["11"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
	    Notification["11"]["Size"] = UDim2.new(1, -20, 0.427, 0)
	    Notification["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	    Notification["11"]["Text"] = Options.Description
	    Notification["11"]["Name"] = "Description"
	    Notification["11"]["Position"] = UDim2.new(0.5, 0, 0.44877, 0)
	
	    -- Фоновый ImageButton для перетаскивания уведомления (опционально)
	    Notification["13"] = Instance.new("ImageButton", Notification["3"])
	    Notification["13"]["BorderSizePixel"] = 0
	    Notification["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	    Notification["13"]["Size"] = UDim2.new(1, 0, 1, 0)
	    Notification["13"]["BackgroundTransparency"] = 1
	    Notification["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	
	    -- Анимация появления уведомления
	    Library:Tween(Notification["12"], {Scale = 1})
	
	    -- Функция для закрытия уведомления
	    function Notification:Destroy()
	        -- Плавно уменьшаем масштаб уведомления перед удалением
	        Library:Tween(Notification["12"], {Scale = 0.8}, 0.3) -- Анимация с продолжительностью 0.3 секунды
	        task.wait(0.3) -- Ждем завершения анимации
	        Notification["3"]:Destroy() -- Удаляем саму рамку уведомления
	    end
	
	    -- Обработчик нажатия на кнопку закрытия (крестик)
	    Notification["10"].InputBegan:Connect(function(Input, GPE)
	        if GPE then return end
	
	        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
	            Notification.MouseDown = true
	            Notification:Destroy()
	        end
	    end)
	
	    -- Настройка кнопки "Okay!"
	    if Options.Button == false then
	        -- Если кнопка отключена, изменяем размер и позицию описания
	        Notification["11"].Size = UDim2.new(1, -20, 0.71, 0)
	        Notification["11"].Position = UDim2.new(0.5, 0, 0.63, 0)
	        Notification["6"].Visible = false
	    else
	        -- Если кнопка включена, делаем ее видимой и настраиваем
	        Notification["6"].Visible = true
	        Notification["6"].Text = Options.Button.Name
	
	        -- Обработчик наведения курсора на кнопку
	        Notification["6"].MouseEnter:Connect(function()
	            Notification.Hover = true
	
	            Library:Tween(Notification["6"], {TextTransparency = 0}, 0.2) -- Плавное появление текста
	            Library:Tween(Notification["8"], {Transparency = 0.9}, 0.2) -- Плавное изменение обводки
	        end)
	
	        -- Обработчик ухода курсора с кнопки
	        Notification["6"].MouseLeave:Connect(function()
	            Notification.Hover = false
	
	            if not Notification.MouseDown then
	                Library:Tween(Notification["6"], {TextTransparency = 0.2}, 0.2) -- Плавное исчезновение текста
	                Library:Tween(Notification["8"], {Transparency = 0.96}, 0.2) -- Плавное изменение обводки
	            end
	        end)
	
	        -- Обработчик нажатия на кнопку "Okay!"
	        Notification["6"].InputBegan:Connect(function(Input, GPE)
	            if GPE then return end
	
	            if Input.UserInputType == Enum.UserInputType.MouseButton1 and Notification.Hover then
	                Notification.MouseDown = true
	                Library:Tween(Notification["6"], {BackgroundColor3 = Color3.fromRGB(32, 32, 32)}, 0.1) -- Изменение фона при нажатии
	                Library:Tween(Notification["8"], {Transparency = 0.85}, 0.1) -- Изменение обводки при нажатии
	                Options.Button.Callback() -- Выполняем колбэк
	                Notification:Destroy() -- Закрываем уведомление
	            end
	        end)
	
	        -- Обработчик отпускания кнопки мыши
	        Notification["6"].InputEnded:Connect(function(Input, GPE)
	            if GPE then return end
	
	            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
	                Notification.MouseDown = false
	
	                if Notification.Hover then
	                    Library:Tween(Notification["6"], {TextTransparency = 0}, 0.2) -- Плавное появление текста
	                    Library:Tween(Notification["8"], {Transparency = 0.9}, 0.2) -- Плавное изменение обводки
	                else
	                    Library:Tween(Notification["6"], {BackgroundColor3 = Color3.fromRGB(29, 29, 29)}, 0.2) -- Восстановление фона
	                    Library:Tween(Notification["6"], {TextTransparency = 0.2}, 0.2) -- Плавное исчезновение текста
	                    Library:Tween(Notification["8"], {Transparency = 0.96}, 0.2) -- Плавное изменение обводки
	                end
	            end
	        end)
	    end
	
	    return Notification
	end
        function Window:CreateTab(Options)
            Options = Library:Validate({
                Name = "Tab",
                Icon = "rbxassetid://10723407389"
            }, Options)
    
            local Tab = {
                Hover = false,
                Active = false
            } 
            
            -- StarterGui.Emperion.Main.Navigation.Holder.InactiveTab
            Tab["1b"] = Instance.new("TextLabel", Window["13"])
            Tab["1b"].BorderSizePixel = 0
            Tab["1b"].TextXAlignment = Enum.TextXAlignment.Left
            -- Изменён цвет фона таба на фиолетовый
            Tab["1b"].BackgroundColor3 = Color3.fromRGB(100, 0, 150)
            Tab["1b"].TextSize = 16
            Tab["1b"].FontFace = Font.new([[rbxassetid://11702779517]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            Tab["1b"].TextColor3 = Color3.fromRGB(255, 255, 255)
            Tab["1b"].BackgroundTransparency = 1
            Tab["1b"].Size = UDim2.new(1, 0, 0, 35)
            Tab["1b"].BorderColor3 = Color3.fromRGB(0, 0, 0)
            Tab["1b"].Text = Options.Name
            Tab["1b"].TextTransparency = 0.4
            Tab["1b"].Name = [[InactiveTab]]
    
            -- StarterGui.Emperion.Main.Navigation.Holder.InactiveTab.UIPadding
            Tab["1c"] = Instance.new("UIPadding", Tab["1b"])
            Tab["1c"].PaddingTop = UDim.new(0, 8)
            Tab["1c"].PaddingLeft = UDim.new(0, 35)
            Tab["1c"].PaddingBottom = UDim.new(0, 8)
    
            -- StarterGui.Emperion.Main.Navigation.Holder.InactiveTab.Icon
            Tab["1d"] = Instance.new("ImageLabel", Tab["1b"])
            Tab["1d"].BorderSizePixel = 0
            Tab["1d"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Tab["1d"].Image = Options.Icon
            Tab["1d"].ImageTransparency = 0.4
            Tab["1d"].Size = UDim2.new(0, 18, 0, 18)
            Tab["1d"].BorderColor3 = Color3.fromRGB(0, 0, 0)
            Tab["1d"].BackgroundTransparency = 1
            Tab["1d"].Name = [[Icon]]
            Tab["1d"].Position = UDim2.new(0, -25, 0, 0)
    
            -- StarterGui.Emperion.Main.Navigation.Holder.InactiveTab.UIStroke
            Tab["1e"] = Instance.new("UIStroke", Tab["1b"])
            Tab["1e"].Enabled = false
            Tab["1e"].Transparency = 0.96
            Tab["1e"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            Tab["1e"].Color = Color3.fromRGB(255, 255, 255)
    
            -- StarterGui.Emperion.Main.Navigation.Holder.InactiveTab.UICorner
            Tab["1f"] = Instance.new("UICorner", Tab["1b"])
            Tab["1f"].CornerRadius = UDim.new(0, 5)
    
            -- StarterGui.Emperion.Main.ContentContainer.Home
            Tab["21"] = Instance.new("ScrollingFrame", Window["20"])
            Tab["21"].Active = true
            Tab["21"].BorderSizePixel = 0
            -- Изменён цвет фона контента на фиолетовый
            Tab["21"].BackgroundColor3 = Color3.fromRGB(50, 0, 100)
            Tab["21"].Name = Options.Name
            Tab["21"].ScrollBarImageTransparency = 0.9
            Tab["21"].AnchorPoint = Vector2.new(0.5, 0.5)
            Tab["21"].Size = UDim2.new(1, 0, 1, 0)
            Tab["21"].Position = UDim2.new(0.5, 0, 0.5, 0)
            Tab["21"].BorderColor3 = Color3.fromRGB(0, 0, 0)
            Tab["21"].ScrollBarThickness = 4
            Tab["21"].BackgroundTransparency = 1
            Tab["21"].Visible = false
    
            -- StarterGui.Emperion.Main.ContentContainer.Home.UIPadding
            Tab["22"] = Instance.new("UIPadding", Tab["21"])
            Tab["22"].PaddingTop = UDim.new(0, 10)
            Tab["22"].PaddingRight = UDim.new(0, 12)
            Tab["22"].PaddingLeft = UDim.new(0, 10)
            Tab["22"].PaddingBottom = UDim.new(0, 10)
    
            -- StarterGui.Emperion.Main.ContentContainer.Home.UIListLayout
            Tab["23"] = Instance.new("UIListLayout", Tab["21"])
            Tab["23"].Padding = UDim.new(0, 10)
            Tab["23"].SortOrder = Enum.SortOrder.LayoutOrder
            
            function Tab:Activate()
                if not Tab.Active then
                    if Window.ActiveTab ~= nil then
                        Window.ActiveTab:Deactivate()
                    end
    
                    Tab.Active = true
                    Library:Tween(Tab["1b"], {TextTransparency = 0})
                    Library:Tween(Tab["1d"], {ImageTransparency = 0})
                    Library:Tween(Tab["1b"], {BackgroundTransparency = 0})
                    Library:Tween(Tab["1e"], {Enabled = true})
                    Tab["21"].Visible = true
    
                    Window.ActiveTab = Tab 
                end
            end
    
            function Tab:Deactivate()
                if Tab.Active then
                    Tab.Active = false
                    Tab.Hover = false
                    Library:Tween(Tab["1b"], {TextTransparency = 0.4})
                    Library:Tween(Tab["1d"], {ImageTransparency = 0.4})
                    Library:Tween(Tab["1b"], {BackgroundTransparency = 1})
                    Library:Tween(Tab["1e"], {Enabled = false})
                    Tab["21"].Visible = false
                end
            end
    
            Tab["1b"].MouseEnter:Connect(function()
                Tab.Hover = true
    
                if not Tab.Active then
                    Library:Tween(Tab["1b"], {TextTransparency = 0})
                    Library:Tween(Tab["1d"], {ImageTransparency = 0})
                end
            end)
    
            Tab["1b"].MouseLeave:Connect(function()
                Tab.Hover = false
    
                if not Tab.Active then
                    Library:Tween(Tab["1b"], {TextTransparency = 0.4})
                    Library:Tween(Tab["1d"], {ImageTransparency = 0.4})
                end
            end)
    
            UserInputService.InputBegan:Connect(function(Input, GPE)
                if GPE then return end
    
                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if Tab.Hover then
                        Tab:Activate()
                    end
                end
            end)
    
            if Window.ActiveTab == nil then
                Tab:Activate() 
            end
            
            function Tab:CreateLabel(Options)
                Options = Library:Validate({
                    Text = "Label",
                    Type = "Label"
                }, Options)
                
                local Label = {
                    Hover = false
                }
                
                
                if Options.Type == "Label" then
                    -- StarterGui.Emperion.Main.ContentContainer.Home.Label
                    Label["30"] = Instance.new("Frame", Tab["21"])
                    Label["30"].BorderSizePixel = 0
                    -- Изменён цвет фона на фиолетовый
                    Label["30"].BackgroundColor3 = Color3.fromRGB(100, 0, 150)
                    Label["30"].Size = UDim2.new(1, 0, 0, 35)
                    Label["30"].BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Label["30"].Name = [[Label]]
                    
                    -- StarterGui.Emperion.Main.ContentContainer.Home.Label.UIStroke
                    Label["31"] = Instance.new("UIStroke", Label["30"])
                    Label["31"].Transparency = 0.96
                    Label["31"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    -- Изменён цвет обводки на фиолетовый
                    Label["31"].Color = Color3.fromRGB(150, 0, 150)
    
                    -- StarterGui.Emperion.Main.ContentContainer.Home.Label.UIPadding
                    Label["32"] = Instance.new("UIPadding", Label["30"])
                    Label["32"].PaddingTop = UDim.new(0, 8)
                    Label["32"].PaddingLeft = UDim.new(0, 12)
                    Label["32"].PaddingBottom = UDim.new(0, 8)
    
                    -- StarterGui.Emperion.Main.ContentContainer.Home.Label.UICorner
                    Label["33"] = Instance.new("UICorner", Label["30"])
                    Label["33"].CornerRadius = UDim.new(0, 5)
    
                    -- StarterGui.Emperion.Main.ContentContainer.Home.Label.Title
                    Label["34"] = Instance.new("TextLabel", Label["30"])
                    Label["34"].BorderSizePixel = 0
                    Label["34"].TextXAlignment = Enum.TextXAlignment.Left
                    Label["34"].TextTransparency = 0.2
                    Label["34"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Label["34"].TextSize = 18
                    Label["34"].FontFace = Font.new([[rbxassetid://11702779517]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                    Label["34"].TextColor3 = Color3.fromRGB(255, 255, 255)
                    Label["34"].BackgroundTransparency = 1
                    Label["34"].Size = UDim2.new(0.85, 0, 1, 0)
                    Label["34"].BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Label["34"].Name = [[Title]]
                    Label["34"].TextYAlignment = Enum.TextYAlignment.Top
                    Label["34"].TextWrapped = true
    
                    -- StarterGui.Emperion.Main.ContentContainer.Home.Label.Icon
                    Label["35"] = Instance.new("ImageLabel", Label["30"])
                    Label["35"].BorderSizePixel = 0
                    Label["35"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Label["35"].ImageTransparency = 0.3
                    Label["35"].AnchorPoint = Vector2.new(1, 0)
                    Label["35"].Image = [[rbxassetid://18824545160]]
                    Label["35"].Size = UDim2.new(0, 22, 0, 22)
                    Label["35"].BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Label["35"].BackgroundTransparency = 1
                    Label["35"].Name = [[Icon]]
                    Label["35"].Position = UDim2.new(1, -10, 0, -1)
                    
                    function Label:SetText(Text)
                        Options.Text = Text
                        Label:_Update()
                    end
                    
                    function Label:GetText()
                        return Options.Text
                    end
    
                    function Label:_Update()
                        Label["34"].Text = Options.Text
                        Label["34"].Size = UDim2.new(Label["34"].Size.X.Scale, Label["34"].Size.X.Offset, 0, math.huge)
                        Label["34"].Size = UDim2.new(Label["34"].Size.X.Scale, Label["34"].Size.X.Offset, 0, Label["34"].TextBounds.Y)
                        Label["30"].Size = UDim2.new(Label["30"].Size.X.Scale, Label["30"].Size.X.Offset, 0, Label["34"].TextBounds.Y + 18)
                    end
                    
                    Label["30"].MouseEnter:Connect(function()
                        Label.Hover = true
                        Library:Tween(Label["35"], {ImageTransparency = 0})
                        Library:Tween(Label["34"], {TextTransparency = 0})
                        Library:Tween(Label["31"], {Transparency = 0.9})
                    end)
    
                    Label["30"].MouseLeave:Connect(function()
                        Label.Hover = false
    
                        if not Label.MouseDown then
                            Library:Tween(Label["35"], {ImageTransparency = 0.3})
                            Library:Tween(Label["34"], {TextTransparency = 0.2})
                            Library:Tween(Label["31"], {Transparency = 0.96})
                        end
                    end)
                    
                    Label:SetText(Options.Text)
                elseif Options.Type == "Warning" then
                    -- Аналогичные изменения для типов Warning и Error
                    -- Измените цвета на фиолетовые оттенки
                    -- Создание Warning Label
                    Label["2a"] = Instance.new("Frame", Tab["21"])
                    Label["2a"].BorderSizePixel = 0
                    -- Фиолетовый фон для предупреждений
                    Label["2a"].BackgroundColor3 = Color3.fromRGB(120, 0, 120)
                    Label["2a"].Size = UDim2.new(1, 0, 0, 35)
                    Label["2a"].BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Label["2a"].Name = [[Warning]]
    
                    -- StarterGui.Emperion.Main.ContentContainer.Home.WarningLabel.UIStroke
                    Label["2b"] = Instance.new("UIStroke", Label["2a"])
                    Label["2b"].Transparency = 0.51
                    Label["2b"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    Label["2b"].Color = Color3.fromRGB(150, 0, 150)
    
                    -- StarterGui.Emperion.Main.ContentContainer.Home.WarningLabel.UIPadding
                    Label["2c"] = Instance.new("UIPadding", Label["2a"])
                    Label["2c"].PaddingTop = UDim.new(0, 8)
                    Label["2c"].PaddingLeft = UDim.new(0, 12)
                    Label["2c"].PaddingBottom = UDim.new(0, 8)
    
                    -- StarterGui.Emperion.Main.ContentContainer.Home.WarningLabel.UICorner
                    Label["2d"] = Instance.new("UICorner", Label["2a"])
                    Label["2d"].CornerRadius = UDim.new(0, 5)
    
                    -- StarterGui.Emperion.Main.ContentContainer.Home.WarningLabel.Title
                    Label["2e"] = Instance.new("TextLabel", Label["2a"])
                    Label["2e"].BorderSizePixel = 0
                    Label["2e"].TextXAlignment = Enum.TextXAlignment.Left
                    Label["2e"].TextTransparency = 0.2
                    Label["2e"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Label["2e"].TextSize = 18
                    Label["2e"].FontFace = Font.new([[rbxassetid://11702779517]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                    Label["2e"].TextColor3 = Color3.fromRGB(255, 255, 255)
                    Label["2e"].BackgroundTransparency = 1
                    Label["2e"].Size = UDim2.new(0.85, 0, 1, 0)
                    Label["2e"].BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Label["2e"].Name = [[Title]]
                    Label["2e"].TextYAlignment = Enum.TextYAlignment.Top
                    Label["2e"].TextWrapped = true
    
                    -- StarterGui.Emperion.Main.ContentContainer.Home.WarningLabel.Icon
                    Label["2f"] = Instance.new("ImageLabel", Label["2a"])
                    Label["2f"].BorderSizePixel = 0
                    Label["2f"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Label["2f"].ImageTransparency = 0.2
                    Label["2f"].ImageColor3 = Color3.fromRGB(150, 0, 150)
                    Label["2f"].AnchorPoint = Vector2.new(1, 0)
                    Label["2f"].Image = [[rbxassetid://18854112224]]
                    Label["2f"].Size = UDim2.new(0, 24, 0, 24)
                    Label["2f"].BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Label["2f"].BackgroundTransparency = 1
                    Label["2f"].Name = [[Icon]]
                    Label["2f"].Position = UDim2.new(1, -10, 0, -2)
                    
                    function Label:SetText(Text)
                        Options.Text = Text
                        Label:_Update()
                    end
    
                    function Label:GetText()
                        return Options.Text
                    end
    
                    function Label:_Update()
                        Label["2e"].Text = Options.Text
                        Label["2e"].Size = UDim2.new(Label["2e"].Size.X.Scale, Label["2e"].Size.X.Offset, 0, math.huge)
                        Label["2e"].Size = UDim2.new(Label["2e"].Size.X.Scale, Label["2e"].Size.X.Offset, 0, Label["2e"].TextBounds.Y)
                        Label["2a"].Size = UDim2.new(Label["2a"].Size.X.Scale, Label["2a"].Size.X.Offset, 0, Label["2e"].TextBounds.Y + 18)
                    end
    
                    Label["2a"].MouseEnter:Connect(function()
                        Label.Hover = true
                        Library:Tween(Label["2f"], {ImageTransparency = 0})
                        Library:Tween(Label["2e"], {TextTransparency = 0})
                        Library:Tween(Label["2b"], {Transparency = 0.4})
                    end)
    
                    Label["2a"].MouseLeave:Connect(function()
                        Label.Hover = false
    
                        if not Label.MouseDown then
                            Library:Tween(Label["2f"], {ImageTransparency = 0.3})
                            Library:Tween(Label["2e"], {TextTransparency = 0.2})
                            Library:Tween(Label["2b"], {Transparency = 0.51})
                        end
                    end)
    
                    Label:SetText(Options.Text)
                elseif Options.Type == "Error" then
                    -- Создание Error Label
                    Label["2a"] = Instance.new("Frame", Tab["21"])
                    Label["2a"].BorderSizePixel = 0
                    -- Фиолетовый фон для ошибок
                    Label["2a"].BackgroundColor3 = Color3.fromRGB(130, 0, 150)
                    Label["2a"].Size = UDim2.new(1, 0, 0, 35)
                    Label["2a"].BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Label["2a"].Name = [[Error]]
    
                    -- StarterGui.Emperion.Main.ContentContainer.Home.ErrorLabel.UIStroke
                    Label["2b"] = Instance.new("UIStroke", Label["2a"])
                    Label["2b"].Transparency = 0.51
                    Label["2b"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    Label["2b"].Color = Color3.fromRGB(150, 0, 150)
    
                    -- StarterGui.Emperion.Main.ContentContainer.Home.ErrorLabel.UIPadding
                    Label["2c"] = Instance.new("UIPadding", Label["2a"])
                    Label["2c"].PaddingTop = UDim.new(0, 8)
                    Label["2c"].PaddingLeft = UDim.new(0, 12)
                    Label["2c"].PaddingBottom = UDim.new(0, 8)
    
                    -- StarterGui.Emperion.Main.ContentContainer.Home.ErrorLabel.UICorner
                    Label["2d"] = Instance.new("UICorner", Label["2a"])
                    Label["2d"].CornerRadius = UDim.new(0, 5)
    
                    -- StarterGui.Emperion.Main.ContentContainer.Home.ErrorLabel.Title
                    Label["2e"] = Instance.new("TextLabel", Label["2a"])
                    Label["2e"].BorderSizePixel = 0
                    Label["2e"].TextXAlignment = Enum.TextXAlignment.Left
                    Label["2e"].TextTransparency = 0.2
                    Label["2e"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Label["2e"].TextSize = 18
                    Label["2e"].FontFace = Font.new([[rbxassetid://11702779517]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                    Label["2e"].TextColor3 = Color3.fromRGB(255, 255, 255)
                    Label["2e"].BackgroundTransparency = 1
                    Label["2e"].Size = UDim2.new(0.85, 0, 1, 0)
                    Label["2e"].BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Label["2e"].Name = [[Title]]
                    Label["2e"].TextYAlignment = Enum.TextYAlignment.Top
                    Label["2e"].TextWrapped = true
    
                    -- StarterGui.Emperion.Main.ContentContainer.Home.ErrorLabel.Icon
                    Label["2f"] = Instance.new("ImageLabel", Label["2a"])
                    Label["2f"].BorderSizePixel = 0
                    Label["2f"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Label["2f"].ImageTransparency = 0.2
                    Label["2f"].ImageColor3 = Color3.fromRGB(150, 0, 150)
                    Label["2f"].AnchorPoint = Vector2.new(1, 0)
                    Label["2f"].Image = [[rbxassetid://18854112224]]
                    Label["2f"].Size = UDim2.new(0, 24, 0, 24)
                    Label["2f"].BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Label["2f"].BackgroundTransparency = 1
                    Label["2f"].Name = [[Icon]]
                    Label["2f"].Position = UDim2.new(1, -10, 0, -2)
    
                    function Label:SetText(Text)
                        Options.Text = Text
                        Label:_Update()
                    end
    
                    function Label:GetText()
                        return Options.Text
                    end
    
                    function Label:_Update()
                        Label["2e"].Text = Options.Text
                        Label["2e"].Size = UDim2.new(Label["2e"].Size.X.Scale, Label["2e"].Size.X.Offset, 0, math.huge)
                        Label["2e"].Size = UDim2.new(Label["2e"].Size.X.Scale, Label["2e"].Size.X.Offset, 0, Label["2e"].TextBounds.Y)
                        Label["2a"].Size = UDim2.new(Label["2a"].Size.X.Scale, Label["2a"].Size.X.Offset, 0, Label["2e"].TextBounds.Y + 18)
                    end
    
                    Label["2a"].MouseEnter:Connect(function()
                        Label.Hover = true
                        Library:Tween(Label["2f"], {ImageTransparency = 0})
                        Library:Tween(Label["2e"], {TextTransparency = 0})
                        Library:Tween(Label["2b"], {Transparency = 0.4})
                    end)
    
                    Label["2a"].MouseLeave:Connect(function()
                        Label.Hover = false
    
                        if not Label.MouseDown then
                            Library:Tween(Label["2f"], {ImageTransparency = 0.3})
                            Library:Tween(Label["2e"], {TextTransparency = 0.2})
                            Library:Tween(Label["2b"], {Transparency = 0.51})
                        end
                    end)
    
                    Label:SetText(Options.Text)
                end
                
                return Label
            end
            
            function Tab:CreateButton(Options)
                Options = Library:Validate({
                    Name = "Button",
                    Callback = function()
                        print("Button was clicked!")
                    end,
                }, Options)
                
                local Button = {
                    Hover = false,
                    MouseDown = false
                }
                
                -- StarterGui.Emperion.Main.ContentContainer.Home.Button
                Button["36"] = Instance.new("Frame", Tab["21"])
                Button["36"].BorderSizePixel = 0
                -- Изменён цвет фона кнопки на фиолетовый
                Button["36"].BackgroundColor3 = Color3.fromRGB(100, 0, 150)
                Button["36"].Size = UDim2.new(1, 0, 0, 45)
                Button["36"].BorderColor3 = Color3.fromRGB(0, 0, 0)
                Button["36"].Name = [[Button]]
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.Button.UIStroke
                Button["37"] = Instance.new("UIStroke", Button["36"])
                Button["37"].Transparency = 0.96
                Button["37"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                Button["37"].Color = Color3.fromRGB(255, 255, 255)
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.Button.UIPadding
                Button["38"] = Instance.new("UIPadding", Button["36"])
                Button["38"].PaddingTop = UDim.new(0, 8)
                Button["38"].PaddingLeft =  UDim.new(0, 12)
                Button["38"].PaddingBottom = UDim.new(0, 8)
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.Button.UICorner
                Button["39"] = Instance.new("UICorner", Button["36"])
                Button["39"].CornerRadius = UDim.new(0, 5)
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.Button.Icon
                Button["3a"] = Instance.new("ImageLabel", Button["36"])
                Button["3a"].BorderSizePixel = 0
                Button["3a"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Button["3a"].ImageTransparency = 0.3
                Button["3a"].AnchorPoint = Vector2.new(1, 0)
                Button["3a"].Image = [[rbxassetid://18824415379]]
                Button["3a"].Size = UDim2.new(0, 25, 0, 25)
                Button["3a"].BorderColor3 = Color3.fromRGB(0, 0, 0)
                Button["3a"].BackgroundTransparency = 1
                Button["3a"].Name = [[Icon]]
                Button["3a"].Position = UDim2.new(1, -8, 0, 2)
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.Button.Title
                Button["3b"] = Instance.new("TextLabel", Button["36"])
                Button["3b"].BorderSizePixel = 0
                Button["3b"].TextXAlignment = Enum.TextXAlignment.Left
                Button["3b"].TextTransparency = 0.2
                Button["3b"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Button["3b"].TextSize = 18
                Button["3b"].FontFace = Font.new([[rbxassetid://11702779517]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                Button["3b"].TextColor3 = Color3.fromRGB(255, 255, 255)
                Button["3b"].BackgroundTransparency = 1
                Button["3b"].Size = UDim2.new(0.85, 0, 1, 0)
                Button["3b"].BorderColor3 = Color3.fromRGB(0, 0, 0)
                Button["3b"].Text = Options.Name
                Button["3b"].Name = [[Title]]
                
                function Button:SetName(Name)
                    Button["3b"].Text = Name
                end
    
                function Button:SetCallback(Callback)
                    Options.Callback = Callback
                end
                
                Button["36"].MouseEnter:Connect(function()
                    Button.Hover = true
                    Library:Tween(Button["3a"], {ImageTransparency = 0})
                    Library:Tween(Button["3b"], {TextTransparency = 0})
                    Library:Tween(Button["37"], {Transparency = 0.9})
                end)
                
                Button["36"].MouseLeave:Connect(function()
                    Button.Hover = false
    
                    if not Button.MouseDown then
                        Library:Tween(Button["3a"], {ImageTransparency = 0.3})
                        Library:Tween(Button["3b"], {TextTransparency = 0.2})
                        Library:Tween(Button["37"], {Transparency = 0.96})
                    end
                end)
                
                Button["36"].InputBegan:Connect(function(Input_, GPE)
                    if GPE then return end
    
                    if Input_.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
                        Button.MouseDown = true
                        -- Изменён цвет фона при нажатии на фиолетовый оттенок
                        Library:Tween(Button["36"], {BackgroundColor3 = Color3.fromRGB(110, 0, 160)})
                        Library:Tween(Button["37"], {Transparency = 0.9})
                        Options.Callback()
                    end
                end)
    
                Button["36"].InputEnded:Connect(function(Input_, GPE)
                    if GPE then return end
    
                    if Input_.UserInputType == Enum.UserInputType.MouseButton1 then
                        Button.MouseDown = false
                        
                        if Button.Hover then
                            Library:Tween(Button["36"], {BackgroundColor3 = Color3.fromRGB(100, 0, 150)})
                            Library:Tween(Button["3a"], {ImageTransparency = 0})
                            Library:Tween(Button["3b"], {TextTransparency = 0})
                            Library:Tween(Button["37"], {Transparency = 0.9})
                        else
                            Library:Tween(Button["36"], {BackgroundColor3 = Color3.fromRGB(100, 0, 150)})
                            Library:Tween(Button["37"], {Transparency = 0.96})
                        end
                    end
                end)
                
                return Button  
            end
            
            function Tab:CreateSlider(Options)
                Options = Library:Validate({
                    Name = "Slider",
                    Min = 0,
                    Max = 10,
                    Default = 5,
                    Round = 0,
                    Callback = function(Value) print("The Value is "..Value.."!") end
                }, Options)
                
                local Slider = {
                    Hover = false,
                    MouseDown = false,
                    Connection = nil
                }
                
                -- StarterGui.Emperion.Main.ContentContainer.Home.Slider
                Slider["3c"] = Instance.new("Frame", Tab["21"]);
                Slider["3c"]["BorderSizePixel"] = 0;
                Slider["3c"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
                Slider["3c"]["Size"] = UDim2.new(1, 0, 0, 50);
                Slider["3c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                Slider["3c"]["Name"] = [[Slider]];
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.Slider.UIStroke
                Slider["3d"] = Instance.new("UIStroke", Slider["3c"]);
                Slider["3d"]["Transparency"] = 0.96;
                Slider["3d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
                Slider["3d"]["Color"] = Color3.fromRGB(255, 255, 255);
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.Slider.UIPadding
                Slider["3e"] = Instance.new("UIPadding", Slider["3c"]);
                Slider["3e"]["PaddingTop"] = UDim.new(0, 8);
                Slider["3e"]["PaddingRight"] = UDim.new(0, 12);
                Slider["3e"]["PaddingLeft"] = UDim.new(0, 12);
                Slider["3e"]["PaddingBottom"] = UDim.new(0, 8);
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.Slider.UICorner
                Slider["3f"] = Instance.new("UICorner", Slider["3c"]);
                Slider["3f"]["CornerRadius"] = UDim.new(0, 5);
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.Slider.Title
                Slider["40"] = Instance.new("TextLabel", Slider["3c"]);
                Slider["40"]["BorderSizePixel"] = 0;
                Slider["40"]["TextXAlignment"] = Enum.TextXAlignment.Left;
                Slider["40"]["TextTransparency"] = 0.2;
                Slider["40"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                Slider["40"]["TextSize"] = 18;
                Slider["40"]["FontFace"] = Font.new([[rbxassetid://11702779517]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                Slider["40"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
                Slider["40"]["BackgroundTransparency"] = 1;
                Slider["40"]["Size"] = UDim2.new(0.85, -10, 1, -10);
                Slider["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                Slider["40"]["Text"] = Options.Name;
                Slider["40"]["Name"] = [[Title]];
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.Slider.Value
                Slider["41"] = Instance.new("TextLabel", Slider["3c"]);
                Slider["41"]["BorderSizePixel"] = 0;
                Slider["41"]["TextXAlignment"] = Enum.TextXAlignment.Right;
                Slider["41"]["TextTransparency"] = 0.2;
                Slider["41"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                Slider["41"]["TextSize"] = 18;
                Slider["41"]["FontFace"] = Font.new([[rbxassetid://11702779517]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                Slider["41"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
                Slider["41"]["BackgroundTransparency"] = 1;
                Slider["41"]["AnchorPoint"] = Vector2.new(1, 0);
                Slider["41"]["Size"] = UDim2.new(0, 80, 1, -10);
                Slider["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                Slider["41"]["Text"] = tostring(Options.Default);
                Slider["41"]["Name"] = [[Value]];
                Slider["41"]["Position"] = UDim2.new(1, 0, 0, 0);
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.Slider.SliderBack
                Slider["42"] = Instance.new("Frame", Slider["3c"]);
                Slider["42"]["BorderSizePixel"] = 0;
                Slider["42"]["BackgroundColor3"] = Color3.fromRGB(23, 23, 23);
                Slider["42"]["AnchorPoint"] = Vector2.new(0, 1);
                Slider["42"]["Size"] = UDim2.new(1, 0, 0, 6);
                Slider["42"]["Position"] = UDim2.new(0, 0, 1, 0);
                Slider["42"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                Slider["42"]["Name"] = [[SliderBack]];
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.Slider.SliderBack.UICorner
                Slider["43"] = Instance.new("UICorner", Slider["42"]);
                Slider["43"]["CornerRadius"] = UDim.new(1, 0);
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.Slider.SliderBack.UIStroke
                Slider["44"] = Instance.new("UIStroke", Slider["42"]);
                Slider["44"]["Transparency"] = 0.97;
                Slider["44"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
                Slider["44"]["Color"] = Color3.fromRGB(255, 255, 255);
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.Slider.SliderBack.Draggable
                Slider["45"] = Instance.new("Frame", Slider["42"]);
                Slider["45"]["BorderSizePixel"] = 0;
                Slider["45"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                Slider["45"]["Size"] = UDim2.new(0.5, 0, 1, 0);
                Slider["45"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                Slider["45"]["Name"] = [[Draggable]];
                Slider["45"]["BackgroundTransparency"] = 0.8;
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.Slider.SliderBack.Draggable.UICorner
                Slider["46"] = Instance.new("UICorner", Slider["45"]);
                Slider["46"]["CornerRadius"] = UDim.new(1, 0);
                
                function Slider:SetValue(Provided)
                    if Provided == nil then
                        local Percentage = math.clamp((Mouse.X - Slider["3c"].AbsolutePosition.X) / (Slider["3c"].AbsoluteSize.X), 0, 1)
                        local Value = math.floor((Options.Max - Options.Min) * Percentage * (10 ^ Options.Round) + 0.5) / (10 ^ Options.Round) + Options.Min
    
                        if Percentage > 1 then
                            Percentage = 1
                        end
    
                        Slider["41"].Text = tostring(Value)
                        Slider["45"].Size = UDim2.new(Percentage, 0, 1, 0);
                    else
                        local Percentage = (Provided - Options.Min) / (Options.Max - Options.Min)
                        local Value = math.floor(Provided * (10 ^ Options.Round) + 0.5) / (10 ^ Options.Round)
                            
                        if Percentage > 1 then
                            Percentage = 1
                        end
                        
                        Slider["41"].Text = tostring(Value)
                        Slider["45"].Size = UDim2.new(Percentage, 0, 1, 0)
                    end
    
                    Options.Callback(Slider:GetValue())
                end
                
                function Slider:SetName(Name)
                    Slider["40"]["Name"] = Name
                end
                
                function Slider:SetCallback(Callback)
                    Options.Callback = Callback
                end
                
                function Slider:GetValue()
                    return tostring(Slider["41"].Text)
                end
                
                Slider:SetValue(Options.Default)
                
                Slider["3c"].MouseEnter:Connect(function()
                    Slider.Hover = true
                    Library:Tween(Slider["40"], {TextTransparency = 0})
                    Library:Tween(Slider["41"], {TextTransparency = 0})
                    Library:Tween(Slider["3d"], {Transparency = 0.9})
                end)
    
                Slider["3c"].MouseLeave:Connect(function()
                    Slider.Hover = false
    
                    if not Slider.MouseDown then
                        Library:Tween(Slider["40"], {TextTransparency = 0.2})
                        Library:Tween(Slider["41"], {TextTransparency = 0.2})
                        Library:Tween(Slider["3d"], {Transparency = 0.96})
                    end
                end)
    
                Slider["3c"].InputBegan:Connect(function(Input, GPE)
                    if GPE then return end
    
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
                        Slider.MouseDown = true
                        Library:Tween(Slider["3c"], {BackgroundColor3 = Color3.fromRGB(28, 28, 28)})
                        Library:Tween(Slider["3d"], {Transparency = 0.9})
                        
                        if not Slider.Connection then
                            Slider.Connection = RunService.RenderStepped:Connect(function()
                                Slider:SetValue()
                            end)
                        end
                    end
                end)
    
                Slider["3c"].InputEnded:Connect(function(Input, GPE)
                    if GPE then return end
    
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        Slider.MouseDown = false
    
                        if Slider.Hover then
                            Library:Tween(Slider["3c"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
                            Library:Tween(Slider["40"], {TextTransparency = 0})
                            Library:Tween(Slider["41"], {TextTransparency = 0})
                            Library:Tween(Slider["3d"], {Transparency = 0.9})
                        else
                            Library:Tween(Slider["3c"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
                            Library:Tween(Slider["3d"], {Transparency = 0.96})
                        end
    
                        if Slider.Connection then
                            Slider.Connection:Disconnect()
                            Slider.Connection = nil
                        end
                    end
                end)
                
                return Slider
            end
            
            function Tab:CreateToggle(Options)
                Options = Library:Validate({
                    Name = "Toggle",
                    Default = false,
                    Callback = function(Value) print("The Value is "..Value.."!") end
                }, Options)
                
                local Toggle = {
                    Hover = false,
                    MouseDown = false,
                    State = false
                }
                
                -- StarterGui.Emperion.Main.ContentContainer.Home.ToggleInactive
                Toggle["65"] = Instance.new("Frame", Tab["21"]);
                Toggle["65"]["BorderSizePixel"] = 0;
                Toggle["65"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
                Toggle["65"]["Size"] = UDim2.new(1, 0, 0, 45);
                Toggle["65"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                Toggle["65"]["Name"] = [[Toggle]];
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.ToggleInactive.UIStroke
                Toggle["66"] = Instance.new("UIStroke", Toggle["65"]);
                Toggle["66"]["Transparency"] = 0.96;
                Toggle["66"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
                Toggle["66"]["Color"] = Color3.fromRGB(255, 255, 255);
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.ToggleInactive.UIPadding
                Toggle["67"] = Instance.new("UIPadding", Toggle["65"]);
                Toggle["67"]["PaddingTop"] = UDim.new(0, 8);
                Toggle["67"]["PaddingLeft"] = UDim.new(0, 12);
                Toggle["67"]["PaddingBottom"] = UDim.new(0, 8);
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.ToggleInactive.UICorner
                Toggle["68"] = Instance.new("UICorner", Toggle["65"]);
                Toggle["68"]["CornerRadius"] = UDim.new(0, 5);
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.ToggleInactive.Title
                Toggle["69"] = Instance.new("TextLabel", Toggle["65"]);
                Toggle["69"]["BorderSizePixel"] = 0;
                Toggle["69"]["TextXAlignment"] = Enum.TextXAlignment.Left;
                Toggle["69"]["TextTransparency"] = 0.2;
                Toggle["69"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                Toggle["69"]["TextSize"] = 18;
                Toggle["69"]["FontFace"] = Font.new([[rbxassetid://11702779517]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                Toggle["69"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
                Toggle["69"]["BackgroundTransparency"] = 1;
                Toggle["69"]["Size"] = UDim2.new(0.8, 0, 1, 0);
                Toggle["69"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                Toggle["69"]["Text"] = Options.Name;
                Toggle["69"]["Name"] = [[Title]];
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.ToggleInactive.CheckmarkHolder
                Toggle["6a"] = Instance.new("Frame", Toggle["65"]);
                Toggle["6a"]["BorderSizePixel"] = 0;
                Toggle["6a"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
                Toggle["6a"]["AnchorPoint"] = Vector2.new(1, 0);
                Toggle["6a"]["Size"] = UDim2.new(0, 25, 0, 25);
                Toggle["6a"]["Position"] = UDim2.new(1, -8, 0, 2);
                Toggle["6a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                Toggle["6a"]["Name"] = [[CheckmarkHolder]];
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.ToggleInactive.CheckmarkHolder.UICorner
                Toggle["6b"] = Instance.new("UICorner", Toggle["6a"]);
                Toggle["6b"]["CornerRadius"] = UDim.new(0, 5);
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.ToggleInactive.CheckmarkHolder.UIStroke
                Toggle["6c"] = Instance.new("UIStroke", Toggle["6a"]);
                Toggle["6c"]["Transparency"] = 0.94;
                Toggle["6c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
                Toggle["6c"]["Color"] = Color3.fromRGB(255, 255, 255);
    
                -- StarterGui.Emperion.Main.ContentContainer.Home.ToggleInactive.CheckmarkHolder.Checkmark
                Toggle["6d"] = Instance.new("ImageLabel", Toggle["6a"]);
                Toggle["6d"]["BorderSizePixel"] = 0;
                Toggle["6d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                Toggle["6d"]["ImageTransparency"] = 1;
                Toggle["6d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
                Toggle["6d"]["Image"] = [[rbxassetid://18837414354]];
                Toggle["6d"]["Size"] = UDim2.new(1, -5, 1, -5);
                Toggle["6d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                Toggle["6d"]["BackgroundTransparency"] = 1;
                Toggle["6d"]["Name"] = [[Checkmark]];
                Toggle["6d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
                
                function Toggle:SetName(Name)
                    Toggle["69"]["Text"] = Name
                end
                
                function Toggle:SetCallback(Callback)
                    Options.Callback = Callback
                end
                
                function Toggle:SetState(State)
                    Toggle.State = State
                    
                    if State == true then
                        Library:Tween(Toggle["6a"], {BackgroundColor3 = Color3.fromRGB(0, 154, 255)})
                        Library:Tween(Toggle["6d"], {ImageTransparency = 0})
                    else
                        Library:Tween(Toggle["6a"], {BackgroundColor3 = Color3.fromRGB(31, 31, 31)})
                        Library:Tween(Toggle["6d"], {ImageTransparency = 1})
                    end
                end
                
                Toggle:SetState(Options.Default)
                
                Toggle["65"].MouseEnter:Connect(function()
                    Toggle.Hover = true
                    Library:Tween(Toggle["69"], {TextTransparency = 0})
                    Library:Tween(Toggle["66"], {Transparency = 0.9})
                end)
    
                Toggle["65"].MouseLeave:Connect(function()
                    Toggle.Hover = false
    
                    if not Toggle.MouseDown then
                        Library:Tween(Toggle["69"], {TextTransparency = 0.2})
                        Library:Tween(Toggle["66"], {Transparency = 0.96})
                    end
                end)
    
                Toggle["65"].InputBegan:Connect(function(Input, GPE)
                    if GPE then return end
    
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
                        Toggle.MouseDown = true
                        
                        if Toggle.State then
                            Toggle:SetState(false)
                        else
                            Toggle:SetState(true)
                        end
                        
                        Library:Tween(Toggle["65"], {BackgroundColor3 = Color3.fromRGB(28, 28, 28)})
                        Library:Tween(Toggle["66"], {Transparency = 0.9})
                        Options.Callback(Toggle.State)
                    end
                end)
    
                Toggle["65"].InputEnded:Connect(function(Input, GPE)
                    if GPE then return end
    
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        Toggle.MouseDown = false
    
                        if Toggle.Hover then
                            Library:Tween(Toggle["65"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
                            Library:Tween(Toggle["69"], {TextTransparency = 0})
                            Library:Tween(Toggle["66"], {Transparency = 0.9})
                        else
                            Library:Tween(Toggle["65"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
                            Library:Tween(Toggle["66"], {Transparency = 0.96})
                        end
                    end
                end)
                
                return Toggle
            end
            
        function Tab:CreateDropdown(Options)
            Options = Library:Validate({
                Name = "Dropdown",
                Items = {"Item 1", "Item 2"},
                Default = false,
                Callback = function(Value) print("Selected: "..Value) end
            }, Options)
            
            local Dropdown = {
                Hover = false,
                MouseDown = false,
                Opened = false,
                Selected = nil,
                Items = {},
            }
            
            -- Создание основного фрейма дропдауна
            Dropdown["Frame"] = Instance.new("Frame", Tab["21"])
            Dropdown["Frame"].BorderSizePixel = 0
            Dropdown["Frame"].BackgroundColor3 = Colors.Primary
            Dropdown["Frame"].ClipsDescendants = true
            Dropdown["Frame"].Size = UDim2.new(1, 0, 0, 45)
            Dropdown["Frame"].Position = UDim2.new(0, 0, 0, 0)
            Dropdown["Frame"].BorderColor3 = Colors.Secondary
            Dropdown["Frame"].Name = [[Dropdown]]

            -- Добавление UIStroke
            Dropdown["Stroke"] = Instance.new("UIStroke", Dropdown["Frame"])
            Dropdown["Stroke"].Transparency = 0.96
            Dropdown["Stroke"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            Dropdown["Stroke"].Color = Colors.Text

            -- Добавление UIPadding
            Dropdown["Padding"] = Instance.new("UIPadding", Dropdown["Frame"])
            Dropdown["Padding"].PaddingTop = UDim.new(0, 8)
            Dropdown["Padding"].PaddingLeft = UDim.new(0, 12)
            Dropdown["Padding"].PaddingRight = UDim.new(0, -8)

            -- Добавление UICorner
            Dropdown["Corner"] = Instance.new("UICorner", Dropdown["Frame"])
            Dropdown["Corner"].CornerRadius = UDim.new(0, 5)

            -- Заголовок дропдауна
            Dropdown["Title"] = Instance.new("TextLabel", Dropdown["Frame"])
            Dropdown["Title"].BorderSizePixel = 0
            Dropdown["Title"].TextXAlignment = Enum.TextXAlignment.Left
            Dropdown["Title"].TextTransparency = 0.2
            Dropdown["Title"].BackgroundColor3 = Colors.Text
            Dropdown["Title"].TextSize = 18
            Dropdown["Title"].FontFace = Font.new([[rbxassetid://11702779517]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            Dropdown["Title"].TextColor3 = Colors.Text
            Dropdown["Title"].BackgroundTransparency = 1
            Dropdown["Title"].Size = UDim2.new(0.85, 0, 0, 29)
            Dropdown["Title"].Position = UDim2.new(0, 0, 0, 0)
            Dropdown["Title"].BorderColor3 = Colors.Secondary
            Dropdown["Title"].Text = Options.Name
            Dropdown["Title"].Name = [[Title]]

            -- Иконка стрелки
            Dropdown["Icon"] = Instance.new("ImageLabel", Dropdown["Frame"])
            Dropdown["Icon"].BorderSizePixel = 0
            Dropdown["Icon"].BackgroundColor3 = Colors.Text
            Dropdown["Icon"].ImageTransparency = 0.3
            Dropdown["Icon"].AnchorPoint = Vector2.new(1, 0)
            Dropdown["Icon"].Image = [[rbxassetid://18824644623]]
            Dropdown["Icon"].ImageColor3 = Colors.Text
            Dropdown["Icon"].Size = UDim2.new(0, 25, 0, 25)
            Dropdown["Icon"].BorderColor3 = Colors.Secondary
            Dropdown["Icon"].BackgroundTransparency = 1
            Dropdown["Icon"].Name = [[Icon]]
            Dropdown["Icon"].Position = UDim2.new(1, -8, 0, 2)

            -- Контейнер для опций
            Dropdown["OptionsContainer"] = Instance.new("Frame", Dropdown["Frame"])
            Dropdown["OptionsContainer"].Visible = false
            Dropdown["OptionsContainer"].BorderSizePixel = 0
            Dropdown["OptionsContainer"].BackgroundColor3 = Colors.DropdownBackground
            Dropdown["OptionsContainer"].Size = UDim2.new(1, -12, 1, -36)
            Dropdown["OptionsContainer"].Position = UDim2.new(0, 0, 0, 32)
            Dropdown["OptionsContainer"].BorderColor3 = Colors.Secondary
            Dropdown["OptionsContainer"].Name = [[Options]]
            Dropdown["OptionsContainer"].BackgroundTransparency = 1

            -- UIPadding внутри контейнера опций
            Dropdown["OptionsPadding"] = Instance.new("UIPadding", Dropdown["OptionsContainer"])
            Dropdown["OptionsPadding"].PaddingTop = UDim.new(0, 2)
            Dropdown["OptionsPadding"].PaddingLeft = UDim.new(0, 2)
            Dropdown["OptionsPadding"].PaddingRight = UDim.new(0, -8)

            -- UIListLayout для опций
            Dropdown["OptionsLayout"] = Instance.new("UIListLayout", Dropdown["OptionsContainer"])
            Dropdown["OptionsLayout"].Padding = UDim.new(0, 5)
            Dropdown["OptionsLayout"].SortOrder = Enum.SortOrder.LayoutOrder

            -- Функция добавления опции
            function Dropdown:AddItem(Value)
                local ID = HTTPService:GenerateGUID(false)
                
                if Dropdown.Items[ID] ~= nil then
                    return
                end
                
                Dropdown.Items[ID] = {
                    Instance = {},
                    Value = Value
                }
                
                -- Создание опции
                Dropdown.Items[ID].Instance["Option"] = Instance.new("TextLabel", Dropdown["OptionsContainer"])
                Dropdown.Items[ID].Instance["Option"].BorderSizePixel = 0
                Dropdown.Items[ID].Instance["Option"].TextTransparency = 0.24
                Dropdown.Items[ID].Instance["Option"].BackgroundColor3 = Colors.Primary
                Dropdown.Items[ID].Instance["Option"].TextSize = 14
                Dropdown.Items[ID].Instance["Option"].FontFace = Font.new([[rbxassetid://11702779517]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                Dropdown.Items[ID].Instance["Option"].TextColor3 = Colors.Text
                Dropdown.Items[ID].Instance["Option"].Size = UDim2.new(1, -10, 0, 20)
                Dropdown.Items[ID].Instance["Option"].Position = UDim2.new(0, 0, 0, 0)
                Dropdown.Items[ID].Instance["Option"].BorderColor3 = Colors.Secondary
                Dropdown.Items[ID].Instance["Option"].Text = Value
                Dropdown.Items[ID].Instance["Option"].Name = [[Option]]

                -- Добавление UICorner к опции
                Dropdown.Items[ID].Instance["Corner"] = Instance.new("UICorner", Dropdown.Items[ID].Instance["Option"])
                Dropdown.Items[ID].Instance["Corner"].CornerRadius = UDim.new(0, 5)

                -- Добавление UIStroke к опции
                Dropdown.Items[ID].Instance["Stroke"] = Instance.new("UIStroke", Dropdown.Items[ID].Instance["Option"])
                Dropdown.Items[ID].Instance["Stroke"].Enabled = false
                Dropdown.Items[ID].Instance["Stroke"].Transparency = 0.96
                Dropdown.Items[ID].Instance["Stroke"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                Dropdown.Items[ID].Instance["Stroke"].Color = Colors.Text
                
                -- Установка выбранной опции по умолчанию, если указано
                if Options.Default ~= false and Options.Default == Value then
                    Dropdown.Selected = ID
                    Dropdown["Title"].Text = Options.Name.." ("..Value..")"
                    Dropdown.Items[ID].Instance["Option"].TextTransparency = 0.2
                    Dropdown.Items[ID].Instance["Option"].BackgroundColor3 = Colors.Active
                    Dropdown.Items[ID].Instance["Stroke"].Enabled = true
                end
                
                -- Обработка событий наведения на опцию
                Dropdown.Items[ID].Instance["Option"].MouseEnter:Connect(function()
                    Dropdown.Hover = true
                    Library:Tween(Dropdown.Items[ID].Instance["Option"], {TextTransparency = 0.2})
                end)

                Dropdown.Items[ID].Instance["Option"].MouseLeave:Connect(function()
                    Dropdown.Hover = false

                    if not Dropdown.MouseDown then
                        Library:Tween(Dropdown.Items[ID].Instance["Option"], {TextTransparency = 0.24})
                    end
                end)

                -- Обработка выбора опции
                Dropdown.Items[ID].Instance["Option"].InputBegan:Connect(function(Input_, GPE)
                    if GPE then return end

                    if Input_.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.Hover then
                        Dropdown.MouseDown = true
                        
                        if Dropdown.Selected ~= nil then
                            Dropdown.Items[Dropdown.Selected].Instance["Option"].TextTransparency = 0.24
                            Dropdown.Items[Dropdown.Selected].Instance["Option"].BackgroundColor3 = Colors.Primary
                            Dropdown.Items[Dropdown.Selected].Instance["Stroke"].Enabled = false
                        end
                        
                        Dropdown.Selected = ID
                        Dropdown.Items[ID].Instance["Option"].TextTransparency = 0.2
                        Dropdown.Items[ID].Instance["Option"].BackgroundColor3 = Colors.Active
                        Dropdown.Items[ID].Instance["Stroke"].Enabled = true
                        Dropdown["Title"].Text = Options.Name.." ("..Value..")"
                        Dropdown:_Toggle()
                        Options.Callback(Value)
                    end
                end)

                Dropdown.Items[ID].Instance["Option"].InputEnded:Connect(function(Input_, GPE)
                    if GPE then return end

                    if Input_.UserInputType == Enum.UserInputType.MouseButton1 then
                        Dropdown.MouseDown = false
                        Dropdown:_Toggle()
                        
                        if Dropdown.Hover then
                            Library:Tween(Dropdown.Items[ID].Instance["Option"], {TextTransparency = 0.2})
                        else
                            Library:Tween(Dropdown.Items[ID].Instance["Option"], {TextTransparency = 0.24})
                        end
                    end
                end)
            end
            
            -- Функция удаления опции по значению
            function Dropdown:RemoveItem(Value)
                local ID = nil
                local Data = nil
                
                for Index, Item in pairs(Dropdown.Items) do
                    if Item.Value == Value then
                        ID = Index
                        Data = Item
                        break
                    end
                end

                if ID and Data then
                    Data.Instance["Option"]:Destroy()
                    Dropdown.Items[ID] = nil
                end
            end

            -- Функция очистки всех опций
            function Dropdown:ClearItems()
                for Index, Item in pairs(Dropdown.Items) do
                    Dropdown:RemoveItem(Item.Value)
                end
            end

            -- Функция изменения названия дропдауна
            function Dropdown:SetName(Name)
                if Dropdown.Selected ~= nil then
                    local SelectedValue = Dropdown.Items[Dropdown.Selected].Value
                    Dropdown["Title"].Text = Name.." ("..SelectedValue..")"
                else
                    Dropdown["Title"].Text = Name
                end
            end

            -- Функция изменения колбэка
            function Dropdown:SetCallback(Callback)
                Options.Callback = Callback
            end

            -- Функция переключения состояния дропдауна
            function Dropdown:_Toggle()
                if Dropdown.Opened then
                    Dropdown.Opened = false
                    Dropdown["OptionsContainer"].Visible = false
                    Library:Tween(Dropdown["Frame"], {Size = UDim2.new(1, 0, 0, 45)})
                else
                    Dropdown.Opened = true
                    local Count = 0
                    
                    for Index, Item in pairs(Dropdown.Items) do
                        if Item ~= nil then
                            Count += 1
                        end
                    end
                    
                    if Count == 0 then
                        return
                    end
                    
                    Dropdown["OptionsContainer"].Visible = true
                    Library:Tween(Dropdown["Frame"], {Size = UDim2.new(1, 0, 0, (45 + (20 * Count) + 14))})
                end
            end
            
            -- Добавление всех опций
            for _, Value in pairs(Options.Items) do
                Dropdown:AddItem(Value)
            end

            -- Обработка событий наведения и клика на основной фрейм дропдауна
            Dropdown["Frame"].MouseEnter:Connect(function()
                Dropdown.Hover = true
                Library:Tween(Dropdown["Icon"], {ImageTransparency = 0})
                Library:Tween(Dropdown["Title"], {TextTransparency = 0})
                Library:Tween(Dropdown["Stroke"], {Transparency = 0.9})
            end)

            Dropdown["Frame"].MouseLeave:Connect(function()
                Dropdown.Hover = false

                if not Dropdown.MouseDown then
                    Library:Tween(Dropdown["Icon"], {ImageTransparency = 0.3})
                    Library:Tween(Dropdown["Title"], {TextTransparency = 0.2})
                    Library:Tween(Dropdown["Stroke"], {Transparency = 0.96})
                end
            end)

            Dropdown["Frame"].InputBegan:Connect(function(Input_, GPE)
                if GPE then return end

                if Input_.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.Hover then
                    Dropdown.MouseDown = true
                    Library:Tween(Dropdown["Frame"], {BackgroundColor3 = Colors.Hover})
                    Library:Tween(Dropdown["Stroke"], {Transparency = 0.9})
                    Dropdown:_Toggle()
                end
            end)

            Dropdown["Frame"].InputEnded:Connect(function(Input_, GPE)
                if GPE then return end

                if Input_.UserInputType == Enum.UserInputType.MouseButton1 then
                    Dropdown.MouseDown = false

                    if Dropdown.Hover then
                        Library:Tween(Dropdown["Frame"], {BackgroundColor3 = Colors.Primary})
                        Library:Tween(Dropdown["Icon"], {ImageTransparency = 0})
                        Library:Tween(Dropdown["Title"], {TextTransparency = 0})
                        Library:Tween(Dropdown["Stroke"], {Transparency = 0.9})
                    else
                        Library:Tween(Dropdown["Frame"], {BackgroundColor3 = Colors.Primary})
                        Library:Tween(Dropdown["Stroke"], {Transparency = 0.96})
                    end
                end
            end)
            
            return Dropdown
        end

        -- Новая функция CreateMultiDropdown
        function Tab:CreateMultiDropdown(Options)
            Options = Library:Validate({
                Name = "MultiDropdown",
                Items = {"Item 1", "Item 2", "Item 3"},
                Defaults = {}, -- Таблица с выбранными значениями по умолчанию
                Callback = function(SelectedValues) print("Selected: ", table.concat(SelectedValues, ", ")) end
            }, Options)
            
            local MultiDropdown = {
                Hover = false,
                MouseDown = false,
                Opened = false,
                Selected = {}, -- Таблица с выбранными значениями
                Items = {},
            }
            
            -- Создание основного фрейма многовыборного дропдауна
            MultiDropdown["Frame"] = Instance.new("Frame", Tab["21"])
            MultiDropdown["Frame"].BorderSizePixel = 0
            MultiDropdown["Frame"].BackgroundColor3 = Colors.Primary
            MultiDropdown["Frame"].ClipsDescendants = true
            MultiDropdown["Frame"].Size = UDim2.new(1, 0, 0, 45)
            MultiDropdown["Frame"].Position = UDim2.new(0, 0, 0, 0)
            MultiDropdown["Frame"].BorderColor3 = Colors.Secondary
            MultiDropdown["Frame"].Name = [[MultiDropdown]]

            -- Добавление UIStroke
            MultiDropdown["Stroke"] = Instance.new("UIStroke", MultiDropdown["Frame"])
            MultiDropdown["Stroke"].Transparency = 0.96
            MultiDropdown["Stroke"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            MultiDropdown["Stroke"].Color = Colors.Text

            -- Добавление UIPadding
            MultiDropdown["Padding"] = Instance.new("UIPadding", MultiDropdown["Frame"])
            MultiDropdown["Padding"].PaddingTop = UDim.new(0, 8)
            MultiDropdown["Padding"].PaddingLeft = UDim.new(0, 12)
            MultiDropdown["Padding"].PaddingRight = UDim.new(0, -8)

            -- Добавление UICorner
            MultiDropdown["Corner"] = Instance.new("UICorner", MultiDropdown["Frame"])
            MultiDropdown["Corner"].CornerRadius = UDim.new(0, 5)

            -- Заголовок многовыборного дропдауна
            MultiDropdown["Title"] = Instance.new("TextLabel", MultiDropdown["Frame"])
            MultiDropdown["Title"].BorderSizePixel = 0
            MultiDropdown["Title"].TextXAlignment = Enum.TextXAlignment.Left
            MultiDropdown["Title"].TextTransparency = 0.2
            MultiDropdown["Title"].BackgroundColor3 = Colors.Text
            MultiDropdown["Title"].TextSize = 18
            MultiDropdown["Title"].FontFace = Font.new([[rbxassetid://11702779517]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            MultiDropdown["Title"].TextColor3 = Colors.Text
            MultiDropdown["Title"].BackgroundTransparency = 1
            MultiDropdown["Title"].Size = UDim2.new(0.85, 0, 0, 29)
            MultiDropdown["Title"].Position = UDim2.new(0, 0, 0, 0)
            MultiDropdown["Title"].BorderColor3 = Colors.Secondary
            MultiDropdown["Title"].Text = Options.Name
            MultiDropdown["Title"].Name = [[Title]]

            -- Иконка стрелки
            MultiDropdown["Icon"] = Instance.new("ImageLabel", MultiDropdown["Frame"])
            MultiDropdown["Icon"].BorderSizePixel = 0
            MultiDropdown["Icon"].BackgroundColor3 = Colors.Text
            MultiDropdown["Icon"].ImageTransparency = 0.3
            MultiDropdown["Icon"].AnchorPoint = Vector2.new(1, 0)
            MultiDropdown["Icon"].Image = [[rbxassetid://18824644623]]
            MultiDropdown["Icon"].ImageColor3 = Colors.Text
            MultiDropdown["Icon"].Size = UDim2.new(0, 25, 0, 25)
            MultiDropdown["Icon"].BorderColor3 = Colors.Secondary
            MultiDropdown["Icon"].BackgroundTransparency = 1
            MultiDropdown["Icon"].Name = [[Icon]]
            MultiDropdown["Icon"].Position = UDim2.new(1, -8, 0, 2)

            -- Контейнер для опций
            MultiDropdown["OptionsContainer"] = Instance.new("Frame", MultiDropdown["Frame"])
            MultiDropdown["OptionsContainer"].Visible = false
            MultiDropdown["OptionsContainer"].BorderSizePixel = 0
            MultiDropdown["OptionsContainer"].BackgroundColor3 = Colors.MultiDropdownBackground
            MultiDropdown["OptionsContainer"].Size = UDim2.new(1, -12, 1, -36)
            MultiDropdown["OptionsContainer"].Position = UDim2.new(0, 0, 0, 32)
            MultiDropdown["OptionsContainer"].BorderColor3 = Colors.Secondary
            MultiDropdown["OptionsContainer"].Name = [[Options]]
            MultiDropdown["OptionsContainer"].BackgroundTransparency = 1

            -- UIPadding внутри контейнера опций
            MultiDropdown["OptionsPadding"] = Instance.new("UIPadding", MultiDropdown["OptionsContainer"])
            MultiDropdown["OptionsPadding"].PaddingTop = UDim.new(0, 2)
            MultiDropdown["OptionsPadding"].PaddingLeft = UDim.new(0, 2)
            MultiDropdown["OptionsPadding"].PaddingRight = UDim.new(0, -8)

            -- UIListLayout для опций
            MultiDropdown["OptionsLayout"] = Instance.new("UIListLayout", MultiDropdown["OptionsContainer"])
            MultiDropdown["OptionsLayout"].Padding = UDim.new(0, 5)
            MultiDropdown["OptionsLayout"].SortOrder = Enum.SortOrder.LayoutOrder

            -- Таблица для хранения выбранных элементов
            MultiDropdown.SelectedValues = {}

            -- Функция добавления опции
            function MultiDropdown:AddItem(Value)
                local ID = HTTPService:GenerateGUID(false)
                
                if MultiDropdown.Items[ID] ~= nil then
                    return
                end
                
                MultiDropdown.Items[ID] = {
                    Instance = {},
                    Value = Value,
                    Selected = false,
                }
                
                -- Создание опции
                MultiDropdown.Items[ID].Instance["Option"] = Instance.new("TextLabel", MultiDropdown["OptionsContainer"])
                MultiDropdown.Items[ID].Instance["Option"].BorderSizePixel = 0
                MultiDropdown.Items[ID].Instance["Option"].TextTransparency = 0.24
                MultiDropdown.Items[ID].Instance["Option"].BackgroundColor3 = Colors.Primary
                MultiDropdown.Items[ID].Instance["Option"].TextSize = 14
                MultiDropdown.Items[ID].Instance["Option"].FontFace = Font.new([[rbxassetid://11702779517]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                MultiDropdown.Items[ID].Instance["Option"].TextColor3 = Colors.Text
                MultiDropdown.Items[ID].Instance["Option"].Size = UDim2.new(1, -10, 0, 20)
                MultiDropdown.Items[ID].Instance["Option"].Position = UDim2.new(0, 0, 0, 0)
                MultiDropdown.Items[ID].Instance["Option"].BorderColor3 = Colors.Secondary
                MultiDropdown.Items[ID].Instance["Option"].Text = Value
                MultiDropdown.Items[ID].Instance["Option"].Name = [[Option]]

                -- Добавление UICorner к опции
                MultiDropdown.Items[ID].Instance["Corner"] = Instance.new("UICorner", MultiDropdown.Items[ID].Instance["Option"])
                MultiDropdown.Items[ID].Instance["Corner"].CornerRadius = UDim.new(0, 5)

                -- Добавление UIStroke к опции
                MultiDropdown.Items[ID].Instance["Stroke"] = Instance.new("UIStroke", MultiDropdown.Items[ID].Instance["Option"])
                MultiDropdown.Items[ID].Instance["Stroke"].Enabled = false
                MultiDropdown.Items[ID].Instance["Stroke"].Transparency = 0.96
                MultiDropdown.Items[ID].Instance["Stroke"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                MultiDropdown.Items[ID].Instance["Stroke"].Color = Colors.Text

                -- Создание чекбокса для многовыборного дропдауна
                MultiDropdown.Items[ID].Instance["Checkbox"] = Instance.new("ImageLabel", MultiDropdown.Items[ID].Instance["Option"])
                MultiDropdown.Items[ID].Instance["Checkbox"].BorderSizePixel = 0
                MultiDropdown.Items[ID].Instance["Checkbox"].BackgroundColor3 = Colors.ToggleInactive
                MultiDropdown.Items[ID].Instance["Checkbox"].Image = [[rbxassetid://18837414354]] -- Иконка галочки
                MultiDropdown.Items[ID].Instance["Checkbox"].ImageTransparency = 1
                MultiDropdown.Items[ID].Instance["Checkbox"].AnchorPoint = Vector2.new(1, 0.5)
                MultiDropdown.Items[ID].Instance["Checkbox"].Size = UDim2.new(0, 20, 0, 20)
                MultiDropdown.Items[ID].Instance["Checkbox"].Position = UDim2.new(1, -8, 0.5, 0)
                MultiDropdown.Items[ID].Instance["Checkbox"].BorderColor3 = Colors.Secondary
                MultiDropdown.Items[ID].Instance["Checkbox"].BackgroundTransparency = 1
                MultiDropdown.Items[ID].Instance["Checkbox"].Name = [[Checkbox]]

                -- Функция обновления состояния чекбокса
                local function UpdateCheckbox()
                    if MultiDropdown.Items[ID].Selected then
                        MultiDropdown.Items[ID].Instance["Checkbox"].ImageTransparency = 0
                        MultiDropdown.Items[ID].Instance["Checkbox"].BackgroundColor3 = Colors.ToggleActive
                    else
                        MultiDropdown.Items[ID].Instance["Checkbox"].ImageTransparency = 1
                        MultiDropdown.Items[ID].Instance["Checkbox"].BackgroundColor3 = Colors.ToggleInactive
                    end
                end

                -- Установка выбранных значений по умолчанию
                for _, defaultValue in ipairs(Options.Defaults) do
                    if defaultValue == Value then
                        MultiDropdown.Items[ID].Selected = true
                        table.insert(MultiDropdown.SelectedValues, Value)
                        break
                    end
                end
                UpdateCheckbox()

                -- Обработка событий наведения на опцию
                MultiDropdown.Items[ID].Instance["Option"].MouseEnter:Connect(function()
                    MultiDropdown.Hover = true
                    Library:Tween(MultiDropdown.Items[ID].Instance["Option"], {TextTransparency = 0.2})
                end)

                MultiDropdown.Items[ID].Instance["Option"].MouseLeave:Connect(function()
                    MultiDropdown.Hover = false

                    if not MultiDropdown.MouseDown then
                        Library:Tween(MultiDropdown.Items[ID].Instance["Option"], {TextTransparency = 0.24})
                    end
                end)

                -- Обработка клика на опцию
                MultiDropdown.Items[ID].Instance["Option"].InputBegan:Connect(function(Input_, GPE)
                    if GPE then return end

                    if Input_.UserInputType == Enum.UserInputType.MouseButton1 and MultiDropdown.Hover then
                        MultiDropdown.MouseDown = true
                        MultiDropdown.Items[ID].Selected = not MultiDropdown.Items[ID].Selected
                        
                        if MultiDropdown.Items[ID].Selected then
                            table.insert(MultiDropdown.SelectedValues, Value)
                        else
                            for i, v in ipairs(MultiDropdown.SelectedValues) do
                                if v == Value then
                                    table.remove(MultiDropdown.SelectedValues, i)
                                    break
                                end
                            end
                        end

                        UpdateCheckbox()
                        MultiDropdown["Title"].Text = Options.Name.." ("..#MultiDropdown.SelectedValues..")"
                        Options.Callback(MultiDropdown.SelectedValues)
                    end
                end)

                MultiDropdown.Items[ID].Instance["Option"].InputEnded:Connect(function(Input_, GPE)
                    if GPE then return end

                    if Input_.UserInputType == Enum.UserInputType.MouseButton1 then
                        MultiDropdown.MouseDown = false
                        MultiDropdown:_Toggle()
                        
                        if MultiDropdown.Hover then
                            Library:Tween(MultiDropdown.Items[ID].Instance["Option"], {TextTransparency = 0.2})
                        else
                            Library:Tween(MultiDropdown.Items[ID].Instance["Option"], {TextTransparency = 0.24})
                        end
                    end
                end)
            end
            
            -- Функция очистки всех опций
            function MultiDropdown:ClearItems()
                for Index, Item in pairs(MultiDropdown.Items) do
                    Item.Instance["Option"]:Destroy()
                    MultiDropdown.Items[Index] = nil
                end
                MultiDropdown.SelectedValues = {}
                MultiDropdown["Title"].Text = Options.Name
            end

            -- Функция изменения названия многовыборного дропдауна
            function MultiDropdown:SetName(Name)
                MultiDropdown["Title"].Text = Name.." ("..#MultiDropdown.SelectedValues..")"
            end

            -- Функция изменения колбэка
            function MultiDropdown:SetCallback(Callback)
                Options.Callback = Callback
            end

            -- Функция переключения состояния многовыборного дропдауна
            function MultiDropdown:_Toggle()
                if MultiDropdown.Opened then
                    MultiDropdown.Opened = false
                    MultiDropdown["OptionsContainer"].Visible = false
                    Library:Tween(MultiDropdown["Frame"], {Size = UDim2.new(1, 0, 0, 45)})
                else
                    MultiDropdown.Opened = true
                    local Count = 0
                    
                    for Index, Item in pairs(MultiDropdown.Items) do
                        if Item ~= nil then
                            Count += 1
                        end
                    end
                    
                    if Count == 0 then
                        return
                    end
                    
                    MultiDropdown["OptionsContainer"].Visible = true
                    Library:Tween(MultiDropdown["Frame"], {Size = UDim2.new(1, 0, 0, (45 + (20 * Count) + 14))})
                end
            end
            
            -- Добавление всех опций
            for _, Value in pairs(Options.Items) do
                MultiDropdown:AddItem(Value)
            end

            -- Обработка событий наведения и клика на основной фрейм многовыборного дропдауна
            MultiDropdown["Frame"].MouseEnter:Connect(function()
                MultiDropdown.Hover = true
                Library:Tween(MultiDropdown["Icon"], {ImageTransparency = 0})
                Library:Tween(MultiDropdown["Title"], {TextTransparency = 0})
                Library:Tween(MultiDropdown["Stroke"], {Transparency = 0.9})
            end)

            MultiDropdown["Frame"].MouseLeave:Connect(function()
                MultiDropdown.Hover = false

                if not MultiDropdown.MouseDown then
                    Library:Tween(MultiDropdown["Icon"], {ImageTransparency = 0.3})
                    Library:Tween(MultiDropdown["Title"], {TextTransparency = 0.2})
                    Library:Tween(MultiDropdown["Stroke"], {Transparency = 0.96})
                end
            end)

            MultiDropdown["Frame"].InputBegan:Connect(function(Input_, GPE)
                if GPE then return end

                if Input_.UserInputType == Enum.UserInputType.MouseButton1 and MultiDropdown.Hover then
                    MultiDropdown.MouseDown = true
                    Library:Tween(MultiDropdown["Frame"], {BackgroundColor3 = Colors.Hover})
                    Library:Tween(MultiDropdown["Stroke"], {Transparency = 0.9})
                    MultiDropdown:_Toggle()
                end
            end)

            MultiDropdown["Frame"].InputEnded:Connect(function(Input_, GPE)
                if GPE then return end

                if Input_.UserInputType == Enum.UserInputType.MouseButton1 then
                    MultiDropdown.MouseDown = false

                    if MultiDropdown.Hover then
                        Library:Tween(MultiDropdown["Frame"], {BackgroundColor3 = Colors.Primary})
                        Library:Tween(MultiDropdown["Icon"], {ImageTransparency = 0})
                        Library:Tween(MultiDropdown["Title"], {TextTransparency = 0})
                        Library:Tween(MultiDropdown["Stroke"], {Transparency = 0.9})
                    else
                        Library:Tween(MultiDropdown["Frame"], {BackgroundColor3 = Colors.Primary})
                        Library:Tween(MultiDropdown["Stroke"], {Transparency = 0.96})
                    end
                end
            end)
            
            return MultiDropdown
        end
            
            function Tab:CreateInput(Options)
                Options = Library:Validate({
                    Name = "Input",
                    Default = false,
                    Callback = function(Value)
                        print("The Value is "..Value.."!")
                    end,
                }, Options)
                
                local Input = {
                    Hover = false,
                    MouseDown = false,
                    Text = nil
                }
                
                -- StarterGui.Emperion.Main.ContentContainer.HomeTab.Input
                Input["87"] = Instance.new("Frame", Tab["21"]);
                Input["87"]["BorderSizePixel"] = 0;
                Input["87"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
                Input["87"]["Size"] = UDim2.new(1, 0, 0, 45);
                Input["87"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                Input["87"]["Name"] = [[Input]];
    
                -- StarterGui.Emperion.Main.ContentContainer.HomeTab.Input.UIStroke
                Input["88"] = Instance.new("UIStroke", Input["87"]);
                Input["88"]["Transparency"] = 0.96;
                Input["88"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
                Input["88"]["Color"] = Color3.fromRGB(255, 255, 255);
    
                -- StarterGui.Emperion.Main.ContentContainer.HomeTab.Input.UIPadding
                Input["89"] = Instance.new("UIPadding", Input["87"]);
                Input["89"]["PaddingTop"] = UDim.new(0, 8);
                Input["89"]["PaddingLeft"] = UDim.new(0, 12);
                Input["89"]["PaddingBottom"] = UDim.new(0, 8);
    
                -- StarterGui.Emperion.Main.ContentContainer.HomeTab.Input.UICorner
                Input["8a"] = Instance.new("UICorner", Input["87"]);
                Input["8a"]["CornerRadius"] = UDim.new(0, 5);
    
                -- StarterGui.Emperion.Main.ContentContainer.HomeTab.Input.Title
                Input["8b"] = Instance.new("TextLabel", Input["87"]);
                Input["8b"]["BorderSizePixel"] = 0;
                Input["8b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
                Input["8b"]["TextTransparency"] = 0.2;
                Input["8b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
                Input["8b"]["TextSize"] = 18;
                Input["8b"]["FontFace"] = Font.new([[rbxassetid://11702779517]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                Input["8b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
                Input["8b"]["BackgroundTransparency"] = 1;
                Input["8b"]["Size"] = UDim2.new(0.85, 0, 1, 0);
                Input["8b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                Input["8b"]["Text"] = Options.Name;
                Input["8b"]["Name"] = [[Title]];
    
                -- StarterGui.Emperion.Main.ContentContainer.HomeTab.Input.TextBox
                Input["8c"] = Instance.new("TextBox", Input["87"]);
                Input["8c"]["CursorPosition"] = -1;
                Input["8c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
                Input["8c"]["PlaceholderColor3"] = Color3.fromRGB(255, 255, 255);
                Input["8c"]["BorderSizePixel"] = 0;
                Input["8c"]["TextTransparency"] = 0.2;
                Input["8c"]["TextSize"] = 14;
                Input["8c"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
                Input["8c"]["FontFace"] = Font.new([[rbxassetid://11702779517]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                Input["8c"]["AnchorPoint"] = Vector2.new(1, 0);
                Input["8c"]["PlaceholderText"] = [[Text]];
                Input["8c"]["Size"] = UDim2.new(0, 42, 0, 25);
                Input["8c"]["Position"] = UDim2.new(1, -8, 0, 2);
                Input["8c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
                Input["8c"]["Text"] = [[]];
                Input["8c"]["AutomaticSize"] = Enum.AutomaticSize.X;
                
                Input["8f"] = Instance.new("UIPadding", Input["8c"])
                Input["8f"]["PaddingLeft"] = UDim.new(0, 8)
                Input["8f"]["PaddingRight"] = UDim.new(0, 8)
    
                -- StarterGui.Emperion.Main.ContentContainer.HomeTab.Input.TextBox.UIStroke
                Input["8d"] = Instance.new("UIStroke", Input["8c"]);
                Input["8d"]["Transparency"] = 0.96;
                Input["8d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
                Input["8d"]["Color"] = Color3.fromRGB(255, 255, 255);
    
                -- StarterGui.Emperion.Main.ContentContainer.HomeTab.Input.TextBox.UICorner
                Input["8e"] = Instance.new("UICorner", Input["8c"]);
                Input["8e"]["CornerRadius"] = UDim.new(0, 5);
                
                if Options.Default ~= false then
                    Input["8c"]["Text"] = Options.Default
                end
                
                function Input:SetCallback(Callback)
                    Options.Callback = Callback
                end
                
                function Input:SetName(Name)
                    Input["8b"]["Text"] = Name
                end
                
                function Input:SetText(Text)
                    Input["8c"]["Text"] = Text
                end
                
                function Input:GetText()
                    return Input["8c"]["Text"]
                end
                
                Input["87"].MouseEnter:Connect(function()
                    Input.Hover = true
                    Library:Tween(Input["8b"], {TextTransparency = 0})
                    Library:Tween(Input["88"], {Transparency = 0.9})
                end)
    
                Input["87"].MouseLeave:Connect(function()
                    Input.Hover = false
    
                    if not Input.MouseDown then
                        Library:Tween(Input["8b"], {TextTransparency = 0.2})
                        Library:Tween(Input["88"], {Transparency = 0.96})
                    end
                end)
    
                Input["87"].InputBegan:Connect(function(Input_, GPE)
                    if GPE then return end
    
                    if Input_.UserInputType == Enum.UserInputType.MouseButton1 and Input.Hover then
                        Input.MouseDown = true
                        Library:Tween(Input["87"], {BackgroundColor3 = Color3.fromRGB(28, 28, 28)})
                        Library:Tween(Input["88"], {Transparency = 0.9})
                    end
                end)
    
                Input["87"].InputEnded:Connect(function(Input_, GPE)
                    if GPE then return end
    
                    if Input_.UserInputType == Enum.UserInputType.MouseButton1 then
                        Input.MouseDown = false
    
                        if Input.Hover then
                            Library:Tween(Input["87"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
                            Library:Tween(Input["8b"], {TextTransparency = 0})
                            Library:Tween(Input["88"], {Transparency = 0.9})
                        else
                            Library:Tween(Input["87"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
                            Library:Tween(Input["88"], {Transparency = 0.96})
                        end
                    end
                end) 
    
                Input["8c"]:GetPropertyChangedSignal("Text"):Connect(function()
                    Options.Callback(Input["8c"]["Text"])
                end)
                
                return Input
            end
    
            return Tab
        end
        
        function Window:Scale(Scale)
            Library:Tween(Window["21"], {Scale = Scale})
        end
        
        function Window:Destroy()
            Library:Tween(Window["21"], {Scale = 0.8})
            wait(0.1)
            Window["1"]:Destroy()
        end
    
        return Window
    end
return Library
