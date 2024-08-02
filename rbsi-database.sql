-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 02, 2024 at 08:59 AM
-- Server version: 8.0.31
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rbsi-database`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tokenable_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', 'a6e7cc8d29f1b360cca236425e7dd4b15c81051e8c24c26e9c24e9f4eb9b3e9a', '[\"*\"]', '2024-07-23 18:59:44', '2024-07-23 18:57:46', '2024-07-23 18:59:44'),
(4, 'App\\Models\\User', 1, 'auth_token', '77212e41fc080c32180ad00402ee8f35d26f16219850f4dad0024ae999d99d3f', '[\"*\"]', '2024-07-23 22:47:26', '2024-07-23 22:03:41', '2024-07-23 22:47:26'),
(5, 'App\\Models\\User', 1, 'auth_token', 'e812a8c0cb85474264b37efc4439cbebc1ff99d991b077bd88f2e0e6f56efbe7', '[\"*\"]', '2024-07-25 16:45:04', '2024-07-25 16:44:53', '2024-07-25 16:45:04'),
(6, 'App\\Models\\User', 1, 'auth_token', '0f1bdcaf0adbb57627a1703b8ca883a3d4dbea83a4e0ad028dba4f296819b75e', '[\"*\"]', '2024-07-28 22:25:15', '2024-07-28 22:25:11', '2024-07-28 22:25:15'),
(7, 'App\\Models\\User', 1, 'auth_token', 'bce7dea7474d7ed9afccf85cdc873c51c3eff9608d3ebb0be20f1c420882e1ca', '[\"*\"]', '2024-07-29 17:00:33', '2024-07-29 17:00:30', '2024-07-29 17:00:33'),
(8, 'App\\Models\\User', 1, 'auth_token', 'c4274e498e25130bcc971d3e885586fb2e2b58b053ff89ac2615b77ff0193457', '[\"*\"]', '2024-07-29 21:46:48', '2024-07-29 21:03:00', '2024-07-29 21:46:48'),
(9, 'App\\Models\\User', 1, 'auth_token', '1b5113b8c682efb7a147eaae322ba20ee41da6fddee1f4ccc92e58b97d09e1f0', '[\"*\"]', '2024-07-29 22:17:07', '2024-07-29 22:17:04', '2024-07-29 22:17:07'),
(10, 'App\\Models\\User', 1, 'auth_token', 'b1118f6ec94b3f638085578ebda5cf40e448ec1500c9c5e6dab097e32f655af3', '[\"*\"]', '2024-07-30 01:00:51', '2024-07-30 01:00:47', '2024-07-30 01:00:51'),
(11, 'App\\Models\\User', 1, 'auth_token', '3088f7e47ed46a4642b769f369deaef51dac7f3f235305c1d391c93bd8c868b0', '[\"*\"]', '2024-07-30 16:11:34', '2024-07-30 16:11:28', '2024-07-30 16:11:34'),
(12, 'App\\Models\\User', 1, 'auth_token', '7b338d27bd5921b8cd8060f52a3c4565f402f00ab1b635c809f884425edf5c00', '[\"*\"]', '2024-07-31 18:54:01', '2024-07-31 16:39:25', '2024-07-31 18:54:01'),
(13, 'App\\Models\\User', 1, 'auth_token', '439cf11f5cfd56dac64c9a684c52abe0281838bb5c700d18a12ff2d6a2e3b53a', '[\"*\"]', '2024-07-31 23:13:26', '2024-07-31 23:13:20', '2024-07-31 23:13:26'),
(15, 'App\\Models\\User', 1, 'auth_token', '984a7fd6a9c4db75bda0b7c3267ac1c1c241557fd0e9b7a677ff6d59564c0d3b', '[\"*\"]', '2024-08-02 00:30:57', '2024-08-02 00:30:55', '2024-08-02 00:30:57');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif`
--

