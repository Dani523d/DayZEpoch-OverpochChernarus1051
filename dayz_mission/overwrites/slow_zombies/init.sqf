if(!isDedicated) then {
    diag_log text "SLOW ZOMBIES: loading slow zombies...";
    zombie_generate = compile preprocessFileLineNumbers "overwrites\slow_zombies\zombie_generate.sqf";
    wild_spawnZombies = compile preprocessFileLineNumbers "overwrites\slow_zombies\wild_spawnZombies.sqf";
};