-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2025 at 07:13 PM
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
-- Database: `pechaymonitor`
--

-- --------------------------------------------------------

--
-- Table structure for table `air_quality_sensors`
--

CREATE TABLE `air_quality_sensors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `co2` double NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `air_quality_sensors`
--

INSERT INTO `air_quality_sensors` (`id`, `co2`, `status`, `created_at`, `updated_at`) VALUES
(1, 891, 1, '2025-05-10 01:32:39', '2025-05-10 01:32:39'),
(2, 569, 0, '2025-05-10 01:32:46', '2025-05-10 01:32:46'),
(3, 789, 0, '2025-05-10 01:32:53', '2025-05-10 01:32:53'),
(4, 454, 0, '2025-05-10 01:33:00', '2025-05-10 01:33:00'),
(5, 407, 0, '2025-05-10 01:33:07', '2025-05-10 01:33:07'),
(6, 632, 0, '2025-05-10 01:33:14', '2025-05-10 01:33:14'),
(7, 930, 1, '2025-05-10 01:33:21', '2025-05-10 01:33:21'),
(8, 759, 0, '2025-05-10 01:33:28', '2025-05-10 01:33:28'),
(9, 530, 0, '2025-05-10 01:33:35', '2025-05-10 01:33:35'),
(10, 908, 1, '2025-05-10 01:36:15', '2025-05-10 01:36:15'),
(11, 488, 0, '2025-05-10 01:36:22', '2025-05-10 01:36:22'),
(12, 427, 1, '2025-05-10 01:36:29', '2025-05-10 01:36:29'),
(13, 638, 1, '2025-05-10 01:36:37', '2025-05-10 01:36:37'),
(14, 726, 1, '2025-05-10 01:36:43', '2025-05-10 01:36:43');

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
-- Table structure for table `humidity_temperature_sensors`
--

CREATE TABLE `humidity_temperature_sensors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `humidity` double NOT NULL,
  `temperature` double NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `humidity_temperature_sensors`
--

INSERT INTO `humidity_temperature_sensors` (`id`, `humidity`, `temperature`, `status`, `created_at`, `updated_at`) VALUES
(1, 31, 30, 1, '2025-05-10 01:32:39', '2025-05-10 01:32:39'),
(2, 66, 22, 0, '2025-05-10 01:32:46', '2025-05-10 01:32:46'),
(3, 50, 23, 0, '2025-05-10 01:32:53', '2025-05-10 01:32:53'),
(4, 62, 30, 0, '2025-05-10 01:33:00', '2025-05-10 01:33:00'),
(5, 57, 28, 0, '2025-05-10 01:33:06', '2025-05-10 01:33:06'),
(6, 42, 20, 0, '2025-05-10 01:33:13', '2025-05-10 01:33:13'),
(7, 38, 23, 1, '2025-05-10 01:33:20', '2025-05-10 01:33:20'),
(8, 33, 29, 0, '2025-05-10 01:33:27', '2025-05-10 01:33:27'),
(9, 62, 25, 0, '2025-05-10 01:33:34', '2025-05-10 01:33:34'),
(10, 35, 24, 1, '2025-05-10 01:36:15', '2025-05-10 01:36:15'),
(11, 55, 16, 0, '2025-05-10 01:36:22', '2025-05-10 01:36:22'),
(12, 37, 15, 1, '2025-05-10 01:36:29', '2025-05-10 01:36:29'),
(13, 50, 28, 1, '2025-05-10 01:36:36', '2025-05-10 01:36:36'),
(14, 60, 20, 1, '2025-05-10 01:36:43', '2025-05-10 01:36:43');

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
-- Table structure for table `light_sensors`
--

