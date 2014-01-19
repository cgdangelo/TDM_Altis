_lamps = (
            ((getMarkerPos "LIGHTSOURCE") nearObjects ["Land_LampHarbour_F",500])
          + ((getMarkerPos "LIGHTSOURCE") nearObjects ["Land_LampShabby_F",500])
          + ((getMarkerPos "LIGHTSOURCE") nearObjects ["Land_LampStreet_small_F",500])
          + ((getMarkerPos "LIGHTSOURCE") nearObjects ["Land_LampStreet_F",500])
          + ((getMarkerPos "LIGHTSOURCE") nearObjects ["Land_PowerPoleWooden_L_F",500])
          + ((getMarkerPos "LIGHTSOURCE") nearObjects ["Land_LampHalogen_F",500]) 
          + ((getMarkerPos "LIGHTSOURCE") nearObjects ["Land_LampDecor_F",500])
          + ((getMarkerPos "LIGHTSOURCE") nearObjects ["Land_LampSolar_F",500])
          + ((getMarkerPos "LIGHTSOURCE") nearObjects ["Land_LampAirport_F",500])
);

{_x setDamage 0.92} foreach _lamps;

_lightDuration = 10;
_lightMinDelay = 30;
_lightMaxDelay = 120;
_lightBrightness = 5;
_lightIntensity = 1000;
_lightFadeStep = ceil (_lightIntensity / (_lightDuration * 60));

if (isNil "nightLight") then
{
    //nightLight = createVehicleLocal ["#lightpoint", position Center, [], 0, "FLY"];
    nightLight = "#lightpoint" createVehicleLocal position Center;
    nightLight setLightBrightness _lightBrightness;
    nightLight lightAttachObject [Center, [0, 0, 50]];
    
    if (isServer) then
    {
        publicVariable "nightLight";
    };
};

if (isServer) then
{
    while {not (isNull Center)} do
    {
        _lightDelay = [_lightMinDelay, _lightMaxDelay] call BIS_fnc_randomNum;
        sleep _lightDelay;

        _lightColor = [
            [0, 255] call BIS_fnc_randomNum,
            [0, 255] call BIS_fnc_randomNum,
            [0, 255] call BIS_fnc_randomNum
        ];
        nightLight setLightAmbient _lightColor;
        nightLight setLightColor _lightColor;
        nightLight setLightIntensity _lightIntensity;

        currentLightIntensity = _lightIntensity;
        while {currentLightIntensity > 0} do
        {
            currentLightIntensity = currentLightIntensity - _lightFadeStep;
            nightLight setLightIntensity currentLightIntensity;
            sleep ((_lightFadeStep / _lightDuration) * (1/60));
        };
    };
};