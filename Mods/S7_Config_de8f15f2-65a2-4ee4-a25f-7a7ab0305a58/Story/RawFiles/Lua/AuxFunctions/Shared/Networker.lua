--  =========
--  USER INFO
--  =========

---@class UserInfo
---@field UserID string
---@field ProfileID string
---@field UserName string
---@field CurrentCharacter string
---@field DisplayName string

---@class UserInformation: UserInfo @Manages UserInformation
---@field Host UserInfo Host-User's Information
---@field Clients UserInfo[] Client's Information
---@field isProcessing boolean ReSync in progress
UserInformation = {
    ['Host'] = {},
    ['Clients'] = {},
    ['isProcessing'] = false
}