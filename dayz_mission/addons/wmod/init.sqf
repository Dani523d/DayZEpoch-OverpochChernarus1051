if(isServer) exitWith {};

diag_log text "WMOD: loading...";
call compile preprocessFileLineNumbers "addons\wmod\config.sqf";
call compile preprocessFileLineNumbers "addons\wmod\functions.sqf";
call compile preprocessFileLineNumbers "overwrites\click_actions\init.sqf";
if (!(isServer) && {isNil "DZE_CLICK_ACTIONS_BUILD"}) exitWith {
    diag_log text "WMOD: ERROR -- Click Actions Handler missing!";
};
if (!(isServer) && {DZE_CLICK_ACTIONS_BUILD != DZE_CRV_DEPLOYABLE}) exitWith {
    diag_log text format["WMOD: ERROR -- Click Actions Handler loaded build #%1! Required build #%2!",DZE_CLICK_ACTIONS_BUILD,DZE_CRV_DEPLOYABLE];
};
call fnc_wmod_loadClickActions;