-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2021 at 06:39 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exam`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_post` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_category_id` bigint(20) UNSIGNED NOT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_08_28_063029_create_products_table', 1),
(5, '2020_08_28_072131_create_blog_categories_table', 1),
(6, '2020_08_28_072234_create_blogs_table', 1),
(7, '2020_08_28_103502_create_variants_table', 1),
(8, '2020_08_28_103644_create_product_images_table', 1),
(9, '2020_08_28_104103_create_blog_tags_table', 1),
(10, '2020_08_31_065549_create_product_variants_table', 1),
(11, '2020_08_31_073704_create_product_variant_prices_table', 1),
(12, '2020_08_31_081510_create_product_variant_price_relation_table', 1);

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `sku`, `description`, `created_at`, `updated_at`) VALUES
(1, 'shart', 'shart01', 'this is description', '2021-04-24 10:03:03', '2021-04-24 10:28:35'),
(2, 'pant', 'pant02', 'this is description', '2021-04-24 10:04:34', '2021-04-24 10:04:34'),
(3, 'cap', 'cap03', 'this is description', '2021-04-24 10:05:53', '2021-04-24 10:05:53'),
(4, 'jacket', 'jacket', 'this is description', '2021-04-24 10:24:35', '2021-04-24 10:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `file_path`, `thumbnail`, `created_at`, `updated_at`) VALUES
(3, 3, 'http://127.0.0.1:8000/storage/productpic/d.jpg', NULL, '2021-04-24 10:05:53', '2021-04-24 10:05:53'),
(9, 4, 'http://127.0.0.1:8000/storage/productpic/fj.jpg', NULL, '2021-04-24 10:24:36', '2021-04-24 10:24:36'),
(12, 1, 'http://127.0.0.1:8000/storage/productpic/images.jpg', NULL, '2021-04-24 10:29:08', '2021-04-24 10:29:08'),
(13, 1, 'http://127.0.0.1:8000/storage/productpic/imageswjpg.jpg', NULL, '2021-04-24 10:29:08', '2021-04-24 10:29:08'),
(14, 2, 'http://127.0.0.1:8000/storage/productpic/bppant.jpg', NULL, '2021-04-24 10:30:18', '2021-04-24 10:30:18'),
(15, 2, 'http://127.0.0.1:8000/storage/productpic/ppabt.jpg', NULL, '2021-04-24 10:30:18', '2021-04-24 10:30:18');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variant` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `variant`, `variant_id`, `product_id`, `created_at`, `updated_at`) VALUES
(9, 'green', 1, 3, '2021-04-24 10:05:53', '2021-04-24 10:05:53'),
(10, 'yellow', 1, 3, '2021-04-24 10:05:53', '2021-04-24 10:05:53'),
(20, 'pink', 1, 4, '2021-04-24 10:24:35', '2021-04-24 10:24:35'),
(21, 'brown', 1, 4, '2021-04-24 10:24:35', '2021-04-24 10:24:35'),
(22, 'l', 2, 4, '2021-04-24 10:24:35', '2021-04-24 10:24:35'),
(23, 'xsm', 2, 4, '2021-04-24 10:24:35', '2021-04-24 10:24:35'),
(29, 'red', 1, 1, '2021-04-24 10:29:08', '2021-04-24 10:29:08'),
(30, 'white', 1, 1, '2021-04-24 10:29:08', '2021-04-24 10:29:08'),
(31, 'sm', 2, 1, '2021-04-24 10:29:08', '2021-04-24 10:29:08'),
(32, 'md', 2, 1, '2021-04-24 10:29:08', '2021-04-24 10:29:08'),
(33, 'black', 1, 2, '2021-04-24 10:30:18', '2021-04-24 10:30:18'),
(34, 'blue', 1, 2, '2021-04-24 10:30:19', '2021-04-24 10:30:19'),
(35, 'xl', 2, 2, '2021-04-24 10:30:19', '2021-04-24 10:30:19'),
(36, 'xxl', 2, 2, '2021-04-24 10:30:19', '2021-04-24 10:30:19'),
(37, 'xxxl', 2, 2, '2021-04-24 10:30:19', '2021-04-24 10:30:19');

-- --------------------------------------------------------

--
-- Table structure for table `product_variant_prices`
--

