private ["_aU", "_dU"];
_aU = allUnits;

while {true} do {
    sleep 60;
    { deleteVehicle _x } forEach allDead;
};