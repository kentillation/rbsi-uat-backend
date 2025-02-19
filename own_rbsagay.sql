-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 19, 2025 at 08:53 AM
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
-- Database: `own_rbsagay`
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
) ENGINE=MyISAM AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(15, 'App\\Models\\User', 1, 'auth_token', '984a7fd6a9c4db75bda0b7c3267ac1c1c241557fd0e9b7a677ff6d59564c0d3b', '[\"*\"]', '2024-08-02 00:30:57', '2024-08-02 00:30:55', '2024-08-02 00:30:57'),
(16, 'App\\Models\\User', 1, 'auth_token', '60e3e04607552f20e0142ff8c6e69818e3f5fbb9510661620103f51bb2bcc53f', '[\"*\"]', '2024-08-02 01:09:14', '2024-08-02 01:07:29', '2024-08-02 01:09:14'),
(17, 'App\\Models\\User', 1, 'auth_token', 'e09906a2e8c8422561d83dc64461349122ac5117a4339d21f03dbb842be197ee', '[\"*\"]', '2024-08-04 17:32:18', '2024-08-04 17:32:06', '2024-08-04 17:32:18'),
(18, 'App\\Models\\User', 1, 'auth_token', '4881da2cdb2346f80b922dd4bc6d721a59a00b389994105740e46c0637270421', '[\"*\"]', '2024-08-04 22:35:46', '2024-08-04 22:27:18', '2024-08-04 22:35:46'),
(21, 'App\\Models\\User', 1, 'auth_token', '1e30bf0ea1814ca0e204cde5401a2d29bf25f19b3b98457d6cf2218ab8eb6e61', '[\"*\"]', '2024-08-04 22:37:17', '2024-08-04 22:37:15', '2024-08-04 22:37:17'),
(26, 'App\\Models\\User', 1, 'auth_token', 'fdfd86a38e11ad667067e8b6d408e468b93bec7efab58a975557ef70c7a533a1', '[\"*\"]', '2024-08-06 00:42:11', '2024-08-05 21:49:08', '2024-08-06 00:42:11'),
(24, 'App\\Models\\User', 1, 'auth_token', '573c277577009308a8c4f5e0c0668050ca5bdaab34424b3109c8a45b90e17e9d', '[\"*\"]', '2024-08-08 17:50:48', '2024-08-05 21:27:23', '2024-08-08 17:50:48'),
(27, 'App\\Models\\User', 1, 'auth_token', '0790cad0420478e414804deb0cdb981163f524e6c6ea85e277a5c295108c41fe', '[\"*\"]', '2024-08-08 20:16:08', '2024-08-08 17:00:30', '2024-08-08 20:16:08'),
(28, 'App\\Models\\User', 1, 'auth_token', '5a3dd96cd8e4a2612a202593d9876cb57eb846c5d08b395738a47bc025a7f030', '[\"*\"]', '2024-08-11 21:49:18', '2024-08-11 18:15:54', '2024-08-11 21:49:18'),
(29, 'App\\Models\\User', 1, 'auth_token', '583891138ffbaf82e87ba6fb17c33ba368ec1d9580542e6769357e6d604854fe', '[\"*\"]', '2024-08-12 00:07:18', '2024-08-11 21:50:44', '2024-08-12 00:07:18'),
(30, 'App\\Models\\User', 1, 'auth_token', '118bbff728882da86baccd801384fd69e92238db7e00f8e4fd7b8fe6db9a85b9', '[\"*\"]', '2024-08-12 20:09:41', '2024-08-12 16:18:16', '2024-08-12 20:09:41'),
(31, 'App\\Models\\User', 1, 'auth_token', '5d2c9a42686c41d4becb74c9a955091be412926b3034ea3bdac1f3ad18afc565', '[\"*\"]', '2024-08-14 00:46:13', '2024-08-13 16:39:53', '2024-08-14 00:46:13'),
(32, 'App\\Models\\User', 1, 'auth_token', '91a1994df26d18f9ba77612e3a7c873b4e7d95f5fd465e4b9f17f4eb34f764fe', '[\"*\"]', '2024-08-13 22:17:36', '2024-08-13 21:52:52', '2024-08-13 22:17:36'),
(33, 'App\\Models\\User', 1, 'auth_token', '027154ac80f203b1c49c02692799af8d9db63037a5be3bc85b79db5742c80474', '[\"*\"]', '2024-08-13 22:23:11', '2024-08-13 22:18:23', '2024-08-13 22:23:11'),
(34, 'App\\Models\\User', 1, 'auth_token', '2ff3ee122607873fbcdae83ec4b97b079610165aa101a81427a302fc1cc73bfa', '[\"*\"]', '2024-08-14 17:38:35', '2024-08-14 16:22:15', '2024-08-14 17:38:35'),
(38, 'App\\Models\\User', 1, 'auth_token', '2319ef5dc7b0957e909a080e6489621be40865451d239da1b160531ea169bf9c', '[\"*\"]', '2024-08-18 21:34:57', '2024-08-18 21:05:40', '2024-08-18 21:34:57'),
(40, 'App\\Models\\User', 1, 'auth_token', '1ad350af529f69abc217166ba2fb70df19bf0ef00638818f182d2042251ca2ad', '[\"*\"]', '2024-08-19 00:33:30', '2024-08-18 23:16:16', '2024-08-19 00:33:30'),
(41, 'App\\Models\\User', 1, 'auth_token', 'd3e98b54ee8e94c50f8f7432677973506ea0c73dd1b8d96be40e3996f52dd591', '[\"*\"]', '2024-08-20 01:11:08', '2024-08-20 00:31:18', '2024-08-20 01:11:08'),
(42, 'App\\Models\\User', 1, 'auth_token', '6b5e1795a4557f157879f663b9d6aa96eadaae2744f61f13712bcf8cbcd590c8', '[\"*\"]', '2024-08-20 21:12:37', '2024-08-20 21:07:40', '2024-08-20 21:12:37'),
(43, 'App\\Models\\User', 1, 'auth_token', 'c79c4806fc696feda281dc3535ecafacca177fb5508f8e7f3c5bdea5b051e939', '[\"*\"]', '2024-08-21 01:09:36', '2024-08-21 00:52:34', '2024-08-21 01:09:36'),
(44, 'App\\Models\\User', 1, 'auth_token', 'ad2d51af5e8aa058b45c5d73fdfd58dcca8ce371ac25eace4bf6f06f58820037', '[\"*\"]', '2024-08-21 22:40:42', '2024-08-21 22:13:20', '2024-08-21 22:40:42'),
(45, 'App\\Models\\User', 2, 'auth_token', '3d747e724da7949e294b04b50c9379d115a9c1d815b3d5648e6fa2d7f00b62d6', '[\"*\"]', '2024-08-27 01:03:43', '2024-08-26 16:09:28', '2024-08-27 01:03:43'),
(46, 'App\\Models\\User', 2, 'auth_token', 'dddc3e41a09e51460a7591401a97da348f0e38a391afaaf8db88264a99f0e1da', '[\"*\"]', '2024-09-10 22:28:27', '2024-08-26 21:45:52', '2024-09-10 22:28:27'),
(47, 'App\\Models\\User', 2, 'auth_token', 'a35c81c94e3d66d62f6228a618e6ad7ff2842c70bf6b005ebce7937a8159d9c8', '[\"*\"]', NULL, '2024-08-26 21:46:15', '2024-08-26 21:46:15'),
(48, 'App\\Models\\User', 1, 'auth_token', '1ea6ea873d03658cd2a70341d902bb67489c9d0858197cdeb1ed19f2e361a777', '[\"*\"]', '2024-08-27 01:30:13', '2024-08-27 01:07:44', '2024-08-27 01:30:13'),
(49, 'App\\Models\\User', 2, 'auth_token', '023ab9006ade6444d72a6910ad5d1eb559169c06956c8482209fe5f2c8775733', '[\"*\"]', '2024-08-27 22:29:05', '2024-08-27 18:43:08', '2024-08-27 22:29:05'),
(50, 'App\\Models\\User', 2, 'auth_token', '1be240bd83e9a79cb7d6b8ca7147001437ef8225bf49bcf74d447a0b8186939d', '[\"*\"]', '2024-08-27 23:00:41', '2024-08-27 22:30:38', '2024-08-27 23:00:41'),
(63, 'App\\Models\\User', 1, 'auth_token', 'c40080822d253216197850faffa33c86cecdc1d31951fc140b74fa5ced8c1d42', '[\"*\"]', '2024-08-29 16:55:48', '2024-08-29 16:41:31', '2024-08-29 16:55:48'),
(54, 'App\\Models\\User', 1, 'auth_token', '2a5fcbb4fad888266e63a5539d4a88f2b9d25a1f82cb4a92edb14dd0b6b143be', '[\"*\"]', '2024-08-28 19:17:24', '2024-08-28 17:38:15', '2024-08-28 19:17:24'),
(59, 'App\\Models\\User', 1, 'auth_token', 'd8ea0e75b3832f19deef83173f163a56e733196d24977c9c847a9471e5bbc894', '[\"*\"]', '2024-08-28 23:44:11', '2024-08-28 23:26:25', '2024-08-28 23:44:11'),
(57, 'App\\Models\\User', 1, 'auth_token', '0a2a78768c5944bef4356a1de199bdbbf8f3429cf109658e7b2103523e6aeef3', '[\"*\"]', '2024-08-28 23:21:52', '2024-08-28 21:38:06', '2024-08-28 23:21:52'),
(61, 'App\\Models\\User', 1, 'auth_token', '27c2580c6ff091cbaca4f3466b375d30244c5a47afa75a89357d5eed702432c5', '[\"*\"]', '2024-08-29 00:13:38', '2024-08-28 23:45:42', '2024-08-29 00:13:38'),
(66, 'App\\Models\\User', 1, 'auth_token', 'eed53f3e9fc52134ccc6be31375bc8e70e4e2b631587b5d4cf31179418491469', '[\"*\"]', '2024-09-01 20:02:56', '2024-09-01 17:10:04', '2024-09-01 20:02:56'),
(67, 'App\\Models\\User', 1, 'auth_token', 'e2738fd4ea68777b68541e286e5837d26405a0ff515c1403d1fd84ed3bf2b00e', '[\"*\"]', '2024-09-02 01:15:17', '2024-09-01 21:19:05', '2024-09-02 01:15:17'),
(68, 'App\\Models\\User', 1, 'auth_token', '4d448f9842d91a6dd9303ae386a0e3179549cde86fc92f46d30d99962d2099ef', '[\"*\"]', '2024-09-02 01:27:01', '2024-09-02 01:16:43', '2024-09-02 01:27:01'),
(72, 'App\\Models\\User', 1, 'auth_token', '18649ba978177f480d19becaa9ad531a9ea7a27b2688a4747f48239cef445418', '[\"*\"]', '2024-09-03 01:05:39', '2024-09-03 00:05:48', '2024-09-03 01:05:39'),
(74, 'App\\Models\\User', 1, 'auth_token', '8f3ca2a1310efb2bb7c1b3b73000690b15e92ad917c67d718f3d03c8e268d9ff', '[\"*\"]', '2024-09-03 18:12:05', '2024-09-03 17:30:09', '2024-09-03 18:12:05'),
(76, 'App\\Models\\User', 1, 'auth_token', '4e1db9894282a81cfa63fe79bec5310b3c6bece408312d9a3b7a6a9682d56d0a', '[\"*\"]', '2024-09-04 01:01:36', '2024-09-03 22:06:27', '2024-09-04 01:01:36'),
(77, 'App\\Models\\User', 1, 'auth_token', '3d7dda02148b6f265dce2e51a915665cb01441819f014b794a2ff008e29055c3', '[\"*\"]', '2024-09-04 22:03:46', '2024-09-04 18:30:55', '2024-09-04 22:03:46'),
(78, 'App\\Models\\User', 1, 'auth_token', 'e3814aa8d756e390a9df75b2337531ab74931eb3e9f1d72acb6ee771f45fe88f', '[\"*\"]', '2024-09-09 00:18:09', '2024-09-08 19:12:29', '2024-09-09 00:18:09'),
(80, 'App\\Models\\User', 1, 'auth_token', '375f362b371454efa79de512d22887df67da8f2ff55066709b6827b329e635d1', '[\"*\"]', '2024-09-10 01:02:27', '2024-09-10 00:35:22', '2024-09-10 01:02:27'),
(81, 'App\\Models\\User', 1, 'auth_token', '9d0e59ef7d05618fa3170e93f6dff8754c5561f3047cb3cfd5cfd23c6da563bc', '[\"*\"]', '2024-09-10 01:16:43', '2024-09-10 01:08:12', '2024-09-10 01:16:43'),
(82, 'App\\Models\\User', 1, 'auth_token', '180eb07c46bfb4eac1170d55d184206e0529f63c7ac0055a34c15aa60d11f775', '[\"*\"]', '2024-09-10 21:01:27', '2024-09-10 16:23:38', '2024-09-10 21:01:27'),
(84, 'App\\Models\\User', 1, 'auth_token', '833518594b4d03b72fa9692a43b01588ddc77e64b9c97c3b60eaeb06f011ba00', '[\"*\"]', '2024-09-11 00:10:46', '2024-09-10 23:35:23', '2024-09-11 00:10:46'),
(85, 'App\\Models\\User', 1, 'auth_token', 'ba07d91c9ce295d902d70e84a02070b97c1de1b7d873a6ace20de6d1089b85f8', '[\"*\"]', '2024-09-12 00:46:52', '2024-09-11 16:13:05', '2024-09-12 00:46:52'),
(86, 'App\\Models\\User', 1, 'auth_token', '3bb0760429594072fecea3a61b0c857241cf57708e87f994991767b3f173c9f0', '[\"*\"]', '2024-09-16 01:03:18', '2024-09-15 21:40:51', '2024-09-16 01:03:18'),
(87, 'App\\Models\\User', 1, 'auth_token', 'f0a15fdb97bc358261368ddd2edd35e9893255f8e17de7445e52847187ee0e0c', '[\"*\"]', '2024-09-17 01:14:37', '2024-09-16 16:31:33', '2024-09-17 01:14:37'),
(88, 'App\\Models\\User', 1, 'auth_token', 'e89a2c022da35a6b49b4c9848da11f162d949070cb21792b7c966a2b7fecbc1b', '[\"*\"]', '2024-09-17 19:01:21', '2024-09-17 16:27:27', '2024-09-17 19:01:21'),
(89, 'App\\Models\\User', 1, 'auth_token', 'fe60164a91dd9b52c01320ecefb2cd7bfa0729606ea16a56fb1fbe0eb07fb9fe', '[\"*\"]', '2024-09-17 22:55:42', '2024-09-17 19:02:58', '2024-09-17 22:55:42'),
(90, 'App\\Models\\User', 1, 'auth_token', '545cdd3eb7b117465ece9b168ef290d0fe494d315e76959451021baa54c28d7b', '[\"*\"]', '2025-01-24 02:30:34', '2024-09-17 21:40:22', '2025-01-24 02:30:34'),
(91, 'App\\Models\\User', 1, 'auth_token', 'bb7074ea88ff3d9294c1b1253db978dbf1537d6f97016fa784ce79e0da49d34e', '[\"*\"]', NULL, '2024-09-18 17:14:08', '2024-09-18 17:14:08'),
(92, 'App\\Models\\User', 1, 'auth_token', '2de6e52659bad93b08971868b05fc15008a8e7a150a536171398d727418e8340', '[\"*\"]', '2024-09-18 22:54:48', '2024-09-18 19:46:22', '2024-09-18 22:54:48'),
(93, 'App\\Models\\User', 1, 'auth_token', 'd354a77ef6edd81561cc3bf982e67d549761795ebc7f910f023c8e7e99d8843f', '[\"*\"]', NULL, '2024-09-19 17:04:30', '2024-09-19 17:04:30'),
(94, 'App\\Models\\User', 1, 'auth_token', 'bc6b508965752b6edb109378420772b60fcd9388a01b1219e4cfc2b204243926', '[\"*\"]', '2024-09-20 00:58:17', '2024-09-19 23:13:31', '2024-09-20 00:58:17'),
(95, 'App\\Models\\User', 1, 'auth_token', '4d59f1ce62c832dce733dfd7b698a3942af823cedb614a3743bd943b0c4f23b0', '[\"*\"]', '2024-09-22 22:11:59', '2024-09-22 20:00:51', '2024-09-22 22:11:59'),
(97, 'App\\Models\\User', 1, 'auth_token', '37b2368fac4828778e20f38d1b3f7f0ab73b1f835633ae64433d8c39dc6eb2f1', '[\"*\"]', '2024-09-25 18:10:30', '2024-09-25 16:34:17', '2024-09-25 18:10:30'),
(98, 'App\\Models\\User', 1, 'auth_token', '5b39f59686029addf29a1d6c91a7c35f05349a7b348f06cc0fdb956ecdcd38af', '[\"*\"]', '2024-09-27 00:00:54', '2024-09-26 21:43:02', '2024-09-27 00:00:54'),
(99, 'App\\Models\\User', 1, 'auth_token', 'a653c060ecb23f83c54e8b02160c97f496d3008eabe6d0ae9d61c79302928b46', '[\"*\"]', '2024-10-07 21:22:30', '2024-10-07 21:22:06', '2024-10-07 21:22:30'),
(100, 'App\\Models\\User', 1, 'auth_token', 'd21979b086e7717b88f459f0acfd859472e97447ce9cd072162cfe0fcc5490fa', '[\"*\"]', '2024-10-07 23:58:44', '2024-10-07 22:39:17', '2024-10-07 23:58:44'),
(101, 'App\\Models\\User', 1, 'auth_token', 'c2d388c1c6a79177ac13304098b601792c4c684d89d1a7fb75b0543e23129aaa', '[\"*\"]', '2024-10-09 00:15:17', '2024-10-08 21:04:50', '2024-10-09 00:15:17'),
(102, 'App\\Models\\User', 1, 'auth_token', '83bd93b13d8a898cb6ff40840db115b024ef614189ab3b7551b28e06d4c2895b', '[\"*\"]', '2024-10-11 00:53:37', '2024-10-11 00:32:00', '2024-10-11 00:53:37'),
(103, 'App\\Models\\User', 1, 'auth_token', 'dbe11df9f70379c706c6e97a908216bd03eece18f9a78987e043301159756de7', '[\"*\"]', '2024-10-14 01:07:40', '2024-10-14 00:59:54', '2024-10-14 01:07:40'),
(104, 'App\\Models\\User', 1, 'auth_token', '6a6c2b8b0c07d7ebb744969b8eefa223e7110a840c344522c9f5d0e4e018cb79', '[\"*\"]', '2024-10-16 19:46:47', '2024-10-16 18:47:54', '2024-10-16 19:46:47'),
(105, 'App\\Models\\User', 1, 'auth_token', 'cee43883ae32b7ef31081869b08825cb360f6afebd1b5a3b65aaf46dc59a3006', '[\"*\"]', '2024-10-30 19:29:04', '2024-10-30 18:41:50', '2024-10-30 19:29:04'),
(106, 'App\\Models\\User', 1, 'auth_token', 'ed13cc1ff9f01e4f62e04a09a826e2f2170d20f0ee68d4da4088d18ccb73774d', '[\"*\"]', '2024-10-30 23:55:32', '2024-10-30 20:03:23', '2024-10-30 23:55:32'),
(107, 'App\\Models\\User', 1, 'auth_token', 'aef7883e3768c89acb77c686d7d94c6c5e9b14c2c0ec0089593641b84593890e', '[\"*\"]', '2024-11-03 20:02:58', '2024-11-03 16:18:34', '2024-11-03 20:02:58'),
(108, 'App\\Models\\User', 1, 'auth_token', 'a029f9033468dc0e3863360e9226395c74a0c9305871241b9cc9b1b8852d5dc1', '[\"*\"]', '2024-11-03 23:37:45', '2024-11-03 21:31:13', '2024-11-03 23:37:45'),
(109, 'App\\Models\\User', 1, 'auth_token', 'e4b574d903c662ff27683b791859849115c496a02e2e3421d6a715fa38c9e813', '[\"*\"]', '2024-11-04 00:44:17', '2024-11-03 23:39:21', '2024-11-04 00:44:17'),
(110, 'App\\Models\\User', 1, 'auth_token', '37da75db94ad6372d502d54edca98d00919a0749eedd4dbdfdc5a5447c2c24dc', '[\"*\"]', '2024-11-12 19:17:10', '2024-11-12 18:50:37', '2024-11-12 19:17:10'),
(112, 'App\\Models\\User', 1, 'auth_token', '7f5a2d6607ac62ff90640f6279ebcff8a9ef9ce674af95d326e21d410458384e', '[\"*\"]', '2024-11-13 22:14:49', '2024-11-13 22:14:09', '2024-11-13 22:14:49'),
(113, 'App\\Models\\User', 1, 'auth_token', 'de6c32e9ad44705644fe7c63793aa6dae519da3015f792f29b635bac9f470668', '[\"*\"]', '2024-11-13 22:29:44', '2024-11-13 22:28:21', '2024-11-13 22:29:44'),
(114, 'App\\Models\\User', 1, 'auth_token', '74fd4c280b4dc41c428e593cbd7d9bfde1672220cc363225bb87729ff9a93639', '[\"*\"]', '2024-11-17 17:26:52', '2024-11-17 16:52:24', '2024-11-17 17:26:52'),
(115, 'App\\Models\\User', 1, 'auth_token', 'e8bb15c12c4c65779dd6d70fe547d6409bab5cdb95779eb2d1173963ecc4f979', '[\"*\"]', '2024-12-26 00:10:57', '2024-12-25 23:33:00', '2024-12-26 00:10:57'),
(116, 'App\\Models\\User', 1, 'auth_token', '24e738d5cda5babcb5d4d1ea04c0f1a4c96efc511aff816e69fcf0ecbc7d0b87', '[\"*\"]', '2025-01-02 02:06:58', '2025-01-02 00:42:57', '2025-01-02 02:06:58'),
(117, 'App\\Models\\User', 1, 'auth_token', 'a64b1e7acec199b4b1ec27541b4141c383561f76a7b01d99398e1c5cccbf7ee8', '[\"*\"]', '2025-01-02 22:44:05', '2025-01-02 22:05:17', '2025-01-02 22:44:05'),
(118, 'App\\Models\\User', 1, 'auth_token', '0675b4093e49f826fe63d1e39f0473d6c0d8dd1f96266ceec82a04b739807e7f', '[\"*\"]', '2025-01-06 18:15:45', '2025-01-06 17:13:58', '2025-01-06 18:15:45'),
(119, 'App\\Models\\User', 1, 'auth_token', '67b5dd06e3f44e63918f564ace8d92f81135e623dafb6ac7e15c418b44ccbe75', '[\"*\"]', '2025-01-30 17:40:41', '2025-01-30 17:04:35', '2025-01-30 17:40:41'),
(120, 'App\\Models\\User', 1, 'auth_token', '6f46b936fcba0d8b823ce2588b87d3af2674e9afc0dbd5bf43e6c8c18e0016d0', '[\"*\"]', '2025-01-30 21:32:40', '2025-01-30 21:15:24', '2025-01-30 21:32:40'),
(122, 'App\\Models\\User', 1, 'auth_token', 'd7f1765d9a1a1f9f07f34f515087100e8aa755649dbaca6ad5693cb5739bd342', '[\"*\"]', '2025-02-02 18:29:17', '2025-02-02 18:16:27', '2025-02-02 18:29:17'),
(123, 'App\\Models\\User', 1, 'auth_token', 'c2585d9f2644e6029514efa11fe1e363470faed0e613f2b192ebd742b917cbf3', '[\"*\"]', '2025-02-03 23:13:44', '2025-02-03 17:30:45', '2025-02-03 23:13:44'),
(124, 'App\\Models\\User', 1, 'auth_token', '2951f9c0465ac746386649ccd8b2ab0348eff2d1775e3a4435d99924ffda691d', '[\"*\"]', '2025-02-05 23:52:35', '2025-02-05 23:22:47', '2025-02-05 23:52:35'),
(125, 'App\\Models\\User', 1, 'auth_token', '2d3332f465e78b68799a7448c1295596d0dc5a949e5f72f68648b38af36e345e', '[\"*\"]', '2025-02-10 01:41:56', '2025-02-09 16:54:05', '2025-02-10 01:41:56'),
(126, 'App\\Models\\User', 1, 'auth_token', '69373f63e2e5fa11132fc7aa1fef8c09006e331b0e93a14af5676479706449f6', '[\"*\"]', '2025-02-10 18:05:07', '2025-02-10 16:16:23', '2025-02-10 18:05:07'),
(127, 'App\\Models\\User', 1, 'auth_token', 'd58a4bb050a4e00e7ae390bb8635ba4512e10a28387b12a3d1b9bfa304c98cea', '[\"*\"]', '2025-02-11 23:46:40', '2025-02-11 18:58:01', '2025-02-11 23:46:40'),
(128, 'App\\Models\\User', 1, 'auth_token', '31d8f0e9c434bbb0f8723796388d234ed104dd6be7ba1bd9681a02fb82f56827', '[\"*\"]', '2025-02-13 00:09:03', '2025-02-12 18:31:08', '2025-02-13 00:09:03'),
(129, 'App\\Models\\User', 1, 'auth_token', '69ae74776586acc5eec03d53a3bd9a07025dfa02675fa0e98a83fc77402c9f65', '[\"*\"]', '2025-02-14 01:09:39', '2025-02-13 19:58:38', '2025-02-14 01:09:39'),
(130, 'App\\Models\\User', 1, 'auth_token', 'fd1e52307840bf03056f9af7f2abe25278406d67892d41382447cdb9a68105c0', '[\"*\"]', '2025-02-17 00:48:09', '2025-02-16 20:58:00', '2025-02-17 00:48:09'),
(132, 'App\\Models\\User', 1, 'auth_token', 'cbadc1dc7f2dd33acd54028c9193fc642891d884c27081b8a9ba52e961002f74', '[\"*\"]', '2025-02-18 03:25:53', '2025-02-18 02:24:37', '2025-02-18 03:25:53'),
(133, 'App\\Models\\User', 1, 'auth_token', '9167159a71390a0bf60350a445bcfa0f3fd9e9713882e1990e0d434989fd2fa8', '[\"*\"]', '2025-02-19 00:46:57', '2025-02-18 16:38:36', '2025-02-19 00:46:57');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif`
--

DROP TABLE IF EXISTS `t_cif`;
CREATE TABLE IF NOT EXISTS `t_cif` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address_type` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `type` varchar(3) NOT NULL,
  `title` varchar(3) NOT NULL,
  `client_status` varchar(3) NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `middle_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `suffix` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `initial` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `staff_or_not` tinyint(1) NOT NULL,
  `tin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `gender` varchar(3) NOT NULL,
  `civil_status` varchar(3) NOT NULL,
  `birthdate` date NOT NULL,
  `mobile1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mobile2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nationality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `institution` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `entity` varchar(3) NOT NULL,
  `employment` varchar(3) NOT NULL,
  `tax_code` varchar(3) NOT NULL,
  `image_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `branch` varchar(6) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif`
--

INSERT INTO `t_cif` (`id`, `cid`, `address_type`, `type`, `title`, `client_status`, `first_name`, `middle_name`, `last_name`, `suffix`, `initial`, `display_name`, `staff_or_not`, `tin`, `gender`, `civil_status`, `birthdate`, `mobile1`, `mobile2`, `email`, `nationality`, `institution`, `entity`, `employment`, `tax_code`, `image_file`, `branch`, `created_at`, `updated_at`) VALUES
(2, '000005', '1', '1', '1', '1', 'Kent Anthony', 'Causing', 'Engbino', '7', 'Toto', 'Engbino, Kent Anthony C.', 1, NULL, '1', '3', '1995-07-03', '0123456789', '987654321', 'sample@sample.com', 'Filipino', '1', '1', '7', '001', '1738287144.jpg', '000000', '2025-01-31 01:32:26', '2025-01-31 01:32:26'),
(3, '000006', '1', '1', '1', '1', 'Bibor', 'Causing', 'Engbino', '7', 'Borbor', 'Engbino, Bibor C.', 1, NULL, '1', '3', '2020-09-14', '0123456789', '987654321', 'bibor@gmail.com', 'Filipino', '1', '1', '7', '001', '1738287641.jpg', '000000', '2025-01-31 01:41:17', '2025-01-31 01:41:17'),
(15, '000024', '1', '1', '1', '1', 'Sparkle', 'Memeng', 'Engbino', '7', 'Spark', 'Engbino, Sparkle M.', 2, NULL, '1', '3', '2023-12-31', '0123456789', '9876543210', 'spark@gmail.com', 'Filipino', '1', '1', '7', '001', '1739869408.jpeg', '000000', '2025-02-18 09:03:29', '2025-02-18 09:03:29'),
(16, '000025', '1', '1', '1', '1', 'Batman', 'The', 'Baaaat', '7', 'Batman', 'Baaaat, Batman T.', 2, NULL, '1', '3', '2013-05-07', '0123456789', '03020105064', 'test@gmail.com', 'Filipino', '1', '1', '7', '001', '1739874580.png', '000000', '2025-02-18 10:29:41', '2025-02-18 10:29:41');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_account_type`
--

DROP TABLE IF EXISTS `t_cif_account_type`;
CREATE TABLE IF NOT EXISTS `t_cif_account_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_type_code` varchar(3) NOT NULL,
  `account_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_account_type`
--

INSERT INTO `t_cif_account_type` (`id`, `account_type_code`, `account_type`) VALUES
(1, '000', 'Regular'),
(2, '009', 'Student'),
(3, '010', 'Employee'),
(4, '011', 'Pension');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_address`
--

DROP TABLE IF EXISTS `t_cif_address`;
CREATE TABLE IF NOT EXISTS `t_cif_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address_type` varchar(3) DEFAULT NULL,
  `address_line1` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address_line2` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address_line3` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `line4` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `postal_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telephone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fax` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `branch` varchar(6) NOT NULL,
  `addr_recid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `message_id` text,
  `token` text,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_address`
--

INSERT INTO `t_cif_address` (`id`, `cid`, `address_type`, `address_line1`, `address_line2`, `address_line3`, `line4`, `postal_code`, `telephone`, `fax`, `branch`, `addr_recid`, `message_id`, `token`, `created_at`, `updated_at`) VALUES
(11, '000005', NULL, 'Paraiso', 'Sagay', 'Negros Island Region', 'Philippines', '6122', '00112233', '030201', '000000', '5', NULL, NULL, '2025-01-31 01:32:26', '2025-01-31 01:32:26'),
(12, '000006', NULL, 'Paraiso', 'Sagay', 'Negros Island Region', 'Philippines', '6122', '00112233', '030201', '000000', '6', NULL, NULL, '2025-01-31 01:41:17', '2025-01-31 01:41:17'),
(23, '000024', '1', 'Paraiso', 'Sagay', 'Negros Occidental', 'Philippines', '6122', '010203', '030201', '000000', '24', NULL, NULL, '2025-02-18 09:03:29', '2025-02-18 09:03:29'),
(24, '000025', '1', 'Poblacion 1', 'Sagay', 'Negros Occidental', 'Philippines', '6122', '010203', '030201', '000000', '25', NULL, NULL, '2025-02-18 10:29:41', '2025-02-18 10:29:41');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_address_type`
--

DROP TABLE IF EXISTS `t_cif_address_type`;
CREATE TABLE IF NOT EXISTS `t_cif_address_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address_code` varchar(3) NOT NULL,
  `address_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_address_type`
--

INSERT INTO `t_cif_address_type` (`id`, `address_code`, `address_type`) VALUES
(1, '001', 'Home'),
(2, '002', 'Business'),
(3, '009', 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_app_types`
--

DROP TABLE IF EXISTS `t_cif_app_types`;
CREATE TABLE IF NOT EXISTS `t_cif_app_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_type_code` int NOT NULL,
  `app_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gl_code` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_app_types`
--

INSERT INTO `t_cif_app_types` (`id`, `app_type_code`, `app_type`, `gl_code`) VALUES
(1, 1, 'Savings', 51),
(2, 2, 'Current', 25);

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_auth`
--

DROP TABLE IF EXISTS `t_cif_auth`;
CREATE TABLE IF NOT EXISTS `t_cif_auth` (
  `auth_id` int NOT NULL AUTO_INCREMENT,
  `generated_message_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `generated_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`auth_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_auth`
--

INSERT INTO `t_cif_auth` (`auth_id`, `generated_message_id`, `generated_token`, `created_at`, `updated_at`) VALUES
(15, '8ad826cec29b4da09b7626732fdaef2fcduj1ihu', '219d7dc17900cd121b583023a0ff2cc247184042', '2024-11-03 16:52:25', '2024-11-03 16:52:25'),
(14, '23ab89716b46412688eea525f8d687006hkrh7dv', 'bfdc4a7ca2627b0a2a1d7e32c18b336d114affc1', '2024-11-03 16:46:25', '2024-11-03 16:46:25');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_civil_status`
--

DROP TABLE IF EXISTS `t_cif_civil_status`;
CREATE TABLE IF NOT EXISTS `t_cif_civil_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `civil_status_code` varchar(3) NOT NULL,
  `civil_status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_civil_status`
--

INSERT INTO `t_cif_civil_status` (`id`, `civil_status_code`, `civil_status`) VALUES
(1, 'D00', 'Divorced'),
(2, 'M00', 'Married'),
(3, 'S00', 'Single'),
(4, 'W00', 'Widowed');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_client_status`
--

DROP TABLE IF EXISTS `t_cif_client_status`;
CREATE TABLE IF NOT EXISTS `t_cif_client_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_status_code` varchar(3) NOT NULL,
  `client_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_client_status`
--

INSERT INTO `t_cif_client_status` (`id`, `client_status_code`, `client_status`) VALUES
(1, '000', 'Active'),
(2, '9GR', 'Guarantor Only');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_documents`
--

DROP TABLE IF EXISTS `t_cif_documents`;
CREATE TABLE IF NOT EXISTS `t_cif_documents` (
  `document_id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `file_data` longblob NOT NULL,
  PRIMARY KEY (`document_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_documents`
--

INSERT INTO `t_cif_documents` (`document_id`, `cid`, `file_data`) VALUES
(1, 1, 0xffd8ffe000104a46494600010100000100010000ffe201d84943435f50524f46494c45000101000001c86c636d73021000006d6e74725247422058595a2007e2000300140009000e001d616373704d53465400000000736177736374726c0000000000000000000000000000f6d6000100000000d32d68616e649d91003d4080b03d40742c819ea5228e000000000000000000000000000000000000000000000000000000000000000964657363000000f00000005f637072740000010c0000000c7774707400000118000000147258595a0000012c000000146758595a00000140000000146258595a00000154000000147254524300000168000000606754524300000168000000606254524300000168000000606465736300000000000000057552474200000000000000000000000074657874000000004343300058595a20000000000000f35400010000000116c958595a200000000000006fa0000038f20000038f58595a2000000000000062960000b789000018da58595a2000000000000024a000000f850000b6c463757276000000000000002a0000007c00f8019c0275038304c9064e08120a180c620ef411cf14f6186a1c2e204324ac296a2e7e33eb39b33fd646574d3654765c17641d6c8675567e8d882c92369caba78cb2dbbe99cac7d765e477f1f9ffffffdb004300120c0d100d0b12100e10141312151b2c1d1b18181b362729202c403944433f393e3d47506657474b614d3d3e59795a61696d72737245557d867c6f856670726effdb0043011314141b171b341d1d346e493e496e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6e6effc0001108065f065f03012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00eb68a28a601476a28a0028a28a0028a28a0028a28a0028a28a002968a2800a28a2800a28a2800a28a28105145140051451400b45251400b45251400b45252d001451450014514500145145030a5a4a5a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a401452d140051451400514514005145140051451400514514005145140051451400b451450014514500145145001451450014514500145145002d14945002d14945002d14525002d14514005145140051451400514514009451450014514500145145001451450014514500145149400b45252d00149451400b45252d200a28a2800a4a5a4a0028a29280168a28a00434506981b14012514ddd4ecd30128a28a005a4a28a0028a292810a6928a4a0028a292980525145001494525002d14945001494514005251450014514500145251400b4945140828a28a06145251400b45251400b45251400b452514005145140051452500145145020a28a28185145140051451400514514005145140828a2928016928a2980514514005145140051451400514514005145140c28a28a04145145001451450014514500145145001451450014514500145140a00b34514522828a28a0028a28a0028a28a0028a28a041451450014514503168a28a0028a28a0028a28a041451450014514500145145001451450014b494b400514514005145140052d252d030a28a2800a28a2800a28a2800a28a290051452d00251452d00145145001451450014514500145145001451450014514500145145001451450014b494b4005145140051451400514514005145140051451400514514005145140051451400b45252d00145145001451450014514500145252d002514514005145140051451400514525002d25145200a69cd2d1400034b498a33400ea4a4cd1b85002d1499a6b1f7a0076ea4dd50bc98a6efc8a00b1ba973554ca01a955c114012134a0d44cd9ef4a1b8a0093349b8534b544cf8340163355a67da73522b7155af47eef75021d1dc02e56a75946719ac667280499e6acc32eec367ad0334c1a5a647ca8a5cd0217345252d30168a4cd19a00292969b400b4945140052514530128a28a00292834500141a28a004a28a2800a28a28010d14514080d252d250014514500145145001451450014514500145145030a2928a005a4a28a0028a28a0028a29334085a28a2800a28a2800a28a4a005a2928a00296928a630a28a2800a28a28105145140051451400514514005145140052d251400514514005068a2800a28a2800a28a2800a28a2800a28a2800a28a2802cd145148a0a28a2800a28a2800a28a2800a28a2800a28a281052d252d030a28a2800a28a2800a28a28105145140051452d002514b45002514b450014514500145145001451450014b494503168a28a0028a28a0028a28a0028a28a4014514b400514514005145140051451400514514005145140051451400514514005145140051451400b451450014514500145145001451450014514500145145001451450014b49450014514500068a0d140051451400b49451400514506800a28a290051451400514945002d1494530169282690520169a5b9a71a859b9a009334ddd51492ed5a816e067934017378a696aac1fbe691a703033cd202669ca305f5a199bae6a94ecedf320ce2a03a898f225e2802d4f7fe4e779aaa75953deb1b50bdf364214f1540ca4e6981d049abae09cd4635d553861586cfb80e6a0663de8b01d28d62273d6aec5a8c4d801857141c8c735289d860ee3401dcadc8f5ab0240c320d7150ea122800b9c0ed5a30eafb31e9401d0b499e3350cf379519726b0ee3517c8f2d8f4aa736a32c8843371e9480da8b5842f8638ab13df46f00f9bad71ed21c92a68372f80031a3503a07b85789941e6a38af36e067a706b32d1db9c93c8a6876de7eb4580ec74fb8124439ab3bf24d6069370146d2d5af1c9d4934c45a0c0d19aa6b29129f4ab01e981252d341cd2e680169334525002d1494b4009452d25300a4a28a0028a292800a28a2800a28a2800a28a280128a28a0425145140c28a28a0414514500145251400514514005145140c28a28a0028a28a0028a28a04145145002628a5a280128a28a0028a28a005c5149466800345145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a05002d252d25001451450014514500145145001451450014514500145145001451450059a28a2a4a0a28a2800a28a5a6014514500145145200a28a2800a28a2800a28a29805145140051451400514514082968a2800a28a290051451400514514c028a28a0028a28a0028a28a0628a28a2800a28a2800a28a2800a28a290052d1450014514500145145001451450014514500145145001451450014514500145145001451450014b494b4005145140051451400514514005145140051451400514b45001486968a0028a28a002928a2800a28a2800a28a2800a28a2900b49499a33400b494d2d485f1400ace051baabb3ee39cd4535d2a03cd005bf30668320acbfb5f524f155a6d5957a1a00db12026a5539ae61356663c5695aea1b97e6a4069cf208d09359e2ed4b9e6b3b55d57f815ab23fb41979cd006ede5f051906b224d4c87ebd2a85c5f9938aa7e61269d80de5d624d9806aabea92ef277566f9bb6a37932b42423722d6a5db8c8e6abcd70f393b8e4d63894e78a9a3b96069d809a4c8a859f8eb4f794b540c714c448b27bd0e73ce6a10d4bbfe5c531885b9a7092a266a6eea405b492a60fd39aa4addaa40db68b0175a7217ae6aa4d3134be6f06abc8771eb4ac03bcd38a54739a8c0e7ad3c0c6734017ada7d92827a549e786662056787fca9165c134c0d6827653c76aba9aabe71dc573e2e083c1a72cfc9c9a00e922d4d8b55e17e5b685ef5c947707756c584c199775023a781f728cd4b9aad6ee0815335218edd46735116a7a1cd003e8a28a0028a292980514514005252d1400945145001451450014941a2800a28a280128a5a4a0028a28a04145149400514b494005145140c28a28a0414514500145145001451450014514500145145002514b45002514514005145140051452d30128a5a280128a5a4a0028a28a0028a29680128a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00b345145494145145002d14514c028a2814005145148028a28a0028a28a0028a28a60145145020a28a2800a28a5a0028a28a4014514500145145300a28a2800a28a2800a28a281852d252d00140a2814005145140051451400514514805a28a2800a28a2800a28a2800a28a2800a28a28012968a2800a28a2800a28a2800a28a2800a28a280168a28a0028a28a0028a28a0028a28a0028a28a0028a28a00296928a005a28a2800a4a5a280128a28140051451400514525200cd14948cd814006ea4dd5197c0cd44671b4f3401317155a6b955cd567b95dc72d59fa95f2221c35202cdd5ee17e435966f7e7396cd669d401cf26aab5c12d9cf15490ae6a5d6a048daa71553cddddea919324f34ab2114ec2b9ab0e33d6ac4b73e526035654770569b35c96a561dc927b82ed9355de5c8e2a22f93d698cd9a617242d9ef464545ba804fad022c70474a6498c7a5206e948ed458060c53b38ef51e79a334012173eb519249a4c9f5a414c09074a46e9c53874a8dcd002669539ea699c53d68026414afc0a8949cf5a5663ebc5017149e28da4d228ef52642f3400dda0714bd075a696dd4d66ed40016e69a48eb4d2d4c2680260ddf346e1daa10d4b4016a2619ad0b79fcb6539aca8cf35637e2803b5d36e166db839e2b4a460839ae4341bd11cc03b715d2dc4824872869319279818e01ab318c0ac6b494f9ab5b2a78a403a8a4a28016928345300a28a2800a4a5a4a0028a28a0028a28a004a28345001451494005145140051451400525145020a28a2800a28a2800a28a28185145140828a28a002928145002d14514005145140051451400514514009452d140094a28a298051451400514945002d14945001451450014514500145145030a28a2800a28a2810514514005145140051451400514514005145140051451401668a28a92828a28a002968a2980514514005145148028a28a0028a28a0028a28a620a28a2800a28a2800a5a28a4014514500145145300a28a2800a28a2800a28a28185145140052d252d0014514500145145001451450014514520168a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00296928a005a29296800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a293345002d14526680168a4cd1400b4945148042693348edc5461fbd004b504d28de1475a64b371c5664b765262cc7a5005bbab90b94079355a49045065dab2daeda5919f3d4fe954751bd2d845638140896f2e9f7b321e05655d4cd26016e3d29b24e7a6e355cb126a920179f5a696c51934ca64b1ebcd4a951a8e29ea714012138a81d8eea7b3f150b1e680169334d2690b500389f4a7ad4429ea71401267141a6eea0706801adc3507814adcd2500006693a1a7a8c034cc73401239c2d424d4afd2a163c50002a45e49a892a641400a0f34139c1a4eb9a51da801eab4c91b3c53c90a2a12771cd00286c0a6b1a2909ef400d349c52e7f0a3b5030146681fa525004b1d3d8f239a895b14f0deb4016add8ab039c5753a75dabdb9476e7b57201aae5adc3a30c350074501c5c8fad6fa72a2b93b4b8df32e6ba985b31835208969453037cc453a818b451494c028a28a0028a28a0028a28a0028a292800a28a280128a28a0028a28a0028a292800a28a2810514514005145140c28a28a60145145001494b450212968a0d0014514500145145200a28a2800a28a2800a28345002514b4530128a5a4a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00b34514549414514b400514514c028a28a0028a28a4014514500145145020a28a298051451400514b45200a28a2800a28a2800a28a298051451400514514005145140c28a28a002969296800a28a2800a28a2800a28a2800a28a290052d252d00145145001451450014514500145145001451450014514500145145001451450014514500145145002d14945002d14514005145140051452500145251400b452504f140094ea60a75201734cdd492b6d5a8d1f75004a0d381a8f38a7a73400ea6b301431c544ef8193400d9e508a49aa6d707cb355aeae1a59303ee8aaf713e22f4c0a404971781233ce4d61ddde1727d6a2b9ba273f3550f3096eb4d08b925c6c8c283cd519092493de9eef50bbe4d5210d24f34dce294914d63d79a602139a334dce28eb4c4481b9a7161daa3fe749bb9a403b76691a9b9a5cd0035a90d29a075a0054152700536933c5003b34b516ea706c5003db14f8d475aae4e5aa7cf1400d9383c547ce7a53f3de834008edc0a89fa539baf5a6b7340047d454e4e05451d3cfae6800cd286ef4cc906909a00591c9342f229869e940074ef4dfc2958f3cd34d0021e949934a6933cd002e68a4a51400f5a5a60a766801e09a991c85a8338a50f40cbf673bacaa7debb5d3ee3cc8539c9c57076d2608cd74ba5dd04287777a408da129176ebe95701ca835952cbfe98ee3a30e2aedbcde6423d714865826933480fcb485a801f4b4c434ea602d145140052514500145145001494b4940051451400514514009452d25020a28a2800a28a281851451400514514c028a28a0414514500145145030a28a2800a28a290828a28a0028a28a0028a28a0028a28a061452514c00d145140828a28a002969296800a4a5a4a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00b34514b48a0a28a2900514514c028a28a0028a28a40145145020a28a2800a28a298051451400b452514805a28a2800a28a2800a28a298051451400514514005145140c28a28a002968a050014514500145140a0028a28a0028a28a4014b494b40051451400514514005145140051451400514514005145140051451400514514005145140052d1450014514500145145001494b45002525145001484d14c638a00766919a9bb853643f2f14807a9a90544bd053b760668021bb90018a65b9154eea7df3102a785b0a2802e669e1b02ab6f03bd2f99bba1a005965e40aa57f78a83cb079229f3ca01da9cb561de313392cdcd2116fce58a12ed589797c5c360d2ea174c50203c5663364629a01af2162726a3dd4ad8151e475aa01c5a98cc690b521e94c4216205377734add29b4c4069ca69a69eb480526999c504d36801d9a5cd369e1462980940a38a28016918d233fa53579a007814f38c5346297af5a40317ef54bb8d33601ce68271f4a00776a69a4dd499a0009f7a69c52134673400f4a71a44e941a004cd1de9292818b4ecf14da527340869a29bde9c28003d29a295ba520a602d2d02933400ea28a2900eed4940a76da007c4d8ab705c32640354d00a953039cd033a9d36e44f6983f794d5db7b95494af6cd727677ad6f2654f07a8ad48ee95df7669580ea3cc1e5e453636dcd59f6b79bd4213daae44ff3521974714b4d1d052d30168a28a0028a28a002928a2800a28a2800a4a28a0028a28a0028a28a041451450014514500145145001451453185145140828a28a0028a28a0614514940851452514805a2905140051451400b45251400b9a2928a005a4a28a630a28a28105145140051451400514514005145140051451400514514005145140051451400514514005252d140094b45140051451401668a28a450b45145001451450014514500145145020a28a29005145140051452d00252d145030a28a2800a28a2810514514005145140051451400514514c028a28a0028a28a062d1451400514514005145148028a28a0028a28a002969296800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a5a0028a28a0028a28a002928a4a005a09c0a4a476e280115b269c6a38d7bd389a402d56bb7d91939ab1b82ad64ea770369506802c24a594366a459376066a95ab816e327a0a9a1258922802f0a82ee6f2e33eb4af2844249ac2bbbd334a429e284058854cb2e7deb40e1303355b4d88f95bdbbd55d5ae9a27010d202cdd4b8c0534c6bc112637726b2e29da43976e9556e2e08ce4d005eb9bf1165f3f31ac696e8bb924d559e7676393c66a2321fc2a921327b9977119355cbe69ad963cd231005508633669334868e8b4006693a7147d05373408716a6d213cd2f5a004ef4e0702928a0028a4a33400e18cd29a68a3ad300cd2335274a319a4018a72f14b814500252e4d251400eddd29a7bd1d690d0019a4278a4a4a004e69ebd29a3ad3b23f0a063c718c5231cf7a01a46a0419a4a4cd140c01a5cd20e694d3012969b4b4c404d14945201dba905251400e078a76698296900f068cd3734503240d4bb8d3013eb4ec50038371572cdf9009aa2aa49ab08db3a5006ca4fe5e181e95b167742540735ca098b02335a1a4dc6c97693c1a4076104a1862a40dcd66c6cdb77ad5c89f700deb48659ed49499a33400b9a292969805145140051451400945145001451494085a28a2800a28a2800a28a2800a28a298c28a28a0028a29280168a4a2810b4514503128a5a29084a28a5a004a28a2800a28a2800a28a2800a28a298c28a28a04145145001451450014514500145145001451450014514500145145001451450014514500145252d0014514500145145001451450059a28a29142d145140051451400514514005145140828a28a0028a28a40145145002d1494503168a28a0028a28a04145145001451450014514500145145300a28a2800a28a2800a5a4a5a0614514500145145200a28a2800a28a2800a5a4a5a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002969296800a4a5a4a0028a28340051452679a005a28a28003d29323141e955ee5ca464d004db81e94c93b532dc9d80b75a495f914809c1f969ac78a616f90535df11127d2802addde6c52075158d2cbbc924d43797b999876cd537b8269a0356de73d335ab65cc45ab9bb698b9e2b43fb44dbdab2ff0011a4c449acdfec531a1e6b2ecf2f264fad5792469e5e4f356dcadbc1c5319b32df25b5af0dce2b9cbabd33ca5998f355ae2f1dfab5536949ef42406835dec4c255296e1989e6a0de7ad30b53b0891d8b77a66e14dcd19a621c58e2a376a53d2986800c9cd1bb8a69a5ed40064d349a514868108714f5e9519a543cd031f41a0d36810b49451400ecf140a43d29b9e2801dd68a4cd03ad003b3466928a00514a71c520346680169ad4bcd358d00368a292818b4b4da5a009169ac79a1690f5a0028ed49450028a09a0521340094b4da5a60145146680014b499a2900b4b482968017a52e69b466801d9a766a3a5e680250d4e0fef508a5cd302712d4f04c51832d51cd4b13f6a4075fa45e8986c63ce3a568c4e63723b66b8db3b868650c0f435d25bdfa5c0032371ea29319b88e1d720d05b06a9472f9679e9563cc0e8194e6908b00e696a08e4152e78a63168a4a5a005a2928a0028a28a00293bd2d2502168a28a061451450014514500145145020a2929698c28a28a0028a4a5a0028a292800a28a290828a28a0028a28a60145145200a28a2800a28a298c28a28a0028a28a0414514500145145001494b4500252d149400b4514500145145001451450014514500252d1450014514500145145001451450059a28a29142d028a2800a28a2800a28a2800a28a2800a28a2800a28a28105145148028a28a002969296800a28a2800a28a2800a28a29805145148028a28a6014514b4009451450014514b4005145140c28a28a0028a28a4014514b4005145140051451400514514005145140051451400514514005145140052d252d001494b41a004a28a2800a434b45002668a6b1c1a75200acfbd9c79c91fbf357a57091935cf194cf7c58745a00d7dd9200a77071e95492e373e2a63284c66802763591a8ea236b468d4ed4b501140c54f38c0ae7d5cbe58f7a100c90e4926abbc9d8524d3609029b17ccf5606be93b5216661c9aa9753f99330a4339850a835492525c926908bd132c60b119355ee6e59cf26a37b9c8c0355cb839a602bb5445bb523b5479e6801ecdc0a650d9a6d02169541a6d483b500210698c2a538a8de8019413c51ed45001484f5a539a61a00281d68ed450048bc8a69fa52ad14009da814b40a004634da7374a4a0055eb526001518eb4fed4080d309a737d6984d0019a7034ca5534c63e9ac69d4c6a004a4a5a2800a4a28a403d287a17814d3400514945002d21a5a4a004a5149de945031297bd1de8ce68012814a68a002945251408751494a2800a514d345301dde8a4a5a2c02834aad86a6d03ad005c0e300d5e865e854e0d65f6ab3692aa9dae703d6901d7699782480249c9c62a6b797ecd72d1372add2b16d9fca1b94fe1569eed6475933d0d006de4127152c2fba3eb54219c48a1c1ed52d9499322fa1a405b2d819a78604544ff74d08c71401351488c1852d030a28a2800a434b486810a3a5148296800a28a2800a28a28012945251400b4945140052d2514c62d2514500145145020a28a2800a28a28185145140828a28a0028a28a40145145300a28a2800a28a2800a28a2800a28a2800a2928a005a28a2800a28a2800a28a2800a28a2800a28a280128a28a00296928a005a29296800a28a2802cd1451525052d252d300a28a2800a28a2800a28a2800a28a2800a28a2800a28a290828a296800a28a2800a28a2800a28a2800a28a29805145140051451480296929680128a5a4a60145145002d14514005145140c28a28a4014b49450014b45140051451400514514005145140051451400514514005145140052d252d00145145001494b49400941a5a69a4034f269569a7bd00e280296ab2b08b6275359d668b04124ce465ba0a9b51b8ff004b7407ee8ace9a5fdc803f0a00bd603cc90b9a9ee595895cf4aa76726cb32dbb926aa5c5d11df834014f5794e027bd5379711803d29b7b3f9928c76aaed9a621ac09e69f01dac5b3d2a3cd01c0c8aa01d2c85b3934c1d29acd42b718a0421e0d37e94ac69b400d34dcd38d47400e6a6e79a281d6801f406a5c520a007672298d4eef4d6eb400da4a75309e680177534d2525002e28a4a33400f5a522916968010d28341a683400a4d3694d02801475a5cfb520fad2d0210d369c714940098a4a5a298c7a9cd21e9480e28345c04c5252d14804ef45140a0072d2375a514879a004cd1494f5009140c46e2929f2020f34ca042514b450509451450014b4945020a5a414b4005028a2810a68a28a6028a753452f6a60231a453cd0684eb5204d9e9475e4535ba50a0d0068d95eb28f2db907bd5f07636dce437435848db181f4ab5f6bdc073d2803a2b19fcb8821fc6ad412f93741bf85b8ae72def0f98016ad51366c8c99f994f3401d18f990d246c2aa585d09a2049e7152072b295a432d29db211daa5a801e73522b5201e2969a3ad3e98099a6b1a1a9339140872f340a6a74a75002d14525002d25068a0028ef45140051451400514514c6145145020a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a4a5a28012968a280128a5a2800a28a2800a28a2800a28a2800a28a2800a4a2968012968a4a005a28a2800a28a2802cd1451525052d14500145145001451450014514500145145300a28a5a402514b45300a2928a42168a28a0028a28a0028a28a0028a28a6014514500145145200a28a2800a28a298052d252d00145145030a28a2800a28a2800a5a4a5a40145145001451450014514500145145001451450014514b4009452d140051451400514525002d252d14009487a52d237dd34010a9ceea8ae661146589e94f43cfd6b335c98088463ef13480cc13f9b78eedd189c67d2a39d4843fdd3d2ac4f1244eaa38216a8dedc91122063800f3de988896e9800b9e2a1b99c85fc2a112630c4f6350dc4bb947d29202b862d2f356256181b7d2aaa9f98d3cb9aa01189a61269c5f70a889a04296cd206a4a4cd301ecd4ccd2d21c5003d70cb51b714e43ce291e801942e4514a28024dc3a50314ca750029a6d2d21eb400d6a69fa539a9b40094da75262801281452d002d2d2528eb4001e948334b4b806801868a56cf34abd280128e69692800a4a5a4a0028a292801d475a074342f5a000e2917ad068a0043494b45031c28340ed4e55cd0222a7a7519a465c1a725002cf82722a3a7bd30d001494628a0614525140c5e68a55a09a04028a052b502128145140051451400e14134514ee0369c948296900ae7342b914948280243cf349cfad2d34f5a00951c820e6b4ed6eb36ef19ee38ac7ce2a78652a45006ee977ad14eaadf77a56f97dd865e8715c7c137cf9adcb4d471101e9401b618d4a8f5042eb2c6181a6bb147a432f138c53d5aab79a1a2c8a7432ee245004cdc834c53914ea67dd26810e56c1a7d444f22a41400b45145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a2929680128a29680128a28a0028a5a2800a28a2800a28a2800a4a5a3bd00145145001451450059a28a5a92828a28a0028a28a0028a28a0028a28a0028a28a005a28a2800a28a2800a28a2800a28a2800a28a2800a28a281051451400514514005145140052d251400514514c05a28a28185145140051451400514514805a28a2800a28a2800a5a4a5a0028a28a0028a28a0028a28a0028a28a0028a28a0028a29280168a4a280168a29280014c94e236fa52b6579a64adb90d022146c0c9f4ae77509ccf7aaaa78538fcab56e672b2ed07a035cecd70b1dd16ea149a43197f7acf337b1c1a825612c6a09edcd432b6e0ee0f5e6a167381cd310c91f1f2e7bd4523f4c535c9dd4c63400e07e634afeb488339fa5349e9400bda98deb4a49c534531099e283450698003cd3734bef486801c9f7852c9d69a9d453a4eb400ca75340a7e3a50020a7521a53d05001487d69c29bd2800238a8cd499a6b0a006521a3141a004a5a4a2801d4ecd3453cd00252d1d6940c8a006b77a4f4a711cd31bad001da92947340a005c7346da534500328a7629280140e0d3475a7a7514d7186a00730e01a653d0e548a4c71400ca296928024514f3f2a8a6af34ac7a50046c734275a281de801cdd05329e064537140098a6d38f5a434009494b4503014a69052d00029d4d1527ad0223c50294d25002d145140094b45140051451400b477a4a51400bda8a3b525002f140cd369680278df156e194e38acf07a55889f8a00dfd3751743b4f4ad66b849d7af35cb5aceaafcd69f98760643c8e68036add8f2a6a681b12565d85f2c980c70d5a1bbe60c2901a0a7348dd6990bee15262802390e16a48db280d4329f94d3e0ff54bf4a604d45028a0614514500145145001451450014514500145145020a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a2928a002969296800a2928a0028a28a0028a28a0028a28a0028a28a0028a28a002969296800a28a2800a28a2800a28a2802cd2d252d4941451450014514500145145001451450014b494b4005145140051451400514514005145140051451400514514005145140828a28a0028a28a0028a28a0028a29698c28a28a0028a28a0028a28a002969296800a28a290052d252d001451450014514500145145001451450014514500145145001494b4500341a5ce291a93ef03400e27ad229e2a367da84d2c6e1901a621c6a095b19a997e65cfbd53bb6f2e291f3d052032ef5b64879ea2b97b8f9a67e7be6b7ee1bf74c5cf3d735ce3b1f38fbd00246ff00bb74f7a899be5c7a1a7c67f7c07af150b12dbb3d68063579715131f98fd69ebc64d46680254ef8f4a677a37606053a342ec14502108c2e29bed524bf788cd44298077a4a5da7346de33b85301b452e39a5652319a004514adcd182003eb47bd000052fddfad2af3cfa5231c926801075a1bae285fbc3eb48dc39a007af514c6a7a70c3e951b75a0055fba693da85ce0d1de8013b535a9cc7a521e79a006d252d1400ab527de069807cb9f7a7a36d34008bd45390f34aca14fb1a4518228011cfcc6a33d6a497a9a8cd002a8e6948a45eb4eeb40011c0a4c548a01c8a418079a006e29ac3153310471519e57e9400d5ea29651f3514e930501a00647f7b14bfc469abf7853dc734011d14b48680245e28eb48bcd03b50034f7a5e8283de8fe1a00553499e69076a5340084534d3cd34d00368a28a0628a52381428c9a71e98a0432a45e41a65489d0fd280233494ea4ef400a3bd2528ef49de800a28ef4500149452d00029d4d14b400bda9297f869b4001a5a2928016a48db151d28e2981650e1856a5a5c65319e95911b7ad4892142306901abf7240c9d6b5ed6eb7c5d79ae6bcf6c839e6ae5addeda04749657037ec27ad6906ed5cfdab6f6571c62b5c310030e450c63e70486a75ab6621ed48cc1978a8ed89590a5005ca5a68a750014525140c5a28a4a005a28a281051451400514525002d14514005145140051451400514514005145140051451400514514009452d25001451450014514500145145001451450014514500145145001451450014514500145028a0028a28a005a4a5a2800a28a2800a28a2802cd2d252d22828a05148028a28a0028a28a002969296800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a5a004a28a2810514514c62d1451400514514005145140052d252d200a28a28014514514005145140828a28a0028a28a061451450014514b400514941a005a6e71d69690f3400c7e718a0d3437ce54f514fa00afbcf9ccbdb14f030a197b0aaf3b34372cfd430c549bcf925bd7b5021d04c1e3ea36e4d676a1746433430ae76e3e6ed4d96558ad9a4c8c7231505b4c25819b1b4b0a0665dfe5213bc8dc7a63d2b0d9be7cf1c1ad4d430ac46edc7dab19ff00bde868112ca36a920f438ff0a858ed707d69d37dc04771cd47bb3f9500236062a23d6a57f9955bbf7a6023a9a003a03eb52a3f971fcbf79bbd403e6703d4d39fef9fd2988738f9437a9a6fa9a553988afbe69a49208a0007cc6931914a9f7a957e57fad0033daa55218918cd44c0ee3f5a922f9413ed4c04383f852034a7e5cf3f7a987e5a404a070c3daa3ef526ee09f6a8c75a600bf787d6965fbe4d37a1e7d69cfc93fa50004f4fa531fae69e3dfd299d462900a9d1a8f514d53467bd3001c51d3341ed49400514528e4fb52013b51450298129f9a306907241a456f94fd6856c350087c83ad446a771f266a17140c4e8453ba5474fcfcb4843bde86e8181fad0a783f4a6e71f4a603f395f7a4ec69a0e0d2e79a004a7677458f7a6fb52a1c1fad00300a79f986691b863e9429c1228010f414da56f4a4a40397bd0a684fe2fa520a005a4e99a075a1b863400be949da947247d28fe1a60252514ea431945145021cbde9285ef494c05a7a77fa5329cbd6800a4a56a4a0051c1348697b523500251de8a280128a53d6814000a5a414b400a3ee9a41d69474a4a0029690d2d001480529a05301eadda9fd7151823f1a7c7480903722a6048c32f4aab9c126a7819baf6a04cd7d3ae7b678ae82d66578fe56ae4d4ec512427a755ee2b4ad6f725254e990197d29b037f7ed18cd36d8ffa4939a8f21c87cf03ad3836cbd4c7465c524334169d9a629a70fbd400b452d349a000f0281d291b38a750014b494503168a292810514525002d2d369680168a28a0028a28a0028a28a0028a4a280168a4a2800a28a28016928a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a2968a004a28a2800a2968a0028a28a0028a28a0028a28a00b3451452285a28a2800a28a29005145140052d252d00145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514530168a28a0028a28a0005145140052d252d200a28a280168a28a04145251400b4514500145145030a28a2800a28a4a0028cd252153d54d003b345315f9c1eb4ec8cd00432fc8c1ff3a91705734d9002083505b49b50ab1ef4010ea6c2388be7eef4a1250d65b9bfb951ea8e0dacac7918fce9b23a8d355c30c10050064cb9961677385cfddab92dba8b02f92a15462a8dc7dd8957ee97ce2ae6af394d391011d3e6a4339b9d8b33b7a1fcea8487764f4cd5fb8750cb10f4e7eb54265d9314c8a64b00435bb0cf20d449d0d3d78889ff006aa33956340013f28a630e38a7ba15553ea299ce2988003927d28ea686c85ff7a962fbd9f4142008cf047ad34f7a54e08fad0d8de7d2801a9f78539b86a6f7a7ba9183fdea0031b94e3af6fa5387caa79ed489c7dda711c1f61400c03d4d30d19e292801fd3229a3ad07ef1a693cd301e06475ef49ed48a7ad26793400ecf34de841a3b52751400a7ae68e68ce4514001e829297b53680168e68a2800ed483ad2d25002af53f4a551cd369ca7045004e0e6261e8454646453b76dc9f5a6e79fad2191d0334a6905002a1eb4e6c6d14c1de949f969884a5a4cd068015b1d683c014ded4be9400adeb49467834948053c8a4a293bd0038703eb40a0f5a2800a1bae68a0fa5002ad368cd1400519a28a0625145140851de928a4a005a72f5a6d2d301c7a8a414a4f23e94def400a286eb494ad400945145001452d02800a29296801dfc34da776a6d002f5a5c5369f9a00637268cd0693bd003b34e434ccf34a3a5311203eb536ff906062ab2d48adce281966097c8955f191dc55b4c4175f2fdc6e47be6b3738c8abb0b89ed847fc6bf30ff000a04ce8ec2e3e531bf6e3f0ab2db9660dfc2066b02cae191724f23ad6e2389e0dc0f38a3a8234a26f901a933cd54b27f32d939c76356f68c5218fa4a334638a0047e829d4c7e829d400b452519a005a28a4a0028a4ebf4a5a005a28a281851451408296928a005a4a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a5a4a0028a28a0028a28a0028a28a0028a28a00296928a0028a28a00b54514521852d14500145145030a28a2800a5a4a2900b45145300a28a2900514514005145140051451400514514005145140828a28a6014514500145145030a28a2800a28a5a0028a28a0028a28a0028a28a002969296800a28a2900b4514502128a5a2800a28a2800a28a281852529a280128a290e7b50029a290367eb4b40114c9bc7cbf7874a6c1279839e1d7a8a9739e6ab4a7ca94483bf0680267619da7bd528d7e6746fa83561d84c01ed8aab3a8d8493b4a0273480cfba9081716e4eec703daa2b8778ada251f776e48aaaf741e29ddc1df8a6acbf68d1fcecfccac56a90863dc6f58cb750734cbfba7bb6660088c1031f4a8b21042efd370a86edf12cc8bf2866cad245097280c092a8e0e47e35999cbe4f7ad6b3225d3a4b723e68ceeac97c668112a11f616f979dfd7f0a8b76ece474e94f81bf75227e3512b6dde3da81306c9506a1fbd4fdc78fa522f24fb0a6004e7e43dba509c13f4a6135267700d8e83068004ebf8d23724afbf146efba718e68946243f5340841d714b8e4528c1c1cf34a7b1cd3004faf7a7e73237bad013110727926900fde9e7ae290c85fad34539c618fd6994c057ea693ad39fb1f514d5eb4081683c1342f51437de3400b4868a5cd0020e68a4a5340067068e8692973da801295bb5251da81876a28ed4751408334b4940eb4012e418cfae69b9e948bd48a01e2818afeb4cef4feab4ca00286ed452ff000d002529a4a2810019e28a4a3bd002e68a4a5ef40c4a5a2822908296928a062d27ad2f6a4f5a601d68a28a4014514503128a5a281094514b400941a290f5a0078ebf85252f4c5277a620ed4ad494a680128a297b50020a5ce292819a00297b514a7a1a000520eb42d25002f734e5229a681400bd29b4e3eb4d340053b3c0a6d2d002834e079a6034679a62262430ebc8ab3687632be7807154b3de9e8e7800d219b12a9825122731bf38ad1d36e46f641e9c566c5279d678fe21d29b653112938c15ea29d80eaed00108dbd89aba8e1d01aced3a4f36dcb0eb56609031618ef4845a0c376334fa6055f4a3143184a404fc69dc6298e3819f5a71c75a0042df3014efa546837367b549d2800a43c9c505bb77a50302800a5a28a0028a28a00296928a005a4a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a5a280128a5a280128a5a4a0028a28a005a4a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00b540a28a43168a28a0028a28a06145145001451450014b4945002d145148028a28a0028a28a0028a28a0028a28a0028a28a60145145020a28a2800a28a281851451400a28a28a0028a28a0028a28a0028a28a00296928a005a28a2900b45145020a29296800a28a2800a28a2800a28a28185252d1400d201a42c54f34e3c5230c8a006272587bd4578bbed5f6fde50714924bf6795377dd73b734e2d9948eaac29019fa7dc89508ddf30e08f7a92fff007964fb0fcd8359eabf66d52400fca4138a5bdb868ac19d3a839a04634ca4da49bbef63f3a874a7df653c3e9f3524d71e72bca83ae3355ac2e0adcc817a3a10455202594bc91a60e003c53f5955dca50608009f7cd3da25f260753f2b7f3f7ab5a90867d262922fbf1e15aa466459ce63b9da0ffac1b4ff004aa9709b2775f43523b6d9d5875522a3b83ba43ea0e2980c4639c0ef4d933bcfd28ddb581f4344bcee3e94210d24e07d29a18f6a737dd1f4a8f9eb4c05c646734f43804546bcd2a9c1fc0d002ff08a25393c528e769f5a47fbd400b19f9a9e7aad44bf2b0cf6a91b01d7140872f29b49ef4bcf9a7d8530753f9d05be73f4140c64a793ee6984d39c5368014f283fd9a072693340ef4c41de90f5a5a0d001403cd149400a7a9a4a28a0028a28a6014514500252f4a4a2900bf4a075140a3f8a8001c1340e947426814862838a0f1f4a4a298051d2978348681094b476a28012834b45001451450014514b40094b494b40c4a28a3d681876a28345200ed477a294516010f5a28ea68e94c407ad14add6929005252f6a4a062d04f0290d07b5021452f51494a29880514829dd8d003694706928a005a3d697f845140083ad2528a4a005a41452d001d290d29a4340051da8a4140052d252d003d79142f045341c52f7a00bb6f2b47202a7bfeb53b3882e838fba45504279c1ef5699bce8bdd79a680ea3439546e4cf5e45684581230f5e95cee8329691067a1ae80fdde0f3ba93117978e3da941f9453172475a70e06290c4661c527321c0fbb4c94e5c20ebd6a41c0c0a603c00071484edfad009a4c7393400a83b9a75251cd002d14514005145140051451400514514005145140051451400514514005145140051451400514502800a28a280168a4a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800145149400b452514016e8a28a918b45145300a28a2800a28a2800a28a2800a28a280168a28a06145145200a28a2800a28a2800a28a2800a28a29805145140828a28a0028a28a06145145002d145140051451400514514005145140052d252d001451452014514514084a28a280168a4a2800a5a28a06140a28a0028a28a0046e869a09229c7a1a41d281105d442584a91cf5159925c3dabab6ede9deb63821bd2b1350db03ec933e5bf00fa520296ab388af23b84e51c5390a4abb3aa38e2a299a2406dee0928ddfbfb1159733c91011a390c87208ef4d8229dcacb6374f0b8214e719ef55b7182e03af3d0d5fbf7de88f70dba44181ee2b2c60b139f96981a972e16dd268cfeee4fe1f434c82765b76c1cfcd9c7b77cd41653478786e5bf74dc0ff67dc548b088a5193be22d8dc3a11486457118798bc446de38eb505c2bac859d4aee39e6acde3adbde37d9c80b8c7e354e49da538958914c061a519653f4a6b651b069e84946f4a0435bfd55455626015c01fddcd56ef403007069ddfea29b4e5e73cf4140870e30b4a79527de980f4a7ab7ca41e940c6678a72364807d299d0e29c839a00729ebf4a426843c91ea0d273cd3003f30f714da5070683f29e3a5003694f07ad21a2810b45252d03128a292810b4514500145029681d84a28a281894b451de81052e7229bde9d40011487ad2d252041474a28a0629a4a28a2e0145145300a28a28243ad145140c28a28a0028a28a04028ef4b487ad050514514082969294503105145148903451450007b5277a53d29298c0d14514805a07439a4a5ed4c4029d4d1d6973400940e283d68a0077f08a0d1fc22834009494b4940052f6a4a077a00534868a08c5001494b494005028a2801d8a5e98a4141eb40122b0eb53dacea9bb2b9e0d55152c04097da981ada54cb090719606ba691c3daef5eb906b94b1406e80ecd5d2d837990143f4fc280669c4ccebf85485b68e6ab593111053d8629f236f6083ea6900e8864973dea5a445c2e294f4a0009a50334d55e29c062801696928a005a28a2800a2814500145252d0014514500145252d0014514500145145001451450014514500145145001451450014514500145145001451450014514500028a28a000514514005145140051451400514514005145140094529a2802d52d252d494145145001451453105145140051451400514514802969296800a28a28185145140051451400514514c028a28a0028a28a0028a28a0028a28a0028a28a005a28a2800a28a2800a28a2800a28a280168a4a5a0028a28a402d1451408292968a004a2968a061451450014514500141a0d264d0213763ad267b507af3501942bec279ea2802484150c1bd73599af45bad4bb7dd03b5595be4597ca90e377dd3fd2a3bcb9448d9261953e9480e3b529d9a1546392a786f6aa135ebbc613fbbdeb5f52d39e6937423e5c640ac0b886485c865c55e8c6c4597e621fee9a88e558e291b2bd68523963f95021ec0f95bc723bd3edee1a32067233d0d3226ddba2c7dfa8fa1c7a1a00d5d5605216e23e8fd47a5659abb0dd1785e093d38aaceb8cd48c8c9caf3d69e8fb6275f5a8e9c0646334c05fbdd7ad44d522fde23da98dfad0806d397bfd29b466810a297f84d277cfad28ef4008795cfa75a5534d5f94d2f1cd301738e7de83f789a4a280607a5252e6928105141a5a004a5a4a5a062518a5c52e280b0da5a5c518a5701b4b4ec0a39a2e319453883474a40368a5a28012834eeb462801b4b4114a168109494f2bc526da2e3128a5028dbc51701b4529149408292968a60145145001451450312968a2824051451d08a630a28a280b052f414945030a28a4348414b4945310bd85276a5a4a0028a28a4014ad48294d300ef4b49e94bfc23eb40077a4ef4b45002ff0008a3f84d21e8281d0d0014869690d030a2928a042f4a56a4a33400629314bde83da80128a53d38a4a00514a7ad277a0f26801453d78c1f5a60eb4e2467e9401a764db658d89ff26ba0b3711e7dc57316ad9641e95b70dc9668d47d0d3037ad655f2d8e7a0cd4f00dcbe67f7ab36d88f9d3d6b494831800f005003d496271d29f489f7453aa40414e14dfe214ea6014b4945002d251450014514b40051451400514525002d1494b400514525002d1494b400514945002d25145002d145140051451400514525002d1451400514514005145140051451400514945002d1451400514525002d145140051451400514514016e8a28a92828a28a0028a28a60145145020a28a2800a28a2900514b45030a28a2800a28a2800a28a2800a28a2980514514005145148028a28a6014514500145145002d1494b40051451400514514005145140052d145001451452014514514005145140828a28a06145145001451450006909c52d1408613ed542fad8c8a19090ca722b4aa39137a30ce38eb480c3ba845ddb15605655e9f5ac19ef2f2d1764c378e8335d208a575621f6ca84f5ae7f5412cd23abb282bce3d6a96e1633eeb5579e20012b8f4ac9964663f33126b44b413c5e5c8024abd24f5f6359d32323104555900cde0fdea611dc74a53c0a606c51610062ac08a79386ce3ad329c1b29b7de900e8dc8947bd3bccc360f4a881c107d295c8ddc74340d133c60f299fa7a530fdcc77a6ab91d0d3cb871c8f9bda90c629e450fd4e69460f7e691be94086d145140805029297de800c7345141a601cd252f3462800068a3145031680334b4b8a402628da7352aa023a538a30c71c526ca488954d2e3152ed1d9694a6deab5370b1160d2b0f514fda3b5181c8345c7619b2940c7614a50ad20c7a1a2e16136d1b07a539533de9c148ec68b81118f1db8a3cb3e95617fdd34bc0edf2d2b8ec41e4b11d290427fbb56947cbc7e94a01a2e162af96cbce38f5a36775ab817da90a2b1cf3f852b858aa1083c8a0440b63a55bf2f3d0f2295a359003d1a8e60b144a6091432e4d5af2be6cbaf34cdb8278cd3b858acd1fb534ad5b11f1cf0298f18fe1a6989a2b6d34953ecf6a8cad55c4d119a29e56942d171588e8a936f1c526df7a006514ec714628b80da2971494c00e3b51452d20128ef4b49400514514084a2968a62128a5a28012834b49400bda8a0d14c03bd1494a2800a5a68a5cd0029a075a4ef45030a28a2900525145310b9a4a05140052d252d0025145140051de968ef400bde97f0a6d1de802ed9300f923a56ac67f7b14846d5dd5896edb5c67a568b4ceef1f3f282314c19d1c3cb3b90715a36cbfbb159d6ae1ad88ef8abd64dba21f3676f06802deddbd2977500d267278e94805cfcf4bde9808663b697e6ed400ea3bd264d19e6801d4526696800a28a280168a4a5a0028a28a004a296928016928a2800a28a2800a28a2800a28a2800a5a4a5a0028a4a5a0028a28a0028a4a5a0028a28a00292968a0028a28a0028a28a00281451400514514005145140051451400514514016e8a28a92828a28a60145145001451450014514b4009452d14005145140051451400514514005145148028a28a0028a28a0028a29680128a28a0028a28a601452d140051451400514514005145140051451400b45145200a28a280168a28a0028a28a04145145030a28a28105145148028a296801ac1bb531b7639a97b542ce79054d31999a8168984a8d8ecc2b32e34d37903dc46cbbbbf35aba9c65a125476ae52de7912774f35a3dd9efc669a4067dc5a3ed6620065aa323b71bb9c56899764ed1dc648279ff001a8655b58d8821c8ec455019ef8351918a958804ede9db35151710868a28c5200a775a6d2d0028a5e3f4a69e68a402f5a338eb499a5cd310bc52514940052d252d0014514b486252d2e29429a2e343714bb69e13d4d4a916454dca488821a9123c9e454c911e3d2a78e227af4a9722944812123bd48b163a835656265fb878a7ed97a616a2e57294da307a0c51e5ed1f31ab7b00242fccddcd0602d8de7345c1228aa6ee3152adb67a55d5882f4143c67a8a571d8a46df07efe452794076ab9b18f5c6290a018a2e1628f94b9e0d3d5197386ab3e5039e38a409ce3f9d1cc1ca40338f98647bd26cc7dc6fc2ad08f6f1814863c1e9473058a600f656fca9e37f66cd596881ce40a62c641c0145c3948be6f6cfeb4a06e3c8c1f5a9fcb663d30450ca5bfc68b858879cf3f9d386171de9f8c70e07d7b53842a71fcc52043060f5350c8ac3b6455cf2c118600fb8a1a23b38f987eb4d058cf099efc50ea1067bd5bf2d199739e948d12a9e1453b8ac53dacdf7ba7bd319083802ae48a72298d1f238c555c968a450f34ddb573ca233c6699e59ce40a77158ae32a686507daa7d9fec1a679793c5171588b66290afb54de5e0e0834bb3db8a7702bed27b52153e956761cfdd3479545c2c55da69761156c44a7b502120d1cc162a88c9e9415f6ab8b1f5c530c5ed4ae162a6d346dab5e51cfb527914ee2b1571462acf93cfa521887639a770b15f14953188d218cfa5171588a8a936d30ad3b8ac368a5a4a60145145020a0d14531852d2514805ef41ec68a3b5300a4a28a0414503ad140c28ed451408334668a28017b514940a005a3d29297da80240dd3dab4624dc1483e86b317ad69c18481646eb8da2803a2b3fba0641c9ab76ea63ba70878c6715916b27976ac5492fdbdaaeda4ee250db3e671d6811ac650abb98f028467979fbabfa9a8634dfcbb6ff00e556949c0c0a06380dab8028140cf7a3a500381a4fe3a293bd003b345252d002d1451400514514005145140051451400514945002d14945002d1494b400514514005145140052d2502800a5a4a280168a4a2800a28a280168a4a280168a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00b745145494145145300a28a2800a28a280168a28a0028a28a0028a28a0028a28a0028a28a0028a28a40145145002d1494b4005145140094514500145145300a28a2801451451400514514005145140051451400b45145200a28a280168a05140051494502168a28a06145145020a28a2900b452521cd031d4cfe22bed41638aab29693237628016ebca276348108eb5ce6afa6c138324326d971f77fbd5b16f12b9932724566eb96d3ac025b5cee5ea055263b1c8ddc720942c9f7c0fcc5573b870d9fc6adde3b4d86752b20fc2a396fe592dd22950155e01c550ac52619e94ddb9a94a6e1b90f1e87ad459a4215a2da01f5a664d4f1cc0a98dc0c1efe9519420d00339a3ad388c519f6a0437bd14bf85140098a5a4268a005cd25145030a514528148029c14e695549a9d62c919a96ca488d5453c296078e054e235ec2a411ee5e3a543652895e384b724715663889e838a99221d00a9963c0a96cb4881571d57e956557fd914d6c0c285cb1a98459ea7f2a9b9490d247031f9520563f77e5f7a9c4417b53fcb04608a9b8ec5611840703269c3fdda9f685e00a0a06ec68b8ec46138e453590f5a9847eac7348632d9cb1a2e04054fa7e54c651c66ac7978fe2349e5fef3d7145c2c425467814d2956768a6950339a570215c529403b7e152140c3ad2043eb4c08b1bba1a4236b838ed8a9c263349b334088829a304934f2193a734d5c9cd301368c60d33ca232549153aa1ce4914bb31df8a02c40063ef641a52485f51edd6a6d9f8d057bf6a2e0572c8cdf41df8a309f789e7de9ef196e475146c1fc58cd3b8882465fe13f90a42a4904f7ed52ba8047201f4a464624629dc2c45b1fd69873d3ad59546230694463a0eb4ae2b15761c6714dd84b74357820a5117b75a398394a223f5a5f2ffbdd2af1881a3ca145c39515047c707f0a044477ab6611d7029be59345c2c55f2b9e9479047f10ab411b9e051e59c74a2e162b7964f6a3cbf53564464f6a5f2c77a77158a7e5ff00779a3cb6f5ab7e5e09c0a6ec07a8a2e162a188f714df2cfa55d68c1028310e98a77158a5e51a6988d5bf28f6eb4d20af0cbf8d3b8ac5268fdaa364cf6abac9fec1a6143fdd34ee2b19ec94c2b8abaf167b540d11aa4c968828a79434d2b5571586d14b8a4a620a28c5140c5a28a28109462978a2988290d14500145145001451450014829692818a3ad29eb4828a043d3ad6929569e38e3c9000e3f9d67c2b9ad5d36dca6657fc28034b4e1be66dca4213b47d075abd69fbfbe6e3088bb45406616d6cd271d30b4ed2646cb3b77a3a01acb10c92878a7dbc84ee56ec6a08e7c0fa9a92375cb0079a10164313c52d41e7002954bbf438a02e4ace17ad20cb7278a5540bf5a5cf3400b8c5145140052d251400b45252d002d14945002d149450014514500145145001451450014514500145145002d14945002d145140828a28a0028a28a0028a28a0028a28a0614b4945002d14514005145140094b451400514514005252d14016a969296a4a0a28a2800a28a2800a28a280168a4a5a0028a28a0028a28a6014514500145145200a28a2800a28a2800a28a5a0028a28a004a28a2800a28a298051452d00145145001451450014514500145145002d1494b48028a28a005145028a0029294d2502168a28a0028a28a40145145300a28a6b36052188ebb8551b96d93aae3e53d455fdeb8acbd46e21f30ae4f03f1a0445752fd8248e60328e70fee2ae452457116f8c82a6b035491e5b02412d1af7f4ac98f539ad1018a4383da9946b6bda409b2d1280d8ae5278268018e40c17d0d6d9f1048c0bbe0f18c552bcd4d2f232ae8b9ed54931a315be53487e6a73e3a1a6d048dc1a9a39fcbc82320f5a87268cd021ed83ca9e3d299474a3340052d27e34a28109452d2500145146291428a9113269aa2ac4430326a5b1a43d11547bd4c801ff00ebd24593d179f535656103ef7cc4fe550d9a2446b1163f2fe75644402819fc2a48a36e07152794707dea1b2d2234232768cfd2a5113363271f4a95230a3000a7ed23ea6a2e3228a25c9603bd4a13de9e88140029fb79a5718c031d452e2a4dbed46df6a0647b4e0d2e062a5dbbb8c51b31480876d371bb3e95395a6e38a6045b69bb4eea971ed4df989e871e9400c2a3f1a4200e829e558ffb346c1cd0042dd7d69a094ea322ac6dc76a4d83b8a008bdc52724d48f1739029029f4a008f69ef46de0f152329c1e0e69a872a38a043093e94a327b549b73da942e3eb400c3b87a51b49ea2a4c7b5211edc53111b27a0a8dc000018a958f0719269a22c73de8023f2d539ee7b9a428378e79c54db01e5b268239cd004617d453f603d2a5551c50541a0088a62936907a1a97005281d39a40478f6a36735205a3ae39e29811edf6a36d498a314011018a36fb549b79a523b53021c7b518a9768f4a42a47340866ca4282a4c67bd26df7a604463a4298a97a75146d03ad3110114d2b564a83da9a52802a91c9cf34d3b4fb5596514d280f000a64d8a8e950bc5c55d31fe151b23723834d0ac6749160d42cb5a2e80f5150bc43eb5498ac51c5262a778ea22b8a6992c8f1453fbd215a7710da052e38a2a804e946683494c90a28a2800a05145301296814500251451498c5a5452c4051cd20c53d5b07e5e28112c4843ed3c56cdbb9984688b84438158b11392477ad582536d624afde6e0d0344da8cfe638893eea71f8d6a69ca5492dfddae68cc4fdd3f5356d2f26760159bd38a0474134a6595228b81d588ed4e69e38311c5f3b9ac9b5f3a79480c47a9ad6b581201b40dcdeb4c09add5b1ba4eb5751940f94542aa08ef9a746db320834809b79feed28cfa520607b52e680179a5a4a280168a28a0028a28a0414b4945002d1494503168a4a280168a4a5a0028a28a0028a28a0028a28a0028a28a0028a28a00296928a005a2928a042d145140051451400514514005145140c5a2928a00296928a005a2814500145145005aa5a4a5a92828a28a0028a28a0028a28a002969296800a28a2800a28a2800a28a29805145148028a28a0028a28a005a28a2800a28a280128a5a4a0028a2969805145140051451400514514005145140051451400b45145200a28a280168a4a281051451400b45145001451450014b494b48621a434a690d0046e839c573da8dc43fbc0a47983835d138254d737a859e279309f375a101cf9d5a78ade68339590771d2b25a67c6dcf19ab77f6f2acbb4a1e6aacb6d344a1997e535631b201d51a99cd0d80339e69bbfda9dc448632fd462a2652a4a9a90ca644dae7a7435164f43480027bd348a28a003b514b45021b4b9e3a5145002eef6a4c518a28016969053d466a4690f8d7a66ad46aa4fdda8e24e46455c587247159c99aa88f89491f76acc711eb8a6c4bb78eb8e956555b078acdb2d0aa87a54a89b72688ce7eb52edf5352c634af4a50bf30f6a50b8c9a5418233de914382d28028c5385001b69714629d400d23f0a4c0f5a79f7a38f5e28018d4dc8f4e69f93da8e9c034011ed03ad1e9c53f00f5346da40478cd1b714fe9d31498e94c06118a4db5215ee7ad262900cdbcd18c0a79a4a60478029a00e7d2a423148cb9c6690098a40bc53f18a3d68019475a762908a621840a4e38e2a4a4228018413415a7e3a5260d00314e3834ea36d2fad200c75a3140cd3ba5301bef4629d41e280128f4a3d28e6810743498cd29a318a6018c0a4c76a5a39a621bde93bd388068db400c2a3f1a31ed4ec0c5379a68031498c52e7069334d086b28a695a7d26334c44647b546cb53114c61c50042e80f6a85a203b55b2298c808e681141e3c1f6a859003d2afb2542f1d34c965075c76a6e00ed565d369f6a8d9462aee49015a6918a9429a6b2d34223349d29cc29b542128a292980b494b4531094a28a3a5001494a79349de900b4b494bda802585f191ea2ae4d70a2cd101e7bd67835248f923d85003d643822b4ac576c064cfcc7815970aef70338ab0ee5182ab74f4a0474b6016dd02e7323ff3ad58cac6bcb0c9eb5cee939dc8ecc18b7bd74036a01bb6e698cb08ca79069eac0d44abd29ebd6901252d3738a519a005a28a2800a5a4a280168a4a280168a28a0028a28a0028a28a0028a28a04145145002d14945030a5a4a280168a4a5a0028a28a0028a28a0028a28a04145145001451450014b494b4005145140051494b4005145140052d25140c5a28a2802dd1451525051de8a2800a28a2800a28a2800a5a28a0028a28a0028a28a0028a28a60145145200a28a2800a28a5a0028a28a0028a28a002928a2800a5a4a5a6014514500145145001451450014514500145145200a5a28a0028a28a0028a28a04145145002d145140c28a28a002968a2900525141a006b1158dab9657f32253bb1f9d6c6ce4f355aec298cab01401c85c6a714d88ae2328477c563ea2888f90ccd19ae92faced67cc4ecab27f03f715cbde4525b4ad139cff5aa4329384cfc85bf1a6739a73f6a6ee38aa10a7381499a5dc71d68e08eb4804e28c52e68278c50210d1494bba800a4a5a4a0028a2969058551566de2dc73d8546a338157ed612e42fe7512d0d20b526b787a1ef570478c52c4bb70315642e7b77ac5b36238a3c29cf5ef5381ed42af15205038a9188ab8c034eda4d28029d8cf414863769e9eb4b838a777fc28c6e53dfe94804c36053b18a4524a9e29dce071400719e283c52ed19e9477e94008738f4a4201e69c78ebcd079e6980854527e14ef7c521a4026de697b74a297df39a60371ed4dc11da9d904d068019cfd28ed4ea4eb9cd00371ed49f853b1ef49c66801bb714bc8ed4a40f5a4a004c5047b50483476a004c7b526da5028e39e690098a4c0ee29d8e94854d310cc0cf4a3e829d81f4a36f7a06328506979a5039a40274a5e3d28c63eb49fca81016fca969063b75a51c9a60252f1472281838a000d14a3ad1f85021b9cd2d2f6c526d14c038f5a2971d28fa5310da4c77cd388a38f5a6030e690f3d69f8a69fa5310c3cf7a69c8a7f624525301b4d61c734ec534e7046281094cc1a7d27279a008b6920d46e9e956314c6c9ed408a32a363d6a30030e0735799322aab26c3bbdf9a689656da4134c916ad489c865e9514b19eb8aa4c4ca8c2a3a9dd6a12306ad09a1a68a53482a890a28a298828a28140051451400514506800a5272693bd039a007a72d4f50776df7a8fa74352f985805c723bd2034a28a586259037ca6b56df508d14020990f19ed581179f22ec0588f4ad7b165b5ff591649fef76a6236a2ba56fba1bf1ab71ceaa005059bbd661bb89388db7bbf40b57ed50aa824fce6802da038cb72d4fa6229fe26cd3e90c28a28a041451450014514500145145002d251450014b494503168a4a2810b4525140c5a28a2800a28a281051451400b4525140c5a2928a005a28a2810514514005145140052d251de800a28a2800a28a28016928a2800a5a28a0028a28a00b94514549614514500145145001451450014b494b4c028a28a0028a28a401451450014514500145145002d1494b40051451400514514005252d2500145145300a5a4a5a0028a28a40145145001451450014b494b40051451400514514005145140828a28a005a28a281851451400514514804e693737a0a5a4cfb53023919f195c566dfdec96e733448e87ba726afc980491d6b22fe5729f3c0dfef2d2032aff5a85a228b1063db2318ac1bbba49e20a54039c96ef57af83b49f2248c33e9cd655e33ef1bd181000e460d524172bc801ef5111da958e49a6e714c5714f4a41451400bc77a0f4a4a3b5030c5252d2502169692945200a7a2e4e6914648153c4809eb49b2921628cb1cd6c59c5f778ed546dd37bae0715b10ae38c563291ac1587aa6768a9c2819a441823a74a900accd04d9ef4f0b8a314e1f5a431063bd2f4a2839e31400b8a5a31ea69dd68013a518e053b0293f1a4020f7a08e78269dd7bd14009d3de826979cf5a39cd003703ebf5a33cf03f4a71e293934c043e9d293f1a7503a76a0067af3463de96908e28189d3bd277a7521a0434fb5078ef476349486073e9494bdb148734084231ce693b53a928013268ebd69793462980949cd38802939ed4804c1f4a3b1a70a4f5c8a6030eee38141a77149f8d2013eb41a3f0a52338a004c0a324638a0ad2fe14009c1ed401c7039a39f4a29885a4edd28cfa52f4a0028a5e879e68e334c4201ed40fa528c7ff5e8cd3101ce734d239a777e4d18a621b8db4dfe2e053caf23f9d215c670734c08f19c8a6fe74fdb8ef4d23bfbd0034e690f4e94e6c6691890307a7a5310ce281d29c7eee3349400da31c9a5e28c64d0044cbc1a8190f5ed56d85478e3a504950a8e4114c2a36f5ab4e9c530a7a74a6067cb1fa1aab22e09ad39e20074aa33a607157164b2b520a774a435a10c3bd14514c4140a28a000f268fe74945002d1499a2801697a6714da5a2e02559b788bb00077a8463b0a9a39d94055e2901b30db3db947668cfb66aec8f1b26650b8cf03deb1222dc492f2bfddcd598a612ca249bb1e1474a6266e5b2844ddb1467bf7ad2b75254331e4f4acdb5b98e4c2803a77ed5a481580ebd2931a2c293eb4b5147953c0c8a96810b4514500145252d00145251400b45145001451450014514500145145001451450014b494503168a4a280168a4a5a04145145001451450014b4945002d14945002d14945002d14945002d14945002d14525002d1451400b45251400b45251401768a28a92c28a28a0028a28a0028a28a005a2929698051451400514514005145148028a28a0028a28a00296928a005a29296800a28a2800a4a5a280128a28a005a29296800a28a2800a28a2800a28a0d0014b45140051451400514514005145140828a28a005a28a281851451400514514804a36d2d1914011490860726b0b518af62dc63632c7fad6fcae1509cd55747604b605008e02f2e6e6394ec91d7ebd4566cf34b2b66572c7debb9d434c8a4467700c847073815cb5ec007eed55460f5aa4c763208073934da9a780c7dc7e750d32446a28a281894a29281d6800a5a28a0414f0299de9ebd293043d463352a1ed4cc702a5810337f4a865a2fd9a924002b5a15e39aa76480638ad189702b066e872a926a402803bd2e2914006297bd18c52814804fc29c0714a00a5e94804c1c6714a28ed4a680131d28c0a31d28c50018a3a52f14bc63914009b71da8da73c538628c7a1a6030820d1b4fa53f8ee693a8eb400d2293029c7a734cc1f5a0038a69e697951d68f5a0069e29319ed4ece451f4348630d2714fc534e280133ed480d2d211de800e0d14525002f6a01149c8a5e94083de81473473400514ea0f22801841cd378cfad3fdbd2908a00693c7147f0d2b7e94500262907d29ddbad14c06f7eb41c53a8c0c502131462979a51d3a50213191484629dd47bd27e46980831faf5a39e2978f414a3a631cd31063db149cf438a53d4519e6a80461da98c0afdd3521c71c535bb5021a54d31875a711ef4d7eb400cfc290e7d28cfe5498eb400638a28a298831ed471de8028f63400dc673914d35263d29180a0442dd3a544e31838a9c818e698c32b408af2fcc2a8cfc8c62aecbdaa94fc552114d8534d49262a335aa336145252d31051476a4a601451450014519a4a005a5a6d2d002d3c30c10dc5329548dc09e9480bb668b2677498c55fb59e058806077671c0ac747d8df29e08ab9692aa80aebdf826a846e055283f873d187f5ad1b5f3861263f2e3820d678c4b0001c7080d5cb372510eff971480d74231853c53b155a32eec0a1c2ff003ab193de900b451450014514500145145002d1494b400868a28a005a28a2800a28a2800a28a2800a28a2800a28a2800a28a280168a4a5a0028a4a5a0028a28a0028a28a0028a28a0028a28a0028a28a005a2928a005a28a2800a28a2800a28a2802ed14515258514514005145140051451400b45145300a28a2800a28a2800a28a2800a28a2800a28a29005145140051451400b4514500145145002514b45002514b450014514500145145001451450014b494b40051451400514514005145140828a28a005a2928a005a2928a005a2929690c0d21507ad29a4c66801ad1a91d2aaced220394dabebd6acb291d0d67dfdd5bc6196e64da280332eedcbee7790be7a2eec5739a807625513e5cf18e735b1777fa6e4ecb862d5cf5fde032b7912b01ed458772a5c40d12e5fe527a0ef55cb0f4a591d9cfccecdf5a8eac4c534941a2810b450692980a28a3da96900539692a455e3352ca428e48ab9671ee933daab44bce715a7631639ace45c51a56c800156d07350dba935616b166c3a978eb4b40c52180a500f3453b07140001c1e697b51c51d69005069297b500145147d6818a3a75a5fad3777140e714087e45267af34dfd690fd2980bc8ef49934639a43da80173c527341fa52670318a0618e683d693763b519a003b1a4f4c504d373ed4805e4d213c519cd1c5002527e14bc7a7345001494bea68f5e28013f0a314e18ef498a004ee6947d28e28c500141a5c52714084e474a4c53a9334c06e302929dcfad2114009d7a0e28a51494083141a4fc68ea4f3400bba9739a6d14d00e34ddc051499f4a621783474a4cd19f7a0429346e5c5349f6a6e7934c07eea4cfb53738341269883b904d3490294e69a4e0d0030609eb4734ee292800e290f07a52668c938a042e694d274a75301bf8d275f6a7521fc2810ce6a36e3352d46e060d0055987bd539978e6af4a32bf8552724a904552132a3af06a1a9d97ad427ad6a8cd8da5a08a4a620a28a281052529a6d318b45149400b4b4945002d2d3696810e5049e2ae473ab5b88d93e60786aa43daa48ce481401ac2431a22a9cb301f856f698a8f00054123ad72b112928df935d1e9d3c2a32858d0246e46000369e9daa5073daab453ae073532beefbbfad2024a28a4a005a5a4a28016928a298051451480296928a005a28a4a005a28a2800a28a2800a28a4a005a4a28a002968a29805145140051451400b45252d200a2928a005a2928a005a28a2800a28a2800a28a280168a4a280168a4a5a0028a4a2802f5145152585145140051452d00251452d00145145300a28a2800a28a2800a28a2800a28a2800a28a290051451400b4514500145145001451450014514500145145001451450014514500145145002d14945002d1451400514514005145140828a28a0028a28a0028a28a002969296900521a5a4340c8a44964046f0ab5937ba3dbc87e6ce7eb5b5b877aa775247147248f80077345c0e5aff4740bfba551c7535cb5c47b2423703f4ae9757d4e7b88d85ba7971f4dfeb5cc49c1c679a6ae1a910525b19a69a5239a4aa402528a28a042d2d20c9e29fd0500329dda92945008728e454b8c9007414d403193d7a54d0a6ecd4365224b78b738cf0b9ad5b651f80aa36c99900ad2b75c1c5652368976dc7cb53ad47082454ca2b22c0003ad2f7a5f5a334861d697eb49d683400b476a3d851400bd45252fa5250014738e947e34bed9a004c6694818a3f1a0e78a062718a338ed451d32462980991ef487e94a739ce7f2a3e6c5201ad8a3b9f4a5e4d263df34c04efd38a334bdf149d28013f1a4cd1de8ed4804e3d68f4e69707da8e7d2801297a9c76a4a3340063347a8a4cf41464e3a5002f2293d4d264d2d002d1477a39f4a005a53d293231464e6810948714bf851400d27da938a77e14d229809c714a681f4a2800a6d2d14084c514b476a6842134dc53b1cd2530138cfad2d2fa0eded4679e334c426d269a569f4d6f62680107a529e9c8a38ce30686c6298861fce9bde9d800d33a50026dcf6e290119a3da834009f8518e82978a00f7a042f0322947ad27d68cd300e292971ef463de810de314c651c0a7e38cd348f7a00af28c74e954e55e6afb827155a7008cf7a68467c8bf355771c9ab928ef5564539ad22c8647494ea68eb5648878a295a90f6a002929dfc3494c42514b45031b45145002d28a4a5a005a9ad584532b9ec6a11562d61333edc81e99ef4089d262f36e93919e95b3689861247f74d65c76fb09121e9c56c59472f90aa881971408dab570000e46eab7b8553b68cb2a99630ac2ada802900ea28a280168a28a60145145200a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a29805145140052d251400b45252d0014514500145145200a28a2800a5a4a280168a28a0028a28a0028a28a0028a28a0028a28a00bd451454961451450014514b4005145140051451400514514c028a28a0028a28a0028a28a0028a28a0028a28a005a2928a402d1451400514514005145140051451400514514005145140051451400514514005145140052d252d00145145020a28a2900514514c028a28a0029451452185252d1400c383dab2b5557b92230a4228c935af902a9df49fbaf91f183c8f5a6238dd52d2eef240a9114817f0fc6b3868f2313f3200bd496aeaf51bf91e3c2b609e32fc571ba8c8c6e19778651dc74a11425edada41161252f2f7c74acf38c53dc9fef5474c4c28a5a2988169d9a4ed450028a722e580149b71d6a6550a849ea6931a17827e5e82a4881c8c542bd6ad46db718a86522d40bf30f5ad2b61cf4aa56abf9e6b52dd028ce2b191b44b09528a620a78a8283bd1dcd2e3bd18a4312949e051e941efc5030ed4a338eb498a3f0a005cf4a290734b4083ae2968349f4140051cd2d21a0031f4a4e053870791498ef400849cff8527a53a9b8fad030a1b1f5e946314981e9400873483e94b8f5a4c500271e94608a5f6a31400df7c66834b49de8013a75a4c0e29d8a43c1a06211494ec714dc7ad0201da9c29bc53874a06281462941e29281098a5a4a5ec680109a29693ad0210e2907269d8c5250020e73e9460714138e941edfd69809b7de931cd2f5347eb4084c51c521349c9f6a602f4ea68269369f5a36fbd310b499146ca4da3d39a621770f5a6e4734bb4e3fad26c3d6800c8fe234ddd4acbc669983c714c405bf0a424e30694814d3c679a003f1a41c8a3de8e702800cd1de93eb47e14085ce2933e949d695718e2980bcd1dc504d039a041d29ad4ea43401130c8e955e55c75ab4466a19578cd0228c8a0e6abcb1f1571938355e50369156896522b4d3523532b44431b494f3c0a6d3105252d25300a4ed4b48680128a28a062d2d2034b4089230339c55b8e3795b28858d5789891b78fad5fb1491c36d3f2a75f6a0459b5b50db77b7a7cb9adfb5f2c0088acb8f5aa96b14263186f98d69c6b1ba8242e71401611171c5498c5471e00e0f1520a43168a28a62168a28a40252d145300a28a4a005a28a28012968a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a5a28a0028a28a40145145001451450014b494b4005145140051451400514514005145140051452d005da28a2a4b0a28a280168a4a5a0028a28a0028a28a0028a28a0028a28a0028a28a6014514500145145001451450014b494520168a4a280168a4a280168a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00296928a005a28a2800a28a290051451400b45251400b451450014514500271556f157c86c601f5ab25b1daaa6a0cad6ecaca7a50071babdc3cb3ed906d8fbd61dd2a094984ee8c74cd6a6b1b7ccd899c0ed58b20c1229d8642e7269a3ad2b75a4a6842e68fa5029f8db83dfd29884a28eb4b40c7025864d483fd59cfe15171c549d454b04391726ac44b9200a817d855cb64da07f78d4365a4685b26dc569c6b841542d531c93cd684558b3644a9c0a7d229029ddaa4a0a3b52d14009d28a523de9334861de8a296801319e68f6c9a053b03bd002527e34ea3814084e683c0eb4b83c9346298067148738f5a5eb484f34804a314bc51f4a004c7d68c1f5a5fa8a31c73400dc5274a7e293140c8e8da69f819a314011e0d0578e952714d3400cdb4734e1cd274c5201bb7de8a70a4c5301b40e051da9690051ef483ad2f34c000a314b8a4fc2800dbea28c60628a5a0434d2633da94f3477a006918a4f7a774e4d27dea004c0269768a76d03b8a062980cdbed453b6f6a6aaf5eb4c41f514a00a072dc76a5e4718a684c4dbd4f7a691ed4ee7d71498a62136f181cd26d1e9f953bb1273ed4868018cbdf0714d2a4f4a7e7dff0a4cfbd31119527a5378f5e7d29e7d8d34f18e6801bf5149b8d29a43400668a4fa9a3bf6c5020ef4840ec694f5eb4b8a004e94719a5c51da800e31d693d69718c514c434f4a8dd4e2a5a69a00a8df788aa93000d5f997af154a642723be2a912ca52a7cff005a88a919a9df250e7b5455a2218c6e99a6d3fd453055084345291494030a4a53494ee20a28a281852d252d0225890b9c645692a3db15d8c18119e3fad65283c55bb5b9f22405b95f4a046ea6d740e9c7ae2b6ad955906076ae774e944f26003b73d3d2ba6855446005a00b08a00a753554014b400b45145002d14519a0028a28a0028a28a002969296800a28a2800a28a4a005a2928a005a28a2800a28a2800a28a280168a28a0028a28a0028a28a401451450014514500145145002d14945002d14945002d028a298051451400514514017a8a28a82c28a28a002969296800a28a2800a28a2800a28a2800a28a2800a28a29805145140051451400514514005145148028a28a0028a28a002968a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a5a4a5a0028a28a0028a28a40145145001451450014a29296800a28a280119828cd54b88cc8a4b8e3b0ab7814c95b8a04727a8e9e88924b29dbd70057333411f96efe605618c2fad755ac486e599788e253c9f5ae52f591652b0f31afdd2682fa144e14f229bef4f73b9b34c3d6a8962af1c8a0fa9a41450214502826941a06281cf5a900a60c54e8bf2f1498d0e8972d57adc1e2aaa02c4002afc2400140ebc66b391a22ec1db157a1c73552151c7726aec431dab166889860629693ad3bd290c2968e290d030c5277e94bda83cd2013de979e3de8f6a38a00293bd1d28cd002f4a5cd333cf346e14c0751f8537a7d280e2801df8518c76a6f27da9d4006334638e0669474a503a726801bf852e3da978e452d00336d18f6a71cfad27d3ad002151c629a7029f8f7a4c66900d6f6a4c538d2628191e39349f5a90f7e6908a008fae69314f3c5348c77a0043d68c734a2822800028fe54034b9a004fc68c71ef450723340011c75a4c8a5f6a5fc29884c51b47ad2d263bd001c7349d6979e68e6800c51c8e01a067e9467d29883b9a4ec69703d6928013d852a8e0d1d8d2019c53420efc518a500628c0a621ac38e7f2a6b02463814fc93d0669a7e6383da98119c64fad33233c538e2984739a0043d2987eb4a4d349a6213f1a6f34bfca8e3b52010648a5e4520a5cd31003eb40a334018a005a5ed49c1a5ef4841e947ad1ef477a003af6a4238a5cd35bda98114abb94d54946467b8abadcd559063229a028c807a75aaccb826af3a80a38a81d4646462b44c8655228c6ee6a4750adc1e299d0d51230d36a575c54645342621a28a4a621690d2d25030a7034da5a043aa6894161bbeed3232bc8619e2aeda8322ede368ef4580b7a797b497214918fd2ba6b39d678c147acb4b78f624b6f9caf507fa56a4303101800adea3a50c45c543fdea753222f8c38e7daa4a0028a28a0028a28a005a29296800a28a2800a28a5a002929692800a28a2800a51494b40051451400514514005145140052d251400b4514500145145200a29296800a28a2800a28a2800a28a2800a28a2800a5a4a280168a28a0028a28a00bd45145496145145002d14514005145140051451400514514c028a28a0028a28a401451450014514b4009452d140094514500145145300a5a28a004a5a28a40145145001451450014514500145145001452d25001451450014b494b4005145148028a28a0028a28a0028a28a00296928a005a2928a002a295b0a4edcd4b51ca030eb401c76a886e24652ac983fe4d7337086295948ce0fe75d4eb7824a2bed65279ee7d8d72970cc24393cd31909dbe98a6538914ca648bde8a073477a0029c29b4f1c0a062a8cb5595e4605451ae00ab112e391daa19690f8949702aec4a0ca1476e2a0890e0f3ce2addaa85e01e6b365a342dd79fd2ae46bd4d56846d0028c9ab518e6b22c7d039a052d0c61ef9a3de8a0f5340c3af7a4e68c631ef49400bc628cd21e00a09f5a000918a6934a68da7148634f39e781411cd3b6d2a826801b8f53f9d3853b68a3da8108322970077a3a502801c0514801a5e3eb4c051814bdba52638a5a0421a314b4631da818def41e7b52e00a2801a4703d290639a763af14de314c00aeea630e69e7da9ac39a40329a453b1cd373cd2189da8e6978e941e302801314bd28ef462800c734628f4a7761400ddb9e69307d69ff8d376f7cd001c8028edc8a5a4ed4c41475f6a3b519e07ad0213a77a4e94ef5a4c934c006293da97f1a4a004e6818a09f5a3d39e94c41db93413c62939cf5a4a6202698c714e3ce79a6373de980c6fa530e69fc9a69503a9a0430918c534f4e952118a69e68023eb40cd3b19fc28c53109ed8a38f5a36d2e38a004cf3d78a53f5fce93a9a0679a0051f5a3f1a4cf02971cd002f5cd149cf5a5ce3148414503af141e2980c702aac8b926adb0f5a85d064d0053652401e955a450463bd5e75c7d2aacc9c8e306ad12cacebc545835a1e5ab4438aa8ea636208f94d52643446d9c7b546477a95815f7cf7a632f15484c88f5a0d29a4aa100eb41eb450680014bd6929680252a55471f8d5bb37f9d7e5fafbd524cb719ad0d3602f2e587caa79c5023a2b5b62210f01f98f247635a903318d7726d381c556b731380d1120e3f0aba0f00e2801f9a2914e69d40d85145140828a28a00296928a005a29296800a28a2800a28a2800a28a2800a5a4a5a0028a28a0028a28a0028a28a0028a28a002969051400b45251400b45149400b4514500145145200a28a2800a28a2800a28a5a0028a4a5a002814514017a8a28a92c28a28a002969296800a28a2800a28a2800a28a2980514514005145148028a28a005a29296800a28a2800a28a4a0028a28a602d14945002d145148028a28a0028a28a0028a28a0028a28a005a28a280128a28a002969296900514514005145140051451400514525002d1494b40051451400948c3229d4d2d8a00e6f55b257b891f39663d00ae5756b610ca17be2bb8b959b2498f2739fa5727acd94cd31958633d727140fa1cfbaeda654b22856e4d47dea912c3a7d6969297a8a00402a5c73d292203396e9521f9b2693290e45381ef5654fca117a93510230aaa2ac44a3a0eb9eb50cb458d9b201b7ef1fe553da76f5a89c60601e054f02fddc75acd9713461e147ad591803355d0600ab159b2c764e69c3069aa696818bfa51494b4009fad1f8d2d2500263ad2673487e6efc528a005a51d29052e45002d2e3af34dcd28a602d27a538f14d273de900b9031cf5a5f4a6ab719a3239c1a0070a518a418cd2f340800e39a5c51ce3eb4bda98077e68a2979c6280187e9463d4d291c5273d290c0f5e94de0d3cf514d3d680131c9a6629dce686eb4011b1e3afb534e3923bd3d87b77a43de90c4c521a70e4fa0a4fbd4c04a08e68cf3d28e29006297ad20fad28e9400a460d27a503bf34a39a62100a4cf18a70c134840c74e6801066939a77634dc6680138a38e68db807069075a602f6a4a5fc28a043702908e9c52d349ee298809f6a0e79e29093464714c407a0f6a6139c814e34d3f95310dfa0a42314ec8cd27140869fa53477e29cc71494c43703d2976f140e697140c66d3e946ca93a51d4f5e28022c1cd2739a908a42b8a0089890718e2976fe54b4bd280018228232a6907d294714080000d14bde8a4034d46c3dea5fc698c3ad302075f94d53950918cfd2afb29c55590750df8534265656c654d30e49c11bb8ef4f380d86fcea3dc778e7f1ad11244c48e2a3cf35625001cd579075c5522591bf5a6d39b34daa2428a28a003b528a414f07e5c6280248914c83278ef5bd6f6c629924b6903a81f7876ac15500020f3e95d3e829be1071df14c45e8312fef20711be79f7fa8abf17985479857f0a62dac792c8363f723bfd6a75c81822900ea28a280168a28a0028a28a0028a28a0028a28a00296928a005a29296800a28a2800a28a2800a28a2800a28a2800a28a280168a4a280168a4a5a0028a28a00296928a005a4a28a005a28a2800a28a2800a28a290051451400b45252d00145145005ea28a2a4b0a28a5a004a28a280168a4a5a0028a28a0028a28a60145145200a28a2800a28a2800a5a4a5a0028a28a004a29692800a28a298052d252d0014514500145145200a28a2800a28a2800a28a2800a28a2800a28a2800a28a2900b45251400b45251400b49451400514514005145140052d25140052602f34b51c8e40f94f340105e4a9044d2c878ae0f5cbf179744a6422f4ae835b95f244cfb93fbbeb5c95f7320201028194a5eb51fad48dd79a65344b129692945301e3b54abd706a24eb53a8dcd52ca448bd33e953424aa6e1eb8fc6abbf6515601c44147f9352cb4598f2231deaf5aa614126a8c20d6a44bc2fae2b29334896a2c1c54fd6a28d70a054a2a4b17a1e9467ad1de8e69000079a3f1a33d6814001e948471d6824e69bbb91400b49ba98f26d3f37f8d40d2b3b7ca36aff009fca8482e59de00e69778aa5e6e0e31b8fa0a903e7ef7e43fc6988b59e3b501c639a809eb918514d32e57e41b47f79bbfd2802d162473d29321b81ff007d1a80b1c7d3b9a723671f216f7ed401376c67f2a72e78e31518914123f8bfd9a03ae7819340ae4dc648ef40351020e47f2a786cf02818f52452f3d314ce4f4a70239e6801c0fb52f3e948b8f4a7669884c718a4ef4a7b628f6a431b834d6eb4ff005a69c734009da9a69cdd29b8c2d218d6e3b50781c77a71e80d276a008f6e09140e869e17e6e693b0a0637a668fbc79f4a53ffd6a403e6cd201070050186e34a31b8e4d237b5301deb4b8c52679c9a3b8a042903a5348cd3b9a4c73400d1e941e31cd3b1cd2628013af148719e94ee7a9a6d31087b52374a76334d26801bdbad3722862453377ad310efd293775c52673484f5a684c39a09e39f5a6b11c73cd216cf5a621e481f8d26e23ad33383ce290b1cf6a648ee09c91484d337f0698cf8e71914c44bb80fad1b8d41bc75c6293cd23b7e540163f1cd3b766a934ac39069c2763fc38a605adc73d293a54225c76c1a7efdc29001ef473c50307eb477e452283b9a3ad263914ea0028347045281d290869cd379c9a7d21eb4c08c8f6aaf326e1d3a1ab0c7b535d734206665c2e306a2c74e2aeca83041aab82148ad110c8dd7e5e7ad407eed487a1e6a33c03ef5684467a5329cd4da648514502988515341b377ceb9a869e3e5228035ffb315adfce8cee1fddcf22b53425f29b8c8cf6ac1b4bb9626f91ce0f047ad6d417455959c6ce3b5311d164f514f19aa7677f1dc0f94e1875ab60e6900ea2929680168a4a2800a28a280168a28a0028a28a0028a28a0028a28a0028a28a00296928a005a28a2800a28a2800a28a2800a28a5a004a5a29280168a28a0028a28a0028a28a005a28a2800a28a2800a28a29005145140052d14500145140a00bd4514549614514500145145002d145140051451400514514c028a28a4014514500145145002d14945001452d140094b4514005251450014b494530168a4a280168a28a4014514500145145001451450014514500145145200a28a2800a28a2800a28a4a0028a28a0028a28a0028a28a0028a28a0029aea31d052e29ad81ee6803175678e263b903b91f28f4ae4f540147cca0337200aecae6c0f98d2672edebdab96d6ac248a6dd201f41480e7df934cab570536280a438eb5569a1076a50692969812460726a7e8b9e95027153e728054b2d074c5588806ebc0a836f4a9e20781ef52d968bd6cbd5b15a56e99f98d55b74f9456844bc0f4ac5b352514f148bd2945218b46060d1c7ad2668014d14dcfad216c0ed400ae47150bb639cfafd29b24817bef6ed8aaf26e7e5dbaf217fcf5a6039a4ef8cafaf4151162e08c9dbedc0a73678dcc133ebf31a8e474897e623a643364fe955625b151803f2e48c7d053832f2ccff0028f4edfe26abacceca58938038df851f95445de505dce513d8e3ff00ae68b0ae5ef35a63bb1b63078cff003fad23c9ce11cae7bf7354e295e5723ef00473dbe9536eea7cc1c1c1dbcfe668b0ae5c055630dbf9f5739fd3a53525dec07253fbdd33ff00d6aa0f70aadf2b2afaff0011a609e4964c7e64f534582e699b85fb911c0ef8ff003d28f3d50855f99bd0567b4eeabb63db8f5a2299baaed3edef458398d447de47cf83e839ab08c7a6e0b59493bb8dabe5a60723fc2ac8ba29803667eb4582e688daa01ce69ca7fdaaa0b3907e629cf4e69c27f75fc280b97f2051926aa2dc1cf45fcea6593228192d0719fc2981cb6697340c7673f4a4c7068181c629a73cd2014e7bd37068cf268ce3148a0c74a43dc52a9ee451c9e68013032303b520e99a77e1498a4046dcad28c7a76a31fad2f73400dc0ea050dcd2f078a43f5a005ff0a5ea05369c314200ebda83403927da8ef4c042727a5274e2949e693a0e940063ae69878a793d6984d021bc01cd21c7514b91c530fddc53484358f1ef4ce4f55a7330f5a85e4ebe9ef4c57158f5a697fc45577986708f8fc29a67007de1f5a69099233fa0a8fce6c62a092e013c366a269ce32dc55588b96fcfdbd7a7ad37cff7ef54cdc8ecc31e879a88cf86e0d3b1372f19bae47f9f6a8da53fc2df9d5513f232d8fad297cf21853482e4cd371ce73fce859411dd4fe950073fdfc53810dd480deb458090ccca7da9c93a13ce4542c7070f8db528db8c16054f4f4a009bcf191fd69c24f9be43ff00013d2aa9dca38c6051b8e38e07a503b97564ec7e53530707eb54167e81bf5a91651cf352d0ee5c0c314b9150452647352ee0690c78fd294531720f4a7f5a0000a4c1a7e0d21e87345808f009a6b7a549da9b8f6a00ad327154e55da7dba568b804107bd542858329ea2a912ca2701c8350b771533ae5b07a8a8d87535a220858547521a655098945145310b526e26209db3d6a2a7f61400f4246715b7a7ccf2aac5205f6cd61aa9ce41aba975e66d4c631c034d08eb2c6048b951cf715a033e95434c554b743cb6472c6b4074e29301696928a005a29296800a28a2800a5a4a280168a4a280168a28a0028a28a0028a28a0028a051400b45252d00145145002d251450014b494b4005145140051451400b45252d00252d145001451450014514500145145002d251450014514b48028a28a00bd4514549614514500145145002d14945002d145140051451400514514005145140051451400b45251400b4514500252d1450014514940051451400514514c05a28a290051451400514945002d2514500145145200a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a4000e7bd3a928023703935ceebc81e7539fe1ae925c79649e9591a9855cb050c71f5a434707a826d98fcb8f6aa7b7ad5fd40b34ecce39f4aa6dc8a689645da9ca3ff00ad4a06e3ec28272455090f8c7afad48461cd313a7e35328ddb8e2a19a2161f9893576d622d264f4a86d94023238ad3b38860544d9a45176dd2ad28c1a64498c54c3ad626a028a5a4a0033c52724e697f88d1eb4008dc75a8646c727a0a7c8fb7dcd5495f69cbe4b1e83d2983091b39256abcb2e31cee3d36af5a64d32b2e5f951fc355649778181e5ae38c71f855a466d963cd6c8f31b627f7539fce9b2481482caaab8ce7a93f5aaceb9552031c74fad08ad8fdeb809ec31cd3b08932f2f3f75739cb9e6942b39f9817e7ab72055738dcc5039fcf9a699b760177e3b20e9f5a105cb52cfb404072bd91460543234a5471b50ff0af39a8d5d71f7241ee075a58f7ede15b67a914d00c4624e218b6fa9241a1c107e639f6a38624e5971ed4d645ff00964edf5aa207c7308860a1c7be79a89ee830f97ad319003f3b3134d68d49e495fc3b516426c97ed2df77eeff003a7a5e227f0b13f5aae224e9e6b7b0c75a69f2cb637107e94342bb2f0bc048dc0ff4ab49729c6171efdab290a29f99c8fd6a58c8dd9494fe5c1a9686a4cd84ba2a7ee37f4ab315c0607e46c8ea338359315cb2101df1efd8d5c866571f2b76e9fd41a9b1699a714eacddf38e86a70fb8707fad65a4a1f209ddfcc55989f69397f90e07d2958b45cddb71cd0efb699bfdb8c544cdd00e84e690c9f71268ce7ad315b19a50d9cd2289473c52f4a621e3ad3e800cf6a4c75a53eb487fa50031b8eb45291da90d20109c647ad21e941ebd293eb400bf534b919149c8c7d281d73400f1d283ed499c1a39a6021c9a4cd07ad379a0423134c2dc807d3ad389a858f27d71c50038b54124a5169599b038eb55e438cf007d734d0857976afdeeddea94d743b1a6dc3285dc41763ea718aa4cfce00e4d5221960dce3a7a546d393c83516e0bfc3c9a819b938ab48864cf293d0ff4a8f90724d341e281db8cd5083765a939cf6a760b7014fe14a13d78a0561338c52934b855e80d185ee2980ab8352a10480400d8e2a1f973f2e69de6e400ea78f4a4172cee5c7cca31fad3b2a83a7ca7f2aaf1c8a463248f7eb526426701b07a1ed400f2cb8e31f4ed51f3fc231fca82a0b71fa51e5903838f6340c63337f18ff0a721073dbda91b81923fc298d8c6549a045b491f3b7183fcea44b8c121b8e6a92485ba9c103f3a955837d47af5a5629334d1c1ef5203c67159d14c54fb55c8a40c07352ca4c9d79a53d29a8c39a75003690fbd2f52692900c600f4aa7283beaf1e054322824f1d6a84cccb88cabe7b1aace2afcca7051baf6aa4d9e6ad10c85b073511a988e4d46c315689194514b4c4029e30698b526ce473d6802d5bdb2ca42eef998f415d0d86950a10ae80f1d4d6158078ee55906769eb5d459194387760463a53422f436eb12009d2a503148ae48e053867bd20168a28a002969296800a28a2800a28a2800a28a280168a4a280168a4a5a0028a28a0028a28a0028a28a602d14945002d145148028a28a005a29296800a28a2800a28a280168a28a0028a28a0028a28a0028a5a280128a2968012968a2900514514017a8a28a92c28a28a0028a28a00296928a005a29296800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a290051451400514514005145140051451400514b4500252d14500145145002514b4940051451400514a28a008e58fcd4d87a1eb50dc409b080bce2ad54528f94e3d2819e77acc245ebf1592e0938ae8bc41179172ddcb77ae79815639a426040e145348e681d68ee69887afdcfc6acc6424273fc55593ee8153b1c2818e952cb44f09395cd6e5927ca0e2b12d0192415d159ae105672368ec59029d8a314b50509452d3690c31d6909a5cf5e6a1959c82a0e3d698104d70133cee627a567bca779797ad599719da9d4f7355555de5f90647f78f38fa55a21904c4643b9f94f4142b232ef6f9173dea796293ccdcdb0fd7914089dce64da7d06e0053248c1f3146d1c1ee4f14821c93be4cfb0ab290e58972bf4500fea4d4d158b83bb683e83767f9503b145a2656dcb23c5cf191c669be5caa06f271d41001ddcf39ad9f22460331c7b81e3f787f50452456ec3ef4698f6ff0a2e332d1539c4bb3f303f2ab11c45946c9147bd5d6b68cfde857da9a2dc29c28dbfa52b8ac5616fb581ddf36739e0e687b0c73dfbe0d5bf24a9242fcdeb4157e414da7d739a571f299e74f6c13bfad02c485e71f88abff003291b86ee3ad000f4a2e27132a5b1241e429fd2aabdbca8e12455f66c76add640dfe06a364571b5d7f034f985cb731bcb2bf282bf4a46b665e7214fae335aad65131cedcfd4e298f66c3ee938f4f4a7cc2e53354c919fe1ff780e0fe156226570191429ebb7b1a735ab821910ee07b75a67941f7314daddc67ef7f850d858b4b2799f975ee3eb53c52b729205071c30e87ff00af59e9bb705914f03e56ce08ff001a9e2dc858374eccbfd690d1a68fce09caf6a6eed9230ed9c8a645850a57eef7a1c9dca7a1dfb1bfc6a4b270fc9c8a786e9eb5027fad62471d29eaa77e49e08e9486595c9e9d2a51d0d431b7a8eb528c753f8d000477c527cd8ed4a0f1d28e7e6140c69c7a50d8f7a181c669181a006375a4269cc29a71d69001e00e2978c533381d4d2e4671400ec9c52e73f5a68a4279eb4c05cf3c5319a8271de98e4f140863b7245465b748c3b05cfe34aef8c93519383ef4840ef903d339aad2be32739279a9a53c71c1aa53659b03b726a908864c0ff7bf9557907231f78d4b206e40efd4d44c5906d5fbcc393d702ad10c85d79e6a32bb8fcb53042493d7dcd0b1b374563f4aa4c562309c7269554761f9d594b7623e6fd2a5116de98145c394a803b700301ed4ef2c9ce339f5ab8b09cf3527907ad1cc1ca515b727b9cd385a9edcd68a5b9c65a9de501d06697330e54667d9d7a0639f6e693c8da7926b536633d29be59279418fa5171d919a5173f31c9fca941d87ef103d6b41e219fba187bd46f16dfe1dbf953b93ca55ea73b837d28c3e3fd60fa15a94c43b7ca7d8e698caea38c30ff6b8a770b11bb1c91c8fd6a26c0f4a9090df7c05fa73484ae31807eb4088c63ad48ae3eeb7e74d280f23f2a5273f2b0a60588db071c5594dcb8f6aa712e38cf1ee2adc44b2e3b8fe552c658563c7352a9aad165480dd09e0d59d8339ee2a4a0c0cd2538f6a2980dc035149d7a54fb714c65a1014275dca7daa8cabbbe61d7bd6a4abc1c74359b2e1243ef55164b2a907241a8daa6638620f4a66074ad11990e28ef4ee39a69aa1077a942b1038c8a60e0d4f6df36540e4d005ed2e711394740c1bd6ba8b150c320fe1581a4dbacb37ef171815d0dbdb796c0c64fd2988b83e94b4514805a28a2800a28a2980514514805a2928a005a2928a005a29296800a28a2800a28a2800a28a280168a28a00296928a602d1494b48028a28a0028a28a00296928a005a28a2800a5a4a280168a28a0028a28a005a28a2800a28a2800a28a2800a28a29017a8a28a92c28a28a0028a28a0028a28a002968a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a4a005a2928a005a2928a005a2928a402d14945002d1494b4005145140051452d00252d252d00145149400b45252d00145145001451450025145140052d251400b4d6e94e14c7fba6819c5f8a5b37207a573521e3f1ae9b5db769af1c9fc05734e98720f63cd2111f4069a29dd734dcd30258ba0fad59201c8cd564c0407deac27622a5948b3623130ae92dd7e415816402b838ae86dfee0aca7b9b43625a0d28a2a4b129b8a771471400c3e8bd7fcf4aaf3bed5f2e350d2371e8055866e0edef54cf53e5fdeeedfe14015e684e4272c782c7d7d0531bcc3fba86338fe271c7e1571502218d7966e493ef5194d84a444e7bb5512575849cc621776e4b3b1a516bfde181e956a2440813cc3c727d6a61b57dff003145c5629a5ac4dd576fd5b153258c5d403c0e9938fad5806361b7f4201e69e02a2e38f63c52d464496aa40edebf31c1a9562438ea3f4a7aaa9e770cfb0ffebd2840f91f7bea334086adbaa9e33fad35d76b0247e46a6f2f1fc58c7bd2796739dd4c085b27a2934d7e8091c63e953e33c1a8dd4608a96522b9c28fba69a71ef529ca91b579f5a85f00f382691561ac4fff00ae937a8e1b34ae09edc1a809c7d28b8589c15edfa1a7820f4355572bc8a7239fa8a699362c90ad8fe74d6851fefa83ef42be47f5a957f0a6229b598036bfcc87a1ee2916d990ee0c48039ffebd68526067701401584647cf11c9ee0743ff00d7a73aee1953d464558c2fde5e1a9367e40f148647b7773d9b069fdc7b8a44565660bd33d2a545ebfe78a00148c01dea61f37d0d3028eb8a9060fe14862e68c70295477c52e39edd298866d27a9a423b66a4c7b5230181c5004271d298e3352b71daa26a4319f30e6979c0349cf3487a0e2801775058d34914c2d8a00739dddea32c41f6a76734dc80b8fc2811148c4103b66a072770c7ad4d2a9d99cf3c544d8e71dfa50030b1ee2a12c15791ff00d7352f270291941e698ac5768f00e7af7f734cfb39fe21c9ab4179a76da770b158400f51522c1ed8ab01327a53d507b7e745c2c57108f4a788bd05595400d382502205807f7734f10e07a7d2a7dbc0a3677cfeb40102c7b78db4e68877fd78a97a63ad19a2e1622d80741c7b533cac9feed4cc17a904d214e383b7f0a62b15de0e3b9a85e328338356cc7c72ec698c31f778fc69a60d19ecca4ffab977546ebbb3f23fd2afb30f5c1fa544ca1bd49a7725c4cf300cf2b8fce93ca0beb8f7c8abbe57f7bf2a8d9067fd67f4aab936454319c657763d0e280d9c2bab7d715619075df460e31e613ec698ac4683800135324857a8f987eb4df201e55b07eb9a7889b6e1dfbf5c645005a470707f022ac312071d2aa441e2c6577a1feed5c0411d72a6a59485078a29dc676e41a4000140062918714ea434d01565526b32e3afbe6b5e41deb36f00c834d0999f21eb9a667a1a96703767b542dd2b446635fad2529a4aa10a3ad4f6cdb64520f4fd2a11c54fe56c5490746a101d5e966298678ddfceb5123656043715cee95131656076fbfbd74716fda0360d531129a2928a90168a28a0028a28a60145145200a28a2800a28a2800a28a2800a5a4a2980b45252d00145145001451450014b494520168a4a5a0028a28140052d251400b45252d0014b494b40051451400b45252d00145145002d145140051451400514514000a28a29017a8a28a92c28a28a0028a28a005a2928a005a29296800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a2928a0028a28a40145145001451450014514500145145001452d14005145140052d251400a28a28a0028a28a004a2969280168a28a004a5a28a004a28a2800a51494500148fc213ed4bde91c6e5dbdbbd03398d523219a53f282735ca5e2842d8272c73f85765e2150813e878ae375162d2e69014e9a3ad38d27bd022445c902ac275c0a813b54f0fdfc9a4c68bd66712aa574708f90573762774e0d7490fdd1594f73786c4a2969283d2a4b128653b7ad1cd231f97d280223b9b289c0eec7fa5055513645dba934b962084efd58ff4a6b203c11bbeb4010336d22385831fe23d852882607e5917e98cd4a881721578f6a7aa11f740a0446b1499cfafb75a78130eebc7a8a7867cf29daa45661fc3fad3111a6e1c3f1fa8a90007d0fe54bc64d0050200aabd1579f6a762939c8a51400bc8ec28c1f6a33467da980c3ef5195f97b54a78ea2987e9498c81d735132e38e2a765f63513e076a92ee4122fa8a89c76c54ce303a542e31de900cc537a3e734ec7a37eb51b374a760275c3723e53eb53a3600c1dc3dea92b608e054e868116f771ed4e073502b74e6a6c834c07803d29d8f6a681d3069e281005393c5284a7a8cd2ede690080638c53b6ff003a555f7a5a0036f38cd3b140c7ad2edf534c42107d78a6bae471521f6a691d68190b2f4a8997bd58706a16148644c3da98f8a91bb8cd42fc50030e3a3526ef7a0f6a8c9c1e391480786e683f5a62d29c9a684c6bd42df5a949c5464f6a0061cd2629c5b34839a0002f3520418a451e86a545e314008abd2a455a5029ca08cf422988003de9e318a0673d2940a6803069307a53fad37f0a04331cd14e23da9a7da818d27ad05ba527ad21fa5000c79a6753d2826909cf6a68430e324d46c771f5f61529507a8a66c18c8e29888995bb2aaff3a89a21fdde7d49ab19ebf2e6a324effba6989911439f95074ec69bb402014fc39a9f77fb2d9a5c03cec61f85326c41d8ed5cd4f126e51c62a3c8dd978d87bd4b1956e80d003d1594807b9a9d1086e9c5445f6e3729e4f5ab008c9c53018786e94753d38a71ce69318c5200e79a0f4a3ad0718eb4c0824acebc5c8ad371c5675d0c531333243d45446a5971b8d45deb446620a4a7521e09aa100eb57f4fb737194cf1549464d6ce8d0bc9bcc7f78629a03634bb706128f90e8700d6ac5955c1aa7668ccad9386079abeb9c5262168a28a002969296800a28a29805145148028a28a0028a28a0028a28a0028a28a6014514b400514514005145148028a28a0028a28a00514514500145145002d1494b40052d251400b45028a005a290d1400b45252d002d14525002d14514005145140052d252d005da28a2a0b0a28a2800a28a2800a28a2800a5a4a5a0028a28a0028a28a0028a28a0028a28a0028a4a280168a4a280168a4a2800a28a2800a28a2900514514005145140051451400514514005145140052d252d0014514500145145002d1494b4005145140051451400514514005252d250014514500145145002d21a5a4a06636bd197887b57157e373600e95de6b1ff001ee540e5ab8dd42dfca539fbc693118ae00a6d48ca4134cef401227dd1c54e46c41eadcd42a47153c9f7867a76a18d16b4f03ce15d2c07282b97b36c4e3eb5d3c07e4158cf73686c4f4514549a074c535d41c67d69c690f22801a48e8050541a7f1405e3834088b704eb9a50c3b06c7d334f3f29a7861d680180fb37e34bcfd29d9029339f5a041b47a9a5c0a4a3340ec3a8cd2669a5f14c43f3487eb513ca075355e6d4618bab8cd170b170e3a934c6703358773ae7256052e7d7159771aaddc848ddb3fddaa516c4da475525c22753daa949a8c2bd6451ed9ae5dda597efbb37d49350b02b55ecc9e73a66d56df92d20fc2a13aadb93c3573d46d38cd1c885ed0e885ec526363834ff003030e4d734091dea78a674e431a4e0529a66e8f634f4e39cd66c576ddc7156d27dd81c74a868b4cba8ddc55846ce79e6a8a3d5946c54945c438e49a914e6a046ef5321c8ce29924c0f4a777a8c1c9e95229c1a043b6f7a00f5a053b14805a5e7af7a40052d3010e78a4239a75235302290edc939fcb3509cf353b9a85aa58c85bdf8a898e6a5702a17e28191bd33f0a739a8f3cd003c0c03485b83c519a091cd3248c9a8ce334f90fa540cdda90c52dcd2af6a8c1c9e2a58c64d03245f402a741c74a6a28a9ba0c66988503a67934bf7466abcd74918033b98f402abccf2b03b9d93d02ff8d21179e648fab7eb50b5e423fe5a0fceb35a14c82ee5bd73546ea48cf0981ce78ad145b25c8de6d422feff00ea29bfda70f3f30fceb977e79a6557213ce756351898fdefd68fb64673f3afe75ca1a0363a53f661ce75be72b7f151bc7ad72e93c8a78635653509971939a9e465732378b0a4c8cd6647a929003020fe95722b8571c3035366877276f4cd3081d8d383668f4c5026341c52138e69fd3b537814c4344a33f7a9ccccdd01a4da339e28cf5e0500332dd3814823dcf957d8ddc8a7b678c014aa0e79c0a62b0f4241f9f9a9a3e738a6050476a7aa83f778a6842914d00fad2e5b76ddb474c73400bd29a7bd38f4a6d30227e959d7678ad19335977a714d099425ea6a0a91ce4d475a23262d21a29cc318aa01d10ae97c3e080702b9b8b2586074ae9b44de8785cab53ea1736d10062477a969887229f4310b45145200a28a2800a28a280168a28a60145149400b45145200a28a29805145140052d251400b45145200a28a2800a28a2800a5a4a280168a28a0028a28a005a28a2800a51494b4005145140052d1450021a5a28a005a28a2800a28a2800a28a5a002969296802e5145150585145140051451400514514005145140052d149400b451450014514948028a2814005145140051451400514514005145140051451400514514005145140051451400514514005145140052d145001451450014b494500145145002d145140051451400514514005252d2500145145001451450314d252d21e9408ad711095c31ec2b95d7a221b71fbb5d830e2b035db6f320ce3bd0338b9948cb7ad4007249ad4bc8f0814ae302b2d81ce29122a938e9561cee456f4aae32001532f298f7a0a458b6e265aea2db98c1f6ae5ad8e2419aea6cff00d4afd2b299b40b02969296a0d02929680280140e7a51b79e2814b484263d68c0f4a75342e32680038f4a4a776a67a7ad3185266918e05412ca0034ae162592502a85d6a31dba92cdcfa556bfbf100233f39ed583248f3bf24924d528dc4f42e5c6af3cac445f2e7f3a92d74c9ee4869770cf3ea4d5ad2f4d544577196ade8611818e0569a74336d9949a6c56f1300992475ae72e1317320f438c5777344361f5ae36fd3cbbe97fdf357113d46416efb0bec38c75aad3e0b93debaed02d966b30e5776ec8ac9f11e962ca459a2fb921c11e869d896d6c609eb4e519e290d2038c555b423a832e2a487ef007a534f249a58c7ce2a4a48b451eddf3d54f4ab10caac2a748b74433556687ca7dcb902a246a8bc8c001cd588d8819ed59f6d3f4573c55e0a769da78ac9a342e23f18ab11366a8a3d4f0bfcc2a40bca6a45351061b79a7e698894114efad46a69e09a043bf1a09a6e68e6900bf8d19149d7141a006b542dcd48e7f3a809340c8dfbd42fd6a673c542f4010b9e6a3dd4e7f7f4a849f7a02e49bbd69771ed516ea50702a8435dbaf1559db26a590fafad573d690d12c67b8fa55a881e0d568b922ae2a8e38fc681326e8393556f6efca4e0e09e945ddc2411ee73f4f7ac85325e4dd3393f9534ae058495de40225dcdf9d5e82c27b9ff58c7e9d2ade9b609160b2fcc6b661802826b448cdb30f51b54b3b262b9190457376f034d2000575be2142d6a3eb55747b0475130c797d3f1ad22b424e7eeedc440fb55122ba1f10e9c62c4d1e76573e68484d82903b52901ba0c50294371d2a891953c4bbd48c545572c137c86922880a91c1148b2321e0915a535b8f4aa57106de452682e58835165e1c64568c570b2286539ae7b9153c13b46720d44a25a95ce801cd1b47a553b7b9de2ad2beea8280a9c5215e4f1cd3e9334086f3d8519271c52e4d14c0910f0322a44279e2a3535221eb8a0076734dda3bd3b8dbc1e68c71d69884a4cf269c0526314d08864e95917e726b624ef5897e7f79d69adc4f628375348695ba9a69e95aa320a767e5c53476a72f269816ac9d11c875cee1815d1e9afe46ce32addfd2b9eb087cc9471c0aeb2dedf10295f4e29817d71da9f4c8b9414fa420a28a2800a28a2800a28a2800a5a4a280168a4a5a0028a28a0028a28a0028a28a60145145001451450014b494b4005145148028a28a005a2928a005a28a280168a4a5a002969296800a28a5a0028a28a002968a4a005a28a2800a28a5140094b4514805a0514b4016e8a28a92c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a401451450014941a280168a4a280168a4a280168a4a05002d1451400514514005145140051451400514514005145140051451400b45145001451450014514500145145002d140a2800a28a2800a28a4a0028a28a0028a28a0614514b4009452d148069aa7750899082381574d46fd2819c56bb1847db8e9d2b9b901121c8aeafc4ebfbc18ee2b9bb85270c682595fb8a7a9e69a7a0a71e001eb431a2cdbf332fd6babb3ff0052bf4ae46d8fef57eb5d6d97faa5aca66b02d714514b506814628ef45218e14b49494085ce0d2519a3340c09a6330eb4acd8aad2c8141268602cd2819c9ed591797a7958b3bbd6a79fcc90167f957b0a8441f2862142f73490cc9689e47cbe4926a48a068c8fad69241bdb2a3e5ed9a79b663820669b90d24169a86ccac887ea2b66d6e12500a366b13c82b8ca8a540f11054e3f1aa53b6e29413d8e90e185727e20b5315d79a07cafd6b4a2d4e48f01b0e3dea6b896dafe02921da6b552464e2d19fe1ad512d09866ff00564707d0d49e26bf82ea148e16dd86c9acab9b092094ec1bd3d6ab4af852bb7155cfa11cba95185340a731f6a0629f3682b6a02add8406493776150c3134ac0015b3046b046074a96ca489d530a05569d32d52bca3a66a09265c7503f1a9b969102c5f311d854d05c18dca3f4cf5aae26e5b9eb4c70ccfc0eb49a2d1b4bec69e8df3554b0977a98dfef0ed56b051bdab27a0d1a7136501c52e6abc0ff2d4a5b9e2811329a7e6a2534ecd20b0fdd4b9a8c1a5a007f5a334dcd04d301ac726a27c77a7b9f7a858d0035ea090d4cdcf7a82538e94c45695aa2cd3e5a84fb5310a4f5a50722a3f5a51c77a621b2b62a0cf22a56f9aa33d78a43b96601f77ad5b95d6352d9c051926ab41f2e0d54d5ae4ed1183d7ad0912ca77772d733139f94702b4b468011bcf5cd62a83d6b774976118c7406b4d85b9d1dba02a0e6ae2371542d6518db5715862825e853d5e1f3ed180ea2b1f40bc16d7be44a40463dfa66ba198065c5731abd83a4be6c438f6ed5717616e747ad985b4d98b1046ce3eb5e7840c9c74ab92cf2b2ed91db03b135559876a6a485ca3314b4514db1a560e6b5b4a84ec2c4566c1119650a3d6b7e3d90461411c7a520b3624aa2b3e7c739ab32caf21f914d566b7673973f952721a819f2704e29a460039abe6d429e951bdb647028e613890453b44c39ad3b7ba57ef594e857a8a119a339149c6e09b4740b2669fdab2edeeb763357924dd5997b92d03834d0734ea063d4d4a8702a0079a990823914d08928eb499cf4a07414c428f7a38cd20268a60452f435857dfeb6b7a5e86b02fbfd69c552dc9914dbbd34fdd14f6a673d2b446428a9224cd31474ab56a30413d8d3046e68b65b0b175ce45741120440074acdd35f743bf18cd6a447e5a005000e94b451400514514005145140828a28a0028a28a0028a5a4a00296928a005a28a2800a28a2980514514005145140051451400b45252d00145145200a5a4a5a0028a28140052d251400b4b4945002d1494b40052d252d0014b494b4005145140052d252d0014b452d2180a28a2802dd14515250514514005145140051451400514514005145148028a28a0028a28a004a28a2800a28a2800a28a2800a28a280168a4a5a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a005a28a2800a28a2800a5a4a2800a28a280168a29280168a4a280169296928185145140051452d00028a28e94800d31a544fbcc0554bbbcdb954ebeb59cecefc96a872b1a460d9aff6c87fbd4be6ab8f9483582eadeb559e59e13b91c8a5ce5ba468eb56ab3c059872b5c6dca62460463dab724d6652852619accbadb2b33a0edc8ab4d194a3632de303148e36e2ad1b73e5ef76000eddea07fbd9c5310e838907ad759a7ffa85ae4909de0d757a69cc0bf4ace65c0bdda8a051599a8526683494863b34678a4a38a0042c052338a38fc683c74a0085a53d02d4123807a7353bd569304e05032176ddfc396a7795b87cc734f58c54a89d68023110e07b54a10ede053d139a9369e28b0159e22ca7b73d6a16b550bd0fa0cff3ad0e0e7b523213c8fc2985cce7b38d02b31c93d79e4d47e5e09d8a76d5ff00b38cef73bcf6a8dd1ce7e6c678c53686516560a3deabc90acbf7856990638f68e49aadf71c161f3377a5b09d8cf3a7c47d69bf608d467e6ad16055b38f4a6f3f3ae01e29a93172a280b731f2995a530313f78d5deaa06071cd05c6015e3f9d1763b2293db1007cddaa27b727a1ad2201078e6a37519c014d3158cc681968cc83b9ad031824714241f3703bd3e60b142199e2943e4f5adf81c4e81c77aa06dd598ef5fad5bb08cc5195f6e2a25a8d22d43919153f38eb50af5e3bd48bd7eb50325534f07dea219a78a007f34b934ca506801f914a7a75a6eec76a0fb8a684318d42c41a91aa3622810c3939a824fad4cd50bd5a24a8e4f22a3353480e6a134c434d275e94352669880fa669b8e9c53f00d37fa50049e6045358d712196627deafdcb7c8477aa91c3d0b0eb4444c8e3257231c1ab16f2cb1708c467d0d3960078f5f5a9e3836f6fbb4db1a44f15fdca1fbedc55b4d5ae1472c0fe155d225603f9d4d1c4ab1e4fad45d9764cb2bac11cbc60fe38a7b6a514a394fd6ab2dba01df1e94dfb2f438e33cd1cec5c88a9770433f28429cd523a7364e1856bc88bc2e3a11dbb535d36f23b51cec39519234d933c914f5d379f99ab48b60819a42dc900673dcf6aae761ca8ad15985e17b5585b5048c93f4a915181e326acc69b474c1f52684c195bcac7cbb3e94d31f4cae2aefdd3c9cfbd34f14ee229796ab9c8eb50cb10392a2af3f7ef50b9e3a53158cd96227a8cfd2aabc457b56b1150bc59278a7725a335783c55db794a8a63db8ce470685465230686245f4901a9770aad1b7af06a5522a0a2507a53d495a8c13edc538127bd004e08238269fdbad42bdf3522e7f0a603851d8d03814a6a84452f435817bfeb8d6fcbd0d73f7dfeb8d5222454eb9a69eb4ea3ab735a23325b74dee16b56cad03b6dc77aada65b991f756f468902827d68b8d9a36d1048828f4ab2a2b3bfb4a24e179340d48b745a5cc812669515416ff00d56ac45729277c1a2e1664d4b494b5420a28a281051451400514514005145140051451400b4514500145145300a28a2800a28a2800a28a280168a4a5a0028a28a40145145002d14514005145140052d252d0014b494b40052d251400b4514b400514528a0028a296800a5a0514862d14514016a8a28a92828a28a0028a28a0028a28a0028a4a2900b4945140051451400514514005145140051451400514514005145140051452d0014514500145145001451450014514500145145001451450014b494b400514514005145140051451400514514005145140c28a28a0028a294500145145200a82ee5f2e3e3a9a9eb32fa4cb91e949bd0715765563934839a825936f7a9606241cd62f53ad2b21fb2abcd166ae85cd35d2a5a1a6615cdb673c551584a48d91c62ba29211cd566b61b8f1cd38bb1328a6604b11dc31f76aa104e6b6eeadb6f4ac929c37d6b68b3092b108ea2baad2ff00e3dd7e95cae7f79d85755a5ffc7b2fd2a67b0e05fe28a290d666a149c8a5a69cd201d4941e2909e280034d2d48726986818c7cb1a8f68c9e2a42693db140c07d2a51d29838a7d02176d3d72699f85286a6048aa0e6a5c657040a841fc297791c6284c5615a3e9dea3600f5a7efa6bb53b8221651e950ed5621b153b63a544c05228aed8c9ff0a8b6f0cc7f8bb5586ef8ef4c65cd17021c77c54670a3b54ec99f53519c74c500478cff008d181d69ce770fa0c714dc67209e2801b9ebf2e0d488a401ea69a149efcd598e35e33480458f3fc279ab089b7000a503818a77031934300c0e302947d38a3d285eb52c078a7834ca70a063b39a70c629a3a5380e2810a31de90938a4a46cfad310d6639a898f35263dea37e0d08063544fc66a6351b8ef5a221955ea1c54f277a8cf539a04424536a4a69a6213d3342afbd27a53d06e340104d19c73d0541d3a7a55d75c9c557750b918e94c42a482ac2b290477aa4b856353ab74a4ca45e423ff00af534403739efd7fad538d8e3a54e8e400141c66a5948b21412483f8e28c3a37de0c31daa257e29dbda90c5e0e7d699b082718e69d9079c734bdb8a43b0cdb863b87e946c1c1c538b1346ea2e1603814edd8f4a8fd71de82718e29dc2c38b12413513b10783c7bd389a6f6a771586f7a637d334fdbc1a6edcf6a6891845359318a97671415a6892bbc67ad26ccf353eda42298ac47b07714e0bed411eb4e503ad003bd38a55c014981d41a5c73d69012267a54aa71c544b91834fe0f7e698122d2fe14d5e94efad52622293ee9e2b02fb1e69ae825fba6b02fb8b83f5aa5b932d8a78cd3d232c7a734f8946fab71c5f3904738aa6c84875ab3c206deb563cc773f3934d098c54c8a2b36d9a242c6b566315120e6a6c85a490c90d3449b4f5aaf2ddaaf7aa86ecb31a771a89d15ade67e563578106b96b7b8391cd6f58cfe6a63bd6919194e362dd14b4956661451450014514500145145001451450014b494b400514514c028a28a0028a28a0028a28a005a28a2800a28a290051452d0014514500145145002d145140052d14b40094b45140052d1450028a28c52d20014a28a281852d1450014b451401668a28a92828a28a0028a4a290051451400514514005145140051451400514514005145140051451400514514005028a2800345145002d252d140094b4525002d145140051451400514514005145140051451400b4514500145145001451450014514500145145030a2968a004a5a28a0028a28a0046385358f7277331f7ad698ed88d644dd0d65366b4d6a67c873255c813e515473ba5ad2807ca2b33a5e848ab814a4034eed4da0819b0531a205aa7db48579a7606ccabb872f5872db10cfe9cd753345961597776ff2b1f634d3b3264ae8e640f9c8f4aeaf4b5ff465fa57318fdf115d569abfe8abf4ab9ec654cb628a5e9486b23610d21e0d2d2520109a6e69f8a6d2191fe34d209a7b0e7ad3704f5a006ed18a30294e4e40a029e39a630e052e69768a52a7b5021377d69770a428d8ce698cc47514012ee1eb49baa2ddcd1bfe9486499e3ad359bde99be90b0a00716f7a613ed413ef484fa5301a47bd44c7daa5c1a4299e94010302dde98401560a1fd29366dec298106d2ddba714e58b824d4cb1e334edbc138a008d139a942e00279e6976afa0e697a703d6900b938e6954014e085a976e00a4c04eb477a5fc29290c777a7fe14d14e1400bd05381a60a75021734d614b41a6219b7a9a6353db9a6b0e29a0226a6374a90f4a8dfa74aa44b2bb815132d4ee322a2718a649130e6a36a95fde984530194e5cd260528e2810e23daa3741b4e467dea556eb4a57a50050700526e2b565e2cd40c9ce298c922936f4cd4f1cc78c7ad52c60f5e29e8d8239e2a58d17c49b8f34f0c7d4d54492a4593de91458cd3b71a8838f5a5dd52325ddef46462a3a5e690c7fd2929b834bb4fad020eb4629769a72ad310cdb46de9526dcd1b4f4aa1319b719a630fc6a62a699b7069a64b2234840a7d253111e28c53b6d2004502100c629ebce41c9a6d3f07d280147b1a91462a25e2a5140878fad3877a41da945500d7e41ac1bf4ff483f5ae81871587a98c4a2a912f62bc09f367deafec3c3556b519c5692a80b448223768619a052f0290915259206da2ab5c5c76534924a7181555b24d171a40c49e49a6f7a5ed4da4513c4d5b1a5cd8940ac246ad3d35bf7cb4d3d4992d0e9e92913ee8a535d0728514502800a28a2800a28a2800a28a29805145148028a28a005a28a29805145140051451400b4514500145145200a28a5a0028a28a0028a296800a5a4a5a00052d1450014b494b40052d029680014b494b48614b45140052d252d0014b452d0327a2928a818b494514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400b451450014514500145145001451450014514500145145001451450014b494b4005145140051451400514514005145140c2968a2800a28a2800a28a28020bb6c42df4aca9db0b5a979fea8fd2b26e3a5633dcde923394fef7f1ad580fca2b253fd6d6b5bfdc159a3a27b13f6a60eb4f63c5469d69b33265a574e29129e4f1548865775c9154af63022357df83552e577a9152ca471f2a6276fad75360b8b54fa0ac0b88f6df3035d15aae204fa5693d888a26a4a074a2b32c4e73494bf8504714806e69bcd38f149ef486378a02934f1934b8f6a60478e78146de7a5498a5db405c66d1e94b8f6cd3f6d0280232a71d314d2bc74a94b0fc698c41c0a00899571d2985464e16a565cd3194f6268191e3146de7914fdb8e94a78396a403153fd9a5c0f4a3273d7341cff009e69806d14d2a09000a55e9477e0d17019d3148cbfad4bc77e0d34afbf14011e02e7b9e829fc6de3ad28514e0b9ce3a5003426714f09b79a9113bd3d471400c2bc0a6918a95fbd32930231cd1b4d4805014d218829718a50b4639a0038a7629714b8a04271494ee68a6223a637352531a9a1322efc531baf5a90e40a8db183548442e3dea26153b2f1509ef5449130eb51d4cc299b68023238a4a791d290ad20153afe14ff00a5342f038a72d17013629a85d3a903a559c75f6a6b29f4a00a450839c530a60d5d318a6bc478a2e32b0cd3d49ed4e2845000a06395aa45634c551e94f5e2a4772453cd48a7a531064f4a9425201463f5a76da00e4629e17de801a01a50a314fdb4a179a603768a318cf14fdb49de810c00fa546c3ad4bd8d30e298880ae0d2631521032453197938a621a4520ea69dc1146d2334086e3da85e98a5e0d18e98a621c38cd3d7b5371d69d8f7a044a2945317eb4f1540235646a69f3035b0dd2b2f5443c1aa44bd8ab65cd6820cd50b35da7357d4e293dc715a03601a88e58e052cadcd49127148a22f2f8aab22ed26b5020aa9729cd052299a61a7b0a6d4942a75ad3d317f7ab59d18e6b634a4fdf2d38ee4cb63a05fb828a3a0a2ba4e46145145001451450014514500145145300a28a2800a28a2900b45252d300a28a2800a28a280168a28a401451450014b494b4005145140052d1450014b40a5a00296929450014b494ea401452e28a062d145140052d14b4009452d2d00252d145004d4514541414514500145252d001451450014514500145145001451450014514500145145001451450014514500145145002d1494b400514514005145140051451400514514005145140051451400514b45001451450014514500145145001451450028a292968185145140051451400514514010dcae626fa564dc0e0d6cca3721159572bd6b2a88da933231892b56d794159ae312568da7dc1cd6513a67b1348714c8fad3a534d8e9b33e84c0d2e6928c5089631cd4120a9c8a89c50ca4615ec40dda60726b5e118897e82a9dda7fa545ef9abc83e514dbd09ea28a051da947152313bd236734ea4a008d9738c52e29f463da90c68a5521a8c76a70014600a00051814ee052638a620c75a6b7d79cf4a7718a438fad003197f3a691ea6a46f4a6f19a0645cf73498ce6a4e3d29b8f6a008c8f434ce4548cbcf4a423da818ce72477a423de9e29085feee280136e063349cfe14bb475ce69719a0040b4f55c8e05284e9522e17a0a1086841b0b77a7638ce29463d297fd9238a6020e942e48fc6942f147dea4310f4a6e29d45260376f34a3ad14b400628c51da8a40281eb4bd292969884a3a0a28ed4c06b2d467a54add2a234c446df4a8db9cd4a78a8dba714c444d51b75a95b22a27ed54891869b8a79a4a006eda695cf4a7faf349484345380a5007ad1ce78a0603009cd3b3d326931bbbd06800db96f6a360ef4ea503a1a0657640282839fa54eca7d29bb08cfd2901105c2f34b8cf1520e9f5a50a18d03045ef5205e69154af5352807b1a43014f02931d3a0a78a00052f4a3bd19f614c42668239a5f5a69a004f5a61029e4e78a8f9a62236ce7da987af152b1c1e951b75a04340cd18e6971b7a518a042629391ef4ec52f6a620e9d29dce29063fc29cbd0d0843933b69c39a68e869c2a842fb552d41498cf1576ab5e0cc66a84ca36abf2d583c536d930b9a59f8538a4ca5b106773d5b4e82a9c6b56e3e45229130031505c2e56ac2d3255ca9a01194c3935191cd599139a859706a4b1d10e6b6f4903ce5ac58bad6d697feb96aa3b933d8db3494515d07205145140051451400514514c028a28a0028a28a0028a28a40145145002d1494b4c028a28a005a28a290051451400b451450014514b40052d253a800a28a5a0029692945200a5a296800a5a28a0614b8a28a002968a5a004a5a28140052d145004b45145414145145002514b45001451450014514500145145001451450014514500145145001451450014b49450014b4945002d14945002d1494b4005145140051451400514514005145140052d251400b451450014514500145145001451450014b40a2800a28a281851451400514514005145140808e2b2eed70c6b52a95ea739a89ad0d29bb331275f9aacd937cb8a64ebd68b56c362b9d6e763d625b9288a924e94e86aba99f425c52eda5a5cd3b10c6eda8dd054a5b8a8257e2931ab942e97e756f4ab09f74553ba932c066adc7f7050368752d2679a5a04277a2969290c051452e2800ef4b8a29680108f5a33cf4e2970283ef40099cf6a4c77a775e9c527d4d0033b0a6b76a7934de3d6818ce94869c323bd250031beb498f7fc69e6900f7a006703349814fc520539eb40c6edce334f0a3d69714bd680102d381c5379ce28e734087f626939c0c9a4ce697e9400ec1278347e940a3d3d6801339a4a5f5a3da90c4a5a28eb40076a28a4e6900b92280d93452a2814c05c714d3d2948a4cfb53421ad5191835213ed51b1a6218698c3ad48d4c7ab4490b673519eb52b0cd336d0223a6e29f8a662800eb4941145020e0e6838cf4a4ed4bd680018a3279a4a5c15eb498c72e69ca7b0a603d78a72f4cd218eed8029703bd229f7fad3f8e6801bb0f6148a3e6a90720d1b011c5031abc548bc8a6edf7a728a43157a53f3d29b9c76a5ead4085c73474e68fc681f5a6026683d2969bed4c4267bd30d38e734d6239a4034f34c3d4d38d379a6210f38a33c7b1a5a4ea28100a51907da9a334f0298831ef4aa3e6fad18cd2f34c42f7a75371f375a7d5085ef55eec7c86ac555bb7c253111c0bc53e54045411ca02d39a5dc7ad2b94023c54a8b8a62bf14f0c29148994523afbd0ad4f201140328ba6588aad2a60d5d71f3d579c7b52652218860d6c697feb96b26215ada50cce29c7714f636a8a0d15d07205145140051451400514514c028a28a0028a28a0028a28a4014b494b400514514c028a28a005a28a290051452d0014514b40051452d0014b452d001452e28a002968a5a4014b45140c2968a5a0028a296800a28a2800a5a28a0028a28a0092969296a0a0a29296800a28a28012968a4a005a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a0514500145145002d1494b40051451400514514005145140051451400514b4500145145001451450014a2928a005a28a2800a28a2800a28a28185145140828a28a0028a28a002a2b84dd19a96918641a434f530e75eb55e21b64abf749b5c8aa65706b9a4b53b62ee8b2795a9211c544bf76a68ba5344b24269375239c544cf4c490aef55a57ce69eedc5577350cb8a2a4f963f8d5f8bee0fa554299356e3fba29a1489052f7a3d28a09128e2968c66900d4f9b9c629f4b8e29714c0414b4639a500502128a2909c0ce2800f4a4ef4ec679a4a631a738e94df4f6a77bd369301083ed4d3d3a53b8c5368189ef8a00cfa52d277a0046a4e7ad2d21a006fd694f6c0ed48c0500ee23da8187afd2947ad27a8a70fba681052af1da9063d69fda8016938a38eb9ef47d6800feb46693da82452181a29b934b9e28016969b4e1400b46319a28a620a42334b486801a69ad8c53e9a453111638a8d8d4a7d08a630c552110b9c714ced523ad34f14c9646d4c3523735191ce29886d26694d34e477a431739e281c5339a5ddcd003a8f5346ee9499c67d286224e80500f238a6e79a5a43240d4f1f9f150e7a54887ad03251d0714638c50b4e140062931834ec1f4a36f3f852181c66838e38a5c74e28c5160139cd2f268a2801b4504521193d698809c678a8996a46c7e14cc0a421bde9a739f6a71f6a6f39a004a4e99a7628e94c4252f4c5274cd2edcf39a621c6973499a774a6214539698053c74aa10ad59baabec878f5ad0edd6b3756198850c119d14eddcd5949735407153a374a92cbaaf532b55446a9d0d228b486ac2f22aa21ab0869a258c957e6aa93726af4c3bd5293ad36343116b67498f9dd5971ad6ee9d1ec87eb5505a9351e85ba283456c73051451400514514c028a28a0028a28a0028a28a401451450014b494b400514514c028a28a005a5a4a2900b4514500029692968016968a5a002969296900b4b8a4a750312968a5140051452d0014514b40051452d0020a5a28a0028a28a002968a2801f451454142d14514005251450014b4514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400b451450014514500145145002d1451400514514005145140051451400b451450014514500145145001451450014514500145145001451450052be8fa1acf615b33a6f8c8acb75c122b0a8b53a294b4b0c435613a55615653eed444d243256c0a819aa498d5576a0a8a15df8a889cd216eb4dcf348bb13dbc79249a9146091ef525ba6d8c531b894d3326eec70f5a28ff1a31cd0216940c9a4a70ed400b480e5ba52fe149ce6801d8a314bd0514084c7bd1da97d68a00423a53719a7d275a60308a6fe14ff006a4231498c8cfeb480139229ec29bb7af140c4a4e29fb4034dc0e38a006d2529cf5c527e3400de3038a41e94e38f5a3bf4a0040bc9e69dd3f2a6fbd2d002834bef4deb4f1da8187f3a50b9a50a0b668e99a2c21a78cd3695f914ca4c62d14dcd28a0070a7e39a6af14e14085a4a08e28038a00293ad2e3da929809ed41a01a0d52132365069aebc74a9719ebd68da318356910caac3e5cfbd466a764c544506680226e9d2a2ef5330a89a810c34d6a79a6d2018d91da9a5b8a908a8d968189be9558544d953423f343408b19cf229f9e95006e78a90352b0c90e48e0d3a134c5e475a9100a009d3e634febd3bf351ad3f07b5003c74e946285ea334a09cf140074ef49c53f3ef4d3ed40098a4e3e94a4fad349a000d37d69c7914d3de801a714c34e3d29281087a8a69eb9a5a2810d3401d6939a2810bd475a00e7af149d29d8a6805c1a5ea693f0a503b8a621c3d6957a52669455210a7bd51bd4f36138abaf8086a1401a2391de988e78aed2453d0d49791f9739e38cd422a19a22ca1a9d1aaaa1e6a74348a2da355843d2aac7cd598fb5084c925fb954f193d2adcc7e4aae839aa6244b0c5b980c56ec4bb2303dab36c22dd2e7d2b56b582d0c6a30a29296accc28a28a0028a28a601451450014514500145145200a28a2800a5a4a5a0028a28a6014b4945002d28a4a2900b4514b40052d0296800a5a28a005a514528a40029692968180a5a28a005a28a280168a28a002968a2800a28a2800a28a5a0028a28a007d145150505145140051451400b45149400b45252d00145145001451450014514500145145001451450014514b40094514500141a28a0028a2968012968a2800a0514500145145001451450014b494b400514514005145140051452d0014514500145145001451450014514500145145001451450014514500079acfba8f6b9ad0a82e937266a24ae8b83b33331cd4ea7e5a888a7a1e2b04743229ba55291aaf4c38acf9a866b023dd4a996715166a5b7ff58282a4b435947c82a2906189a980f9454528a673dc62d2af4a4ef4b4805a78a6d28a063852f7a168a0429a4cd2d21a601cd2d1ef475a004233470297ad21a0043cd263db9a71e290f4e2801a4533049e9521e0f34d3458630f5a69fa66a4e334c2a4719a4319eb498a71e839a6f278cd0027d691b1eb4a79c534f7140064ae697349476a062f5a90631c75a8f81c669eade9c5003f229acd4b9dd939a8d8e3bd00213484f34868ed486079a72d201914f0b81408729cd3bb520a753109f5a3a77a5eb4b8cf14009d4534e2a42298c280199a28345340c503de9bf8d1d68c9f4ad6266c8981c91daa2715338e6a16340863f4a8d80a97ad308e7a500424714c2a6a561cd262901152106a5c77c534fae28195a54dd55b95622af15aad2a6680115ea656aa7cae3353c4d4865b1da9f9c5428770a9149e99a4c0b0a7daa5ce4d409cf4a9d0f3486387bd49f853323d3ad380c0e714c41d2938ed4e1d334cc7718a003a9a69e0d388c535bbd03133de9a7bd28c6290ff003a0434e476a69cfd29c718a696e9484260e290f4e294fd69a7ad310868a3eb45020fc29c39c1a6e4e314f1d38a6217eb4a2933de8e335421c29cb839a68e9d69d4c4c6cc7087dea188e0914b70d82054711fde819a1b1a29ea89c8359e2b63524fdd0ac9c5496b61e95623150c756a35a4512c42ad46303ad408b56070b40991ced4d8f9c523fccd566d22df20aa5ab1376469d945b2207d6ac50abb540a2b75b1ccddc28a28a62168a28a0028a4a2980b45252d001451450014514500145145200a28a280168a28a6014b4828a005a5a4a514802968a5a00294514b40052d252d0028a5a4a5a43168a28a005a28a5a002969296800a28a5a00297b5251400b451450014514500145145031f4514540c28a28a0028a28a00296928a005a2928a005a28a4a005a28a2800a28a2800a28a2800a28a2800a5a4a28016928a2800a5a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00296928a005a28a2800a5a05140051451400514514005145140051451400514514005145140051451486148e37022968a00cb9936b914c53572ee3fe2aa678358c9599d11774120c8aa13a62b44722abdc47c54b348caccc97e29d13e181f7a74eb8aadbb1528df7474513864069b2e40cd51b0ba1c21357dfe75355739a4b9590e4e334a0537a714e14843a9c29a29c2801c3a529a414b4c419a281477a061452d37d73400b498a51cd2e334009ef49eb4b834119e31400deb8f4a6914f614d3839e2818ce7bd35bda9edd4d37af4a06479f51de9a41c1a908383c530f414806f2314d2714a4f3d290e3d28188693276d0683c1a00729a7af7c0a628ef4f19f4a003271d2a36a7b7a5262860262942fb53d453b1482e3314ab4fc5250028a5ed8a28a62147614ec526314e2703a534021a8db8a978c546dda8604749d69c78a8db838a100bbbb5191de9a4714dc9039ab4c968256c77a858e69ccc0f19a889029dc5617b7069306933413dbd6a8910814dc0cf4a7f5341038a918cc6690a1ce6a5db498e2802bbafb543220ab6c2a095690ca12a814d8df06a7b85cad553c1a76117227f4a990f22a9c4f8a9d1b8a4ca2e4672700f4ab23af355a25ab31e6a40914f5f5a767229178047f3a3d7f5a000b521c134525002fbe7ad30fbd293c1a4cd310878fad34fd697ad37ae6900878a69eb9a76299cd0213bd3694fd293a1a601d283d683cfe1475a04031cd3f8e3d69a1700d2af5a620e7a53b91d05369f4d0870e94b9a6fa506a892bdc1cbd117dfcd4729cc86a48fe55c9a9bea57423d4981502b2d855bbb937c98aad8c9a4ca8ec3a25ab712d4112e4d5d812828915702891bb5398851508f99a9920a326b5f4f836aee3546d61324a2b691422802b482ea65363a928a2b5320a28a5a004a296929805145140052d252d00145145001451450014514500145145001452d148028a296980a296929690052d0296800a5a29450014514b40c29d4829690052d2528a002969296800a5a28a002968a2800a5a4a5a0028a28a0028a28a0028a296801d451454141451450014514500145145001451450014b4945002d1494b4005145140051451400514514005145140051451400b45252d00145145001451450014514500145145001451450014514500145145002d1494b40052d251400b45252d00145145001451450014514500145145001451450014514521851451400c9537a1159cea4135a86a9dd4783baa268b83b3b1554e28719148dd69cb822b237336e53af159d20c66b7a78430359b3daf5a9368cb43396428c08adbb1ba132007ef5643db914fb5730ca29dc26ae8d97fbf4ab4848750c29450603978a70a6d381a603852f6a68a750000734bc7149f8d2d001d28a2931cd02034b494a0d03141c52114beb494c04e334c23031521e29bf8d01718460e29b8ed4fe9927f0a6107140c676a6377a7fad35b3c7a5218c3db8a69a7537b919a431b4b81d7349cd2d00394f4f5a939fad313a7029c48fd680129c0508a09a785a0000a5e94b46334084a2968c500263de947dec52e2976d3b00b8a50076a5c0a72a8c5348430f03351b0a9c8eb50be41a182216a8b39e4d4ce2a36a918cc9cfb53589a53d3a533a139f4aa4c4c8d8609a8da9d266a2634ee21c281c669884f734faab898f41dcd3b1ed4d038a72d210b8cd37d6949a61345c046a8641531fa544e3340ca93743549eafce3086a930cd34c06a7156a239c55755ab100c1a4334221c8e2ad85c6302a1823e9935642f3806a18c4c0e693a738eb4e205211f96690094838a5ef4d269809c7346703a51c66938a6213b13499c9a527de99dcd0203ce69b4b487af34c430f7a69e84d3bda83cd02101cad2f142d387cc6989811c668c0c819a31cf3d281d68100e29c29052fd69a10b43700d28cd4731c29aa115f00b669b3cbb53029a650b9c54058be6a4b4881c9634e5534f54cb55848b3da9163224abb10dab4d8a30bda96570a38a7626f71b2364e288d79a6a024d5db3837b8e29a576127645db1876264f5ab548a3680296b7b58e66eec28a28a620a5a4a2800a2968a602514b4500251451400b45252d00145145001451450014b4514005145140052d145201d45252d002d2d252d0028a5a4a5a005a28a5a0614b494b480052d1450014b451400b40a296800a28a280168a28a0028a28a0028a29681851451400ea28a2a06145145001451450014514500145145001451450014b494b4005145140051451400514514005145140052d252d001451450014514500145145001451450014514500145145001451de8a0028a28a002969296800a28a2800a28a5a0028a28a0028a28a0028a28a0028a28a0028a28a4014514500145145030a6cabb94d3a8a00cc9136922a2195357aea2fe2154cad6125667445dd0eea2a292306972569dbb348ad8ce9e30335466001e2b567435465809e40a9344cb3652efb6193d0e2ac2f5aa364ac84a9aba3b533363fd2941a414b4087034e14c5a70a621d4b9a6e78a5a061cd14519a00339a3b5147e1400ef6a45ce71487da97f0a600690e683c521f618a0061ce4d34e7ad3cf19ef4c38e2818c7c0351bf3c7a74a7b7eb4c39a918d6e292827a534f7a061de9eb8cd31572454a8bd4d002f6e28c7414bb68ee3eb4c448ab8a774140a0d003734ab4d3907229cbd28063b140a33466988294537346680241c9a78c0a843734e0dda84c4c9b6826a19176939a789306992beec5376b095ee40dcd44401523f1513549631f3daa2638a7935139a6032439c542c735231a88f4a2e26394548bcd323e95322d021452f634ec52914c4446a36352b2d42e281867834c6ee29c338c535a802b4ff0070f35500cf7ab37478da2a144381c535b00aabd2ae5bc638a8e288d5c89318a4d8cb9129e29e40c839a6c59edc5487e9489ea458c77a4e79a90f7cd4673525098f434df4a7fe18a61e3a5002743d290d29ef4847a9a621a4d348c77ef4adda90d31099f6a6e734ad4dc0a042518fd6814be94c41df14b9c1e2931ce69723269880f7a5a439e3e947a5310eed4bda900eb4bda810a38aad76fb62fad59ed542fdb2c0530ea5504b0a9a38fda88938ab51a71526972b326d6a96238a26e2a1de45022cb4a0546b9739a6202d56634a61b0e8d338e2b5ed21f2e306a9da43b9c569f40056b05d4ca72e8145145686414514500145145002d1494530168a4a280168a4a5a0028a28a0028a28a0028a28a00296929690051451400b4b494a280169692945002d2d2528a005a29296900b4b494b40c5a28a280145140a28016945252d0002969296800a5a4a5a0028a28a0614b4945002d145148028a28a007514515230a28a2800a28a2800a28a2800a28a2800a28a280168a28a0028a28a0028a28a0028a28a0028a28a0028a296800a28a2800a28a2800a28a2800a28a2800a05145001451450014514500145145002d14514005145140052d028a0028a28a0028a28a0028a28a40145145300a28a2900514514005145140c28a28a0423286522a84c8518d685453c7bd2a64ae5c656666bd354f35238c1c5439f9c5626e895903544d08f4a981a42d405d95bcb0a69c314f6f5a62f7a431c4714b49cd2d021a58ab01eb520a611ce734e1da801fed4522f7a5e6800a5a4a29806dc3134b9a281de80141cd2f7a65381cf02980b9e7da98dcf4a73531a8010e2a366c53ce7bd308f4a4c68613d39a8cfd69efe9c5464f26a4a10f434ce4d38f5a5db93de80155702a60bda9aaa7d2a50053421a45358743de9c7e94d614012ad2f5a8a36e31e9526ea60295a29a5ea196608093d286ec04a5a90c83d6b22eb546076c4b541e7ba941dce68dcae53a33328fe214094377ae36633aff11a48afeee061b5cff3aae525bb1db06cf434e53cd62e99ab7da142ccb86f5ad85391d78a9d84c9334c634b4d63400c7350b9a91aa26ef40c8c9f6a8c9a73544e702900c635093d6997170b08f98f3e958d777af31c0e16a946e4c9d8db5bdb75c0332e6ad417114bf72456fc6b928c126af5ba3819526a9c52126d9d42914edb5996770ea02b9cfd6b415f23ad4a060ea2a175eb5393c546f4d8220c62a27f941a95d8019354e57f34e01e291444d9924e3a0ab1147db1db14d8901e335651698874683fc6a641834d514f1f4a4c09a33cd4a0fafad42a71cd4b919a40c18e2a363d3352373834c63498d0c63d3f2a69fad38e7b1ec69b48634b678a4279a3d691bbe0d344b1a693a0cfbd29e0d34d5084f5e6928efed49df914c4c5a52738c1a41d327a51eb4c9173cfbd07be6929cdd698094a0738a17e6340ce4f140872f14a29071c528ef4c4154665df31abc7804fb556c8ce4d260b71a91d5955e29aa054a3a5086d94ee4722a00b9ab53a6706991ad031d1478ab08b9c0c535462af5a439f9d855a44b762c5bc6234f7a968a2b53161451453105145140051451400514514c028a28a005a28a2800a28a050014514500145145200a5a4a5a6014514b48029452528a005a5140a28016945252d20168a29680014b494b40c5a05140a005a5a4a5a002968a05002d145140052d028a0028a28a0614b494b484145145030a28a2810ea28a2a4a0a28a2800a28a2800a28a2800a28a2800a28a5a0028a28a0028a28a0028a28a0028a28a0028a5a28012968a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a5a4a5a0028a28a0028a28a005a28a2800a28a2800a28a2800a28a29005145140051451400514514005145140051451400514514019f78815aaa1abf7e381540f4ac64b53a21b0e56e282699d293766a0bb0fcd333f3d3874a8dfe561401252fa53453877a64863ad2af4a07229690c5a5a4ed474e280145149b80c51c5002fad1467de822980bf41473494b40013d78a6b7d29734d27d2818d6f96987a53cfe74c63dc8a43233fad47d335239c530d218831d69e8bcf348abef5322fa9a005514b8a5a5aa246f4a69a79a6b50318473c501a9cc2a36c8348623b554990b83926ad134c60281a292da0cf4a956cc11565702a44c5340db33a6d3d5948c555fec95de09e95bfb37530c433d2a84a450b7b248d46d5ab70ee8c63aad49b71d28c52131f9a631a7531f38a4218d51134f63519cd2191b9c77aa17775b3e54e5aad5c3e01e2b39a3c9e7939a680a332b3925cf26a0fb39cd69b440f1408855264d8a715ae2adaa6d00548a8050c719a0685438ab904dc0ace6930338fcbb5466e25fe01814ac3370ceabc938aa971a8c49df26b30f9b20cb39a67d9ce72453b08b66e1e73c54d0a8039155e15dbdaad46dd053b012af6ec3152af5a601520a421c319a7ad460714f1d290c957b549dc5442a41c8a4038fb0a6b71918a5e00a61ef4804f6f6a61fa53b348f9268018c0f34845389ce7da9a79340869e074a8d89c714fddcd333c1aa105267a52e68c0a684213814528c77a4f5a64863e614eee45371ef4be86980bdf34ee29a38c834e1d68245140a314bf8d310d7fb86ab37156253802a265e293290d57a9d5b205560306a75e940c5619a5118ea29ca01a95578155626e2c116f602b4d542a802a1b64dab9a9ab58ab23293bb0a28a2a890a28a2800a28a2800a28a29805145140052d252d00145252d0014514500145145001451452016814514c02969296900a28a296800a51494ea002968a5a4014b494b40c5a28145002d2d252d0014b451400b4514b40051452d00145145030a5a4a5a4014514500145145020a5a4a5a005a28a2a4a0a28a2800a28a2800a28a2800a28a2800a5a4a5a0028a28a0028a28a0028a28a0028a28a00296928a005a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a5a4a5a0028a28a002969296800a28a2800a28a2800a28a2800a28a2800a28a290051451400514514005145140051451400514514015af972959f8ad5b84df11159b8e4d67346d4de844c29156a6db4d039acec6b700a00a8a6a9d8f155a66a1b04390e5453c75a86dc929cfad4def4c43a8a3b51480514b4941a006bae714ece47341a6d218ea5c9a4cf7a3d2810b47e3494bcd0021a6934a69091e94318c26909c7d697a66a36fc6818d73cd341f6a42dd29c832690c7a2f39a9569aa3da9de9814c42d29a314531013d062908a3a668f4a006e339a630eb52537140c89d3ad47b5875ab0699b49cf3487722c7a53812314acbea79a4ebda98c9558d3f39a8791d297771ef4d1161c4d34b526ea8c9a571a24de79a69706a22f49bb8eb4058731a8dd850734c233de9015e5393d2ab91d38ab4e950ba734010b7d290607515232e3d6a327ae6a9080bfb54323d498ce69360f4a62210ac7191522439ab0b1d49e5f4c75a6172048bda86881c815676e33934103bd00560b821718ea455845e9c73405cf5a914600c75a0051c7f854800a69a5cd2603fd39a1723bd203ed4e02a46489f5a72922980d283c8a5701e0f18a693480f028cf5a004cf7fc290b71f5a0d34d000c7f5a696ed9a334df5a04231e69a29693e95484c4a3a51cf422940a689620cd27734a7da9a79a621c3d28e41c5277a56237d021dc528eb498ce3eb4ee94d00bd714e18c5331d0d3c73544b219db0c28c022a19db329152c4735257419b71524748c39a54eb4c09914fa54d08df20f4a8067357ed23c2e4d5c75644b44581c014b494b5a190514514c028a28a0028a28a60145145001451450014b451400514514005145140051451480296928a005a28a2980b4b494b4802969296801452d145002d28a4a5a4014b45140c5a5a4a5a00052d20a750014b494b4000a5a414b40052d145030a2814b48028a28a04145145030a5a28a0028a28a005a28a2a4614514b400514514005145140051451400514514005145140051451400514514005145140052d145001451450014514500145145001451450014514500145145001451450014514b40094b494b4005145140052d252d0014514500145145001451450014514500145145200a28a05300a28a29005145140051451400514514001aa7736e73b9455ca3143571a766656714d2d5a12daabf3deaab58c9d88acdc59b29a2abbf155df7b9da8324d682e9ccc7e73c55b86d2387a0e69283ea53a896c67fd94c10027af7a60e95a774b984d670e94a4ac4c5dc5fe1a281f7694549614b4de696800a6e29f4d2290001405c75e4d1e94a450019a29283400134d3ef4b9ef4c66e2818d6350bb1f5a73b1c75aaeefdbb9a57290f5f98e2ac22e2a3863daa00ab007142426c00cd2f4a5149f8f14c4141a0d1ce3ad00277a3eb41c77a338a630e99f4a696c52939a4fc280132076a4200cfbd29231c537703d2801bfc468e98a0d03eef0280b8678a439c75e94bb7149cf39a0434e7839a47a5fa8a6e780690c8cd26734f2a31d2a3381d3f2a0051c8a5db9a45e94e073da80222beb4c641e953b0a8d862811559719351ed073c1ab256a3da7938a60c8767a0a5c0e062a4fc68c02b544898c134e19e29319cf34b9e00e6980bc35276e3a5033ef4020f63400bdba53b91818a41fd69dc671de900bd052f5ce4d275ed40a431e3b53e99c7ad2e48a4c07e6941a6ad2f4a4301d28f5f4a466c1a4634001a6939eb413ef4d3da8006349ef83467d4d19eddb34d12270734dcd29ec33499a684c3d6978c525274efdaa9085ed48718c628ed49d4e2810ec77cd0171463bd07b5310e50579f7a70a68a70eb4c43a97b1a4c734afc237d29899992be676fad5989ba5521f7c9ab711a9b15d0b58ce0d262856e2a58a2690f02a9226e2c1117715a6aa14014c862112e2a4ad52b19c9dc28a28aa2428a28a0028a28a601451450014514500145145002d149450014b494b4005145140051451400514514802968a2980e145252d201696929680168a28a005a5a4a5a005a5a414b48614b494b400b4b494b400b45252d0014b45140c5a28a05002d145148028a296800a28a2800a28a2800a28a2801696928a918b45252d001451450014514500145145001451450014514500145145001451450014514b400514514005145140051451400514514005145140051451400514514005145140051452d00252d252d00145145002d1451400514514005145148028a28a60145145200a28a2800a0514500145068a0028a28a0028a28a0028a28a601451450014514500145141a43229866335998ad671943f4acb7e09ace68d2025276a0502a0d029dda9296900521e94be94d3cd200e3ad2d20ef4b40c4e949da95b39a4c0a004a8dcfb53cd432679cd22915e5939a8edf7492173d3a629b70dd7f4a9ed63db1a8fc69229ec5b4e053b8a68e00a7678ab3316839a4e848a09fc2818a79e29adc82aad834bd7bd331c9eb4805dc718ef40dd8e452631c0f4eb401b73ce681831006e278e949fc59a320e558518e7af18a620e7031eb4dfbdd3ad291dc74a338a60211b80a36e13ad3851d3a50030f4e39a4209e839a7f4a69c673480674ea79c52678a56c7ad21f6a4313af7a6375e29e6a33de98841d6a4e8053053d4d0035b3d734c23eb52f534c6e31401095e3a734c6ce39a9703f5a615193f4a0191e3a9a6ed23ad3cae0f6a4c60d512370377d68cf39cf4e29c005269a57bd0021cb11834e1819347a5045301c3d7bd2f20673f4a6f3d4734061dc5201d9f7a506987e51eb4027268024069db8d461a97271486480814b9f7a670c3a53b8e2a462f0714879e945373d69008734d279a56e0f5a8d8e0e7b5310bf5a775c53334bbba531303d7d293d2826907a550873527a7d2933ed4bef4c914d37d28141c718a602e78a55e82980f6c53c5021e053875a8d734f43934c43fa62a4890484a9a8cf5ab3663926a92224ca92e9033946a44d36507ad6b8a755f2a27999460b0dbcb9aba8810600a5a5aab0aed8514514c41451450014514500145145300a28a2800a28a2800a28a2900514514c028a296800a28a2800a28a2800a2968a0028a28a00514b40a5a4014b494a2801696928a0070a281450316969052d20168a28a00514b4829680168a4a5a062d1451400b4b494b48414b494503168a28a0028a28a0028a28a0028a28a005a28a2a462d14514005145140051451400514514005145140051451400514514005145140051451400b4514500145145001451450014514500145145001451450014514500145145001452d250014b494b40051451400b4514500145145200a28a2800a28a2800a28a0d001451450014514500145145300a28a2800a28a2800a28a29005145140052d14531894b451400d238acc9c62561ef5a959f76b8909f5a89ec545ea57cd2d251591b0ea292945200148dd29d4da00603527a544786a91690d8521029d450046dd6a092ac35579690d19f3f240f7abb129005572bb9c71deadafd2922a4483eb4127d7e949d81a5393f4aa243a13934bfce93bf34e1ef400872051fa51d69700d002743ee69a72bf5a737d3da908ce08a0637f0fc6948e0ff00234a73dbd68c7b500308ce0e7a74a534bdf9eb49b33d6980a39a5fe1e948473ed464e68103718a61c8048a7b752714d6e940111c5329edf4a889e290c53d09a6e7da827ad37765a9898e079e94e5c75a6034e5aa421ddcd30f4a77af348693191e300e69873c85152376e7a53188cf152046c307047349df38a71fbd49c8e94c434a81477a5619068e3ad508180e29a7039a5c7a9e6906327268017231d2909c6051ce7ad35beb408766933ed40c0eb49d09c1a4c6381c9a5dd4cce29c38e9400f56cb548b8a854fff005ea61d69318b48c7834b48f486464773513723f954afe99a8d8f140845f4a338a69cd3bdea8917bd04d27714be94c41d8d19cfe5484fa51c819ef4d083938a5079a4e68ed934c051f7a9c09e45228a728cf5a042a834f5ebd29a29ca39aa10eef576d07c99aa639357ad5711e6ae267226a5a28ad080a28a2800a5a4a5a0028a28a0028a28a0028a28a601451450014514500145145001451450014b4945002d145140052d2514805a28a298052d252d200a5a28a005a5a4a5a005a29052d003851494b4862d2d252d002d1451400b4b494b400b4b494b40c2945252d200a5a28a0414b494b40c28a28a0028a28a0028a29680128a5a2800a5a4a5a918514514005145140051451400514514005145140051451400514514005145140052d252d001451450014514500145145001451450014514500145145001451450014b494b4005252d140094b494b40051451400b45145200a28a2800a28a2800a28a2800141a28a0028a28a60145028a0028a28a0028a28a06145145020a28a29005145140052d251400b451453189552f57a1ab955ef17311a97b0e3b99c7ad14628ac59ba169692968185069693ad211138c8269636c814ac29abc1a4512529e9494b4086b74a81d4f153b74a8dd6931a2b6cf9b7548a694a8342d086c78e8291b9a29ae714c405a9d9f7a88b0c75eb4d12648e68b8cb229d818a895b38a9548e29921ce68a760527e3d2818828a524734d2d81d6980537bd0cea3bd30ca077a4343c0c77a5c818a85a5e690cdd0e280b13139a6374e95134d479d4c2c2b75a898549e66691f6b632293021208fcea3c906a765eb4c64e7b52b0c8c375a7e48fa526de4669db401d285700c8e7f4a5c8fc29b9031486402a856158e334c2472291a65fd2a2328e6930b121c6e1f4a41d05377a9a370c629a13429147b5283c0f4a314086f7e7bd272714fc74a4c734c433b9a69ebcd3b18ebd693f0a4037a8e7a519f6a1b92401487140850c7a52fcdd4f4a6138c714bfc4314012281ce2a75ce2a18f9ed53af1c638a91a179a1fa52e0f148e3341442fdf9a889c8a95f15130e07ad0219fad2e78f7140ef4bcfa5522451eb4a2907a5038c0aa10bd8d252fad309c1a042d2fae69a3b53d45301569f4c1c13e94f53919a0962d3871494a33d6a84c917ad6844bb500aa310dd2015a238ad22672168a28ab2428a2968012969296800a28a2800a28a29805145140051451400514514005145140051451400b45145001451450014514b4005145140052d1452016969296800a51494b400b4a2929450014ea4a5a43168a28a005a05140a005a5a28a00514b4829680145140a0520168a28a005a28a28185145140051452d00252d145001451450014b494b5230a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a5a4a5a0028a05140051451400514514005145140051451400514514005145140052d252d001451450014514500145145002d14514005145148028a28a0028a28a0028a28a0028a28a6014514500145145001451450014514500145145200a28a2800a28a5a0028a28a002992aee4229f48681992c3934da9665db21a6562d1bad84a5a4a5a430068cfb51e945201a4534fad494cf6a431453a9829d4008698c29f4d348061a68eb4ec50306818719a89cf15213daa098f5a00824971501b8c1a6cac779aab2bd08a3462ba078cd595b8ae776b91b949a635d5d4393c1157ca4dcea3ed1c537cf26b0ed7555908493e46fd2b455c914598d59965a5269ad29e6a3e79a3b74a2c50f2f48ce7d78a4c0a0f4e9de8b00034727268cf5a50a187538a0061391eb4d5cf5a78c64f240a41f283c76a760b8858e29a64230297680a79a6b602516015a47079e8690ce7b8a6b7cbdf34c7f971cd20d073dd364002a36989eb4c671c9cd47bb34587a126f25739a40fd39a8d5892d83d69d8c6284842eece79a6b1cd21e0d37f1a761363cb91c52efebcd33a93cd27e345844be674e4d2f9c7d7b5403b81460e7ad311644e29fe686e86a98279a379ec71482c5bdc39c7a520ea093c555f30e3ad2f9e46281164b8fd2a33f5a87cee3ad34dd2727777a045927ffd74027bd565943f46a9a0c6e1c52605b856ac81c5450b66ac0c734808f1f20e7151be769c1a9ff84544dd08e948644c38f5c5444f353374350b718f5a6806719a51c9a4a7679a6890efd68a3d697d2a8421a6724d3dbbd37bd021c3b714a0649f4a00e29c3a1a6027b53876a4ed4a38c50891fda9cb4d1d053c55a116ad172dbaae5436c9b6215356a91930a28a29885a28a2800a28a2800a28a2800a28a2800a28a29805145148028a28a601451450014514b4005145140051451400514514805a2814530168a28a402d2d252d0014a2929680169692945002d28a4a514862d2d252d0014b494a280168a28a00514b494ea060281452d200a5a4a280168a28a0028a28a00296928a005a28a2800a28a2800a5a4a5a918514514005145140051451400514514005145140051451400514514005145140052d14500145145001451450014514500145145001451450014514500145145002d1451400514514005145140052d251400b45028a401451450014514500145145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a29005145140052d251400b45251400b494b450328de27ce1bd6ab1ad0ba4dd19f6acface48d60f4128a292a0b1697b5252d2185348e69deb45260331cd3b148452d200a6114f34dfad0031a9334b49de8188d504c2a63d6a3619a00a12a6e7355a483e61fddef8ad165c9151345fbc3de9228ae902f40689ed03479c5581190548a9c206c8ad13039bbab2c1dc9daaee9b2c9e5ec7e76e2ae5c418cf1d6a38a3f2f1c75aabdc3956e8b51b827938a90f7a85d06dc11cd265d0e179f6340589bf9d3327bd33cd3dd29be6b679438a560b3250c28dc73f85315d1b8ce3eb4ee45160b8bbf81cd21738e6908a4ebc5304d31dc0e33d6938e327bd01475c50ca18f4fca86c623b36dd8482339a8df9047ad3cfca578e9c5054331e0f14202ab02b519c66acc89ed50b2063480600c39a72f42d4bbb82a4703a527f0d342633048a1805346e04527ad3109d693148a772f14e1e9458434039a70cfa50b827a8a5775c75a6213800f14cce3b531a551c726a2799b1855fce908949a8649957be4d34876fbe69044304e3bd3b0990cb3bb70381ed55f049ab92200714d8e1dcdd2a93b10d5c5b2560d5ad10c55786054031f9d5b8d790456722d22cc2707a5585c633502f4a7862722a0a242d5137b53aa32c6900c722a166f9aa473d6a239cd31303c914beb4838c52f63542014ee8052004e3d3149ce699229a41c519eb4a3ad0039734761494ec6698076a5ea2929c2992396a68537482a15e6af59273baae24cb62d2f000a5a2815a990b45145020a28a2818514514005145140051451400514514c028a28a40145145300a5a4a2800a28a5a0028a28a0028a28a0028a28a005145145002d14514805a5a414b400a281450280169692968016945252d218b4b494b400528a4a51400b4b494b40053a9a29d4000a5a414b48614514b400514514005145140052d252d00145252d001451450014b494b5230a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a280145145140051451400514514005145140051451400514514005145140051452d00252d14500145145001451450014514b4005145148028a28a0028a28a6014514500145145001451450014514500145145001451450014514500145145200a28a2800a28a2800a28a5a0028a28a063586548acd954a3915a7552f23c10d8a992d0a8bd4a740a5eb4d3591b053a9b4b4862d14945200a4a7525001494b486801878a69a7375a630e290c43cd348a7e063029b8a008997bd37601daa6238a5dbc52195b6fb54883da9c53191da85e94d31dc648995e9d2a9bc6720d68e2a0993f2aab8d320460dc9ed4e0b9dc4f7e8298cb8c629e1b1569831db1541a618f3433f1c679e29ebd3af340d1094078c5279457a66ac71cf341e68195499077a89a4981e00e2adb2e73ed51347df1487ca84174a402e307da9fe7211c30a8993da98625e78a04e04ad2a15fbc3ad38483aee1553eceac7a527d9feb4058b0f20e7e6e2aaa4e8c586edbcf141b7e6905aafa53b0ac29963e7e6a8dee5318049a97ece076a516e3d28b058a46e1dbee46286f35c72481e82ae98140e949e4d50b94a6b1b0e8c69de53f76356fc8f6a91226c0ce3d4502b24531162a64894e72054ce823c30ea0e6890f27da990c819540ed51141c7bf352c872a38ed50e7e41f4c50210286c9fd29927fad38e050cd807eb4630e7b8a0435d4336ece735345163f3a48939cfbd5845e7a52602a8f7ab11a8c0f5151a7d2a64a863245e39a729e69808a50704d48c7126a3734ece6a26e690099a61ebcd2b669bdea84038a074a0639a5514c91d9e293a0033401cd277a621c3a1a00c5275a01ed400ec528a4eb8a334c42d3853453d31d69a10e8d7240ad58536460551b38f73827b568d6b1465261452d15648514514005145140051451400514514c028a28a0028a28a0028a28a0028a28a0028a296800a28a2800a28a2800a28a2800a28a5a4014514530168a28a4028a5a414b400b4b494b40052d252d002d2d2528a431452d252d0014a29052d002d2d252d0014e1494b4000a5a414b48614b494b40051451400514514005145140051451400514b450014b494548c5a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a5a4a5a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002969296800a28a2800a28a2800a28a2800a5a4a5a0028a28a4014514500145145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a29005145140051451400b4514531853254de8453e9290194cbb4914dab577161b70ef556b292368bba128a5ed49d2a0a0a5a4cd19a43168a4a3340077a0d14500308a69a75045218cf5a30694d14008297ad1477a00422931ed4fe69a45002007348413c53e8c53195248f04e3d2a1cf5c76abec808e9551e3dacc05329322c027b66955b18fad348c36714e38214639cd51562641bbb0a711b8edc0fad42a4a93cd4cb20dbd2989ee214c035132fb55b441b5723208e6a26420138e28b02915769cf229197352b2e01a685e79a459184ce2a4f28e6931803eb4f3f29049a684d9118fe7c63a52797c038ed5346bbb27d697b1a0572bed1e94a40dbef5214cd3480060d170644c8095a912252e379205376648a476f4240cd52259624dab13285dbdc1efd2ab4a7e45c750314d7762392719a88b161d4d3ba22cc74adb80ed50b9e9cd299148048efd3a54248c924d0206fb84fa545b860d2924e69bc00682469c9a9238fd69aa8589ab289b7148054181d2a4149e94f51fcea580e4a917814c41c939a7fe35231697229b9a0b60521833547bbad38b1a8cd31066933484e28a04385397229b4e04e0d5210bd8d37b52d14c4252f7345033400e1d29334a28a0962ad48a39005462add9c3bdb27a0ab48965cb58b6463d6a7a4a5ad5190514514c028a28a0028a28a0028a28a0028a28a601de8a3bd140051451400514514005145140052d1450014514500145145001451450014514520168a28a602d1451480514b48296801452d252d0014b4514805a51494a2818b4b494b4000a5a414b400b4a2929d40052d252d03014b494b4802969296800a28a2800a28a2800a28a2800a28a2800a5a28a002969296a46252d145001451450014514500145145001451450014514500145145002d14514005145140051451400514514005145140051451400514514005145140052d252d0014514500145145001451450014b494b4005145148028a28a0028a28a601451450014514500145145030a28a28105145140051451400514514005145148028a28a0028a28a0028a296800a28a4a005a4a5a298c64a81d48359b22146208ad5aad770ee5dc0722a248a8bb3281a6d388c669b58b364252d2514862f1c52d3697b503169334669281067a0a08a297ad218dc521a75262801b4504e296800a28ef45001451450000034d9230c370eb4f1430a6051923c31e2a200af6e6b41d011838aad244c083d69a668990236d3cd3b277706861f3138a391ce4555ca27490ae0127a54bb81057b62ab99b76cc81f2f4c0a9770519cd3b99b890c839207e15137dd3eb53be5d8fa0a81c3071900d22d0dec067bd3998b21ef8a48c8e7eb4c66e1c0a1144aaf8dbdb8a15be5c74a0fca474e95196c8a648fddf29cf5a4fbd9c9e8298b96a46c87a2e2027150b37c8d9f5a748dd3350b9047ad17010b1651cf5351339e0669589271e86a23410c527047bd319b9e2909a304e38aa440d38047d295537115224049048a9c201d0526c06a26da900ef46da5c54885a7814d1d714e140c78e0504f34941a4004e691ba504fa5373f9d002e78a6134a7a53298807269690714a2810e5f7a77ad3681d0d30141a5a681c9a77714c414bde93a51c5310a31cd1d0d1da9c8bba9898f8937b002b5a08c451815059dbedf98d5cad62ac8ca4c28a28aa2428a28a0028a28a0028a28a0028a28a0028a28a6014514500145145001451450014b494b400514514005145148028a28a601452d25200a5a4a5a0028a28a005a29296980b4b48296900b4b4829690052d252d002d28a4a5a062d2d251400b4b494b400a2945252d002d28a4a5a0614b494b48414b494503168a28a0028a28a0028a28a0028a28a0028a28a00751494b5230a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a280168a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002968a2800a28a281851451400514514082968145030a28a28105145148028a28a60145145030a28a2800a28a28105145140c28a28a0028a28a0414514500145145200a2968a004a28a2800a28a5a004a28a280168a4a280168eb494b4019f750ec6c81c1aaa6b62440ea41acb9a231be0d67389ac244468a5a6d646a2d19a4cd28a06145252d002d1eb45275a421690f6a5a43c9a0627d68a318a31d6800a414b498a00297b8a4a3bd0000629c3b536971d69a01d4c65e98a7668a0081e207b542d191fc39abb8cd319462994a45265071f2d3b78280639cd4ef18350946c104934d32af711ce49e377f4a67cbc03d28c1151b633c9e68188b8c9e7926984ed2c54d2b1c63b521fba067bd0315fa82c7b53376319ef4ae40c7351b3631cd17043b3cf069acdee698ce39e698cfe94098e72a43540cdd29598e08f5a6aa3b0ce28b92c693d69369e2a64b76ef52ac20629dc82b245baa648c01cd4db4014a7a53b8991841da9714e2314da42128a5229690099a701c502972280179c52673413d71499c50019a69ef45069884ed8cd26da5efcd2f27a5002673c520e0d27f17b5283ed4c42f7a1738347534aa334098a28c7342939e945342039ed4a074a4e69c29885ef56ad622efd38150451ee70315ad0442341c55c511264aa0280052d1456a661451450014514500145145001451450014514500145145300a28a2800a28a2800a28a2800a5a28a0028a28a0028a28a40145145002d14514c028a28a40145145002d14528a00052d145002d2d252d0014a2929690052d251400ea5a6d28a062d2d252d002d2d3696801d4b4da5a007514da75218b452514085a2929681852d251400b45251400b4514500145145002d2d149523168a28a0028a28a0028a28a0028a28a0028a28a0028a29680128a5a0500145140a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a005a28a2800a28a290c28a28a0028a2969800a28a2800a28a281051451400514514005145140c28a28a0028a28a0028a28a005a4a28a0028a28a04145145001452d25200a5a4a28185145140828a28a0028a28a0028a28a0028a28a602d453c2255f7a928a4c11932214241a88f7ad5b9843a923ad663ae0d63256378bba19c514b48454162e696905140c5a5a28a421691ba7028ef4b400da3d78a776a4a0625252d14008714da777a43de800341a4cfad28cd031452fa536969883349d49a53d693d69808690af19a5248e82909da3eb400d65e2a07881e7153b1c6334c6ce3a5008acf006a8cc03b559247714cddcd055d95dadf8e09a8cc1d6adb3679f6a6faf1405d94fecdef40b7ab4579a31405c83c91e94ef2c0ed5295e290f068248f6e2931ed4f2298fc63de90084537a8a5c518aa10da31914bb68c5021369a3b74a7629383400521e94b8e6908e69009dba52134679a298807bd1c51d3bd19eb4c41dba519f4a28a00690697a7141e829298851d053ba0a6fa52d301734526696992c5a5039c5039a9ed62324805521365bb1838de455ea445d8a00a5ad56864ddc28a28a620a28a2800a28a2800a28a2800a28a2800a28a2800a5a28a601494b450025145140052d277a5a0028a28a002814514005145140051452d200a28a298051451400514514805a514945002d2d251400b4b4945003a8a4a5a005a2928a403a969b4b400b4b4da5a063a945251400b4b494b400b4b4da2900ea2928a007514945002d14945002d2d25140c5a28a280168a4a2801f4514548c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a005a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a5a4a5a0028a28a0028a28a0028a28a430a514514c028a28a041451450014514500145145030a5a4a28016928a2800a28a28105145140c28a28a041452d2503168a4a2800a28a290828a28a0028a28a0028a28a0028a28a0028a28a0028a28a630a28a28101accb8004ac2b52b32f3fd7b5673d8b86e4045348a76683591b2194b451523168e2928a005a70ed4da51c5002d21a5ed450037f0a2968340c6f7a4a5a2801b40a5c62931c9c503003e6a5cd276eb4500389f5a6f6340f5a0f1cd31076cd27a934678eb4d76e94008c78cd30b6e18a5273c12299c67201e94c646d9da370e698c3df1530a8caf538a2c3231d7af14649cf3c5295ed4a300d20114e4528a5c527340838a4ebd69dc8a314c08c839a695efde9fce7ad263b9a0447d074a38db4feb4df5a006e077a3f1a5a28109db8a438a5fc290f4e94c43693907ad2b7414ded4009dcd1de823ad1cfa50908292969318aa10b40a3b5274a000d2763452a8eb40855ce28ed4b4531094f03229319a7aad50811735ad69088d338e4d57b2b7dc77b0abf8e2ae28ca4c5a28a2ac90a5a4a2980514b450212968a28185252d14005145140051451400514514c028a28a0028a28a0028a28a0028a28a0028a28a00296929690051494b4c028a28a0028a28a002968a2800a28a2900b45252d0014b4945002d2d251400b4b4da5a005a5a4a2900ea29b4b400ecd2d3696801d4b4da5a062d2d368a403a8a4a28016969b45003a969b4b40c5a2928a007514945003a8a6e6968024a28a2a46145145001451450014514500145145001451450014514b400514514005145140051451400514b45002514b4940051451400514514005145140051451400b4514500145145001451450014b494b40c28a28a04145145001451450014514b40c292968a002928a2800a28a2810b4525140c28a28a041451452185145140828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a0d1400566de7fae35a2ceaa32cc07d4d66dd3abca4a3061ec73533d8b86e43499a514845606c0692814940c5f5a3de8ed494805a514868a00729c8a5ed4d14ea0028a3da83400d3ef476a5238a4a06211494ea4a0030692945274a06263028a5fc29adcd31087af351b629edcf6a69c7a50318c76d37766924fa669bf85318eddb714d6618c5039ce69ac0fe1401139c36338a9571d71d69bb05380200a005c9a43c668341e94804cfe7d6839c7e3477fc28ea681086998a79e29bdf9a04271463de8ea28fe2a006e39ce293f0a71ea4f6a43c5021001eb4d3c0a5cd34f34c434d21ed8a534da620e4d140a3bd300e3268145032334083bd252f614b4c4329c3ad14a298094e514829ca2988502a7813738151aad58b5e65154887b1a48a154014ea28ad0c828a5a298094b4514c028a28a04145145030a28a2800a28a2800a28a2800a28a29805145140051452d20128a28a0028a5a4a002969296800a28a28012968a29805145140051452d0014514500145145200a28a280168a28a0028a28a005a29296800a75369680169453452d002d28a4a2900ea5a6d2d0316969b4b400b45252d002d14945002d2d2519a005a5a6d1400ea5a6d2d002d149450326a28a2a061451450014514500145145001451450014514500028a296800a28a2800a28a2800a28a280168a28a0028a28a0028a28a004a28a5a004a28a2800a28a5a0028a28a0028a28a0028a28a0614b494b4005145140828a28a0028a29681894b451400514514009452d2500145145020a28a28185145148414514500145145030a28a2810514514005145140051451400514514005145140051494503169a4e0134555be9fca8a80286a17bbd8a25320ff00575590892e871d4d6848811b02a67b150dc4a6914b41ac0dc69140a0d148038a4a33450014b494b400669c29bde96801c2969053a801b49cd3a928010d34d3c8a4340c677a5a28e334009dbad34d38d21a60300c0eb487e94ee73c631487ff00ad4d0c632fa5336fbd4a78ef4c3f4a2c045c2fe3d682334eda0e0f7a46a06348e0537a53dbb0a66280173c7e3411d7140e57e5a0f4c5210de9c51d314b8f7a0f6a0046a69a73114d3c0a04373d293b9a5f4a0f3d28010f534dcd38f069a6810df5a434ec629beb4c43690f5a53484669884a5ed4b8a4a620eb41ea7028c75a280b89ed451de8a620eb4e148a29c00a620039a781c5274a334c43f39ab365feb6aa8ed56ec7990d38ee4cb634bb514506b6320a28a2800a28a2980514514005145140051451400514514005145140052d252d0014514500140a28a6014514500145145001451450014514500145145001451450014b451400514514005145148028a296800a28a2800a28a2800a28a2800a5a4a5a005a05252d003a8a4a5a402d2d369680168145140c5a2928a005a5a6d2d002d14945003a8a4a28016969b45003a8a4a2802c514515050514514005145140051451400514514005145140051452d0014514500145145001452d140051451400514514005145140051451400514514005145140051451400514514005145140c5a28a2800a28a28105145140c28a296800a28a2800a28a280128a28a0028a28a0028a28a041451450014514500145145200a28a28185145140828a28a0028a2928016928a2800a2928cd030a2933494003b6d19ac8bd91a4723b55fb8940f96a838cb534ae0436f0fefd4fbd5d9fefd1691827344ffeb0d4542e1b91d25145606c1494b462900d342f4a5dbc520e2800c5277a7521e3b5001d69cb4da51400e14a29074a33da801d4514114c4263348714e3c0a693c5031b41e6947f4a314009c63d6987bfad49ef4d600648a76018734dc7a8a7e7de98739fe742189c1a6b7d2946369c7ad2374e2980cf534ccf7ef4edc7bf14d1823af34862fbd277a297ad0c06902999eb4f34de3269006e005275e6865079a31c75a004a434b41c1a043323ad34364529ea29180c63de810a7ad34f5a534940843f5a6fad38e693daa84211c669b8e29ded49cd30100a4ef4bed49eb4083bf1487ad2d14ec2107dea5ee68039cd2f7a0041914fe949da909a64816cd385329eb4863eae69ff00eb0fd2a98ab960df3918ad23b932d8d1a29692b5462145145300a28a2800a28a2800a28a2800a28a2800a28a5a004a28a5a0028a28a0028a28a0028a28a0028a28a6014514500145145001451450014b494b40094b451400514514005145148028a28a00296928a005a28a2800a28a29805145148028a28a002969296801d4b4da5a005a28a4a402d2d251400b9a5a6d2d031452d369680168a4a280168a4a5a005a2928a005a5a4a2802cd145150505145140051451400514514005145140051451400528a28a0028a28a0028a28a005a28a2800a28a2800a28a2800a28a2800a28a2818514514005145148028a28a0028a28a60145145002d14514005145140829692968185145140051494b4005145250014514500145145020a28a2800a28a2800a28a2800a0d14948028a28a06145145020a2928a005a4a2933400b49499a4cd03173499a33499a005cd2138a4cd4723803140105c618e41aae0126a760071eb4ddb5aa404969dea39ffd61a75bb6d6c5326ff586b0aa5c371945145606c29a293b52d200a6914ea4a004145045028012973466978a0055a5f4a4ef4eeb4c00734b499a5cd08421ce29b90c0f34a7eb4de940064e49a38a4dd8269a5b0c17be334d00a3eb48dc8a5c6ea673dc5300fe2c53181040c8a90f3f4a6b7ddc819a0646ca477e299bba8ef5213b8706a3279a4343768ee6818ed4a719fbb480e680119b00e697238fa518c8349f850021a691c1c53f19a69f402801bd38c7347a52fad1e94803a521a4e9d68a6035bad30f4e69ec474a6b5210dea28e28c8349d698828a31ef464714c421a69a71fad2138eb4c437de9bde9c7da834c4275a3a7bd1834a00cd0000734e3c527ad26698809a6d145218a29eb4d14f1408762adc07cb4071cd555ea2aec6032d6912245e43b901a75416f2863b476a9eb54642514b453012968a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a298051452d0025145140052d1450014514500145145200a28a2800a28a2800a5a4a5a0028a28a0028a28a0028a28a0028a28a0028a296800a5a4a2801d9a29b4ea0028a28a402d2d251400b45251400b45252d0014b4945002d2d25140c5a29296802d514515050514514005145140051451400514514000a5a4a5a0028a28ed4005145140051452d00252d145001451450014514500145145030a28a29005145140051451400514514c028a28a0028a28a005a28a2800a28a280168a4a5a004a28a290052d251400b494b494c028a0d140828a28a0028a28a0028a28a002928a2900514514005149450014526692818b9a3349499a042e6933499a4cd03173499a4cd25002e69334c92458c658d63dfeb6908211b9a00d59ae12252598566a5e99662074ac2fb74f7f2e0676d6dd940228c13f7aad202de49239a90544b52f6ab191ee2b32d3a53f3d365e39f4a8d1cb726b0aab42a1b8fa28a4ae63616969296800a28a28010d2538d37140066814628a0070a5cd369739a602f19a3d28a4e775020c7cd9a3ef734b483814c04381cd463ef93df14e7f9b81dbad33690d8cd002eec633de973c74eb4d2bf3290697763f3a601dbad34f18a40e0be3341c1cf3de980de3269acb953f4a7363a7ad37819c9a431a47ca01a6371c0a79e79a69f98e690c6804679a08c8386e68031926940c939a00400a8a56f6a38030a69338a006ee029297237118e714c271c52003c753499ee0d274ce6985be622810ea6e7ad3b9c5369883348683d29324638a041cf1cd1eb41ec692980521e714b49c9aa109f4a3ad14beb4084c74a32169a5bd292810eeb474a4a2818528a414e02801453a9b4e1400e157edc7c95457ef0ad1b7030056b021881fc89385eb5714ee00d41200314b1ca14ed35a233689e8a28a6485145140051451400514514005145140051451400514514c028a28a4014514b4c04a5a28a401451450014514500145145300a28a2800a28a2800a28a2900514514005145140051452d00252d145001451450014514500145145300a28a2800a28a2900b4514b40052d251400b45252d200a5a4a28014514514005145140052d251400b4b4945002d2d2514016e8a28a82c28a28a0028a28a0028a28a002969296800a28a2800a28a2800a28a280168a28a0028a28a0028a28a0028a28a430a28a2800a28a2800a28a2800a28a2800a28a298051452d00252d14500140a28a0414514503168a4a5a0028a292800a28a281051451400514514005145140c28a28a420a4a28a0028a292800a28cd36801734669334dcd003b3499a4cd37340c7669334da2800cd14514802a39655894b31a6dcdc25ba1676c5727abeb0d3b1443c534ae04daceb7926388d612ee9e4f9b9cd45212dee6b5748b32c43915a2423474bb31100d8ad6db902a389405029e6a8648ab5276a8d0e38a97b50318e32a6a0560adb6ac9aa8c9fbecd65515d1517a92d2d252d721b052d14b40094b451400629314ea4340098a6e29d4500329c0d25211400ff4a534c0714a4f154842e46e03da969bd0d26ee94001c60e3ad30f7a7546d8506801cbc2ae7b521ed4de31c77a0f4a6027727d6907514a4f14d2780281886933ce7141e839a4c7a5200ebf95368239a4072b400858e0d386491da90f34a6801080334cebde959b0c293d690098e4d274a3bd1400cfad26c032c29c4d21ed4083b5309a7741d6908c1a602534f229d49dcd084340e99a09a5dbef482a84c3d8d21a5ef9a697c1e298853c77a63367a74a6939a2801696929680168a5ed4520002968a2800a51494a3b508072e7cd5ad58bee8acf8002d57e3ade1b10c749d335997575e5c99ad36c9ac5d5e321491564b35ec2f1274033cd5cae12cefa4b59bad75d617e97318f9b9a1321a2ed1452d3109452d14009452d250014514b4009452d250014b4514c028a28a401451450014514500145145001451450014514500145145001451450014514a280128a5a4a002968a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2980514514805a28a2800a28a280168a28a00296928a00514b4945002d145140051451400b4514520168a4a2802e5145150585145140051451400514514005145140052d2528a0028a28a0028a28a005a28a2800a28a2800a28a2800a28a290c28a28a0028a28a0028a28a0028a28a60145145002d14514005145140828a28a0028a28a0028a28a0028a28a0028a28a0614514500145149400b45251400514514802928a33400525266933400b9a4cd266933400b9a6e6933466800cd14945200a28a2800aaf77791dac659cd43a86a296b19e79ae2f53d524bb94e18eda6908b9abeaad76c551be5ac62c79cf5a1588a110c92015a24059b284cd20c8aeaaca1114400154b4bb10b18622b55400315402d2af5a4a55eb40c916a4a8d6a4a6007a5432a93f77ad4d4d6151243444878c1eb4f150a8d921c9eb530ae392b3374ee82968a2a462d1451400514945020a4a5a0d00252114ea6e2801bd28cd3b14dc5001499e68c1a4a602e69a7be45069339a6021ed484e6969a68181f5a6e694f4a4a006e7349d7a504528ef400d3f5a070314a7a6293a50004714878a3da928010d25140a4027ad3714fa4c5021b4de4934e3c5267d28013148296814c04eb4846734e34d240a6213b629a485a63cc0702a12c58f34d087bc9934d1494e02980a2968028a420a5a5a5c500252d145200a4a5a434c0514b4da753027b6e5ab4516a8d82eecd6901815bc76218c638aa57b179b11abb20e2a03c822a8938cbd4314c6a6b0bd7b7906d3c55dd66d7ab0158a1b671408f40d3ee3ed16e1b356ab92d1754f288463c57530cab2a02a69924945145020a28a2800a28a2800a28a298051451400514514005145148028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002945251400b45145001451450014514530014514500145145200a28a280168a4a5a004a2969298052d2514805a29296800a5a4ef45002d14945002d028a2801696928a005a28a2800a28a2800a5a4a5a0028a28a405ca28a2a0b0a28a2800a28a2800a28a2800a28a2800a5a4a514005145140051452d001451450014514500145145001451452185145140051451400514514c414514500145145002d14945002d145140051451400514514005141a4a062d14945002d251450014514500145145001452519a0028a4cd266900b484d2134d2680173499a4cd26680173494945200a28a2800a2928240eb4005676a5aa476b19f9be6a8b57d592d632aadf357197978f75212ed91549012dfdfc9772124f15459a909a613568448096e95ada45a1958122b3ec6132482badd3adc4318e298cb30208d76d498a6f56a760d301681d6814e02818e5a7d3453a980eed48452f6a29302bccbbb07d29d1b061c53dd720d411fc8db6b9eac7a97064d4b4515ce681451450021a29692800a28a5a004a4a5a2980da4a752500251f852e28c520232a7b53483e952e28c53b8c829a6ac6d14df2c1a0441de8a91a2a6ec6140c65349f4a79534ca602514507a520129a69d498a6037b514b494802928269a585310b484534c8298d3014012535a455ef559e7350b396ef4c4587b8f4a81e52dde999340aa13169ca280b4f02800029d498a70148414b401c52d200a5a28a004a28a280034d34e3d6908a6020a774c5228a9224f31f14e2aec4cd0b4408a0d5bed50c698502a515d28919274a831cd4d2542c699253d421f3623c57277111490e7d6bb5600820d73babdb6d6240a0465444e7835af65ac496e42e78ac6e94ecd4dc0ef2cb528ae5461b9abd5e7f6972d01055b15d369fad2ba847ebeb4c9b1b54536391645054e69d4c41451450014514500145145300a28a290051452d002514b4500251451400514514005145140051452d00252d145001451450014514500145145001451450014514500145145001451450014514500145145300a28a2800a5a4a5a4014b4945001452d140094b451400b45252d0014b4945002d145140051451400b45252d202e51451505851451400514514005145140052d252d00145145001451450014b451400514514005145140051451400514514005145140c28a28a0414514500145145001451450014a2928a005a28a2800a28a2800a28a4a06145145200a28a2800a28a2980514945020a28a4a062d368cd266900b9a6934134d26800cd2519a4cd210b4945140c2928a2800a29924c9182598563def8860895954fcd4c0d89664854b39c0ae7f56d7846a56139ac3b9d66e2e32a5be5ace95cb75354900fb8b879dcb331350d0b4531053146f7005293c1ab7a65bf9b28e298cdad22c86c5622b7140000155ed631144055814c07818a339a3a8a00a602d3c5345385031475a78a6e29c28017b528a4a5a003155e54f9f755935132e454c95d0d088770a7544870d8a96b8e4acec6a9dc28a28a918941a5a4a0028a2969809451450025253a931400945145200a4a5a28012929d494c04a4c52d148063015195a94d30d0044569a4548698698c61e29a4d3c8a69140c6134c34fc534d00309351b1a7b530d022324d30d48d4c34c08985371521a66334c4253945285a7015448629c052629c2900528a2945002f6a290d28a401452d0280128a5341a04368345140074ab9650f3baab431ef907a56b41104515b535d496c914529a5a6b74ad8444f509a95ea134c91ad54b50884b11e2ae9a84aee041a4c0e4658fcb90834cad1d56dca485b15999a901431a9e394ae306a02314abed408e8749d55a260921e2ba78655990321c8af3c0ccbdeb5f49d59a070b21f929a134761454504eb3a0653d6a5a6489452d250014514500145145002d145140051451400514514009452d140094514b40094b451400514514005145140051451400514514005145140051451400514514005145140051451400514514c028a296801296928a005a28a290051451400b45252d0002968a28016928a280168a28a0028a28a402d1451401728a28a82c28a28a0028a28a0028a296800a28a2800a28a2800a28a280168a4a5a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a2968012968a28185145140052514500145145200a28a2980525145020a28a2800a4a28a43128cd2521340066909a42692800a4a28a40145251400b494d92548d4b311c5645febd0471308dbe7a606acb711c4097602b1350f10243909835cede6b13dcb105b8aa0cccfd4d3b017ef3579ae092188159ed2339cb1cd23536a9210b9a4a28a602d19a4a5ed4011fde6ae8f43b5c207ae7e25dd281ef5d869716cb5140cbb4f14d5a78aab00e56c0a5a68a78a6028a70a4a70a43169c29052d002d2d20a5a0029a453a8a0655994f51522105695d720d4311f2d886ef5cf563d4b8b27a28a5ae72c4a29683400da5a28a6014514940077a28a28010d141a3b52012968a28010d14514009494ea4a0069a61a90d348a064645308a94d30d0323c535a9e698d4c08cd34d39a984d0034d4669ec698c68111b5474f34da6030d0a29d8e69718a621314b450298829d451408052d1450014ea414ea402514b494005068a2810947538a5a92de3123fd2aa2aec196ece0d8326ae83c629a83000a7e2ba12b101da98cd4e351b55098c6a8996a53519aa111914c26a46a898d260676ab17991135cdb0dae4575f731ef88d72f7b1f9729fad4010d2838a4ce68a421ead9a5dfb4d31686a606de8faa340e15cf06bad82649e30ca735e708c456d68fabb4120476f929a6268ec692a082f23b81946a9e99214514500145145002d1494a2800a28a29805145148028a28a0028a4a5a0028a28a0028a28a0028a4a5a0028a28a0028a28a601451450014514500145145200a28a28001451453001451450014b452520168a28a005a2928a005a29296800a29692800a5a28a002969296800a28a2800a28a290051451401768a28a82c28a28a0028a28a002968a2800a28a2800a28a2800a28a2800a5a4a280168a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002969296800a28a28185252d2500145145200a28a2980514525020a28a4a061451494006693345349a402934dcd149400525145200a4a3a550bcd520b7c82c370a605e6754196602b26ff5b8adf214e6b0750d7649c95078ac6924673cb134d2034af35b9a7660ac429acc91cb3649cd3293193556109de973435273400a4d25145200a434b4629800a5cd2534e7340166c937dc2fd6bb3b640b0015c968e85a71f5aec53fd58a6305a78a6ad3aa8070a70a6d385301c29e29829e290c514ea68a75002d14528a602514b45201845569d7e70de956c8a63a0606a64ae8a1a8db853aa28c853b6a515c4d599a20a28a3b500068a28a004a4a75140c4a4a5a2801292968a004a2968a402514b494c04a29692801a690d3a90d0030d30d3cd31a82866298d52531a80216a8cd48dde9868191b530d48d4ca04464526da931462a892354a56e38a7d30f5a006e28a5a28105140a785a00685a762968140098a5a2968109452d25001494519c9c5021002c702b52d200a80e39aad6b6e776e22b4d0002b7846c43626296971456a035aa36a91aa33d6810c3519a90d30d5011b544e39a99a994806119522b9dd5a1c3938ae898565ea916e4240a96239d1d69d484618d2d480538734c14b9a04295a4048346e340340176d75196dc8c31c574ba6eb49380ae6b8ea912564fba6a909a3d195d5c654e696b90d3b5b788046e95d25a6a10dc28c30dd4c4d1728145140828a2834c028a334500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001452d140094b45148028a28a0028a5a2800c51452d00252d14b4009451450014b451400514514005145148028a296802e5145150585145140051451400b4514500145145001451450014514500145145002d145140051451400514514005145140051451400514514005145140051451400514b4500145145030a4a5a4a0028a28a0028a2928105145252185145250019a4a29a6800a4a292800a2929aeea832c78a00754171751c084b30acfd475a8add0ec604d7297faa4b74c7e620516035b54f1012c440d8ac0b8ba92762ced926a066269809aa48438b1a6e69dc1a4db4c04cd19a5db46da004cd19a3145002669334a45262900034e06900a5c53002683d2976d2503353425fded7563a0ae67415f9eba7f4aa001451de8a603d7a5385345385318f14ea653c50028a5a414ea005a5a4c52e280168a5c5140c4a6b0a7518c8a405595421dd52236e5069655dc2a18988620d73558f52a2c9a8a5a4ac0b0a28a2980514514005252d1400d228a7526281894518a2800a2928340052504d266800a4345250021a6353e9a68288cd31a9e69868191b531aa434c6a0446c298454b4d228023c7349834f229a699234d34d38d34d301b452d140855a78a6ad3c5002629714bc51400d228a5a281094514868003535ac25db38a6430b4cfed5ab0c2100ad211ea4498e8d30053c0e69d46dadc90a69a7d30d301a69869c69a6980c34c34f34c34011b534d48698686046dd2a9dd2e626abc6ab5c2feecd481ca4cbb6534ca9ef46d98d4148420a28a05210b451450014b9a4a314c0703562deee4818146355696803a3b1d7995879cd915bf6ba8457232a40af3f0c455882ede220ab9a77158f43183d0d18ae52cbc40e985615b96fabc12202ce01a77158bd8a2a38ee2297ee30352d02128a28a6014514500145145001451450014514b400945145001451450014514500145145200a28a5a004a28a2800a28a2800a5a4a2980b45145200a28a2800a5a28a0028a28a005a28a2800a5a4a280168a4a280168a28a0028a28a0028a28a4014a2928a00bb4514541614514500145145002d145140051451400514514005145140051451400b45145001451450014514500145145001451450014514500145145002d1451400514514009452d25030a28a2800a28a4a04145149486068a292800a43452500069a4d04d4135dc5103b9c668026cd4534e912166618ac3bef10a26552b02ef569a763f39db4ec074d75e20b78c1556f9ab06f75d9e5c846f96b15dcb3649a6e4d3b08964959ce589cd46727ad368cd3014fb527d68cd14009f4a5cd1c525002e68cd251400668cd1494804268cd2d250028a766994e14c05cd252d277a066e6823e6ae96b9bd07ef574d8e2a80652d21eb4b540385385329e2818ea78a60a70a0078a514d14e1400e14bde9b4ea005a5a4a5a004c514ea08a4321239a866520822ad15a63ae4114a51ba04448c1853aa107cb6db8a941ae2947959aad4752519a2a4028a0d14c0281d68a2900514514001a6914ea298c6e2908a7d2500308a6e29e6928019494e229b4862534f5a7534d318c6a61a91a986801869a69c69a680184521a79a69a00630a6e29e69a68111b0a6e29e693b5310dc51b69d450002968a280014b4945020a4a29290013814fb789a76c8fbb491c46570056b5bc2b1a00a2b5842fab264c48a211a80054e3814a169db6ba1233117ad293814b814d34c04cd35a9d4d6a6030d34d38d30d0034d467ad486986801b4c34fa69a0065472ae54d4b50cb9c1a40731aa0c4f55074abfaa0fded50152c403a5145148028a28a04145252d301334b9a28c50014b9a4a38a007827b53c4ac3b9a8b34a2981a16da8cb6ff0071aafc1e209b70de78ac1a506811db5b6b5048a016f9ab46395255ca915e7692329e0d5db6d527848f9ce298ac7734560d978815f0ae2b621bc8a5030c28113d14514009452d14c04a2968a004a28a2800a28a5a004a5a28a40145145001494b4500252d14500145145001494b45001451450028a28a2800a28a2800a28a280168a4a280168a28a002968a2800a28a2800a28a2800a28a2900514b45005ca28a2a0b0a28a2800a28a280168a28a0028a28a0028a28a0028a28a002968a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a280168a28a0028a28a004a28a2800a4a283400514945030a4a298f32275614807d2550b8d5a1833922b22f3c4d1f2b1f5a60748ee14649aa33eaf6d164338cd71f73aedcc990afc566cb72f2b65ce68b01d1def895c3111722b12eb519ae5cb331154cb6693762a8439a439e4d3776ea616cd038a007628a292800345145001494b452012941a4c518a005c8a4a28a0028a292800a2928a005a70a68a703400b494b494c66de827e7ae9ff0084572ba11fde5757fc02a808f14e14b4550094e069869cb40c78a78a8e9eb400f14e1d29a29c3a5002d385369c2801c2969052d0014514521894d615262908a6057740d5129c36dab445569e33f792b0a91b8d3b0fa5a8a37ddc54b5cdb1a051451480293bd2d25030a28a29805141a89a60a719a009a929158352d021290d2d140c69a61a79a61a4034d34d3cd34d32865348a7d34d00331484538d34d0030d466a56a6e28022a69a918530d02186929c69b400628a5c51400514a052d021b8e293b53e931400dc53954b1dabd69ac492117a9ad2b3b511a867fbd5a4237224ec16d6fb0038e6aeaa605000a78ae94880c514b486a842521a5a0d00369869d4d3400c34c34f6a61a0069a61a71a69a006d21a7521a0061a864e86a6350c9d0d260739ab7fadacfad0d58fef6b3ea44252f7a3141a401451450212968a4a005a292969805252d18a002973451400668cd1450317349ba940a5c0a621c8d8e86acc17b244c0863c553c8146e3401d25af8864c80fd2b6a0d5209547cfcd704ac454b1dc321f94d3158f45570e32a696b8db3d6a58880edc56fd96b115c00bde8158d3a291595c654e6971408292968a60251452d00252d145200a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a5a28a0028a28a0028a5a2800a28a2800a28a280168a4a280168a28cd001452d25001451450014514b480b945145416145140a002969296800a2814500145145001451450014514b40051451400514514005145140c28a28a04145145001451450014514500145145002d14945002d2514500145149400514d77551924566deeb305b0396e6803489c0cd569750b78b3b9c035cade78925762213c562dcdecb33166634ec074ba87898c72948c647ad61de6b135c1e188acddc5b926909a760257ba91bab9a88bd34d25002e68cd25250038d368cd25002d2e334da70a40078a4a7514009494ea422801334668c52e280133466971498a005a3149499a005c51499a2800c5262968a00414e1453a801294f4a2834c66a688db6515d72fcc82b8cd25b130fad7650f310aa401452d1540348a5145140c5079a916a314f1400f14ecd305385003c53c53053c50028a5a414b40052d145031692968a004db4c2b52534d48151e1dadb8528353bae6ab48a539ac2a43aa29487d14d47dd4eae7340a2928a005a28a298086b3eee3933b97a568d2150dda902295a4add0d5da8d62556c8152500141a2834c0434c229c692900cc52629e69a6818c34d34e34d34c630d34d38d34d0034d277a534869888da9869e6986900d34da5a280168a28a00052d2814b8a04329a58b1dabc9a7364b6d5ea6af5959ec6dee39ab846e4b761d6766106e7ea6ae8418a7718e2954715d2a3632102d3a8a5ab185252d250021a434a690d021869a69e69868018d4c34f6a8cd0035a994ad4da005a4a5a298119e2a097ee9353bf5aad31f90d481ce6a8d99aaa01c54fa81cce6a0cf152c4252528e948690828a4a280168a28a0028a29680128cd1450019a334514c0334668a5a0625381a4a2810668a28a005cd19a4145301c1aa58e7743f29c54029dbb8a00d9b3d6e4b65e7e6addd3f5b8ee1479a42d713b8d3d5d97a134058f458e78e5fb8d9a7d70769aa4f6e7e56adbb2f10038f38d1726c743455682fe1b8c6c356460f434c41451450014514b4009451450014514500145145002d2514b40094b4945002d1494b40052d252d00145145001451450014b494b400514514009452d1400514514005145140052d252d005ca28a2b32c28a28a005a28a2800a28a2800a28a2800a28a2800a5a28a0028a28a0028a28a0028a28a06145145020a28a2800a28a5140051451400945145001451450014531e55419622b2b50d761b75211be6a00d49678e2fbec0563dff008862b6cec21ab98d4b5c9aec919c0ac869189e4934ec06f5ff008864b8cec256b166b892524bb66a2dc4d0318a601ba90b521a4a005cd19a4a2801690d28a4634009451450014a29b4b48076281499a28014d266968c500266941a36d211400b40a4a2801d49494993400b8a31499a5a004a2968a006d14ea2801052d18a5a0005069c29a54e698cb9a5b6261f5aed6d7988570fa79db38fad76d62c0c22a809b14629692a806d14b4940c053853696801c0d482a21520a009053853053c5003852d2034b9a002968a5a061452d068010d34834e34e18c52022c535d33529a6b54b4229b4654f14aac0f06ac30150b41f36e158ce9df62a32b0945349dbd69d5835634419a5cd2525218ea4a28a002929690d002d149450021a6d38d34d002534d38d30d03129a69c69a698c61a434b4d340086a3634f63519a0069eb4c34f269868109494b4b40098a5028c53b8a0414d24b10aa339a7282e70a2b46ced153e66eb5a42172652b0db3b211aee7e4d5e5414014ec62ba12b19885714a2947bd1b6a804a5a3145300a69a7534d0021a434a690d0034d30d38d34d0218d51b53d8d318d0046d4da73536980a294d20a0d202292aadc1fdd37d2accb54af58242d9f4a4073576dba5351a8e2894e6527de9c318a962129b4a69b4842d252d250014b494b40052d251400514514005145140052d2514c05a29296800a28a4a005a29296800a28a4a005069dda998a783c50028a50d4ddd494016e2bb961c6c635a967afbc43e7f9ab0771a5dd4058ee6cf588ae00dc42d5f8e6493ee3035e751caca7824568da6ad2db7439a77158ee31495cf5af887730f34e056c417f0ce06c614c562cd149d68a04145145001451450014b40a2800a4a5a280128a5a2800a28a280168a28a0028a28a005a28a2800a28a2800a28a2800a28a2800a28a2800a5a28a00b945145665851451400b40a28a0028a28a0028a28a002969296800a28a2800a28a2800a28a2818514514005145140051452d0212945145001452138aad3ea16f0677b81401669aeea9f7980ae6ef7c4e227222c30ac6d43c4335d0c0f969d80ecee75282042dbc1ac3bcf1547cac639ae49aea57fbd231a8dde9d80d4bbd7ae65276b9db59b2dc3ca72e6a1e68a602e69334945002d149452016928a2900b45251400a4d329c69bde801c290d2d21a004a78148b4fa006eda29d462801b499a534d3400edd466994e1400b494514005252d14c04a5a5a2801b452e28c5002514628c5002e68c9a4a514805534ecf34da075a6327b43fbe1f5aed74ee6015c3db9db28fad76ba4bee8055202f521a762908a6319494ec5211400514514c051d69e29829e2801e2a41518a783400ea51494a280169d4da7503168a28a00292968a42129314b45031bb693a53f1498cd2111322bf6e6aab131361aae15c54534424522b39c131a762307238a2abab340fb1beefad59041e4572b8d8d53b8514b45218941a5a43400d3494b4da005a434b486801a69a694d21a0621a61a71a69a631b4d6a5269a6801ad519a90d348a008e9314fc5262810dc52e28a33b6800a1519d80029d044f3498dbf2fad6bc36ea8a38ad610bee44a4436b68100c8e6ae2a62940a70ae848cc4c514b8a5c5301314b4629714c069a4a71a6d002521a5a4340869a434a690d0030d31a9e6a36a008d8d309a731a8d8d0021a4a4a753001484d3a987ad20237e6b2f577db162b54f5ac2d724ed480c43cb1a514d14f1502108a434f3d298680128a28a041451450014b494b40052d252d001494b49400b452514c05a29296800a434b494000a5a414b40094a28a0500140a28a005a29296800a5a4a2801734669b4b4ee03c1ab105e4b091b1aaa834e145c0e86cbc405302539addb5d4a1b85077015c016c54915cc8846d7228b8ac7a3021b90734b8ae4acf5f92150a79ad9b3d6a1997f78c01a77158d4a2a28ee6293ee38352d020a28a2800a28a2800a28a2800a5a4a280168a4a5a0028a28a005a2928a005a28a2800a28a2800a28a2800a294525002d1451401728a28159962d1451400514514005145140051451400b4514500145145001451450014514500145145030a296928105155ee2f61814ee700d605f78a0233220fc6803a396748c64b0acabcf10dbc04ae79ae42ef569e672448c05517999ce5ce4d3b01d15ef89646cf94d58773a8cd70d97635519a9334c056724f5a39a6d19a77014d379a5cd25002e68a4a29005148681d680168a5a4a002928a4a403a8a6d29e94001a05253d6801a68a57a45a0072d2d146da0028dd8a4229314006734b49d28cd002eda08c5264d19a0028a28a0028a2931400b9a334628c5300cd1ba931450019a33462928017752eea6d28a40381cd394532946698c747c4a2bb1d15b308ae3738615d4e80f940335480dfa43452d318ca69a79a69a004a29692980a29c2994e06802414f151a9a901a007d28a68a70a062d3a9a29680168a28a005a2929680128a28a400d4d069c69314080d31b9a752f14302acb0071c8a802bc79f4157db14c640c0d6528a634da2ba481c53eabc90323ef53c7a53d661fc5c573ca0e268a5725a4346683505094d229d486801292968a60308a69a79a61a431a69869e69a698c61a4c529a434806d2714b4d34084c50452d319bd3934d20118e3eb562dacd9f97e95359d9f0247efdaafaa818c0ade14fab339486c50ac6a028a980a296b5440869ea38a6d2d5005028a298050692968010d34d38d34d021290d2d21a0069a69a71a69a0061a8daa4351b50044d51b53da98dd6801b4a3ad029c29801a6b53e9af498113f426b99d59f7484574f310b11ae3efd8b4edcf7a9605614fa60a7548809a6d2d2502128a0d1400514514000a5a4a2801696928a005a4a5a4a0028a28a6014b4945001451450014b48681400b45145200a28141a6014b4da7503128a5a4a04140a5a2900b4034945002e452714514c07834a1d97a134ca29816e0d4a7848dad5ab6dafc831e63573f46680b1d9c1afc0c006357e1d4219ba1af3f0e454f1dd4a9f75c8a2e2b1e84acadd0d2d72163adbc38de4b56e596b115c7de21698ac69d14c49924fb8c0d3e810514b4940051451400b45145001451450014a2928a005a28a2800a28a2800a28a280168a4a2802ed2d25159962d14514005145140051451400514b45001451450014514500145145001452d31a454fbcc05003a82c00e4d65dfeb905983c86ae7b50f1334c0f924ad1603a8b9d52dedb3bdab06ff00c4f8c880d733717d24f9ded9aab4ec05ebcd4e5ba625d8d53663eb51b30cd04f14c07673484d203487ad00277a5a28a0028a28a0028a28a0028a28a004340eb41a05003a928a434009451452014507a503a506801053fa53075a71e9400d634ab498a7a8a003346ea5c525003852e054746e3400ac39a4a5cd19a004a4a7668a006d14b8a314000a5e293149400fa2994b9a0053494668cd0014628cd19a004c5285a334a0d30140a5c52034a0d218d6ea2ba1f0f49d0573ecb5b1a13ed9455203af14535395069c6a8621a69a75250025253a9b4c0434a28a2801e2a45a8c548b40c7ad3c5305385003852d20e94b40052d251400b451452105145140c28a28a0421a434a69a681898346da334d27de900ae8315526b70fc8ed56b76690902a5a02906923fbe3e51522ca1c6454cc15c61aa196dc6d02238ac654bb14a43a929c2168e2c939a8d5c1ce462b17168b4d31c69b452503109a69a71a6d218879a6914fa69a06308a6d38d2500369a714ae7009a7c36ed32eee82aa317225b48800695f082af5b598560edd6a682dd23e839ab2062ba63048c9cae2014e028a055d843a8a29698094b4514c028a283400945141a004269b4a692810521a534d34c069a69a534d34806b546f4f6a8da80226a61a7375a6d00029e29a29c29801a69a7518a4055bd7db09ae46e8e663f5ae9b567db09ae5a639726a580dc52d203466a4414868268a0434d141a2800a28a2800a28a280168a28a005a28a2800a28a280128a28a0028ef452d0021a28a2801734520eb4a68014521a5a0d301b4ea4a05002d252d250014b4828a402d1451400514514c02969296800a28a29805273451400e0d522cac9d09a8c6314de73401ab67abc96f800d6dd9ebc8d8f34d72048a729340ac7a0c57f0cbf75aac0656e86bcf63bc963c6c6c55fb5d6278c82ee48a2e2b1dad15cf5bf88e3242b0ad7b7bd8a74cee02988b545355d5beeb034ea0028a4a280168a28a0028a28a005cd14945002d1494b40052d251401768a28accb0a05140a005a28a2800a283450014b494b40051452120753400b45377a0fe2150cf7b142a58b0a00b151cb711c232ed8ae7efbc4f0a8658cf35cdde6b9713b11bb8a7603b0bfd7a1814f96e09ae6351f104d72481c5633caf21c9351eea76026967790fccc4d4469b9a33400519a4a28003cd262968a0005277a5a2800a4a28a430a28a281052d252d3013340a281d2800345145201dda9a69dda9a6801290d3a9a6980e1d2969074a5a402628268a46a005a78a8d69e2801d49450280131452d21a0069a2968c500252e68c5140051451400514514005262968a004a2968a004c514b45301b4b4b4a280129475a31405e690c52d5a3a2b1f3c566b2d68692e16615480eda2ff005429734cb67dd10a7f7aa18b8a4a70a6d03131494e34d34c4251451400e5a916a215229a00929c29a296801f9a334829680179a506928c5201df4a4e68ce29ad2051c9a0076696aa3de469dea95ceb31a670680358b8151b5c2af535cec9ac96e86a9cda94ac7ad203a892fe25fe2155df548c74615ccf9f23f534bf31a2e06f3eaea3bd56935d0bdc565f945aa196d49a066a1f100f514cfede66e958735ab28e01a644854fcd401bdfdb6f4e5d6dab3e08165ab6ba56e1c5211a706b3bb00d5a5962b8e4b62b2174d78c8ab705bb2e293498171d5c10221b850ede5e03f06a5858a014f9123958338e6b29525d0a53657ce7a5148f049e61f2feed3d617c7cd593833453430d30d4cd03d44f0498e297231f3223660a32690abbe0a2e454915b927f7bd2ad8d91aed41c5691a5dc873ec5648a3846e63cd39af6351c102abde9241c561dc19771da6b7492336ee6eb6ad1a9c16153c5aa42e3ef8ae48c133f26a3712c5de981dca5e42ffc42a61321e8d5e78ba8cb11fbd5661d7645232d4c0ef15b34fed5cc5a6bea40dc6b52df57864c0dd40cd3c8a07350aca920e0d481b02810ea4eb499dd4bf7698c43914039149b8b521e0e2810a69b9a5a4340099a434b487a50034d35ba538d35a802226a36a90d46f401111494e34def400a29c0520a72d300c50052d29a40636b4d888d732fc9addd724e4ad60f5350c036d14e34def484262929dda9a6810514945002d18a6d2d002e28c52668a005a28a280169294525001451450014514b40094b451400521a5a1a801052d252d00028a28a002901a53482801d8a4c538521eb4009452d21e940066969052d300a28a2800a5a4a28016928a2800a28a2818b4525140829734945002f534ecf14ca5a0438311534573221e18d5714b9f4a606bdaeb32c07ae6b5ed35f591809302b92c9a03e3bd023d1a1b98e600a366a5ae0ed7529a0c6d6e2b72cfc409c2ca79a02c741455782ee29d72ac2a7041e869885a2928a042d14945002d145140c2969b4b4017a8a28accb0a28a280168a28240a0028a826bc8a01976159775e23b64c846e680368b05eb50bde429f79c571f7be2599c9119e2b2a7d4e69bef31a7603b2bef10c76e7e421ab1eebc54d20c2ae2b9b3296ea4d4658e69d80d99b5e9a45203115425bf9dc73231aaa58e29b9a007962c72698d8a33487ad002ad21eb4a0d21a2e30a4a28a420a28a2800a28a280168a4cd2d001494668a06145145020a5a4a5a004a074a296980945145201d4d34b4869809487ad38d32801e3a5140a290051451d68015453f1518a786a005c5276a33450025252e28a004a28a4a005a2928a005a2928a005a4a28a0028a28a000d14b45002514514c61452d140801a7ab53314ab480754d64db661507229606c4a0fbd5219ddd836605ab64567e92dbedd715a2dc550c074a434a28340c69a434ea69a621292968c5002548b51d39585004cb4ea62d3a801d9a3ad264535e4541926900fe734924a91ae59ab2efb598e05386e6b9bbed76497210f1408ea2e7588a2070c335877be212490a6b9d7b8790e598d4646e3d693036e3bf92e14f26abcbbd8f5a82d64f2908a90dc277a570248c63ad4c306a83dc7f76982ea41d28035d36fad58568c7522b07ed121a699e4ee6803a213443b8a779f01fe215cdf9ae7bd26f6f53401d1bbdb91d4550b8688fdd22b332d8fbc69371f5a2e0684372226eb5ab6dab22819ae669e0e3bd00760bac42c39c528d561e9915c6ee3ea697791d09a607770ddc6e321853a4bb45ae26df509623d6b4e2be59d7e66f9a9303796f973d6ac2dc295eb5cdb6e1c8348978ebc66a40df7bf488fcc78a88eab131fbc2b1a5713ae09acd9e278c92a4d303ab17b137f18a996e6161f7c570c2e1d7b9a70bd907463401d7bba4a480d491d9231c935cac7a8ca9d0d585d72e178a6074573045127515cfea2c39db50c9aa4b2fde355da7dfd6802a499cd336e6a77e4d376d00355997a1a912ea588e431a662908a57035ad35d923237135d059ebd1c800622b87229caec87209a633d322b94900c354f9e3ad79ed9eb32c24063c574761ae24a02b353037835349c9a8639d5c641a941a603c523528a6bf4a004cd21a683416a0043487a50690d0030d46f4f26a36a008cd02834a280169e29a29c2980b8a6ca76c64d48054374c1616a4072dabbee94d658eb57b516dd29aa2054301d4def4ea4c52244a69a752500371453a92801b453a8a004a2968a00414b451400a2929692800a28a4cd002d2d3734ea0028a28a004a0518a00a0029474a4c50280168a28a004340a0d03ad003874a43d694521eb400b487a52d1400829692969805145140051451400514668a0028a28a0028a28a0028a28a0028a292818a28ceda4cd0dcd003b39a4ef4ab8029a739a044829371078a4a334c0b30decd1e30e715b765e2128aa8f5cd939a51c500d1dfdb6a30cca0ee19ab6aeae3e535e7715cbc678635a76bae4d1e149e29dc9b1d95158b6baf44d8123735a70ddc730cab502b13d14020f7a280168ed4945005fa2a568e341939fceaacb7d6717df7fd6b3b164b41600726b32e35db240764993f5ac3d43c4acd948871f5a2c07457baa436ab92c0d73ba8f898c80ac3c573f757525c36e66355f79c62aac05b9752b8973be424554662c7269323d690d0c028a4cd26680168a4cd25002d25145001452514805a4a28a0028a28a0028a28a003bd068a280129d4da750036969296800a28a2800a2969280168340a0d00145145001477a2928014d3075a71a68eb400ea28a42680034ab494e5a005c518a5cd19a004a3341349400b9a09a4a2800a29296800a28a280128a5a280128a5a4a00334668a2800a28a2800cd19a28a005a28a28014503ad1450038f4a231822901cd2f4a633aed064fdd8ada6ae6f4097a0ae8f39c552180a0d03ad154021a4a5a4a0043450690d002139a5414da72b6290132f4a466dbdea33262a85e5e04079a00b3757c9121e6b9fbfd65c9215aab5e5d34a4f359ecb93cd001713bce7935018f153edc535852115c29cd4a91f34e002d588d15c548858e10c291ecb3532215e956109ee290192f6cc9daa3c638c5744b124a306aadd69a3964a00c8c11de8c66a4961743c8a6023a5030a4c52edcd140828a28a60145145001486968a006e2955990e54d2e28c521972defcf01eaf22accb95ac5d82ac5b5d34271401a2ca57b5340ddf7ea78278e718279a718b27028033ae2cb78dc959f244d19c115d1602f1504f682452714018429d524b6ed1b1c8a66d14c08c934a0d3b6e68d98a042669297146da062521a7118a4a902334dcd3da91509aa431a79a9e091a220a9a66cc1a916a901b7a76a8cb80cd5d15a5fa4aa39ae1914f6abf6b72f111cd303b847047148ed58f61a86e00135a8aeae339a042914da7645250312909a0d349a0061a69a534d3400da51494e1400a29c290548050002a96a4f888d5f3c564eacfb50d0c0e62f1b321aae29f3b6e7351d4310b9a4e68a4a420a4a5a4a00292968a004a2968a004a2968a00052d252d001494b45002628c52d140098a5a292801475a5a41450014514500149de9692801451499a5a0029b4ea69a0070a29169d4000a28a2980514514005252d25201d48694521a004a70a6d3a8010d028340eb4001a283d681400b486969a69800a0d28a08a006d3a929680129d4d14ea0069a5a28a0028a28a0029734945003d5b1cd5a8b509a2c6c738aa54a3ad0074961e21da00939adcb5d4229d33b80ae07a7352a5d3a74734c563d096556fbac0d3eb89b5d61e0c7de3f8d6ed86b90ca3f7c597f1a2e2b11eb7e236790a40dc560c97b34d92ed551896392693348a124625ba9a3236fbd318d266801fbe9872452514803eb466928a005a28a29805145140051451400945145200a28a2800a28a2800a28a2800a28a280129dda928340094b452d002514528a00290d29a28010529a414a6800a28a5a004a4a0d028003d29a3ad2bd22d0038d30d38d36801569f4ab8a52375003696936e28a005a28cd25002d18a4a5a004a2968a004a28a2800a2928a005a2928a005c518a4a2980b4945148028c5145002d1451400b41a29c08a006af5a534bc5253036f407c3f5aeb139515c4690c5661cd76b6e7310aa450eef40a53482980521a5a43400d34dcd38d368016a291f6d39db02a94efd79a002e6ec221e6b0aeee9a463cd5ab96273cd5075e7a520183914d2b8a7138a616cd0007149b41a50b9a9523a622b3c66a2f31a335a6b167b551bc87cb6cd4b112dadd64fcd5a2bb5c706b032474ab16d74c98c9a406c80c86a549fb355782e9250031c54acbdd46452009e049c702b36e74f287205682c856a547dfc30a00e79f29c1a686cd6d5e69eb202c879ac79a0785b95a004cd14da5ce68016929d8e29b400514b4500251cd2d250028cd2114514012452b4782a6b5acef55d406eb58b9a72b143b81a00e8d937722914edfbd59d657fc85635a3c4a32a68023b8b659d72a2b22e2d9a1278adb4f938344912ccb8c5007383ad2b1cd5abcb468189038aa9de80128a534631400d7a6134e61c66a3340c3a9ab704595e9515a4464940c56e2daed887cb4d0ccaf23776a05b915a42dcfa52f91ed5480a2911a95623568458ed4a538aa111c45a220d69da5f7404d67e38a8f956c83480ea619038ce6a4ac4b1ba23009ad58e50c3ad03246351934e269a4e28010d21a5a28023a70a2945003969eb4d5a7e28006e9589ad3614d6e1e01ae6b5b7e4d006039cb9a677a7375a4159b1314e28e29292810bc5250283d6800a4a5a4a0028a4a280168a4a28016969052d001494b45003734b451400514b4500252d028a0028c52e692800c5068a0d0025028a2801dda987ad3a928005a776a6d3a980514829690051451400514514000e941a297b500369dda9b4b4001a075a2928014f5a0514530169a69c290d0028a4340a0d00252f6a414b400829d494500145145001451450014514500149cd2d1400b9f5a6d2d1400e538eb4e57c77a8e8a0094e4521346ec9a46a60309a4a0d02900b4525148028a28a005a28a280128a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a005a434b48680168a28a004a51494a2800345068a00414a690529a002969296801a68141a0500358d0291bad3bb5000690514aa39a0070a506971c5348c500381a5e0d32973400bb68c526f3466800a4a5a3140094b9a4a2800a2928cd002d14945002d251466980514668cd0014514b4804a28a2800a2968140094a297149400b9a33494f0b4c0b1a7bed987d6bb6b1937442b8480ed947d6bb1d29f74429a19a7452515430269b9a0d34d0019a63b62958e2a091e801b23d53998e6a76351b2668028c8a4d56963ad264150c9182280321d4e6a3ef57e6871daaa94e6801d12e6acc6950c4b8ab710cd021552ab6a36e5a2ce2b41129f343e644463b516039339191483ad4f75114948f7a802e0d4b112c6e54e735a56ba885c2b9e2b2852d481d2a08e61ba3343fca31deb06d6ea485bef1c56d5b5d47749e8d400f8d8a75a59608ee54e47cd4ad1914c0db4f1401917766f0b1e38aaabc1ae9b09326c71cd65df69e5092838a00ce3462948da70d499a0028a28a004a28a2800a28a4a005a4c134b485a80171b79157acef59080c6a88a51401be25598020d3d58ad62dbdc344e0678ad78e5595063ad004d2a2dc444375ae7eee236f2906b7412b8aab7f6e2e1770eb4018dbb7530bd2cb1b4448a8e818ec93c531a97349d4d3406be890ef7048ae81a31d2b2f448f6c40d6b75a690c8fc91e94c6847a559a4db5405231d3192af18ea1952988a4e00aace79ab52a9cd572b40c9223b46455db5ba20e09aa087b53b90722901d02481978a70e7ad66d9cfd01abe1b774a00929281450025005253d7a5003853c53053c1a006ca76a1ae53587cb9aea2e8e2235c76a4f994d2028d37bd3a9b52c4c2929c69b4840283d68a2800a4a5a4a004a28a2800a28a28014514514005145140051451400514518a002969314b8a004a5a052d0018a4a5cd1400d348294d1400b45028a60141e9450680014b4829d4804a29692800a28a2800a5ed494bda801a694521a514005252d250028a28a4a0070a0d02834c04145252d0020a5a29280168a28a4014514500145145300a28a2800a28a290051451400514514c07e68345251701869334e6a6d20168a28a0028a28a005a4a514940051451400528a4342d001452d25001452d21a002969052d002514502800a28340a0028a28a00052d2502800a5a28a0028a4a514005141a280171451450034d2138a53d69ad4009d6973494b400014f5e29829c2801fba9339a4ed45002e29314b4b400ca5e29c4669bb680173464d252d002514514006052628cd2d00252734fa28019cd2d3f6d376d0025253b6d2628012968c518a0028a3145002e68cd251400b9a29296800a7034940a603d38706bacd0e4dd1815c90ea2ba4d05fe514d0ce88d3771a01cd2550c09a63352b544ef8a00246e2ab924d399f3482818ddb4bb696968111b20a85a21564ae690c79a00cf962045556b7ad5787351341cd0067ac58ab30a54be4d4891e280151322a5db84a72253c8a6239ad5edf6c9b85651eb5d5ea76c1edd9b1d05728ff002b9159b01b9a50690d02a44480d3e295a260ca6a214ea606ed95f89942486ac49111ca722b9e46319dc2b5ac7510c0239a00b2a71532c8aebb5e9ac81b94a85b20d0055bfd3f3978eb2994c6706ba58a55dbb1fbd53bdd3c3e59050062e68a7bc4c8c41a4eb4009c5252eda6d002d1494b40051452d00262945029714001381535adc344e2a11cd078a00de8a65993af34bb4a9e7a5625bdc346e39ada8a759e2f7a0657bab54986475ac8b8b768cf4ada2fb1b9a86ec2ba645006191562d6d9e6906054528dad5a9a3ce8ac37534336acad8c51018aba138a581d64518a976e2ad0116ca7ac74fdb4b4c0864502abb8cd5a719a89968028cc9806a8b8e6b5a58f70aa8d6fcd202ac51f3537975288f1daa444f6a008a3420d5d8642b51841474a00b81f8a556cd408fc54d19cd002d38514bda801c2973482968020bd7db09ae32fdf74c6badd4db6c06b8db83ba53f5a4c065201452d4884cd251452109494a692800a28a2800a4a5a4a0028a28a005a28a2800a28a2801692933466801d453734b400b9a33494a05001452e28c500252d18a28013149d29d4d340029cd2d3453bb5301334b4da75000296928a403a9b4ea6f7a005a29451400da753696800a0514a3ad30034da71a6d2014514a292800a28a298094a28a168014d369cd4d1d280168a5148690051452d002514529a004a28a280171494a68a0031494a692800a294525003e90d2d250034d37bd38d3680168a28a0028a0d1400a2929692800a2814b400869452528a000d20eb4a6802800a434b48680014b40a28012945252d0006929681400514525002d14628a0028a28ed4009de94521eb4b40052529a4a005a28a33400d348d4b48d400def4b494b400e5a7d356973400ea6114ecd1d6801b4b9a5c504500206a76ea66296801d45379a32680148a4a5cd1c500368a7518a006d2e6976d348a0076ea4cd369680177519a4a28017345251400b45251400b4526696800a28a280168a28a00515b9a23fcc2b0b35a9a33ed90550cebd0f14e26a289be4069c5aa8635daabbb5492362ab97c9a0619e69c29157352aa7340840a69ea952247532c74010ac74be5559d946ca00aa62a8de2ab9b298c940144c742a55964a66dc500302d382f34ec52814011cf18784ad71ba95bf95726bb8238ae7b5db5e0b814981ce9a4a5f51495048e14ea6034f140c70a767041534cc9a51c50234ecf50d9846ad0f9641bc573a3ae6addadf143b58f1401a4dd6a459f036b5311d255ca9a8e45c50036e6d96604ad64cd1344dd2b66362b4924093fd68030f39a43d6acdd5abc2c78e2abe31d6800c518a5a5a004a29692800a5a4a5a60229a7547de9c6801afed53dadcb46e0678a878a8cfad219b65c4abd6a27e84555b59b1c1353c8ddc50053ba878cd36c158cc00f5ab323074c53b4b8b33f4ef548674968a52215703640a853ee814fe455012834a4d4694feb400da3653d529fb4d0040ea2a3f2335704629766280291807a530c58abac94c68e802995a4d9c55878cd4641a008d78a9236c5376d20c8a00b239a937616abab549ba801c4d390f148b8c53874a06656b52e2222b9273990d743aec98cad73a7ef54b245a28a426900514829690843494a692800a28a2800a4a5c518a004a2971462800a28a2800ed494b45002514b45000052e28a33400a2969b499a007514dcd28a005a4a28a005a434b499a006d3a9a69c2980868141a4a0075029296900ea4ef4a293bd0028a0d141a004a28a2800a075a3b502980a69b4eeb486900a292814b8a0028a4a5a60250bd696907068015a9a29c464536801474a0d28a434800529a414a7a5002529e9494b400da75262968003d29294f4a4a005a6d3a9b400e14940a31400ea28a28010d30d3cd34d00028a4a76280034828a5a00290d2d25002d21a5a434000a753452d0021a72d34d28a000d20a5348298c5145028a041451452010d28a434a2800a4a5a4a007534d3a9a68005a753569d400da5a4a5a600d48295a905002d250692900b4d6a5a63350003ad385316a555a005c514b4500251d2969314006ea339a4c518a007525252d300a28a280128a7629314806e6943518a28017752e6994b400ea0629b45003b8a4e2928a005a2928cd002d149450014bda9314668016928a2801d45266968012aee9afb65154aa7b36c4a2a8676d68e1a214e95c2d67da4e4442a6dc6434d0c73b6ea6aa64d489166a78e2a603628ba54e22e6a68e302a4db4011aa62a40b4b4b40098a314ea280198a632d4b48466802b38a85aadba540e94010934e53c0a6bad203814013552d4e0f321353ef39a253be32280387b88f64ac2a1c62b435684a4a4e2b3c722a5922639a7039a4342d480fa05252d0038521028e94940135bdcbc6c39e2b62095274e7ad611e6a48a66848c5006abc6ca4fa52c79078345add2dcaed73cd48d1321cff000d0023b24836b0e6a85d59ec39156dc7395a70f9f0ad4018c54838a315a5776602ee4acd2a54e1a80128a5a4a000d21e94b487a5301b4b9a4a693400b4868a0d03056da6ae42fbc550352c1215614016dc62b4b48806ecd6613bb06b7f4b8f11834d0cd02b8a514efad18aa014548a29805482801e29c29a29c2801c052d029680184534ad498a5c5005764a8192af15a89a3a00a456a320d5c31546d150057071522b523c78a4db81401329e29c1f150ab52c8db6326901cfebcd97358a2b47569b7ca45670a9101a6d0d45210b4514940087ad14b487a50014a0520a774a00434941349400b45251400b45251400b45251400ea4a28a00296929680014bb68a5cd00376d2d1ba8a0038a4cd1450014628a5a006914a2948a6d00145145002d14514c072d140a4ef4005145148029690d028014f4a4a534d3400e148d4a291a8005a71a68a5340094a292945300349de94d25003bb5369dda9b48055a0d02834009de9c69b4b400da51d68a5140035148dd68a0053d29294f4a4a00290d2d18a00414b9a6d380a00752d1450034d34d3e9187140118eb521e94ca79e9400d14b4528a004a4a7521a005a69a79e94ca00052d2ad23500369c29297b50006928a5a00051de83494c05a28a434800d28a4a5ed400525145003a9a696928015694d0290d3012969075a776a004348283d6814001a4a53487a52010d4669f494002d4cbd2a1a786a007b75a6d2e7345002514b41a002969b4b400b8a28a2800a4a5a4c530137519a31452017346334945001b68a5a280128a76693340094519a514009462834a280128a534da007534d3a9a680145140a5a004a70a4a280148a7da9c482999a74670e29a19d1da7318ad3b78eb334e6dd10ad6b73d2a865a8e2153040288fa53e9800a5a6f7a5a005a28a280168a4a5a0028a28a0008a89d6a534c340159d2a2dbcd5c61c540c28022d94a17b538d20eb408c5d6ad015240ae65976b115dd5ea6f88f1dab8dbf8bcb98d4b0200b9a677a7a9e29add6a4029d4d14b408534628ed40a0051c53b00d368a007a398db2a6b52d6f44a0239ac71c1a78caf20d006f3c43195a8f1b6aa59de1ced7357caac9f3034002386e1aaade5a8604a0a958114b1b907079a00c6752876914dad9b9b5595323ad64cd1b46d8c503194940e283400d34c352114da0434521a75368188681c514d342605fb4fdeb05aeaec102443e95cb691cdc0aec2d97e4154863f6e4528e29d9e29b5403853c54629eb4012014f02982a45e9400e0292968a004a75251400b498a5a2801bb334c68ea6145005278fdaa26435a1806a29547a50067b2e2a1ba93109ab72e2b37517db11a181cddeb6e98d414f98e6426a335048534f5a5a5a4014d34b450014868a28005eb4f3d29b45002518a514a6801b45069280168a4a280168349450014b494a2800a5a28a0028a5a28012968a5a004db462973450025252d250014c34fe94d34000a5a6d2d003a8a074a2980e14942529a40251494a2800345069450014d34fed4da0005068a280014a69b4ea004a5149453014d2529e94da403fb534d28e949400a28340a0d00252d2528a004a5a0d250029a414f3d2983ad0029e9494a290f5a0028a28ed400da70a169d40052d252d001487a52d14011639a7506928014528a414ab4005252f7a28014f4a6d38f4a650038523528a434000a2814b400868141a0500069294d25002d21a5a43400529e9494a7a500251451400b49de9693bd301d48694521a00414ea6d3a801a7ad028a0500148694d21a40368a296801b453b1498a000352e692928024069dd6a3cd395a801692968c5002519a5a31400b4b4da33400a6928cd25002d1499a33400b484d2e28db400da29db682b400da72d3714e14001a42694d36801fda9869f4d22800141a414ea0068a7537bd3a800a28a2980ab4746a4cd29a066f694e0a815b76e706b9ad21fe702ba284f4aa034e23c5483ad4309e2a65a630a294d25002d140a2980b4b4945210b4514a2818869869e69a6801a7a544e2a6a8dc500426929cc29b400d906e18ae6b5cb7c3120574ad599a9c1e6c64d4b11c92f0294d3e74d92114cc7152c068a75252d02168a29450014b494b400b80690e4528e282734008a4af22ae5addb290a4f154e9c0e2803754acabc54522ec3542dae8a30c9ad48dd274eb40c623134cb8b7495781cd39d4a1a609369a00ca962689b06995ab711aca84f7aca914a3106801a69b41a4a000d34d2d26680128a29f1446460053432de95c5c0aecadbfd50ae7b4bd39838622ba38d762015480520e6834ece4523530140a7814d14f1400f14f5a60a78e9400ea28a280168a5145002514b494c428a28a290c4a8a5e95254170d8068029cac326b1b56946d22b4267e4d60ea72e5f143119ce79a652b525408434b9a29281851494b4804a2968a042d3694f4a4a005a297b5250021a314b41e9400da2968a004a2968a004a51452d0014b494b400514514009451462800a5a4c51400b45213485a800734da4a70a0050297145266801d494bda9b400ab4e348294d0036945252d0006945145002d369d4da0028a28a60253a9b4ea004a28a2900a7a537b538f4a6f6a0070e9494a3a5250028a0d028340094a2929450021349de94d250049da9829dda9a28014521eb4a3ad21eb40094bda9297b5002ad2d22d2d002668cd2525003b34669b9a33400b9a6934b48d4c055a774a62d3cd002528a4a514800d2529a4a005028a55e949400def4e3d29075a53d2980da5e948294d0021340a28148075369d4d34000a53d29294d0025380a6d3874a6021a4141eb40a0070a434a2928012968a0d201b4e1494a3a50021a6d39a99400b4a292945002d2529a4a00434da71a4c5002500d045274a0090353f350034e0d40126ea035251400fc5211406a2801b834735202290e28023a51cd2919a4031400b46ea290d001b8d381cd369450029a4a5a4a0029314b45002669cbc834ca729a006d2a9a1e90500388a4a5eb4940051451400b4b494b4c65ed2db6cd5d342dc0ae56c4e2515d3da9ca0a606940d5696a9c06ae2550c53494a69280168a296988296929690c28a28a0029314b4500348c531aa46a8e80227a8cd4cd503500318d472a078c834f7a613da901caeab00494915403738ae835383764d73f2a6c7a91030a414bd45301e690120a28345020a5a4a05002d145140051452d002e2a7b7b83130e6a0ea29b8e680372399264ebcd47221159914cd190735a70dc89930450043bca9a86e10482a699769a8738a0667b820e29b9ab77083ad533c1a40266968a6e69a01c2b5b48b62f2024553b2b7f39c57556168b0c6302ad0cb9046a8a001529e691452d300c518a296801453c53053c50038548298053c5002d281450280168a5a280128a5a4340083a52134e1d29add68010b62a9dd3f5ab521e2b3aede8028ddbed526b9dbc90bb9cd6ddf49fbb35cecadb9cd4b01a7a525068a92429b4ea6d318b8a4a5a4a420a5a414bda800a4a5a4a005345068a002909a5a434008296929d400945068a004cd00d291401400b4b498a5a0028a28a0028cd21a693400ecd216e29b9a0d0026e26940cd2014fc5001814514b4009452d2500385262956834c00529a414a680128a28a401452d25002d2528a4a005c518a074a53400da5a4a5a004a5a28a003b5369fda9b400ab4118a17ad0dd680014520a75301b4a2929680108a414e34def4807f6a6d3874a4a0028229294f4a006d14ad48b40120518a434aa7349de803fffd9);

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_employment`
--

DROP TABLE IF EXISTS `t_cif_employment`;
CREATE TABLE IF NOT EXISTS `t_cif_employment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employment_id` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `employment` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_employment`
--

INSERT INTO `t_cif_employment` (`id`, `employment_id`, `employment`) VALUES
(1, '010', 'Farmers-Peasant'),
(2, '020', 'Artisanal Fisherfolk'),
(3, '030', 'Workers-Formal Sector'),
(4, '040', 'Migrant Workers'),
(5, '050', 'Workers-Informal Sector'),
(6, '060', 'Brgy MicroBusiness Enterprise'),
(7, '070', 'Others (Cultural, Senior)'),
(8, '071', 'Businessman'),
(9, '000', '-');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_entity`
--

DROP TABLE IF EXISTS `t_cif_entity`;
CREATE TABLE IF NOT EXISTS `t_cif_entity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entity_id` varchar(3) NOT NULL,
  `entity` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_entity`
--

INSERT INTO `t_cif_entity` (`id`, `entity_id`, `entity`) VALUES
(1, '000', 'Requested'),
(2, '001', 'Individual'),
(3, '002', 'Single Proprietorship'),
(4, '003', 'Partnership & Assoc.'),
(5, '004', 'Cooperative'),
(6, '005', 'Financial Corp. w/ QB'),
(7, '006', 'Non-financial Coporation'),
(8, '021', 'SSS Pensioner 1-Retirement'),
(9, '022', 'SSS Pensioner 2-EC Death'),
(10, '023', 'SSS Pensioner 3-SS Death'),
(11, '024', 'SSS Pensioner 4-EC T.Dis'),
(12, '025', 'SSS Pensioner 5-SS T.Dis'),
(13, '026', 'SSS Pensioner 6-EC P.Dis'),
(14, '027', 'SSS Pensioner 7-SS P.Dis');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_gender`
--

DROP TABLE IF EXISTS `t_cif_gender`;
CREATE TABLE IF NOT EXISTS `t_cif_gender` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gender_code` varchar(3) NOT NULL,
  `gender` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_gender`
--

INSERT INTO `t_cif_gender` (`id`, `gender_code`, `gender`) VALUES
(1, '001', 'Male'),
(2, '002', 'Female'),
(3, '000', 'Prefer not to say');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_institution`
--

DROP TABLE IF EXISTS `t_cif_institution`;
CREATE TABLE IF NOT EXISTS `t_cif_institution` (
  `id` int NOT NULL AUTO_INCREMENT,
  `institution_id` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `institution` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_institution`
--

INSERT INTO `t_cif_institution` (`id`, `institution_id`, `institution`) VALUES
(1, '000', 'Requested'),
(2, '001', 'Private'),
(3, '002', 'Government-National'),
(4, '003', 'Non-Government'),
(5, '004', 'Government-Local'),
(6, '005', 'Religious Org.'),
(7, '006', 'Organization'),
(8, '007', 'Association'),
(9, '011', 'Phil. National Oil Co. (PNOC)'),
(10, '012', 'National Power Corp. (NPC)'),
(11, '013', 'National Electrification Ad (NEA)'),
(12, '014', 'Phil. Port Authority (PPA)'),
(13, '015', 'Phil. National Railways (PNR)'),
(14, '016', 'Metro Manila Transit Corp. (MMTC)'),
(15, '017', 'National Irrigation Admin (NIA)'),
(16, '018', 'NAWASA/MWSS'),
(17, '019', 'Local Water Utilities Ad (LWUA)'),
(18, '020', 'National Housing Authority (NHA)'),
(19, '021', 'Export Processing Zone A (EPZA)'),
(20, '022', 'National Development Cor (NDC)'),
(21, '023', 'Light Rail Transit Authority (LRTA)'),
(22, '024', 'National Food Authority (FDA)'),
(23, '031', 'Government Institution - Other');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_ownership_type`
--

DROP TABLE IF EXISTS `t_cif_ownership_type`;
CREATE TABLE IF NOT EXISTS `t_cif_ownership_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ownership_type_code` varchar(3) NOT NULL,
  `ownership_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_ownership_type`
--

INSERT INTO `t_cif_ownership_type` (`id`, `ownership_type_code`, `ownership_type`) VALUES
(1, '010', 'Single'),
(2, '011', 'Joint \"AND\"'),
(3, '012', 'Joint \"OR\"'),
(4, '013', 'In Trust For'),
(5, '014', 'And Spouse'),
(6, '015', 'BY');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_product_type`
--

DROP TABLE IF EXISTS `t_cif_product_type`;
CREATE TABLE IF NOT EXISTS `t_cif_product_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_type_code` int NOT NULL,
  `product_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gl_code` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_product_type`
--

INSERT INTO `t_cif_product_type` (`id`, `product_type_code`, `product_type`, `gl_code`) VALUES
(1, 51, 'Regular Savings (Basic)', 51),
(2, 52, 'Regular Savings', 51),
(3, 20, 'Current Account (Corporate)', 25),
(4, 25, 'Current Account (Personal)', 25);

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_relationship`
--

DROP TABLE IF EXISTS `t_cif_relationship`;
CREATE TABLE IF NOT EXISTS `t_cif_relationship` (
  `id` int NOT NULL AUTO_INCREMENT,
  `relationship_id` varchar(3) NOT NULL,
  `relationship` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_relationship`
--

INSERT INTO `t_cif_relationship` (`id`, `relationship_id`, `relationship`) VALUES
(1, '051', 'Director or Sr. Officer'),
(2, '052', 'ShareHolder'),
(3, '053', 'Promoter'),
(4, '061', 'Spouse'),
(5, '062', 'Family'),
(6, '063', 'Other Relative'),
(7, '300', 'Group'),
(8, '301', 'Group Leader'),
(9, '310', 'Sub-group'),
(10, '320', 'Sub Sub-group'),
(11, '499', 'Loan Officer'),
(12, '900', 'Group Member');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_rel_cid`
--

DROP TABLE IF EXISTS `t_cif_rel_cid`;
CREATE TABLE IF NOT EXISTS `t_cif_rel_cid` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `rel_cid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `relationship_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_rel_cid`
--

INSERT INTO `t_cif_rel_cid` (`id`, `cid`, `rel_cid`, `relationship_id`, `created_at`, `updated_at`) VALUES
(1, '000006', '000005', '6', '2025-01-31 01:41:17', '2025-01-31 01:41:17'),
(9, '000024', NULL, NULL, '2025-02-18 09:03:29', '2025-02-18 09:03:29'),
(10, '000025', NULL, NULL, '2025-02-18 10:29:41', '2025-02-18 10:29:41');

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
-- Table structure for table `t_cif_suffixes`
--

DROP TABLE IF EXISTS `t_cif_suffixes`;
CREATE TABLE IF NOT EXISTS `t_cif_suffixes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `suffix` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_suffixes`
--

INSERT INTO `t_cif_suffixes` (`id`, `suffix`) VALUES
(1, 'Jr.'),
(2, 'Sr.'),
(3, 'II'),
(4, 'III'),
(5, 'IV'),
(6, 'V'),
(7, 'none');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_tax_code`
--

DROP TABLE IF EXISTS `t_cif_tax_code`;
CREATE TABLE IF NOT EXISTS `t_cif_tax_code` (
  `id` int NOT NULL AUTO_INCREMENT,
  `taxx_code` varchar(3) NOT NULL,
  `tax_code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_tax_code`
--

INSERT INTO `t_cif_tax_code` (`id`, `taxx_code`, `tax_code`) VALUES
(1, '001', 'Tax Withheld'),
(2, '002', 'Tax Free');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_titles`
--

DROP TABLE IF EXISTS `t_cif_titles`;
CREATE TABLE IF NOT EXISTS `t_cif_titles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_titles`
--

INSERT INTO `t_cif_titles` (`id`, `title_code`, `title`) VALUES
(1, '001', 'Mr.'),
(2, '002', 'Ms.'),
(3, '003', 'Dr.'),
(4, '004', 'Atty.'),
(5, '005', 'Engr.'),
(6, '006', 'Fr.'),
(7, '007', 'Msg.'),
(10, '000', '-');

-- --------------------------------------------------------

--
-- Table structure for table `t_cif_types`
--

DROP TABLE IF EXISTS `t_cif_types`;
CREATE TABLE IF NOT EXISTS `t_cif_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_code` varchar(3) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_cif_types`
--

INSERT INTO `t_cif_types` (`id`, `type_code`, `type`) VALUES
(1, '001', 'Personal/Individual'),
(2, '002', 'Institution/Company');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'test-user', 'test@test.com', NULL, '$2y$10$eSYPB4.s03GsVwhPKqk3ZOeieEsALX.agMq/UxsvyAPZ.F.xSIu9y', NULL, '2024-07-23 18:51:36', '2024-07-23 18:51:36'),
(2, 'admin', 'rbsagay@rbap.org', NULL, '$2y$10$YC4HPqTKWO99GeT478KyCO/EozMKW.lc9zQLjoSMUUQ2hHKXi.Bsu', NULL, '2024-08-26 16:08:52', '2024-08-26 16:08:52');

-- --------------------------------------------------------

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
CREATE TABLE IF NOT EXISTS `watchlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `watchlist`
--

INSERT INTO `watchlist` (`id`, `first_name`, `middle_name`, `last_name`) VALUES
(1, 'Juan', 'Dela', 'Cruz');

-- --------------------------------------------------------

--
-- Table structure for table `_location_code`
--

DROP TABLE IF EXISTS `_location_code`;
CREATE TABLE IF NOT EXISTS `_location_code` (
  `id` int NOT NULL AUTO_INCREMENT,
  `level_number` int NOT NULL,
  `location_code` varchar(11) NOT NULL,
  `short_desc` varchar(10) NOT NULL,
  `full_desc` text NOT NULL,
  `branch` varchar(6) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=777 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `_location_code`
--

INSERT INTO `_location_code` (`id`, `level_number`, `location_code`, `short_desc`, `full_desc`, `branch`, `created_at`, `updated_at`) VALUES
(1, 1, 'Othr', 'OthrRegn', 'Other Region', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(2, 2, 'OthrR', 'Other', 'Other Province', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(3, 3, 'OthrR00', 'Other', 'Other Municipality', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(4, 4, 'OthrR00001', 'Other', 'Other Location', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(5, 1, 'Reg6', 'WestVisay', 'Western Visayas', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(6, 2, 'Reg6A', 'Aklan', 'Aklan', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(7, 2, 'Reg6B', 'Antique', 'Antique', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(8, 2, 'Reg6C', 'Capiz', 'Capiz', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(9, 2, 'Reg6D', 'Guimaras', 'Guimaras', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(10, 2, 'Reg6E', 'Iloilo', 'Iloilo', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(11, 2, 'Reg6F', 'NegrosOcc', 'Negros Occidental', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(12, 3, 'Reg6F01', 'Bacolod', 'Bacolod', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(13, 4, 'Reg6F01001', '', 'Alangilan', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(14, 4, 'Reg6F01002', '', 'Alijis', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(15, 4, 'Reg6F01003', '', 'Banago', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(16, 4, 'Reg6F01004', '', 'Barangay 1 (Población)', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(17, 4, 'Reg6F01005', '', 'Barangay 2 (Población)', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(18, 4, 'Reg6F01006', '', 'Barangay 3 (Población)', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(19, 4, 'Reg6F01007', '', 'Barangay 4 (Población)', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(20, 4, 'Reg6F01008', '', 'Barangay 5 (Población)', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(21, 4, 'Reg6F01009', '', 'Barangay 6 (Población)', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(22, 4, 'Reg6F01010', '', 'Barangay 7 (Población)', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(23, 4, 'Reg6F01011', '', 'Barangay 8 (Población)', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(24, 4, 'Reg6F01012', '', 'Barangay 9 (Población)', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(25, 4, 'Reg6F01013', '', 'Barangay 10 (Población)', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(26, 4, 'Reg6F01014', '', 'Barangay 11 (Población)', '000000', '2024-09-11 00:05:51', '2024-09-11 00:05:51'),
(27, 4, 'Reg6F01015', '', 'Barangay 12 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(28, 4, 'Reg6F01016', '', 'Barangay 13 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(29, 4, 'Reg6F01017', '', 'Barangay 14 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(30, 4, 'Reg6F01018', '', 'Barangay 15 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(31, 4, 'Reg6F01019', '', 'Barangay 16 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(32, 4, 'Reg6F01020', '', 'Barangay 17 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(33, 4, 'Reg6F01021', '', 'Barangay 18 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(34, 4, 'Reg6F01022', '', 'Barangay 19 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(35, 4, 'Reg6F01023', '', 'Barangay 20 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(36, 4, 'Reg6F01024', '', 'Barangay 21 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(37, 4, 'Reg6F01025', '', 'Barangay 22 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(38, 4, 'Reg6F01026', '', 'Barangay 23 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(39, 4, 'Reg6F01027', '', 'Barangay 24 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(40, 4, 'Reg6F01028', '', 'Barangay 25 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(41, 4, 'Reg6F01029', '', 'Barangay 26 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(42, 4, 'Reg6F01030', '', 'Barangay 27 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(43, 4, 'Reg6F01031', '', 'Barangay 28 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(44, 4, 'Reg6F01032', '', 'Barangay 29 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(45, 4, 'Reg6F01033', '', 'Barangay 30 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(46, 4, 'Reg6F01034', '', 'Barangay 31 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(47, 4, 'Reg6F01035', '', 'Barangay 32 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(48, 4, 'Reg6F01036', '', 'Barangay 33 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(49, 4, 'Reg6F01037', '', 'Barangay 34 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(50, 4, 'Reg6F01038', '', 'Barangay 35 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(51, 4, 'Reg6F01039', '', 'Barangay 36 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(52, 4, 'Reg6F01040', '', 'Barangay 37 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(53, 4, 'Reg6F01041', '', 'Barangay 38 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(54, 4, 'Reg6F01042', '', 'Barangay 39 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(55, 4, 'Reg6F01043', '', 'Barangay 40 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(56, 4, 'Reg6F01044', '', 'Barangay 41 (Población)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(57, 4, 'Reg6F01045', '', 'Bata', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(58, 4, 'Reg6F01046', '', 'Cabug', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(59, 4, 'Reg6F01047', '', 'Estefanía', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(60, 4, 'Reg6F01048', '', 'Felisa', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(61, 4, 'Reg6F01049', '', 'Granada', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(62, 4, 'Reg6F01050', '', 'Handumanan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(63, 4, 'Reg6F01051', '', 'Mandalagan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(64, 4, 'Reg6F01052', '', 'Mansilingan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(65, 4, 'Reg6F01053', '', 'Montevista', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(66, 4, 'Reg6F01054', '', 'Pahanocoy', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(67, 4, 'Reg6F01055', '', 'Punta Taytay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(68, 4, 'Reg6F01056', '', 'Singcang-Airport', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(69, 4, 'Reg6F01057', '', 'Sum-ag', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(70, 4, 'Reg6F01058', '', 'Taculing', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(71, 4, 'Reg6F01059', '', 'Tangub', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(72, 4, 'Reg6F01060', '', 'Villamonte', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(73, 4, 'Reg6F01061', '', 'Vista Alegre', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(74, 3, 'Reg6F02', 'Bago', 'Bago', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(75, 4, 'Reg6F02001', '', 'Abuanan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(76, 4, 'Reg6F02002', '', 'Alianza', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(77, 4, 'Reg6F02003', '', 'Atipuluan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(78, 4, 'Reg6F02004', '', 'Bacong-Montilla', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(79, 4, 'Reg6F02005', '', 'Bagroy', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(80, 4, 'Reg6F02006', '', 'Balingasag', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(81, 4, 'Reg6F02007', '', 'Binubuhan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(82, 4, 'Reg6F02008', '', 'Busay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(83, 4, 'Reg6F02009', '', 'Calumangan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(84, 4, 'Reg6F02010', '', 'Caridad', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(85, 4, 'Reg6F02011', '', 'Don Jorge L. Araneta', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(86, 4, 'Reg6F02012', '', 'Dulao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(87, 4, 'Reg6F02013', '', 'Ilijan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(88, 4, 'Reg6F02014', '', 'Lag-Asan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(89, 4, 'Reg6F02015', '', 'Ma-ao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(90, 4, 'Reg6F02016', '', 'Mailum', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(91, 4, 'Reg6F02017', '', 'Malingin', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(92, 4, 'Reg6F02018', '', 'Napoles', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(93, 4, 'Reg6F02019', '', 'Pacol', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(94, 4, 'Reg6F02020', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(95, 4, 'Reg6F02021', '', 'Sagasa', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(96, 4, 'Reg6F02022', '', 'Tabunan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(97, 4, 'Reg6F02023', '', 'Taloc', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(98, 4, 'Reg6F02024', '', 'Sampinit', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(99, 3, 'Reg6F03', 'Binalbagan', 'Binalbagan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(100, 4, 'Reg6F03000', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(101, 3, 'Reg6F04', 'Cadiz', 'Cadiz', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(102, 4, 'Reg6F04001', '', 'Andres Bonifacio', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(103, 4, 'Reg6F04002', '', 'Banquerohan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(104, 4, 'Reg6F04003', '', 'Barangay 1 Pob.(Zone 1)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(105, 4, 'Reg6F04004', '', 'Barangay 2 Pob.(Zone 2)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(106, 4, 'Reg6F04005', '', 'Barangay 3 Pob.(Zone 3)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(107, 4, 'Reg6F04006', '', 'Barangay 4 Pob.(Zone 4)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(108, 4, 'Reg6F04007', '', 'Barangay 5 Pob.(Zone 5)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(109, 4, 'Reg6F04008', '', 'Barangay 6 Pob.(Zone 6)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(110, 4, 'Reg6F04009', '', 'Burgos', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(111, 4, 'Reg6F04010', '', 'Cabahug', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(112, 4, 'Reg6F04011', '', 'Cadiz Viejo', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(113, 4, 'Reg6F04012', '', 'Caduha-an', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(114, 4, 'Reg6F04013', '', 'Celestino Villacin', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(115, 4, 'Reg6F04014', '', 'Daga', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(116, 4, 'Reg6F04015', '', 'V. F. Gustilo', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(117, 4, 'Reg6F04016', '', 'Jerusalem', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(118, 4, 'Reg6F04017', '', 'Luna', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(119, 4, 'Reg6F04018', '', 'Mabini', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(120, 4, 'Reg6F04019', '', 'Magsaysay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(121, 4, 'Reg6F04020', '', 'Sicaba', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(122, 4, 'Reg6F04021', '', 'Tiglawigan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(123, 4, 'Reg6F04022', '', 'Tinampa-an', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(124, 3, 'Reg6F05', 'Calatrava', 'Calatrava', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(125, 4, 'Reg6F05001', 'Agpangi', 'Agpangi', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(126, 4, 'Reg6F05002', 'Ani-e', 'Ani-e', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(127, 4, 'Reg6F05003', 'Bagacay', 'Bagacay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(128, 4, 'Reg6F05004', 'Bantayanon', 'Bantayanon', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(129, 4, 'Reg6F05005', 'Buenavista', 'Buenavista', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(130, 4, 'Reg6F05006', 'Cabungahan', 'Cabungahan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(131, 4, 'Reg6F05007', 'Calmpiswan', 'Calampisawan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(132, 4, 'Reg6F05008', 'Cambayobo', 'Cambayobo', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(133, 4, 'Reg6F05009', 'Castellano', 'Castellano', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(134, 4, 'Reg6F05010', 'Cruz', 'Cruz', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(135, 4, 'Reg6F05011', 'Dolis', 'Dolis', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(136, 4, 'Reg6F05012', 'Hilub-Ang', 'Hilub-Ang', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(137, 4, 'Reg6F05013', 'HinabOngan', 'Hinab-Ongan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(138, 4, 'Reg6F05014', 'Ilaya', 'Ilaya', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(139, 4, 'Reg6F05015', 'Laga-an', 'Laga-an', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(140, 4, 'Reg6F05016', 'Lalong', 'Lalong', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(141, 4, 'Reg6F05017', 'Lemery', 'Lemery', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(142, 4, 'Reg6F05018', 'Lipat-on', 'Lipat-on', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(143, 4, 'Reg6F05019', 'Lo-ok(Pob)', 'Lo-ok (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(144, 4, 'Reg6F05020', 'Ma-aslob', 'Ma-aslob', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(145, 4, 'Reg6F05021', 'Macasilao', 'Macasilao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(146, 4, 'Reg6F05022', 'Malanog', 'Malanog', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(147, 4, 'Reg6F05023', 'Malatas', 'Malatas', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(148, 4, 'Reg6F05024', 'Marcelo', 'Marcelo', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(149, 4, 'Reg6F05025', 'Mina-utok', 'Mina-utok', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(150, 4, 'Reg6F05026', 'Menchaca', 'Menchaca', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(151, 4, 'Reg6F05027', 'Minapasuk', 'Minapasuk', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(152, 4, 'Reg6F05028', 'Mahilum', 'Mahilum', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(153, 4, 'Reg6F05029', 'Paghumayan', 'Paghumayan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(154, 4, 'Reg6F05030', 'Pantao', 'Pantao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(155, 4, 'Reg6F05031', 'Patun-an', 'Patun-an', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(156, 4, 'Reg6F05032', 'Pinocutan', 'Pinocutan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(157, 4, 'Reg6F05033', 'Refugio', 'Refugio', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(158, 4, 'Reg6F05034', 'SanBenito', 'San Benito', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(159, 4, 'Reg6F05035', 'SanIsidro', 'San Isidro', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(160, 4, 'Reg6F05036', 'Suba(Pob)', 'Suba (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(161, 4, 'Reg6F05037', 'Telim', 'Telim', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(162, 4, 'Reg6F05038', 'Tigbao', 'Tigbao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(163, 4, 'Reg6F05039', 'Tigbon', 'Tigbon', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(164, 4, 'Reg6F05040', 'Winaswasan', 'Winaswasan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(165, 3, 'Reg6F06', 'Candoni', 'Candoni', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(166, 4, 'Reg6F06000', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(167, 3, 'Reg6F07', 'Cauayan', 'Cauayan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(168, 4, 'Reg6F07000', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(169, 3, 'Reg6F08', 'Saravia', 'EnriqueMagalona-Saravia', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(170, 4, 'Reg6F08001', 'Alacaygan ', 'Alacaygan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(171, 4, 'Reg6F08002', 'Alicante  ', 'Alicante', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(172, 4, 'Reg6F08003', 'Pob1Brgy1 ', 'Poblacion I (Barangay 1)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(173, 4, 'Reg6F08004', 'Pob2Brgy2 ', 'Poblacion II (Barangay 2', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(174, 4, 'Reg6F08005', 'Pob3Brgy3 ', 'Poblacion III Barangay 3', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(175, 4, 'Reg6F08006', 'Batea     ', 'Batea', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(176, 4, 'Reg6F08007', 'Consing   ', 'Consing', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(177, 4, 'Reg6F08008', 'Cudangdang', 'Cudangdang', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(178, 4, 'Reg6F08009', 'Damgo     ', 'Damgo', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(179, 4, 'Reg6F08010', 'Gahit     ', 'Gahit', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(180, 4, 'Reg6F08011', 'Canlusong ', 'Canlusong', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(181, 4, 'Reg6F08012', 'Latasan   ', 'Latasan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(182, 4, 'Reg6F08013', 'Madalag   ', 'Madalag', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(183, 4, 'Reg6F08014', 'Manta-anga', 'Manta-angan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(184, 4, 'Reg6F08015', 'Nanca     ', 'Nanca', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(185, 4, 'Reg6F08016', 'Pasil     ', 'Pasil', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(186, 4, 'Reg6F08017', 'San Isidro', 'San Isidro', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(187, 4, 'Reg6F08018', 'San Jose  ', 'San Jose', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(188, 4, 'Reg6F08019', 'Santo Niño', 'Santo Niño', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(189, 4, 'Reg6F08020', 'Tabigue   ', 'Tabigue', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(190, 4, 'Reg6F08021', 'Tanza     ', 'Tanza', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(191, 4, 'Reg6F08022', 'Tuburan   ', 'Tuburan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(192, 4, 'Reg6F08023', 'Tomongtong', 'Tomongtong', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(193, 3, 'Reg6F09', 'Escalante', 'Escalante', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(194, 4, 'Reg6F09001', 'Alimango  ', 'Alimango', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(195, 4, 'Reg6F09002', 'Balintawak', 'Balintawak', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(196, 4, 'Reg6F09003', 'Binaguiohn', 'Binaguiohan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(197, 4, 'Reg6F09004', 'Buenavista', 'Buenavista', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(198, 4, 'Reg6F09005', 'Cervantes', 'Cervantes', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(199, 4, 'Reg6F09006', 'Dian-ay', 'Dian-ay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(200, 4, 'Reg6F09007', 'Hda. Fe', 'Hda. Fe', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(201, 4, 'Reg6F09008', 'Japitan', 'Japitan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(202, 4, 'Reg6F09009', 'Jonobjonob', 'Jonobjonob', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(203, 4, 'Reg6F09010', 'Langub', 'Langub', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(204, 4, 'Reg6F09011', 'Libertad', 'Libertad', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(205, 4, 'Reg6F09012', 'Mabini', 'Mabini', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(206, 4, 'Reg6F09013', 'Magsaysay', 'Magsaysay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(207, 4, 'Reg6F09014', 'Malasibog', 'Malasibog', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(208, 4, 'Reg6F09015', 'Old Pob', 'Old Pob', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(209, 4, 'Reg6F09016', 'Paitan', 'Paitan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(210, 4, 'Reg6F09017', 'Rizal', 'Rizal', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(211, 4, 'Reg6F09018', 'Tamlang', 'Tamlang', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(212, 4, 'Reg6F09019', 'Udtongan', 'Udtongan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(213, 4, 'Reg6F09020', 'Washington', 'Washington', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(214, 3, 'Reg6F10', 'Himamaylan', 'Himamaylan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(215, 4, 'Reg6F10000', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(216, 3, 'Reg6F11', 'Hinigaran', 'Hinigaran', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(217, 4, 'Reg6F11000', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(218, 3, 'Reg6F12', 'Hinoba-an', 'Hinoba-an (Asia)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(219, 4, 'Reg6F12000', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(220, 3, 'Reg6F13', 'Ilog', 'Ilog', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(221, 4, 'Reg6F13000', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(222, 3, 'Reg6F14', 'Isabela', 'Isabela', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(223, 4, 'Reg6F14000', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(224, 3, 'Reg6F15', 'Kabankalan', 'Kabankalan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(225, 4, 'Reg6F15000', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(226, 3, 'Reg6F16', 'La Carlota', 'La Carlota', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(227, 4, 'Reg6F16000', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(228, 3, 'Reg6F17', 'LaCastella', 'La Castellana', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(229, 4, 'Reg6F17000', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(230, 3, 'Reg6F18', 'Manapla', 'Manapla', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(231, 4, 'Reg6F18004', 'Brgy I-B', 'Barangay I-B (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(232, 4, 'Reg6F18005', 'Brgy II', 'Barangay II (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(233, 4, 'Reg6F18006', 'Brgy II-A', 'Barangay II-A (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(234, 4, 'Reg6F18007', 'Punta Mesa', 'Punta Mesa', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(235, 4, 'Reg6F18008', 'PuntaSalng', 'Punta Salong', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(236, 4, 'Reg6F18009', 'Purisima', 'Purisima', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(237, 4, 'Reg6F18010', 'San Pablo', 'San Pablo', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(238, 4, 'Reg6F18011', 'StaTeresa', 'Santa Teresa', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(239, 4, 'Reg6F18012', 'Tortosa', 'Tortosa', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(240, 3, 'Reg6F19', 'Magallon', 'Moises Padilla(Magallon)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(241, 4, 'Reg6F19000', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(242, 3, 'Reg6F20', 'Murcia', 'Murcia', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(243, 4, 'Reg6F20000', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(244, 3, 'Reg6F21', 'Pontevedra', 'Pontevedra', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(245, 4, 'Reg6F21000', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(246, 3, 'Reg6F22', 'Pulupandan', 'Pulupandan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(247, 4, 'Reg6F22000', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(248, 3, 'Reg6F23', 'Sagay', 'Sagay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(249, 4, 'Reg6F23001', '', 'Andres Bonifacio', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(250, 4, 'Reg6F23002', '', 'Bato', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(251, 4, 'Reg6F23003', '', 'Baviera', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(252, 4, 'Reg6F23004', '', 'Bulanon', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(253, 4, 'Reg6F23005', '', 'Campo Himoga-an', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(254, 4, 'Reg6F23006', '', 'Colonia Divina', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(255, 4, 'Reg6F23007', '', 'Rafaela Barrera', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(256, 4, 'Reg6F23008', '', 'Fabrica', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(257, 4, 'Reg6F23009', '', 'General Luna', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(258, 4, 'Reg6F23010', '', 'Himoga-an Baybay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(259, 4, 'Reg6F23011', '', 'Lopez Jaena', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(260, 4, 'Reg6F23012', '', 'Malubon', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(261, 4, 'Reg6F23013', '', 'Makiling', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(262, 4, 'Reg6F23014', '', 'Molocaboc', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(263, 4, 'Reg6F23015', '', 'Old Sagay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(264, 4, 'Reg6F23016', '', 'Paraiso', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(265, 4, 'Reg6F23017', '', 'Plaridel', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(266, 4, 'Reg6F23018', '', 'Poblacion I (Brgy 1)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(267, 4, 'Reg6F23019', '', 'Poblacion II (Brgy 2)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(268, 4, 'Reg6F23020', '', 'Puey', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(269, 4, 'Reg6F23021', '', 'Rizal', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(270, 4, 'Reg6F23022', '', 'SewahonI-Campo Santiago', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(271, 4, 'Reg6F23023', '', 'Taba-ao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(272, 4, 'Reg6F23024', '', 'Tadlong', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(273, 4, 'Reg6F23025', '', 'Vito', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(274, 3, 'Reg6F24', 'SalvadorBe', 'Salvador Benedicto', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(275, 4, 'Reg6F24000', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(276, 3, 'Reg6F25', 'San Carlos', 'San Carlos', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(277, 4, 'Reg6F25001', 'Bagonbon', 'Bagonbon', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(278, 4, 'Reg6F25002', 'Buluangan', 'Buluangan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(279, 4, 'Reg6F25003', 'Codcod', 'Codcod', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(280, 4, 'Reg6F25004', 'Ermita', 'Ermita', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(281, 4, 'Reg6F25005', 'Guadalupe', 'Guadalupe', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(282, 4, 'Reg6F25006', 'Nataban', 'Nataban', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(283, 4, 'Reg6F25007', 'Palampas', 'Palampas', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(284, 4, 'Reg6F25008', 'BrgyI', 'Barangay I (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(285, 4, 'Reg6F25009', 'BrgyII', 'Barangay II (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(286, 4, 'Reg6F25010', 'BrgyIII', 'Barangay III (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(287, 4, 'Reg6F25011', 'BrgyIV', 'Barangay IV (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(288, 4, 'Reg6F25012', 'BrgyV', 'Barangay V (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(289, 4, 'Reg6F25013', 'BrgyVI', 'Barangay VI (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(290, 4, 'Reg6F25014', 'Prosprd', 'Prosperidad', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(291, 4, 'Reg6F25015', 'Punao', 'Punao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(292, 4, 'Reg6F25016', 'Quezon', 'Quezon', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(293, 4, 'Reg6F25017', 'SnJuan', 'San Juan sipaway', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(294, 3, 'Reg6F26', 'San Enriqu', 'San Enrique', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(295, 4, 'Reg6F26000', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(296, 3, 'Reg6F27', 'Silay', 'Silay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(297, 4, 'Reg6F27000', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(298, 3, 'Reg6F28', 'Sipalay', 'Sipalay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(299, 4, 'Reg6F28000', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(300, 3, 'Reg6F29', 'Talisay', 'Talisay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(301, 4, 'Reg6F29000', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(302, 3, 'Reg6F30', 'Toboso', 'Toboso', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(303, 4, 'Reg6F30001', 'Chambéry', 'Chambéry', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(304, 4, 'Reg6F30002', 'Bug-ang', 'Bug-ang', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(305, 4, 'Reg6F30003', 'Gen Luna', 'General Luna', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(306, 4, 'Reg6F30004', 'Magticol', 'Magticol', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(307, 4, 'Reg6F30005', 'Poblacion', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(308, 4, 'Reg6F30006', 'Salamanca', 'Salamanca', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(309, 4, 'Reg6F30007', 'San Isidro', 'San Isidro', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(310, 4, 'Reg6F30008', 'San Jose', 'San Jose', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(311, 4, 'Reg6F30009', 'Tabun-ac', 'Tabun-ac', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(312, 4, 'Reg6F30010', 'Bandila', 'Bandila', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(313, 3, 'Reg6F31', 'Valladolid', 'Valladolid', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(314, 4, 'Reg6F31000', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(315, 3, 'Reg6F32', 'Victorias', 'Victorias', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(316, 4, 'Reg6F32001', 'Brgy I', 'Barangay I (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(317, 4, 'Reg6F32002', 'Brgy II', 'Barangay II (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(318, 4, 'Reg6F32003', 'Brgy III', 'Barangay III (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(319, 4, 'Reg6F32004', 'Brgy IV', 'Barangay IV (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(320, 4, 'Reg6F32005', 'Brgy V', 'Barangay V (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(321, 4, 'Reg6F32006', 'Brgy VI', 'BrgyVIEstrella/Salvacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(322, 4, 'Reg6F32007', 'Brgy XVII', 'Barangay VII (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(323, 4, 'Reg6F32008', 'Brgy VIII', 'Brgy VIII (Pob) Lobaton', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(324, 4, 'Reg6F32009', 'Brgy XI', 'Barangay IX (Daan Banwa)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(325, 4, 'Reg6F32010', 'Brgy X', 'Barangay X (Estado)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(326, 4, 'Reg6F32011', 'Brgy XI', 'Barangay XI (Gawahon)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(327, 4, 'Reg6F32012', 'Brgy XII', 'Barangay XII', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(328, 4, 'Reg6F32013', 'Brgy XIII', 'Brgy XIII (Gloryville)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(329, 4, 'Reg6F32014', 'Brgy XIV', 'Barangay XIV', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(330, 4, 'Reg6F32015', 'Brgy XV', 'Barangay XV', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(331, 4, 'Reg6F32016', 'Brgy XV-A', 'Barangay XV-A', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(332, 4, 'Reg6F32017', 'BrgyXVI', 'Barangay XVI', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(333, 4, 'Reg6F32018', 'BrgyXVI-A', 'Barangay XVI-A', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(334, 4, 'Reg6F32019', 'BrgyXVII', 'Barangay XVII', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(335, 4, 'Reg6F32020', 'BrgyXVIII', 'Barangay XVIII', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(336, 4, 'Reg6F32021', 'BrgyXVIIIA', 'Barangay XVIII-A', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(337, 4, 'Reg6F32022', 'Brgy XIX', 'Barangay XIX', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(338, 4, 'Reg6F32023', 'Brgy XIX-A', 'Brgy XIX-A(Canetown Sub)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(339, 4, 'Reg6F32024', 'Brgy XX', 'Barangay XX', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(340, 4, 'Reg6F32025', 'Brgy XXI', 'Barangay XXI', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(341, 4, 'Reg6F32026', 'Brgy VI-A', 'Barangay VI-A', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(342, 1, 'Reg8', 'EastVisay', 'Eastern Visayas', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(343, 2, 'Reg8A', 'Biliran', 'Biliran', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(344, 2, 'Reg8B', 'East Samar', 'Eastern Samar', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(345, 2, 'Reg8C', 'Leyte', 'Leyte', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(346, 3, 'Reg8C01', 'Abuyog', 'Abuyog', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(347, 3, 'Reg8C02', 'Alangalang', 'Alangalang', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(348, 3, 'Reg8C03', 'Albuera', 'Albuera', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(349, 4, 'Reg8C03001', '', 'Antipolo', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(350, 4, 'Reg8C03002', '', 'Balugo', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(351, 4, 'Reg8C03003', '', 'Benolho', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(352, 4, 'Reg8C03004', '', 'Cambalading', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(353, 4, 'Reg8C03005', '', 'Damula-an', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(354, 4, 'Reg8C03006', '', 'Doña Maria (Kangkuirina)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(355, 4, 'Reg8C03007', '', 'Gungab', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(356, 4, 'Reg8C03008', '', 'Mahayag', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(357, 4, 'Reg8C03009', '', 'Mahayahay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(358, 4, 'Reg8C03010', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(359, 4, 'Reg8C03011', '', 'Salvacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(360, 4, 'Reg8C03012', '', 'San Pedro', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(361, 4, 'Reg8C03013', '', 'Seguinon', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(362, 4, 'Reg8C03014', '', 'Sherwood', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(363, 4, 'Reg8C03015', '', 'Tabgas', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(364, 4, 'Reg8C03016', '', 'Talisayan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(365, 4, 'Reg8C03017', '', 'Tinag-an', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(366, 3, 'Reg8C04', 'Babatngon', 'Babatngon', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(367, 3, 'Reg8C05', 'Barugo', 'Barugo', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(368, 3, 'Reg8C06', 'BatoLeyte', 'Bato', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(369, 3, 'Reg8C07', 'Burauen', 'Burauen', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(370, 4, 'Reg8C07001', '', 'Abuyogon', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(371, 4, 'Reg8C07002', '', 'Anonang', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(372, 4, 'Reg8C07003', '', 'Arado', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(373, 4, 'Reg8C07004', '', 'Balao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(374, 4, 'Reg8C07005', '', 'Baletson', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(375, 4, 'Reg8C07006', '', 'Balorinay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(376, 4, 'Reg8C07007', '', 'Bobon', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(377, 4, 'Reg8C07008', '', 'Buenavista', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(378, 4, 'Reg8C07009', '', 'Buri', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(379, 4, 'Reg8C07010', '', 'Caanislagan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(380, 4, 'Reg8C07011', '', 'Cadahunan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(381, 4, 'Reg8C07012', '', 'Cagangon', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(382, 4, 'Reg8C07013', '', 'Cali', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(383, 4, 'Reg8C07014', '', 'Calsadahay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(384, 4, 'Reg8C07015', '', 'Candag-on', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(385, 4, 'Reg8C07016', '', 'Cansiboy', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(386, 4, 'Reg8C07017', '', 'Catagbacan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(387, 4, 'Reg8C07018', '', 'Poblacion District I', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(388, 4, 'Reg8C07019', '', 'Poblacion District II', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(389, 4, 'Reg8C07020', '', 'Poblacion District III', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(390, 4, 'Reg8C07021', '', 'Poblacion District IV', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(391, 4, 'Reg8C07022', '', 'Poblacion District V', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(392, 4, 'Reg8C07023', '', 'Poblacion District VI', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(393, 4, 'Reg8C07024', '', 'Poblacion District VII', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(394, 4, 'Reg8C07025', '', 'Poblacion District VIII', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(395, 4, 'Reg8C07026', '', 'Poblacion District IX', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(396, 4, 'Reg8C07027', '', 'Dumalag', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(397, 4, 'Reg8C07028', '', 'Ilihan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(398, 4, 'Reg8C07029', '', 'Esperansa', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(399, 4, 'Reg8C07030', '', 'Gitabla', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(400, 4, 'Reg8C07031', '', 'Hapunan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(401, 4, 'Reg8C07032', '', 'Hibonawan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(402, 4, 'Reg8C07033', '', 'Hugpa East', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(403, 4, 'Reg8C07034', '', 'Hugpa West', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(404, 4, 'Reg8C07035', '', 'Kalao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(405, 4, 'Reg8C07036', '', 'Kaparasanan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(406, 4, 'Reg8C07037', '', 'Laguiwan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(407, 4, 'Reg8C07038', '', 'Libas', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(408, 4, 'Reg8C07039', '', 'Limburan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(409, 4, 'Reg8C07040', '', 'Logsongan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(410, 4, 'Reg8C07041', '', 'Maabab', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(411, 4, 'Reg8C07042', '', 'Maghubas', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(412, 4, 'Reg8C07043', '', 'Mahagnao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(413, 4, 'Reg8C07044', '', 'Malabca', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(414, 4, 'Reg8C07045', '', 'Malaguinabot', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(415, 4, 'Reg8C07046', '', 'Malaihao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(416, 4, 'Reg8C07047', '', 'Matin-ao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(417, 4, 'Reg8C07048', '', 'Moguing', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(418, 4, 'Reg8C07049', '', 'Paghudlan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(419, 4, 'Reg8C07050', '', 'Paitan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(420, 4, 'Reg8C07051', '', 'Pangdan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(421, 4, 'Reg8C07052', '', 'Patag', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(422, 4, 'Reg8C07053', '', 'Patong', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(423, 4, 'Reg8C07054', '', 'Pawa', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(424, 4, 'Reg8C07055', '', 'Roxas', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(425, 4, 'Reg8C07056', '', 'Sambel', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(426, 4, 'Reg8C07057', '', 'San Esteban', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(427, 4, 'Reg8C07058', '', 'San Fernando', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(428, 4, 'Reg8C07059', '', 'San Jose East', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(429, 4, 'Reg8C07060', '', 'San Jose West', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(430, 4, 'Reg8C07061', '', 'San Pablo', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(431, 4, 'Reg8C07062', '', 'Tabuanon', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(432, 4, 'Reg8C07063', '', 'Tagadtaran', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(433, 4, 'Reg8C07064', '', 'Taghoyan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(434, 4, 'Reg8C07065', '', 'Takin', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(435, 4, 'Reg8C07066', '', 'Tambis', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(436, 4, 'Reg8C07067', '', 'Toloyao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(437, 4, 'Reg8C07068', '', 'Villa Aurora', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(438, 4, 'Reg8C07069', '', 'Villa Corazon', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(439, 4, 'Reg8C07070', '', 'Villa Patria', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(440, 4, 'Reg8C07071', '', 'Villa Rosas', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(441, 4, 'Reg8C07072', '', 'Kagbana', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(442, 4, 'Reg8C07073', '', 'Damulo-an', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(443, 4, 'Reg8C07074', '', 'Dina-ayan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(444, 4, 'Reg8C07075', '', 'Gamay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(445, 4, 'Reg8C07076', '', 'Kalipayan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(446, 4, 'Reg8C07077', '', 'Tambuko', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(447, 3, 'Reg8C08', 'BaybayCity', 'Baybay City', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(448, 4, 'Reg8C08001', 'Altavista', 'Altavista', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(449, 4, 'Reg8C08002', 'Ambacan', 'Ambacan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(450, 4, 'Reg8C08003', 'Amguhan', 'Amguhan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(451, 4, 'Reg8C08004', 'Ampihanon', 'Ampihanon', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(452, 4, 'Reg8C08005', 'Balao', 'Balao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(453, 4, 'Reg8C08006', 'Banahao', 'Banahao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(454, 4, 'Reg8C08007', 'Biasong', 'Biasong', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(455, 4, 'Reg8C08008', 'Bidlinan', 'Bidlinan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(456, 4, 'Reg8C08009', 'Bitanhuan', 'Bitanhuan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(457, 4, 'Reg8C08010', 'Bubon', 'Bubon', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(458, 4, 'Reg8C08011', 'Buenavista', 'Buenavista', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(459, 4, 'Reg8C08012', 'Candadam', 'Candadam', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(460, 4, 'Reg8C08013', 'Can-ipa', 'Can-ipa', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(461, 4, 'Reg8C08014', 'Caridad', 'Caridad', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(462, 4, 'Reg8C08015', 'Ciabu', 'Ciabu', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(463, 4, 'Reg8C08016', 'Cogon', 'Cogon', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(464, 4, 'Reg8C08017', 'Gaas', 'Gaas', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(465, 4, 'Reg8C08018', 'Gabas', 'Gabas', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(466, 4, 'Reg8C08019', 'Gacat', 'Gacat', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(467, 4, 'Reg8C08020', 'Guadalupe ', 'Guadalupe (Utod)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(468, 4, 'Reg8C08021', 'Gubang', 'Gubang', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(469, 4, 'Reg8C08022', 'Hibunawan', 'Hibunawan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(470, 4, 'Reg8C08023', 'Higulo-an', 'Higulo-an', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(471, 4, 'Reg8C08024', 'Hilapnitan', 'Hilapnitan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(472, 4, 'Reg8C08025', 'Hipusngo', 'Hipusngo', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(473, 4, 'Reg8C08026', 'Igang', 'Igang', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(474, 4, 'Reg8C08027', 'Imelda', 'Imelda', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(475, 4, 'Reg8C08028', 'Jaena', 'Jaena', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(476, 4, 'Reg8C08029', 'Kabalasan', 'Kabalasan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(477, 4, 'Reg8C08030', 'Kabatuan', 'Kabatuan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(478, 4, 'Reg8C08031', 'Kabungaan', 'Kabungaan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(479, 4, 'Reg8C08032', 'Kagumay', 'Kagumay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(480, 4, 'Reg8C08033', 'Kambonggan', 'Kambonggan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(481, 4, 'Reg8C08034', 'Kansungka', 'Kansungka', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(482, 4, 'Reg8C08035', 'Kantagnos', 'Kantagnos', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(483, 4, 'Reg8C08036', 'Kilim', 'Kilim', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(484, 4, 'Reg8C08037', 'Lintaon', 'Lintaon', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(485, 4, 'Reg8C08038', 'Maganhan', 'Maganhan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(486, 4, 'Reg8C08039', 'Mahayahay', 'Mahayahay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(487, 4, 'Reg8C08040', 'Mailhi', 'Mailhi', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(488, 4, 'Reg8C08041', 'Maitum', 'Maitum', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(489, 4, 'Reg8C08042', 'Makinhas', 'Makinhas', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(490, 4, 'Reg8C08043', 'Mapgap', 'Mapgap', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(491, 4, 'Reg8C08044', 'Marcos', 'Marcos', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(492, 4, 'Reg8C08045', 'Maslug', 'Maslug', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(493, 4, 'Reg8C08046', 'Matam-is', 'Matam-is', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(494, 4, 'Reg8C08047', 'Maybog', 'Maybog', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(495, 4, 'Reg8C08048', 'Maypatag', 'Maypatag', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(496, 4, 'Reg8C08049', 'Monterico', 'Monterico', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(497, 4, 'Reg8C08050', 'Monteverde', 'Monteverde', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52');
INSERT INTO `_location_code` (`id`, `level_number`, `location_code`, `short_desc`, `full_desc`, `branch`, `created_at`, `updated_at`) VALUES
(498, 4, 'Reg8C08051', 'Palhi', 'Palhi', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(499, 4, 'Reg8C08052', 'Pangasugan', 'Pangasugan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(500, 4, 'Reg8C08053', 'Pansagan', 'Pansagan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(501, 4, 'Reg8C08054', 'Patag', 'Patag', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(502, 4, 'Reg8C08055', 'Plaridel', 'Plaridel', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(503, 4, 'Reg8C08056', 'Poblacion ', 'Poblacion Zone 1', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(504, 4, 'Reg8C08057', 'Poblacion ', 'Poblacion Zone 2', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(505, 4, 'Reg8C08058', 'Poblacion ', 'Poblacion Zone 3', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(506, 4, 'Reg8C08059', 'Poblacion ', 'Poblacion Zone 4', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(507, 4, 'Reg8C08060', 'Poblacion ', 'Poblacion Zone 5', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(508, 4, 'Reg8C08061', 'Poblacion ', 'Poblacion Zone 6', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(509, 4, 'Reg8C08062', 'Poblacion ', 'Poblacion Zone 7', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(510, 4, 'Reg8C08063', 'Poblacion ', 'Poblacion Zone 8', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(511, 4, 'Reg8C08064', 'Poblacion ', 'Poblacion Zone 9', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(512, 4, 'Reg8C08065', 'Poblacion ', 'Poblacion Zone 10', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(513, 4, 'Reg8C08066', 'Poblacion ', 'Poblacion Zone 11', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(514, 4, 'Reg8C08067', 'Poblacion ', 'Poblacion Zone 12', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(515, 4, 'Reg8C08068', 'Poblacion ', 'Poblacion Zone 13', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(516, 4, 'Reg8C08069', 'Poblacion ', 'Poblacion Zone 14', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(517, 4, 'Reg8C08070', 'Poblacion ', 'Poblacion Zone 15', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(518, 4, 'Reg8C08071', 'Poblacion ', 'Poblacion Zone 16', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(519, 4, 'Reg8C08072', 'Poblacion ', 'Poblacion Zone 17', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(520, 4, 'Reg8C08073', 'Poblacion ', 'Poblacion Zone 18', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(521, 4, 'Reg8C08074', 'Poblacion ', 'Poblacion Zone 19', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(522, 4, 'Reg8C08075', 'Poblacion ', 'Poblacion Zone 20', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(523, 4, 'Reg8C08076', 'Poblacion ', 'Poblacion Zone 21', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(524, 4, 'Reg8C08077', 'Poblacion ', 'Poblacion Zone 22', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(525, 4, 'Reg8C08078', 'Poblacion ', 'Poblacion Zone 23', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(526, 4, 'Reg8C08079', 'Pomponan', 'Pomponan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(527, 4, 'Reg8C08080', 'Punta', 'Punta', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(528, 4, 'Reg8C08081', 'Sabang', 'Sabang', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(529, 4, 'Reg8C08082', 'Sapa', 'Sapa', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(530, 4, 'Reg8C08083', 'San Agusti', 'San Agustin', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(531, 4, 'Reg8C08084', 'San Isidro', 'San Isidro', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(532, 4, 'Reg8C08085', 'San Juan', 'San Juan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(533, 4, 'Reg8C08086', 'Sta. Cruz', 'Sta. Cruz', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(534, 4, 'Reg8C08087', 'Sto. Rosar', 'Sto. Rosario', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(535, 4, 'Reg8C08088', 'Villa Mag-', 'Villa Mag-aso', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(536, 4, 'Reg8C08089', 'Villa Soli', 'Villa Solidaridad', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(537, 4, 'Reg8C08090', 'Zacarito', 'Zacarito', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(538, 3, 'Reg8C09', 'Calubian', 'Calubian', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(539, 3, 'Reg8C10', 'Capoocan', 'Capoocan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(540, 3, 'Reg8C11', 'Carigara', 'Carigara', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(541, 4, 'Reg8C11001', 'Balilit', 'Balilit', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(542, 4, 'Reg8C11002', 'Barayong', 'Barayong', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(543, 4, 'Reg8C11003', 'BarCentral', 'BarugohaCentral', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(544, 4, 'Reg8C11004', 'BarNorte', 'Barugohay Norte', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(545, 4, 'Reg8C11005', 'BarugohSur', 'Barugohay Sur', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(546, 4, 'Reg8C11006', 'Baybay-Pob', 'Baybay (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(547, 4, 'Reg8C11007', 'Binibihan', 'Binibihan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(548, 4, 'Reg8C11008', 'Bislig', 'Bislig', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(549, 4, 'Reg8C11009', 'Caghalo', 'Caghalo', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(550, 4, 'Reg8C11010', 'Camansi', 'Camansi', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(551, 4, 'Reg8C11011', 'Canal', 'Canal', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(552, 4, 'Reg8C11012', 'Candigahub', 'Candigahub', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(553, 4, 'Reg8C11013', 'Canlampay', 'Canlampay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(554, 4, 'Reg8C11014', 'Cogon', 'Cogon', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(555, 4, 'Reg8C11015', 'Cutay', 'Cutay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(556, 4, 'Reg8C11016', 'EstVisoria', 'East Visoria', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(557, 4, 'Reg8C11017', 'GuindEast', 'Guindapunan East', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(558, 4, 'Reg8C11018', 'GuindWest', 'Guindapunan West', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(559, 4, 'Reg8C11019', 'Hiluctogan', 'Hiluctogan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(560, 4, 'Reg8C11020', 'JugabanPob', 'Jugaban (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(561, 4, 'Reg8C11021', 'Libo', 'Libo', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(562, 4, 'Reg8C11022', 'LwrHiraan', 'Lower Hiraan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(563, 4, 'Reg8C11023', 'LowerSogod', 'Lower Sogod', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(564, 4, 'Reg8C11024', 'Macalpi', 'Macalpi', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(565, 4, 'Reg8C11025', 'Manloy', 'Manloy', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(566, 4, 'Reg8C11026', 'Nauguisan', 'Nauguisan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(567, 4, 'Reg8C11027', 'Pangna', 'Pangna', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(568, 4, 'Reg8C11028', 'Parag-um', 'Parag-um', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(569, 4, 'Reg8C11029', 'Parina', 'Parina', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(570, 4, 'Reg8C11030', 'Piloro', 'Piloro', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(571, 4, 'Reg8C11031', 'PonongPob', 'Ponong (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(572, 4, 'Reg8C11032', 'Sagkahan', 'Sagkahan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(573, 4, 'Reg8C11033', 'SanMateoP', 'San Mateo (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(574, 4, 'Reg8C11034', 'Santa Fe', 'Santa Fe', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(575, 4, 'Reg8C11035', 'SawangPob', 'Sawang (Pob.)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(576, 4, 'Reg8C11036', 'Tagak', 'Tagak', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(577, 4, 'Reg8C11037', 'Tangnan', 'Tangnan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(578, 4, 'Reg8C11038', 'Tigbao', 'Tigbao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(579, 4, 'Reg8C11039', 'Tinaguban', 'Tinaguban', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(580, 4, 'Reg8C11040', 'UpHiraan', 'Upper Hiraan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(581, 4, 'Reg8C11041', 'UpperSogod', 'Upper Sogod', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(582, 4, 'Reg8C11042', 'Uyawan', 'Uyawan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(583, 4, 'Reg8C11043', 'WstVisoria', 'West Visoria', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(584, 4, 'Reg8C11044', 'Paglaum', 'Paglaum', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(585, 4, 'Reg8C11045', 'San Juan', 'San Juan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(586, 4, 'Reg8C11046', 'BagLipunan', 'Bagong Lipunan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(587, 4, 'Reg8C11047', 'Canfabi', 'Canfabi', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(588, 4, 'Reg8C11048', 'RizalEast', 'Rizal (Tagak East)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(589, 4, 'Reg8C11049', 'San Isidro', 'San Isidro', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(590, 3, 'Reg8C12', 'Dagami', 'Dagami', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(591, 3, 'Reg8C13', 'Dulag', 'Dulag', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(592, 4, 'Reg8C13001', 'Alegre', 'Alegre', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(593, 4, 'Reg8C13002', 'Arado', 'Arado', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(594, 4, 'Reg8C13003', 'Bulod', 'Bulod', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(595, 4, 'Reg8C13004', 'Batug', 'Batug', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(596, 4, 'Reg8C13005', 'Bolongtoha', 'Bolongtohan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(597, 4, 'Reg8C13006', 'Cabacu', 'Cabacungan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(598, 4, 'Reg8C13007', 'Cabarasan', 'Cabarasan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(599, 4, 'Reg8C13008', 'Cabato-an', 'Cabato-an', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(600, 4, 'Reg8C13009', 'Calipayan', 'Calipayan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(601, 4, 'Reg8C13010', 'CalubianDu', 'Calubian', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(602, 4, 'Reg8C13011', 'Camitoc', 'Camitoc', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(603, 4, 'Reg8C13012', 'Camote', 'Camote', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(604, 4, 'Reg8C13013', 'Dacay', 'Dacay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(605, 4, 'Reg8C13014', 'Del Carmen', 'Del Carmen', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(606, 4, 'Reg8C13015', 'Del Pilar', 'Del Pilar', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(607, 4, 'Reg8C13016', 'Fatima', 'Fatima', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(608, 4, 'Reg8C13017', 'Gen. Roxas', 'General Roxas', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(609, 4, 'Reg8C13018', 'Luan', 'Luan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(610, 4, 'Reg8C13019', 'MagsayDul', 'Magsaysay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(611, 4, 'Reg8C13020', 'Maricum', 'Maricum', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(612, 4, 'Reg8C13021', 'PobBarbo', 'Pob. Barbo', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(613, 4, 'Reg8C13022', 'PobBuntay', 'Pob. Buntay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(614, 4, 'Reg8C13023', 'PobCambula', 'Pob. Cambula', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(615, 4, 'Reg8C13024', 'PobCandao', 'Pob. Candao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(616, 4, 'Reg8C13025', 'PobCatmona', 'Pob. Catmonan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(617, 4, 'Reg8C13026', 'PobCombis', 'Pob.Combis', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(618, 4, 'Reg8C13027', 'PobHighway', 'Pob. Highway', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(619, 4, 'Reg8C13028', 'PobMarket', 'Pob. Market Site', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(620, 4, 'Reg8C13029', 'PobSanMgl', 'Pob. San Miguel', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(621, 4, 'Reg8C13030', 'PobSerrano', 'Pob. Serrano', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(622, 4, 'Reg8C13031', 'PobSungi', 'Pob. Sungi', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(623, 4, 'Reg8C13032', 'Rawis', 'Rawis', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(624, 4, 'Reg8C13033', 'Riz', 'Rizal', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(625, 4, 'Reg8C13034', 'Romualdes', 'Romualdes', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(626, 4, 'Reg8C13035', 'Sabang Dag', 'Sabang Daguitan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(627, 4, 'Reg8C13036', 'Salvacion', 'Salvacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(628, 4, 'Reg8C13037', 'San Agusti', 'San Agustin', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(629, 4, 'Reg8C13038', 'SanAnt', 'San Antonio', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(630, 4, 'Reg8C13039', 'SanIsdro', 'San Isidro', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(631, 4, 'Reg8C13040', 'San Hose', 'San Hose', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(632, 4, 'Reg8C13041', 'SaRaf', 'San Rafael', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(633, 4, 'Reg8C13042', 'San Vicent', 'San Vicente', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(634, 4, 'Reg8C13043', 'Tabu', 'Tabu', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(635, 4, 'Reg8C13044', 'Tigbao', 'Tigbao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(636, 4, 'Reg8C13045', 'Victory', 'Victory', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(637, 3, 'Reg8C14', 'Hilongos', 'Hilongos', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(638, 3, 'Reg8C15', 'Hindang', 'Hindang', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(639, 3, 'Reg8C16', 'Inopacan', 'Inopacan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(640, 4, 'Reg8C16001', '', 'Apid', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(641, 4, 'Reg8C16002', '', 'Cabulisan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(642, 4, 'Reg8C16003', '', 'Caminto', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(643, 4, 'Reg8C16004', '', 'Can-angay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(644, 4, 'Reg8C16005', '', 'Caulisihan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(645, 4, 'Reg8C16006', '', 'Conalum', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(646, 4, 'Reg8C16007', '', 'De los Santos (Mahilum)', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(647, 4, 'Reg8C16008', '', 'Esperanza', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(648, 4, 'Reg8C16009', '', 'Guadalupe', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(649, 4, 'Reg8C16010', '', 'Guinsanga-an', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(650, 4, 'Reg8C16011', '', 'Hinabay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(651, 4, 'Reg8C16012', '', 'Jubasan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(652, 4, 'Reg8C16013', '', 'Linao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(653, 4, 'Reg8C16014', '', 'Macagoco', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(654, 4, 'Reg8C16015', '', 'Maljo', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(655, 4, 'Reg8C16016', '', 'Marao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(656, 4, 'Reg8C16017', '', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(657, 4, 'Reg8C16018', '', 'Tahud', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(658, 4, 'Reg8C16019', '', 'Taotaon', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(659, 4, 'Reg8C16020', '', 'Tinago', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(660, 3, 'Reg8C17', 'Isabel', 'Isabel', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(661, 3, 'Reg8C18', 'Jaro', 'Jaro', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(662, 3, 'Reg8C19', 'Javier', 'Javier', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(663, 3, 'Reg8C20', 'Julita', 'Julita', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(664, 3, 'Reg8C21', 'Kananga', 'Kananga', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(665, 3, 'Reg8C22', 'La Paz', 'La Paz', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(666, 3, 'Reg8C23', 'LeyteLeyte', 'Leyte', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(667, 3, 'Reg8C24', 'McArthurLe', 'McArthur', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(668, 3, 'Reg8C25', 'Mahaplag', 'Mahaplag', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(669, 3, 'Reg8C26', 'Matag-ob', 'Matag-ob', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(670, 3, 'Reg8C27', 'Matalom', 'Matalom', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(671, 3, 'Reg8C28', 'Mayorga', 'Mayorga', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(672, 4, 'Reg8C28001', 'ABonifacio', 'A.Bonifacio', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(673, 4, 'Reg8C28002', 'Mabini', 'Mabini', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(674, 4, 'Reg8C28003', 'Burgos', 'Burgos', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(675, 4, 'Reg8C28004', 'Calipayan', 'Calipayan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(676, 4, 'Reg8C28005', 'Camansi', 'Camansi', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(677, 4, 'Reg8C28006', 'Gen.ALuna', 'Gen.ALuna', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(678, 4, 'Reg8C28007', 'Liberty', 'Liberty', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(679, 4, 'Reg8C28008', 'Ormocay', 'Ormocay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(680, 4, 'Reg8C28009', 'Pob.Zone 1', 'Pob.Zone 1', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(681, 4, 'Reg8C28010', 'Pob.Zone 2', 'Pob.Zone 2', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(682, 4, 'Reg8C28011', 'Pob.Zone 3', 'Pob.Zone 3', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(683, 4, 'Reg8C28012', 'San Roque', 'San Roque', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(684, 4, 'Reg8C28013', 'Santa Cruz', 'Santa Cruz', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(685, 4, 'Reg8C28014', 'Talisay', 'Talisay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(686, 4, 'Reg8C28015', 'Union', 'Union', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(687, 4, 'Reg8C28016', 'Wilson', 'Wilson', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(688, 3, 'Reg8C29', 'Merida', 'Merida', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(689, 3, 'Reg8C30', 'OrmocCity', 'Ormoc City', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(690, 3, 'Reg8C31', 'PaloLeyte', 'Palo', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(691, 3, 'Reg8C32', 'Palompon', 'Palompon', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(692, 3, 'Reg8C33', 'Pastrana', 'Pastrana', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(693, 3, 'Reg8C34', 'SnIsidroLe', 'San Isidro', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(694, 3, 'Reg8C35', 'SnMiguelLe', 'San Miguel', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(695, 3, 'Reg8C36', 'StaFeLeyte', 'Santa Fe', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(696, 3, 'Reg8C37', 'Tabango', 'Tabango', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(697, 3, 'Reg8C38', 'Tabontabon', 'Tabontabon', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(698, 3, 'Reg8C39', 'Tacloban', 'Tacloban City', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(699, 4, 'Reg8C39001', 'Brgy 001', 'Brgy001 Libertad', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(700, 4, 'Reg8C39002', 'Brgy 004', 'Brgy004 Libertad', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(701, 4, 'Reg8C39003', 'Brgy 003', 'Brgy003 Nula-tula', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(702, 4, 'Reg8C39004', 'Brgy 003-A', 'Brgy003-A Nula-tula', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(703, 4, 'Reg8C39005', 'Brgy 100', 'Brgy100 San Roque', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(704, 4, 'Reg8C39006', 'Brgy 101', 'Brgy101 New Kawayan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(705, 4, 'Reg8C39007', 'Brgy 102', 'Brgy102 Old Kawayan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(706, 4, 'Reg8C39008', 'Brgy 103', 'Brgy103 Palanog', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(707, 4, 'Reg8C39009', 'Brgy 103-A', 'Brgy103-A San Paglaum', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(708, 4, 'Reg8C39010', 'Brgy 104', 'Brgy104 Salvacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(709, 4, 'Reg8C39011', 'Brgy 105', 'Brgy105 Suhi', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(710, 4, 'Reg8C39012', 'Brgy 106', 'Brgy106 Santo Niño', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(711, 4, 'Reg8C39013', 'Brgy 108', 'Brgy108 Tagapuro', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(712, 4, 'Reg8C39014', 'Brgy 55', 'Brgy 55 El Reposo', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(713, 4, 'Reg8C39015', 'Brgy 59', 'Brgy 59 Picas Sagkahan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(714, 4, 'Reg8C39016', 'Brgy 66', 'Brgy 66 Anibong', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(715, 4, 'Reg8C39017', 'Brgy 67', 'Brgy 66 Anibong', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(716, 4, 'Reg8C39018', 'Brgy 68', 'Brgy 66 Anibong', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(717, 4, 'Reg8C39019', 'Brgy 62', 'Brgy 62  Sagkahan Bliss', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(718, 4, 'Reg8C39020', 'Brgy 62A', 'Brgy 62A Sagkahan Saging', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(719, 4, 'Reg8C39021', 'Brgy 62B', 'Brgy 62B Sagkahan Picas', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(720, 4, 'Reg8C39022', 'Brgy 63', 'Brgy 63 Sagkahan Mangga', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(721, 4, 'Reg8C39023', 'Brgy 63', 'Brgy 63 Sag. Pleasanvill', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(722, 4, 'Reg8C39024', 'Brgy 63', 'Brgy 63 Sag. Mahayahay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(723, 4, 'Reg8C39025', 'Brgy 74', 'Brgy 74 Lower Nulatula', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(724, 4, 'Reg8C39026', 'Brgy 75', 'Brgy 75 Fatima Village', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(725, 4, 'Reg8C39027', 'Brgy 76', 'Brgy 76 Fatima Village', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(726, 4, 'Reg8C39028', 'Brgy 77', 'Brgy 77 Fatima Village', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(727, 4, 'Reg8C39029', 'Brgy 78', 'Brgy 78 Marasbaras', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(728, 4, 'Reg8C39030', 'Brgy 79', 'Brgy 79 Marasbaras', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(729, 4, 'Reg8C39031', 'Brgy 80', 'Brgy 80 Marasbaras', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(730, 4, 'Reg8C39032', 'Brgy 81', 'Brgy 81 Marasbaras', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(731, 4, 'Reg8C39033', 'Brgy 82', 'Brgy 82 Marasbaras', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(732, 4, 'Reg8C39034', 'Brgy 83', 'Brgy 83 San Jose', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(733, 4, 'Reg8C39035', 'Brgy 83-A', 'Brgy 83-A San Jose', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(734, 4, 'Reg8C39036', 'Brgy 84', 'Brgy 84 San Jose', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(735, 4, 'Reg8C39037', 'Brgy 85', 'Brgy 85 San Jose', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(736, 4, 'Reg8C39038', 'Brgy 86', 'Brgy 86 San Jose', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(737, 4, 'Reg8C39039', 'Brgy 90', 'Brgy 90 San Jose', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(738, 4, 'Reg8C39040', 'Brgy 91', 'Brgy 91 Abucay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(739, 4, 'Reg8C39041', 'Brgy 92', 'Brgy 92 Apitong', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(740, 4, 'Reg8C39042', 'Brgy 93', 'Brgy 93 Bagacay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(741, 4, 'Reg8C39043', 'Brgy 94', 'Brgy 94 Tigbao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(742, 4, 'Reg8C39044', 'Brgy 95', 'Brgy 95 Caibaan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(743, 4, 'Reg8C39045', 'Brgy 96', 'Brgy 96 Calanipawan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(744, 4, 'Reg8C39046', 'Brgy 97', 'Brgy 97 Cabalawan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(745, 4, 'Reg8C39047', 'Brgy 98', 'Brgy 98 Camansinay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(746, 4, 'Reg8C39048', 'Brgy 99', 'Brgy 99 Diit', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(747, 4, 'Reg8C39049', 'Brgy 109', 'Brgy 109 V&G Subd.', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(748, 4, 'Reg8C39050', 'Brgy 109-A', 'Brgy 109-A V&G Subd.', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(749, 4, 'Reg8C39051', 'Brgy 110', 'Brgy 110 Utap', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(750, 4, 'Reg8C39052', 'Brgy 83-C', 'Brgy 83-C San Jose', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(751, 4, 'Reg8C39053', 'Brgy 95-A', 'Brgy 95-A Caibaan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(752, 4, 'Reg8C39054', 'Brgy 87', 'Brgy 87 San Jose', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(753, 4, 'Reg8C39055', 'Brgy 89', 'Brgy 89 Baybay,San Jose', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(754, 4, 'Reg8C39056', 'Brgy 88', 'Brgy 88 San Jose', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(755, 3, 'Reg8C40', 'Tanauan', 'Tanauan', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(756, 3, 'Reg8C41', 'Tolosa', 'Tolosa', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(757, 4, 'Reg8C41001', 'Burak', 'Burak', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(758, 4, 'Reg8C41002', 'Canmogsay', 'Canmogsay', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(759, 4, 'Reg8C41003', 'Cantariwis', 'Cantariwis', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(760, 4, 'Reg8C41004', 'Capangih', 'Capangihanv', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(761, 4, 'Reg8C41005', 'DoñaBrig', 'Doña Brigida', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(762, 4, 'Reg8C41006', 'Imelda', 'Imelda', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(763, 4, 'Reg8C41007', 'Malbog', 'Malbog', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(764, 4, 'Reg8C41008', 'Olot', 'Olot', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(765, 4, 'Reg8C41009', 'Opong', 'Opong', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(766, 4, 'Reg8C41010', 'Poblacion', 'Poblacion', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(767, 4, 'Reg8C41011', 'Quilao', 'Quilao', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(768, 4, 'Reg8C41012', 'San Roque', 'San Roque', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(769, 4, 'Reg8C41013', 'SanVicente', 'San Vicente', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(770, 4, 'Reg8C41014', 'Tanghas', 'Tanghas', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(771, 4, 'Reg8C41015', 'Telegrafo', 'Telegrafo', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(772, 3, 'Reg8C42', 'Tunga', 'Tunga', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(773, 3, 'Reg8C43', 'Villaba', 'Villaba', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(774, 2, 'Reg8D', 'NorthSamar', 'Northern Samar', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(775, 2, 'Reg8E', 'Samar', 'Samar', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52'),
(776, 2, 'Reg8F', 'SoLeyte', 'Southern Leyte', '000000', '2024-09-11 00:05:52', '2024-09-11 00:05:52');

-- --------------------------------------------------------

--
-- Table structure for table `_savings_bal_req`
--

DROP TABLE IF EXISTS `_savings_bal_req`;
CREATE TABLE IF NOT EXISTS `_savings_bal_req` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maintaining` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `to_earn_int` varchar(10) NOT NULL,
  `opening_deposit` varchar(10) NOT NULL,
  `product_type_code` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `_savings_bal_req`
--

INSERT INTO `_savings_bal_req` (`id`, `maintaining`, `to_earn_int`, `opening_deposit`, `product_type_code`) VALUES
(1, '100', '5000', '200', '51'),
(2, '100', '5000', '200', '52');

-- --------------------------------------------------------

--
-- Table structure for table `_savings_rules`
--

DROP TABLE IF EXISTS `_savings_rules`;
CREATE TABLE IF NOT EXISTS `_savings_rules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rules` text NOT NULL,
  `product_type_code` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `_savings_rules`
--

INSERT INTO `_savings_rules` (`id`, `rules`, `product_type_code`) VALUES
(1, 'No Interest on UC Chqs', '51'),
(2, 'No-book deposit allowed', '51'),
(3, 'No Acrlnt when Closed', '51'),
(4, 'No-book Dep/Wdl allowed', '51'),
(5, 'Passbook Maintained', '51'),
(6, 'Dormant Acc are charged', '51'),
(7, 'Withdrawals are allowed', '51'),
(8, 'No Interest on UC Chqs', '52'),
(9, 'No-book deposit allowed', '52'),
(10, 'No Acrlnt when Closed', '52'),
(11, 'No-book Dep/Wdl allowed', '52'),
(12, 'Passbook Maintained', '52'),
(13, 'Dormant Acc are charged', '52'),
(14, 'Withdrawals are allowed', '52'),
(15, 'Charge ledger fee', '52'),
(16, 'No interest on hold', '52');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
