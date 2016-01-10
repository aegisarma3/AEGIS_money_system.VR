/**
 * ExileServer_system_database_query_selectSingleField
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private["_parameters","_query","_result"];
_parameters = _this;
_query = [0, AegisDatabaseSessionId, _parameters] joinString ":";
_result = call compile ("extDB2" callExtension _query);
format["Busca: %1", _result] call aegis_util_log;
switch (_result select 0) do
{
	case 0:
	{
		(format["Erro no banco de dados: %1", (_result select 1)]) call aegis_util_log;
	};
	case 2:
	{
		_result = (_result select 1) call aegis_system_database_handleBig;
	};
};
((_result select 1) select 0) select 0
