/*
O método utilizado aqui é um derivativo do método utilizado pelo time do Exile Mod.
Como se trata de uma trabalho derivativo, sua distribuição não é permitida.*/

private["_player","_playerID","_playerPos","_data","_extDB2Message"];
_player = _this;
_playerID = _player getVariable["AegisDatabaseID", -1];
_playerPos = getPosATL _player;
_data =
[
	_player getVariable ["ExileName",""],

	getDir _player,
	_playerPos select 0,
	_playerPos select 1,
	_playerPos select 2,

	assignedItems _player,
	backpack _player,
	(getItemCargo backpackContainer _player) call aegis_client_util_cargo_getMap,
	(backpackContainer _player) call aegis_client_util_cargo_getMagazineMap,
	(getWeaponCargo backpackContainer _player) call aegis_client_util_cargo_getMap,
	currentWeapon _player,
	goggles _player,
	handgunItems _player,
	handgunWeapon _player,
	headgear _player,
	binocular _player,
	_player call aegis_client_util_inventory_getLoadedMagazinesMap,
	primaryWeapon _player,
	primaryWeaponItems _player,
	secondaryWeapon _player,
	secondaryWeaponItems _player,
	uniform _player,
	(getItemCargo uniformContainer _player) call aegis_client_util_cargo_getMap,
	(uniformContainer _player) call aegis_client_util_cargo_getMagazineMap,
	(getWeaponCargo uniformContainer _player) call aegis_client_util_cargo_getMap,
	vest _player,
	(getItemCargo vestContainer _player) call aegis_client_util_cargo_getMap,
	(vestContainer _player) call aegis_client_util_cargo_getMagazineMap,
	(getWeaponCargo vestContainer _player) call aegis_client_util_cargo_getMap,
	_playerID
];
_extDB2Message = ["updatePlayer", _data] call ExileServer_util_extDB2_createMessage;
_extDB2Message call ExileServer_system_database_query_fireAndForget;
true
