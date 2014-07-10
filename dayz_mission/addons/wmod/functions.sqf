fnc_wmod_weapon_mod = {
    private["_mod","_old","_new","_upg","_selected","_message","_wait","_waited","_inventory","_muzzles"];
    _mod = _this select 0;
    _old = _this select 1;
    _new = _this select 2;
    _upg = _this select 3;

    if(!(isNil "DZE_WEAPON_MOD_BUSY") && {DZE_WEAPON_MOD_BUSY}) exitWith {
        cutText["You are already modifying or just modified a weapon! Wait a few seconds and try again.","PLAIN DOWN"];
    };

    DZE_WEAPON_MOD_BUSY = true;

    call fnc_wmod_closeGearDisplay;

    if (call fnc_wmod_performAction && {_mod call fnc_wmod_hasWeaponModInventory}) then {
        _selected = ((currentWeapon player) == _old);
        player removeWeapon _old;
        player addWeapon _new;
        if(_selected) then {
            _muzzles = getArray(configFile >> "cfgWeapons" >> _new >> "muzzles");
           if ("this" != (_muzzles select 0)) then {
             player selectWeapon (_muzzles select 0);
           } else {
             player selectWeapon _new;
           };
        };

        if (_upg) then {
            _mod call fnc_wmod_remWeaponModInventory;
            _message = "Added %1 to %2!";
        } else {
            _mod call fnc_wmod_addWeaponModInventory;
            _message = "Removed %1 from %2!";
        };

        cutText[format[_message,_mod,getText(configFile >> "CfgWeapons" >> _old >> "displayName")],"PLAIN DOWN"];

        sleep 2;

        call fnc_wmod_closeGearDisplay;
        DZE_WEAPON_MOD_BUSY = false;

        _inventory = player getVariable["WeaponModInventory",[]];
        if((count _inventory) > 0) then {
            systemChat format["WARNING: Unused weapon mods %1 do not save after logout or server restart!",str (player getVariable["WeaponModInventory",[]])];
        };
    } else {
        cutText["Weapon modification interrupted!","PLAIN DOWN"];
    };

    DZE_WEAPON_MOD_BUSY = false;
};

fnc_wmod_closeGearDisplay = {
    private["_display"];
    disableSerialization;
    _display = findDisplay 106;
    if(!(isNull _display)) then {
        _display closeDisplay 0;
    };
};

fnc_wmod_loadClickActions = {
    private["_mod","_base","_upgrade"];
    {
        _mod     = _x select 0;
        _base    = _x select 1;
        _upgrade = _x select 2;
        DZE_CLICK_ACTIONS set [count DZE_CLICK_ACTIONS,[_base,   format["Add %1",   _mod],format["['%1','%2','%3',true]  spawn fnc_wmod_weapon_mod;",_mod,_base,_upgrade],"true"]];
        DZE_CLICK_ACTIONS set [count DZE_CLICK_ACTIONS,[_upgrade,format["Remove %1",_mod],format["['%1','%2','%3',false] spawn fnc_wmod_weapon_mod;",_mod,_upgrade,_base],"true"]];
    } forEach DZE_WEAPON_MODS;
};

fnc_wmod_performAction = {
    private["_dis","_sfx","_done","_doing","_started","_return"];
    _dis = 20;
    _sfx = "repair";
    [player,_sfx,0,false,_dis] call dayz_zombieSpeak;
    [player,_dis,true,(getPosATL player)] spawn player_alertZombies;
    r_interrupt = false;
    _done       = false;
    _started    = false;
    player playActionNow "Medic";
    while{!_done} do {
        _doing = ["medic",animationState player] call fnc_inString;
        if(_doing) then {
            _started = true;
        };
        if(_started && !_doing) then {
            _done   = true;
            _return = true;
        };
        if(r_interrupt) then {
            player switchMove "";
            player playActionNow "stop";
            _done   = true;
            _return = false;
        };
        sleep 0.3;
    };
    _return
};

fnc_wmod_hasWeaponModInventory = {
    private["_inventory","_mod"];
    _mod = _this;
    _inventory = player getVariable["WeaponModInventory",[]];
    ((_mod in _inventory) || ((getPlayerUID player) in DZE_WEAPON_MOD_ADMINS))
};

fnc_wmod_addWeaponModInventory = {
    private["_inventory","_mod"];
    _mod = _this;
    _inventory = player getVariable["WeaponModInventory",[]];
    player setVariable ["WeaponModInventory",_inventory + [_mod],true];
};

fnc_wmod_remWeaponModInventory = {
    private["_inventory","_mod"];
    _mod = _this;
    _inventory = player getVariable["WeaponModInventory",[]];
    {
        if(_x == _mod) exitWith {
            _inventory set [_forEachIndex,"nil"];
        };
    } forEach _inventory;
    player setVariable ["WeaponModInventory",_inventory - ["nil"],true];
};