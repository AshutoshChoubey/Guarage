-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2019 at 05:52 AM
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
-- Indexes for table `workshop_services`
--
ALTER TABLE `workshop_services`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_debit_details`
--
ALTER TABLE `credit_debit_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_debit_logs`
--
ALTER TABLE `customer_debit_logs`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documentations`
--
ALTER TABLE `documentations`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estimated_products`
--
ALTER TABLE `estimated_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estimated_services`
--
ALTER TABLE `estimated_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estimates`
--
ALTER TABLE `estimates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_saled_logs`
--
ALTER TABLE `product_saled_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(155) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_invoices`
--
ALTER TABLE `purchase_invoices`
  MODIFY `id` int(155) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` int(155) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_spare_logs`
--
ALTER TABLE `return_spare_logs`
  MODIFY `id` int(155) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_names`
--
ALTER TABLE `service_names`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_saled_logs`
--
ALTER TABLE `service_saled_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_types`
--
ALTER TABLE `service_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submiter_part_details`
--
ALTER TABLE `submiter_part_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_debit_logs`
--
ALTER TABLE `supplier_debit_logs`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(155) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workshops`
--
ALTER TABLE `workshops`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workshop_products`
--
ALTER TABLE `workshop_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workshop_products_estimateds`
--
ALTER TABLE `workshop_products_estimateds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workshop_services`
--
ALTER TABLE `workshop_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
