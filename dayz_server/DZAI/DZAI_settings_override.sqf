DZAI_weaponNoise = true;
DZAI_humanityGain = -50;
DZAI_clientRadio = true;
DZAI_zombieEnemy = true;
DZAI_maxHeliPatrols = 6;
DZAI_heliList = [["UH1H_DZ",1]];
{
    DZAI_heliList set [count DZAI_heliList,[_x,1]];
} forEach ["GNT_C185","GNT_C185F","GNT_C185R","GNT_C185E","GNT_C185C","GNT_C185T","GNT_C185U","AN2_DZ","BAF_Merlin_DZE","CSJ_GyroC","CSJ_GyroP","CSJ_GyroCover","Ka137_PMC"];
DZAI_maxLandPatrols = 15;
{
    DZAI_vehList set [count DZAI_vehList,[_x,1]];
} forEach ["Tractor","policecar","car_sedan","HMMWV","UAZ_CDF","Ural_CDF","UralOpen_CDF","UAZ_RU","Skoda","BRDM2_Gue","SkodaBlue","SkodaRed","SkodaGreen","Pickup_PK_GUE","Pickup_PK_INS","Offroad_DSHKM_Gue","Offroad_SPG9_Gue","SUV_Camo","SUV_Blue","SUV_Red","SUV_Green","SUV_Yellow","SUV_White","SUV_Pink","SUV_Charcoal","SUV_Silver","SUV_TK_CIV_EP1_DZE1"];
DZAI_vehGunnerUnits = 0;
//DZAI_vehCargoUnits = 1;
DZAI_vehUnitLevel = 1;
DZAI_dynAISpawns = false;