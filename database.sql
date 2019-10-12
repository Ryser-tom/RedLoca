-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour redloca
CREATE DATABASE IF NOT EXISTS `redloca` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `redloca`;

-- Listage de la structure de la table redloca. categories
CREATE TABLE IF NOT EXISTS `categories` (
  `idCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `nomCategorie` varchar(45) NOT NULL,
  `prixCategorie` varchar(45) NOT NULL,
  `type_categories_idTypeCategorie` int(11) NOT NULL,
  PRIMARY KEY (`idCategorie`),
  KEY `fk_categories_type_categories1_idx1` (`type_categories_idTypeCategorie`),
  CONSTRAINT `fk_categories_type_categories1` FOREIGN KEY (`type_categories_idTypeCategorie`) REFERENCES `type_categories` (`idTypeCategorie`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Listage des données de la table redloca.categories : ~14 rows (environ)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`idCategorie`, `nomCategorie`, `prixCategorie`, `type_categories_idTypeCategorie`) VALUES
	(1, 'sport', '150', 1),
	(2, 'monospace', '130', 1),
	(3, 'suv', '110', 1),
	(4, 'break', '90', 1),
	(5, 'cabriolet', '80', 1),
	(6, 'berline', '70', 1),
	(7, 'scooter', '50', 2),
	(8, 'sportive', '350', 2),
	(9, 'enduro', '160', 2),
	(10, 'side-car', '420', 2),
	(11, 'trike', '350', 2),
	(12, 'custom', '350', 2),
	(13, 'touring', '320', 2),
	(14, 'roadster', '330', 2);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Listage de la structure de la table redloca. migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table redloca.migrations : ~8 rows (environ)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(9, '2014_10_12_000000_create_users_table', 1),
	(10, '2014_10_12_100000_create_password_resets_table', 1),
	(11, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
	(12, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
	(13, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
	(14, '2016_06_01_000004_create_oauth_clients_table', 1),
	(15, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
	(16, '2019_09_11_112821_create_vehicles_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Listage de la structure de la table redloca. oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table redloca.oauth_access_tokens : ~0 rows (environ)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Listage de la structure de la table redloca. oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table redloca.oauth_auth_codes : ~0 rows (environ)
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- Listage de la structure de la table redloca. oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table redloca.oauth_clients : ~0 rows (environ)
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Listage de la structure de la table redloca. oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table redloca.oauth_personal_access_clients : ~0 rows (environ)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Listage de la structure de la table redloca. oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table redloca.oauth_refresh_tokens : ~0 rows (environ)
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

-- Listage de la structure de la table redloca. password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table redloca.password_resets : ~0 rows (environ)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Listage de la structure de la table redloca. reservation
CREATE TABLE IF NOT EXISTS `reservation` (
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  `vehicules_idVehicule` int(11) NOT NULL,
  `utilisateurs_idUtilisateur` int(11) NOT NULL,
  PRIMARY KEY (`dateDebut`,`dateFin`,`vehicules_idVehicule`,`utilisateurs_idUtilisateur`),
  KEY `fk_reservation_utilisateurs1_idx` (`utilisateurs_idUtilisateur`),
  KEY `fk_reservation_vehicules_idx` (`vehicules_idVehicule`),
  CONSTRAINT `fk_reservation_utilisateur` FOREIGN KEY (`utilisateurs_idUtilisateur`) REFERENCES `utilisateurs` (`idUtilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_vehicules` FOREIGN KEY (`vehicules_idVehicule`) REFERENCES `vehicules` (`idVehicule`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table redloca.reservation : ~0 rows (environ)
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;

-- Listage de la structure de la table redloca. type_categories
CREATE TABLE IF NOT EXISTS `type_categories` (
  `idTypeCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `nomTypeCategorie` varchar(45) NOT NULL,
  PRIMARY KEY (`idTypeCategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Listage des données de la table redloca.type_categories : ~2 rows (environ)
/*!40000 ALTER TABLE `type_categories` DISABLE KEYS */;
INSERT INTO `type_categories` (`idTypeCategorie`, `nomTypeCategorie`) VALUES
	(1, 'voiture'),
	(2, 'moto');
/*!40000 ALTER TABLE `type_categories` ENABLE KEYS */;

-- Listage de la structure de la table redloca. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table redloca.users : ~0 rows (environ)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'tom ryser', 'rysertom@gmail.com', NULL, '$2y$10$dDdBN5djJ7zHn0/aI8vtiOHMeAAGCqNsJHdo0Gsp9RW8eqB3SA76m', NULL, '2019-09-16 08:41:02', '2019-09-16 08:41:02'),
	(2, 'emile', 'tomtom@bidule', NULL, '$2y$10$QG7rTYz7DAWj22fMQa2AOuamu3gPYb2oJaOaC28y9aYdH6YkueG.i', NULL, '2019-09-25 14:06:40', '2019-09-25 14:06:40');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Listage de la structure de la table redloca. utilisateurs
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `dateNaissance` varchar(20) NOT NULL,
  `natel` varchar(12) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mdp` varchar(100) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idUtilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Listage des données de la table redloca.utilisateurs : ~5 rows (environ)
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
INSERT INTO `utilisateurs` (`idUtilisateur`, `nom`, `prenom`, `dateNaissance`, `natel`, `email`, `mdp`, `type`) VALUES
	(1, 'ryser', 'tom', '1998-03-03', '0798380065', 'tom.rsr@eduge.ch', '44a8df6fdfe320ae66808cdd9ab3eeab0c136c50', 1),
	(2, 'nikxla', 'nikola', '1998-04-30', '0893111565', 'nikola.antnj@eduge.ch', '52d166edfc5ee6a6413333ea67be0eb40d467a72', 0),
	(3, 'djokovic', 'damjan', '1998-04-22', '04813461570', 'damjan.jvnvc@eduge.ch', '52d166edfc5ee6a6413333ea67be0eb40d467a72', 0),
	(10, 'ryser', 'tom', '1998-03-03', '0798380069', 'rysertom@gmail.com', '52d166edfc5ee6a6413333ea67be0eb40d467a72', 1),
	(11, 'web', 'san', '2018-05-16', '0781231212', 'websan@gmail.com', '733dc6aa998302456e888dabd026a2a4e5d7243c', 0),
	(12, 'ryser', 'tom', '1998-03-03', '0798380069', 'rysertom@gmail.com', '44a8df6fdfe320ae66808cdd9ab3eeab0c136c50', 0);
/*!40000 ALTER TABLE `utilisateurs` ENABLE KEYS */;

-- Listage de la structure de la table redloca. vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `idVehicule` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `immatriculation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nbPlace` int(11) NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateStartDisponibility` date NOT NULL,
  `dateEndDisponibility` date DEFAULT NULL,
  `users_idUser` int(11) DEFAULT NULL,
  `categories_idCategorie` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVehicule`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table redloca.vehicles : ~10 rows (environ)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` (`idVehicule`, `immatriculation`, `brand`, `model`, `nbPlace`, `color`, `image`, `dateStartDisponibility`, `dateEndDisponibility`, `users_idUser`, `categories_idCategorie`) VALUES
	(29, 'GE123456', 'VW', 'conserve', 7, 'gris', 'image/5b05ed89ebf0d.jpg', '2029-05-24', NULL, 1, 1),
	(30, 'GE 111 111', 'mustang', 'fusée', 2, 'vertElectrique', 'image/5b05ef7e4cf49.jpg', '2019-05-25', '2025-05-31', 1, 1),
	(31, 'VD 987654', 'alpha', 'roméo', 4, 'noir', 'image/5b05efba58d18.jpg', '2019-05-29', '2115-06-08', 1, 6),
	(32, '123456', 'audi', 'prototype', 2, 'noire et bleu', 'image/5b05eff6cb424.jpg', '2019-05-24', NULL, 1, 1),
	(33, 'VF 456 654', 'gag', 'bolide', 15, 'rouge cramoisie', 'image/5b05f0897e88c.jpg', '2019-05-24', NULL, 1, 1),
	(34, 'GE 000 000', 'IA', 'mini limousine', 6, 'black', 'image/5b05f10dce5b8.jpg', '2019-05-24', '2029-05-29', 1, 3),
	(35, 'FR 159 951', 'VW', 'retro', 2, 'grise', 'image/5b05f13f20383.jpg', '2019-05-24', '2010-10-18', 1, 1),
	(39, 'test', 'testi', 'testing', 123, 't', 'image/5PsJG0L9sZxIxMgcAsK4a6dwcsI1Fjz4lSKbEpkR.png', '2019-10-02', NULL, 1, NULL),
	(40, 'dsfgds', 'sdfgsdfg', 'sdfgsdfgsdfg', 5, 'gfdgdfg', 'image/kFqmSZbMdEyP45CjYU72dBPOCyN76tLAP7YGfoGZ.png', '2019-10-12', NULL, 1, NULL),
	(41, 'dafsdf', 'asdfasdf', 'asdfasdfas', 4, 'asdfsafa', 'image/N6CpNvxqAaNyZk6MSVCqEY9iiNYt3rXIjCHNFKit.png', '2019-10-12', NULL, 1, NULL);
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
