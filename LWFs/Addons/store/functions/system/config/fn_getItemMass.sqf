/*
	Function: LWFs_store_getItemMass
	Author: ACE 3, LWFs
	Returns the mass of the item provided.
	
	Argument(s):
	0: Item Classname <STRING>
	
	Return Value:
	<NUMBER>
	
	Example:
	(primaryWeapon player) call LWFs_store_fnc_getItemMass;
__________________________________________________________________*/
private _totalMass = 0;

{
	_totalMass = _totalMass + getNumber ((call _x) >> "mass");
	true
} count [
	{configFile >> "CfgMagazines" >> _this},
	{configFile >> "CfgVehicles" >> _this},
	{configFile >> "CfgWeapons" >> _this >> "ItemInfo"},
	{configFile >> "CfgWeapons" >> _this >> "WeaponSlotsInfo"},
	{configFile >> "CfgGlasses" >> _this}
];

_totalMass 