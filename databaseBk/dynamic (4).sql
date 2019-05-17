-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2019 at 03:45 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dynamic`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `brand_name` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'tata', NULL, '2019-04-13 06:29:04', '2019-04-13 06:29:04'),
(2, 'bajaj', NULL, '2019-04-13 09:41:06', '2019-04-13 09:41:06');

-- --------------------------------------------------------

--
-- Table structure for table `credit_debit_details`
--

CREATE TABLE `credit_debit_details` (
  `id` int(11) NOT NULL,
  `user_id` int(100) DEFAULT NULL,
  `item` varchar(100) DEFAULT NULL,
  `item_discription` text,
  `is_credit` tinyint(1) NOT NULL DEFAULT '0',
  `amount` int(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(6) NOT NULL,
  `customer_name` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_contact_number` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_alt_number` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_gstin` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_name`, `customer_contact_number`, `customer_alt_number`, `customer_email`, `customer_address`, `customer_gstin`, `created_by`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Ashutosh Kumar Choubey', '9658476170', '345345', 'ashutoshkumarchoubey@gmail.com', 'ashutoshkum', '345', 1, 1, '2019-04-13 06:37:50', '2019-04-13 06:37:50', NULL),
(2, 'fgdgf', NULL, NULL, NULL, NULL, NULL, 1, 1, '2019-04-17 00:25:35', '2019-04-17 00:25:35', NULL),
(3, 'wiswa', '34534534534', '45345345345', 'ashutoshkumarchoubey@gmail.com', 'ashutoshkumarchoubey@gmail,com\r\nplot No-GA,430 Chandrasekharpur, Axis Bank ATM, Sailashree Vihar', '34534dgdg', 1, 1, '2019-04-17 05:54:10', '2019-04-17 05:54:10', NULL),
(4, 'Mohit Mona', '66553', '35345', 'fdhdfh@dfh.dgd', 'dfgdf', 'g4535', 1, 1, '2019-04-18 00:00:02', '2019-04-18 00:00:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_debit_logs`
--

