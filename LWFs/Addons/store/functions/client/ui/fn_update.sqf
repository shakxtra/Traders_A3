/*
	Function: LWFs_store_fnc_update
	Author: LWFs
	Flag the store dialog to update.

	Argument(s):
	0: Buyer <OBJECT>
	1: Trader <OBJECT>
	2: Item category to update 	<STRING>

	Return Value:
	None

	Example:
	[] call LWFs_store_fnc_update;
__________________________________________________________________*/
if (hasInterface) then {
	LWFs_store_updated = true;
};
