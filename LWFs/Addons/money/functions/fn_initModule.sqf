/*
	Function: LWFs_money_fnc_init
	Author: LWFs
	Module initialisation.

	Argument(s):
	None

	Return Value:
	None	

	Example:
	[] call LWFs_money_fnc_initModule;
__________________________________________________________________*/
if (!isNil "LWFs_money_moduleInit") exitWith {};
LWFs_money_moduleInit = true;

if (isServer) then {call LWFs_money_fnc_initServer};
if (hasInterface) then {call LWFs_money_fnc_initClient};