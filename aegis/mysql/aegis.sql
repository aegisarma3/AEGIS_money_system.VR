SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Dumping database structure for aegis_data
CREATE DATABASE IF NOT EXISTS `aegis_data` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `aegis_data`;

CREATE TABLE `account` (
  `uid` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `money` double NOT NULL DEFAULT '0',
  `first_connect_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_connect_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_disconnect_at` datetime DEFAULT NULL,
  `total_connections` int(11) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `player` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `account_uid` varchar(32) NOT NULL,
  `spawned_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `assigned_items` text NOT NULL,
  `backpack` varchar(64) NOT NULL,
  `backpack_items` text NOT NULL,
  `backpack_magazines` text NOT NULL,
  `backpack_weapons` text NOT NULL,
  `current_weapon` varchar(64) NOT NULL,
  `goggles` varchar(64) NOT NULL,
  `handgun_items` varchar(255) NOT NULL,
  `handgun_weapon` varchar(64) NOT NULL,
  `headgear` varchar(64) NOT NULL,
  `binocular` varchar(64) NOT NULL,
  `loaded_magazines` varchar(255) NOT NULL,
  `primary_weapon` varchar(64) NOT NULL,
  `primary_weapon_items` varchar(255) NOT NULL,
  `secondary_weapon` varchar(64) NOT NULL,
  `secondary_weapon_items` varchar(255) NOT NULL,
  `uniform` varchar(64) NOT NULL,
  `uniform_items` text NOT NULL,
  `uniform_magazines` text NOT NULL,
  `uniform_weapons` text NOT NULL,
  `vest` varchar(64) NOT NULL,
  `vest_items` text NOT NULL,
  `vest_magazines` text NOT NULL,
  `vest_weapons` text NOT NULL,
  `last_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `map` (
  `id` int(11) UNSIGNED NOT NULL,
  `account_uid` varchar(32) NOT NULL,
  `map_name` varchar(64) NOT NULL,
  `direction` double NOT NULL DEFAULT '0',
  `position_x` double NOT NULL DEFAULT '0',
  `position_y` double NOT NULL DEFAULT '0',
  `position_z` double NOT NULL DEFAULT '0',
  `last_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `account`
  ADD PRIMARY KEY (`uid`);

ALTER TABLE `player`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_uid` (`account_uid`);

ALTER TABLE `map`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `player`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

ALTER TABLE `map`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;


ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`account_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE;

ALTER TABLE `map`
  ADD CONSTRAINT `map_ibfk_1` FOREIGN KEY (`account_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
