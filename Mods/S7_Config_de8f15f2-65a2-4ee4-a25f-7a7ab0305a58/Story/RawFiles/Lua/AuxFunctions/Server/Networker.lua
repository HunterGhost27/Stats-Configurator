--  =========
--  NETWORKER
--  =========

---ReSynchronizes UserInformation Object
function UserInformation:ReSync()
    if not Ext.OsirisIsCallable() then Debug:Warn("Cannot ReSync UserInformation. Osiris Inaccessible") return end
    if self.isProcessing then return end

    self.isProcessing = true

    --  HOST CHARACTER
    --  ==============

    local CharacterGUID = Osi.CharacterGetHostCharacter()
    self.Host.UserID = Osi.CharacterGetReservedUserID(CharacterGUID)
    self.Host.ProfileID = Osi.GetUserProfileID(self.Host.UserID)
    self.Host.UserName = Osi.GetUserName(self.Host.UserID)
    self.Host.CurrentCharacter = Osi.GetCurrentCharacter(self.Host.UserID)
    _, self.Host.DisplayName = Osi.CharacterGetDisplayName(self.Host.CurrentCharacter)

    self.UserID = self.Host.UserID
    self.ProfileID = self.Host.ProfileID
    self.UserName = self.Host.UserName
    self.CurrentCharacter = self.Host.CurrentCharacter
    self.DisplayName = self.Host.DisplayName

    --  CLIENT CHARACTERS
    --  =================

    local tempUsers = {}
    local db = Osi.DB_IsPlayer:Get(nil)[1] or {}
    for _, player in pairs(db) do tempUsers[#tempUsers+1] = Osi.CharacterGetReservedUserID(player) end

    for _, user in pairs(tempUsers) do
        local profileID = Osi.GetUserProfileID(user)
        if not self.Clients[profileID] then self.Clients[profileID] = {} end

        self.Clients[profileID].UserID = user
        self.Clients[profileID].ProfileID = profileID
        self.Clients[profileID].UserName = Osi.GetUserName(user)
        self.Clients[profileID].CurrentCharacter = Osi.GetCurrentCharacter(user)
        _, self.Clients[profileID].DisplayName = Osi.CharacterGetDisplayName(self.Clients[profileID].CurrentCharacter)

        local package = { ['UserInfo'] = Rematerialize(self), ['UserSpec'] = self.Clients[profileID]}
        Ext.PostMessageToUser(user, 'S7_AuxFunctions::UserInfoSync', Ext.JsonStringify(package))
    end

    self.isProcessing = false
end

Ext.RegisterOsirisListener('GameStarted', 2, 'after', function () UserInformation:ReSync() end)
Ext.RegisterOsirisListener('UserConnected', 3, 'after', function () UserInformation:ReSync() end)
Ext.RegisterOsirisListener('CharacterReservedUserIDChanged', 3, 'after', function () UserInformation:ReSync() end)
Ext.RegisterOsirisListener('UserEvent', 2, 'after', function () UserInformation:ReSync() end)
