local global = _G
local api    = global.api
local require = global.require
local module = global.module
local type = global.type
local pairs = global.pairs
local loadfile = global.loadfile
local Main = require("Database.Main")
local GameDatabase = require("Database.GameDatabase")
local Mutators = require("Environment.ModuleMutators")
local Module = module(..., Mutators.EnvironmentPrototype)

Module.EnvironmentPrototype = {
	SearchPaths = {"Managers"},
	Managers = {
		["Managers.NextWorldDataManager"] = {},
		["Managers.ParkLoadSaveManager"] = {},
		["UI.Managers.CPTUIManager"] = {},
		["Managers.LocaleLinksManager"] = {},
		["Managers.WebServerNotificationManager"] = {}
	}
}

-- Merge default protos with ACSE collected protos
if GameDatabase.GetStartEnvironmentProtos then
  for _sName, _tParams in pairs( GameDatabase.GetStartEnvironmentManagers() ) do
	Module.EnvironmentPrototype['Managers'][_sName] = _tParams
  end
end

(Mutators.VerifyEnvironmentPrototypeModule)(Module)

