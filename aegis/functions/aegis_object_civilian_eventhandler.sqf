civKia = 0;
publicvariable "civKia";

private ["_allCivs"];
while { true } do {
  _allCivs = allUnits - ( playableUnits + switchableUnits );
  {
    if(isNil { _x getVariable "CivilHasEventHandler" } && {side _x == civilian} && {!captive _x}) then {
      _x addEventHandler ["Killed", aegis_object_player_civkiller];
      _x setVariable ["CivilHasEventHandler", true];
      "Adicionado event handler em um civil" call aegis_util_log;

      // Aumentar caso de zica de performance
      sleep 1;

    };
  } forEach _allCivs;
};
