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
	['aegis_system_process_postinit', 'aegis\functions\aegis_system_process_postinit.sqf'],
  ['aegis_system_process_preinit', 'aegis\functions\aegis_system_process_preinit.sqf'],
  ['aegis_system_database_connect', 'aegis\functions\aegis_system_database_connect.sqf'],
  ['aegis_util_log', 'aegis\functions\aegis_util_log.sqf']
];

call aegis_system_process_preinit;

true
