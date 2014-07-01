if (isDedicated || isNil "DZE_FAST_TRADING" || !DZE_FAST_TRADING) exitWith {};
diag_log text "FAST TRADING: loading...";
if(DZE_ConfigTrader) then {
    diag_log text "FAST TRADING: loading config based trader file...";
    call compile preprocessFileLineNumbers "overwrites\fast_trading\player_traderMenuConfig.sqf";
} else {
    diag_log text "FAST TRADING: loading database trader file...";
    call compile preprocessFileLineNumbers "overwrites\fast_trading\player_traderMenuHive.sqf";
};