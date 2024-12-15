-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th12 15, 2024 lúc 10:07 AM
-- Phiên bản máy phục vụ: 8.2.0
-- Phiên bản PHP: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `sportsshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` bigint UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_customer_id_foreign` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(14, 'default', '{\"uuid\":\"468482f7-8684-40f6-8d54-00cc16b9b0d8\",\"displayName\":\"App\\\\Jobs\\\\SendMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMail\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\SendMail\\\":2:{s:8:\\\"\\u0000*\\u0000email\\\";s:19:\\\"ghieuvt12@gmail.com\\\";s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2024-12-15 02:56:33.912226\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}}\"}}', 0, NULL, 1734231393, 1734231391),
(15, 'default', '{\"uuid\":\"ccb22832-5365-44dc-8b11-5d1486e347b8\",\"displayName\":\"App\\\\Jobs\\\\SendMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMail\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\SendMail\\\":2:{s:8:\\\"\\u0000*\\u0000email\\\";s:19:\\\"hhieuvt17@gmail.com\\\";s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2024-12-15 02:56:55.719172\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}}\"}}', 0, NULL, 1734231415, 1734231413),
(16, 'default', '{\"uuid\":\"6a00021b-ee25-412c-9f41-ba046ee0d3d7\",\"displayName\":\"App\\\\Jobs\\\\SendMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMail\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\SendMail\\\":2:{s:8:\\\"\\u0000*\\u0000email\\\";s:29:\\\"dh52110899@student.stu.edu.vn\\\";s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2024-12-15 02:57:33.854296\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}}\"}}', 0, NULL, 1734231453, 1734231451),
(17, 'default', '{\"uuid\":\"23cf9297-f495-464e-a36a-85bd36a4be67\",\"displayName\":\"App\\\\Jobs\\\\SendMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMail\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\SendMail\\\":2:{s:8:\\\"\\u0000*\\u0000email\\\";s:18:\\\"hieu@localhost.com\\\";s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2024-12-15 03:03:56.119760\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}}\"}}', 0, NULL, 1734231836, 1734231834),
(18, 'default', '{\"uuid\":\"2e09085d-4582-4355-afa7-8ee0e7f471c7\",\"displayName\":\"App\\\\Jobs\\\\SendMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMail\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\SendMail\\\":2:{s:8:\\\"\\u0000*\\u0000email\\\";s:17:\\\"ghasc12@gmail.com\\\";s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2024-12-15 03:08:41.047787\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}}\"}}', 0, NULL, 1734232121, 1734232119),
(13, 'default', '{\"uuid\":\"7adf6fe8-5cf2-465a-a8e6-dfdd960425ea\",\"displayName\":\"App\\\\Jobs\\\\SendMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMail\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\SendMail\\\":2:{s:8:\\\"\\u0000*\\u0000email\\\";s:19:\\\"ghieuvt12@gmail.com\\\";s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2024-12-15 02:52:30.781534\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}}\"}}', 0, NULL, 1734231150, 1734231150),
(19, 'default', '{\"uuid\":\"d434b854-6d15-4314-9cff-b449c38483b1\",\"displayName\":\"App\\\\Jobs\\\\SendMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMail\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\SendMail\\\":2:{s:8:\\\"\\u0000*\\u0000email\\\";s:32:\\\"halsellmckennail1807@hotmail.com\\\";s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2024-12-15 03:15:33.237624\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}}\"}}', 0, NULL, 1734232533, 1734232531),
(20, 'default', '{\"uuid\":\"6f55dc63-da0e-4d25-95a5-2ea399908051\",\"displayName\":\"App\\\\Jobs\\\\SendMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMail\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\SendMail\\\":2:{s:8:\\\"\\u0000*\\u0000email\\\";s:28:\\\"cv3413434@student.stu.edu.vn\\\";s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2024-12-15 04:28:14.807771\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}}\"}}', 0, NULL, 1734236894, 1734236892),
(21, 'default', '{\"uuid\":\"f8afd914-ab33-4455-ac56-effb932b3fb8\",\"displayName\":\"App\\\\Jobs\\\\SendMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMail\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\SendMail\\\":2:{s:8:\\\"\\u0000*\\u0000email\\\";s:19:\\\"ghieuvt12@gmail.com\\\";s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2024-12-15 04:32:03.505701\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}}\"}}', 0, NULL, 1734237123, 1734237121);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb3_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `parent_id` int NOT NULL,
  `active` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menus`
--

INSERT INTO `menus` (`id`, `name`, `parent_id`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Phụ kiện thể thao', 0, 1, '2024-12-01 01:12:36', '2024-12-01 01:12:36'),
(2, 'Giày thể thao', 0, 1, '2024-12-01 01:12:42', '2024-12-01 01:12:42'),
(3, 'Quần áo thể thao', 0, 1, '2024-12-01 01:12:45', '2024-12-01 01:12:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_10_22_170916_create_personal_access_tokens_table', 1),
(5, '2024_11_03_134511_create_menus_table', 2),
(6, '2024_11_10_174536_add_column_name_to_table_name', 3),
(7, '2024_11_10_175013_delete_column_name_to_table_name', 4),
(9, '2024_11_13_070950_create_products_table', 5),
(12, '2024_11_20_044309_create_sliders_table', 6),
(13, '2024_11_22_172702_create_personal_access_tokens_table', 1),
(14, '2024_11_30_101616_drop', 7),
(15, '2024_11_30_103029_drop2', 8),
(16, '2024_11_22_172702_create_personal_access_tokens_table', 1),
(17, '2024_11_03_134511_create_menusz_table', 9),
(18, '2024_11_30_104850_che', 10),
(19, '2024_11_30_105004_menus', 11),
(20, '2024_12_01_063252_products', 12),
(21, '2024_12_01_064748_del', 13),
(22, '2024_12_01_064851_products', 14),
(23, '2024_12_01_071113_xoa', 15),
(24, '2024_12_01_071452_menus', 16),
(25, '2024_12_01_080820_xo', 17),
(26, '2024_12_01_080901_menus', 18),
(27, '2024_12_01_083923_xo', 19),
(28, '2024_12_01_084019_products', 19),
(29, '2024_12_01_085513_xo', 20),
(30, '2024_12_01_085621_xo', 21),
(31, '2024_12_01_085718_products', 22),
(32, '2024_12_01_094109_xoa', 23),
(33, '2024_12_01_094203_products', 24),
(34, '2024_12_01_101522_xo', 25),
(35, '2024_12_01_101601_products', 26),
(36, '2024_12_01_111502_xo', 27),
(37, '2024_12_01_124323_xo', 28),
(38, '2024_12_01_124456_products', 29),
(39, '2024_12_04_035340_create_customers_table', 30),
(40, '2024_12_13_042524_create_carts_table', 31),
(41, '2024_12_13_042635_del', 31),
(42, '2024_12_13_042844_dele', 32),
(43, '2024_12_13_043125_customer', 33),
(44, '2024_12_13_043200_carts', 34),
(45, '2024_12_13_154103_del', 35),
(46, '2024_12_13_154206_customers', 36);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb3_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `menu_id` int NOT NULL,
  `price` int DEFAULT NULL,
  `price_sale` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `size` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `content`, `menu_id`, `price`, `price_sale`, `quantity`, `size`, `thumb`, `created_at`, `updated_at`) VALUES
