if(isDedicated) exitWith {};
diag_log text "LOOTSPAWN: initializing...";
call compile preprocessFileLineNumbers "overwrites\lootspawn\config.sqf";
diag_log text "LOOTSPAWN: overwriting spawn check...";
player_spawnCheck = compile preprocessFileLineNumbers "overwrites\lootspawn\player_spawnCheck.sqf";