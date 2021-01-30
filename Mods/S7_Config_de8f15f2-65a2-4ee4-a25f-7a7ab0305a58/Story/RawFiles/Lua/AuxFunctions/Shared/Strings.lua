--  =========================
--  VALIDATE NON-EMPTY STRING
--  =========================

--- Check validity of string
---@param str any
function ValidString(str)
    if type(str) ~= 'string' then return false end
    if str == "" or str == "{}" or str == "[]" then return false end
    if str == "00000000-0000-0000-0000-000000000000" or str == "NULL_00000000-0000-0000-0000-000000000000" then return false end
    return true
end

--  ==========
--  READ LINES
--  ==========

---Line iterator
---@param str string
---@return string lineIterator
function Readlines(str)
    if str:sub(-1) ~= '\n' then str = str .. '\n' end
    return str:gmatch('(.-)\n')
end

--  ============
--  EXTRACT GUID
--  ============

---Extract GUID and Name parts from NameGUID
---@param str string GUIDString
---@return string GUID
---@return string Name
function ExtractGUID(str)
    if type(str) ~= 'string' then return end
    local Name, GUID = str:match("(.*)_(.-)$")
    return GUID, Name
end

--  ======
--  WRITER
--  ======

---@class Write @Writes multiline strings
---@field Header string Highlighted header
---@field Maxlen number Largest line-length
---@field Style table Styles
Write = {
    ['Header'] = "",
    ['MaxLen'] = 0,
    ['Style'] = {
        ['Outer'] = "=",
        ['Inner'] = '-',
    }
}

---Updates MaxLength
---@param str string
function Write:UpdateMaxLen(str)
    if str:len() > self.MaxLen then self.MaxLen = str:len() end
    if self.MaxLen > 120 then self.MaxLen = 120 end
end

---Sets the Header
---@param str string
function Write:SetHeader(str) self:UpdateMaxLen(str); self.Header = str end

---Sets Style options
---@param t table<string, string>
function Write:Styler(t) self.Style = Integrate(self.Style, t) end

