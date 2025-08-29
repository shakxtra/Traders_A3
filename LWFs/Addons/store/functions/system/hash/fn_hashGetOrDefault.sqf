/*
	Function: LWFs_store_fnc_hashGetOrDefault
	Author: LWFs
	

	Argument(s):
	0: None

	Return Value:
	None

	Example:
	[] call LWFs_store_fnc_hashGetOrDefault;
__________________________________________________________________*/
params ["_c", "_k", "_default"];
	
if (_k isEqualTo "") exitWith {_default};

private _val = [_c, _k] call LWFs_store_fnc_hashGet;

if (isNil "_val") then {_default} else {_val}