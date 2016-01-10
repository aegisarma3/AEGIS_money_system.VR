/*
O método utilizado aqui é um derivativo do método utilizado pelo time do Exile Mod.
Como se trata de uma trabalho derivativo, sua distribuição não é permitida.*/

private["_container","_magazines"];
_container = _this;
_magazines = [];
if (!isNull _container) then
{
	_magazines = magazinesAmmoCargo _container;
};
_magazines
