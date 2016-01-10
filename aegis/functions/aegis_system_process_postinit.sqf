/*
O método utilizado aqui é um derivativo do método utilizado pelo time do Exile Mod.
Como se trata de uma trabalho derivativo, sua distribuição não é permitida.*/

if (!isNil "PublicServerVersion") then
{
	call ExileClient_system_map_initialize;
	call ExileServer_system_thread_initialize;
	call ExileServer_system_playerSaveQueue_initialize;
	call ExileServer_system_swapOwnershipQueue_initialize;
	call ExileServer_system_vehicleSaveQueue_initialize;
	call ExileServer_system_simulationMonitor_initialize;
	call ExileServer_system_lootManager_initialize;
	call ExileServer_system_weather_initialize;
	call ExileServer_system_garbageCollector_cleanDatabase;
	call ExileServer_world_initialize;
	call ExileServer_system_event_initialize;
	PublicServerIsLoaded = true;
	publicVariable "PublicServerIsLoaded";
	format ["Server is up and running! Version: %1", PublicServerVersion] call ExileServer_util_log;
	call ExileServer_system_garbageCollector_start;
	call ExileServer_system_rcon_event_ready;
};