CREATE TABLE `product_variant_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_variant_one` bigint(20) UNSIGNED DEFAULT NULL,
  `product_variant_two` bigint(20) UNSIGNED DEFAULT NULL,
  `product_variant_three` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variant_prices`
--

INSERT INTO `product_variant_prices` (`id`, `product_variant_one`, `product_variant_two`, `product_variant_three`, `price`, `stock`, `product_id`, `created_at`, `updated_at`) VALUES
(9, 9, NULL, NULL, 50, 20, 3, '2021-04-24 10:05:53', '2021-04-24 10:05:53'),
(10, 10, NULL, NULL, 50, 20, 3, '2021-04-24 10:05:53', '2021-04-24 10:05:53'),
(21, 20, 22, NULL, 1000, 30, 4, '2021-04-24 10:24:36', '2021-04-24 10:24:36'),
(22, 20, 23, NULL, 1000, 30, 4, '2021-04-24 10:24:36', '2021-04-24 10:24:36'),
(23, 21, 22, NULL, 1000, 30, 4, '2021-04-24 10:24:36', '2021-04-24 10:24:36'),
(24, 21, 23, NULL, 1000, 30, 4, '2021-04-24 10:24:36', '2021-04-24 10:24:36'),
(31, 29, 31, NULL, 100, 50, 1, '2021-04-24 10:29:08', '2021-04-24 10:29:08'),
(32, 29, 32, NULL, 100, 50, 1, '2021-04-24 10:29:08', '2021-04-24 10:29:08'),
(33, 30, 31, NULL, 130, 50, 1, '2021-04-24 10:29:09', '2021-04-24 10:29:09'),
(34, 30, 32, NULL, 100, 25, 1, '2021-04-24 10:29:09', '2021-04-24 10:29:09'),
(35, 33, 35, NULL, 220, 40, 2, '2021-04-24 10:30:19', '2021-04-24 10:30:19'),
(36, 33, 36, NULL, 200, 30, 2, '2021-04-24 10:30:19', '2021-04-24 10:30:19'),
(37, 34, 35, NULL, 200, 30, 2, '2021-04-24 10:30:19', '2021-04-24 10:30:19'),
(38, 34, 36, NULL, 200, 30, 2, '2021-04-24 10:30:19', '2021-04-24 10:30:19'),
(39, 33, 37, NULL, 210, 10, 2, '2021-04-24 10:30:19', '2021-04-24 10:30:19'),
(40, 34, 37, NULL, 210, 10, 2, '2021-04-24 10:30:19', '2021-04-24 10:30:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test@admin.com', NULL, '$2y$10$qVLg1Gbh0pjUwIaKPrqGqO7FdapxLV.PZLVAkguUDJEGcKA1E.vXK', NULL, '2021-04-24 09:47:06', '2021-04-24 09:47:06');

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Color', 'product color', '2021-04-24 10:01:21', '2021-04-24 10:01:21'),
(2, 'Size', 'product size', '2021-04-24 10:01:37', '2021-04-24 10:01:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_blog_category_id_foreign` (`blog_category_id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categories_slug_unique` (`slug`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_tags_blog_id_foreign` (`blog_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variants_variant_id_foreign` (`variant_id`),
  ADD KEY `product_variants_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_variant_prices`
--
ALTER TABLE `product_variant_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variant_prices_product_id_foreign` (`product_id`),
  ADD KEY `product_variant_prices_product_variant_one_foreign` (`product_variant_one`),
  ADD KEY `product_variant_prices_product_variant_two_foreign` (`product_variant_two`),
  ADD KEY `product_variant_prices_product_variant_three_foreign` (`product_variant_three`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `variants_title_unique` (`title`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `product_variant_prices`
--
ALTER TABLE `product_variant_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`);

--
-- Constraints for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD CONSTRAINT `blog_tags_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variants_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variant_prices`
--
ALTER TABLE `product_variant_prices`
  ADD CONSTRAINT `product_variant_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variant_prices_product_variant_one_foreign` FOREIGN KEY (`product_variant_one`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variant_prices_product_variant_three_foreign` FOREIGN KEY (`product_variant_three`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variant_prices_product_variant_two_foreign` FOREIGN KEY (`product_variant_two`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