DROP TABLE IF EXISTS `t_cif`;
CREATE TABLE IF NOT EXISTS `t_cif` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `type` int NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `middle_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `initial` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `title` int NOT NULL,
  `customer_status` int NOT NULL,
  `gender` int NOT NULL,
  `civil_status` int NOT NULL,
  `mobile1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mobile2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `birthdate` date NOT NULL,
  `cus_lang_pref` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cus_tax_code` int NOT NULL,
  `image_file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address_type` int NOT NULL,
  `staff_or_not` int NOT NULL,
  `tin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nationality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `un_defined` int NOT NULL,
  `entity` int NOT NULL,
  `employment` int NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `address_line1` text NOT NULL,
  `address_line2` text NOT NULL,
  `address_line3` text NOT NULL,
  `address_line4` text NOT NULL,
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif`
--

INSERT INTO `t_cif` (`id`, `cid`, `type`, `first_name`, `middle_name`, `last_name`, `display_name`, `initial`, `title`, `customer_status`, `gender`, `civil_status`, `mobile1`, `mobile2`, `email`, `birthdate`, `cus_lang_pref`, `cus_tax_code`, `image_file`, `address_type`, `staff_or_not`, `tin`, `nationality`, `un_defined`, `entity`, `employment`, `created_at`, `updated_at`, `address_line1`, `address_line2`, `address_line3`, `address_line4`, `telephone`, `fax`, `postal_code`) VALUES
(1, 1, 1, 'Kent Anthony', 'Causing', 'Engbino', 'Engbino, Kent Anthony C.', 'kentoy', 2, 1, 1, 3, '09515886456', '09453145499', 'founder@kentillation.com', '2014-07-04', 'English - UK', 2, 'kent.png', 2, 1, '0918273645', 'Filipino', 7, 2, 3, '2024-07-23 00:19:24', '2024-07-23 00:19:24', 'National Road', 'Brgy. Poblacion II', 'Sagay City', 'Negros Island Region', '123456', '654321', '6122');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_address_type`
--

DROP TABLE IF EXISTS `t_cif_address_type`;
CREATE TABLE IF NOT EXISTS `t_cif_address_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_address_type`
--

