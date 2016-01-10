/*
O método utilizado aqui é um derivativo do método utilizado pelo time do Exile Mod.
Como se trata de uma trabalho derivativo, sua distribuição não é permitida.*/

private["_MySql"];
"A missao esta carregando" call aegis_util_log;
finishMissionInit;
AegisSessionIDs = [];
"A missao carregou!" call aegis_util_log;

_MySql_connection = [] call aegis_system_database_connect;
if !(_MySql_connection) exitWith
{
	"extDB2" callExtension "9:SHUTDOWN";
	false
};
//addMissionEventHandler ["HandleDisconnect", { _this call aegis_system_network_event_onHandleDisconnect; }];
onPlayerConnected {[_uid, _name] call aegis_system_network_event_onPlayerConnected};
/*onPlayerDisconnected {[_uid, _name] call ExileServer_system_network_event_onPlayerDisconnected};
if !(getRemoteSensorsDisabled) then
{
	disableRemoteSensors true;
};
PublicServerIsLoaded = false;*/
