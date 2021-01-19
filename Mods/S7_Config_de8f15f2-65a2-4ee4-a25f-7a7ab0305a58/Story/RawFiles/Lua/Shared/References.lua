--		==========
--		REFERENCES
--		==========

--	SkillData and StatusData
--	========================

SkillandStatusData = {
	["SkillData"] = {
		"Projectile",
		"ProjectileStrike",
		"Target",
		"Cone",
		"Zone",
		"MultiStrike",
		"Quake",
		"Storm",
		"Rush",
		"Jump",
		"Tornado",
		"Wall",
		"Teleportation",
		"Path",
		"Rain",
		"Summon",
		"Shout",
		"Dome"
	},
	["StatusData"] = {
		"Status_CONSUME",
		"Status_DAMAGE",
		"Status_HEAL",
		"Status_HEALING",
		"Status_FEAR",
		"Status_POLYMORPHED",
		"Status_KNOCKED_DOWN",
		"Status_STANCE",
		"Status_INCAPACITATED",
		"Status_BLIND",
		"Status_GUARDIAN_ANGEL",
		"Status_DAMAGE_ON_MOVE",
		"Status_DEMONIC_BARGAIN",
		"Status_CHALLENGE",
		"Status_FLOATING",
		"Status_THROWN",
		"Status_DISARMED",
		"Status_HEAL_SHARING",
		"Status_HEAL_SHARING_CASTER",
		"Status_ACTIVE_DEFENSE",
		"Status_SPARK",
		"Status_PLAY_DEAD",
		"Status_INVISIBLE",
		"Status_DEACTIVATED",
		"Status_EFFECT",
		"Status_EXTRA_TURN",
		"Status_CHARMED",
		"Status_MUTED",
		"Status_DECAYING_TOUCH"
	}
}

--	=================
--	HANDLE STAT-TYPES
--	=================

---	Returns the appropriate statType for statName
---@param statName string
---@return string statType
function HandleStatType(statName)
	if not ValidString(statName) then return end

	local statType = Osi.NRD_StatGetType(statName) or ""

	--	SKILLDATA
	--	=========
	if statType == "SkillData" then
		local splitString = Disintegrate(statName, "_")
		for _, subStatType in pairs(SkillandStatusData["SkillData"]) do if splitString == subStatType then return splitString end end

	--	STATUSDATA
	--	==========
	elseif statType == "StatusData" then
		local status = Ext.GetStat(statName)	--	fetch stat entry.
		local statusType = "Status_" .. status.StatusType	-- get status type and concatenate.
		return statusType	-- return subcategory of StatusData
	else

	--	EVERYTHING ESLE
	--	===============
		return statType
	end
end

--	================
--	ENUM TRANSFORMER
--	================

---	Converts Enumeration Index and Labels
---@param mode string `Index2Label` or `Label2Index`
---@param enumerationTypeName string Enumeration Name
---@param argument string `Index` or `Label`
---@return string @`Index` or `Label`
function EnumTransformer(mode, enumerationTypeName, argument)
	if mode == "Index2Label" then return Ext.EnumIndexToLabel(enumerationTypeName, argument)
	elseif mode == "Label2Index" then return Ext.EnumLabelToIndex(enumerationTypeName, argument)
	end
end