CREATE TABLE `light_sensors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `light_intensity` double NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `light_sensors`
--

INSERT INTO `light_sensors` (`id`, `light_intensity`, `status`, `created_at`, `updated_at`) VALUES
(1, 983, 1, '2025-05-10 01:32:38', '2025-05-10 01:32:38'),
(2, 660, 0, '2025-05-10 01:32:45', '2025-05-10 01:32:45'),
(3, 824, 0, '2025-05-10 01:32:52', '2025-05-10 01:32:52'),
(4, 655, 0, '2025-05-10 01:32:59', '2025-05-10 01:32:59'),
(5, 721, 0, '2025-05-10 01:33:05', '2025-05-10 01:33:05'),
(6, 434, 0, '2025-05-10 01:33:12', '2025-05-10 01:33:12'),
(7, 978, 1, '2025-05-10 01:33:19', '2025-05-10 01:33:19'),
(8, 587, 0, '2025-05-10 01:33:26', '2025-05-10 01:33:26'),
(9, 933, 0, '2025-05-10 01:33:33', '2025-05-10 01:33:33'),
(10, 923, 1, '2025-05-10 01:36:14', '2025-05-10 01:36:14'),
(11, 612, 0, '2025-05-10 01:36:21', '2025-05-10 01:36:21'),
(12, 158, 1, '2025-05-10 01:36:28', '2025-05-10 01:36:28'),
(13, 845, 1, '2025-05-10 01:36:35', '2025-05-10 01:36:35'),
(14, 896, 1, '2025-05-10 01:36:42', '2025-05-10 01:36:42'),
(15, 5, 1, '2025-05-10 03:28:47', '2025-05-10 03:28:47');

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
(9, '0001_01_01_000000_create_users_table', 1),
(10, '0001_01_01_000001_create_cache_table', 1),
(11, '0001_01_01_000002_create_jobs_table', 1),
(12, '2025_05_10_090850_create_light_sensors_table', 1),
(13, '2025_05_10_090858_create_sound_sensors_table', 1),
(14, '2025_05_10_090903_create_humidity_temperature_sensors_table', 1),
(15, '2025_05_10_090910_create_air_quality_sensors_table', 1),
(16, '2025_05_10_091425_create_personal_access_tokens_table', 1);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('bJH0btTWENUs0TbIBszCtCubePqWc9TH6RQY0fVk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1NnUEN4eTV4Y2I3ZWpKa0Jna2FQMHlTc0hyUndlZnpjY1g2QkFvMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zZW5zb3JzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746895409),
('cMV8IBPNtsmfR0x9BKPHPhcdlFxATRIvbogwo1ga', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFMwY0R4QlNqQURuaDBjeURrUGt6cUtUVVJlNlJ2NUNkR1dib1BlMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zZW5zb3JzIjt9fQ==', 1746870733);

-- --------------------------------------------------------

--
-- Table structure for table `sound_sensors`
--

CREATE TABLE `sound_sensors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `value` double NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sound_sensors`
--

INSERT INTO `sound_sensors` (`id`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 34, 1, '2025-05-10 01:32:39', '2025-05-10 01:32:39'),
(2, 36, 0, '2025-05-10 01:32:45', '2025-05-10 01:32:45'),
(3, 65, 0, '2025-05-10 01:32:52', '2025-05-10 01:32:52'),
(4, 81, 0, '2025-05-10 01:32:59', '2025-05-10 01:32:59'),
(5, 56, 0, '2025-05-10 01:33:06', '2025-05-10 01:33:06'),
(6, 75, 0, '2025-05-10 01:33:13', '2025-05-10 01:33:13'),
(7, 90, 1, '2025-05-10 01:33:20', '2025-05-10 01:33:20'),
(8, 46, 0, '2025-05-10 01:33:27', '2025-05-10 01:33:27'),
(9, 86, 0, '2025-05-10 01:33:34', '2025-05-10 01:33:34'),
(10, 99, 1, '2025-05-10 01:36:14', '2025-05-10 01:36:14'),
(11, 82, 0, '2025-05-10 01:36:21', '2025-05-10 01:36:21'),
(12, 77, 1, '2025-05-10 01:36:28', '2025-05-10 01:36:28'),
(13, 72, 1, '2025-05-10 01:36:36', '2025-05-10 01:36:36'),
(14, 69, 1, '2025-05-10 01:36:42', '2025-05-10 01:36:42');

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
-- Indexes for dumped tables
--

--
-- Indexes for table `air_quality_sensors`
--
ALTER TABLE `air_quality_sensors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `humidity_temperature_sensors`
--
ALTER TABLE `humidity_temperature_sensors`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `light_sensors`
--
ALTER TABLE `light_sensors`
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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sound_sensors`
--
ALTER TABLE `sound_sensors`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `air_quality_sensors`
--
ALTER TABLE `air_quality_sensors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `humidity_temperature_sensors`
--
ALTER TABLE `humidity_temperature_sensors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `light_sensors`
--
ALTER TABLE `light_sensors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sound_sensors`
--
ALTER TABLE `sound_sensors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
