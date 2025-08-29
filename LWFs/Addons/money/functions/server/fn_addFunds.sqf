/*
	Function: LWFs_money_fnc_addFunds
	Author: LWFs

	Arguments(s):
	0: Unit <OBJECT>
	1: Funds <NUMBER>

	Return Value:
	None

	Example:
	[player, 100] call LWFs_money_fnc_addFunds;
__________________________________________________________________*/
params [
	["_unit", objNull, [objNull]],
	["_funds", 0, [0]]
];

if (!local _unit) exitWith {
	[_unit, _funds] remoteExec ["LWFs_money_fnc_addFunds", _unit, false]
};

_unit setVariable ["LWFs_money_funds", ((_unit getVariable ["LWFs_money_funds", 0]) + _funds) max 0, true];
