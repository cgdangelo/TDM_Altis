waitUntil {!isNull player};       //to prevent MP / JIP issues

_unit = _this select 0;
removeallweapons _unit;
removeallassigneditems _unit;
removeallcontainers _unit;

_unit addbackpack "B_Kitbag_Base"; 
_unit adduniform "U_I_CombatUniform_shortsleeve"; 
_unit addvest "V_Chestrig_oli"; 
_unit addheadgear "H_Booniehat_indp"; 
_unit addmagazines ["UGL_FlareWhite_F", 3];
_unit addmagazines ["HandGrenade", 2];
_unit addmagazines ["30Rnd_65x39_caseless_mag_Tracer", 8];
_unit addmagazines ["30Rnd_65x39_caseless_mag_Tracer", 6];      //<- it is addmagazines ["string", number] or addmagazine "string"!
_unit addweapon "arifle_MX_GL_F";  
_unit addPrimaryWeaponItem "optic_Holosight"; 
_unit addPrimaryWeaponItem "acc_flashlight"; 
_unit addWeapon "hgun_Pistol_heavy_01_F";
_unit addmagazines ["11Rnd_45ACP_Mag", 8];

if(true) exitWith{};