/*
	Function: LWFs_store_fnc_initModule;
	Author: LWFs
	Module initialisation.

	Argument(s):
	None

	Return Value:
	None

	Example:
	[] call LWFs_store_fnc_initModule;
__________________________________________________________________*/
if (!isNil "LWFs_store_moduleInit") exitWith {};
LWFs_store_moduleInit = true;

if (isServer) then {call LWFs_store_fnc_initServer};
if (hasInterface) then {call LWFs_store_fnc_initClient};