fnc_can_do = {
    private["_onLadder"];
    _onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
    (!r_drag_sqf and !r_player_unconscious and !_onLadder)
};

fnc_bike_crafting_animation = {
    private["_dis","_sfx","_isLoopDone","_isAnimationStarted","_isAnimationCompleted","_animationState","_isAnimationActive","_exitWith"];

    _dis=10;
    _sfx = "repair";
    [player,_sfx,0,false,_dis] call dayz_zombieSpeak;
    [player,_dis,true,(getPosATL player)] spawn player_alertZombies;

    player playActionNow "Medic";
    r_interrupt = false;
    _isLoopDone = false;
    _isAnimationStarted = false;
    _isAnimationCompleted = false;
    _animationState = animationState player;
    _isAnimationActive = false;
    _exitWith = "nil";

    while {!_isLoopDone} do {
        _animationState = animationState player;
        _isAnimationActive = ["medic",_animationState] call fnc_inString;
        if (_isAnimationActive) then {
            _isAnimationStarted = true;
        };
        if (_isAnimationStarted and !_isAnimationActive) then {
            _isLoopDone = true;
            _isAnimationCompleted = true;
        };
        {
            if(call (_x select 0)) then {
                _exitWith = _x select 1;
            };
        } forEach _this;
        if (_exitWith != "nil") then {
            _isLoopDone = true;
            player switchMove "";
            player playActionNow "stop";
        };
        sleep 0.3;
    };
    _exitWith
};