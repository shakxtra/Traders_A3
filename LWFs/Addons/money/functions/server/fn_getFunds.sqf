/*
	Function: LWFs_money_fnc_getFunds
	Author: LWFs

	Arguments(s):
	0: Unit <OBJECT>

	Return Value:
	Funds <NUMBER>

	Example:
	[] call LWFs_money_fnc_getFunds;
__________________________________________________________________*/
params [
	["_unit", objNull, [objNull]]
];

(_unit getVariable ["LWFs_money_funds", 0])
