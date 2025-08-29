/*
	Function: LWFs_store_fnc_initServer
	Author: LWFs
	Server initialisation.

	Argument(s):
	0: None

	Return Value:
	None

	Example:
	[] call LWFs_store_fnc_initServer;
__________________________________________________________________*/
if (!isServer) exitWith {};
if (!isNil "LWFs_store_debug") exitWith {};

[
	["CfgLWFsStore"],
	"LWFs_store_",
	[
		["containerRadius", 10, {_this max 0}, true],
		["containerTypes", ["LandVehicle", "Air", "Ship"], {_this}, true],
		["currencySymbol", "¢", {_this}, true],
		["sellFactor", 1, {_this max 0 min 1}, true],
		["debug", 0, {_this isEqualTo 1}]
	]
] call LWFs_fnc_getModuleSettings;

missionNamespace setVariable ["LWFs_store_getNearbyVehicles", compileFinal '
	params [
		["_trader", objNull, [objNull]],
		["_types", ["LandVehicle", "Air", "Ship"], [[]]],
		["_radius", LWFs_store_containerRadius, [0]]
	];

	private _vehicles = nearestObjects [_trader, _types, _radius, true];
	_vehicles select {local _x && {abs speed _x < 1 && {alive _x && isNil {_x getVariable "LWFs_store_trader_type"}}}};
', true];