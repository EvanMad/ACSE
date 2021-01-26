local global = _G
local api = global.api
local loadfile = global.loadfile
local require = global.require
local module = global.module
local type = global.type
local pairs = global.pairs
local GameDatabase = require("Database.GameDatabase")
local Mutators = require("Environment.ModuleMutators")
local Module = module(..., Mutators.EnvironmentPrototype)

Module.EnvironmentPrototype = {
	SearchPaths = {"Managers"},
	Managers = {
		["Managers.CashSpentPopupManager"] = {},
		["Managers.GuestCountHistoryManager"] = {},
		["Managers.ScenarioManager"] = {},
		["Managers.ParkRatingManager"] = {},
		["Managers.UIPersistenceManager"] = {},
		["Managers.NotificationManager"] = {},
		["Managers.ResearchManager"] = {},
		["Managers.MarketingManager"] = {},
		["Managers.ParkDemographicsManager"] = {},
		["Managers.DLCPopupManager"] = {},
		["Managers.AchievementManager"] = {},
		["Managers.CheatManager"] = {},
		["Managers.TutorialManager"] = {},
		["Managers.CommsManager"] = {}
	}
}

-- Merge default Managers with ACSE collected protos
if GameDatabase.GetStartEnvironmentProtos then
  for _sName, _tParams in pairs( GameDatabase.GetParkEnvironmentManagers() ) do
	Module.EnvironmentPrototype['Managers'][_sName] = _tParams
  end
end

if ((api.debug).IsDebugAllowed)() then
  ((Module.EnvironmentPrototype).Managers)["Managers.SceneryDebugManager"] = {}
end

(Mutators.VerifyEnvironmentPrototypeModule)(Module)