(1, 'Áo đấu manchester United', 'q', '<p>q</p>', 3, 2200000, 1800000, 20, '', '/storage/uploads/2024/12/01/Home_Mu_24_25.avif', '2024-12-01 06:18:55', '2024-12-01 06:18:55'),
(2, 'Áo sân nhà Real Madrid 24/25', 't', '<p>t</p>', 3, 2000000, 1900000, 3, '', '/storage/uploads/2024/12/01/Home_Real_24_25.avif', '2024-12-01 06:19:37', '2024-12-01 06:19:37'),
(3, 'Áo sân nhà Spain 24/25', 'i', '<p>i</p>', 3, 2100000, 2000000, 6, '', '/storage/uploads/2024/12/01/Home_Spain_24_25.avif', '2024-12-01 06:20:15', '2024-12-01 06:20:15'),
(4, 'Jacket Arsenal Blue', 'r', '<p>r</p>', 3, 1200000, 1100000, 7, '', '/storage/uploads/2024/12/01/Jacket_Ars_24_25.avif', '2024-12-01 06:20:54', '2024-12-01 06:20:54'),
(5, 'Áo Jersey David Beckham', 'v', '<p>v</p>', 3, 1700000, 1400000, 10, '', '/storage/uploads/2024/12/01/Jersey_DB.avif', '2024-12-01 06:21:53', '2024-12-01 06:21:53'),
(6, 'Áo Jersey Tập Luyện Manchester United Tiro 24', 'q', '<p>q</p>', 3, 1100000, 1000000, 20, '', '/storage/uploads/2024/12/01/Jersey_Mu_tiro_24.avif', '2024-11-30 23:18:55', '2024-11-30 23:18:55'),
(7, 'Áo Thun Graphic Football Kicks', 't', '<p>t</p>', 3, 800000, 800000, 3, '', '/storage/uploads/2024/12/01/Graphic_football_kicks.avif', '2024-11-30 23:19:37', '2024-11-30 23:19:37'),
(8, 'Áo Thun Originals Arsenal', 'i', '<p>i</p>', 3, 1000000, 1000000, 6, '', '/storage/uploads/2024/12/01/Originals_Arsenal.avif', '2024-11-30 23:20:15', '2024-11-30 23:20:15'),
(9, 'Quần Short Tập Luyện Tiro 24 Competition', 'r', '<p>r</p>', 3, 700000, 700000, 7, '', '/storage/uploads/2024/12/01/Quan_Short_tiro24.avif', '2024-11-30 23:20:54', '2024-11-30 23:20:54'),
(10, 'Áo Đấu Sân Nhà Đội Tuyển Argentina 24', 'v', '<p>v</p>', 3, 2200000, 2200000, 10, '', '/storage/uploads/2024/12/01/Arg_home_24.avif', '2024-11-30 23:21:53', '2024-11-30 23:21:53'),
(11, 'Quần Manchester United Stone Roses Originals', 'q', '<p>q</p>', 3, 1100000, 1000000, 20, '', '/storage/uploads/2024/12/01/Quan_mu_sro.avif', '2024-11-30 23:18:55', '2024-11-30 23:18:55'),
(12, 'Áo Thun Football Category Logo', 't', '<p>t</p>', 3, 525000, 525000, 3, '', '/storage/uploads/2024/12/01/Ao_Thun_FCL.avif', '2024-11-30 23:19:37', '2024-11-30 23:19:37'),
(13, 'Quần Short Tiro 24', 'i', '<p>i</p>', 3, 2100000, 2000000, 6, '', '/storage/uploads/2024/12/01/Quan_tiro24.avif', '2024-11-30 23:20:15', '2024-11-30 23:20:15'),
(14, 'Áo Đấu Sân Nhà Jamaica 23', 'r', '<p>r</p>', 3, 2200000, 2200000, 7, '', '/storage/uploads/2024/12/01/Jamaica_home_23.avif', '2024-11-30 23:20:54', '2024-11-30 23:20:54'),
(15, 'Quần Ba Lá Essentials Manchester United', 'v', '<p>v</p>', 3, 800000, 800000, 10, '', '/storage/uploads/2024/12/01/Quan_Essentials_MU.avif', '2024-11-30 23:21:53', '2024-11-30 23:21:53'),
(16, 'Áo Đấu Fortore 23', 'q', '<p>q</p>', 3, 2200000, 1800000, 20, '', '/storage/uploads/2024/12/01/Ao_Fortore_23.avif', '2024-11-30 23:18:55', '2024-11-30 23:18:55'),
(17, 'Quần Short Fortore 23', 't', '<p>t</p>', 3, 500000, 500000, 3, '', '/storage/uploads/2024/12/01/Quan_short_fortore.avif', '2024-11-30 23:19:37', '2024-11-30 23:19:37'),
(18, 'Áo đấu Paris Saint-Germain 24/25', 'i', '<p>i</p>', 3, 2100000, 2100000, 6, '', '/storage/uploads/2024/12/01/home_psg_24.jpg', '2024-11-30 23:20:15', '2024-11-30 23:20:15'),
(19, 'Áo đấu FC Chelsea 24/25', 'r', '<p>r</p>', 3, 2000000, 2000000, 7, '', '/storage/uploads/2024/12/01/home_chel_24.jpg', '2024-11-30 23:20:54', '2024-11-30 23:20:54'),
(20, 'Áo Bóng Chuyền Nam Kamito Blocker', 'v', '<p>v</p>', 3, 1700000, 1400000, 10, '', '/storage/uploads/2024/12/01/Ao_bong_chuyen_blocker_kamito.webp', '2024-11-30 23:21:53', '2024-11-30 23:21:53'),
(21, 'Bộ quần áo bóng đá trẻ em YATU031-3V', 'q', '<p>q</p>', 3, 2200000, 1800000, 20, '', '/storage/uploads/2024/12/01/bo_bong_da_tre_em_yuta031.webp', '2024-11-30 23:18:55', '2024-11-30 23:18:55'),
(22, 'Bộ Cầu Lông Kamito Smash Nữ', 't', '<p>t</p>', 3, 279000, 279000, 3, '', '/storage/uploads/2024/12/01/bo_cau_long_kamito_smash_nu.webp', '2024-11-30 23:19:37', '2024-11-30 23:19:37'),
(23, 'Áo cầu lông TM Legend Nam', 'i', '<p>i</p>', 3, 2100000, 2000000, 6, '', '/storage/uploads/2024/12/01/ao_cau_long_tm_nam.webp', '2024-11-30 23:20:15', '2024-11-30 23:20:15'),
(24, 'Áo Track Top Firebird Dáng Suông Classics Adicolor', 'r', '<p>r</p>', 3, 1615000, 1615000, 7, '', '/storage/uploads/2024/12/01/Ao_ao_track_top_classic.avif', '2024-11-30 23:20:54', '2024-11-30 23:20:54'),
(25, 'Áo Putty Mauve Golf', 'v', '<p>v</p>', 3, 1700000, 1400000, 10, '', '/storage/uploads/2024/12/01/w_cla_moc_golf.avif', '2024-11-30 23:21:53', '2024-11-30 23:21:53'),
(26, 'Áo Bralette Thun Gân Hyperglam', 'q', '<p>q</p>', 3, 900000, 900000, 20, '', '/storage/uploads/2024/12/01/ao_bralette_thun.avif', '2024-11-30 23:18:55', '2024-11-30 23:18:55'),
(27, 'Áo Gió Hyperglam WIND.RDY', 't', '<p>t</p>', 3, 2000000, 2000000, 3, '', '/storage/uploads/2024/12/01/ao_gio_winddry.avif', '2024-11-30 23:19:37', '2024-11-30 23:19:37'),
(28, 'Quần Short Anthony Edwards 1 Foundation', 'i', '<p>i</p>', 3, 700000, 700000, 6, '', '/storage/uploads/2024/12/01/quan_short_antony.avif', '2024-11-30 23:20:15', '2024-11-30 23:20:15'),
(29, 'Áo Jersey Tập Luyện Messi Trẻ Em', 'r', '<p>r</p>', 3, 700000, 700000, 7, '', '/storage/uploads/2024/12/01/ao_jersey_messi_kids.avif', '2024-11-30 23:20:54', '2024-11-30 23:20:54'),
(30, 'Áo Thun Phủ Họa Tiết Rằn Ri Train Essentials', 'v', '<p>v</p>', 3, 850000, 850000, 10, '', '/storage/uploads/2024/12/01/ao_thun_essentials.avif', '2024-11-30 23:21:53', '2024-11-30 23:21:53'),
(31, 'Quần Short Winners Essentials', 'q', '<p>q</p>', 3, 700000, 700000, 20, '', '/storage/uploads/2024/12/01/quan_short_essentials.avif', '2024-11-30 23:18:55', '2024-11-30 23:18:55'),
(32, 'Áo Gió Dệt Thoi City Escape', 't', '<p>t</p>', 3, 2400000, 2400000, 3, '', '/storage/uploads/2024/12/01/ao_gio_thoi_city.avif', '2024-11-30 23:19:37', '2024-11-30 23:19:37'),
(33, 'Áo Sweatshirt adidas Z.N.E.', 'i', '<p>i</p>', 3, 2000000, 2000000, 6, '', '/storage/uploads/2024/12/01/ao_sweatshirt.avif', '2024-11-30 23:20:15', '2024-11-30 23:20:15'),
(34, 'Áo Thun Q3 Atlanta', 'r', '<p>r</p>', 3, 1200000, 1200000, 7, '', '/storage/uploads/2024/12/01/ao_q3_atlanta.avif', '2024-11-30 23:20:54', '2024-11-30 23:20:54'),
(35, 'Áo đấu Brazil 2024', 'v', '<p>v</p>', 3, 2000000, 2000000, 10, '', '/storage/uploads/2024/12/01/home_brazil_2024.jpg', '2024-11-30 23:21:53', '2024-11-30 23:21:53'),
(36, 'Áo đấu USA 2024', 'q', '<p>q</p>', 3, 2200000, 1800000, 20, '', '/storage/uploads/2024/12/01/home_usa_2024.png', '2024-11-30 23:18:55', '2024-11-30 23:18:55'),
(37, 'Áo sân nhà Nigeria 2024', 't', '<p>t</p>', 3, 1800000, 1800000, 3, '', '/storage/uploads/2024/12/01/home_negeria_24.jpg', '2024-11-30 23:19:37', '2024-11-30 23:19:37'),
(38, 'Áo sân nhà England 24/25', 'i', '<p>i</p>', 3, 2000000, 2000000, 6, '', '/storage/uploads/2024/12/01/home_england_24.jpg', '2024-11-30 23:20:15', '2024-11-30 23:20:15'),
(39, 'Áo gió thể thao Tottenham Hotspur', 'r', '<p>r</p>', 3, 1700000, 1100000, 7, '', '/storage/uploads/2024/12/01/jacket_tot.jpg', '2024-11-30 23:20:54', '2024-11-30 23:20:54'),
(40, 'Áo đấu FC Barcelona 24/25', 'v', '<p>v</p>', 3, 2200000, 2200000, 10, '', '/storage/uploads/2024/12/01/home_barca_24.png', '2024-11-30 23:21:53', '2024-11-30 23:21:53'),
(41, 'Giày Gazelle', 'Đôi giày vừa kinh điển lại vừa bắt mắt.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Hãy mang trên mình một phần lịch sử. Kể từ thập niên 60, dòng giày adidas Gazelle iconic đã ghi dấu bởi thiết kế da lộn đơn giản mà thời thượng. Phiên bản này mang thiết kế retro ấy đến với tương lai nhờ đế ngoài dáng cao đầy táo bạo và các điểm nhấn màu sắc rực rỡ.</span></p>', 2, 2900000, 2800000, 10, NULL, '/storage/uploads/2024/12/15/Giay_Gazelle_JQ5977.avif', '2024-12-15 02:23:15', '2024-12-15 02:23:15'),
(42, 'Giày Đá Bóng Firm Ground', 'Đôi giày đá bóng siêu bám giúp bạn ghi bàn chuẩn xác trên sân cỏ tự nhiên, có sử dụng chất liệu tái chế.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Tự tin ra sân với đôi giày đá bóng adidas Predator Elite giúp bạn ghi bàn. Với các vây cao su Strikeskin được bố trí hợp lý và lưỡi gà lật, thân giày HybridTouch linh hoạt giúp bạn chạm bóng hoàn hảo. Đế ngoài Controlframe 2.0 phù hợp với sân cỏ tự nhiên và cổ giày adidas PRIMEKNIT giúp bạn duy trì sự ổn định khi chinh phục mục tiêu. Sản phẩm này có chứa tối thiểu 20% chất liệu tái chế. Bằng cách tái sử dụng các chất liệu đã được tạo ra, chúng tôi góp phần giảm thiểu lãng phí và hạn chế phụ thuộc vào các nguồn tài nguyên hữu hạn, cũng như giảm phát thải từ các sản phẩm mà chúng tôi sản xuất.</span></p>', 2, 6000000, 5000000, 11, NULL, '/storage/uploads/2024/12/15/Giay_Gazelle_JQ5977.avif', '2024-12-15 02:25:03', '2024-12-15 02:25:03'),
(43, 'Giày Chạy Bộ Supernova Rise 2', 'Đôi giày chạy bộ chạy bộ hàng ngày cho cảm giác thoải mái và nâng đỡ.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Bạn đã bắt đầu chạy bộ, và mục tiêu sắp tới của bạn là 5K. Hãy dốc sức tập luyện với đôi giày chạy bộ adidas dành cho chạy bộ hàng ngày này. Giày có đế giữa Dreamstrike+, công nghệ mút foam siêu nhẹ chịu lực của chúng tôi cho cảm giác thoải mái. Các thanh nâng đỡ Support Rod giúp định hướng bàn chân bạn từ lúc chạm đất tới khi nhấc chân, cùng đế ngoài Adiwear cho độ bám chắc chắn trên từng cây số.</span></p>', 2, 3800000, 3500000, 22, NULL, '/storage/uploads/2024/12/15/Giay_Chay_Bo_Supernova_Rise_2_Xam_JI4510_01_00_standard.avif', '2024-12-15 02:26:32', '2024-12-15 02:26:32'),
(44, 'Giày Chạy Bộ Graphic Galaxy 7', 'Đôi giày chạy bộ êm ái có sử dụng chất liệu tái chế.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Dưới chân bạn là đường bê tông hay những đám mây? Đôi giày chạy bộ adidas này mang đến cảm giác mềm mại cho từng sải bước nhờ lớp đệm Cloudfoam. Đôi giày này mang lại cảm giác thoải mái tuyệt đối — từ thân giày thoáng khí tới đế ngoài bằng TPU siêu bám — giúp bạn luôn cảm thấy dễ chịu ở mọi cự ly. Sản phẩm này có chứa tối thiểu 20% chất liệu tái chế. Bằng cách tái sử dụng các chất liệu đã được tạo ra, chúng tôi góp phần giảm thiểu lãng phí và hạn chế phụ thuộc vào các nguồn tài nguyên hữu hạn, cũng như giảm phát thải từ các sản phẩm mà chúng tôi sản xuất.</span></p>', 2, 1800000, 1700000, 5, NULL, '/storage/uploads/2024/12/15/Giay_Chay_Bo_Graphic_Galaxy_7_Hong_JH7861_01_00_standard.avif', '2024-12-15 02:27:47', '2024-12-15 02:27:47'),
(45, 'Giày Vulc Campus', 'Phiên bản tinh tế của phong cách Campus classic.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Là phiên bản cải tiến của thiết kế giày adidas Campus iconic từ cuối những năm 2000, đôi giày này biến hóa phong cách classic ấy bằng thiết kế vulcanized. Thân giày kết hợp chất vải canvas bền chắc và da lộn dày dặn cho phong cách retro, cùng lớp lót bằng vải lưới và gót giày lót đệm tăng cường thoải mái. Phù hợp để mang cả ngày, đôi giày trainer dáng thấp này có thể đồng hành cùng bạn từ giờ học buổi sáng tới buổi tối đi chơi cùng bạn bè.</span></p>', 2, 2100000, 2000000, 9, NULL, '/storage/uploads/2024/12/15/Giay_Vulc_Campus_trang_JI1918.avif', '2024-12-15 02:28:46', '2024-12-15 02:28:46'),
(46, 'Giày Forum Low CL', 'Đôi giày thường ngày dành cho tất cả mọi người, lấy cảm hứng từ biểu tượng bóng rổ thập niên 80.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Giày adidas Forum Low vốn rất được yêu thích kể từ lần đầu ra mắt trên sân bóng rổ vào thập niên 80. Chẳng bao lâu sau, dòng giày này bắt đầu hiện diện trong nền văn hóa, được yêu thích bởi cá tính và tinh thần táo bạo. Phiên bản này tôn vinh di sản ấy với sự kết hợp cao cấp giữa chất liệu da và da lộn. Lớp lót bằng vải thun da cá mềm mại ôm trọn bàn chân đầy thoải mái, cùng đế cupsole bằng cao su cứng cáp mang đến cảm giác ổn định và nâng đỡ suốt ngày dài. Với thiết kế dành cho mọi người và mọi ngày, giày Forum kết hợp giữa kinh điển và hiện đại, đơn giản và táo bạo, nhẹ nhàng và cá tính.</span></p>', 2, 2600000, 2500000, 4, NULL, '/storage/uploads/2024/12/15/Giay_Forum_Low_CL_trang_JI3268.avif', '2024-12-15 02:30:10', '2024-12-15 02:30:10'),
(47, 'Giày adidas Disney Stan Smith Comfort Closure Trẻ Em', 'Đôi giày trainer dễ xỏ dành cho bé yêu thích Chuột Mickey nhà Disney.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Phiên bản mới này của đôi giày tennis Stan Smith huyền thoại đến từ adidas Originals có kích cỡ dành cho các fan nhí. Quai dán giúp bé dễ dàng xỏ và tháo giày, cùng họa tiết graphic hình Mickey và những người bạn nhà Disney mang đến phép màu từ những nhân vật yêu thích của bé. Thân giày bằng da tổng hợp dễ vệ sinh, cùng đế ngoài bằng cao su bám tốt.</span></p>', 2, 1700000, 1600000, 23, NULL, '/storage/uploads/2024/12/15/Giay_adidas_Disney_Stan_Smith_Comfort_Closure_Tre_Em_trang_JH7439.avif', '2024-12-15 02:31:24', '2024-12-15 02:31:24'),
(48, 'Giày Rapidmove ADV 2', 'Đôi giày siêu nhẹ dành cho các bài tập HIIT.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Hãy mang đôi giày tập adidas này và sẵn sàng chinh phục bài tập HIIT. Giày có lớp đệm Lightstrike Pro cho cảm giác siêu nhẹ và đàn hồi. Thân giày bằng vải lưới thoáng khí và nâng đỡ, cùng hệ thống Torsion System tăng cường ổn định giúp bạn luôn thoải mái và tự tin khi suốt buổi tập cường độ cao kết hợp giữa tập thể lực và cardio.</span></p>', 2, 3200000, 3100000, 2, NULL, '/storage/uploads/2024/12/15/Giay_Rapidmove_ADV_2_DJo_JI2058_HM4.avif', '2024-12-15 02:32:38', '2024-12-15 02:32:38'),
(49, 'Giày adidas Switch FWD 2.0', 'Đôi giày chạy bộ tạo chuyển động tiến bước, có sử dụng chất liệu tái chế.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Bất kể chạy bộ, đi bộ hay đi dạo, đôi giày chạy bộ adidas này sẽ giúp bạn đi đúng hướng — về phía trước. Giày có đế giữa bằng chất liệu EVA tích hợp các lỗ rỗng nén chặt và giãn nở dưới áp lực giúp bạn sải bước mượt mà. Thân giày thoáng khí ôm chân thoải mái, cùng đế ngoài bám tốt trên từng sải bước. Sản phẩm này có chứa tối thiểu 20% chất liệu tái chế. Bằng cách tái sử dụng các chất liệu đã được tạo ra, chúng tôi góp phần giảm thiểu lãng phí và hạn chế phụ thuộc vào các nguồn tài nguyên hữu hạn, cũng như giảm phát thải từ các sản phẩm mà chúng tôi sản xuất.</span></p>', 2, 3800000, 3500000, 9, NULL, '/storage/uploads/2024/12/15/Giay_adidas_Switch_FWD_2.0_Be_JI1460_01_00_standard.avif', '2024-12-15 02:33:56', '2024-12-15 02:33:56'),
(50, 'Giày VL Court adidas x Disney Mickey', 'Đôi giày thể thao với họa tiết graphic Chuột Mickey.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Bất kể ở trường học, ở sân chơi hay ở nhà bạn, bé sẽ luôn sẵn sàng vui chơi với đôi giày trẻ em adidas này. Họa tiết graphic hình Chuột Mickey nhà Disney sẽ khiến các fan nhí thích thú. Quai dán bằng da lộn bên trên dây giày co giãn giúp bé nhanh chóng sửa soạn để rời nhà.</span></p>', 2, 1400000, 1200000, 22, NULL, '/storage/uploads/2024/12/15/Giay_VL_Court_adidas_x_Disney_Mickey_Mau_xanh_da_troi_JH6077.avif', '2024-12-15 02:34:57', '2024-12-15 02:34:57'),
(51, 'Giày Chạy Trail Terrex Agravic 3', 'Càn quét cung đường trail.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Trải nghiệm màn kết hợp giữa sự thoải mái, bền bỉ và ổn định. Thân giày thoáng khí giúp đôi chân bạn luôn mát mẻ. Đế giữa Lightstrike nhẹ hơn hoàn toàn mới mang đến sải bước êm ái và linh hoạt, có thể chống chịu lực tác động khi dấn bước trên cung đường trail. Với giày Agravic 3, bạn có thể tự tin chạy bộ trên mọi cung đường địa hình nhờ đế ngoài Continental™ Rubber có đinh 4mm, cho độ bám chắc chắn trong điều kiện khô ráo cũng như ẩm ướt.</span></p>', 2, 3000000, 2000000, 11, NULL, '/storage/uploads/2024/12/15/Giay_Chay_Trail_Terrex_Agravic_3_trang_JI0951_HM5.avif', '2024-12-15 02:36:15', '2024-12-15 02:36:15'),
(52, 'Giày Đinh Liền BOA Codechaos 22', 'Đôi giày golf đinh liền có sử dụng chất liệu tái chế.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Bước ra sân golf, nâng tầm phong cách và tăng cường phong độ. Mọi chi tiết của đôi giày golf đinh liền BOA adidas CODECHAOS22 đều có tính năng riêng. Từ tư thế ổn định nhờ đế ngoài bao bọc tới độ bám hỗ trợ swing nhờ công nghệ Twist Grip và cảm giác trợ lực nhờ đế BOOST toàn phần, đôi giày này tối ưu mọi thứ bạn cần trên sân — bao gồm phong cách. Hệ thống BOA® Fit System giúp bạn tinh chỉnh độ ôm và nâng đỡ chỉ bằng một nút xoay. Hiệu năng tour kết hợp cùng phong cách đỉnh cao.</span></p>', 2, 4400000, 4200000, 1, NULL, '/storage/uploads/2024/12/15/Giay_DJinh_Lien_BOA_Codechaos_22_trang_GX3944.avif', '2024-12-15 02:37:47', '2024-12-15 02:37:47'),
(53, 'Giày Samba XLG', 'Đôi giày Samba iconic với thân giày bằng da lộn và lớp lót bằng da.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Giày adidas Samba XLG đảm bảo thoải mái và ghi điểm phong cách. Được thiết kế từ nhiều thập kỷ trước dưới dạng một mẫu giày bóng đá trong nhà, Samba đã trường tồn cùng thời gian nhờ thiết kế đa năng và iconic. Thân giày cao cấp làm từ da lộn với lớp lót bằng da, cùng lưỡi gà lót đệm và lớp đệm EVA rời. Bất kể dạo phố hay thư giãn tại nhà, đôi giày trainer retro này sẽ mang đến cho bạn cảm giác nâng đỡ và phong cách chỉn chu.</span></p>', 2, 3800000, 3200000, 12, NULL, '/storage/uploads/2024/12/15/Giay_Samba_XLG_mau_xanh_la_JI2582.avif', '2024-12-15 02:39:49', '2024-12-15 02:39:49'),
(54, 'Giày Bóng Rổ Anthony Edwards 1 Mid', 'Đôi giày sneaker signature đến từ adidas Basketball và Anthony Edwards.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Hãy mang giày theo phong cách của một trong những siêu sao mới nổi trong làng bóng rổ. Đôi giày sneaker Signature đến từ adidas Basketball và Anthony Edwards này ra đời dành cho những cầu thủ bóng rổ xuất sắc nhất. Đế giữa kết hợp đệm BOOST và Lightstrike siêu nhẹ và mang đến khả năng hoàn trả năng lượng vượt trội cho những chuyển động bùng nổ nhất. Đế ngoài bằng cao su đảm bảo độ nâng đỡ cần thiết để tấn công rổ, cùng logo Anthony Edwards signature hoàn thiện thiết kế.</span></p>', 2, 2900000, 2800000, 12, NULL, '/storage/uploads/2024/12/15/Giay_Bong_Ro_Anthony_Edwards_1_Mid_DJen_IG6670.avif', '2024-12-15 02:40:58', '2024-12-15 02:40:58'),
(55, 'Giày Golf Đinh Liền Superstar Rolling Links', 'Đôi giày golf đinh liền adidas Superstar.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Tee off theo phong cách cổ điển với đôi giày golf đinh liền kèm kiltie tua rua này. Lấy cảm hứng từ những đặc tính chung là cộng đồng lớn mạnh, phong cách táo bạo và cá tính riêng biệt của từng môn thể thao trong các nền văn hóa golf và trượt ván, đôi giày này sẵn sàng cho 18 hố golf đồng thời khoe trọn những tính năng classic và các chi tiết hiện đại. Đế ngoài đinh liền cho phép bạn thoải mái thư giãn tại clubhouse sau khi hoàn thành vòng golf.</span></p>', 2, 3300000, 300000, 7, NULL, '/storage/uploads/2024/12/15/Giay_Golf_DJinh_Lien_Superstar_Rolling_Links_trang_IH2500.avif', '2024-12-15 02:42:10', '2024-12-15 02:42:10'),
(56, 'Giày Forum 84 Low', 'Đôi giày trainer phong cách cổ điển với thiết kế đậm chất bóng rổ.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Lên đồ theo phong cách iconic. Đôi giày adidas Forum 84 Low cổ thấp này tôn vinh gốc gác bóng rổ của thương hiệu. Chất liệu da cao cấp kết hợp với đế cupsole bằng cao su trong mờ tạo nên một thiết kế cực kỳ ghi điểm.</span></p>', 2, 2600000, 2500000, 4, NULL, '/storage/uploads/2024/12/15/Giay_Forum_84_Low_Be_IF9689.avif', '2024-12-15 02:43:43', '2024-12-15 02:43:43'),
(57, 'Túi Bowling Mini adidas Originals x Liberty London', 'Chiếc túi bowling mini hợp tác thiết kế cùng Liberty London.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Là phiên bản mini của một item adidas rất được ưa thích, chiếc túi bowling này được phủ họa tiết in hoa collab cùng Liberty London. Với quai đeo có thể tháo rời và thiết kế nhỏ gọn, chiếc túi này là lựa chọn đa năng đáp ứng mọi nhu cầu của bạn khi di chuyển. Logo Ba Lá in ở mặt trước khẳng định dấu ấn di sản adidas táo bạo cho item must-have thường ngày này.</span></p>', 1, 1200000, 1100000, 7, NULL, '/storage/uploads/2024/12/15/Tui_Bowling_Mini_adidas_Originals_x_Liberty_London_Nhieu_mau_JD5423.avif', '2024-12-15 02:45:13', '2024-12-15 02:45:13'),
(58, 'Bộ 6 Đôi Tất Cổ Cao Lót Đệm', 'Bộ sáu đôi tất cổ cao có đệm và nâng đỡ vòm bàn chân.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Cho đôi chân bạn cảm giác thoải mái suốt ngày dài với bộ sáu đôi tất cổ cao lót đệm adidas này. Lớp đệm êm ái ôm trọn bàn chân bạn trong cảm giác mềm mại trên từng sải bước, cùng kết cấu nâng đỡ vòm bàn chân giúp tăng cường sức khỏe cho đôi chân. Thiết kế classic cao trên mắt cá chân, là lựa chọn hoàn hảo để mang cùng giày sneaker hoặc giày cổ thấp. Logo 3 Bar kiểu mới mang đến nét mới mẻ, hiện đại cho thiết kế kinh điển của mẫu tất này.</span></p>', 1, 500000, 400000, 9, NULL, '/storage/uploads/2024/12/15/Bo_6_DJoi_Tat_Co_Cao_Lot_DJem_mau_xanh_la_JP1716_03_standard_hover_hover_hover_hover_hover.avif', '2024-12-15 02:46:13', '2024-12-15 02:46:13'),
(59, 'Ốp Bảo Vệ Ống Chân Tiro Club', 'Đôi ốp bảo vệ ống chân bóng đá dáng thấp.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Bảo vệ bản thân mà vẫn đảm bảo khả năng vận động. Đôi ốp bảo vệ ống chân adidas Tiro Club này được thiết kế dành cho các cầu thủ yêu thích sự tiện lợi khi có thể nhét lớp đệm vào ngay bên trong tất chân. Với thiết kế siêu nhẹ và linh hoạt, lớp vỏ ngoài cứng cáp kèm theo lớp lót bằng chất EVA hấp thụ lực tác động và các chi tiết đục lỗ tăng cường thông thoáng.</span></p>', 1, 300000, 200000, 6, NULL, '/storage/uploads/2024/12/15/Op_Bao_Ve_Ong_Chan_Tiro_Club_DJen_IS5399_01_standard.avif', '2024-12-15 02:47:04', '2024-12-15 02:47:04'),
(60, 'Bóng Starlancer Club', 'Trái bóng khâu máy này luôn sẵn sàng lăn khi bạn ra sân.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Mang không khí của sân vận động đến công viên gần nhà với trái bóng Starlancer Club đến từ adidas. Quả bóng đá đàn hồi này kết hợp kết cấu khâu máy và vỏ bóng bằng TPU với ruột bóng bằng cao su butyl giúp giữ bóng căng hơi. Bất kể bạn đang chơi cùng bạn bè hay rèn luyện kỹ năng, trái bóng này sẽ mang đến cho bạn phong độ cần thiết để tỏa sáng.</span></p>', 1, 400000, 200000, 4, NULL, '/storage/uploads/2024/12/15/Bong_Starlancer_Club_DJen_JH3748_01_00_standard.avif', '2024-12-15 02:48:05', '2024-12-15 02:48:05'),
(61, 'Mũ Lưỡi Trai adidas x Disney Mickey Mouse Trẻ Em', 'Chiếc mũ lưỡi trai trẻ em dành cho các fan của Chuột Mickey.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Làm từ vải twill cotton mềm mại, chiếc mũ lưỡi trai trẻ em này có thể điều chỉnh ở phía sau cho độ ôm vừa ý. Họa tiết graphic oversize hình Chuột Mickey nhà Disney lấp ló và nháy mắt ở phía trước. Logo Ba Lá ở giữa mặt trước nâng tầm kiểu dáng thể thao.</span></p>', 1, 900000, 800000, 8, NULL, '/storage/uploads/2024/12/15/Mu_Luoi_Trai_adidas_x_Disney_Mickey_Mouse_Tre_Em_DJo_JN9689_01_00_standard.avif', '2024-12-15 02:49:29', '2024-12-15 02:49:29'),
(62, 'Túi Bowling Mini Adicolor', 'Chiếc túi bowling mini bóng bẩy lấy cảm hứng từ phong cách adidas cổ điển.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Chiếc túi bowling mini adidas Adicolor phong cách retro này không hề đơn điệu. Làm từ chất liệu giả da bóng bẩy, túi đựng vừa mọi vật dụng thiết yếu của bạn. Các điểm nhấn kim loại và đường viền mang hơi hướng retro. Túi có thể đeo vai hoặc xách bằng quai. Thỏa sức lựa chọn.</span></p>', 1, 1000000, 900000, 6, NULL, '/storage/uploads/2024/12/15/Tui_Bowling_Mini_Adicolor_trai_cam_JI9453_01_00_standard.avif', '2024-12-15 02:50:19', '2024-12-15 02:50:19'),
(63, 'Ba Lô adidas Disney Mickey Mouse Trẻ Em', 'Chiếc ba lô Disney thường ngày dành cho trẻ em, có sử dụng chất liệu tái chế.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Từ những ngày trong tuần bận rộn đến cuối tuần kín mít lịch trình, chiếc ba lô trẻ em adidas này luôn sẵn sàng. Thiết kế nhiều ngăn khóa kéo đựng tất cả đồ đạc của bé và quai đeo vai lót đệm tùy chỉnh mang lại cảm giác thoải mái khi đi bộ từ trường về nhà. Họa tiết graphic vui nhộn hình Chuột Mickey và những người bạn nhà Disney nổi bật ở mặt trước. Sản phẩm này làm từ tối thiểu 50% chất liệu tái chế. Bằng cách tái sử dụng các chất liệu đã được tạo ra, chúng tôi góp phần giảm thiểu lãng phí và hạn chế phụ thuộc vào các nguồn tài nguyên hữu hạn, cũng như giảm phát thải từ các sản phẩm mà chúng tôi sản xuất.</span></p>', 1, 750000, 740000, 2, NULL, '/storage/uploads/2024/12/15/Ba_Lo_adidas_Disney_Mickey_Mouse_Tre_Em_Mau_xanh_da_troi_JG5808_01_00_standard.avif', '2024-12-15 02:51:17', '2024-12-15 02:51:17'),
(64, 'Mũ Bóng Chày Ba Lá Classic Adicolor', 'Chiếc mũ bóng chày cotton classic đến từ adidas.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Casual, cool và thoải mái — chiếc mũ bóng chày adidas Adicolor này đáp ứng mọi tiêu chí. Chất vải twill cotton cho cảm giác mềm mại, bền chắc và càng đội càng đẹp. Logo Ba Lá classic ở mặt trước tô điểm chất thể thao.</span></p>', 1, 700000, 600000, 2, NULL, '/storage/uploads/2024/12/15/Mu_Bong_Chay_Ba_La_Classic_Adicolor_mau_xanh_la_JC6031_01_00_standard.avif', '2024-12-15 02:52:36', '2024-12-15 02:52:36'),
(65, 'Mũ Beanie Vành Gập COLD.RDY Tech', 'Chiếc mũ beanie adidas mùa đông có sử dụng chất liệu tái chế.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Mũ beanie làm được hai việc — giữ ấm cho bạn và là mảnh ghép hoàn thiện outfit. Chiếc mũ beanie adidas này làm mới item chủ đạo ấy bằng logo adidas Badge of Sport in dẻo 3D. Công nghệ COLD.RDY giúp bạn luôn cảm thấy ấm áp và được ôm ấp. Đội mũ vào và di chuyển thôi! Làm từ một loạt chất liệu tái chế và có chứa tối thiểu 40% thành phần tái chế, sản phẩm này đại diện cho một trong số rất nhiều các giải pháp của chúng tôi hướng tới chấm dứt rác thải nhựa.</span></p>', 1, 650000, 640000, 2, NULL, '/storage/uploads/2024/12/15/Mu_Beanie_Vanh_Gap_COLD.RDY_Tech_Be_IY5241_01_standard.avif', '2024-12-15 02:53:48', '2024-12-15 02:53:48'),
(66, 'Mũ Nửa Đầu Chạy Bộ AEROREADY', 'Chiếc mũ nửa đầu chạy bộ dành cho ngày nắng, có sử dụng chất liệu tái chế.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Bóng râm luôn bên bạn trên suốt đường chạy buổi chiều. Chiếc mũ nửa đầu chạy bộ adidas này có vành mũ cong giúp đôi mắt bạn không bao giờ bị chói. Chất liệu vải lưới thoáng khí cùng công nghệ AEROREADY thấm hút ẩm giúp bạn luôn khô ráo khi tăng nhiệt. Quai dán giúp bạn tùy chỉnh độ ôm vừa ý. Làm từ một loạt chất liệu tái chế và có chứa tối thiểu 40% thành phần tái chế, sản phẩm này đại diện cho một trong số rất nhiều các giải pháp của chúng tôi hướng tới chấm dứt rác thải nhựa</span></p>', 1, 500000, 400000, 5, NULL, '/storage/uploads/2024/12/15/Mu_Nua_DJau_Chay_Bo_AEROREADY_Hong_IX6657_01_standard.avif', '2024-12-15 02:55:06', '2024-12-15 02:55:06'),
(67, 'Ba Lô adidas Marvel Avengers Trẻ Em', 'Chiếc ba lô trẻ em Avengers làm từ chất liệu tái chế.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Các siêu anh hùng nhí có thể mang theo các vật dụng thiết yếu thật phong cách với chiếc ba lô trẻ em Avengers này. Với một ngăn chính có khóa kéo và nhiều ngăn phụ, bé sẽ có nhiều chỗ để đựng sách vở, đồ ăn vặt và hơn thế nữa. Quai đeo tùy chỉnh cho độ ôm thoải mái trên mọi hành trình phiêu lưu, bất kể đi học hay giải cứu vũ trụ. Sản phẩm này làm từ tối thiểu 50% chất liệu tái chế. Bằng cách tái sử dụng các chất liệu đã được tạo ra, chúng tôi góp phần giảm thiểu lãng phí và hạn chế phụ thuộc vào các nguồn tài nguyên hữu hạn, cũng như giảm phát thải từ các sản phẩm mà chúng tôi sản xuất.</span></p>', 1, 800000, 700000, 6, NULL, '/storage/uploads/2024/12/15/Ba_Lo_adidas_Marvel_Avengers_Tre_Em_Mau_xanh_da_troi_IW1102_01_standard.avif', '2024-12-15 02:56:14', '2024-12-15 02:56:14'),
(68, 'Bộ 3 Đôi Tất adidas Marvel Avengers', 'Bộ ba đôi tất siêu anh hùng dành cho trẻ em có sử dụng kết hợp các chất liệu tái chế và tái tạo.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Dành cho các bé luôn mơ ước được thi triển siêu năng lực. Mẫu tất trẻ em adidas này thổi bùng năng lượng ©Marvel Avengers mỗi lần bé mang tất. Mỗi bộ sản phẩm gồm ba đôi, để các siêu anh hùng nhí có thể trải nghiệm cảm giác mềm mại và co giãn dễ chịu mỗi ngày. Bằng cách chọn tái chế, chúng tôi có thể tái sử dụng những chất liệu đã được tạo ra, từ đó góp phần giảm lãng phí. Những lựa chọn chất liệu tái tạo sẽ giúp chúng tôi giảm phụ thuộc vào nguồn tài nguyên hữu hạn. Các sản phẩm sử dụng kết hợp các chất liệu tái chế và tái tạo của chúng tôi có chứa tổng cộng tối thiểu 50% các chất liệu này.</span></p>', 1, 500000, 400000, 9, NULL, '/storage/uploads/2024/12/15/Bo_3_DJoi_Tat_adidas_Marvel_Avengers_Xam_IW1111_01_standard.avif', '2024-12-15 02:57:14', '2024-12-15 02:57:14'),
(69, 'Găng Tay Thủ Môn Tập Luyện Predator', 'Đôi găng tay bền chắc giúp bạn cải thiện kỹ năng giữa khung thành.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Làm chủ khung thành với đôi găng tay thủ môn adidas giúp bạn ghi điểm phong độ. Với thiết kế nhằm mang lại độ ôm vừa vặn, quai cổ tay co giãn trên đôi găng tay bóng đá Predator Training này tạo độ ổn định cho khả năng xử lý bóng thoải mái. Phần lòng bàn tay bằng cao su latex Soft Grip cho độ êm ái, độ bám và độ bền trong mọi điều kiện thời tiết.</span></p>', 1, 800000, 600000, 3, NULL, '/storage/uploads/2024/12/15/Gang_Tay_Thu_Mon_Tap_Luyen_Predator_Hong_IX3871_01_standard.avif', '2024-12-15 02:58:12', '2024-12-15 02:58:12'),
(70, 'Túi Golf Siêu Nhẹ Có Chân Chống', 'Chiếc túi golf đầy đủ tính năng giúp sắp xếp đồ đạc ngăn nắp trên sân.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Bước ra sân gọn gàng và sẵn sàng chơi hết mình. Chiếc túi golf siêu nhẹ, dễ mang này giúp bạn chuẩn bị sẵn sàng cho những vòng golf mượt mà với mọi thứ bạn cần đều được sắp xếp gọn gàng và đúng vị trí. Thiết kế nhiều ngăn giúp cất giữ các món đồ nhỏ và đủ chỗ chứa thêm một lớp quần áo. Quai đeo lót đệm cho cảm giác mang vác thoải mái sau mỗi cú đánh, cùng chân chống đi kèm giúp bạn dễ dàng lấy được gậy golf.</span></p>', 1, 7500000, 7400000, 1, NULL, '/storage/uploads/2024/12/15/Tui_Golf_Sieu_Nhe_Co_Chan_Chong_Be_IW3611_01_standard.avif', '2024-12-15 02:59:17', '2024-12-15 02:59:17'),
(71, 'Bóng CLB Sân Nhà Manchester United', 'Quả bóng giải trí mang màu sắc sân nhà của Man Utd.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Thể hiện nhiệt huyết của bạn dành cho Manchester United trên sân cỏ với trái bóng adidas Club này. Màu sắc sân nhà và huy hiệu in thể hiện lòng hâm mộ bóng đá trong bạn. Kết cấu khâu máy và ruột bóng bằng cao su butyl đảm bảo bóng luôn sẵn sàng cho màn trình diễn.</span></p>', 1, 600000, 500000, 8, NULL, '/storage/uploads/2024/12/15/Bong_CLB_San_Nha_Manchester_United_DJo_IX4023_01_standard.avif', '2024-12-15 03:00:17', '2024-12-15 03:00:17'),
(72, 'Thắt Lưng Hai Mặt', 'Chiếc thắt lưng golf đa năng bạn có thể đeo ở mọi kiểu sân.', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">Mix&amp;match với mọi outfit golf yêu thích của bạn. Chiếc thắt lưng golf adidas này có thiết kế hai mặt để có thể kết hợp với nhiều trang phục khác nhau.</span></p>', 1, 1800000, 1700000, 5, NULL, '/storage/uploads/2024/12/15/That_Lung_Hai_Mat_DJen_IS6286_01_standard.avif', '2024-12-15 03:01:31', '2024-12-15 03:01:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb3_unicode_ci,
  `payload` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('lcO9CLveMSegL1HwnCKyraDydTifsyBA3fKAHr8M', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWkwza3cwSW4weTFqTWZPQUxPYllSM0tkRUJ6ZXV1a1A0eGRMT1c0MCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL3Byb2R1Y3RzL2FkZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vcHJvZHVjdHMvbGlzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1734257135);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'hieu', 'hieu@localhost.com', NULL, '$2y$12$W/8OsLo5XVr4kom14w/YuuPtoQ1OgMiS5wn41phaM7DKcKyzWFT4K', '0iVpmnyCOzg3I0Ji80WUwSxlHyQYMPjMYDDM5Y2ClU5A5r7Cxcz0CzMaLHWT', '2024-10-01 14:37:36', '2024-10-10 14:37:36');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
