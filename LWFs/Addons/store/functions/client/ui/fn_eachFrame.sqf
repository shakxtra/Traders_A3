/*
	Function: LWFs_store_fnc_eachFrame
	Author: LWFs
	Periodically checks if the player's money or items have changed.

	Argument(s):
	0: None

	Return Value:
	None

	Example:
	[] call LWFs_store_fnc_eachFrame;
__________________________________________________________________*/
if (!hasInterface) exitWith {};
if (!isNil {missionNamespace getVariable "#LWFs_store_money"}) exitWith {};

missionNamespace setVariable ["LWFs_store_updated", false];
missionNamespace setVariable ["#LWFs_store_money", [player] call LWFs_money_fnc_getFunds];
missionNamespace setVariable ["#LWFs_store_containers", [uniform player, vest player, backpack player]];
missionNamespace setVariable ["#LWFs_store_nextUpdateTick", diag_tickTime];

addMissionEventHandler ["EachFrame", {
	if (isNull (uiNamespace getVariable ["LWFs_store_display", displayNull])) exitWith {
		{missionNamespace setVariable [_x, nil]} forEach ["#LWFs_store_nextUpdateTick", "LWFs_store_updated", "#LWFs_store_containers", "#LWFs_store_money"];
		
		removeMissionEventHandler ["EachFrame", _thisEventHandler];
	};

	if (LWFs_store_updated) then {
		["update"] call  LWFs_store_fnc_main;
		
		missionNamespace setVariable ["#LWFs_store_money", [player] call LWFs_money_fnc_getFunds];
		missionNamespace setVariable ["#LWFs_store_containers", [uniform player, vest player, backpack player]];
		LWFs_store_updated = false;
	};

	if (diag_tickTime > missionNamespace getVariable ["#LWFs_store_nextUpdateTick", diag_tickTime]) then {
		_containers = [uniform player, vest player, backpack player];
		_oldContainers = missionNamespace getVariable ["#LWFs_store_containers", []];
		
		_money = [player] call LWFs_money_fnc_getFunds;
		_oldMoney = missionNamespace getVariable ["#LWFs_store_money", [player] call LWFs_money_fnc_getFunds];

		if (_money != _oldMoney) then {
			missionNamespace setVariable ["#LWFs_store_money", _money];
			LWFs_store_updated = true;
		};

		if !(_containers isEqualTo _oldContainers) then {
			missionNamespace setVariable ["#LWFs_store_containers", _containers];
			LWFs_store_updated = true;
		};

		missionNamespace setVariable ["#LWFs_store_nextUpdateTick", diag_tickTime + 0.25];
	};
}];