class CfgFunctions
{
	class aegis
	{
		class init
		{
			class serverInit {
				file = "aegis\functions\serverInit.sqf";
				preInit = 1;
			};
			/*class clientInit {
				file = "aegis\functions\clientInit.sqf";
				preInit = 1;
			}*/
		}
	};
};


class cfgNotifications {
  class CivilDeath {
  title = "%1";
  iconPicture = "\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa";
  description = "%2";
  duration = 10;
  };

	class Transaction {
  title = "%1";
  iconPicture = "aegis\ui\pagamento.paa";
  description = "%2";
  duration = 10;
  };

	class CheckBalance {
  title = "%1";
  iconPicture = "aegis\ui\consulta.paa";
  description = "%2";
  duration = 10;
  };
};


class CfgSounds
{
	sounds[] = {};
	class alert
	{
		name = "alert";
		sound[] = {"aegis\sounds\alert.ogg", 1, 1};
		titles[] = {};
	};
	class cash
	{
		name = "cash";
		sound[] = {"aegis\sounds\cash.ogg", 1, 1};
		titles[] = {};
	};
};
