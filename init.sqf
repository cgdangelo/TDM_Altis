if (!(isServer)) then {
	waitUntil {!(isNull player)};
};

setTerraingrid 50;

[] execVM "heli.sqf";
[] execVM "lights.sqf";
[] execVM "arty.sqf";
[] execVM "fixDate.sqf";
[] execVM "clearCorpses.sqf";