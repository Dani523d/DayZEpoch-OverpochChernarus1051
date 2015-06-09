//Overpoch on (modifies loot and traders to seel/spawn overwatch items)
Overpoch = true;

/*	
	For DayZ Epoch
	Addons Credits: Jetski Yanahui by Kol9yN, Zakat, Gerasimow9, YuraPetrov, zGuba, A.Karagod, IceBreakr, Sahbazz
*/

startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance =	11;					//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio false;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

// DayZ Epoch config
spawnShoremode = 1; // Default = 1 (on shore)
spawnArea= 1500; // Default = 1500
//Config based traders
DZE_ConfigTrader = true;
MaxVehicleLimit = 100; // Default = 50
MaxDynamicDebris = 200; // Default = 100
dayz_MapArea = 14000; // Default = 10000
dayz_maxLocalZombies = 30; // Default = 30 

dayz_paraSpawn = false;

dayz_minpos = -1; 
dayz_maxpos = 16000;

dayz_sellDistance_vehicle = 10;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;

dayz_maxAnimals = 5; // Default: 8
dayz_tameDogs = true;
DynamicVehicleDamageLow = 0; // Default: 0
DynamicVehicleDamageHigh = 100; // Default: 100

DZE_BuildOnRoads = true; // Default: False

EpochEvents = [["any","any","any","any",30,"crash_spawner"],["any","any","any","any",0,"crash_spawner"],["any","any","any","any",15,"supply_drop"]];
dayz_fullMoonNights = true;

//Load in compiled functions
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";				//Compile regular functions
//### BEGIN MODIFIED CODE: deployable bike
call compile preprocessFileLineNumbers "addons\bike\init.sqf";
//### END MODIFIED CODE: deployable bike
progressLoadingScreen 0.5;
if(Overpoch)then{
call compile preprocessFileLineNumbers "server_traders_overpoch.sqf";				//Compile trader configs
}else{
call compile preprocessFileLineNumbers "server_traders_epoch.sqf";
};
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
if(Overpoch)then{
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle_overpoch.sqf";
}else{
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";
};
	//Compile vehicle configs
	
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
	
	//anti Hack
	//### BEGIN MODIFIED CODE: infistar - disable default antihack
	//[] execVM "\z\addons\dayz_code\system\antihack.sqf";
	//### END MODIFIED CODE: infistar - disable default antihack

	//Lights
	//### BEGIN MODIFIED CODE: night lighting
	//if(DZE_NIGHT_LIGHTS) then {[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";};
	//### END MODIFIED CODE: night lighting
	
};

#include "\z\addons\dayz_code\system\REsec.sqf"

//Start Dynamic Weather
execVM "\z\addons\dayz_code\external\DynamicWeatherEffects.sqf";


#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"

//### BEGIN INSERTED CODE: load addons 

// config
call compile preprocessFileLineNumbers "config.sqf";

// suicide
call compile preprocessFileLineNumbers "addons\suicide\init.sqf";

// take clothes
call compile preprocessFileLineNumbers "addons\takeclothes\init.sqf";

// extra buildings
call compile preprocessFileLineNumbers "addons\buildings\init.sqf";

// safezones
//call compile preprocessFileLineNumbers "addons\safezones\init.sqf";
call compile preprocessFileLineNumbers "addons\safezones\SafeZone.sqf";

// plotbuff - zombie removal
call compile preprocessFileLineNumbers "addons\plotbuff\init.sqf";

// weapon mod
call compile preprocessFileLineNumbers "addons\wmod\init.sqf";

// snap build
call compile preprocessFileLineNumbers "custom\compiles.sqf";

// loot spawn adjustments
call compile preprocessFileLineNumbers "overwrites\lootspawn\init.sqf";

// fast trading
call compile preprocessFileLineNumbers "overwrites\fast_trading\init.sqf";

// slow zombies
call compile preprocessFileLineNumbers "overwrites\slow_zombies\init.sqf";

// service point
if(!isServer) then {execVM "addons\service_point\service_point.sqf";};

// night lights
if(DZE_NIGHT_LIGHTS) then {[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";};

execVM "addons\R3F_ARTY_AND_LOG\init.sqf";

//spawn chooser
espawn = compile preprocessFileLineNumbers "spawn\spawn.sqf";
waitUntil {!isNil "dayzPlayerLogin"};
waitUntil {count dayzPlayerLogin > 0};
if ((!isDedicated) && (dayzPlayerLogin select 4)) then {call espawn;};

//### END INSERTED CODE: load addons