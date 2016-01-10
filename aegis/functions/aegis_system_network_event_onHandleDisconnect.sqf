/*
O método utilizado aqui é um derivativo do método utilizado pelo time do Exile Mod.
Como se trata de uma trabalho derivativo, sua distribuição não é permitida.*/

private["_unit","_id","_pos","_sessionID"];
_unit = _this select 0;
_id = _this select 1;
_uid = _this select 2;
_name = _this select 3;
_pos = getPos _unit;

if !(_uid in ["", "__SERVER__", "__HEADLESS__"]) then
{
	format["endAccountSession:%1", _uid] call aegis_system_database_query_fireAndForget;
	_sessionID = _unit getVariable ["AegisSessionID", ""];
	_sessionID call aegis_system_session_end;
	_unit setVariable ["AegisSessionID", nil];

	_unit call aegis_object_player_database_update;
	deleteVehicle _unit;

};
false
