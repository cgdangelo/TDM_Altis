if !(isServer) exitWith {};

_aoCenter = position Center; 
_aoSize = 150;

_minSalvoDelay = 15;
_maxSalvoDelay = 60;
_salvoShotDelay = 5;

_artyTypes = [
    "Sh_82mm_AMOS", "Sh_120mm_HE", "Sh_120mm_HE_Tracer_Red",
    "Sh_82mm_AMOS", "Sh_120mm_HE", "Sh_120mm_HE_Tracer_Red",
    "Sh_82mm_AMOS", "Sh_120mm_HE", "Sh_120mm_HE_Tracer_Red",
    "Sh_82mm_AMOS", "Sh_120mm_HE", "Sh_120mm_HE_Tracer_Red",
    "Sh_82mm_AMOS", "Sh_120mm_HE", "Sh_120mm_HE_Tracer_Red",
    "Sh_82mm_AMOS", "Sh_120mm_HE", "Sh_120mm_HE_Tracer_Red",
    "Sh_82mm_AMOS", "Sh_120mm_HE", "Sh_120mm_HE_Tracer_Red",

    // Big motherfuckers
    "Sh_155mm_AMOS", "Sh_155mm_AMOS", "Sh_155mm_AMOS", "Sh_155mm_AMOS",
    "Sh_155mm_AMOS", "Sh_155mm_AMOS", "Sh_155mm_AMOS", "Sh_155mm_AMOS",

    // Lots of big motherfuckers
    "Cluster_155mm_AMOS", "Cluster_155mm_AMOS",

    // Big motherfucking bombs
    "Bo_GBU12_LGB_MI10", "Bo_Mk82", "Bo_Mk82_MI08",

    // Biggest motherfucker
    "R_230mm_HE", "R_230mm_HE"
];

while {not (isNull Center)} do 
{    
    _salvoDelay = [_minSalvoDelay, _maxSalvoDelay] call BIS_fnc_randomNum;
    sleep _salvoDelay;

    for "_i" from 1 to 5 do
    {
        private ["_strikeLocation", "_strikeVehicle"];
        _strikeLocation = [_aoCenter, _aoSize] call CBA_fnc_randPos;
        _strikeVehicle = createVehicle [
            _artyTypes call BIS_fnc_selectRandom,
            [_strikeLocation select 0, _strikeLocation select 1, 250],
			[],
			0,
			"CAN_COLLIDE"
        ];
        _strikeVehicle setVectorUp [0, -90, -1];
        _strikeVehicle setVelocity [0, 0, -10];

        sleep _salvoShotDelay;
    };
};