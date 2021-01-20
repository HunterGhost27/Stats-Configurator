--  =========
--  LOAD FILE
--  =========

--- Load file contents
---@param fileName string FilePath
---@param context string PathContext. 'data' for modData. 'user' or nil for osirisData
---@return table file Parsed file contents
---@return string fileContents Stringified file contents
function LoadFile(fileName, context)
    local file
    local _, fileContents = pcall(Ext.LoadFile, fileName, context)
    if string.match(fileName, '.json') then
        if ValidString(fileContents) then file = Ext.JsonParse(fileContents); Destringify(file)
        else file = {} end
    else file = fileContents end
    return file, fileContents
end

--  =========
--  SAVE FILE
--  =========

--- Save file
---@param fileName string FilePath
---@param contents any File Contents to save
function SaveFile(fileName, contents)
    if ValidString(fileName) then
        local fileContents = type(contents) == 'table' and Ext.JsonStringify(Rematerialize(contents)) or tostring(contents) or ""
        Ext.SaveFile(fileName, fileContents)
    end
end

--  ===================
--  LOAD MULTIPLE FILES
--  ===================

---Loads multiple files
---@param fileNames table Array of fileNames
---@param context string Path-Context
---@return table files Table of files
function LoadFiles(fileNames, context)
    local files = {}
    if type(fileNames) ~= 'table' then return end
    for _, fileName in ipairs(fileNames) do
        local _, fileContents = pcall(Ext.LoadFile, fileName, context)
        if string.match(fileName, '.json') then
            if ValidString(fileContents) then files[fileName] = Ext.JsonParse(fileContents); Destringify(files[fileName])
            else files[fileName] = {} end
        else files[fileName] = fileContents end
    end
    return files
end
