/*
O método utilizado aqui é um derivativo do método utilizado pelo time do Exile Mod.
Como se trata de uma trabalho derivativo, sua distribuição não é permitida.*/

if (missionName isEqualTo "ExileIntro") then
{
	"Intro PostInit..." call ExileClient_util_log;
}
else
{
	if (hasInterface) then
	{
		[] call ExileClient_system_moon_initialize;
		[] call ExileClient_gui_hud_initialize;
		[15, ExileClient_gui_hud_thread_survivalInfo, [], true] call ExileClient_system_thread_addtask;
		[1, ExileClient_gui_hud_thread_update, [], true] call ExileClient_system_thread_addtask;
		if( isServer ) then
		{
			if( hasInterface && !isMultiplayer ) then
			{
				"Editor PostInit..." call ExileClient_util_log;
				[] call ExileClient_util_debug_editor;
				true call ExileClient_gui_hud_toggle;
			};
		};
		if (!isServer) then
		{
			"Client PostInit..." call ExileClient_util_log;
			[] call ExileClient_system_music_initialize;
			[0.5, ExileClient_object_player_von_checkVon, [], true] call ExileClient_system_thread_addtask;
			[0.25, ExileClient_object_player_stats_update, [], true] call ExileClient_system_thread_addtask;
			[5, ExileClient_object_player_safezone_checkSafezone, [], true] call ExileClient_system_thread_addtask;
			[300, ExileClient_object_player_save, [], true] call ExileClient_system_thread_addtask;
		};
	};
};
true
