/*
O método utilizado aqui é um derivativo do método utilizado pelo time do Exile Mod.
Como se trata de uma trabalho derivativo, sua distribuição não é permitida.*/

private["_log"];
_log = format["AEGIS - %1", _this];
if(isNil "MAR_fnc_log")then
{
	diag_log _log;
}
else
{
	[_log,"info"] call MAR_fnc_log;
		diag_log _log;
};
true
