if !(isServer) exitWith {};

_heliMinDelay = 30;
_heliMaxDelay = 120;
    
spawnChopper = {
    _aoCenter = position Center;
    _aoSize = 150;     
    _heliPause = 5;
    _heliHeight = 800;
    _heliPlummetVelocity = -225;
    _heliDuration = 30;
    _heliAdjustedDuration = _heliDuration + (abs (_heliHeight / _heliPlummetVelocity));

    _heliPos = [_aoCenter, _aoSize] call CBA_fnc_randPos;
    _heli = [
        [_heliPos select 0, _heliPos select 1, _heliHeight],
        180,
        "I_Heli_Transport_02_F",
        EAST
    ] call BIS_fnc_spawnVehicle select 0;

    sleep _heliPause;

    _heli setVelocity [0, 0, _heliPlummetVelocity];

    sleep _heliAdjustedDuration;
    
    deleteVehicle _heli;
};

while {not (isNull Center)} do 
{
    _heliDelay = [_heliMinDelay, _heliMaxDelay] call BIS_fnc_randomNum;
    sleep _heliDelay;
    
    [] spawn { call spawnChopper; };
    [] spawn { call spawnChopper; };
    [] spawn { call spawnChopper; };
    [] spawn { call spawnChopper; };
    [] spawn { call spawnChopper; };
    [] spawn { call spawnChopper; };
    [] spawn { call spawnChopper; };
    [] spawn { call spawnChopper; };
    [] spawn { call spawnChopper; };
    [] spawn { call spawnChopper; };
};