CREATE TABLE `customer_debit_logs` (
  `id` int(100) NOT NULL,
  `customer_id` int(100) NOT NULL,
  `workshop_id` int(100) DEFAULT NULL,
  `sale_id` int(155) DEFAULT NULL,
  `debit_amount` float(100,2) DEFAULT NULL,
  `credit` float(155,4) DEFAULT NULL,
  `is_debit` int(11) DEFAULT '1' COMMENT '0=>credit,1=>debit',
  `comments` varchar(155) DEFAULT NULL,
  `payment_type` int(11) DEFAULT NULL COMMENT '''1''=>''By Cash'',''2''=>''By Internate Banking'',''3''=>''By Cheque''',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_debit_logs`
--

INSERT INTO `customer_debit_logs` (`id`, `customer_id`, `workshop_id`, `sale_id`, `debit_amount`, `credit`, `is_debit`, `comments`, `payment_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, NULL, 23.0000, 0, 'dfg', NULL, '2019-04-13 06:37:50', '2019-04-13 06:37:50', NULL),
(2, 1, NULL, 2, NULL, 0.0000, 0, NULL, NULL, '2019-04-13 06:42:46', '2019-04-13 06:42:46', NULL),
(3, 1, NULL, 3, NULL, 0.0000, 0, NULL, NULL, '2019-04-13 07:00:43', '2019-04-13 07:00:43', NULL),
(4, 1, 4, NULL, NULL, 0.0000, 0, 'dfg', NULL, '2019-04-13 07:06:57', '2019-04-13 07:06:57', NULL),
(5, 1, 5, NULL, NULL, 43.0000, 0, 'dfg', NULL, '2019-04-16 23:57:36', '2019-04-16 23:57:36', NULL),
(6, 2, 6, NULL, NULL, 0.0000, 0, 'dfg', NULL, '2019-04-17 00:25:35', '2019-04-17 00:25:35', NULL),
(7, 1, 9, NULL, NULL, 0.0000, 0, 'dfg', NULL, '2019-04-17 00:31:09', '2019-04-17 00:31:09', NULL),
(8, 2, 1, NULL, NULL, 0.0000, 0, 'dfg', NULL, '2019-04-17 00:44:18', '2019-04-17 00:44:18', NULL),
(9, 2, 2, NULL, NULL, 0.0000, 0, 'dfg', NULL, '2019-04-17 00:54:00', '2019-04-17 00:54:00', NULL),
(10, 2, 3, NULL, NULL, 34.0000, 0, 'dfg', NULL, '2019-04-17 02:05:27', '2019-04-17 02:05:27', NULL),
(11, 2, 3, NULL, NULL, 56.0000, 0, 'sf', 1, '2019-04-17 04:51:51', '2019-04-17 04:51:51', NULL),
(12, 2, 3, NULL, NULL, 59.0000, 0, 'dfgdf', 1, '2019-04-17 04:52:57', '2019-04-17 04:52:57', NULL),
(13, 2, 3, NULL, NULL, 56.0000, 0, NULL, 1, '2019-04-17 04:54:55', '2019-04-17 04:54:55', NULL),
(14, 2, 2, NULL, NULL, 8.0000, 0, 'testing', 1, '2019-04-17 05:30:24', '2019-04-17 05:30:24', NULL),
(15, 2, 2, NULL, NULL, 10.0000, 0, 'dgdf', 1, '2019-04-17 05:31:42', '2019-04-17 05:31:42', NULL),
(16, 2, 2, NULL, NULL, 10.0000, 0, 'dgdf', 1, '2019-04-17 05:31:42', '2019-04-17 05:31:42', NULL),
(17, 3, 4, NULL, NULL, 45.0000, 0, 'dfg', NULL, '2019-04-17 05:54:11', '2019-04-17 05:54:11', NULL),
(18, 3, 5, NULL, NULL, 234.0000, 0, 'dfg', NULL, '2019-04-17 05:57:44', '2019-04-17 05:57:44', NULL),
(19, 2, 6, NULL, NULL, 0.0000, 0, 'dfg', NULL, '2019-04-17 06:01:35', '2019-04-17 06:01:35', NULL),
(20, 4, 7, NULL, NULL, 300.0000, 0, 'df', NULL, '2019-04-18 00:00:03', '2019-04-18 00:00:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `documentations`
--

CREATE TABLE `documentations` (
  `id` int(100) NOT NULL,
  `menu_id` int(100) DEFAULT NULL,
  `title_name` varchar(200) DEFAULT NULL,
  `heading` varchar(200) DEFAULT NULL,
  `discription` text,
  `documentation` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `estimated_products`
--

CREATE TABLE `estimated_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id_es` int(11) NOT NULL,
  `workshop_id_es` int(11) NOT NULL,
  `product_quantity_es` bigint(11) DEFAULT NULL,
  `product_price_es` float(100,2) DEFAULT NULL,
  `workshop_product_model_es` int(100) DEFAULT NULL,
  `workshop_product_brand_es` int(100) DEFAULT NULL,
  `is_returned_es` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `estimated_products`
--

INSERT INTO `estimated_products` (`id`, `product_id_es`, `workshop_id_es`, `product_quantity_es`, `product_price_es`, `workshop_product_model_es`, `workshop_product_brand_es`, `is_returned_es`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 5, 200.00, 1, 1, 0, '2019-04-13 06:41:17', '2019-04-13 06:41:17'),
(2, 1, 1, 5, 200.00, 1, 1, 0, '2019-04-13 06:41:17', '2019-04-13 06:41:17');

-- --------------------------------------------------------

--
-- Table structure for table `estimated_services`
--

CREATE TABLE `estimated_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_type_id` int(100) DEFAULT NULL,
  `service_id` int(11) NOT NULL,
  `workshop_id` int(11) NOT NULL,
  `service_quantity` int(11) DEFAULT '1',
  `workshop_service_model` int(100) DEFAULT NULL,
  `workshop_service_brand` int(100) DEFAULT NULL,
  `service_price` float(100,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `estimated_services`
--

INSERT INTO `estimated_services` (`id`, `service_type_id`, `service_id`, `workshop_id`, `service_quantity`, `workshop_service_model`, `workshop_service_brand`, `service_price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 1, 1, 1, 100.00, '2019-04-13 06:41:17', '2019-04-13 06:41:17', NULL),
(2, 1, 1, 1, 1, 1, 1, 100.00, '2019-04-13 06:41:17', '2019-04-13 06:41:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `estimates`
--

CREATE TABLE `estimates` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(155) DEFAULT NULL,
  `is_workshop` int(11) NOT NULL DEFAULT '1' COMMENT '1=>" workshop ",0=>"sale"',
  `name` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_no` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landline` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_reg_number` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_year` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_number` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vin` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_number` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `odometer_reading` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fuel_type` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `engine_number` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_number` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_in` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_out` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_complete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=>no,1=>yes',
  `advisor` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_price` double(155,5) DEFAULT '0.00000',
  `installmentPayment` double(155,2) DEFAULT '0.00',
  `discount_price` double(155,2) DEFAULT '0.00',
  `balance_price` double(155,2) DEFAULT '0.00',
  `grandTotal` double(155,2) NOT NULL DEFAULT '0.00',
  `serviceGST` tinyint(1) DEFAULT '1',
  `submited_part` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `others_submited_part` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `workshop_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `estimates`
--

INSERT INTO `estimates` (`id`, `customer_id`, `is_workshop`, `name`, `reference`, `company`, `gst_no`, `mobile`, `landline`, `email`, `address`, `city`, `state`, `pin`, `vehicle_reg_number`, `model_year`, `company_name`, `model_number`, `brand`, `vin`, `reg_number`, `odometer_reading`, `color`, `fuel_type`, `engine_number`, `key_number`, `due_in`, `due_out`, `status`, `is_complete`, `advisor`, `notes`, `paid_price`, `installmentPayment`, `discount_price`, `balance_price`, `grandTotal`, `serviceGST`, `submited_part`, `others_submited_part`, `workshop_date`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Ashutosh Kumar Choubey', 'dff', 'sf', '345', '9658476170', '345345', 'ashutoshkumarchoubey@gmail.com', 'ashutoshkum', NULL, NULL, NULL, 'F', '35345', 'dgd', '1', '1', 'fdgfdg', '2019-04-11', '4353', 'dffdf', 'CNG', '345345', '4353', NULL, NULL, 'pending', 0, 'df', 'dfg', 0.00000, 0.00, 0.00, 0.00, 0.00, 1, NULL, NULL, '2019-04-13 06:41:17', NULL, '2019-04-13 06:41:17', '2019-04-13 06:41:17');

-- --------------------------------------------------------

--
-- Table structure for table `header_links`
--

CREATE TABLE `header_links` (
  `id` int(11) NOT NULL,
  `menu_id` varchar(100) DEFAULT NULL,
  `link_title` varchar(100) DEFAULT NULL,
  `link_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `header_links`
--

INSERT INTO `header_links` (`id`, `menu_id`, `link_title`, `link_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '5', 'Add Brand', 'master/brands', '2019-01-08 05:30:01', NULL, NULL),
(2, '5', 'Add Service', 'SaiAutoCare/service/add', '2019-01-01 11:15:01', NULL, NULL),
(3, '5', 'Add Model  Detail', 'master/modal', '2019-01-01 11:15:01', NULL, NULL),
(4, '5', 'Add Service name  Detail', 'master/service_name', '2019-01-01 11:15:01', NULL, NULL),
(5, '5', 'Add Service Type  Detail', 'master/service_type', '2019-01-01 11:15:01', NULL, NULL),
(6, '3', 'Add Supplier', 'SaiAutoCare/supplier/add', '2019-01-08 05:24:13', NULL, NULL),
(7, '3', 'Add Spare', 'SaiAutoCare/product/add', '2019-01-08 05:30:00', NULL, NULL),
(8, '3', 'Add Purchase', 'SaiAutoCare/purchase/add', '2019-01-08 05:30:00', NULL, NULL),
(9, '3', 'Add Brand', 'master/brands', '2019-01-08 05:30:01', NULL, NULL),
(10, '3', 'Add Model  Detail', 'master/modal', '2019-01-01 11:15:01', NULL, NULL),
(11, '3', 'Workshop Add', 'SaiAutoCare/workshop/add', '2019-01-28 06:17:11', NULL, NULL),
(12, '3', 'Manage Customer', 'SaiAutoCare/customer/add', '2019-01-28 06:18:18', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `markets`
--

CREATE TABLE `markets` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `item` varchar(100) DEFAULT NULL,
  `item_discription` text NOT NULL,
  `quantity` int(100) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `total_price` double(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(6) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `parent_id` int(5) DEFAULT '0',
  `sort` int(1) DEFAULT '0',
  `has_submenu` smallint(1) DEFAULT '0',
  `role_id` varchar(255) DEFAULT NULL,
  `trash` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_01_25_192319_create_sales_table', 1),
(2, '2019_01_25_193229_create_product_sale_table', 1),
(3, '2019_01_25_193410_create_service_sale_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modals`
--

CREATE TABLE `modals` (
  `id` int(10) UNSIGNED NOT NULL,
  `model_name` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modals`
--

INSERT INTO `modals` (`id`, `model_name`, `brand_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'motor', 1, NULL, '2019-04-13 06:29:20', '2019-04-13 06:29:20'),
(2, 'motor1', 2, NULL, '2019-04-13 09:41:37', '2019-04-13 09:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('ashutoshphoenixsofts@gmail.com', '$2y$10$gZ2jQp2xcgXrl0CgAj/GI.LXO7nhJDm1tsp6Z.W2gQe2hisCLly.C', '2019-01-24 10:18:06'),
('ashutoshphoenixsoft@gmail.com', '$2y$10$JpM5eVsW3e.5e2Udq8vrSO1L5Iyfp.f5.N0U11v//eDOhWijvTZV2', '2019-01-24 10:43:37');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_number` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hsn` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_price` double(155,2) DEFAULT NULL,
  `unit_price_exit` double(155,2) DEFAULT NULL,
  `sgst` double(155,2) NOT NULL,
  `cgst` double(155,2) NOT NULL,
  `igst` double(155,2) NOT NULL,
  `gst` double(155,2) DEFAULT NULL,
  `discount_value` double(155,2) NOT NULL DEFAULT '0.00',
  `stock_in` double(155,2) NOT NULL DEFAULT '0.00',
  `stock_out` double(155,2) NOT NULL DEFAULT '0.00',
  `stock_available` double(155,2) NOT NULL DEFAULT '0.00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `company_name`, `model_number`, `hsn`, `unit_price`, `unit_price_exit`, `sgst`, `cgst`, `igst`, `gst`, `discount_value`, `stock_in`, `stock_out`, `stock_available`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'bike', '1', '1', '324', 100.00, 200.00, 2.00, 3.00, 2.00, 7.00, 2.00, 455.00, 44.00, -71.00, NULL, '2019-04-13 06:31:57', '2019-04-18 00:00:02'),
(2, 'ergre', '2', '2', 'NA', 100.00, 200.00, 9.00, 9.00, 0.00, 18.00, 1.00, 234.00, 36.00, -46.00, NULL, '2019-04-13 09:45:05', '2019-04-18 00:00:02'),
(3, 'ffffff', '1', '1', '23GFGHHG', 1000.00, 2000.00, 2.00, 3.00, 13.00, 18.00, 4.00, 0.00, 0.00, 0.00, NULL, '2019-04-17 23:56:58', '2019-04-17 23:56:58');

-- --------------------------------------------------------

--
-- Table structure for table `product_saled_logs`
--

CREATE TABLE `product_saled_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `job_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_hsn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_price_without_gst` double(100,5) DEFAULT NULL,
  `product_price_with_gst` double(100,5) DEFAULT NULL,
  `product_gst` double(100,5) DEFAULT NULL,
  `product_quantity` double(100,5) DEFAULT NULL,
  `product_discount` double(100,5) DEFAULT NULL,
  `product_total_price` double(100,5) DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(155) UNSIGNED NOT NULL,
  `user_id` int(100) NOT NULL,
  `supplier_name` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_invoice_id` int(100) DEFAULT NULL,
  `bill_num` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `product_id` int(155) DEFAULT NULL,
  `company_name` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_discription` text COLLATE utf8mb4_unicode_ci,
  `model_number` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `part_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discription` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hsn` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_price` double(155,6) DEFAULT '0.000000',
  `unit_price_exit` float(155,6) NOT NULL,
  `quantity` double(155,6) DEFAULT '0.000000',
  `gst` double(155,6) DEFAULT '0.000000',
  `discount` double(155,6) DEFAULT NULL,
  `total_amount` double(155,6) DEFAULT NULL,
  `is_returned` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=>"no",1=>"yes"',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `user_id`, `supplier_name`, `purchase_invoice_id`, `bill_num`, `bill_date`, `product_id`, `company_name`, `purchase_discription`, `model_number`, `part_number`, `discription`, `hsn`, `unit_price`, `unit_price_exit`, `quantity`, `gst`, `discount`, `total_amount`, `is_returned`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, '1', 1, '34534', '2019-04-13', 1, '1', 'dfg', '1', '345', '345', '324', 100.000000, 200.000000, 5.000000, 7.000000, NULL, 535.000000, 1, NULL, '2019-04-13 06:32:26', '2019-04-13 06:34:03'),
(2, 1, '1', 2, '34534', '2019-04-13', 1, '1', 'dfg', '1', 'fdg', 'dfg', '324', 100.000000, 200.000000, 5.000000, 7.000000, NULL, 535.000000, 1, NULL, '2019-04-13 06:59:42', '2019-04-13 07:01:45'),
(3, 1, '1', 3, '35345', '2019-04-16', 2, '2', 'dgdfg', '2', '435', 'dfg', 'NA', 100.000000, 200.000000, 234.000000, 18.000000, NULL, 27612.000000, 0, NULL, '2019-04-17 05:55:17', '2019-04-17 05:55:17'),
(4, 1, '1', 3, '35345', '2019-04-16', 1, '1', 'dgdfg', '1', 'sf', 'sf', '324', 100.000000, 200.000000, 435.000000, 7.000000, NULL, 46545.000000, 0, NULL, '2019-04-17 05:55:17', '2019-04-17 05:55:17'),
(5, 1, '1', 4, '45dfg', '2019-04-17', 1, '1', 'fdsf', '1', '5fghdfg', '56dfg', '324', 100.000000, 200.000000, 10.000000, 7.000000, NULL, 1070.000000, 0, NULL, '2019-04-17 23:57:45', '2019-04-17 23:57:45');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_invoices`
--

CREATE TABLE `purchase_invoices` (
  `id` int(155) NOT NULL,
  `supplier_id` int(155) NOT NULL,
  `purchase_invoice_number` varchar(155) DEFAULT NULL,
  `purchase_invoice_date` date DEFAULT NULL,
  `purchase_invoice_amount` float(155,4) DEFAULT NULL COMMENT 'original amount',
  `purchase_discription` text,
  `payment_type` int(11) DEFAULT NULL,
  `total_purchase_amount` float(155,4) DEFAULT NULL COMMENT 'our calculation for alll product',
  `purchase_due_amount` float(155,4) DEFAULT NULL COMMENT 'remaing amount for supplier for this purchase invoice',
  `satus` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(155) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_invoices`
--

INSERT INTO `purchase_invoices` (`id`, `supplier_id`, `purchase_invoice_number`, `purchase_invoice_date`, `purchase_invoice_amount`, `purchase_discription`, `payment_type`, `total_purchase_amount`, `purchase_due_amount`, `satus`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '34534', '2019-04-13', NULL, 'dfg', NULL, NULL, NULL, 1, 1, '2019-04-13 06:32:26', '2019-04-13 06:32:26', NULL),
(2, 1, '34534', '2019-04-13', NULL, 'dfg', NULL, NULL, NULL, 1, 1, '2019-04-13 06:59:42', '2019-04-13 06:59:42', NULL),
(3, 1, '35345', '2019-04-16', NULL, 'dgdfg', NULL, NULL, NULL, 1, 1, '2019-04-17 05:55:17', '2019-04-17 05:55:17', NULL),
(4, 1, '45dfg', '2019-04-17', NULL, 'fdsf', NULL, NULL, NULL, 1, 1, '2019-04-17 23:57:45', '2019-04-17 23:57:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

CREATE TABLE `purchase_returns` (
  `id` int(155) NOT NULL,
  `purchase_id` int(155) NOT NULL,
  `quantity` float(155,9) DEFAULT NULL,
  `user_id` int(155) DEFAULT NULL,
  `comments` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_returns`
--

INSERT INTO `purchase_returns` (`id`, `purchase_id`, `quantity`, `user_id`, `comments`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 5.000000000, 1, 'sgd', '2019-04-13 06:34:03', '2019-04-13 06:34:03', NULL),
(2, 2, 5.000000000, 1, 'd', '2019-04-13 07:01:45', '2019-04-13 07:01:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `return_spare_logs`
--

CREATE TABLE `return_spare_logs` (
  `id` int(155) NOT NULL,
  `job_id` int(155) NOT NULL,
  `quantity` int(155) DEFAULT NULL,
  `user_id` int(155) DEFAULT NULL,
  `comments` varchar(155) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `return_spare_logs`
--

INSERT INTO `return_spare_logs` (`id`, `job_id`, `quantity`, `user_id`, `comments`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 1, 'sdf', '2019-04-13 06:58:42', '2019-04-13 06:58:42', NULL),
(2, 3, 2, 1, 'dfgfd', '2019-04-13 07:04:53', '2019-04-13 07:04:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(6) NOT NULL,
  `role_name` varchar(191) DEFAULT NULL,
  `role_code` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `role_code`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Super Admin', 'SUP', 1, '2019-01-01 10:31:58', '0000-00-00 00:00:00', NULL),
(2, 'marketing', 'MKT', 1, '2019-01-01 10:31:54', '0000-00-00 00:00:00', NULL),
(4, 'Pubic', 'PLC', 1, '2019-01-01 20:39:00', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `job_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_job_available` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `submited_part_discription` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_item_submited` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_type` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_name` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_sgst` double(155,2) NOT NULL,
  `service_cgst` double(155,2) NOT NULL,
  `service_igst` double(155,2) NOT NULL,
  `service_gst` int(100) DEFAULT NULL,
  `service_discount` double(155,2) NOT NULL DEFAULT '0.00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_type`, `service_name`, `brand_name`, `model_name`, `price`, `service_sgst`, `service_cgst`, `service_igst`, `service_gst`, `service_discount`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '1', 'paint', '1', '1', '100', 3.00, 5.00, 4.00, 12, 2.00, NULL, '2019-04-13 06:36:25', '2019-04-13 06:36:25'),
(2, '2', 'bjhvxj', '2', '2', '1000', 9.00, 9.00, 0.00, 18, 1.00, NULL, '2019-04-13 09:43:26', '2019-04-13 09:43:26'),
(3, '2', 'bjhvxj', '1', '1', '100', 2.00, 3.00, 3.00, 8, 2.00, NULL, '2019-04-17 23:55:39', '2019-04-17 23:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `service_names`
--

CREATE TABLE `service_names` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_type_id` int(100) DEFAULT NULL,
  `service_name` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_names`
--

INSERT INTO `service_names` (`id`, `service_type_id`, `service_name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'paint', NULL, '2019-04-13 06:30:00', '2019-04-13 06:30:00'),
(2, 2, 'bjhvxj', NULL, '2019-04-13 09:42:26', '2019-04-13 09:42:26');

-- --------------------------------------------------------

--
-- Table structure for table `service_saled_logs`
--

CREATE TABLE `service_saled_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `job_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_hsn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_price_without_gst` double(100,5) DEFAULT NULL,
  `ervice_price_with_gst` double(100,5) DEFAULT NULL,
  `service_gst` double(100,5) DEFAULT NULL,
  `service_quantity` double(100,5) DEFAULT NULL,
  `service_discount` double(100,5) DEFAULT NULL,
  `service_total_price` double(100,5) DEFAULT NULL,
  `service_notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_types`
--

CREATE TABLE `service_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_type_name` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_types`
--

INSERT INTO `service_types` (`id`, `service_type_name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'painting', NULL, '2019-04-13 06:29:41', '2019-04-13 06:29:41'),
(2, 'denting', NULL, '2019-04-13 09:42:10', '2019-04-13 09:42:10');

-- --------------------------------------------------------

--
-- Table structure for table `submiter_part_details`
--

CREATE TABLE `submiter_part_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `workshop_id` int(11) NOT NULL,
  `part_name` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `supplier_name` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mob_num` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `gstin` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `supplier_name`, `mob_num`, `address`, `email`, `email_verified_at`, `gstin`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'ashutosh', NULL, 'ashutoshkumarchoubey@gmail,com\r\nplot No-GA,430 Chandrasekharpur, Axis Bank ATM, Sailashree Vihar', 'ashutoshkumarchoubey@gmail.com', NULL, '435df', NULL, NULL, '2019-04-13 06:30:41', '2019-04-13 06:30:41');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_debit_logs`
--

CREATE TABLE `supplier_debit_logs` (
  `id` int(100) NOT NULL,
  `supplier_id` int(100) NOT NULL,
  `purchase_invoice_id` int(100) DEFAULT NULL,
  `purchase_id` int(100) DEFAULT NULL,
  `debit_amount` float(100,2) DEFAULT NULL,
  `credit` float(155,4) DEFAULT NULL,
  `is_debit` int(11) DEFAULT '1' COMMENT '0=>credit,1=>debit',
  `comments` varchar(155) DEFAULT NULL,
  `payment_type` int(11) DEFAULT NULL COMMENT '''1''=>''By Cash'',''2''=>''By Internate Banking'',''3''=>''By Cheque''',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_debit_logs`
--

INSERT INTO `supplier_debit_logs` (`id`, `supplier_id`, `purchase_invoice_id`, `purchase_id`, `debit_amount`, `credit`, `is_debit`, `comments`, `payment_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 1070.00, NULL, 1, 'dfg', NULL, '2019-04-13 06:32:26', '2019-04-13 06:32:26', NULL),
(2, 1, 2, 2, 1070.00, NULL, 1, 'dfg', NULL, '2019-04-13 06:59:42', '2019-04-13 06:59:42', NULL),
(3, 1, 3, 3, 27612.00, NULL, 1, 'dgdfg', NULL, '2019-04-17 05:55:17', '2019-04-17 05:55:17', NULL),
(4, 1, 3, 4, 46545.00, NULL, 1, 'dgdfg', NULL, '2019-04-17 05:55:17', '2019-04-17 05:55:17', NULL),
(5, 1, 4, 5, 1070.00, NULL, 1, 'fdsf', NULL, '2019-04-17 23:57:45', '2019-04-17 23:57:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testing`
--

CREATE TABLE `testing` (
  `id` int(155) NOT NULL,
  `module_name` varchar(155) DEFAULT NULL,
  `sub_module` varchar(155) DEFAULT NULL,
  `functionality` varchar(155) DEFAULT NULL,
  `discription` text,
  `status` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testing`
--

INSERT INTO `testing` (`id`, `module_name`, `sub_module`, `functionality`, `discription`, `status`, `created_at`) VALUES
(1, 'Credit Debit Log', 'Add', 'Save', 'multipale add fuctionality ', 'pass', '2019-02-06 13:07:07'),
(2, 'Credit Debit Log', 'Add', 'update', 'checking with various  ', 'pass', '2019-02-06 13:10:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hint` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT '2',
  `avatar` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `password_hint`, `remember_token`, `role_id`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 'Ashutosh Kumar Choubey', 'admin@admin.com', NULL, '$2y$10$IDRlMIiXorKrci4p0poPPOxducGKbdLV/gExYtbjb6QtsuytjOXMW', '111111', '64KGtZ9w2rCdgAF0rLNJy508WH6iLNWYduDWlYdTDgy1lhusVp285Dh5gVcc', 1, NULL, '2018-12-29 08:16:09', '2019-01-08 23:27:54'),
(2, 'Sai Auto Care', 'saiautocare18@gmail.com', NULL, '$2y$10$9ZwtUlXD.yJInd17D/GMCeo5/zCqjtBjXK4wIxJcZEjZLiGyvEOFS', NULL, NULL, 1, NULL, '2018-12-24 08:19:51', '2018-12-24 08:19:51'),
(16, 'Marketing', 'marketing@marketing.com', NULL, '$2y$10$Sn/tpLjRgWFoI5XvydQ83.gxmkkt1v/sV.bxk9i3jXZBWleMNrS.2', 'marketing', 'lcQYaSszUCITE7f31yjdckBnSgBfngoUvwTW5GZnvzDMnWpeuFAyItlMGOAk', 2, NULL, '2019-01-08 22:32:33', '2019-01-08 22:32:33'),
(17, 'Hemanta parida', 'hemantaparida@gmail.com', NULL, '$2y$10$7yi1BPyRSihrhX8D/ssnwerkIKVoe6LsD0xGxvY7sUo83cD6916zW', NULL, 'FJ9meZcWbNYPEmDkU0Yu8F1ZngE9zOSA85MYUiTCODxl8PxOczCz9wjOOWQV', 2, NULL, '2019-01-09 20:02:02', '2019-01-09 20:02:02'),
(18, 'babuna', 'Babuna@gmail.com', NULL, '$2y$10$qieNzm0y5BxPA9hot2TZTOXE6NeFXk/J33Fqv1OkAb2ISwipkI5dS', 'babuna123', 'tvvFsVwQhWScou3QfUh9GQwosbcuodlsH2RYXJmDrruLabQ9Hj4mjy8tHutP', 2, NULL, '2019-01-09 20:07:15', '2019-03-06 00:28:34'),
(19, 'susanta parida', 'susanta@gmail.com', NULL, '$2y$10$RD7X6XmGx9QuQmDxFFXn/OGFWtAiJyB09gAjn.ZPghiWxCysLiO6O', NULL, 'Fw6qLZpMoBUnHz3tpXa7GrqQI8H7UCE19VFcw8cM0m2sQ75goxPMWreqniSD', 2, NULL, '2019-01-09 23:15:32', '2019-01-09 23:15:32'),
(21, 'The castle inn', 'castleinn@gmail.com', NULL, '$2y$10$YyTv/vShYR7W8aRLHsjckeVGoMTx7orZTEKeWU0FDdgEJBPPLe962', NULL, 'blIjCKRMUbxY2R4rr2M4SNJDPdxZjxQ1ABDss5uwCzTeurICuFflZQ0O6iM2', 2, NULL, '2019-01-11 22:01:54', '2019-01-11 22:01:54'),
(22, 'azad auto electrical', 'azad@gmail.com', NULL, '$2y$10$lLQJIrq7UFZj79XaLGZE1.itUeMQYb0UwKc/kSLVZZPlQ5GwdPHTi', NULL, 'rnVGzjqUU0nW1fEhms1Xwu91mMQTfNYy6OIpUjTiJuBj5a0uDWjcoKeItHMb', 2, NULL, '2019-01-16 23:24:23', '2019-01-30 19:13:30'),
(23, 'Chicken Dhanu', 'chicken@gmail.com', NULL, '$2y$10$W0hoJ6846KUGlJrJavNrre3Nj9PmmzX0XkfL/r3zZE2TELmrwmbSq', NULL, 'we3MnMJQjsruieXIIabRqmpNEqxRWO34h4tDBXZD6oSpra95JTF8n751xm5h', 2, NULL, '2019-01-22 01:57:08', '2019-01-22 01:57:08'),
(24, 'jubula', 'jubula@gmail.com', NULL, '$2y$10$XX1a2SFvUu2VWsStdx5Fu.KQJ8ZlfN7is/Y9tgcX/BSOSwnpq6I5a', NULL, 'PHXWJljPxKrFiddJHGkpYwLMYQKOcHaIasfugHYQRvGoeyh7i5PR9dMWIsEH', 2, NULL, '2019-01-25 19:22:23', '2019-01-25 19:22:23'),
(25, 'santosh sahoo', 'santu@gmail.com', NULL, '$2y$10$zmOpKORdrVnWMGmgSL0WWu1r/vn3R7Aqu14M56YclutiEVbuOoyam', NULL, 'rWdErFOy7dO2ezEd3eW2kaLx6fCCsdWGdWwmTUkNWbYGYbjIYB4WfL594D8t', 2, NULL, '2019-02-12 00:26:17', '2019-02-12 00:26:17');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` bigint(20) NOT NULL,
  `users_id` int(10) DEFAULT NULL,
  `employee_gender` varchar(1000) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `office_address` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `bank_account_name` varchar(255) DEFAULT NULL,
  `bank_account_no` varchar(255) DEFAULT NULL,
  `bank_ifsc_code` varchar(200) DEFAULT NULL,
  `specimen_of_full_signature` varchar(255) DEFAULT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `users_id`, `employee_gender`, `Address`, `office_address`, `mobile_number`, `bank_account_name`, `bank_account_no`, `bank_ifsc_code`, `specimen_of_full_signature`, `department_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(11, 1, 'male', 'plot No-GA,430 Chandrasekharpur, Axis Bank ATM, Sailashree Vihar', 'plot No-GA,430 Chandrasekharpur, Axis Bank ATM, Sailashree Vihar', '9658476170', NULL, NULL, NULL, NULL, 'administrative', '2019-01-08 16:27:54', '2019-01-08 16:27:54', NULL),
(12, 17, 'male', 'bhubaneswar', NULL, '7683855014', NULL, NULL, NULL, NULL, 'administrative', '2019-01-09 13:02:02', '2019-01-09 13:02:02', NULL),
(13, 18, 'male', NULL, NULL, '7978262599', 'admin@admin.com', NULL, NULL, NULL, 'other', '2019-01-09 13:07:15', '2019-03-05 17:28:34', NULL),
(14, 19, 'male', 'bbsr', NULL, NULL, NULL, NULL, NULL, NULL, 'other', '2019-01-09 16:15:32', '2019-01-09 16:15:32', NULL),
(16, 21, 'male', 'bbsr', 'sbi bank colony,kesura', '9437284700', NULL, NULL, NULL, NULL, 'other', '2019-01-11 15:01:54', '2019-01-11 15:01:54', NULL),
(17, 22, 'male', NULL, NULL, '8908740735', NULL, NULL, NULL, NULL, 'other', '2019-01-16 16:24:23', '2019-01-30 12:13:30', NULL),
(18, 23, 'male', NULL, NULL, '9778696887', NULL, NULL, NULL, NULL, 'other', '2019-01-21 18:57:08', '2019-01-21 18:57:08', NULL),
(19, 24, 'male', NULL, NULL, '9337434455', NULL, NULL, NULL, NULL, 'other', '2019-01-25 12:22:23', '2019-01-25 12:22:23', NULL),
(20, 25, 'male', NULL, NULL, NULL, 'admin@admin.com', NULL, NULL, NULL, NULL, '2019-02-11 17:26:17', '2019-02-11 17:26:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_details`
--

CREATE TABLE `vehicle_details` (
  `id` int(155) NOT NULL,
  `customer_id` int(155) DEFAULT NULL,
  `workshop_id` int(155) DEFAULT NULL,
  `sale_id` int(155) DEFAULT NULL,
  `vehicle_id` varchar(155) DEFAULT NULL,
  `vehicle_reg_number` varchar(155) DEFAULT NULL,
  `model_year` varchar(155) DEFAULT NULL,
  `brand` int(100) DEFAULT NULL,
  `vin` varchar(155) DEFAULT NULL,
  `fuel_type` varchar(155) DEFAULT NULL,
  `engine_number` varchar(155) DEFAULT NULL,
  `company_name` varchar(155) DEFAULT NULL,
  `reg_number` varchar(155) DEFAULT NULL,
  `odometer_reading` varchar(155) DEFAULT NULL,
  `color` varchar(155) DEFAULT NULL,
  `key_number` varchar(155) DEFAULT NULL,
  `due_in` date DEFAULT NULL,
  `due_out` date DEFAULT NULL,
  `model_number` varchar(155) DEFAULT NULL,
  `advisor` varchar(155) DEFAULT NULL,
  `notes` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle_details`
--

INSERT INTO `vehicle_details` (`id`, `customer_id`, `workshop_id`, `sale_id`, `vehicle_id`, `vehicle_reg_number`, `model_year`, `brand`, `vin`, `fuel_type`, `engine_number`, `company_name`, `reg_number`, `odometer_reading`, `color`, `key_number`, `due_in`, `due_out`, `model_number`, `advisor`, `notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, NULL, NULL, 'F', '35345', 1, 'fdgfdg', 'CNG', '345345', 'dgd', '2019-04-11', '4353', 'dffdf', '4353', '2019-04-12', '2019-04-13', '1', 'df', 'dfg', '2019-04-13 06:37:50', '2019-04-13 06:37:50', NULL),
(2, 2, NULL, NULL, NULL, '345345', '3434', 1, 'df45', 'Petrol', '34534', '435', '2019-04-16', 'dfg', 'dfg', 'd54645', '2019-04-16', '2019-04-16', '1', 'ddfg', 'dfg', '2019-04-17 00:25:35', '2019-04-17 00:25:35', NULL),
(3, 3, NULL, NULL, NULL, '34534DF', '345', 1, '46566', 'Disel', '4645', 'dfgfdg', '2019-04-16', '456', 'dfg', 'dfg', '2019-04-16', '2019-04-11', '1', 'dfg', 'dfg', '2019-04-17 05:54:11', '2019-04-17 05:54:11', NULL),
(4, 4, NULL, NULL, NULL, 'DFG55', '453', 1, '4345', 'Disel', '34534', 'fdgdfg', '2019-04-17', '23432dfd', 'red', '3453', '2019-04-17', '2019-04-17', '1', 'fg', 'df', '2019-04-18 00:00:03', '2019-04-18 00:00:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `workshops`
--

CREATE TABLE `workshops` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(155) DEFAULT NULL,
  `is_workshop` int(11) NOT NULL DEFAULT '1' COMMENT '1=>" workshop ",0=>"sale"',
  `name` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_no` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landline` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_reg_number` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_year` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_number` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vin` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_number` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `odometer_reading` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fuel_type` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `engine_number` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_number` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_in` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_out` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_complete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=>no,1=>yes',
  `advisor` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_price` double(155,5) DEFAULT '0.00000',
  `installmentPayment` double(155,2) DEFAULT '0.00',
  `discount_price` double(155,2) DEFAULT '0.00',
  `balance_price` double(155,2) DEFAULT '0.00',
  `grandTotal` double(155,2) NOT NULL DEFAULT '0.00',
  `serviceGST` tinyint(1) DEFAULT '1',
  `submited_part` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `others_submited_part` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `workshop_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workshops`
--

INSERT INTO `workshops` (`id`, `customer_id`, `is_workshop`, `name`, `reference`, `company`, `gst_no`, `mobile`, `landline`, `email`, `address`, `city`, `state`, `pin`, `vehicle_reg_number`, `model_year`, `company_name`, `model_number`, `brand`, `vin`, `reg_number`, `odometer_reading`, `color`, `fuel_type`, `engine_number`, `key_number`, `due_in`, `due_out`, `status`, `is_complete`, `advisor`, `notes`, `paid_price`, `installmentPayment`, `discount_price`, `balance_price`, `grandTotal`, `serviceGST`, `submited_part`, `others_submited_part`, `workshop_date`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Ashutosh Kumar Choubey', 'dfg', 'dfg', '345', '9658476170', '345345', 'ashutoshkumarchoubey@gmail.com', 'ashutoshkum', NULL, NULL, NULL, 'F', '35345', 'dgd', '1', '1', 'fdgfdg', '2019-04-11', '4353', 'dffdf', 'CNG', '345345', '4353', '2019-04-12', '2019-04-13', 'pending', 0, 'df', 'dfg', 23.00000, 0.00, 0.00, 98.00, 98.00, 1, 'xdvdx', NULL, '2019-04-12 18:30:00', NULL, '2019-04-13 06:37:50', '2019-04-17 04:40:38'),
(2, 1, 0, 'fgdgf', '35df', 'dsf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '345345', '3434', '435', '1', '1', 'df45', '2019-04-16', 'dfg', 'dfg', 'Petrol', '34534', 'd54645', NULL, NULL, 'pending', 0, 'ddfg', 'dfg', 0.00000, 0.00, 0.00, 109.76, 109.76, 1, 'gsfsd', NULL, '2019-04-15 18:30:00', NULL, '2019-04-13 06:42:46', '2019-04-17 05:30:30'),
(3, 1, 0, 'Ashutosh Kumar Choubey', 'sdf', 'sf', '345', '9658476170', '345345', 'ashutoshkumarchoubey@gmail.com', 'ashutoshkum', NULL, NULL, NULL, '345', NULL, NULL, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Complete(Spare Purchase)', 1, NULL, NULL, 0.00000, 0.00, 0.00, 419.44, 419.44, 1, NULL, NULL, '2019-04-11 18:30:00', NULL, '2019-04-13 07:00:43', '2019-04-17 04:54:57'),
(4, 1, 1, 'Ashutosh Kumar Choubey', 'dfg', 'dfg', '345', '9658476170', '345345', 'ashutoshkumarchoubey@gmail.com', 'ashutoshkum', NULL, NULL, NULL, 'F', '35345', 'dgd', '1', '1', 'fdgfdg', '2019-04-11', '4353', 'dffdf', 'CNG', '345345', '4353', NULL, NULL, 'pending', 0, 'df', 'dfg', 0.00000, 0.00, 0.00, 1577.80, 1577.80, 1, 'sa', NULL, '2019-04-11 18:30:00', NULL, '2019-04-13 07:06:57', '2019-04-13 09:37:19'),
(5, 1, 1, 'Ashutosh Kumar Choubey', '45', 'sfg', '345', '9658476170', '345345', 'ashutoshkumarchoubey@gmail.com', 'ashutoshkum', NULL, NULL, NULL, 'F', '35345', 'dgd', '1', '1', 'fdgfdg', '2019-04-11', '4353', 'dffdf', 'CNG', '345345', '4353', NULL, NULL, 'pending', 0, 'df', 'dfg', 43.00000, 0.00, 0.00, 1015.40, 1058.40, 1, 'fg', NULL, '2019-04-15 18:30:00', NULL, '2019-04-16 23:57:36', '2019-04-16 23:57:44'),
(6, 2, 1, 'fgdgf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '345345', '3434', '435', '1', '1', 'df45', '2019-04-16', 'dfg', 'dfg', 'Petrol', '34534', 'd54645', '2019-04-16', '2019-04-16', 'pending', 0, 'ddfg', 'dfg', 0.00000, 0.00, 0.00, 529.20, 529.20, 0, 'erff', NULL, '2019-04-15 18:30:00', NULL, '2019-04-17 00:25:35', '2019-04-17 00:25:42'),
(7, 1, 1, 'Ashutosh Kumar Choubey', '35', 'rf', '345', '9658476170', '345345', 'ashutoshkumarchoubey@gmail.com', 'ashutoshkum', NULL, NULL, NULL, 'F', '35345', 'dgd', '1', '1', 'fdgfdg', '2019-04-11', '4353', 'dffdf', 'CNG', '345345', '4353', NULL, NULL, 'pending', 0, 'df', 'dfg', 0.00000, 0.00, 0.00, 0.00, 0.00, 1, 'sdf', NULL, '2019-04-15 18:30:00', NULL, '2019-04-17 00:27:11', '2019-04-17 00:27:11'),
(8, 1, 1, 'Ashutosh Kumar Choubey', '35', 'rf', '345', '9658476170', '345345', 'ashutoshkumarchoubey@gmail.com', 'ashutoshkum', NULL, NULL, NULL, 'F', '35345', 'dgd', '1', '1', 'fdgfdg', '2019-04-11', '4353', 'dffdf', 'CNG', '345345', '4353', NULL, NULL, 'pending', 0, 'df', 'dfg', 0.00000, 0.00, 0.00, 0.00, 0.00, 1, 'sdf', NULL, '2019-04-15 18:30:00', NULL, '2019-04-17 00:30:11', '2019-04-17 00:30:11'),
(9, 1, 1, 'Ashutosh Kumar Choubey', '35', 'rf', '345', '9658476170', '345345', 'ashutoshkumarchoubey@gmail.com', 'ashutoshkum', NULL, NULL, NULL, 'F', '35345', 'dgd', '1', '1', 'fdgfdg', '2019-04-11', '4353', 'dffdf', 'CNG', '345345', '4353', NULL, NULL, 'pending', 0, 'df', 'dfg', 0.00000, 0.00, 0.00, 0.00, 0.00, 1, 'sdf', NULL, '2019-04-15 18:30:00', NULL, '2019-04-17 00:31:09', '2019-04-17 00:31:09');

-- --------------------------------------------------------

--
-- Table structure for table `workshops_withoutgsts`
--

CREATE TABLE `workshops_withoutgsts` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(155) DEFAULT NULL,
  `is_workshop` int(11) NOT NULL DEFAULT '1' COMMENT '1=>" workshop ",0=>"sale"',
  `name` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_no` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landline` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_reg_number` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_year` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_number` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vin` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_number` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `odometer_reading` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fuel_type` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `engine_number` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_number` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_in` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_out` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_complete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=>no,1=>yes',
  `advisor` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_price` double(155,5) DEFAULT '0.00000',
  `installmentPayment` double(155,2) DEFAULT '0.00',
  `discount_price` double(155,2) DEFAULT '0.00',
  `balance_price` double(155,2) DEFAULT '0.00',
  `grandTotal` double(155,2) NOT NULL DEFAULT '0.00',
  `serviceGST` tinyint(1) DEFAULT '1',
  `submited_part` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `others_submited_part` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `workshop_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workshops_withoutgsts`
--

INSERT INTO `workshops_withoutgsts` (`id`, `customer_id`, `is_workshop`, `name`, `reference`, `company`, `gst_no`, `mobile`, `landline`, `email`, `address`, `city`, `state`, `pin`, `vehicle_reg_number`, `model_year`, `company_name`, `model_number`, `brand`, `vin`, `reg_number`, `odometer_reading`, `color`, `fuel_type`, `engine_number`, `key_number`, `due_in`, `due_out`, `status`, `is_complete`, `advisor`, `notes`, `paid_price`, `installmentPayment`, `discount_price`, `balance_price`, `grandTotal`, `serviceGST`, `submited_part`, `others_submited_part`, `workshop_date`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'fgdgf', '35df', 'dsf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '345345', '3434', '435', '1', '1', 'df45', '2019-04-16', 'dfg', 'dfg', 'Petrol', '34534', 'd54645', NULL, NULL, 'pending', 1, 'ddfg', 'dfg', 0.00000, 0.00, 0.00, 98.00, 98.00, 1, 'gsfsd', NULL, '2019-04-15 18:30:00', NULL, '2019-04-17 00:44:17', '2019-04-17 06:32:59'),
(2, 2, 1, 'ashutosh', '35df', 'dsf', '111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123', '3434', '435', '1', '1', 'df45', '2019-04-16', 'dfg', 'dfg', 'Petrol', '34534', 'd54645', NULL, NULL, 'pending', 1, 'ddfg', 'dfg', 0.00000, 28.00, 0.00, 70.00, 98.00, 1, 'gsfsd', NULL, '2019-04-15 18:30:00', NULL, '2019-04-17 00:54:00', '2019-04-17 05:31:45'),
(3, 2, 1, 'fgdgf', 'dfg', 'dfg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '345345', '3434', '435', '1', '1', 'df45', '2019-04-16', 'dfg', 'dfg', 'Petrol', '34534', 'd54645', NULL, NULL, 'pending', 0, 'ddfg', 'dfg', 34.00000, 171.00, 0.00, 285.00, 490.00, 1, 'fdg', NULL, '2019-04-15 18:30:00', NULL, '2019-04-17 02:05:27', '2019-04-17 06:06:52'),
(4, 3, 1, 'wiswa', '36', 'phoenx', '34534dgdg', '34534534534', '45345345345', 'ashutoshkumarchoubey@gmail.com', 'ashutoshkumarchoubey@gmail,com\r\nplot No-GA,430 Chandrasekharpur, Axis Bank ATM, Sailashree Vihar', NULL, NULL, NULL, '34534DF', '345', 'dfgfdg', '1', '1', '46566', '2019-04-16', '456', 'dfg', 'Disel', '4645', 'dfg', '2019-04-16', '2019-04-11', 'pending', 0, 'dfg', 'dfg', 45.00000, 0.00, 0.00, 151.00, 196.00, 1, NULL, NULL, '2019-04-15 18:30:00', NULL, '2019-04-17 05:54:10', '2019-04-17 05:54:22'),
(5, 3, 1, 'wiswa', 'dfdf', '234234', '34534dgdg', '34534534534', '45345345345', 'ashutoshkumarchoubey@gmail.com', 'ashutoshkumarchoubey@gmail,com\r\nplot No-GA,430 Chandrasekharpur, Axis Bank ATM, Sailashree Vihar', NULL, NULL, NULL, '34534DF', '345', 'dfgfdg', '1', '1', '46566', '2019-04-16', '456', 'dfg', 'Disel', '4645', 'dfg', NULL, NULL, 'pending', 0, 'dfg', 'dfg', 234.00000, 0.00, 0.00, 67318890.00, 67319124.00, 1, 'ddf', NULL, '2019-04-15 18:30:00', NULL, '2019-04-17 05:57:43', '2019-04-17 05:59:21'),
(6, 2, 1, 'fgdgf', 'dgf', 'dfg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '345345', '3434', '435', '1', '1', 'df45', '2019-04-16', 'dfg', 'dfg', 'Petrol', '34534', 'd54645', NULL, NULL, 'pending', 0, 'ddfg', 'dfg', 0.00000, 0.00, 0.00, 12996.00, 12996.00, 1, 'sdfds', NULL, '2019-04-15 18:30:00', NULL, '2019-04-17 06:01:34', '2019-04-17 06:08:00'),
(7, 4, 1, 'Mohit Mona', 'dfddf', '46565', 'g4535', '66553', '35345', 'fdhdfh@dfh.dgd', 'dfgdf', NULL, NULL, NULL, 'DFG55', '453', 'fdgdfg', '1', '1', '4345', '2019-04-17', '23432dfd', 'red', 'Disel', '34534', '3453', '2019-04-17', '2019-04-17', 'pending', 0, 'fg', 'df', 300.00000, 0.00, 0.00, 1862.00, 2162.00, 1, 'dfdsf', NULL, '2019-04-16 18:30:00', NULL, '2019-04-18 00:00:02', '2019-04-18 00:02:03');

-- --------------------------------------------------------

--
-- Table structure for table `workshop_products`
--

CREATE TABLE `workshop_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `workshop_id` int(11) NOT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_price` float(100,2) DEFAULT NULL,
  `workshop_product_model` int(100) DEFAULT NULL,
  `workshop_product_brand` int(100) DEFAULT NULL,
  `is_returned` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workshop_products`
--

INSERT INTO `workshop_products` (`id`, `product_id`, `workshop_id`, `product_quantity`, `product_price`, `workshop_product_model`, `workshop_product_brand`, `is_returned`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, 200.00, 1, 1, 0, '2019-04-13 06:37:50', '2019-04-13 06:37:50'),
(4, 1, 3, 2, 200.00, 1, 1, 1, '2019-04-13 07:00:43', '2019-04-13 07:04:53'),
(5, 1, 4, 3, 200.00, 1, 1, 0, '2019-04-13 07:06:57', '2019-04-13 07:06:57'),
(6, 1, 5, 2, 200.00, 1, 1, 0, '2019-04-16 23:57:36', '2019-04-16 23:57:36'),
(11, 1, 2, 0, 200.00, 1, 1, 0, '2019-04-17 04:29:34', '2019-04-17 04:29:34');

-- --------------------------------------------------------

--
-- Table structure for table `workshop_products_estimateds`
--

CREATE TABLE `workshop_products_estimateds` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id_es` int(11) NOT NULL,
  `workshop_id_es` int(11) NOT NULL,
  `product_quantity_es` bigint(11) DEFAULT NULL,
  `product_price_es` float(100,2) DEFAULT NULL,
  `workshop_product_model_es` int(100) DEFAULT NULL,
  `workshop_product_brand_es` int(100) DEFAULT NULL,
  `is_returned_es` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workshop_products_estimateds`
--

INSERT INTO `workshop_products_estimateds` (`id`, `product_id_es`, `workshop_id_es`, `product_quantity_es`, `product_price_es`, `workshop_product_model_es`, `workshop_product_brand_es`, `is_returned_es`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10, 200.00, 1, 1, 0, '2019-04-13 06:37:50', '2019-04-13 06:37:50'),
(2, 1, 4, 4, 200.00, 1, 1, 0, '2019-04-13 07:06:57', '2019-04-13 07:06:57'),
(3, 1, 5, 2, 200.00, 1, 1, 0, '2019-04-16 23:57:36', '2019-04-16 23:57:36'),
(4, 1, 6, 2, 200.00, 1, 1, 0, '2019-04-17 00:25:35', '2019-04-17 00:25:35');

-- --------------------------------------------------------

--
-- Table structure for table `workshop_products_estimateds_withoutgsts`
--

CREATE TABLE `workshop_products_estimateds_withoutgsts` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id_es` int(11) NOT NULL,
  `workshop_id_es` int(11) NOT NULL,
  `product_quantity_es` bigint(11) DEFAULT NULL,
  `product_price_es` float(100,2) DEFAULT NULL,
  `workshop_product_model_es` int(100) DEFAULT NULL,
  `workshop_product_brand_es` int(100) DEFAULT NULL,
  `is_returned_es` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workshop_products_estimateds_withoutgsts`
--

INSERT INTO `workshop_products_estimateds_withoutgsts` (`id`, `product_id_es`, `workshop_id_es`, `product_quantity_es`, `product_price_es`, `workshop_product_model_es`, `workshop_product_brand_es`, `is_returned_es`, `created_at`, `updated_at`) VALUES
(1, 1, 9, 2, 200.00, 1, 1, 0, '2019-04-17 00:31:09', '2019-04-17 00:31:09'),
(2, 1, 1, 5, 200.00, 1, 1, 0, '2019-04-17 00:44:18', '2019-04-17 00:44:18'),
(3, 1, 2, 5, 200.00, 1, 1, 0, '2019-04-17 00:54:00', '2019-04-17 00:54:00'),
(4, 1, 3, 2, 200.00, 1, 1, 0, '2019-04-17 02:05:27', '2019-04-17 02:05:27'),
(5, 1, 5, 343223, 200.00, 1, 1, 0, '2019-04-17 05:57:44', '2019-04-17 05:57:44'),
(6, 2, 5, 234, 200.00, 2, 2, 0, '2019-04-17 05:57:44', '2019-04-17 05:57:44'),
(7, 1, 6, 5, 200.00, 1, 1, 0, '2019-04-17 06:01:35', '2019-04-17 06:01:35'),
(8, 1, 7, 5, 200.00, 1, 1, 0, '2019-04-18 00:00:02', '2019-04-18 00:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `workshop_products_withoutgsts`
--

CREATE TABLE `workshop_products_withoutgsts` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `workshop_id` int(11) NOT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_price` float(100,2) DEFAULT NULL,
  `workshop_product_model` int(100) DEFAULT NULL,
  `workshop_product_brand` int(100) DEFAULT NULL,
  `is_returned` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workshop_products_withoutgsts`
--

INSERT INTO `workshop_products_withoutgsts` (`id`, `product_id`, `workshop_id`, `product_quantity`, `product_price`, `workshop_product_model`, `workshop_product_brand`, `is_returned`, `created_at`, `updated_at`) VALUES
(1, 1, 8, 0, 200.00, 1, 1, 0, '2019-04-17 00:30:11', '2019-04-17 00:30:11'),
(2, 1, 9, 0, 200.00, 1, 1, 0, '2019-04-17 00:31:09', '2019-04-17 00:31:09'),
(5, 1, 3, 0, 200.00, 1, 1, 0, '2019-04-17 02:05:27', '2019-04-17 02:05:27'),
(9, 1, 2, 0, 200.00, 1, 1, 0, '2019-04-17 04:35:12', '2019-04-17 04:35:12'),
(10, 1, 1, 0, 200.00, 1, 1, 0, '2019-04-17 04:40:31', '2019-04-17 04:40:31'),
(11, 1, 4, 0, 200.00, 1, 1, 0, '2019-04-17 05:54:10', '2019-04-17 05:54:10'),
(12, 1, 5, 2, 200.00, 1, 1, 0, '2019-04-17 05:57:43', '2019-04-17 05:57:43'),
(13, 2, 5, 3, 200.00, 2, 2, 0, '2019-04-17 05:57:43', '2019-04-17 05:57:43'),
(16, 2, 6, 10, 200.00, 2, 2, 0, '2019-04-17 06:07:53', '2019-04-17 06:07:53'),
(17, 1, 6, 10, 200.00, 1, 1, 0, '2019-04-17 06:07:53', '2019-04-17 06:07:53'),
(18, 2, 6, 20, 200.00, 2, 2, 0, '2019-04-17 06:07:53', '2019-04-17 06:07:53'),
(19, 1, 6, 20, 200.00, 1, 1, 0, '2019-04-17 06:07:54', '2019-04-17 06:07:54'),
(20, 1, 7, 2, 200.00, 1, 1, 0, '2019-04-18 00:00:02', '2019-04-18 00:00:02'),
(21, 2, 7, 3, 200.00, 2, 2, 0, '2019-04-18 00:00:02', '2019-04-18 00:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `workshop_services`
--

CREATE TABLE `workshop_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_type_id` int(100) DEFAULT NULL,
  `service_id` int(11) NOT NULL,
  `workshop_id` int(11) NOT NULL,
  `service_quantity` int(11) DEFAULT '1',
  `workshop_service_model` int(100) DEFAULT NULL,
  `workshop_service_brand` int(100) DEFAULT NULL,
  `service_price` float(100,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workshop_services`
--

INSERT INTO `workshop_services` (`id`, `service_type_id`, `service_id`, `workshop_id`, `service_quantity`, `workshop_service_model`, `workshop_service_brand`, `service_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 1, 1, 100.00, '2019-04-13 06:37:50', '2019-04-13 06:37:50'),
(2, 1, 1, 4, 1, 1, 1, 100.00, '2019-04-13 07:06:57', '2019-04-13 07:06:57'),
(3, 1, 1, 5, 1, 1, 1, 100.00, '2019-04-16 23:57:36', '2019-04-16 23:57:36'),
(4, 1, 1, 5, 1, 1, 1, 100.00, '2019-04-16 23:57:36', '2019-04-16 23:57:36'),
(5, 1, 1, 6, 1, 1, 1, 100.00, '2019-04-17 00:25:35', '2019-04-17 00:25:35'),
(10, 1, 1, 2, 1, 1, 1, 100.00, '2019-04-17 04:29:34', '2019-04-17 04:29:34');

-- --------------------------------------------------------

--
-- Table structure for table `workshop_services_withoutgsts`
--

CREATE TABLE `workshop_services_withoutgsts` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_type_id` int(100) DEFAULT NULL,
  `service_id` int(11) NOT NULL,
  `workshop_id` int(11) NOT NULL,
  `service_quantity` int(11) DEFAULT '1',
  `workshop_service_model` int(100) DEFAULT NULL,
  `workshop_service_brand` int(100) DEFAULT NULL,
  `service_price` float(100,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workshop_services_withoutgsts`
--

INSERT INTO `workshop_services_withoutgsts` (`id`, `service_type_id`, `service_id`, `workshop_id`, `service_quantity`, `workshop_service_model`, `workshop_service_brand`, `service_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 9, 1, 1, 1, 100.00, '2019-04-17 00:31:09', '2019-04-17 00:31:09'),
(4, 1, 1, 3, 1, 1, 1, 100.00, '2019-04-17 02:05:27', '2019-04-17 02:05:27'),
(8, 1, 1, 2, 1, 1, 1, 100.00, '2019-04-17 04:35:12', '2019-04-17 04:35:12'),
(9, 1, 1, 1, 1, 1, 1, 100.00, '2019-04-17 04:40:31', '2019-04-17 04:40:31'),
(10, 1, 1, 4, 1, 1, 1, 100.00, '2019-04-17 05:54:10', '2019-04-17 05:54:10'),
(11, 1, 1, 4, 1, 1, 1, 100.00, '2019-04-17 05:54:10', '2019-04-17 05:54:10'),
(12, 1, 1, 5, 1, 1, 1, 100.00, '2019-04-17 05:57:44', '2019-04-17 05:57:44'),
(14, 1, 1, 6, 1, 1, 1, 100.00, '2019-04-17 06:07:54', '2019-04-17 06:07:54'),
(15, 1, 1, 6, 1, 1, 1, 100.00, '2019-04-17 06:07:54', '2019-04-17 06:07:54'),
(16, 1, 1, 7, 1, 1, 1, 100.00, '2019-04-18 00:00:02', '2019-04-18 00:00:02'),
(17, 2, 3, 7, 1, 1, 1, 100.00, '2019-04-18 00:00:02', '2019-04-18 00:00:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_debit_details`
--
ALTER TABLE `credit_debit_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_debit_logs`
--
ALTER TABLE `customer_debit_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documentations`
--
ALTER TABLE `documentations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estimated_products`
--
ALTER TABLE `estimated_products`
  ADD KEY `id` (`id`);

--
-- Indexes for table `estimated_services`
--
ALTER TABLE `estimated_services`
  ADD KEY `id` (`id`);

--
-- Indexes for table `estimates`
--
ALTER TABLE `estimates`
  ADD KEY `id` (`id`);

--
-- Indexes for table `header_links`
--
ALTER TABLE `header_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `markets`
--
ALTER TABLE `markets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modals`
--
ALTER TABLE `modals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brand_name` (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_saled_logs`
--
ALTER TABLE `product_saled_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_invoices`
--
ALTER TABLE `purchase_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_spare_logs`
--
ALTER TABLE `return_spare_logs`
  ADD KEY `id` (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_names`
--
ALTER TABLE `service_names`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_saled_logs`
--
ALTER TABLE `service_saled_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_types`
--
ALTER TABLE `service_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `submiter_part_details`
--
ALTER TABLE `submiter_part_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_debit_logs`
--
ALTER TABLE `supplier_debit_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testing`
--
ALTER TABLE `testing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_details`
--
ALTER TABLE `vehicle_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workshops`
--
ALTER TABLE `workshops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workshops_withoutgsts`
--
ALTER TABLE `workshops_withoutgsts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workshop_products`
--
ALTER TABLE `workshop_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workshop_products_estimateds`
--
ALTER TABLE `workshop_products_estimateds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workshop_products_estimateds_withoutgsts`
--
ALTER TABLE `workshop_products_estimateds_withoutgsts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workshop_products_withoutgsts`
--
ALTER TABLE `workshop_products_withoutgsts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workshop_services`
--
ALTER TABLE `workshop_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workshop_services_withoutgsts`
--
ALTER TABLE `workshop_services_withoutgsts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `credit_debit_details`
--
ALTER TABLE `credit_debit_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer_debit_logs`
--
ALTER TABLE `customer_debit_logs`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `documentations`
--
ALTER TABLE `documentations`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estimated_products`
--
ALTER TABLE `estimated_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `estimated_services`
--
ALTER TABLE `estimated_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `estimates`
--
ALTER TABLE `estimates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `header_links`
--
ALTER TABLE `header_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `markets`
--
ALTER TABLE `markets`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `modals`
--
ALTER TABLE `modals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_saled_logs`
--
ALTER TABLE `product_saled_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(155) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchase_invoices`
--
ALTER TABLE `purchase_invoices`
  MODIFY `id` int(155) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` int(155) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `return_spare_logs`
--
ALTER TABLE `return_spare_logs`
  MODIFY `id` int(155) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service_names`
--
ALTER TABLE `service_names`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service_saled_logs`
--
ALTER TABLE `service_saled_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_types`
--
ALTER TABLE `service_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `submiter_part_details`
--
ALTER TABLE `submiter_part_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier_debit_logs`
--
ALTER TABLE `supplier_debit_logs`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `testing`
--
ALTER TABLE `testing`
  MODIFY `id` int(155) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `vehicle_details`
--
ALTER TABLE `vehicle_details`
  MODIFY `id` int(155) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `workshops`
--
ALTER TABLE `workshops`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `workshops_withoutgsts`
--
ALTER TABLE `workshops_withoutgsts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `workshop_products`
--
ALTER TABLE `workshop_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `workshop_products_estimateds`
--
ALTER TABLE `workshop_products_estimateds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `workshop_products_estimateds_withoutgsts`
--
ALTER TABLE `workshop_products_estimateds_withoutgsts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `workshop_products_withoutgsts`
--
ALTER TABLE `workshop_products_withoutgsts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `workshop_services`
--
ALTER TABLE `workshop_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `workshop_services_withoutgsts`
--
ALTER TABLE `workshop_services_withoutgsts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
