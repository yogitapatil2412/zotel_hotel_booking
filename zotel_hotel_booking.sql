-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2026 at 06:10 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zotel_hotel_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference` varchar(255) NOT NULL,
  `room` varchar(255) NOT NULL,
  `plan` varchar(255) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `guests` int(11) NOT NULL,
  `discount` int(11) NOT NULL DEFAULT 0,
  `total_price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('long_stay','last_minute') NOT NULL,
  `min_nights` int(11) DEFAULT NULL,
  `days_before` int(11) DEFAULT NULL,
  `discount_percent` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `type`, `min_nights`, `days_before`, `discount_percent`, `created_at`, `updated_at`) VALUES
(1, 'long_stay', 3, NULL, 10, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(2, 'long_stay', 6, NULL, 20, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(3, 'last_minute', NULL, 3, 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rate_plan_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `available` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `rate_plan_id`, `date`, `available`, `created_at`, `updated_at`) VALUES
(1, 1, '2026-03-25', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(2, 2, '2026-03-25', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(3, 3, '2026-03-25', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(4, 4, '2026-03-25', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(5, 1, '2026-03-26', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(6, 2, '2026-03-26', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(7, 3, '2026-03-26', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(8, 4, '2026-03-26', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(9, 1, '2026-03-27', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(10, 2, '2026-03-27', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(11, 3, '2026-03-27', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(12, 4, '2026-03-27', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(13, 1, '2026-03-28', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(14, 2, '2026-03-28', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(15, 3, '2026-03-28', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(16, 4, '2026-03-28', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(17, 1, '2026-03-29', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(18, 2, '2026-03-29', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(19, 3, '2026-03-29', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(20, 4, '2026-03-29', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(21, 1, '2026-03-30', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(22, 2, '2026-03-30', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(23, 3, '2026-03-30', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(24, 4, '2026-03-30', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(25, 1, '2026-03-31', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(26, 2, '2026-03-31', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(27, 3, '2026-03-31', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(28, 4, '2026-03-31', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(29, 1, '2026-04-01', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(30, 2, '2026-04-01', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(31, 3, '2026-04-01', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(32, 4, '2026-04-01', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(33, 1, '2026-04-02', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(34, 2, '2026-04-02', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(35, 3, '2026-04-02', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(36, 4, '2026-04-02', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(37, 1, '2026-04-03', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(38, 2, '2026-04-03', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(39, 3, '2026-04-03', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(40, 4, '2026-04-03', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(41, 1, '2026-04-04', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(42, 2, '2026-04-04', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(43, 3, '2026-04-04', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(44, 4, '2026-04-04', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(45, 1, '2026-04-05', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(46, 2, '2026-04-05', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(47, 3, '2026-04-05', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(48, 4, '2026-04-05', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(49, 1, '2026-04-06', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(50, 2, '2026-04-06', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(51, 3, '2026-04-06', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(52, 4, '2026-04-06', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(53, 1, '2026-04-07', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(54, 2, '2026-04-07', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(55, 3, '2026-04-07', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(56, 4, '2026-04-07', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(57, 1, '2026-04-08', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(58, 2, '2026-04-08', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(59, 3, '2026-04-08', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(60, 4, '2026-04-08', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(61, 1, '2026-04-09', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(62, 2, '2026-04-09', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(63, 3, '2026-04-09', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(64, 4, '2026-04-09', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(65, 1, '2026-04-10', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(66, 2, '2026-04-10', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(67, 3, '2026-04-10', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(68, 4, '2026-04-10', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(69, 1, '2026-04-11', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(70, 2, '2026-04-11', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(71, 3, '2026-04-11', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(72, 4, '2026-04-11', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(73, 1, '2026-04-12', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(74, 2, '2026-04-12', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(75, 3, '2026-04-12', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(76, 4, '2026-04-12', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(77, 1, '2026-04-13', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(78, 2, '2026-04-13', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(79, 3, '2026-04-13', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(80, 4, '2026-04-13', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(81, 1, '2026-04-14', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(82, 2, '2026-04-14', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(83, 3, '2026-04-14', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(84, 4, '2026-04-14', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(85, 1, '2026-04-15', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(86, 2, '2026-04-15', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(87, 3, '2026-04-15', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(88, 4, '2026-04-15', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(89, 1, '2026-04-16', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(90, 2, '2026-04-16', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(91, 3, '2026-04-16', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(92, 4, '2026-04-16', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(93, 1, '2026-04-17', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(94, 2, '2026-04-17', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(95, 3, '2026-04-17', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(96, 4, '2026-04-17', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(97, 1, '2026-04-18', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(98, 2, '2026-04-18', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(99, 3, '2026-04-18', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(100, 4, '2026-04-18', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(101, 1, '2026-04-19', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(102, 2, '2026-04-19', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(103, 3, '2026-04-19', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(104, 4, '2026-04-19', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(105, 1, '2026-04-20', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(106, 2, '2026-04-20', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(107, 3, '2026-04-20', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(108, 4, '2026-04-20', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(109, 1, '2026-04-21', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(110, 2, '2026-04-21', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(111, 3, '2026-04-21', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(112, 4, '2026-04-21', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(113, 1, '2026-04-22', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(114, 2, '2026-04-22', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(115, 3, '2026-04-22', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(116, 4, '2026-04-22', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(117, 1, '2026-04-23', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(118, 2, '2026-04-23', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(119, 3, '2026-04-23', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(120, 4, '2026-04-23', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(121, 1, '2026-04-24', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(122, 2, '2026-04-24', 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(123, 3, '2026-04-24', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(124, 4, '2026-04-24', 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_03_18_095721_create_room_types_table', 1),
(5, '2026_03_18_101037_create_bookings_table', 1),
(6, '2026_03_18_102122_create_discounts_table', 1),
(7, '2026_03_24_141455_create_rate_plan_discounts_table', 1),
(8, '2026_03_24_141456_create_rate_plans_table', 1),
(9, '2026_03_24_195958_create_inventories_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rate_plans`
--

CREATE TABLE `rate_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_type_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `meal_plan` varchar(255) DEFAULT NULL,
  `base_price` decimal(8,2) NOT NULL,
  `discount_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rate_plans`
--

INSERT INTO `rate_plans` (`id`, `room_type_id`, `code`, `name`, `meal_plan`, `base_price`, `discount_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'STANDARD_EP', 'Room Only', 'EP', 2000.00, 1, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(2, 1, 'STANDARD_CP', 'Breakfast Included', 'CP', 2400.00, 2, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(3, 2, 'DELUXE_CP', 'Breakfast Included', 'CP', 3000.00, 2, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(4, 2, 'DELUXE_MAP', 'All Meals Included', 'MAP', 3800.00, 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54');

-- --------------------------------------------------------

--
-- Table structure for table `rate_plan_discounts`
--

CREATE TABLE `rate_plan_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('early_bird','long_stay','last_minute') NOT NULL,
  `discount_percent` decimal(5,2) NOT NULL,
  `min_nights` int(11) DEFAULT NULL,
  `days_before` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rate_plan_discounts`
--

INSERT INTO `rate_plan_discounts` (`id`, `code`, `name`, `type`, `discount_percent`, `min_nights`, `days_before`, `created_at`, `updated_at`) VALUES
(1, 'EP', 'Early Bird', 'early_bird', 5.00, 1, 30, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(2, 'CP', 'Early Bird', 'early_bird', 10.00, 1, 30, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(3, 'MAP', 'Early Bird', 'early_bird', 10.00, 1, 30, '2026-03-25 05:09:54', '2026-03-25 05:09:54');

-- --------------------------------------------------------

--
-- Table structure for table `room_types`
--

CREATE TABLE `room_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `max_occupancy` int(11) NOT NULL,
  `total_rooms` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_types`
--

INSERT INTO `room_types` (`id`, `name`, `description`, `image`, `max_occupancy`, `total_rooms`, `created_at`, `updated_at`) VALUES
(1, 'Standard Room', 'Clean, minimal space with queen bed.', 'standard.jpg', 3, 5, '2026-03-25 05:09:54', '2026-03-25 05:09:54'),
(2, 'Deluxe Room', 'Spacious room with premium amenities.', 'deluxe.jpg', 4, 3, '2026-03-25 05:09:54', '2026-03-25 05:09:54');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2026-03-25 05:09:53', '$2y$12$46M7CT2IGD.3vLjCsv8DAuOmKf79cBpAYMYcX9atAL2WjFvGy6CTe', 'q9dwcEpTET', '2026-03-25 05:09:54', '2026-03-25 05:09:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventories_rate_plan_id_foreign` (`rate_plan_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `rate_plans`
--
ALTER TABLE `rate_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rate_plans_room_type_id_foreign` (`room_type_id`),
  ADD KEY `rate_plans_discount_id_foreign` (`discount_id`);

--
-- Indexes for table `rate_plan_discounts`
--
ALTER TABLE `rate_plan_discounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rate_plan_discounts_code_unique` (`code`);

--
-- Indexes for table `room_types`
--
ALTER TABLE `room_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rate_plans`
--
ALTER TABLE `rate_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rate_plan_discounts`
--
ALTER TABLE `rate_plan_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `room_types`
--
ALTER TABLE `room_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventories`
--
ALTER TABLE `inventories`
  ADD CONSTRAINT `inventories_rate_plan_id_foreign` FOREIGN KEY (`rate_plan_id`) REFERENCES `rate_plans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rate_plans`
--
ALTER TABLE `rate_plans`
  ADD CONSTRAINT `rate_plans_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `rate_plan_discounts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rate_plans_room_type_id_foreign` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
