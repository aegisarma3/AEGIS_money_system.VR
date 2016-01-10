/*
O método utilizado aqui é um derivativo do método utilizado pelo time do Exile Mod.
Como se trata de uma trabalho derivativo, sua distribuição não é permitida.*/

private["_isKnownAccount"];
_uid = _this select 0;
_name = _this select 1;
if !(_uid in ["", "__SERVER__", "__HEADLESS__"]) then
{
	format["O Jogador %1 (UID %2) conectou!", _name, _uid] call aegis_util_log;
	_isKnownAccount = format["isKnownAccount:%1", _uid] call aegis_system_database_query_selectSingleField;
	format["O jogador já existe no banco de dados? -> %1", _isKnownAccount] call aegis_util_log;
	if (_isKnownAccount) then
	{
		format["startAccountSession:%1:%2", _uid, _name] call aegis_system_database_query_fireAndForget;
	}
	else
	{
		format["createAccount:%1:%2", _uid, _name] call aegis_system_database_query_fireAndForget;
	};
};
true
