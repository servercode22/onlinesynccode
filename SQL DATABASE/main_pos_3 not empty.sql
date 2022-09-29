-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2022 at 12:14 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `main_pos_3`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `transaction_payment_id` int(11) DEFAULT NULL,
  `transfer_transaction_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_account_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `business_id`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-19 04:07:59', '2022-03-19 04:07:59'),
(2, 'default', 'added', 2, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-03-19 04:23:11', '2022-03-19 04:23:11'),
(3, 'default', 'added', 3, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":3000}}', '2022-03-19 04:23:16', '2022-03-19 04:23:16'),
(4, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-19 10:52:42', '2022-03-19 10:52:42'),
(5, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-20 04:19:54', '2022-03-20 04:19:54'),
(6, 'default', 'added', 7, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":5000}}', '2022-03-20 04:20:41', '2022-03-20 04:20:41'),
(7, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-21 06:27:54', '2022-03-21 06:27:54'),
(8, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-21 11:16:14', '2022-03-21 11:16:14'),
(9, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-22 09:41:01', '2022-03-22 09:41:01'),
(10, 'default', 'added', 3, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-03-22 09:50:08', '2022-03-22 09:50:08'),
(11, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-22 14:42:15', '2022-03-22 14:42:15'),
(12, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-22 14:42:16', '2022-03-22 14:42:16'),
(13, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-22 14:42:25', '2022-03-22 14:42:25'),
(14, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-25 11:43:19', '2022-03-25 11:43:19'),
(15, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-25 14:28:56', '2022-03-25 14:28:56'),
(16, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-28 05:39:21', '2022-03-28 05:39:21'),
(17, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-28 10:34:58', '2022-03-28 10:34:58'),
(18, 'default', 'added', 2, 'App\\User', 1, 1, 'App\\User', '{\"name\":\"Mr Zaeem Qureshi\"}', '2022-03-28 11:07:09', '2022-03-28 11:07:09'),
(19, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-28 11:07:29', '2022-03-28 11:07:29'),
(20, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-01 07:01:02', '2022-04-01 07:01:02'),
(21, 'default', 'added', 3, 'App\\User', 1, 1, 'App\\User', '{\"name\":\" zeeshan \"}', '2022-04-01 07:05:05', '2022-04-01 07:05:05'),
(22, 'default', 'added', 4, 'App\\User', 1, 1, 'App\\User', '{\"name\":\" Tehseen \"}', '2022-04-01 07:09:25', '2022-04-01 07:09:25'),
(23, 'default', 'added', 27, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":250}}', '2022-04-01 07:11:23', '2022-04-01 07:11:23'),
(24, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-01 09:10:11', '2022-04-01 09:10:11'),
(25, 'default', 'edited', 2, 'App\\User', 1, 1, 'App\\User', '{\"name\":\"Mr Zaeem Qureshi\"}', '2022-04-01 09:15:21', '2022-04-01 09:15:21'),
(26, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-02 05:29:47', '2022-04-02 05:29:47'),
(27, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-02 05:33:38', '2022-04-02 05:33:38'),
(28, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-02 05:50:25', '2022-04-02 05:50:25');

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_continuous` tinyint(1) NOT NULL DEFAULT 0,
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `description`, `width`, `height`, `paper_width`, `paper_height`, `top_margin`, `left_margin`, `row_distance`, `col_distance`, `stickers_in_one_row`, `is_default`, `is_continuous`, `stickers_in_one_sheet`, `business_id`, `created_at`, `updated_at`) VALUES
(1, '20 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 4\" x 1\", Labels per sheet: 20', 4.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.1250, 0.0000, 0.1875, 2, 0, 0, 20, NULL, '2017-12-18 01:13:44', '2017-12-18 01:13:44'),
(2, '30 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2.625\" x 1\", Labels per sheet: 30', 2.6250, 1.0000, 8.5000, 11.0000, 0.5000, 0.1880, 0.0000, 0.1250, 3, 0, 0, 30, NULL, '2017-12-18 01:04:39', '2017-12-18 01:10:40'),
(3, '32 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1.25\", Labels per sheet: 32', 2.0000, 1.2500, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 32, NULL, '2017-12-18 00:55:40', '2017-12-18 00:55:40'),
(4, '40 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1\", Labels per sheet: 40', 2.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 40, NULL, '2017-12-18 00:58:40', '2017-12-18 00:58:40'),
(5, '50 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 1.5\" x 1\", Labels per sheet: 50', 1.5000, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.0000, 5, 0, 0, 50, NULL, '2017-12-18 00:51:10', '2017-12-18 00:51:10'),
(6, 'Continuous Rolls - 31.75mm x 25.4mm', 'Label Size: 31.75mm x 25.4mm, Gap: 3.18mm', 1.2500, 1.0000, 1.2500, 0.0000, 0.1250, 0.0000, 0.1250, 0.0000, 1, 0, 1, NULL, NULL, '2017-12-18 00:51:10', '2017-12-18 00:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waiter_id` int(10) UNSIGNED DEFAULT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `correspondent_id` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `booking_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_label_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_label_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_sales_tax` int(10) UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT 0.00,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint(4) NOT NULL DEFAULT 1,
  `accounting_method` enum('fifo','lifo','avco') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'includes',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `expiry_type` enum('add_expiry','add_manufacturing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int(11) NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT 1,
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int(10) UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `transaction_edit_days` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `stock_expiry_alert_days` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `keyboard_shortcuts` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weighing_scale_setting` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'used to store the configuration of weighing scale',
  `enable_brand` tinyint(1) NOT NULL DEFAULT 1,
  `enable_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT 1,
  `enable_purchase_status` tinyint(1) DEFAULT 1,
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT 0,
  `default_unit` int(11) DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT 0,
  `enable_racks` tinyint(1) NOT NULL DEFAULT 0,
  `enable_row` tinyint(1) NOT NULL DEFAULT 0,
  `enable_position` tinyint(1) NOT NULL DEFAULT 0,
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT 1,
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT 1,
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT 1,
  `currency_symbol_placement` enum('before','after') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'before',
  `enabled_modules` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '24',
  `ref_no_prefixes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_color` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_labels` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `common_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `secret_key`, `currency_id`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `code_label_1`, `code_1`, `code_label_2`, `code_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `weighing_scale_setting`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_sub_units`, `enable_racks`, `enable_row`, `enable_position`, `enable_editing_product_from_purchase`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `ref_no_prefixes`, `theme_color`, `created_by`, `enable_rp`, `rp_name`, `amount_for_unit_rp`, `min_order_total_for_rp`, `max_rp_per_order`, `redeem_amount_per_unit_rp`, `min_order_total_for_redeem`, `min_redeem_point`, `max_redeem_point`, `rp_expiry_period`, `rp_expiry_type`, `email_settings`, `sms_settings`, `custom_labels`, `common_settings`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Flash Test', 'REK-1011', 91, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25.00, 1, 'Asia/Karachi', 1, 'fifo', '0.00', 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, '1.000', 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"amount_rounding_method\":null,\"cmmsn_calculation_type\":\"invoice_value\",\"razor_pay_key_id\":null,\"razor_pay_key_secret\":null,\"stripe_public_key\":null,\"stripe_secret_key\":null,\"inline_service_staff\":\"1\",\"is_service_staff_required\":\"1\",\"print_on_suspend\":\"1\",\"cash_denominations\":null,\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\",\"tables\",\"modifiers\",\"service_staff\",\"types_of_service\"]', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"purchase_return\":null,\"purchase_order\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":null,\"sales_order\":null}', NULL, NULL, 0, NULL, '1.0000', '1.0000', NULL, '1.0000', '1.0000', NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"sms_service\":\"other\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null,\"custom_pay_4\":null,\"custom_pay_5\":null,\"custom_pay_6\":null,\"custom_pay_7\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase_shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null}}', '{\"default_credit_limit\":null,\"default_datatable_page_entries\":\"25\"}', 1, '2022-03-19 04:37:50', '2022-04-01 07:10:23'),
(2, 'Tueutech', 'CNJ-6723', 91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25.00, 5, 'Asia/Karachi', 1, 'fifo', NULL, 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, '1.000', 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"recent_product_quantity\":\"f2\",\"add_new_product\":\"f4\"}}', NULL, '', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\"]', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"business_location\":\"BL\"}', NULL, NULL, 0, NULL, '1.0000', '1.0000', NULL, '1.0000', '1.0000', NULL, NULL, NULL, 'year', NULL, NULL, NULL, NULL, 1, '2022-04-02 06:04:57', '2022-04-02 06:04:57');

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

CREATE TABLE `business_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `secret_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_scheme_id` int(10) UNSIGNED NOT NULL,
  `invoice_layout_id` int(10) UNSIGNED NOT NULL,
  `sale_invoice_layout_id` int(11) DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT 1,
  `receipt_printer_type` enum('browser','printer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'browser',
  `printer_id` int(11) DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_products` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `default_payment_accounts` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `secret_key`, `location_id`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `invoice_layout_id`, `sale_invoice_layout_id`, `selling_price_group_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `featured_products`, `is_active`, `default_payment_accounts`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'REK-1011', 'BL0001', 'Flash Test', 'DHA', 'Pakistan', 'punjab', 'lahore', '54000', 1, 1, 1, NULL, 1, 'browser', NULL, '03210004567', '', '', '', NULL, 1, '{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null},\"custom_pay_4\":{\"is_enabled\":1,\"account\":null},\"custom_pay_5\":{\"is_enabled\":1,\"account\":null},\"custom_pay_6\":{\"is_enabled\":1,\"account\":null},\"custom_pay_7\":{\"is_enabled\":1,\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2022-03-19 04:37:51', '2022-03-19 04:37:51'),
(2, 1, 'SEO-182', 'BL0002', 'Branch2', 'Gulberg', 'Pakistan', 'Texas', 'Karachi', '54000', 1, 1, 1, NULL, 1, 'browser', NULL, '03445679929', NULL, 'aj2015.1989@outlook.com', 'https://sales.com', NULL, 1, '{\"cash\":{\"is_enabled\":\"1\"},\"card\":{\"is_enabled\":\"1\"},\"cheque\":{\"is_enabled\":\"1\"},\"bank_transfer\":{\"is_enabled\":\"1\"},\"other\":{\"is_enabled\":\"1\"},\"custom_pay_1\":{\"is_enabled\":\"1\"},\"custom_pay_2\":{\"is_enabled\":\"1\"},\"custom_pay_3\":{\"is_enabled\":\"1\"},\"custom_pay_4\":{\"is_enabled\":\"1\"},\"custom_pay_5\":{\"is_enabled\":\"1\"},\"custom_pay_6\":{\"is_enabled\":\"1\"},\"custom_pay_7\":{\"is_enabled\":\"1\"}}', NULL, NULL, NULL, NULL, NULL, '2022-04-01 09:13:10', '2022-04-01 09:13:10'),
(3, 2, 'CNJ-6723', 'BL0001', 'Tueutech', 'ahmad@gmail.com', 'Pakistan', 'Lahore', 'Lahore', '54000', 2, 2, 2, NULL, 1, 'browser', NULL, '03445679929', '', '', '', NULL, 1, '{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null},\"custom_pay_4\":{\"is_enabled\":1,\"account\":null},\"custom_pay_5\":{\"is_enabled\":1,\"account\":null},\"custom_pay_6\":{\"is_enabled\":1,\"account\":null},\"custom_pay_7\":{\"is_enabled\":1,\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2022-04-02 06:04:57', '2022-04-02 06:04:57');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ai_id` int(11) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('close','open') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_card_slips` int(11) NOT NULL DEFAULT 0,
  `total_cheques` int(11) NOT NULL DEFAULT 0,
  `denominations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closing_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sync_status` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `ai_id`, `business_id`, `location_id`, `user_id`, `status`, `closed_at`, `closing_amount`, `total_card_slips`, `total_cheques`, `denominations`, `closing_note`, `created_at`, `updated_at`, `sync_status`) VALUES
('19-1-1-T', 19, 1, 1, 1, 'open', NULL, '0.0000', 0, 0, NULL, NULL, '2022-04-01 07:07:00', '2022-04-01 07:07:30', b'0'),
('A-1-1-0', 1, 1, 1, 1, 'close', '2022-03-19 09:16:53', '0.0000', 0, 0, NULL, NULL, '2022-03-19 04:16:00', '2022-03-19 04:16:53', b'0'),
('C-1-1-2', 2, 1, 1, 1, 'close', '2022-03-19 09:17:27', '1250.0000', 0, 0, NULL, NULL, '2022-03-19 04:17:00', '2022-03-19 04:17:27', b'0'),
('D-1-1-3', 3, 1, 1, 1, 'close', '2022-03-19 09:26:19', '1250.0000', 0, 0, NULL, NULL, '2022-03-19 04:22:00', '2022-03-19 04:26:19', b'0'),
('E-1-1-4', 4, 1, 1, 1, 'close', '2022-03-19 13:17:17', '0.0000', 0, 0, NULL, NULL, '2022-03-19 04:27:00', '2022-03-19 08:17:17', b'0'),
('F-1-1-5', 5, 1, 1, 1, 'close', '2022-03-20 09:19:24', '10000.0000', 0, 0, NULL, NULL, '2022-03-19 08:42:00', '2022-03-20 04:19:24', b'0'),
('G-1-1-6', 7, 1, 1, 1, 'close', '2022-03-20 09:42:10', '3750.0000', 0, 0, NULL, NULL, '2022-03-20 04:21:00', '2022-03-20 04:42:10', b'0'),
('H-1-1-7', 8, 1, 1, 1, 'close', '2022-03-21 16:21:37', '2250.0000', 0, 0, NULL, NULL, '2022-03-21 06:07:00', '2022-03-21 11:21:37', b'0'),
('I-1-1-8', 9, 1, 1, 1, 'close', '2022-03-21 17:14:46', '500.0000', 0, 0, NULL, NULL, '2022-03-21 11:21:00', '2022-03-21 12:14:46', b'0'),
('J-1-1-9', 10, 1, 1, 1, 'close', '2022-03-22 14:53:26', '0.0000', 2, 0, NULL, NULL, '2022-03-21 12:18:00', '2022-03-22 09:53:26', b'0'),
('K-1-1-10', 11, 1, 1, 1, 'close', '2022-03-22 14:55:40', '1300.0000', 0, 0, NULL, NULL, '2022-03-22 09:54:00', '2022-03-22 09:55:40', b'0'),
('L-1-1-11', 12, 1, 1, 1, 'close', '2022-03-22 14:59:47', '2500.0000', 0, 0, NULL, NULL, '2022-03-22 09:58:00', '2022-03-22 09:59:47', b'0'),
('M-1-1-12', 13, 1, 1, 1, 'close', '2022-03-22 15:08:32', '125.0000', 0, 0, NULL, NULL, '2022-03-22 10:07:00', '2022-03-22 10:08:32', b'0'),
('N-1-1-13', 14, 1, 1, 1, 'close', '2022-03-22 15:11:33', '3500.0000', 0, 0, NULL, NULL, '2022-03-22 10:10:00', '2022-03-22 10:11:33', b'0'),
('O-1-1-14', 15, 1, 1, 1, 'close', '2022-03-22 15:25:36', '0.0000', 0, 0, NULL, NULL, '2022-03-22 10:24:00', '2022-03-22 10:25:36', b'0'),
('P-1-1-15', 16, 1, 1, 1, 'close', '2022-03-22 15:30:17', '0.0000', 0, 0, NULL, NULL, '2022-03-22 10:29:00', '2022-03-22 10:30:17', b'0'),
('Q-1-1-16', 17, 1, 1, 1, 'close', '2022-03-22 16:27:18', '1375.0000', 0, 0, NULL, NULL, '2022-03-22 10:30:00', '2022-03-22 11:27:18', b'0'),
('R-1-1-17', 18, 1, 1, 1, 'close', '2022-03-28 10:56:56', '0.0000', 0, 0, NULL, NULL, '2022-03-22 12:58:00', '2022-03-28 05:56:56', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `cash_register_transactions`
--

CREATE TABLE `cash_register_transactions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ai_id` int(11) NOT NULL,
  `cash_register_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `pay_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sync_status` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_register_transactions`
--

INSERT INTO `cash_register_transactions` (`id`, `ai_id`, `cash_register_id`, `amount`, `pay_method`, `type`, `transaction_type`, `transaction_id`, `created_at`, `updated_at`, `sync_status`) VALUES
('A-1-1-0', 1, 'C-1-1-2', '1250.0000', 'cash', 'credit', 'sell', 'C-1-1-2', '2022-03-19 04:17:18', '2022-03-19 04:17:18', b'0'),
('AB-1-1-27', 14, 'J-1-1-9', '375.0000', 'card', 'credit', 'sell', 'AE-1-1-30', '2022-03-22 07:00:11', '2022-03-22 07:00:11', b'0'),
('AD-1-1-29', 15, 'K-1-1-10', '1300.0000', 'cash', 'credit', 'sell', 'AH-1-1-33', '2022-03-22 09:55:28', '2022-03-22 09:55:28', b'0'),
('AE-1-1-30', 16, 'L-1-1-11', '1250.0000', 'cash', 'credit', 'sell', 'AI-1-1-34', '2022-03-22 09:59:16', '2022-03-22 09:59:16', b'0'),
('AF-1-1-31', 17, 'L-1-1-11', '625.0000', 'cash', 'credit', 'sell', 'AJ-1-1-35', '2022-03-22 09:59:27', '2022-03-22 09:59:27', b'0'),
('AG-1-1-32', 18, 'L-1-1-11', '625.0000', 'cash', 'credit', 'sell', 'AK-1-1-36', '2022-03-22 09:59:38', '2022-03-22 09:59:38', b'0'),
('AH-1-1-33', 19, 'M-1-1-12', '125.0000', 'cash', 'credit', 'sell', 'AL-1-1-37', '2022-03-22 10:08:22', '2022-03-22 10:08:22', b'0'),
('AI-1-1-34', 20, 'N-1-1-13', '2500.0000', 'cash', 'credit', 'sell', 'AM-1-1-38', '2022-03-22 10:11:04', '2022-03-22 10:11:04', b'0'),
('AJ-1-1-35', 21, 'N-1-1-13', '1000.0000', 'cash', 'credit', 'sell', 'AN-1-1-39', '2022-03-22 10:11:20', '2022-03-22 10:11:20', b'0'),
('AK-1-1-36', 22, 'Q-1-1-16', '1250.0000', 'cash', 'credit', 'sell', 'AO-1-1-40', '2022-03-22 11:26:54', '2022-03-22 11:26:54', b'0'),
('AL-1-1-37', 23, 'Q-1-1-16', '125.0000', 'cash', 'credit', 'sell', 'AP-1-1-41', '2022-03-22 11:27:09', '2022-03-22 11:27:09', b'0'),
('C-1-1-2', 2, 'D-1-1-3', '1250.0000', 'cash', 'credit', 'sell', 'D-1-1-3', '2022-03-19 04:26:11', '2022-03-19 04:26:11', b'0'),
('D-1-1-3', 3, 'F-1-1-5', '10000.0000', 'cash', 'credit', 'sell', 'U-1-1-20', '2022-03-19 08:42:14', '2022-03-19 08:42:14', b'0'),
('S-1-1-18', 6, 'G-1-1-6', '1250.0000', 'cash', 'credit', 'sell', 'X-1-1-23', '2022-03-20 04:21:28', '2022-03-20 04:21:28', b'0'),
('T-1-1-19', 7, 'G-1-1-6', '2500.0000', 'cash', 'credit', 'sell', 'Y-1-1-24', '2022-03-20 04:38:47', '2022-03-20 04:38:47', b'0'),
('U-1-1-20', 8, 'H-1-1-7', '1250.0000', 'cash', 'credit', 'sell', 'Z-1-1-25', '2022-03-21 06:08:22', '2022-03-21 06:08:22', b'0'),
('V-1-1-21', 9, 'H-1-1-7', '125.0000', 'cash', 'credit', 'sell', 'AA-1-1-26', '2022-03-21 07:15:42', '2022-03-21 07:15:42', b'0'),
('W-1-1-22', 10, 'H-1-1-7', '625.0000', 'cash', 'credit', 'sell', 'Y-1-1-24', '2022-03-21 07:16:03', '2022-03-21 07:16:03', b'0'),
('X-1-1-23', 11, 'J-1-1-9', '1750.0000', 'card', 'credit', 'sell', 'AB-1-1-27', '2022-03-22 06:56:37', '2022-03-22 06:56:37', b'0'),
('Y-1-1-24', 12, 'H-1-1-7', '125.0000', 'cash', 'credit', 'sell', 'AC-1-1-28', '2022-03-21 07:24:46', '2022-03-21 12:13:13', b'0'),
('Z-1-1-25', 13, 'I-1-1-8', '500.0000', 'cash', 'credit', 'sell', 'AC-1-1-28', '2022-03-21 12:13:24', '2022-03-21 12:13:24', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `short_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `category_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorizables`
--

CREATE TABLE `categorizables` (
  `category_id` int(11) NOT NULL,
  `categorizable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorizable_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ai_id` int(10) UNSIGNED NOT NULL,
  `sync_status` bit(1) NOT NULL DEFAULT b'0',
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_business_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `balance` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_rp` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_used` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_details` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_export` tinyint(1) NOT NULL DEFAULT 0,
  `export_custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_6` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field6` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field7` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field8` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field9` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field10` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `ai_id`, `sync_status`, `business_id`, `type`, `supplier_business_name`, `name`, `prefix`, `first_name`, `middle_name`, `last_name`, `email`, `contact_id`, `contact_status`, `tax_number`, `city`, `state`, `country`, `address_line_1`, `address_line_2`, `zip_code`, `dob`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `credit_limit`, `created_by`, `balance`, `total_rp`, `total_rp_used`, `total_rp_expired`, `is_default`, `shipping_address`, `shipping_custom_field_details`, `is_export`, `export_custom_field_1`, `export_custom_field_2`, `export_custom_field_3`, `export_custom_field_4`, `export_custom_field_5`, `export_custom_field_6`, `position`, `customer_group_id`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `custom_field6`, `custom_field7`, `custom_field8`, `custom_field9`, `custom_field10`, `deleted_at`, `created_at`, `updated_at`) VALUES
('1', 1, b'0', 1, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '0.0000', 1, '0.0000', 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-19 04:37:51', '2022-03-19 04:37:51'),
('2', 2, b'0', 1, 'supplier', NULL, 'Mr Supplier', 'Mr', 'Supplier', NULL, NULL, NULL, 'CO0002', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123476543', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-19 04:23:11', '2022-03-19 04:23:11'),
('3', 3, b'0', 1, 'customer', NULL, 'Mr Ahmad Jabbar', 'Mr', 'Ahmad', NULL, 'Jabbar', 'jb2015.1989@gmail.com', 'CO0003', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '03445679929', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 09:50:08', '2022-03-22 09:50:08'),
('8', 8, b'0', 2, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '0.0000', 5, '0.0000', 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-02 06:04:57', '2022-04-02 06:04:57'),
('E-1-1-4', 4, b'0', 1, 'customer', NULL, 'Mr Moeez Customer', 'Mr', 'Moeez', NULL, 'Customer', 'ahmad@gmail.com', 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1234568799', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 10:10:42', '2022-03-22 10:10:42'),
('F-1-1-5', 5, b'0', 1, 'customer', NULL, 'Mr Hamza', 'Mr', 'Hamza', NULL, NULL, NULL, 'CO0002', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0987641234', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 10:25:09', '2022-03-22 10:25:09'),
('G-1-1-6', 6, b'0', 1, 'customer', NULL, 'Mr Bari', 'Mr', 'Bari', NULL, NULL, NULL, 'CO0003', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5433456776', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 10:30:03', '2022-03-22 10:30:03'),
('H-1-1-7', 7, b'0', 1, 'customer', NULL, 'Mr Yello', 'Mr', 'Yello', NULL, NULL, NULL, 'CO0004', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '645346789', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 11:26:46', '2022-03-22 11:26:46');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHS', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MXN', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NGN', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL),
(137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL),
(138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL),
(139, 'Angola', 'Kwanza', 'AOA', 'Kz', ',', '.', NULL, NULL),
(140, 'Kuwait', 'Kuwaiti dinar', 'KWD', 'KD', ',', '.', NULL, NULL),
(141, 'Bahrain', 'Bahraini dinar', 'BHD', 'BD', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(5,2) NOT NULL,
  `price_calculation_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'percentage',
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_configurations`
--

CREATE TABLE `dashboard_configurations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `spg` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Applicable in specified selling price group only. Use of applicable_in_spg column is discontinued',
  `applicable_in_cg` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_variations`
--

CREATE TABLE `discount_variations` (
  `discount_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_and_notes`
--

CREATE TABLE `document_and_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `notable_id` int(11) NOT NULL,
  `notable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_sub_taxes`
--

CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_layouts`
--

CREATE TABLE `invoice_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `round_off_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_due_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT 0,
  `client_id_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT 1,
  `show_brand` tinyint(1) NOT NULL DEFAULT 0,
  `show_sku` tinyint(1) NOT NULL DEFAULT 1,
  `show_cat_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `show_lot` tinyint(1) NOT NULL DEFAULT 0,
  `show_image` tinyint(1) NOT NULL DEFAULT 0,
  `show_sale_description` tinyint(1) NOT NULL DEFAULT 0,
  `sales_person_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT 0,
  `table_product_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_qty_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_unit_price_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_subtotal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_code_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT 0,
  `show_business_name` tinyint(1) NOT NULL DEFAULT 0,
  `show_location_name` tinyint(1) NOT NULL DEFAULT 1,
  `show_landmark` tinyint(1) NOT NULL DEFAULT 1,
  `show_city` tinyint(1) NOT NULL DEFAULT 1,
  `show_state` tinyint(1) NOT NULL DEFAULT 1,
  `show_zip_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_country` tinyint(1) NOT NULL DEFAULT 1,
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT 1,
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT 0,
  `show_email` tinyint(1) NOT NULL DEFAULT 0,
  `show_tax_1` tinyint(1) NOT NULL DEFAULT 1,
  `show_tax_2` tinyint(1) NOT NULL DEFAULT 0,
  `show_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `show_payments` tinyint(1) NOT NULL DEFAULT 0,
  `show_customer` tinyint(1) NOT NULL DEFAULT 0,
  `customer_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_agent_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_commission_agent` tinyint(1) NOT NULL DEFAULT 0,
  `show_reward_point` tinyint(1) NOT NULL DEFAULT 0,
  `highlight_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `common_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `business_id` int(10) UNSIGNED NOT NULL,
  `show_qr_code` tinyint(1) NOT NULL DEFAULT 0,
  `qr_code_fields` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `design` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT 'classic',
  `cn_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cn_amount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_tax_headings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT 0,
  `prev_bal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_return_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_fields` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_custom_fields` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_custom_fields` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `round_off_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `date_time_format`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_expiry`, `show_lot`, `show_image`, `show_sale_description`, `sales_person_label`, `show_sales_person`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `commission_agent_label`, `show_commission_agent`, `show_reward_point`, `highlight_color`, `footer_text`, `module_info`, `common_settings`, `is_default`, `business_id`, `show_qr_code`, `qr_code_fields`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `table_tax_headings`, `show_previous_bal`, `prev_bal_label`, `change_return_label`, `product_custom_fields`, `contact_custom_fields`, `location_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', NULL, 0, 0, '#000000', '', NULL, NULL, 1, 1, 0, NULL, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-19 04:37:51', '2022-03-19 04:37:51'),
(2, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', NULL, 0, 0, '#000000', '', NULL, NULL, 1, 2, 0, NULL, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-04-02 06:04:57', '2022-04-02 06:04:57');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_schemes`
--

CREATE TABLE `invoice_schemes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme_type` enum('blank','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_number` int(11) DEFAULT NULL,
  `invoice_count` int(11) NOT NULL DEFAULT 0,
  `total_digits` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Default', 'blank', '', 1, 18, 4, 1, '2022-03-19 04:37:51', '2022-04-01 07:11:23'),
(2, 2, 'Default', 'blank', '', 1, 0, 4, 1, '2022-04-02 06:04:57', '2022-04-02 06:04:57');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_media_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(1, '2020_08_18_123107_add_connector_module_version_to_system_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(94, 'App\\User', 2),
(94, 'App\\User', 3),
(94, 'App\\User', 4),
(95, 'App\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 2),
(3, 'App\\User', 3),
(3, 'App\\User', 4),
(4, 'App\\User', 5);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `template_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_wa_notif` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `business_id`, `template_for`, `email_body`, `sms_body`, `whatsapp_text`, `subject`, `cc`, `bcc`, `auto_send`, `auto_send_sms`, `auto_send_wa_notif`, `created_at`, `updated_at`) VALUES
(1, 1, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-19 04:37:51', '2022-03-19 04:37:51'),
(2, 1, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-19 04:37:51', '2022-03-19 04:37:51'),
(3, 1, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-19 04:37:51', '2022-03-19 04:37:51'),
(4, 1, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2022-03-19 04:37:51', '2022-03-19 04:37:51'),
(5, 1, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-19 04:37:51', '2022-03-19 04:37:51'),
(6, 1, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-19 04:37:51', '2022-03-19 04:37:51'),
(7, 1, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-19 04:37:51', '2022-03-19 04:37:51'),
(8, 1, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-19 04:37:51', '2022-03-19 04:37:51'),
(9, 1, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-19 04:37:51', '2022-03-19 04:37:51'),
(10, 2, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2022-04-02 06:04:57', '2022-04-02 06:04:57'),
(11, 2, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2022-04-02 06:04:57', '2022-04-02 06:04:57'),
(12, 2, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2022-04-02 06:04:57', '2022-04-02 06:04:57'),
(13, 2, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2022-04-02 06:04:57', '2022-04-02 06:04:57'),
(14, 2, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2022-04-02 06:04:57', '2022-04-02 06:04:57'),
(15, 2, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2022-04-02 06:04:57', '2022-04-02 06:04:57'),
(16, 2, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2022-04-02 06:04:57', '2022-04-02 06:04:57'),
(17, 2, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2022-04-02 06:04:57', '2022-04-02 06:04:57'),
(18, 2, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2022-04-02 06:04:57', '2022-04-02 06:04:57');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00c71069c08462afa39e38e956b755df05c5a7d0a26e1b7500d230b68586433c52e4b60e0e4e395a', 1, 1, NULL, '[]', 0, '2022-03-28 11:27:16', '2022-03-28 11:27:16', '2023-03-28 16:27:16'),
('66a0a378c9cca3ce7ac518e110b0a0c472dc6029285e0e9ce487b24893be9573b4e81e590a7e6aa9', 2, 1, NULL, '[]', 0, '2022-03-28 11:39:16', '2022-03-28 11:39:16', '2023-03-28 16:39:16'),
('69fd876dc96a37e0efbe5c27a45ea3ba2155656458d0e994c4f88e7f3671901e9cfbd6202b856c3e', 2, 1, NULL, '[]', 0, '2022-03-28 11:39:24', '2022-03-28 11:39:24', '2023-03-28 16:39:24'),
('d38142529a91890c40e0b21f70d370b98c77fd59877e9c8a36cdd50466727a74bdb32c1c61ddff4f', 1, 1, NULL, '[]', 0, '2022-03-30 12:17:58', '2022-03-30 12:17:58', '2023-03-30 17:17:58');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ahmad', 'BzJLj5hmK4uLR2ev666HvUfo53lq6pGKJyqKyGzl', 'http://localhost', 0, 1, 0, '2022-03-25 11:59:07', '2022-03-25 11:59:07'),
(2, NULL, 'Ultimate POS Personal Access Client', '2TF8XzimzFwTAEX1UDejPBQZDFkVLil5OSLR4NP2', 'http://localhost', 1, 0, 0, '2022-03-28 05:39:40', '2022-03-28 05:39:40'),
(3, NULL, 'Ultimate POS Password Grant Client', '1dgMHpPUI9ywqKCEavXk6GVQULMp8iPCsp83TQZX', 'http://localhost', 0, 1, 0, '2022-03-28 05:39:40', '2022-03-28 05:39:40'),
(4, 1, 'umer', '30R1WhWP0lj5Vl53pXhS9plUOzPR9BfyLeWvF77i', 'http://localhost', 0, 1, 0, '2022-03-28 05:39:54', '2022-03-28 05:39:54'),
(5, NULL, 'Ultimate POS Personal Access Client', '4hIH3q5IRsPQjB1DZqoHzKz47Y8GbopfxnHsUR2N', 'http://localhost', 1, 0, 0, '2022-03-28 10:45:15', '2022-03-28 10:45:15'),
(6, NULL, 'Ultimate POS Password Grant Client', 'GWIKnisId7m1VHZ1ojsrsphOQD62V9Qb3AjsazIT', 'http://localhost', 0, 1, 0, '2022-03-28 10:45:15', '2022-03-28 10:45:15'),
(7, 1, 'user', 'eBtLyHYvEGqwjk3nDzzNlW4srPgsyXBY1u2mY1OK', 'http://localhost', 0, 1, 0, '2022-03-28 10:49:39', '2022-03-28 10:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 2, '2022-03-28 05:39:40', '2022-03-28 05:39:40'),
(2, 5, '2022-03-28 10:45:15', '2022-03-28 10:45:15');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('191f19e404a48b45147443707510655ef6a4b9ed0e830d06edbd0a9d4b1ea6314dd8273f1dcf5fa9', '69fd876dc96a37e0efbe5c27a45ea3ba2155656458d0e994c4f88e7f3671901e9cfbd6202b856c3e', 0, '2023-03-28 16:39:24'),
('3843086a8ef017a943157138e1a770dd38dfbcb826c21a3a8f00591de1f287f231f97223795f591c', 'd38142529a91890c40e0b21f70d370b98c77fd59877e9c8a36cdd50466727a74bdb32c1c61ddff4f', 0, '2023-03-30 17:17:58'),
('e44cbf49077553fa6da509c9134c1e8dfe73cb1d5c1c44365b1db6a6af7f758684d2926ff7c1a022', '66a0a378c9cca3ce7ac518e110b0a0c472dc6029285e0e9ce487b24893be9573b4e81e590a7e6aa9', 0, '2023-03-28 16:39:16'),
('ebbb1326692a502f7c802c62c2d0f99e4ba7ab5b64d732dfd8ed9fa028ab7e133d42953f1b717c40', '00c71069c08462afa39e38e956b755df05c5a7d0a26e1b7500d230b68586433c52e4b60e0e4e395a', 0, '2023-03-28 16:27:16');

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2022-03-15 01:49:01', NULL),
(2, 'direct_sell.access', 'web', '2022-03-15 01:49:01', NULL),
(3, 'product.opening_stock', 'web', '2022-03-15 01:49:08', '2022-03-15 01:49:08'),
(4, 'crud_all_bookings', 'web', '2022-03-15 01:49:08', '2022-03-15 01:49:08'),
(5, 'crud_own_bookings', 'web', '2022-03-15 01:49:08', '2022-03-15 01:49:08'),
(6, 'access_default_selling_price', 'web', '2022-03-15 01:49:09', '2022-03-15 01:49:09'),
(7, 'purchase.payments', 'web', '2022-03-15 01:49:09', '2022-03-15 01:49:09'),
(8, 'sell.payments', 'web', '2022-03-15 01:49:09', '2022-03-15 01:49:09'),
(9, 'edit_product_price_from_sale_screen', 'web', '2022-03-15 01:49:09', '2022-03-15 01:49:09'),
(10, 'edit_product_discount_from_sale_screen', 'web', '2022-03-15 01:49:09', '2022-03-15 01:49:09'),
(11, 'roles.view', 'web', '2022-03-15 01:49:09', '2022-03-15 01:49:09'),
(12, 'roles.create', 'web', '2022-03-15 01:49:09', '2022-03-15 01:49:09'),
(13, 'roles.update', 'web', '2022-03-15 01:49:09', '2022-03-15 01:49:09'),
(14, 'roles.delete', 'web', '2022-03-15 01:49:09', '2022-03-15 01:49:09'),
(15, 'account.access', 'web', '2022-03-15 01:49:10', '2022-03-15 01:49:10'),
(16, 'discount.access', 'web', '2022-03-15 01:49:10', '2022-03-15 01:49:10'),
(17, 'view_purchase_price', 'web', '2022-03-15 01:49:10', '2022-03-15 01:49:10'),
(18, 'view_own_sell_only', 'web', '2022-03-15 01:49:10', '2022-03-15 01:49:10'),
(19, 'edit_product_discount_from_pos_screen', 'web', '2022-03-15 01:49:15', '2022-03-15 01:49:15'),
(20, 'edit_product_price_from_pos_screen', 'web', '2022-03-15 01:49:15', '2022-03-15 01:49:15'),
(21, 'access_shipping', 'web', '2022-03-15 01:49:16', '2022-03-15 01:49:16'),
(22, 'purchase.update_status', 'web', '2022-03-15 01:49:16', '2022-03-15 01:49:16'),
(23, 'list_drafts', 'web', '2022-03-15 01:49:16', '2022-03-15 01:49:16'),
(24, 'list_quotations', 'web', '2022-03-15 01:49:16', '2022-03-15 01:49:16'),
(25, 'view_cash_register', 'web', '2022-03-15 01:49:17', '2022-03-15 01:49:17'),
(26, 'close_cash_register', 'web', '2022-03-15 01:49:17', '2022-03-15 01:49:17'),
(27, 'print_invoice', 'web', '2022-03-15 01:49:20', '2022-03-15 01:49:20'),
(28, 'user.view', 'web', '2022-03-15 01:49:23', NULL),
(29, 'user.create', 'web', '2022-03-15 01:49:23', NULL),
(30, 'user.update', 'web', '2022-03-15 01:49:23', NULL),
(31, 'user.delete', 'web', '2022-03-15 01:49:23', NULL),
(32, 'supplier.view', 'web', '2022-03-15 01:49:23', NULL),
(33, 'supplier.create', 'web', '2022-03-15 01:49:23', NULL),
(34, 'supplier.update', 'web', '2022-03-15 01:49:23', NULL),
(35, 'supplier.delete', 'web', '2022-03-15 01:49:23', NULL),
(36, 'customer.view', 'web', '2022-03-15 01:49:23', NULL),
(37, 'customer.create', 'web', '2022-03-15 01:49:23', NULL),
(38, 'customer.update', 'web', '2022-03-15 01:49:23', NULL),
(39, 'customer.delete', 'web', '2022-03-15 01:49:23', NULL),
(40, 'product.view', 'web', '2022-03-15 01:49:23', NULL),
(41, 'product.create', 'web', '2022-03-15 01:49:23', NULL),
(42, 'product.update', 'web', '2022-03-15 01:49:23', NULL),
(43, 'product.delete', 'web', '2022-03-15 01:49:23', NULL),
(44, 'purchase.view', 'web', '2022-03-15 01:49:23', NULL),
(45, 'purchase.create', 'web', '2022-03-15 01:49:23', NULL),
(46, 'purchase.update', 'web', '2022-03-15 01:49:23', NULL),
(47, 'purchase.delete', 'web', '2022-03-15 01:49:23', NULL),
(48, 'sell.view', 'web', '2022-03-15 01:49:23', NULL),
(49, 'sell.create', 'web', '2022-03-15 01:49:23', NULL),
(50, 'sell.update', 'web', '2022-03-15 01:49:23', NULL),
(51, 'sell.delete', 'web', '2022-03-15 01:49:23', NULL),
(52, 'purchase_n_sell_report.view', 'web', '2022-03-15 01:49:23', NULL),
(53, 'contacts_report.view', 'web', '2022-03-15 01:49:23', NULL),
(54, 'stock_report.view', 'web', '2022-03-15 01:49:23', NULL),
(55, 'tax_report.view', 'web', '2022-03-15 01:49:23', NULL),
(56, 'trending_product_report.view', 'web', '2022-03-15 01:49:23', NULL),
(57, 'register_report.view', 'web', '2022-03-15 01:49:23', NULL),
(58, 'sales_representative.view', 'web', '2022-03-15 01:49:23', NULL),
(59, 'expense_report.view', 'web', '2022-03-15 01:49:23', NULL),
(60, 'business_settings.access', 'web', '2022-03-15 01:49:23', NULL),
(61, 'barcode_settings.access', 'web', '2022-03-15 01:49:23', NULL),
(62, 'invoice_settings.access', 'web', '2022-03-15 01:49:23', NULL),
(63, 'brand.view', 'web', '2022-03-15 01:49:23', NULL),
(64, 'brand.create', 'web', '2022-03-15 01:49:23', NULL),
(65, 'brand.update', 'web', '2022-03-15 01:49:23', NULL),
(66, 'brand.delete', 'web', '2022-03-15 01:49:23', NULL),
(67, 'tax_rate.view', 'web', '2022-03-15 01:49:23', NULL),
(68, 'tax_rate.create', 'web', '2022-03-15 01:49:23', NULL),
(69, 'tax_rate.update', 'web', '2022-03-15 01:49:23', NULL),
(70, 'tax_rate.delete', 'web', '2022-03-15 01:49:23', NULL),
(71, 'unit.view', 'web', '2022-03-15 01:49:23', NULL),
(72, 'unit.create', 'web', '2022-03-15 01:49:23', NULL),
(73, 'unit.update', 'web', '2022-03-15 01:49:23', NULL),
(74, 'unit.delete', 'web', '2022-03-15 01:49:23', NULL),
(75, 'category.view', 'web', '2022-03-15 01:49:23', NULL),
(76, 'category.create', 'web', '2022-03-15 01:49:23', NULL),
(77, 'category.update', 'web', '2022-03-15 01:49:23', NULL),
(78, 'category.delete', 'web', '2022-03-15 01:49:23', NULL),
(79, 'expense.access', 'web', '2022-03-15 01:49:23', NULL),
(80, 'access_all_locations', 'web', '2022-03-15 01:49:23', NULL),
(81, 'dashboard.data', 'web', '2022-03-15 01:49:23', NULL),
(94, 'location.1', 'web', '2022-03-19 04:37:51', '2022-03-19 04:37:51'),
(95, 'location.2', 'web', '2022-04-01 09:13:10', '2022-04-01 09:13:10'),
(96, 'location.3', 'web', '2022-04-02 06:04:57', '2022-04-02 06:04:57');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` enum('network','windows','linux') COLLATE utf8mb4_unicode_ci NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier','combo') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int(11) UNSIGNED DEFAULT NULL,
  `sub_unit_ids` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` int(10) UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT 0,
  `alert_quantity` decimal(22,4) DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT 0,
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `warranty_id` int(11) DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT 0,
  `not_for_selling` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `image`, `product_description`, `created_by`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(1, 'Coke', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, '10.0000', '0001', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-03-19 04:09:18', '2022-03-19 04:13:03'),
(2, 'Pepsi', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, '8.0000', '0002', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1647844127_1646831468_1630324501_fwg.jpg', NULL, 1, NULL, 0, 0, '2022-03-19 10:54:58', '2022-03-21 06:28:48'),
(3, 'M1', 1, 'modifier', NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 0, NULL, '0003', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-03-21 11:18:18', '2022-03-21 11:18:19'),
(4, 'Fanta', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, '10.0000', '0004', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1647942857_1646831516_1630323369_bfujmh.jpg', NULL, 1, NULL, 0, 0, '2022-03-22 09:51:35', '2022-03-22 09:54:17'),
(5, 'test', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, NULL, '0005', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1647960454_MP_Logo.png', NULL, 1, NULL, 0, 0, '2022-03-22 14:47:34', '2022-03-22 14:47:34');

-- --------------------------------------------------------

--
-- Table structure for table `product_locations`
--

CREATE TABLE `product_locations` (
  `product_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_locations`
--

INSERT INTO `product_locations` (`product_id`, `location_id`) VALUES
(1, 1),
(2, 1),
(4, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_racks`
--

CREATE TABLE `product_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `rack` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `row` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_template_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `variation_template_id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(1, NULL, 'DUMMY', 1, 1, '2022-03-19 04:09:18', '2022-03-19 04:09:18'),
(2, NULL, 'DUMMY', 2, 1, '2022-03-19 10:54:58', '2022-03-19 10:54:58'),
(3, NULL, 'DUMMY', 3, 0, '2022-03-21 11:18:19', '2022-03-21 11:18:19'),
(4, NULL, 'DUMMY', 4, 1, '2022-03-22 09:51:35', '2022-03-22 09:51:35'),
(5, NULL, 'DUMMY', 5, 1, '2022-03-22 14:47:34', '2022-03-22 14:47:34');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` int(11) NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `pp_without_discount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) NOT NULL,
  `purchase_price_inc_tax` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `purchase_order_line_id` int(11) DEFAULT NULL,
  `quantity_sold` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `po_quantity_purchased` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_quantity_used` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `purchase_order_line_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `po_quantity_purchased`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(1, '0-1-1-A', 1, 1, '70.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, NULL, '70.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-03-19 04:09:27', '2022-03-19 08:42:14'),
(2, '3-1-1-D', 1, 1, '30.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, NULL, '30.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-03-19 04:23:16', '2022-03-19 08:42:14'),
(3, '5-1-1-F', 2, 2, '50.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, NULL, '50.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-03-19 10:55:08', '2022-03-22 06:56:37'),
(4, '7-1-1-H', 1, 1, '50.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, NULL, '10.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-03-20 04:20:41', '2022-04-01 07:11:23'),
(5, '16-1-1-Q', 4, 5, '100.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, NULL, '71.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-03-22 09:51:42', '2022-04-01 07:11:23');

-- --------------------------------------------------------

--
-- Table structure for table `reference_counts`
--

CREATE TABLE `reference_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ref_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_count` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'contacts', 3, 1, '2022-03-19 04:37:51', '2022-03-22 09:50:08'),
(2, 'business_location', 2, 1, '2022-03-19 04:37:51', '2022-04-01 09:13:10'),
(3, 'purchase', 2, 1, '2022-03-19 04:23:16', '2022-03-20 04:20:41'),
(4, 'sell_payment', 3, 1, '2022-03-22 09:46:21', '2022-03-22 09:46:56'),
(5, 'contacts', 1, 2, '2022-04-02 06:04:57', '2022-04-02 06:04:57'),
(6, 'business_location', 1, 2, '2022-04-02 06:04:57', '2022-04-02 06:04:57');

-- --------------------------------------------------------

--
-- Table structure for table `res_product_modifier_sets`
--

CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `res_product_modifier_sets`
--

INSERT INTO `res_product_modifier_sets` (`modifier_set_id`, `product_id`) VALUES
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `res_tables`
--

CREATE TABLE `res_tables` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `res_tables`
--

INSERT INTO `res_tables` (`id`, `business_id`, `location_id`, `name`, `description`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'T1', NULL, 1, NULL, '2022-03-21 11:21:00', '2022-03-21 11:21:00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_service_staff` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `created_at`, `updated_at`) VALUES
(1, 'Admin#1', 'web', 1, 1, 0, '2022-03-19 04:37:50', '2022-03-19 04:37:50'),
(2, 'Cashier#1', 'web', 1, 0, 0, '2022-03-19 04:37:51', '2022-03-19 04:37:51'),
(3, 'Waiter#1', 'web', 1, 0, 1, '2022-04-01 07:04:02', '2022-04-01 07:04:02'),
(4, 'Admin#2', 'web', 2, 1, 0, '2022-04-02 06:04:57', '2022-04-02 06:04:57'),
(5, 'Cashier#2', 'web', 2, 0, 0, '2022-04-02 06:04:57', '2022-04-02 06:04:57');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(6, 3),
(25, 2),
(25, 5),
(26, 2),
(26, 5),
(48, 2),
(48, 5),
(49, 2),
(49, 5),
(50, 2),
(50, 5),
(51, 2),
(51, 5),
(80, 5),
(81, 3);

-- --------------------------------------------------------

--
-- Table structure for table `selling_price_groups`
--

CREATE TABLE `selling_price_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_line_warranties`
--

CREATE TABLE `sell_line_warranties` (
  `sell_line_id` int(11) NOT NULL,
  `warranty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments_temp`
--

CREATE TABLE `stock_adjustments_temp` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_lines`
--

CREATE TABLE `stock_adjustment_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`id`, `key`, `value`) VALUES
(1, 'db_version', '4.5'),
(2, 'default_business_active_status', '1'),
(3, 'connector_version', '1.7');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `for_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ai_id` int(11) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `res_table_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT 0,
  `payment_status` enum('paid','due','partial') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_repeat_on` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) DEFAULT 0.0000,
  `rp_redeemed` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_charges` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `shipping_custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_export` tinyint(1) NOT NULL DEFAULT 0,
  `export_custom_fields_info` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `round_off_amount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Difference of rounded total and actual total',
  `additional_expense_key_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_1` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_2` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_3` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_4` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `final_total` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `expense_category_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_for` int(10) UNSIGNED DEFAULT NULL,
  `commission_agent` int(11) DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT 0,
  `is_suspend` tinyint(1) NOT NULL DEFAULT 0,
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `total_amount_recovered` decimal(22,4) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int(11) DEFAULT NULL,
  `return_parent_id` int(11) DEFAULT NULL,
  `opening_stock_product_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `prefer_payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefer_payment_account` int(11) DEFAULT NULL,
  `sales_order_ids` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_order_ids` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_batch` int(11) DEFAULT NULL,
  `import_time` datetime DEFAULT NULL,
  `types_of_service_id` int(11) DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_3` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_4` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_5` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_6` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT 0,
  `rp_earned` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `order_addresses` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recur_repetitions` int(11) DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int(11) DEFAULT NULL,
  `invoice_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sync_status` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `ai_id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `source`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `is_export`, `export_custom_fields_info`, `round_off_amount`, `additional_expense_key_1`, `additional_expense_value_1`, `additional_expense_key_2`, `additional_expense_value_2`, `additional_expense_key_3`, `additional_expense_value_3`, `additional_expense_key_4`, `additional_expense_value_4`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `prefer_payment_method`, `prefer_payment_account`, `sales_order_ids`, `purchase_order_ids`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `service_custom_field_5`, `service_custom_field_6`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`, `sync_status`) VALUES
('0-1-1-A', 1, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:09:00', '7000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '7000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-19 04:09:27', '2022-03-19 04:13:12', b'0'),
('16-1-1-Q', 16, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 14:51:42', '100.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '10000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 09:51:42', '2022-03-22 09:51:42', b'0'),
('27-1-1-AB', 27, 1, 1, NULL, 3, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, '1', NULL, '0018', '', NULL, NULL, NULL, '2022-04-01 12:11:23', '250.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 'dddddddddddd', NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '250.0000', NULL, NULL, NULL, NULL, 0, 1, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-01 07:11:23', '2022-04-01 07:11:23', b'0'),
('3-1-1-D', 3, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'due', NULL, '2', NULL, NULL, 'PO2022/0001', NULL, NULL, NULL, '2022-03-19 09:18:00', '3000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '3000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-19 04:23:16', '2022-03-19 04:23:16', b'0'),
('5-1-1-F', 5, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:55:00', '5000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '5000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-19 10:55:08', '2022-03-19 11:03:23', b'0'),
('7-1-1-H', 7, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'due', NULL, '2', NULL, NULL, 'PO2022/0002', NULL, NULL, NULL, '2022-03-20 09:20:00', '5000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '5000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-20 04:20:41', '2022-03-20 04:20:41', b'0'),
('AA-1-1-26', 13, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0004', '', NULL, NULL, NULL, '2022-03-21 12:15:42', '125.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '125.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-21 07:15:42', '2022-03-21 07:15:42', b'0'),
('AB-1-1-27', 14, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0007', '', NULL, NULL, NULL, '2022-03-22 11:56:37', '1750.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1750.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-22 06:56:37', '2022-03-22 06:56:37', b'0'),
('AC-1-1-28', 15, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0006', '', NULL, NULL, NULL, '2022-03-21 12:24:46', '625.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '625.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-21 07:24:46', '2022-03-21 12:13:24', b'0'),
('AE-1-1-30', 17, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0008', '', NULL, NULL, NULL, '2022-03-22 12:00:10', '375.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '375.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-22 07:00:10', '2022-03-22 07:00:11', b'0'),
('AH-1-1-33', 18, 1, 1, 1, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '3', NULL, '0009', '', NULL, NULL, NULL, '2022-03-22 14:55:28', '1250.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '50.0000', 'fixed', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 09:55:28', '2022-03-22 09:55:28', b'0'),
('AI-1-1-34', 19, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '3', NULL, '0010', '', NULL, NULL, NULL, '2022-03-22 14:59:16', '1250.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 09:59:16', '2022-03-22 09:59:16', b'0'),
('AJ-1-1-35', 20, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0011', '', NULL, NULL, NULL, '2022-03-22 14:59:26', '625.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '625.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 09:59:26', '2022-03-22 09:59:27', b'0'),
('AK-1-1-36', 21, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0012', '', NULL, NULL, NULL, '2022-03-22 14:59:38', '625.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '625.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 09:59:38', '2022-03-22 09:59:38', b'0'),
('AL-1-1-37', 22, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0013', '', NULL, NULL, NULL, '2022-03-22 15:08:22', '125.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '125.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-22 10:08:22', '2022-03-22 10:08:22', b'0'),
('AM-1-1-38', 23, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 'E-1-1-4', NULL, '0014', '', NULL, NULL, NULL, '2022-03-22 15:11:04', '2500.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '2500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-22 10:11:04', '2022-03-22 10:11:04', b'0'),
('AN-1-1-39', 24, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0015', '', NULL, NULL, NULL, '2022-03-22 15:11:20', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-22 10:11:20', '2022-03-22 10:11:20', b'0'),
('AO-1-1-40', 25, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 'H-1-1-7', NULL, '0016', '', NULL, NULL, NULL, '2022-03-22 16:26:54', '1250.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-22 11:26:54', '2022-03-22 11:26:54', b'0'),
('AP-1-1-41', 26, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0017', '', NULL, NULL, NULL, '2022-03-22 16:27:09', '125.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '125.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-22 11:27:09', '2022-03-22 11:27:09', b'0'),
('C-1-1-2', 2, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0001', '', NULL, NULL, NULL, '2022-03-19 09:17:18', '1250.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-19 04:17:18', '2022-03-19 04:17:18', b'0'),
('D-1-1-3', 4, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0002', '', NULL, NULL, NULL, '2022-03-19 09:26:11', '1250.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-19 04:26:11', '2022-03-19 04:26:11', b'0'),
('U-1-1-20', 6, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0003', '', NULL, NULL, NULL, '2022-03-19 13:42:14', '10000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '10000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-19 08:42:14', '2022-03-19 08:42:14', b'0'),
('X-1-1-23', 10, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0001', '', NULL, NULL, NULL, '2022-03-20 09:21:28', '1250.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-20 04:21:28', '2022-03-20 04:21:28', b'0'),
('Y-1-1-24', 11, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0002', '', NULL, NULL, NULL, '2022-03-20 09:38:47', '3125.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '3125.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-20 04:38:47', '2022-03-21 07:16:03', b'0'),
('Z-1-1-25', 12, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0003', '', NULL, NULL, NULL, '2022-03-21 11:08:22', '1250.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-21 06:08:22', '2022-03-21 06:08:22', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments`
--

CREATE TABLE `transaction_payments` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ai_id` int(11) NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_transaction_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_security` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `paid_through_link` tinyint(1) NOT NULL DEFAULT 0,
  `gateway` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_advance` tinyint(1) NOT NULL DEFAULT 0,
  `payment_for` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sync_status` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_payments`
--

INSERT INTO `transaction_payments` (`id`, `ai_id`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `paid_through_link`, `gateway`, `is_advance`, `payment_for`, `parent_id`, `note`, `document`, `payment_ref_no`, `account_id`, `created_at`, `updated_at`, `sync_status`) VALUES
('12-1-1-M', 12, NULL, 1, 0, '625.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 14:46:00', 1, 0, NULL, 1, '1', NULL, NULL, NULL, 'SP2022/0001', NULL, '2022-03-22 09:46:21', '2022-03-22 09:46:21', b'0'),
('13-1-1-N', 13, NULL, 1, 0, '625.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 14:46:00', 1, 0, NULL, 1, '1', NULL, NULL, NULL, 'SP2022/0002', NULL, '2022-03-22 09:46:37', '2022-03-22 09:46:37', b'0'),
('14-1-1-O', 14, NULL, 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 14:46:00', 1, 0, NULL, 1, '1', NULL, NULL, NULL, 'SP2022/0003', NULL, '2022-03-22 09:46:56', '2022-03-22 09:46:56', b'0'),
('A-1-1-0', 1, 'C-1-1-2', 1, 0, '1250.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-19 09:17:18', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0001', NULL, '2022-03-19 04:17:18', '2022-03-19 04:17:18', b'0'),
('AB-1-1-27', 17, 'AH-1-1-33', 1, 0, '1300.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 14:55:28', 1, 0, NULL, 0, '3', NULL, NULL, NULL, 'SP2022/0012', NULL, '2022-03-22 09:55:28', '2022-03-22 09:55:28', b'0'),
('AC-1-1-28', 18, 'AI-1-1-34', 1, 0, '1250.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 14:59:16', 1, 0, NULL, 0, '3', NULL, NULL, NULL, 'SP2022/0013', NULL, '2022-03-22 09:59:16', '2022-03-22 09:59:16', b'0'),
('AD-1-1-29', 19, 'AJ-1-1-35', 1, 0, '625.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 14:59:26', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0014', NULL, '2022-03-22 09:59:26', '2022-03-22 09:59:26', b'0'),
('AE-1-1-30', 20, 'AK-1-1-36', 1, 0, '625.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 14:59:38', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0015', NULL, '2022-03-22 09:59:38', '2022-03-22 09:59:38', b'0'),
('AF-1-1-31', 21, 'AL-1-1-37', 1, 0, '125.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 15:08:22', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0016', NULL, '2022-03-22 10:08:22', '2022-03-22 10:08:22', b'0'),
('AG-1-1-32', 22, 'AM-1-1-38', 1, 0, '2500.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 15:11:04', 1, 0, NULL, 0, '0', NULL, NULL, NULL, 'SP2022/0017', NULL, '2022-03-22 10:11:04', '2022-03-22 10:11:04', b'0'),
('AH-1-1-33', 23, 'AN-1-1-39', 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 15:11:20', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0018', NULL, '2022-03-22 10:11:20', '2022-03-22 10:11:20', b'0'),
('AI-1-1-34', 24, 'AO-1-1-40', 1, 0, '1250.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 16:26:54', 1, 0, NULL, 0, 'H-1-1-7', NULL, NULL, NULL, 'SP2022/0019', NULL, '2022-03-22 11:26:54', '2022-03-22 11:26:54', b'0'),
('AJ-1-1-35', 25, 'AP-1-1-41', 1, 0, '125.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 16:27:09', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0020', NULL, '2022-03-22 11:27:09', '2022-03-22 11:27:09', b'0'),
('C-1-1-2', 2, 'D-1-1-3', 1, 0, '1250.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-19 09:26:11', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0002', NULL, '2022-03-19 04:26:11', '2022-03-19 04:26:11', b'0'),
('D-1-1-3', 3, 'U-1-1-20', 1, 0, '10000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-19 13:42:14', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0003', NULL, '2022-03-19 08:42:14', '2022-03-19 08:42:14', b'0'),
('S-1-1-18', 6, 'X-1-1-23', 1, 0, '1250.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-20 09:21:28', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0004', NULL, '2022-03-20 04:21:28', '2022-03-20 04:21:28', b'0'),
('T-1-1-19', 7, 'Y-1-1-24', 1, 0, '2500.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-20 09:38:47', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0005', NULL, '2022-03-20 04:38:47', '2022-03-20 04:38:47', b'0'),
('U-1-1-20', 8, 'Z-1-1-25', 1, 0, '1250.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-21 11:08:22', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0006', NULL, '2022-03-21 06:08:22', '2022-03-21 06:08:22', b'0'),
('V-1-1-21', 9, 'AA-1-1-26', 1, 0, '125.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-21 12:15:42', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0007', NULL, '2022-03-21 07:15:42', '2022-03-21 07:15:42', b'0'),
('W-1-1-22', 10, 'AB-1-1-27', 1, 0, '125.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-21 12:24:01', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0008', NULL, '2022-03-21 07:24:01', '2022-03-21 07:24:01', b'0'),
('X-1-1-23', 11, 'AC-1-1-28', 1, 0, '625.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-21 12:24:46', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0009', NULL, '2022-03-21 07:24:46', '2022-03-22 06:30:15', b'0'),
('Y-1-1-24', 15, 'AB-1-1-27', 1, 0, '1750.0000', 'card', NULL, '123456765', '12325467879', 'credit', 'Hello', '12', NULL, '333', NULL, NULL, '2022-03-22 11:56:37', 1, 0, NULL, 0, '1', NULL, 'Hello', NULL, 'SP2022/0010', NULL, '2022-03-22 06:56:37', '2022-03-22 06:56:37', b'0'),
('Z-1-1-25', 16, 'AE-1-1-30', 1, 0, '375.0000', 'card', NULL, '12345', '12345', 'credit', 'CARD 1', '12', NULL, '222', NULL, NULL, '2022-03-22 12:00:10', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0011', NULL, '2022-03-22 07:00:10', '2022-03-22 07:00:10', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines`
--

CREATE TABLE `transaction_sell_lines` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ai_id` int(11) NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `unit_price_before_discount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line_discount_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `sell_line_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `so_line_id` int(11) DEFAULT NULL,
  `so_quantity_invoiced` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `res_service_staff_id` int(11) DEFAULT NULL,
  `res_line_order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_sell_line_id` int(11) DEFAULT NULL,
  `children_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sync_status` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines`
--

INSERT INTO `transaction_sell_lines` (`id`, `ai_id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `so_line_id`, `so_quantity_invoiced`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`, `sync_status`) VALUES
('24-1-1-Y', 24, '27-1-1-AB', 4, 5, '1.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', 4, 'received', NULL, '', NULL, '2022-04-01 07:11:23', '2022-04-01 07:11:23', b'0'),
('25-1-1-Z', 25, '27-1-1-AB', 1, 1, '1.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', 4, 'received', NULL, '', NULL, '2022-04-01 07:11:23', '2022-04-01 07:11:23', b'0'),
('A-1-1-0', 1, 'C-1-1-2', 1, 1, '10.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-19 04:17:18', '2022-03-19 04:17:18', b'0'),
('AA-1-1-26', 13, 'AB-1-1-27', 3, 4, '10.0000', '0.0000', '50.0000', '50.0000', NULL, '0.0000', '50.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, 0, 'modifier', NULL, '2022-03-22 06:56:37', '2022-03-22 06:56:37', b'0'),
('AB-1-1-27', 14, 'AE-1-1-30', 1, 1, '3.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-22 07:00:10', '2022-03-22 07:00:10', b'0'),
('AE-1-1-30', 15, 'AH-1-1-33', 4, 5, '10.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-22 09:55:28', '2022-03-22 09:55:28', b'0'),
('AF-1-1-31', 16, 'AI-1-1-34', 4, 5, '10.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-22 09:59:16', '2022-03-22 09:59:16', b'0'),
('AG-1-1-32', 17, 'AJ-1-1-35', 4, 5, '5.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-22 09:59:26', '2022-03-22 09:59:26', b'0'),
('AH-1-1-33', 18, 'AK-1-1-36', 4, 5, '5.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-22 09:59:38', '2022-03-22 09:59:38', b'0'),
('AI-1-1-34', 19, 'AL-1-1-37', 4, 5, '1.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-22 10:08:22', '2022-03-22 10:08:22', b'0'),
('AJ-1-1-35', 20, 'AM-1-1-38', 4, 5, '20.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-22 10:11:04', '2022-03-22 10:11:04', b'0'),
('AK-1-1-36', 21, 'AN-1-1-39', 4, 5, '8.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-22 10:11:20', '2022-03-22 10:11:20', b'0'),
('AL-1-1-37', 22, 'AO-1-1-40', 4, 5, '10.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-22 11:26:54', '2022-03-22 11:26:54', b'0'),
('AM-1-1-38', 23, 'AP-1-1-41', 4, 5, '1.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-22 11:27:09', '2022-03-22 11:27:09', b'0'),
('C-1-1-2', 2, 'D-1-1-3', 1, 1, '10.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-19 04:26:11', '2022-03-19 04:26:11', b'0'),
('D-1-1-3', 3, 'U-1-1-20', 1, 1, '80.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-19 08:42:14', '2022-03-19 08:42:14', b'0'),
('S-1-1-18', 6, 'X-1-1-23', 2, 2, '10.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-20 04:21:28', '2022-03-20 04:21:28', b'0'),
('T-1-1-19', 7, 'Y-1-1-24', 2, 2, '20.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-20 04:38:47', '2022-03-20 04:38:47', b'0'),
('U-1-1-20', 8, 'Z-1-1-25', 1, 1, '5.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-21 06:08:22', '2022-03-21 06:08:22', b'0'),
('V-1-1-21', 9, 'Z-1-1-25', 2, 2, '5.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-21 06:08:22', '2022-03-21 06:08:22', b'0'),
('W-1-1-22', 10, 'AA-1-1-26', 1, 1, '1.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-21 07:15:42', '2022-03-21 07:15:42', b'0'),
('X-1-1-23', 11, 'AB-1-1-27', 2, 2, '10.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-22 06:56:37', '2022-03-22 06:56:37', b'0'),
('Y-1-1-24', 12, 'AC-1-1-28', 2, 2, '5.0000', '0.0000', '125.0000', '125.0000', 'fixed', '0.0000', '125.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-03-21 07:24:46', '2022-03-21 12:13:24', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `sell_line_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_adjustment_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int(10) UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines_purchase_lines`
--

INSERT INTO `transaction_sell_lines_purchase_lines` (`id`, `sell_line_id`, `stock_adjustment_line_id`, `purchase_line_id`, `quantity`, `qty_returned`, `created_at`, `updated_at`) VALUES
(1, 'A-1-1-0', NULL, 1, '10.0000', '0.0000', '2022-03-19 04:17:18', '2022-03-19 04:17:18'),
(2, 'C-1-1-2', NULL, 1, '10.0000', '0.0000', '2022-03-19 04:26:11', '2022-03-19 04:26:11'),
(3, 'D-1-1-3', NULL, 1, '50.0000', '0.0000', '2022-03-19 08:42:14', '2022-03-19 08:42:14'),
(4, 'D-1-1-3', NULL, 2, '30.0000', '0.0000', '2022-03-19 08:42:14', '2022-03-19 08:42:14'),
(5, 'S-1-1-18', NULL, 3, '10.0000', '0.0000', '2022-03-20 04:21:28', '2022-03-20 04:21:28'),
(6, 'T-1-1-19', NULL, 3, '20.0000', '0.0000', '2022-03-20 04:38:47', '2022-03-20 04:38:47'),
(7, 'U-1-1-20', NULL, 4, '5.0000', '0.0000', '2022-03-21 06:08:22', '2022-03-21 06:08:22'),
(8, 'V-1-1-21', NULL, 3, '5.0000', '0.0000', '2022-03-21 06:08:22', '2022-03-21 06:08:22'),
(9, 'W-1-1-22', NULL, 4, '1.0000', '0.0000', '2022-03-21 07:15:42', '2022-03-21 07:15:42'),
(10, 'T-1-1-19', NULL, 3, '5.0000', '0.0000', '2022-03-21 07:16:03', '2022-03-21 07:16:03'),
(11, 'X-1-1-23', NULL, 4, '1.0000', '0.0000', '2022-03-21 07:24:01', '2022-03-21 07:24:01'),
(12, 'Y-1-1-24', NULL, 3, '1.0000', '0.0000', '2022-03-21 07:24:46', '2022-03-21 07:24:46'),
(13, 'Y-1-1-24', NULL, 3, '4.0000', '0.0000', '2022-03-21 12:13:24', '2022-03-21 12:13:24'),
(14, 'X-1-1-23', NULL, 3, '10.0000', '0.0000', '2022-03-22 06:56:37', '2022-03-22 06:56:37'),
(15, 'AB-1-1-27', NULL, 4, '3.0000', '0.0000', '2022-03-22 07:00:11', '2022-03-22 07:00:11'),
(16, 'AE-1-1-30', NULL, 5, '10.0000', '0.0000', '2022-03-22 09:55:28', '2022-03-22 09:55:28'),
(17, 'AF-1-1-31', NULL, 5, '10.0000', '0.0000', '2022-03-22 09:59:16', '2022-03-22 09:59:16'),
(18, 'AG-1-1-32', NULL, 5, '5.0000', '0.0000', '2022-03-22 09:59:27', '2022-03-22 09:59:27'),
(19, 'AH-1-1-33', NULL, 5, '5.0000', '0.0000', '2022-03-22 09:59:38', '2022-03-22 09:59:38'),
(20, 'AI-1-1-34', NULL, 5, '1.0000', '0.0000', '2022-03-22 10:08:22', '2022-03-22 10:08:22'),
(21, 'AJ-1-1-35', NULL, 5, '20.0000', '0.0000', '2022-03-22 10:11:04', '2022-03-22 10:11:04'),
(22, 'AK-1-1-36', NULL, 5, '8.0000', '0.0000', '2022-03-22 10:11:20', '2022-03-22 10:11:20'),
(23, 'AL-1-1-37', NULL, 5, '10.0000', '0.0000', '2022-03-22 11:26:54', '2022-03-22 11:26:54'),
(24, 'AM-1-1-38', NULL, 5, '1.0000', '0.0000', '2022-03-22 11:27:09', '2022-03-22 11:27:09'),
(25, '24-1-1-Y', NULL, 5, '1.0000', '0.0000', '2022-04-01 07:11:23', '2022-04-01 07:11:23'),
(26, '25-1-1-Z', NULL, 4, '1.0000', '0.0000', '2022-04-01 07:11:23', '2022-04-01 07:11:23');

-- --------------------------------------------------------

--
-- Table structure for table `types_of_services`
--

CREATE TABLE `types_of_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `location_price_group` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types_of_services`
--

INSERT INTO `types_of_services` (`id`, `name`, `description`, `business_id`, `location_price_group`, `packing_charge`, `packing_charge_type`, `enable_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Dine Inn', NULL, 1, '{\"1\":\"0\"}', '0.0000', 'fixed', 0, '2022-03-21 11:20:02', '2022-03-21 11:20:30'),
(2, 'Take Away', NULL, 1, '{\"1\":\"0\"}', '0.0000', 'fixed', 0, '2022-03-21 11:20:47', '2022-03-21 11:20:47');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `actual_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int(11) DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `base_unit_id`, `base_unit_multiplier`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pieces', 'Pc(s)', 0, NULL, NULL, 1, NULL, '2022-03-19 04:37:51', '2022-03-19 04:37:51'),
(2, 2, 'Pieces', 'Pc(s)', 0, NULL, NULL, 5, NULL, '2022-04-02 06:04:57', '2022-04-02 06:04:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `surname` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `contact_no` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `max_sales_discount_percent` decimal(5,2) DEFAULT NULL,
  `allow_login` tinyint(1) NOT NULL DEFAULT 1,
  `status` enum('active','inactive','terminated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `crm_contact_id` int(10) UNSIGNED DEFAULT NULL,
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT 0,
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT 0.00,
  `selected_contacts` tinyint(1) NOT NULL DEFAULT 0,
  `dob` date DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `family_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_proof_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_proof_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `max_sales_discount_percent`, `allow_login`, `status`, `crm_contact_id`, `is_cmmsn_agnt`, `cmmsn_percent`, `selected_contacts`, `dob`, `gender`, `marital_status`, `blood_group`, `contact_number`, `alt_number`, `family_number`, `fb_link`, `twitter_link`, `social_media_1`, `social_media_2`, `permanent_address`, `current_address`, `guardian_name`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `bank_details`, `id_proof_name`, `id_proof_number`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'user', NULL, 'Ahmad', NULL, 'ahmad', 'ahmad@gmail.com', '$2y$10$s78SovQ6fErpuvQBlshJbeTj21OJz/SJauQoQazXZ5h8PCblWinXe', 'en', NULL, NULL, NULL, 1, NULL, 1, 'active', NULL, 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-19 04:37:50', '2022-03-19 04:37:50'),
(2, 'user', 'Mr', 'Zaeem', 'Qureshi', 'zaeem', '1@df.co', '$2y$10$hSFFVTKvTNW/xL22vD16r.wIVOS8oqyL1PuxNFn13YUgLx2glLbEG', 'en', NULL, NULL, NULL, 1, NULL, 1, 'active', NULL, 0, '0.00', 0, NULL, NULL, NULL, NULL, '03210004567', NULL, NULL, NULL, NULL, NULL, NULL, 'Tm', 'Tm', NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-03-28 11:07:09', '2022-04-01 09:15:21'),
(3, 'user', NULL, 'zeeshan', NULL, NULL, 'sda@gmail.com', NULL, 'en', NULL, NULL, NULL, 1, NULL, 0, 'inactive', NULL, 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-04-01 07:05:05', '2022-04-01 07:05:05'),
(4, 'user', NULL, 'Tehseen', NULL, NULL, 'teh@gmail.com', NULL, 'en', NULL, NULL, NULL, 1, NULL, 0, 'inactive', NULL, 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-04-01 07:09:25', '2022-04-01 07:09:25'),
(5, 'user', NULL, 'Moeez', NULL, 'moeez', 'moeez@outlook.com', '$2y$10$BekY6SCRfbcQaC5PlNSwW.1GxQurZIZ54OtnsSW8ZBh8lbvLPpJFO', 'en', NULL, NULL, NULL, 2, NULL, 1, 'active', NULL, 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-02 06:04:57', '2022-04-02 06:04:57');

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_access`
--

CREATE TABLE `user_contact_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `sub_sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL,
  `variation_value_id` int(11) DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `profit_percent` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Contains the combo variation details'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(1, 'DUMMY', 1, '0001', 1, NULL, '100.0000', '100.0000', '25.0000', '125.0000', '125.0000', '2022-03-19 04:09:19', '2022-03-19 04:13:03', NULL, '[]'),
(2, 'DUMMY', 2, '0002', 2, NULL, '100.0000', '100.0000', '25.0000', '125.0000', '125.0000', '2022-03-19 10:54:58', '2022-03-21 06:28:48', NULL, '[]'),
(3, 'Cheese', 3, '0003-1', 3, NULL, '100.0000', '100.0000', '0.0000', '100.0000', '100.0000', '2022-03-21 11:18:19', '2022-03-21 11:18:19', NULL, NULL),
(4, 'Mayo', 3, '0003-2', 3, NULL, '50.0000', '50.0000', '0.0000', '50.0000', '50.0000', '2022-03-21 11:18:19', '2022-03-21 11:18:19', NULL, NULL),
(5, 'DUMMY', 4, '0004', 4, NULL, '100.0000', '100.0000', '25.0000', '125.0000', '125.0000', '2022-03-22 09:51:35', '2022-03-22 09:54:17', NULL, '[]'),
(6, 'DUMMY', 5, '0005', 5, NULL, '100.0000', '100.0000', '25.0000', '125.0000', '125.0000', '2022-03-22 14:47:34', '2022-03-22 14:47:34', NULL, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `variation_group_prices`
--

CREATE TABLE `variation_group_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `price_group_id` int(10) UNSIGNED NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_location_details`
--

CREATE TABLE `variation_location_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `qty_available` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_location_details`
--

INSERT INTO `variation_location_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `location_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, '39.0000', '2022-03-19 04:09:27', '2022-04-01 07:11:23'),
(2, 2, 2, 2, 1, '-1.0000', '2022-03-19 10:55:08', '2022-03-22 06:56:37'),
(3, 4, 4, 5, 1, '29.0000', '2022-03-22 09:51:42', '2022-04-01 07:11:23');

-- --------------------------------------------------------

--
-- Table structure for table `variation_templates`
--

CREATE TABLE `variation_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_value_templates`
--

CREATE TABLE `variation_value_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variation_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warranties`
--

CREATE TABLE `warranties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `duration_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_business_id_index` (`business_id`),
  ADD KEY `accounts_account_type_id_index` (`account_type_id`),
  ADD KEY `accounts_created_by_index` (`created_by`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_account_id_index` (`account_id`),
  ADD KEY `account_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  ADD KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  ADD KEY `account_transactions_created_by_index` (`created_by`),
  ADD KEY `account_transactions_type_index` (`type`),
  ADD KEY `account_transactions_sub_type_index` (`sub_type`),
  ADD KEY `account_transactions_operation_date_index` (`operation_date`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_types_parent_account_type_id_index` (`parent_account_type_id`),
  ADD KEY `account_types_business_id_index` (`business_id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcodes_business_id_foreign` (`business_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_contact_id_foreign` (`contact_id`),
  ADD KEY `bookings_business_id_foreign` (`business_id`),
  ADD KEY `bookings_created_by_foreign` (`created_by`),
  ADD KEY `bookings_table_id_index` (`table_id`),
  ADD KEY `bookings_waiter_id_index` (`waiter_id`),
  ADD KEY `bookings_location_id_index` (`location_id`),
  ADD KEY `bookings_booking_status_index` (`booking_status`),
  ADD KEY `bookings_correspondent_id_index` (`correspondent_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_business_id_foreign` (`business_id`),
  ADD KEY `brands_created_by_foreign` (`created_by`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_owner_id_foreign` (`owner_id`),
  ADD KEY `business_currency_id_foreign` (`currency_id`),
  ADD KEY `business_default_sales_tax_foreign` (`default_sales_tax`);

--
-- Indexes for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_locations_business_id_index` (`business_id`),
  ADD KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  ADD KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`),
  ADD KEY `business_locations_sale_invoice_layout_id_index` (`sale_invoice_layout_id`),
  ADD KEY `business_locations_selling_price_group_id_index` (`selling_price_group_id`),
  ADD KEY `business_locations_receipt_printer_type_index` (`receipt_printer_type`),
  ADD KEY `business_locations_printer_id_index` (`printer_id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_registers_business_id_foreign` (`business_id`),
  ADD KEY `cash_registers_user_id_foreign` (`user_id`),
  ADD KEY `cash_registers_location_id_index` (`location_id`),
  ADD KEY `AI_Online` (`ai_id`);

--
-- Indexes for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  ADD KEY `cash_register_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `cash_register_transactions_type_index` (`type`),
  ADD KEY `cash_register_transactions_transaction_type_index` (`transaction_type`),
  ADD KEY `AI_Online` (`ai_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_business_id_foreign` (`business_id`),
  ADD KEY `categories_created_by_foreign` (`created_by`),
  ADD KEY `categories_parent_id_index` (`parent_id`);

--
-- Indexes for table `categorizables`
--
ALTER TABLE `categorizables`
  ADD KEY `categorizables_categorizable_type_categorizable_id_index` (`categorizable_type`,`categorizable_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_business_id_foreign` (`business_id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`),
  ADD KEY `contacts_type_index` (`type`),
  ADD KEY `contacts_contact_status_index` (`contact_status`),
  ADD KEY `AI_OFFLINE` (`ai_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_groups_business_id_foreign` (`business_id`),
  ADD KEY `customer_groups_created_by_index` (`created_by`),
  ADD KEY `customer_groups_price_calculation_type_index` (`price_calculation_type`),
  ADD KEY `customer_groups_selling_price_group_id_index` (`selling_price_group_id`);

--
-- Indexes for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_configurations_business_id_foreign` (`business_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_business_id_index` (`business_id`),
  ADD KEY `discounts_brand_id_index` (`brand_id`),
  ADD KEY `discounts_category_id_index` (`category_id`),
  ADD KEY `discounts_location_id_index` (`location_id`),
  ADD KEY `discounts_priority_index` (`priority`),
  ADD KEY `discounts_spg_index` (`spg`);

--
-- Indexes for table `discount_variations`
--
ALTER TABLE `discount_variations`
  ADD KEY `discount_variations_discount_id_index` (`discount_id`),
  ADD KEY `discount_variations_variation_id_index` (`variation_id`);

--
-- Indexes for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_and_notes_business_id_index` (`business_id`),
  ADD KEY `document_and_notes_notable_id_index` (`notable_id`),
  ADD KEY `document_and_notes_created_by_index` (`created_by`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_business_id_foreign` (`business_id`);

--
-- Indexes for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  ADD KEY `group_sub_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_layouts_business_id_foreign` (`business_id`);

--
-- Indexes for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_schemes_business_id_foreign` (`business_id`),
  ADD KEY `invoice_schemes_scheme_type_index` (`scheme_type`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_business_id_index` (`business_id`),
  ADD KEY `media_uploaded_by_index` (`uploaded_by`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_business_id_foreign` (`business_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_tax_foreign` (`tax`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_business_id_index` (`business_id`),
  ADD KEY `products_unit_id_index` (`unit_id`),
  ADD KEY `products_created_by_index` (`created_by`),
  ADD KEY `products_warranty_id_index` (`warranty_id`),
  ADD KEY `products_type_index` (`type`),
  ADD KEY `products_tax_type_index` (`tax_type`),
  ADD KEY `products_barcode_type_index` (`barcode_type`);

--
-- Indexes for table `product_locations`
--
ALTER TABLE `product_locations`
  ADD KEY `product_locations_product_id_index` (`product_id`),
  ADD KEY `product_locations_location_id_index` (`location_id`);

--
-- Indexes for table `product_racks`
--
ALTER TABLE `product_racks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_racks_business_id_index` (`business_id`),
  ADD KEY `product_racks_location_id_index` (`location_id`),
  ADD KEY `product_racks_product_id_index` (`product_id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_name_index` (`name`),
  ADD KEY `product_variations_product_id_index` (`product_id`);

--
-- Indexes for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_lines_product_id_foreign` (`product_id`),
  ADD KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`),
  ADD KEY `purchase_lines_lot_number_index` (`lot_number`);

--
-- Indexes for table `reference_counts`
--
ALTER TABLE `reference_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference_counts_business_id_index` (`business_id`);

--
-- Indexes for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`);

--
-- Indexes for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_tables_business_id_foreign` (`business_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_business_id_foreign` (`business_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_price_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  ADD KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`),
  ADD KEY `stock_adjustment_lines_lot_no_line_id_index` (`lot_no_line_id`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_business_id_foreign` (`business_id`),
  ADD KEY `tax_rates_created_by_foreign` (`created_by`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_tax_id_foreign` (`tax_id`),
  ADD KEY `transactions_business_id_index` (`business_id`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_contact_id_index` (`contact_id`),
  ADD KEY `transactions_transaction_date_index` (`transaction_date`),
  ADD KEY `transactions_created_by_index` (`created_by`),
  ADD KEY `transactions_location_id_index` (`location_id`),
  ADD KEY `transactions_expense_for_foreign` (`expense_for`),
  ADD KEY `transactions_expense_category_id_index` (`expense_category_id`),
  ADD KEY `transactions_sub_type_index` (`sub_type`),
  ADD KEY `transactions_return_parent_id_index` (`return_parent_id`),
  ADD KEY `type` (`type`),
  ADD KEY `transactions_status_index` (`status`),
  ADD KEY `transactions_sub_status_index` (`sub_status`),
  ADD KEY `transactions_res_table_id_index` (`res_table_id`),
  ADD KEY `transactions_res_waiter_id_index` (`res_waiter_id`),
  ADD KEY `transactions_res_order_status_index` (`res_order_status`),
  ADD KEY `transactions_payment_status_index` (`payment_status`),
  ADD KEY `transactions_discount_type_index` (`discount_type`),
  ADD KEY `transactions_commission_agent_index` (`commission_agent`),
  ADD KEY `transactions_transfer_parent_id_index` (`transfer_parent_id`),
  ADD KEY `transactions_types_of_service_id_index` (`types_of_service_id`),
  ADD KEY `transactions_packing_charge_type_index` (`packing_charge_type`),
  ADD KEY `transactions_recur_parent_id_index` (`recur_parent_id`),
  ADD KEY `transactions_selling_price_group_id_index` (`selling_price_group_id`),
  ADD KEY `AI_Online` (`ai_id`);

--
-- Indexes for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_payments_created_by_index` (`created_by`),
  ADD KEY `transaction_payments_parent_id_index` (`parent_id`),
  ADD KEY `AI_Online` (`ai_id`);

--
-- Indexes for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  ADD KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `transaction_sell_lines_children_type_index` (`children_type`),
  ADD KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`),
  ADD KEY `transaction_sell_lines_line_discount_type_index` (`line_discount_type`),
  ADD KEY `transaction_sell_lines_discount_id_index` (`discount_id`),
  ADD KEY `transaction_sell_lines_lot_no_line_id_index` (`lot_no_line_id`),
  ADD KEY `transaction_sell_lines_sub_unit_id_index` (`sub_unit_id`),
  ADD KEY `AI_Online` (`ai_id`);

--
-- Indexes for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_line_id` (`sell_line_id`),
  ADD KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  ADD KEY `purchase_line_id` (`purchase_line_id`);

--
-- Indexes for table `types_of_services`
--
ALTER TABLE `types_of_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `types_of_services_business_id_index` (`business_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_business_id_foreign` (`business_id`),
  ADD KEY `units_created_by_foreign` (`created_by`),
  ADD KEY `units_base_unit_id_index` (`base_unit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_business_id_foreign` (`business_id`),
  ADD KEY `users_user_type_index` (`user_type`),
  ADD KEY `users_crm_contact_id_foreign` (`crm_contact_id`);

--
-- Indexes for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_contact_access_user_id_index` (`user_id`),
  ADD KEY `user_contact_access_contact_id_index` (`contact_id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`),
  ADD KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  ADD KEY `variations_name_index` (`name`),
  ADD KEY `variations_sub_sku_index` (`sub_sku`),
  ADD KEY `variations_variation_value_id_index` (`variation_value_id`);

--
-- Indexes for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  ADD KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`);

--
-- Indexes for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_location_details_location_id_foreign` (`location_id`),
  ADD KEY `variation_location_details_product_id_index` (`product_id`),
  ADD KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  ADD KEY `variation_location_details_variation_id_index` (`variation_id`);

--
-- Indexes for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_templates_business_id_foreign` (`business_id`);

--
-- Indexes for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_value_templates_name_index` (`name`),
  ADD KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`);

--
-- Indexes for table `warranties`
--
ALTER TABLE `warranties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warranties_business_id_index` (`business_id`),
  ADD KEY `warranties_duration_type_index` (`duration_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `business_locations`
--
ALTER TABLE `business_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `ai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  MODIFY `ai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `ai_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_racks`
--
ALTER TABLE `product_racks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reference_counts`
--
ALTER TABLE `reference_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `res_tables`
--
ALTER TABLE `res_tables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system`
--
ALTER TABLE `system`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `ai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  MODIFY `ai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  MODIFY `ai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `types_of_services`
--
ALTER TABLE `types_of_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `variation_templates`
--
ALTER TABLE `variation_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warranties`
--
ALTER TABLE `warranties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD CONSTRAINT `dashboard_configurations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `printers`
--
ALTER TABLE `printers`
  ADD CONSTRAINT `printers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD CONSTRAINT `res_product_modifier_sets_modifier_set_id_foreign` FOREIGN KEY (`modifier_set_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD CONSTRAINT `res_tables_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD CONSTRAINT `selling_price_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD CONSTRAINT `stock_adjustment_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD CONSTRAINT `tax_rates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD CONSTRAINT `transaction_sell_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variations`
--
ALTER TABLE `variations`
  ADD CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variations_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