INSERT INTO `t_cif_address_type` (`id`, `address_type`) VALUES
(1, 'Home'),
(2, 'Business'),
(3, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_civil_status`
--

DROP TABLE IF EXISTS `t_cif_civil_status`;
CREATE TABLE IF NOT EXISTS `t_cif_civil_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `civil_status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_civil_status`
--

INSERT INTO `t_cif_civil_status` (`id`, `civil_status`) VALUES
(1, 'Divorced'),
(2, 'Married'),
(3, 'Single'),
(4, 'Widowed');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_customer_status`
--

DROP TABLE IF EXISTS `t_cif_customer_status`;
CREATE TABLE IF NOT EXISTS `t_cif_customer_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_customer_status`
--

INSERT INTO `t_cif_customer_status` (`id`, `customer_status`) VALUES
(1, 'Active'),
(2, 'Guarantor Only');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_employment`
--

DROP TABLE IF EXISTS `t_cif_employment`;
CREATE TABLE IF NOT EXISTS `t_cif_employment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employment` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_employment`
--

INSERT INTO `t_cif_employment` (`id`, `employment`) VALUES
(1, 'Farmers-Peasant'),
(2, 'Artisanal Fisherfolk'),
(3, 'Workers-Formal Sector'),
(4, 'Migrant Workers'),
(5, 'Workers-Informal Sector'),
(6, 'Brgy MicroBusiness Enterprise'),
(7, 'Others (Cultural, Senior)'),
(8, 'Businessman');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_entity`
--

DROP TABLE IF EXISTS `t_cif_entity`;
CREATE TABLE IF NOT EXISTS `t_cif_entity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entity` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_entity`
--

INSERT INTO `t_cif_entity` (`id`, `entity`) VALUES
(1, 'Requested'),
(2, 'Individual'),
(3, 'Single Proprietorship'),
(4, 'Partnership & Assoc.'),
(5, 'Cooperative'),
(6, 'Financial Corp. w/ QB'),
(7, 'Non-financial Coporation'),
(8, 'SSS Pensioner 1-Retirement'),
(9, 'SSS Pensioner 2-EC Death'),
(10, 'SSS Pensioner 3-SS Death'),
(11, 'SSS Pensioner 4-EC T.Dis'),
(12, 'SSS Pensioner 5-SS T.Dis'),
(13, 'SSS Pensioner 6-EC P.Dis'),
(14, 'SSS Pensioner 7-SS P.Dis');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_gender`
--

DROP TABLE IF EXISTS `t_cif_gender`;
CREATE TABLE IF NOT EXISTS `t_cif_gender` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gender` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_gender`
--

INSERT INTO `t_cif_gender` (`id`, `gender`) VALUES
(1, 'Male'),
(2, 'Female'),
(3, 'Prefer not to say');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_staff_or_not`
--

DROP TABLE IF EXISTS `t_cif_staff_or_not`;
CREATE TABLE IF NOT EXISTS `t_cif_staff_or_not` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_or_not` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_staff_or_not`
--

INSERT INTO `t_cif_staff_or_not` (`id`, `staff_or_not`) VALUES
(1, 'Staff'),
(2, 'Not a Bank Staff');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_tax_code`
--

DROP TABLE IF EXISTS `t_cif_tax_code`;
CREATE TABLE IF NOT EXISTS `t_cif_tax_code` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tax_code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_tax_code`
--

INSERT INTO `t_cif_tax_code` (`id`, `tax_code`) VALUES
(1, 'Tax Withheld'),
(2, 'Tax Free');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_titles`
--

DROP TABLE IF EXISTS `t_cif_titles`;
CREATE TABLE IF NOT EXISTS `t_cif_titles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_titles`
--

INSERT INTO `t_cif_titles` (`id`, `title`) VALUES
(1, 'None'),
(2, 'Mr.'),
(3, 'Mrs.'),
(4, 'Dr.'),
(5, 'Atty.'),
(6, 'Engr.'),
(7, 'Fr.'),
(8, 'Msg.');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_types`
--

DROP TABLE IF EXISTS `t_cif_types`;
CREATE TABLE IF NOT EXISTS `t_cif_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_types`
--

INSERT INTO `t_cif_types` (`id`, `type`) VALUES
(1, 'Personal/Individual'),
(2, 'Institution/Company');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_undefined`
--

DROP TABLE IF EXISTS `t_cif_undefined`;
CREATE TABLE IF NOT EXISTS `t_cif_undefined` (
  `id` int NOT NULL AUTO_INCREMENT,
  `undefined` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_undefined`
--

INSERT INTO `t_cif_undefined` (`id`, `undefined`) VALUES
(1, 'Requested'),
(2, 'Private'),
(3, 'Government-National'),
(4, 'Non-Government'),
(5, 'Government'),
(6, 'Religious Org.'),
(7, 'Organization'),
(8, 'Association'),
(9, 'Phil. National Oil Co. (PNOC)'),
(10, 'National Power Corp. (NPC)'),
(11, 'National Electrification Ad (NEA)'),
(12, 'Phil. Port Authority (PPA)'),
(13, 'Phil. National Railways (PNR)'),
(14, 'Metro Manila Transit Corp. (MMTC)'),
(15, 'National Irrigation Admin (NIA)'),
(16, 'NAWASA/MWSS'),
(17, 'Local Water Utilities Ad (LWUA)'),
(18, 'National Housing Authority (NHA)'),
(19, 'Export Processing Zone A (EPZA)'),
(20, 'National Development Cor (NDC)'),
(21, 'Light Rail Transit Authority (LRTA)'),
(22, 'National Food Authority (FDA)'),
(23, 'Government Institution - Other');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'rbsi', 'test@test.com', NULL, '$2y$10$eSYPB4.s03GsVwhPKqk3ZOeieEsALX.agMq/UxsvyAPZ.F.xSIu9y', NULL, '2024-07-23 18:51:36', '2024-07-23 18:51:36');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
