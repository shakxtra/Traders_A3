/*
	Function: LWFs_store_fnc_updateStock
	Author: LWFs
	Updates a store's stock for the desired item.

	Argument(s):
	0: Trader <OBJECT>
	1: Item classname <STRING>
	2: Stock change <NUMBER>

	Return Value:
	None

	Example:
	[ammo1, "ItemMap", 1] call LWFs_store_fnc_updateStock;
__________________________________________________________________*/
params [
	["_trader", objNull, [objNull]],
	["_classname", "", [""]],
	["_amount", 0, [0]]
];

private _stockAdded = [_trader, _classname, _amount] call LWFs_store_fnc_setTraderStock;
if (_stockAdded) then {
	// Fetch all players using the store
	private _players = allPlayers select {(_x getVariable ["LWFs_store_trader_current", objNull]) isEqualTo _trader} apply {owner _x};

	[] remoteExecCall ["LWFs_store_fnc_update", _players, false];
};
