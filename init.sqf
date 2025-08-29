// This is for the demo mission
if (!isDedicated) then {
	// INDICA LA CANTIDAD DE DINERO QUE RECIBES AL INICIAR MISION
	[player, 10000] call LWFs_money_fnc_addFunds;
};

private _trader1 = trader1;
if (isServer) then {
	[_trader1, "weapon"] call LWFs_store_fnc_addTrader; 
	
	_trader1 enableSimulationGlobal false; 
	_trader1 allowDamage false; 
	_trader1 setUnitLoadout [

	];   

	[_trader1, "GUARD", "ASIS"] remoteExecCall ["BIS_fnc_ambientAnim", 0, true];
};

private _trader2 = trader2;
if (isServer) then {
	[_trader2, "navigation"] call LWFs_store_fnc_addTrader; 
	_trader2 enableSimulationGlobal false; 
	_trader2 allowDamage false;
	_trader2 setCaptive true;

	[_trader2, "GUARD", "ASIS"] remoteExecCall ["BIS_fnc_ambientAnim", 0, true];
};