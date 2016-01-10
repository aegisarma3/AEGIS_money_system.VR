/*
O método utilizado aqui é um derivativo do método utilizado pelo time do Exile Mod.
Como se trata de uma trabalho derivativo, sua distribuição não é permitida.*/

private["_index"];
_index = AegisSessionIDs find _this;
if !(_index isEqualTo -1) then
{
AegisSessionIDs deleteAt _index;
	missionNamespace setVariable [format["AegisSessionPlayerObject%1", _this], nil];
};
