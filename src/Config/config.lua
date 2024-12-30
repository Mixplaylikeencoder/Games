local Config = {}
local folderName = "WindUI_Config"
local fileName = "settings.json"

-- Проверяем, есть ли папка, и создаем её, если нет
if not isfolder(folderName) then
    makefolder(folderName)
end

-- Полный путь к файлу
local filePath = folderName .. "/" .. fileName

-- Функция для сохранения настроек
function Config:Save()
    local jsonData = game:GetService("HttpService"):JSONEncode(self.settings)
    writefile(filePath, jsonData)
end

-- Функция для загрузки настроек
function Config:Load()
    if isfile(filePath) then
        local jsonData = readfile(filePath)
        local ok, data = pcall(function()
            return game:GetService("HttpService"):JSONDecode(jsonData)
        end)
        if ok and type(data) == "table" then
            self.settings = data
        else
            self.settings = {}
            warn("Ошибка загрузки настроек. Создан новый файл.")
        end
    else
        self.settings = {}
        self:Save() -- Создаем пустой файл, если его нет
    end
end

return Config
