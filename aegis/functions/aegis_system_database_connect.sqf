/*
O método utilizado aqui é um derivativo do método utilizado pelo time do Exile Mod.
Como se trata de uma trabalho derivativo, sua distribuição não é permitida.*/

private["_isConnected","_result"];
_isConnected = false;
AegisDatabaseSessionId = "";
AegisRconSessionID = "";
try
{
	_result = "extDB2" callExtension "9:VERSION";
	if (_result isEqualTo "") then
	{
		throw "Foi Impossivel achar a extensao extDB2!";
	};
	if (parseNumber _result < 70) then
	{
		throw "Atualize o extDB2 para a versao 70 ou superior";
	};
	format ["Versao do extDB2: %1", _result] call aegis_util_log;
	_result = call compile ("extDB2" callExtension "9:ADD_DATABASE:aegis_data");
	if (_result select 0 isEqualTo 0) then
	{
		throw format ["Nao foi possivel conectar ao banco de dados: %1", _result];
	};
	"Conectado no banco de dados!" call aegis_util_log;
	AegisDatabaseSessionId = str(round(random(999999)));
	_result = call compile ("extDB2" callExtension format["9:ADD_DATABASE_PROTOCOL:aegis_data:SQL_CUSTOM_V2:%1:aegiscustom", AegisDatabaseSessionId]);

	if ((_result select 0) isEqualTo 0) then
	{
		throw format ["Falha na inicializacao do protocolo de banco de dados: %1", _result];
	};
	AegisStartTime = (call compile ("extDB2" callExtension "9:LOCAL_TIME")) select 1;
	"Protocolo do banco de dados inicializado!" call aegis_util_log;
	"extDB2" callExtension "9:LOCK";
	_isConnected = true;
}
catch
{
	"Erro de conexao com o MySQL!" call aegis_util_log;
	"Verifique a pasta @extDB2/extDB/logs/ para ver o que deu errado." call aegis_util_log;
	format ["Erro do MySQL: %1", _exception]  call aegis_util_log;
	"O server ira desligar agora." call aegis_util_log;
	"extDB2" callExtension "9:SHUTDOWN";
};
_isConnected
