-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2026 at 08:24 PM
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
  `long_discount` int(11) NOT NULL DEFAULT 0,
  `last_discount` int(11) NOT NULL DEFAULT 0,
  `total_price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `reference`, `room`, `plan`, `check_in`, `check_out`, `guests`, `long_discount`, `last_discount`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 'ZTL-PLP8FVN8', 'Standard Room', 'Room Only', '2026-03-24', '2026-03-27', 1, 10, 5, 5130, '2026-03-23 13:04:22', '2026-03-23 13:04:22'),
(2, 'ZTL-1CXFVSKU', 'Standard Room', 'Room Only', '2026-03-23', '2026-03-24', 1, 0, 5, 1900, '2026-03-23 13:12:35', '2026-03-23 13:12:35'),
(3, 'ZTL-RSQTMDHI', 'Standard Room', 'With Breakfast', '2026-03-24', '2026-03-25', 1, 0, 5, 2280, '2026-03-23 13:37:42', '2026-03-23 13:37:42'),
(4, 'ZTL-8JB0NBVP', 'Standard Room', 'Room Only', '2026-03-24', '2026-03-25', 1, 0, 5, 1900, '2026-03-23 13:40:18', '2026-03-23 13:40:18');

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
(1, 'long_stay', 3, NULL, 10, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(2, 'long_stay', 6, NULL, 20, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(3, 'last_minute', NULL, 3, 5, '2026-03-23 13:00:35', '2026-03-23 13:00:35');

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
  `room_type_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `available` int(11) NOT NULL,
  `price_1_person` int(11) NOT NULL,
  `price_2_person` int(11) NOT NULL,
  `price_3_person` int(11) NOT NULL,
  `breakfast_price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `room_type_id`, `date`, `available`, `price_1_person`, `price_2_person`, `price_3_person`, `breakfast_price`, `created_at`, `updated_at`) VALUES
(1, 1, '2026-03-23', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(2, 2, '2026-03-23', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(3, 1, '2026-03-24', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(4, 2, '2026-03-24', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(5, 1, '2026-03-25', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(6, 2, '2026-03-25', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(7, 1, '2026-03-26', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(8, 2, '2026-03-26', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(9, 1, '2026-03-27', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(10, 2, '2026-03-27', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(11, 1, '2026-03-28', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(12, 2, '2026-03-28', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(13, 1, '2026-03-29', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(14, 2, '2026-03-29', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(15, 1, '2026-03-30', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(16, 2, '2026-03-30', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(17, 1, '2026-03-31', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(18, 2, '2026-03-31', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(19, 1, '2026-04-01', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(20, 2, '2026-04-01', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(21, 1, '2026-04-02', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(22, 2, '2026-04-02', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(23, 1, '2026-04-03', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(24, 2, '2026-04-03', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(25, 1, '2026-04-04', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(26, 2, '2026-04-04', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(27, 1, '2026-04-05', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(28, 2, '2026-04-05', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(29, 1, '2026-04-06', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(30, 2, '2026-04-06', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(31, 1, '2026-04-07', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(32, 2, '2026-04-07', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(33, 1, '2026-04-08', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(34, 2, '2026-04-08', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(35, 1, '2026-04-09', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(36, 2, '2026-04-09', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(37, 1, '2026-04-10', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(38, 2, '2026-04-10', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(39, 1, '2026-04-11', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(40, 2, '2026-04-11', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(41, 1, '2026-04-12', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(42, 2, '2026-04-12', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(43, 1, '2026-04-13', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(44, 2, '2026-04-13', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(45, 1, '2026-04-14', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(46, 2, '2026-04-14', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(47, 1, '2026-04-15', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(48, 2, '2026-04-15', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(49, 1, '2026-04-16', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(50, 2, '2026-04-16', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(51, 1, '2026-04-17', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(52, 2, '2026-04-17', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(53, 1, '2026-04-18', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(54, 2, '2026-04-18', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(55, 1, '2026-04-19', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(56, 2, '2026-04-19', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(57, 1, '2026-04-20', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(58, 2, '2026-04-20', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(59, 1, '2026-04-21', 5, 2000, 2500, 3000, 400, '2026-03-23 13:00:35', '2026-03-23 13:00:35'),
(60, 2, '2026-04-21', 3, 3000, 3500, 4000, 500, '2026-03-23 13:00:35', '2026-03-23 13:00:35');

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
(5, '2026_03_18_095958_create_inventories_table', 1),
(6, '2026_03_18_101037_create_bookings_table', 1),
(7, '2026_03_18_102122_create_discounts_table', 1);

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
-- Table structure for table `room_types`
--

CREATE TABLE `room_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_types`
--

INSERT INTO `room_types` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Standard Room', 'Clean, minimal space with queen bed, work desk, and natural light. 24 sqm.', 'standard.jpg', NULL, NULL),
(2, 'Deluxe Room', 'Spacious room with king bed, seating area, and panoramic city views. 36 sqm.', 'deluxe.jpg', NULL, NULL);

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

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('L1XvjJp4e25Jfizs8XN55jdUSZDeZi44E6tWQVhf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianpIdklrS2FBSkE4blZCd1VuVGFvaTNzc0FTNkNZdG96N3luOEt4cSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czoxMjoic2VhcmNoLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774293423);

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
(1, 'Test User', 'test@example.com', '2026-03-23 13:00:35', '$2y$12$X/XOhSZRiVWZXoHyryVnEOXgouxPa2QD0h1sTcUJluYUn9EDb1CAW', 'Tfw07TKQa0', '2026-03-23 13:00:35', '2026-03-23 13:00:35');

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
  ADD KEY `inventories_room_type_id_foreign` (`room_type_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  ADD CONSTRAINT `inventories_room_type_id_foreign` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
