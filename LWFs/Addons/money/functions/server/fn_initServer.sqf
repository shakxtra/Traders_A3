/*
	Function: LWFs_money_fnc_initServer
	Author: LWFs
	Server initialisation.

	Arguments(s):
	0: None

	Return Value:
	None

	Example:
	[] call LWFs_money_fnc_initServer;
__________________________________________________________________*/
if (!isServer) exitWith {};
if (!isNil "LWFs_money_debug") exitWith {};

[
	["CfgLWFsMoney"],
	"LWFs_money_",
	[
		["startingFunds", 50000, {_this max 0}, true], /*Define la cantidad de dinero con la que inicia el personaje o player*/
		["oldManItemsPrice", [50, 150, 300, 600], {_this apply {_x max 0}}, true],
		["debug", 0, {_this isEqualTo 1}]
	]
] call LWFs_fnc_getModuleSettings;
