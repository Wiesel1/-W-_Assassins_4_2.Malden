
enableSaving [false, false];

diag_log format ["###### %1 ######", missionName];
enableSaving [false,false];
setTerrainGrid 12.5;
setViewDistance 1500;
acreInc = isClass(configFile/"CfgPatches"/"acre_main");
tfarInc = isClass(configFile/"CfgPatches"/"task_force_radio");
#include "scripts\init_s.sqf";
#include "scripts\elec_HC_detect.sqf";
waitUntil{!IsNil "HCistfertig"};

[] execVM "scripts\Parametrit.sqf";
[] execVM "scripts\randomWeather.sqf";



//[] execVM "eos\OpenMe.sqf";
[] execVM "eos1\ini.sqf";


fn_getBuildingstospawnLoot = compile preProcessFileLineNumbers "loot\fn_LSgetBuildingstospawnLoot.sqf"; 
LSdeleter = compile preProcessFileLineNumbers "loot\LSdeleter.sqf";





if (isServer) then {
	[
	1000, // seconds to delete dead bodies (0 means don't delete) 
	0, // seconds to delete dead vehicles (0 means don't delete)
	0, // seconds to delete immobile vehicles (0 means don't delete)
	0, // seconds to delete dropped weapons (0 means don't delete)
	0, // seconds to deleted planted explosives (0 means don't delete)
	0 // seconds to delete dropped smokes/chemlights (0 means don't delete)
	] execVM "scripts\repetitive_cleanup.sqf";
};


//ll = execVM "=BTC=_logistic\log_init.sqf";
waitUntil{!(isNil "BIS_fnc_init")};
waitUntil {!isNull player};
waitUntil{player == player};

call compile preprocessFileLineNumbers "scripts\wie_h.sqf";
if (true) exitWith {};
