/*
O método utilizado aqui é um derivativo do método utilizado pelo time do Exile Mod.
Como se trata de uma trabalho derivativo, sua distribuição não é permitida.*/

 if (!isServer) exitWith {};

private ['_code', '_function', '_file'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;
    _code = compileFinal (preprocessFileLineNumbers _file);

    missionNamespace setVariable [_function, _code];
}
forEach
[
  ['aegis_object_civilian_eventhandler', 'aegis\functions\aegis_object_civilian_eventhandler.sqf'],
  ['aegis_system_database_connect', 'aegis\functions\aegis_system_database_connect.sqf'],
  ['aegis_system_database_handleBig', 'aegis\functions\aegis_system_database_handleBig.sqf'],
  ['aegis_system_database_query_fireAndForget', 'aegis\functions\aegis_system_database_query_fireAndForget.sqf'],
  ['aegis_system_database_query_selectSingleField', 'aegis\functions\aegis_system_database_query_selectSingleField.sqf'],
  ['aegis_system_network_event_onHandleDisconnect', 'aegis\functions\aegis_system_network_event_onHandleDisconnect.sqf'],
  ['aegis_system_network_event_onPlayerConnected', 'aegis\functions\aegis_system_network_event_onPlayerConnected.sqf'],
  ['aegis_system_network_event_onPlayerDisconnected', 'aegis\functions\aegis_system_network_event_onPlayerDisconnected.sqf'],
  ['aegis_system_process_preinit', 'aegis\functions\aegis_system_process_preinit.sqf'],
	['aegis_system_process_postinit', 'aegis\functions\aegis_system_process_postinit.sqf'],
  ['aegis_util_log', 'aegis\functions\aegis_util_log.sqf']
];

call aegis_system_process_preinit;

true