---Adds new line
---@param str string
function Write:NewLine(str) self:UpdateMaxLen(str); self[#self + 1] = str end

---Appends string to the last element
---@param str string
function Write:AppendLine(str) if self[#self] then self[#self] = self[#self] .. str else self[#self + 1] = str end end

---Adds a line-break
---@param char string
function Write:LineBreak(char) local char = char or ""; self:NewLine(string.rep(char, self.MaxLen)) end

---Creates a 2D string table
---@param t table
---@return string
function Write:Tabulate(t)
    if type(t) ~= 'table' then return end
    local t = Rematerialize(t) or {}
    local keys = ExtractKeys(t)
    local maxLen = 0
    for _, key in pairs(keys) do
        local len = string.len(tostring(key))
        if len > maxLen then maxLen = len end
    end
    local displayStr = "\n"
    for key, value in pairs(t) do
        key = tostring(key)
        local keyLen = string.len(key)
        if keyLen < maxLen then key = key .. string.rep(" ", maxLen - keyLen) end
        local str = key .. "\t" .. tostring(value) .. "\n"
        self:UpdateMaxLen(str)
        displayStr = displayStr .. str
    end
    self:AppendLine(displayStr)
end


---Resets Stringer to default values
function Write:Clear()
    for idx, _ in ipairs(self) do self[idx] = nil end
    self.Style = {['Outer'] = "=", ["Inner"] = "-"}
    self.Header = ""
    self.MaxLen = 0
end

---Combines the entire Stringer object into a single string
---@return string displayString
function Write:Display()
    local str = "\n"
    if ValidString(self.Style.Outer) then str = str .. string.rep(self.Style.Outer, self.MaxLen) .. "\n" end
    str = str .. self.Header .. "\n"
    if ValidString(self.Style.Inner) then str = str .. string.rep(self.Style.Inner, self.MaxLen) .. "\n" end
    for _, value in ipairs(self) do str = str .. value .. "\n" end
    if ValidString(self.Style.Outer) then str = str .. string.rep(self.Style.Outer, self.MaxLen) .. "\n" end
    self:Clear()
    return str
end

--  ======
--  COLORS
--  ======

Color = {
    ["black"] = "#000000",
    ["red"] = "#E03616",
    ["blue"] = "#5998C5",
    ["green"] = "#3F784C",
    ["yellow"] = "#FFFF00",
    ["orange"] = "#C17817",
    ["violet"] = "#58355E",
    ["gold"] = "#C7A758",
    ["white"] = "#FFFFFF",
    ["air"] = "#7478DC",
    ["earth"] = "#AA895B",
    ["fire"] = "#C76537",
    ["necromancy"] = "#9A5085",
    ["polymorph"] = "#FFB811",
    ["ranger"] = "#5A9646",
    ["rogue"] = "#566C6C",
    ["source"] = "#6EB09D",
    ["summoning"] = "#9440B3",
    ["warrior"] = "#A11919",
    ["water"] = "#579CCA",
}

---Wrap font tags around string with corresponding color
---@param color string Hex-Color-Value
---@param str string
---@return string
local function addFontTags(color, str) return string.format("<font color=\'%s\'>%s</font>", color, str) end

---Color the string Red
---@param str string
---@return string
function Color:Red(str) return addFontTags(self.red, str) end

---Color the string Blue
---@param str string
---@return string
function Color:Blue(str) return addFontTags(self.blue, str) end

---Color the string Green
---@param str string
---@return string
function Color:Green(str) return addFontTags(self.green, str) end

---Color the string Black
---@param str string
---@return string
function Color:Black(str) return addFontTags(self.black, str) end

---Color the string White
---@param str string
---@return string
function Color:White(str) return addFontTags(self.white, str) end

---Color the string Yellow
---@param str string
---@return string
function Color:Yellow(str) return addFontTags(self.yellow, str) end

---Color the string Orange
---@param str string
---@return string
function Color:Orange(str) return addFontTags(self.orange, str) end

---Color the string Violet
---@param str string
---@return string
function Color:Violet(str) return addFontTags(self.violet, str) end

---Color the string Gold
---@param str string
---@return string
function Color:Gold(str) return addFontTags(self.gold, str) end

--  ELEMENTAL COLORS
--  ================

---Color the string Air
---@param str string
---@return string
function Color:Air(str) return addFontTags(self.air, str) end

---Color the string Earth
---@param str string
---@return string
function Color:Earth(str) return addFontTags(self.earth, str) end

---Color the string Fire
---@param str string
---@return string
function Color:Fire(str) return addFontTags(self.fire, str) end

---Color the string Necromancy
---@param str string
---@return string
function Color:Necromancy(str) return addFontTags(self.necromancy, str) end

---Color the string Polymorph
---@param str string
---@return string
function Color:Polymorph(str) return addFontTags(self.polymorph, str) end

---Color the string Ranger
---@param str string
---@return string
function Color:Ranger(str) return addFontTags(self.ranger, str) end

---Color the string Rogue
---@param str string
---@return string
function Color:Rogue(str) return addFontTags(self.rogue, str) end

---Color the string Source
---@param str string
---@return string
function Color:Source(str) return addFontTags(self.source, str) end

---Color the string Summoning
---@param str string
---@return string
function Color:Summoning(str) return addFontTags(self.summoning, str) end

---Color the string Warrior
---@param str string
---@return string
function Color:Warrior(str) return addFontTags(self.warrior, str) end

---Color the string Water
---@param str string
---@return string
function Color:Water(str) return addFontTags(self.water, str) end

--  CUSTOM COLOR
--  ============

---Color the string with custom hex-value
---@param hex string Color hex-value
---@param str string String to color
---@return string
function Color:Custom(hex, str) return addFontTags(hex, str) end
