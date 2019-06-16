-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2019 at 06:52 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Super Admin' COMMENT 'Admin | Super Admin',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `phone_no`, `avatar`, `type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'SohanPUST', 'sohan.ice.pust@gmail.com', '$2y$10$e6uVF.SJ87CM9q9yH7hfTOGZioWOvPQQocGEc9v9gpYERCCwnW4LS', '01766980719', NULL, 'Super Admin', 'y6Aha7IuglFIAYznUoRwQeah4OtVcbtKNMtJNdIx1fUGWu5A05SNillSmtcV', '2019-05-16 21:32:54', '2019-05-19 11:06:21');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(2, 'Apple', NULL, '1556863878.jpg', '2019-05-03 00:11:18', '2019-05-03 00:11:18'),
(3, 'ASUS', NULL, '1556863954.jpg', '2019-05-03 00:12:34', '2019-05-03 00:12:34'),
(4, 'Others Band', NULL, '1556864048.jpg', '2019-05-03 00:14:09', '2019-05-03 00:14:09'),
(5, 'Samsung', 'samsung brand', '1558946446.png', '2019-05-27 02:40:47', '2019-05-27 02:40:47'),
(6, 'Easy', 'its easy brand product', NULL, '2019-05-27 10:38:12', '2019-05-27 10:38:12'),
(7, 'Lotto', 'lotto brand product', NULL, '2019-05-27 10:39:02', '2019-05-27 10:39:02'),
(8, 'Dell', NULL, NULL, '2019-05-27 10:47:47', '2019-05-27 10:47:47'),
(9, 'Hp', NULL, NULL, '2019-05-27 10:48:00', '2019-05-27 10:48:00');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `user_id`, `order_id`, `ip_address`, `product_quantity`, `created_at`, `updated_at`) VALUES
(46, 39, NULL, 7, '::1', 1, '2019-06-04 03:24:46', '2019-06-04 03:26:16'),
(47, 42, NULL, NULL, '::1', 1, '2019-06-15 23:32:07', '2019-06-15 23:32:07'),
(48, 41, NULL, NULL, '::1', 1, '2019-06-15 23:36:02', '2019-06-15 23:36:02');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `parent_id`, `created_at`, `updated_at`) VALUES
(9, 'Clothes', 'Garments products..', '1558426011.jpg', NULL, '2019-05-21 02:06:52', '2019-05-21 02:06:52'),
(10, 'Mobile Phone', 'phone collection', '1558945993.jpg', NULL, '2019-05-27 02:32:28', '2019-05-27 02:33:14'),
(11, 'Computer', 'computer relqated items', '1558946585.jpg', NULL, '2019-05-27 02:43:05', '2019-05-27 02:43:05'),
(12, 'Sunglass', 'sunglass item', '1558947550.png', 14, '2019-05-27 02:59:10', '2019-05-27 10:32:38'),
(13, 'Watch', 'watch item', '1558947582.jpg', 14, '2019-05-27 02:59:42', '2019-05-27 10:32:19'),
(14, 'Boys Fashion', 'fashion', '1558974797.jpeg', NULL, '2019-05-27 10:32:04', '2019-05-27 10:33:18'),
(15, 'Samsung', 'samsung product', '1558975319.png', 10, '2019-05-27 10:41:59', '2019-05-27 10:41:59'),
(16, 'Xiaomi', 'xiaomi product', '1558975368.jpg', 10, '2019-05-27 10:42:49', '2019-05-27 10:42:49'),
(17, 'Oppo', 'oppo product', '1558975408.png', 10, '2019-05-27 10:43:28', '2019-05-27 10:43:28'),
(18, 'Dell', 'dell product', '1558975435.jpeg', 11, '2019-05-27 10:43:55', '2019-05-27 10:43:55'),
(19, 'Hp', 'hp product', '1558975473.png', 11, '2019-05-27 10:44:33', '2019-05-27 10:44:33'),
(20, 'ASUS', 'asus product', '1558975526.jpg', 11, '2019-05-27 10:45:26', '2019-05-27 10:45:26'),
(21, 'Shirt', NULL, '1558975585.jpg', 9, '2019-05-27 10:46:25', '2019-05-27 10:46:25'),
(22, 'Pant', NULL, '1558975612.png', 9, '2019-05-27 10:46:52', '2019-05-27 10:46:52'),
(23, 'T-shirt', NULL, '1558975636.png', 9, '2019-05-27 10:47:17', '2019-05-27 10:47:17');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `division_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `division_id`, `created_at`, `updated_at`) VALUES
(1, 'Kushtia', 4, '2019-05-04 02:38:00', '2019-05-04 03:25:07'),
(2, 'Pabna', 3, '2019-05-04 03:25:50', '2019-05-04 03:25:50'),
(3, 'Narayongonj', 2, '2019-05-04 03:26:16', '2019-05-04 03:26:16'),
(4, 'Barguna', 7, '2019-05-20 21:17:57', '2019-05-20 21:17:57'),
(5, 'Barisal sadar', 7, '2019-05-20 21:18:29', '2019-05-20 21:18:29'),
(6, 'Bhola', 7, '2019-05-20 21:19:10', '2019-05-20 21:19:10'),
(7, 'Jhalokati', 7, '2019-05-20 21:19:52', '2019-05-20 21:19:52'),
(8, 'Patuakhali', 7, '2019-05-20 21:20:41', '2019-05-20 21:20:41'),
(9, 'Bandarban', 5, '2019-05-20 21:21:23', '2019-05-20 21:21:23'),
(10, 'Brahmanbaria', 5, '2019-05-20 21:21:43', '2019-05-20 21:21:43'),
(11, 'Chittagong', 5, '2019-05-20 21:22:06', '2019-05-20 21:22:06'),
(12, 'Comilla', 5, '2019-05-20 21:22:31', '2019-05-20 21:22:31'),
(13, 'Feni', 5, '2019-05-20 21:23:00', '2019-05-20 21:23:00'),
(14, 'Faridpur', 2, '2019-05-20 21:23:53', '2019-05-20 21:23:53'),
(15, 'Gazipur', 2, '2019-05-20 21:24:08', '2019-05-20 21:24:08'),
(16, 'Madaripur', 2, '2019-05-20 21:24:36', '2019-05-20 21:24:36'),
(17, 'Manikganj', 2, '2019-05-20 21:24:52', '2019-05-20 21:24:52'),
(18, 'Jhenaidah', 4, '2019-05-20 21:25:32', '2019-05-20 21:25:32'),
(19, 'Meherpur', 4, '2019-05-20 21:25:56', '2019-05-20 21:25:56'),
(20, 'Jessore', 4, '2019-05-20 21:26:11', '2019-05-20 21:26:11'),
(21, 'Jamalpur', 9, '2019-05-20 21:26:36', '2019-05-20 21:26:36'),
(22, 'Netrokona', 9, '2019-05-20 21:26:53', '2019-05-20 21:26:53'),
(23, 'Sherpur', 9, '2019-05-20 21:27:31', '2019-05-20 21:27:31'),
(24, 'Natore', 3, '2019-05-20 21:29:44', '2019-05-20 21:29:44'),
(25, 'Shirajgonj', 3, '2019-05-20 21:30:06', '2019-05-20 21:30:06'),
(26, 'Dinajpur', 8, '2019-05-20 21:30:35', '2019-05-20 21:30:35'),
(27, 'Gaibandha', 8, '2019-05-20 21:30:50', '2019-05-20 21:30:50'),
(28, 'Kurigram', 8, '2019-05-20 21:31:09', '2019-05-20 21:31:09'),
(29, 'Lalmonirhat', 8, '2019-05-20 21:31:30', '2019-05-20 21:31:30'),
(30, 'Sylhet', 6, '2019-05-20 21:31:54', '2019-05-20 21:31:54'),
(31, 'Sunamganj', 6, '2019-05-20 21:32:15', '2019-05-20 21:32:15'),
(32, 'Moulovibazar', 6, '2019-05-20 21:32:34', '2019-05-20 21:32:34'),
(33, 'Habiganj', 6, '2019-05-20 21:32:54', '2019-05-20 21:32:54');

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `name`, `priority`, `created_at`, `updated_at`) VALUES
(2, 'Dhaka', 1, '2019-05-04 02:03:11', '2019-05-04 02:03:11'),
(3, 'Rajshahi', 2, '2019-05-04 02:05:07', '2019-05-04 02:05:07'),
(4, 'Khulna', 3, '2019-05-04 02:05:42', '2019-05-04 02:05:42'),
(5, 'Chittagong', 4, '2019-05-04 09:56:05', '2019-05-04 09:56:05'),
(6, 'Sylhet', 5, '2019-05-04 09:56:32', '2019-05-04 09:56:32'),
(7, 'Barisal', 6, '2019-05-04 09:57:02', '2019-05-04 09:57:02'),
(8, 'Rangpur', 7, '2019-05-04 09:57:43', '2019-05-04 09:57:43'),
(9, 'Mymensingh', 8, '2019-05-04 09:58:03', '2019-05-04 09:58:03');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_04_25_153238_create_products_table', 2),
(5, '2019_04_26_035005_create_categories_table', 2),
(6, '2019_04_26_035227_create_brands_table', 2),
(8, '2019_04_26_043909_create_product_images_table', 2),
(10, '2014_10_12_000000_create_users_table', 3),
(13, '2019_05_04_062420_create_divisions_table', 5),
(15, '2019_05_04_062501_create_districts_table', 6),
(17, '2019_05_09_101712_create_carts_table', 8),
(18, '2019_05_13_025721_create_settings_table', 9),
(19, '2019_05_13_035917_create_payments_table', 10),
(20, '2019_05_09_101643_create_orders_table', 11),
(21, '2019_04_26_035428_create_admins_table', 12),
(22, '2019_05_21_034104_create_sliders_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `is_completed` tinyint(1) NOT NULL DEFAULT '0',
  `is_seen_by_admin` tinyint(1) NOT NULL DEFAULT '0',
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_charge` int(11) NOT NULL DEFAULT '60',
  `custom_discount` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `payment_id`, `ip_address`, `name`, `phone_no`, `shipping_address`, `email`, `message`, `is_paid`, `is_completed`, `is_seen_by_admin`, `transaction_id`, `shipping_charge`, `custom_discount`, `created_at`, `updated_at`) VALUES
