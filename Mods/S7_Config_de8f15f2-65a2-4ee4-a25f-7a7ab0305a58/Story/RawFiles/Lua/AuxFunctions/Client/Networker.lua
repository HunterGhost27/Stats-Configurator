--  =========
--  NETWORKER
--  =========

Ext.RegisterNetListener('S7_AuxFunctions:UserInfoSync', function (channel, payload)
    local package = Ext.JsonParse(payload) or {}
    UserInformation = Integrate(UserInformation, package.UserInfo)
    UserInformation = Integrate(UserInformation, package.UserSpec)
end)
