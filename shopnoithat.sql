-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 04, 2020 lúc 05:17 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopnoithat`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_categorie` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `name`, `created_at`, `updated_at`, `id_categorie`) VALUES
(1, 'Nội thất chung cư', NULL, NULL, 1),
(2, 'Nội thất biệt thự', NULL, NULL, 1),
(3, 'Nội thất nhà ở', NULL, NULL, 1),
(4, 'Thiết kế kiến trúc', NULL, NULL, 1),
(5, 'Cửa hàng thời trang', NULL, NULL, 2),
(6, 'Cửa hàng mỹ phẩm', NULL, NULL, 2),
(7, 'Cửa hàng điện thoại', NULL, NULL, 2),
(8, 'Siêu thị - tạp hóa', NULL, NULL, 2),
(9, 'Shop điện máy', NULL, NULL, 3),
(10, 'Thiết kế nhà sách', NULL, NULL, 3),
(11, 'Cửa hàng vật liệu xây dựng', NULL, NULL, 3),
(12, 'Shop mỹ phẩm-Spa', NULL, NULL, 3),
(13, 'Thiết kế nhà hàng', NULL, NULL, 4),
(14, 'Thiết kế quán cà phê', NULL, NULL, 4),
(15, 'Cửa hàng ăn uống', NULL, NULL, 4),
(16, 'Cửa hàng bánh ngọt', NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Thiết kế nội thất', NULL, NULL),
(2, 'Thiết kế cửa hàng', NULL, NULL),
(3, 'Thiết kế Showroom', NULL, NULL),
(4, 'Thiết kế nhà hàng', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
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
-- Cấu trúc bảng cho bảng `image_products`
--

CREATE TABLE `image_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `image_products`
--

INSERT INTO `image_products` (`id`, `img`, `product_id`) VALUES
(3, 'cc4.jpg', 1),
(4, 'cc5.jpg', 1),
(5, 'tv2.jpg', 1),
(7, 'pk1.jpg', 2),
(8, 'pk2.jpg', 2),
(9, 'pk3.jpg', 2),
(10, 'nhabep1.jpg', 3),
(11, 'nhabep2.jpg', 3),
(12, 'nhabep3.jpg', 3),
(13, 'tt1.jpg', 4),
(14, 'tt2.jpg', 4),
(15, 'tt3.jpg', 4),
(16, 'co.jpg', 20),
(17, 'co1.jpg', 20),
(18, 'co2.jpg', 20),
(19, 'bn1.jpg', 13),
(20, 'bn2.jpg', 13),
(21, 'bn4.jpg', 13),
(22, 'anh8.jpg', 35),
(23, 'anh8.jpg', 35),
(24, 'anh8.jpg', 35),
(25, 'co1.jpg', 32),
(26, 'co2.jpg', 32),
(27, 'co2.jpg', 32),
(28, 'sp1.jpg', 12),
(29, 'sp2.jpg', 33),
(30, 'sp3.jpg', 33),
(31, 'sp2.jpg', 10),
(32, 'sp3.jpg', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_11_22_144609_table_categories', 2),
(4, '2020_11_22_144659_table_brands', 2),
(5, '2020_11_22_144738_table_products', 2),
(11, '2020_11_22_144923_table_order', 3),
(12, '2020_11_22_145019_table_order_detail', 3),
(13, '2020_11_23_063423_table_products', 4),
(14, '2020_11_23_064328_table_order_status', 5),
(15, '2020_11_23_065558_table_order_detail', 6),
(16, '2020_11_28_053141_table__products', 7),
(18, '2020_11_30_011851_table_image_products', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addess` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` int(11) NOT NULL,
  `total` double(8,2) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `name`, `email`, `addess`, `phone`, `total`, `id_user`, `created_at`, `updated_at`) VALUES
(4, 'Phạm Quốc Hùng', 'dungcd@gmail.com', 'Số 15 Hùng Vương', 125485471, NULL, NULL, NULL, NULL),
(5, 'Phạm Quốc Hùng', 'dungpahm@gmail.com', 'Số 15 Hùng Vương', 125485471, NULL, NULL, NULL, NULL),
(6, 'Phạm Quốc Hùng', 'dungtroc@gmail.com', 'Số 15 Hùng Vương', 125485471, NULL, NULL, NULL, NULL),
(40, 'Pham Van A', 'duyquyen1999@gmail.com', 'Hai Duong', 387896051, NULL, NULL, '2020-12-03 08:33:52', '2020-12-03 08:33:52'),
(41, 'Pham Van An', 'duyquyen1998@gmail.com', 'Nam Dinh', 387896051, NULL, NULL, '2020-12-03 08:38:13', '2020-12-03 08:38:13'),
(42, 'Pham Van A', 'duyquye1n@gmail.com', 'Phu Thọ', 387896051, NULL, NULL, '2020-12-03 18:13:53', '2020-12-03 18:13:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_dettal`
--

CREATE TABLE `order_dettal` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_order` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_dettal`
--

INSERT INTO `order_dettal` (`id`, `id_order`, `id_product`, `created_at`, `updated_at`) VALUES
(1, 4, 1, NULL, NULL),
(2, 5, 21, NULL, NULL),
(4, 40, 8, '2020-12-03 08:37:29', '2020-12-03 08:37:29'),
(5, 41, 8, '2020-12-03 08:38:13', '2020-12-03 08:38:13'),
(6, 42, 20, '2020-12-03 18:13:53', '2020-12-03 18:13:53'),
(7, 40, 20, '2020-12-03 19:10:17', '2020-12-03 19:10:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_status`
--

CREATE TABLE `order_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_brands` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `img`, `title`, `id_brands`, `created_at`, `updated_at`) VALUES
(1, 'Thiết kế phòng ngủ', '1607045372.jpg', 'Thông thường thiết kế nội thất phòng ngủ chung cư hiện đại luôn đảm bảo yếu tố thoải mái và mang đậm dấu ấn cá nhân của chủ sở hữu căn phòng. Trong căn phòng này, các thiết bị cá nhân cũng thể hiện yếu tố hiện đại rõ nét ở chất liệu mới cùng màu sắc tươi ', 1, '2020-11-27 22:43:23', '2020-12-03 18:29:32'),
(2, 'Thiết kế phòng khách', '1607045417.jpg', 'Tạo ấn tượng cho khách đến nhà bởi 7 xu hướng thiết kế nội thất phòng khách đẹp hiện đại nhưng lại vô cùng đơn giản . Những xu hướng thiết kế hứa hẹn sẽ làm mưa làm gió vào năm 2020', 1, '2020-11-28 03:23:41', '2020-12-03 18:30:17'),
(3, 'Thiết kế nhà bếp', '1607045485.jpg', 'Trong mỗi ngôi nhà, phòng bếp giống như là linh hồn của cả gia đình. Phòng bếp là không gian thể hiện niềm đam mê, tình cảm và sự quan tâm tới tổ ấm của các bà nội trợ, là không gian sum vầy ấm áp của các gia đình sau một ngày dài. Vì vậy, phòng bếp ngày ', 1, '2020-11-28 03:24:28', '2020-12-03 18:31:25'),
(4, 'Thiết kế cửa hàng thời trang Nam-Nữ', '1607016572.jpg', 'Thiết kế shop thời trang đang là yếu tố quan trọng trong việc định hình thương hiệu. Thiết kế nội thất showroom Aeros luôn sẵn sàng cung cấp dịch vụ Thiết kế cửa hàng thời trang trọn gói với những thiết kế lạ đôc quyền, phù hợp với phát triển thương hiệu ', 5, '2020-11-28 03:25:21', '2020-12-03 10:29:32'),
(5, 'Thiết kế shop điện máy phong cách hiện đại', '', NULL, 9, '2020-11-28 03:27:39', '2020-11-28 03:27:39'),
(6, 'Thiết kế nhà hàng theo phong cách châu âu', '', NULL, 13, '2020-11-28 03:29:03', '2020-11-28 03:29:03'),
(7, 'Thiết kế cửa hàng thời trang', '1607011067.jpg', NULL, 5, '2020-11-28 03:30:56', '2020-12-03 08:57:47'),
(8, 'Thiết kế nhà theo kiến trúc phương Tây', 'cc2.jpg', NULL, 3, '2020-11-28 03:31:37', '2020-12-03 08:04:40'),
(10, 'Thiết kế Spa', '1607047561.jpg', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in fauci', 12, '2020-11-28 03:32:31', '2020-12-03 19:06:01'),
(11, 'Thiết kế cửa hàng tạp hóa bình dân', 'nt4.jpg', NULL, 11, '2020-11-28 03:33:04', '2020-12-03 08:03:34'),
(12, 'Thiết kế siêu thị', 'nt5.jpg', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in fauci', 8, '2020-11-28 03:33:27', '2020-11-28 03:33:27'),
(13, 'Thiết kế cửa hàng bánh ngọt', '1607017184.jpg', 'Thiết kế shop thời trang đang là yếu tố quan trọng trong việc định hình thương hiệu. Thiết kế nội thất showroom Aeros luôn sẵn sàng cung cấp dịch vụ Thiết kế cửa hàng thời trang trọn gói với những thiết kế lạ đôc quyền, phù hợp với phát triển thương hiệu ', 16, '2020-11-28 03:34:50', '2020-12-03 10:39:44'),
(14, 'Thiết kế quán ăn', '', NULL, 15, '2020-11-28 03:35:25', '2020-11-28 03:35:25'),
(16, 'Thiết kế nhà hàng bánh ngọt', '', 'Thiết kế cửa hàng bánh ngọt luôn là bước quan trọng cho việc kinh một tiệm bánh. Làm sao để cửa hàng bánh của bạn thu hút được nhiều khách và mang thương hiệu riêng? Hãy tham khảo các phương án thiết kế và hình ảnh của các cửa hàng có sẵn dưới đây nhé.', 7, '2020-11-29 02:54:36', '2020-12-03 08:06:08'),
(17, 'Phòng ngủ', '', NULL, 3, '2020-11-29 02:55:15', '2020-11-29 02:55:15'),
(18, 'Thiết kế quán caffe chill', '', NULL, 14, '2020-11-29 02:56:03', '2020-11-29 02:56:03'),
(19, 'Thiết kế Spa- nell', '1607008916.jpg', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in fauci', 12, '2020-11-29 02:56:41', '2020-12-03 08:21:56'),
(20, 'Thiết kế kiến trúc cổ kính', 'cc1.jpg', 'Phong cách được lấy ý tưởng bởi đế chế La Mã cổ đại và áp dụng rất nhiều vào các nhà thờ thời điểm này. Một trong những kiến trúc đặc sắc nhất, lột tả rõ nét nhất phong cách thiết kế kiến trúc', 4, '2020-11-29 02:57:34', '2020-11-29 02:57:34'),
(21, 'Thiet ke cua hang dien thoai', '', NULL, 7, '2020-11-29 18:51:28', '2020-11-29 18:51:28'),
(22, 'Thiet ke cua hang thoi trang phong cach', NULL, NULL, 5, '2020-11-29 18:58:52', '2020-11-29 18:58:52'),
(23, 'phong tắm', NULL, NULL, 11, '2020-12-02 03:06:06', '2020-12-02 03:06:06'),
(24, 'phòng ngủ', NULL, NULL, 7, '2020-12-02 06:58:47', '2020-12-02 06:58:47'),
(27, 'Thiết kế cửa hàng điện thoại', 'sp3.jpg', NULL, 7, '2020-12-03 08:06:59', '2020-12-03 08:06:59'),
(28, 'Thiết kế cửa hàng điện thoại', '1607009062.jpg', NULL, 7, '2020-12-03 08:24:22', '2020-12-03 08:24:22'),
(29, 'Thiết kê cửa hàng xây dựng', '1607009108.jpg', NULL, 11, '2020-12-03 08:25:08', '2020-12-03 08:25:08'),
(31, 'Thiết kế cửa hàng mỹ phẩm', '1607012596.jpg', NULL, 6, '2020-12-03 09:23:16', '2020-12-03 09:23:16'),
(32, 'Thiết kế kiến trúc Mỹ-La Tinh', '1607045867.jpg', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in fauci', 4, '2020-12-03 09:24:39', '2020-12-03 18:37:47'),
(33, 'Thiết kế siêu thị mini', '1607046079.jpg', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in fauci', 8, '2020-12-03 09:25:50', '2020-12-03 18:41:19'),
(34, 'Thiết kế cửa hàng bánh kem', '1607043603.jpg', NULL, 16, '2020-12-03 18:00:03', '2020-12-03 18:00:03'),
(35, 'Thiết kế phòng tắm', '1607045238.jpg', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in fauci', 1, '2020-12-03 18:27:18', '2020-12-03 18:27:18'),
(36, 'Thiết kế phòng ngủ', '1607045322.jpg', NULL, 1, '2020-12-03 18:28:42', '2020-12-03 18:28:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `level`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Quyen', 'quyen3714@gmail.com', '$2y$10$kYJNzE0vb0DWvREs0Un6lOH8WE3MwAVFRZLOypKK9QBgwtt7U.CU2', 0, NULL, NULL, NULL),
(4, 'Phùng Duy Quyền', 'quyen@gmail.com', '123456', 1, NULL, '2020-11-24 10:01:26', '2020-11-24 10:01:26'),
(5, 'Quyền Phùng', 'duyquyen@gmail.com', '$2y$10$Il9tUhSHEnRuUh99FaydI.Zc/a8pYXO4TuibLfdXZdCPaqCibYUuO', 1, NULL, '2020-11-24 11:05:47', '2020-11-24 11:05:47');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_id_categorie_foreign` (`id_categorie`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `image_products`
--
ALTER TABLE `image_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `image_products_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_email_unique` (`email`);

--
-- Chỉ mục cho bảng `order_dettal`
--
ALTER TABLE `order_dettal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_dettal_id_order_foreign` (`id_order`),
  ADD KEY `id_product` (`id_product`);

--
-- Chỉ mục cho bảng `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_brands_foreign` (`id_brands`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `image_products`
--
ALTER TABLE `image_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `order_dettal`
--
ALTER TABLE `order_dettal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_id_categorie_foreign` FOREIGN KEY (`id_categorie`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `image_products`
--
ALTER TABLE `image_products`
  ADD CONSTRAINT `image_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `order_dettal`
--
ALTER TABLE `order_dettal`
  ADD CONSTRAINT `order_dettal_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_dettal_id_order_foreign` FOREIGN KEY (`id_order`) REFERENCES `order` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_brands_foreign` FOREIGN KEY (`id_brands`) REFERENCES `brands` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