(1, 9, 2, NULL, 'Md Sohanur Rahaman', '01838733337', 'Pabna sadar', 'sohan.ice.pust@gmail.com', 'sohan', 1, 1, 1, NULL, 60, 0, '2019-05-15 21:46:58', '2019-05-15 21:46:58'),
(2, 9, 3, '::1', 'Md Sohanur Rahaman', '01838733337', 'Kushtia', 'sohan.ice.pust@gmail.com', NULL, 1, 1, 1, '3453464657', 62, 2, '2019-05-15 22:16:01', '2019-05-25 02:44:12'),
(3, NULL, 2, '::1', 'sohan', '01838733337', 'sfsdg', 'sohan.ice.pust@gmail.com', 'dgdsg', 1, 1, 1, '3453464657', 60, 0, '2019-05-18 11:12:11', '2019-05-20 02:55:50'),
(4, NULL, 2, '::1', 'Md Sohanur Rahaman', '01838733337', 'pabna sadar', 'sohan.ice.pust@gmail.com', 'nothibg', 1, 1, 1, '3453464657', 60, 10, '2019-05-28 00:51:11', '2019-05-28 01:02:10'),
(5, NULL, 2, '::1', 'etwey', '01838733337', 'fhd', 'aa@gmail.com', 'fh', 0, 0, 0, '3453464657', 60, 0, '2019-05-29 22:10:50', '2019-05-29 22:10:50'),
(6, 9, 2, '::1', 'Md Sohanur Rahaman', '01838733337', 'New', 'sohan.ice.pust@gmail.com', NULL, 0, 0, 0, '3453464657', 60, 0, '2019-05-29 22:34:00', '2019-05-29 22:34:00'),
(7, NULL, 2, '::1', 'fddh', '01838733337', 'hfgjh', 'sohan.ice.pust@gmail.com', NULL, 1, 1, 1, '3453464657', 60, 0, '2019-06-04 03:26:15', '2019-06-04 03:27:45');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT '1',
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Payment No',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'agent|Personal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `name`, `image`, `priority`, `short_name`, `no`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Cash In', 'cash_in.jpg', 1, 'cash_in', NULL, NULL, '2019-05-13 04:37:58', '2019-05-13 04:37:58'),
(2, 'Bkash', 'bkash.jpg', 2, 'bkash', '01766980719', 'Personal', '2019-05-13 04:40:48', '2019-05-13 04:40:48'),
(3, 'Rocket', 'rocket.jpg', 3, 'rocket', '01838733337', 'Personal', '2019-05-13 04:43:28', '2019-05-13 04:43:28');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `price` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `offer_price` int(11) DEFAULT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `brand_id`, `title`, `description`, `slug`, `quantity`, `price`, `status`, `offer_price`, `admin_id`, `created_at`, `updated_at`) VALUES
(25, 12, 4, 'Black Sunglass', 'black sunglass for boys', 'black-sunglass', 10, 500, 0, NULL, 1, '2019-05-27 10:49:40', '2019-05-27 10:49:40'),
(26, 12, 4, 'Red Sunglass', 'red sunglass for boys', 'red-sunglass', 10, 1000, 0, NULL, 1, '2019-05-27 10:50:31', '2019-05-27 10:50:31'),
(27, 12, 4, 'Gray Sunglass', 'gray sunglass for boys', 'gray-sunglass', 10, 1500, 0, NULL, 1, '2019-05-27 10:50:59', '2019-05-27 10:50:59'),
(28, 13, 4, 'Black watch', 'black watch for boys', 'black-watch', 10, 1200, 0, NULL, 1, '2019-05-27 10:52:35', '2019-05-27 10:52:35'),
(29, 13, 4, 'Silver model watch', 'silver watch for boys', 'silver-model-watch', 10, 2000, 0, NULL, 1, '2019-05-27 10:53:38', '2019-05-27 10:53:38'),
(30, 13, 4, 'Gray Watch', 'gray watch for boys', 'gray-watch', 10, 2500, 0, NULL, 1, '2019-05-27 10:54:50', '2019-05-27 10:54:50'),
(31, 22, 6, 'Jen''s Pant', 'jens pant for boys', 'jens-pant', 10, 2200, 0, NULL, 1, '2019-05-27 10:56:59', '2019-05-27 10:56:59'),
(32, 22, 7, 'Gabady Pant', 'gabady pant for boys', 'gabady-pant', 10, 2000, 0, NULL, 1, '2019-05-27 10:57:45', '2019-05-27 10:57:45'),
(33, 22, 6, 'Formal Pant', 'formal pant for boys', 'formal-pant', 12, 1800, 0, NULL, 1, '2019-05-27 10:58:23', '2019-05-27 10:58:23'),
(34, 21, 6, 'Full folded shirt', 'full  folded cotton shirt for boys', 'full-folded-shirt', 12, 2500, 0, NULL, 1, '2019-05-27 10:59:38', '2019-05-27 10:59:38'),
(35, 23, 7, 'Red t-shirt', 'red t-shirt for boys', 'red-t-shirt', 5, 1000, 0, NULL, 1, '2019-05-27 11:00:24', '2019-05-27 11:00:24'),
(36, 23, 6, 'simple tshirt', 'simple tshirt for boys', 'simple-tshirt', 34, 800, 0, NULL, 1, '2019-05-27 11:01:32', '2019-05-27 11:01:32'),
(37, 20, 3, 'Asus laptop', 'asuss', 'asus-laptop', 5, 45000, 0, NULL, 1, '2019-05-27 11:03:42', '2019-05-27 11:03:42'),
(38, 19, 9, 'Hp laptop', 'jhp[', 'hp-laptop', 5, 50000, 0, NULL, 1, '2019-05-27 11:04:26', '2019-05-27 11:04:26'),
(39, 18, 8, 'dell inspiron', 'dell', 'dell-inspiron', 5, 48000, 0, NULL, 1, '2019-05-27 11:04:58', '2019-05-27 11:04:58'),
(40, 16, 4, 'Xiaomi Redmi6 Pro', 'xiaomi', 'xiaomi-redmi6-pro', 5, 18000, 0, NULL, 1, '2019-05-27 11:08:19', '2019-05-27 11:08:19'),
(41, 17, 4, 'oppo phone', 'oppo mobille', 'oppo-phone', 5, 15000, 0, NULL, 1, '2019-05-27 11:09:33', '2019-05-27 11:09:33'),
(42, 15, 5, 'Samsung Galaxy-5', 'samsung mobile', 'samsung-galaxy-5', 5, 16000, 0, NULL, 1, '2019-05-27 11:10:24', '2019-05-27 11:10:24');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, '1.jpg', NULL, NULL),
(2, 2, '2.png', NULL, NULL),
(3, 1, '3.jpg', NULL, NULL),
(4, 2, '1556440982.jpg', '2019-04-28 02:43:03', '2019-04-28 02:43:03'),
(5, 6, '1556442486.jpg', '2019-04-28 03:08:07', '2019-04-28 03:08:07'),
(6, 2, '1556442487.png', '2019-04-28 03:08:07', '2019-04-28 03:08:07'),
(7, 7, '1556731681.png', '2019-05-01 11:28:02', '2019-05-01 11:28:02'),
(8, 2, '1556731819.png', '2019-05-01 11:30:20', '2019-05-01 11:30:20'),
(9, 9, '1556731874.png', '2019-05-01 11:31:14', '2019-05-01 11:31:14'),
(10, 10, '1556902001.jpg', '2019-05-03 10:46:43', '2019-05-03 10:46:43'),
(11, 10, '1556902003.jpg', '2019-05-03 10:46:43', '2019-05-03 10:46:43'),
(12, 11, '1558946095.png', '2019-05-27 02:34:55', '2019-05-27 02:34:55'),
(13, 12, '1558947644.jpg', '2019-05-27 03:00:44', '2019-05-27 03:00:44'),
(14, 13, '1558947689.png', '2019-05-27 03:01:29', '2019-05-27 03:01:29'),
(15, 14, '1558947738.jpeg', '2019-05-27 03:02:18', '2019-05-27 03:02:18'),
(16, 15, '1558947770.png', '2019-05-27 03:02:50', '2019-05-27 03:02:50'),
(17, 16, '1558947793.jpg', '2019-05-27 03:03:13', '2019-05-27 03:03:13'),
(18, 17, '1558947828.jpg', '2019-05-27 03:03:48', '2019-05-27 03:03:48'),
(19, 18, '1558947854.jpg', '2019-05-27 03:04:14', '2019-05-27 03:04:14'),
(20, 19, '1558947886.jpg', '2019-05-27 03:04:46', '2019-05-27 03:04:46'),
(21, 20, '1558947914.jpeg', '2019-05-27 03:05:14', '2019-05-27 03:05:14'),
(22, 21, '1558947939.png', '2019-05-27 03:05:39', '2019-05-27 03:05:39'),
(23, 22, '1558947976.png', '2019-05-27 03:06:16', '2019-05-27 03:06:16'),
(24, 23, '1558948004.jpg', '2019-05-27 03:06:44', '2019-05-27 03:06:44'),
(25, 24, '1558948034.jpg', '2019-05-27 03:07:14', '2019-05-27 03:07:14'),
(26, 25, '1558975780.jpeg', '2019-05-27 10:49:40', '2019-05-27 10:49:40'),
(27, 26, '1558975831.png', '2019-05-27 10:50:31', '2019-05-27 10:50:31'),
(28, 27, '1558975860.png', '2019-05-27 10:51:00', '2019-05-27 10:51:00'),
(29, 28, '1558975955.jpg', '2019-05-27 10:52:35', '2019-05-27 10:52:35'),
(30, 29, '1558976018.jpg', '2019-05-27 10:53:38', '2019-05-27 10:53:38'),
(31, 30, '1558976090.jpg', '2019-05-27 10:54:51', '2019-05-27 10:54:51'),
(32, 31, '1558976219.jpg', '2019-05-27 10:57:00', '2019-05-27 10:57:00'),
(33, 32, '1558976265.png', '2019-05-27 10:57:45', '2019-05-27 10:57:45'),
(34, 33, '1558976304.png', '2019-05-27 10:58:24', '2019-05-27 10:58:24'),
(35, 34, '1558976378.jpg', '2019-05-27 10:59:38', '2019-05-27 10:59:38'),
(36, 35, '1558976424.png', '2019-05-27 11:00:24', '2019-05-27 11:00:24'),
(37, 36, '1558976492.jpg', '2019-05-27 11:01:32', '2019-05-27 11:01:32'),
(38, 37, '1558976622.jpg', '2019-05-27 11:03:42', '2019-05-27 11:03:42'),
(39, 38, '1558976666.png', '2019-05-27 11:04:27', '2019-05-27 11:04:27'),
(40, 39, '1558976698.jpeg', '2019-05-27 11:04:58', '2019-05-27 11:04:58'),
(41, 40, '1558976899.jpg', '2019-05-27 11:08:19', '2019-05-27 11:08:19'),
(42, 41, '1558976973.png', '2019-05-27 11:09:33', '2019-05-27 11:09:33'),
(43, 42, '1558977024.png', '2019-05-27 11:10:24', '2019-05-27 11:10:24');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` int(10) UNSIGNED NOT NULL DEFAULT '100',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `email`, `phone`, `address`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(1, 'tast@gmail.com', '01838733337', 'Kushtia,Khoksha', 100, '2019-05-13 03:11:49', '2019-05-13 03:11:49');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` tinyint(3) UNSIGNED NOT NULL DEFAULT '10',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `image`, `button_text`, `button_link`, `priority`, `created_at`, `updated_at`) VALUES
(7, 'slider1', '1558425589.jpg', NULL, NULL, 1, '2019-05-21 01:59:49', '2019-05-21 01:59:49'),
(8, 'slider2', '1558425619.jpg', NULL, NULL, 2, '2019-05-21 02:00:20', '2019-05-21 02:00:20'),
(9, 'slider3', '1558425637.jpg', NULL, NULL, 3, '2019-05-21 02:00:37', '2019-05-21 02:00:37'),
(10, 'slider4', '1558425655.jpg', NULL, NULL, 4, '2019-05-21 02:00:55', '2019-05-21 02:00:55'),
(11, 'slider5', '1558425670.jpg', NULL, NULL, 5, '2019-05-21 02:01:10', '2019-05-21 02:01:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `division_id` int(10) UNSIGNED NOT NULL COMMENT 'Division Table Id',
  `district_id` int(10) UNSIGNED NOT NULL COMMENT 'District Table Id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0=Inactive|1=active|2=Ban',
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `phone_no`, `email`, `password`, `street_address`, `division_id`, `district_id`, `status`, `ip_address`, `avatar`, `shipping_address`, `remember_token`, `created_at`, `updated_at`) VALUES
(9, 'Md Sohanur', 'Rahaman', 'srsohan', '01838733337', 'sohan.ice.pust@gmail.com', '$2y$10$7QP22QgXdv/m6myOK8/a/u414dXqBD.eRytGubjE.AsPQ1hNk58c.', 'kumarkhali,kushtia', 4, 1, 1, '::1', NULL, 'New', 'WZnVg9rYEyB2uCYJ37JYaZpJzSY0IegWQG9vR45jN3pCpFpBblOcL9ClKAcg', '2019-05-06 03:23:21', '2019-05-08 00:06:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_short_name_unique` (`short_name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_phone_no_unique` (`phone_no`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
