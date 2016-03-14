-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 14 Mars 2016 à 13:58
-- Version du serveur :  5.7.9
-- Version de PHP :  5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pasteque`
--

-- --------------------------------------------------------

--
-- Structure de la table `application`
--

DROP TABLE IF EXISTS `application`;
CREATE TABLE IF NOT EXISTS `application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
CREATE TABLE IF NOT EXISTS `attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_order` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `added_date` datetime NOT NULL,
  `added_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `attribute_instance`
--

DROP TABLE IF EXISTS `attribute_instance`;
CREATE TABLE IF NOT EXISTS `attribute_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attributesetinstance_id` int(11) DEFAULT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DEB22B2E282FE425` (`attributesetinstance_id`),
  KEY `IDX_DEB22B2EB6E62EFA` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `attribute_set`
--

DROP TABLE IF EXISTS `attribute_set`;
CREATE TABLE IF NOT EXISTS `attribute_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `attribute_set_instance`
--

DROP TABLE IF EXISTS `attribute_set_instance`;
CREATE TABLE IF NOT EXISTS `attribute_set_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attributeset_id` int(11) DEFAULT NULL,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FA3764C479FB0232` (`attributeset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `attribute_use`
--

DROP TABLE IF EXISTS `attribute_use`;
CREATE TABLE IF NOT EXISTS `attribute_use` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attributeset_id` int(11) DEFAULT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A2BB59F479FB0232` (`attributeset_id`),
  KEY `IDX_A2BB59F4B6E62EFA` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `attribute_value`
--

DROP TABLE IF EXISTS `attribute_value`;
CREATE TABLE IF NOT EXISTS `attribute_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) DEFAULT NULL,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FE4FBB82B6E62EFA` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cash`
--

DROP TABLE IF EXISTS `cash`;
CREATE TABLE IF NOT EXISTS `cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cashregister_id` int(11) DEFAULT NULL,
  `money` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `host_sequence` int(11) NOT NULL,
  `open_date` datetime NOT NULL,
  `close_date` datetime NOT NULL,
  `open_cash` double NOT NULL,
  `close_cash` double NOT NULL,
  `expected_cash` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6B9E5B99ED3320C` (`cashregister_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cash_movement`
--

DROP TABLE IF EXISTS `cash_movement`;
CREATE TABLE IF NOT EXISTS `cash_movement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `currency_amount` double NOT NULL,
  `date` datetime NOT NULL,
  `note` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cash_register`
--

DROP TABLE IF EXISTS `cash_register`;
CREATE TABLE IF NOT EXISTS `cash_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3D7AB1D964D218E` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` longblob,
  `display_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_64C19C15E237E06` (`name`),
  UNIQUE KEY `UNIQ_64C19C1727ACA70` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `currency`
--

DROP TABLE IF EXISTS `currency`;
CREATE TABLE IF NOT EXISTS `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `decimal_separator` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thousands_separator` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `rate` double NOT NULL,
  `is_main` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxcustomercategory_id` int(11) DEFAULT NULL,
  `discountprofile_id` int(11) DEFAULT NULL,
  `tariffarea_id` int(11) DEFAULT NULL,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `search_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `card` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_debt` double NOT NULL,
  `prepaid` double NOT NULL,
  `current_debt` double DEFAULT NULL,
  `debt_date` datetime DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `note` longtext COLLATE utf8_unicode_ci,
  `visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_81398E09E7881FEF` (`taxcustomercategory_id`),
  KEY `IDX_81398E09E1BC3B58` (`discountprofile_id`),
  KEY `IDX_81398E0954EC7A8F` (`tariffarea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `discount`
--

DROP TABLE IF EXISTS `discount`;
CREATE TABLE IF NOT EXISTS `discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `rate` double DEFAULT NULL,
  `barcode` varchar(21) COLLATE utf8_unicode_ci DEFAULT NULL,
  `barcode_type` int(11) NOT NULL,
  `display_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `discount_profile`
--

DROP TABLE IF EXISTS `discount_profile`;
CREATE TABLE IF NOT EXISTS `discount_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rate` double NOT NULL,
  `display_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `floor`
--

DROP TABLE IF EXISTS `floor`;
CREATE TABLE IF NOT EXISTS `floor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_BE45D62E5E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
CREATE TABLE IF NOT EXISTS `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `card` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` longblob,
  `visible` tinyint(1) NOT NULL,
  `added_date` datetime NOT NULL,
  `added_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  KEY `IDX_957A6479D60322AC` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `group`
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE IF NOT EXISTS `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price_sell` double NOT NULL,
  `display_order` int(11) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL,
  `is_scale` tinyint(1) NOT NULL,
  `price_buy` double DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` longblob,
  `discount_enabled` tinyint(1) NOT NULL,
  `discount_rate` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inventory_item`
--

DROP TABLE IF EXISTS `inventory_item`;
CREATE TABLE IF NOT EXISTS `inventory_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `attributesetinstance_id` int(11) DEFAULT NULL,
  `quantity` double NOT NULL,
  `lost_quantity` double NOT NULL,
  `defect_quantity` double NOT NULL,
  `missing_quantity` double NOT NULL,
  `unit_value` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_55BDEA309EEA759` (`inventory_id`),
  KEY `IDX_55BDEA304584665A` (`product_id`),
  KEY `IDX_55BDEA30282FE425` (`attributesetinstance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5E9E89CB5E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `note` longtext COLLATE utf8_unicode_ci,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
CREATE TABLE IF NOT EXISTS `order_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line` int(11) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `attributes` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `currency_amount` double NOT NULL,
  `back_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `back_amount` double DEFAULT NULL,
  `return_message` longblob,
  `paired_with` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` longtext COLLATE utf8_unicode_ci,
  `pairedPayment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6D28840DC8D3E95E` (`pairedPayment_id`),
  KEY `IDX_6D28840D2B5CA896` (`receipt_id`),
  KEY `IDX_6D28840D38248176` (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payment_mode`
--

DROP TABLE IF EXISTS `payment_mode`;
CREATE TABLE IF NOT EXISTS `payment_mode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `back_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `flags` int(11) NOT NULL,
  `image` longblob,
  `display_order` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `system` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payment_mode_return`
--

DROP TABLE IF EXISTS `payment_mode_return`;
CREATE TABLE IF NOT EXISTS `payment_mode_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentmode_id` int(11) DEFAULT NULL,
  `paymentreturnmode_id` int(11) DEFAULT NULL,
  `minimum` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7CE29C71ABEEF95F` (`paymentmode_id`),
  KEY `IDX_7CE29C71F6A02DA5` (`paymentreturnmode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payment_mode_value`
--

DROP TABLE IF EXISTS `payment_mode_value`;
CREATE TABLE IF NOT EXISTS `payment_mode_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentmode_id` int(11) DEFAULT NULL,
  `value` double NOT NULL,
  `resource` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DA1DF01EABEEF95F` (`paymentmode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `place`
--

DROP TABLE IF EXISTS `place`;
CREATE TABLE IF NOT EXISTS `place` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `floor_id` int(11) DEFAULT NULL,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_741D53CD5E237E06` (`name`),
  KEY `IDX_741D53CD854679E2` (`floor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `taxcategory_id` int(11) DEFAULT NULL,
  `attributeset_id` int(11) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `barcode_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price_buy` double DEFAULT NULL,
  `price_sell` double NOT NULL,
  `stock_cost` double DEFAULT NULL,
  `stock_volume` double DEFAULT NULL,
  `image` longblob,
  `is_com` tinyint(1) NOT NULL,
  `is_scale` tinyint(1) NOT NULL,
  `attributes` longblob,
  `discount_enabled` tinyint(1) NOT NULL,
  `discount_rate` double NOT NULL,
  `visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D34A04ADAEA34913` (`reference`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`),
  KEY `IDX_D34A04ADAA9A9D46` (`taxcategory_id`),
  KEY `IDX_D34A04AD79FB0232` (`attributeset_id`),
  KEY `IDX_D34A04ADA53A8AA` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
CREATE TABLE IF NOT EXISTS `product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `category_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CDFC73564584665A` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_com`
--

DROP TABLE IF EXISTS `product_com`;
CREATE TABLE IF NOT EXISTS `product_com` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_1_id` int(11) DEFAULT NULL,
  `product_2_id` int(11) DEFAULT NULL,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_849992F97D3B7E5B` (`product_1_id`),
  KEY `IDX_849992F96F8ED1B5` (`product_2_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `provider`
--

DROP TABLE IF EXISTS `provider`;
CREATE TABLE IF NOT EXISTS `provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` longblob,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` longtext COLLATE utf8_unicode_ci,
  `display_order` int(11) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
CREATE TABLE IF NOT EXISTS `receipt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cash_id` int(11) DEFAULT NULL,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `attributes` longblob,
  PRIMARY KEY (`id`),
  KEY `IDX_5399B6453D7A0C28` (`cash_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `added_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `chairs` int(11) NOT NULL,
  `is_done` tinyint(1) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reservation_customer`
--

DROP TABLE IF EXISTS `reservation_customer`;
CREATE TABLE IF NOT EXISTS `reservation_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservation_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1C8C6C1DB83297E7` (`reservation_id`),
  KEY `IDX_1C8C6C1D9395C3F3` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

DROP TABLE IF EXISTS `resource`;
CREATE TABLE IF NOT EXISTS `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `content` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_BC91F4165E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_57698A6A5E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `shared_ticket`
--

DROP TABLE IF EXISTS `shared_ticket`;
CREATE TABLE IF NOT EXISTS `shared_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `tariffarea_id` int(11) DEFAULT NULL,
  `discountprofile_id` int(11) DEFAULT NULL,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_count` int(11) DEFAULT NULL,
  `discount_rate` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F458AF979395C3F3` (`customer_id`),
  KEY `IDX_F458AF9754EC7A8F` (`tariffarea_id`),
  KEY `IDX_F458AF97E1BC3B58` (`discountprofile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `shared_ticket_line`
--

DROP TABLE IF EXISTS `shared_ticket_line`;
CREATE TABLE IF NOT EXISTS `shared_ticket_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sharedticket_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `discount_rate` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `attributes` longblob,
  PRIMARY KEY (`id`),
  KEY `IDX_E8606D0FBE4F391` (`sharedticket_id`),
  KEY `IDX_E8606D0F4584665A` (`product_id`),
  KEY `IDX_E8606D0FB2A824D8` (`tax_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `stock_current`
--

DROP TABLE IF EXISTS `stock_current`;
CREATE TABLE IF NOT EXISTS `stock_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `attributesetinstance_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `quantity` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C55524A84584665A` (`product_id`),
  KEY `IDX_C55524A8282FE425` (`attributesetinstance_id`),
  KEY `IDX_C55524A864D218E` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `stock_level`
--

DROP TABLE IF EXISTS `stock_level`;
CREATE TABLE IF NOT EXISTS `stock_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `security` double DEFAULT NULL,
  `maximum` double DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6FAD0E24584665A` (`product_id`),
  KEY `IDX_6FAD0E264D218E` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `stock_move`
--

DROP TABLE IF EXISTS `stock_move`;
CREATE TABLE IF NOT EXISTS `stock_move` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `attributesetinstance_id` int(11) DEFAULT NULL,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `reason` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F6246FBC64D218E` (`location_id`),
  KEY `IDX_F6246FBC4584665A` (`product_id`),
  KEY `IDX_F6246FBC282FE425` (`attributesetinstance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sub_group`
--

DROP TABLE IF EXISTS `sub_group`;
CREATE TABLE IF NOT EXISTS `sub_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL,
  `image` longblob,
  `display_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8184207CFE54D947` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sub_group_product`
--

DROP TABLE IF EXISTS `sub_group_product`;
CREATE TABLE IF NOT EXISTS `sub_group_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subgroup_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9AE7977FF5C464CE` (`subgroup_id`),
  KEY `IDX_9AE7977F4584665A` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tariff_area`
--

DROP TABLE IF EXISTS `tariff_area`;
CREATE TABLE IF NOT EXISTS `tariff_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_order` int(11) DEFAULT NULL,
  `note` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_70F080E65E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tariff_area_price`
--

DROP TABLE IF EXISTS `tariff_area_price`;
CREATE TABLE IF NOT EXISTS `tariff_area_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tariffarea_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price_sell` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E39CF8BF54EC7A8F` (`tariffarea_id`),
  KEY `IDX_E39CF8BF4584665A` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tax`
--

DROP TABLE IF EXISTS `tax`;
CREATE TABLE IF NOT EXISTS `tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `taxcategory_id` int(11) DEFAULT NULL,
  `taxcustomercategory_id` int(11) DEFAULT NULL,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `rate` double NOT NULL,
  `rate_cascade` tinyint(1) DEFAULT NULL,
  `rate_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8E81BA765E237E06` (`name`),
  UNIQUE KEY `UNIQ_8E81BA76727ACA70` (`parent_id`),
  KEY `IDX_8E81BA76AA9A9D46` (`taxcategory_id`),
  KEY `IDX_8E81BA76E7881FEF` (`taxcustomercategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tax_category`
--

DROP TABLE IF EXISTS `tax_category`;
CREATE TABLE IF NOT EXISTS `tax_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E6D8B87F5E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tax_customer_category`
--

DROP TABLE IF EXISTS `tax_customer_category`;
CREATE TABLE IF NOT EXISTS `tax_customer_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C10BEF5E5E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tax_line`
--

DROP TABLE IF EXISTS `tax_line`;
CREATE TABLE IF NOT EXISTS `tax_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_id` int(11) DEFAULT NULL,
  `receipt_id` int(11) DEFAULT NULL,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `base` double NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CD9BBB0EB2A824D8` (`tax_id`),
  KEY `IDX_CD9BBB0E2B5CA896` (`receipt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `third_party`
--

DROP TABLE IF EXISTS `third_party`;
CREATE TABLE IF NOT EXISTS `third_party` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cif` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_comm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_fact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pay_rule` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `web_page` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_346F1E22A53EB8E8` (`cif`),
  UNIQUE KEY `UNIQ_346F1E225E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE IF NOT EXISTS `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `tariffarea_id` int(11) DEFAULT NULL,
  `discountprofile_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `customer_count` int(11) DEFAULT NULL,
  `discount_rate` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_97A0ADA32B5CA896` (`receipt_id`),
  KEY `IDX_97A0ADA3A76ED395` (`user_id`),
  KEY `IDX_97A0ADA39395C3F3` (`customer_id`),
  KEY `IDX_97A0ADA354EC7A8F` (`tariffarea_id`),
  KEY `IDX_97A0ADA3E1BC3B58` (`discountprofile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ticket_line`
--

DROP TABLE IF EXISTS `ticket_line`;
CREATE TABLE IF NOT EXISTS `ticket_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `attributesetinstance_id` int(11) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `line` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `price` double NOT NULL,
  `discount_rate` double NOT NULL,
  `attributes` longblob,
  `product_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E3CFA1CE700047D2` (`ticket_id`),
  KEY `IDX_E3CFA1CE4584665A` (`product_id`),
  KEY `IDX_E3CFA1CE282FE425` (`attributesetinstance_id`),
  KEY `IDX_E3CFA1CEB2A824D8` (`tax_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `zticket`
--

DROP TABLE IF EXISTS `zticket`;
CREATE TABLE IF NOT EXISTS `zticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `open_cash` double DEFAULT NULL,
  `close_cash` double DEFAULT NULL,
  `ticket_count` int(11) DEFAULT NULL,
  `customer_count` int(11) DEFAULT NULL,
  `payment_count` int(11) DEFAULT NULL,
  `cs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `attribute_instance`
--
ALTER TABLE `attribute_instance`
  ADD CONSTRAINT `FK_DEB22B2E282FE425` FOREIGN KEY (`attributesetinstance_id`) REFERENCES `attribute_set_instance` (`id`),
  ADD CONSTRAINT `FK_DEB22B2EB6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`);

--
-- Contraintes pour la table `attribute_set_instance`
--
ALTER TABLE `attribute_set_instance`
  ADD CONSTRAINT `FK_FA3764C479FB0232` FOREIGN KEY (`attributeset_id`) REFERENCES `attribute_set` (`id`);

--
-- Contraintes pour la table `attribute_use`
--
ALTER TABLE `attribute_use`
  ADD CONSTRAINT `FK_A2BB59F479FB0232` FOREIGN KEY (`attributeset_id`) REFERENCES `attribute_set` (`id`),
  ADD CONSTRAINT `FK_A2BB59F4B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`);

--
-- Contraintes pour la table `attribute_value`
--
ALTER TABLE `attribute_value`
  ADD CONSTRAINT `FK_FE4FBB82B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `attribute_value` (`id`);

--
-- Contraintes pour la table `cash`
--
ALTER TABLE `cash`
  ADD CONSTRAINT `FK_6B9E5B99ED3320C` FOREIGN KEY (`cashregister_id`) REFERENCES `cash_register` (`id`);

--
-- Contraintes pour la table `cash_register`
--
ALTER TABLE `cash_register`
  ADD CONSTRAINT `FK_3D7AB1D964D218E` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`);

--
-- Contraintes pour la table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK_64C19C1727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_81398E0954EC7A8F` FOREIGN KEY (`tariffarea_id`) REFERENCES `tariff_area` (`id`),
  ADD CONSTRAINT `FK_81398E09E1BC3B58` FOREIGN KEY (`discountprofile_id`) REFERENCES `discount_profile` (`id`),
  ADD CONSTRAINT `FK_81398E09E7881FEF` FOREIGN KEY (`taxcustomercategory_id`) REFERENCES `tax_customer_category` (`id`);

--
-- Contraintes pour la table `fos_user`
--
ALTER TABLE `fos_user`
  ADD CONSTRAINT `FK_957A6479D60322AC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Contraintes pour la table `inventory_item`
--
ALTER TABLE `inventory_item`
  ADD CONSTRAINT `FK_55BDEA30282FE425` FOREIGN KEY (`attributesetinstance_id`) REFERENCES `attribute_set_instance` (`id`),
  ADD CONSTRAINT `FK_55BDEA304584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_55BDEA309EEA759` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`);

--
-- Contraintes pour la table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK_6D28840D2B5CA896` FOREIGN KEY (`receipt_id`) REFERENCES `receipt` (`id`),
  ADD CONSTRAINT `FK_6D28840D38248176` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `FK_6D28840DC8D3E95E` FOREIGN KEY (`pairedPayment_id`) REFERENCES `payment` (`id`);

--
-- Contraintes pour la table `payment_mode_return`
--
ALTER TABLE `payment_mode_return`
  ADD CONSTRAINT `FK_7CE29C71ABEEF95F` FOREIGN KEY (`paymentmode_id`) REFERENCES `payment_mode` (`id`),
  ADD CONSTRAINT `FK_7CE29C71F6A02DA5` FOREIGN KEY (`paymentreturnmode_id`) REFERENCES `payment_mode` (`id`);

--
-- Contraintes pour la table `payment_mode_value`
--
ALTER TABLE `payment_mode_value`
  ADD CONSTRAINT `FK_DA1DF01EABEEF95F` FOREIGN KEY (`paymentmode_id`) REFERENCES `payment_mode` (`id`);

--
-- Contraintes pour la table `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT `FK_741D53CD854679E2` FOREIGN KEY (`floor_id`) REFERENCES `floor` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_D34A04AD79FB0232` FOREIGN KEY (`attributeset_id`) REFERENCES `attribute_set` (`id`),
  ADD CONSTRAINT `FK_D34A04ADA53A8AA` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`id`),
  ADD CONSTRAINT `FK_D34A04ADAA9A9D46` FOREIGN KEY (`taxcategory_id`) REFERENCES `tax_category` (`id`);

--
-- Contraintes pour la table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `FK_CDFC73564584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `product_com`
--
ALTER TABLE `product_com`
  ADD CONSTRAINT `FK_849992F96F8ED1B5` FOREIGN KEY (`product_2_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_849992F97D3B7E5B` FOREIGN KEY (`product_1_id`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `receipt`
--
ALTER TABLE `receipt`
  ADD CONSTRAINT `FK_5399B6453D7A0C28` FOREIGN KEY (`cash_id`) REFERENCES `cash` (`id`);

--
-- Contraintes pour la table `reservation_customer`
--
ALTER TABLE `reservation_customer`
  ADD CONSTRAINT `FK_1C8C6C1D9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `FK_1C8C6C1DB83297E7` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`);

--
-- Contraintes pour la table `shared_ticket`
--
ALTER TABLE `shared_ticket`
  ADD CONSTRAINT `FK_F458AF9754EC7A8F` FOREIGN KEY (`tariffarea_id`) REFERENCES `tariff_area` (`id`),
  ADD CONSTRAINT `FK_F458AF979395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `FK_F458AF97E1BC3B58` FOREIGN KEY (`discountprofile_id`) REFERENCES `discount_profile` (`id`);

--
-- Contraintes pour la table `shared_ticket_line`
--
ALTER TABLE `shared_ticket_line`
  ADD CONSTRAINT `FK_E8606D0F4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_E8606D0FB2A824D8` FOREIGN KEY (`tax_id`) REFERENCES `tax` (`id`),
  ADD CONSTRAINT `FK_E8606D0FBE4F391` FOREIGN KEY (`sharedticket_id`) REFERENCES `shared_ticket` (`id`);

--
-- Contraintes pour la table `stock_current`
--
ALTER TABLE `stock_current`
  ADD CONSTRAINT `FK_C55524A8282FE425` FOREIGN KEY (`attributesetinstance_id`) REFERENCES `attribute_set_instance` (`id`),
  ADD CONSTRAINT `FK_C55524A84584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_C55524A864D218E` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`);

--
-- Contraintes pour la table `stock_level`
--
ALTER TABLE `stock_level`
  ADD CONSTRAINT `FK_6FAD0E24584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_6FAD0E264D218E` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`);

--
-- Contraintes pour la table `stock_move`
--
ALTER TABLE `stock_move`
  ADD CONSTRAINT `FK_F6246FBC282FE425` FOREIGN KEY (`attributesetinstance_id`) REFERENCES `attribute_set_instance` (`id`),
  ADD CONSTRAINT `FK_F6246FBC4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_F6246FBC64D218E` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`);

--
-- Contraintes pour la table `sub_group`
--
ALTER TABLE `sub_group`
  ADD CONSTRAINT `FK_8184207CFE54D947` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`);

--
-- Contraintes pour la table `sub_group_product`
--
ALTER TABLE `sub_group_product`
  ADD CONSTRAINT `FK_9AE7977F4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_9AE7977FF5C464CE` FOREIGN KEY (`subgroup_id`) REFERENCES `sub_group` (`id`);

--
-- Contraintes pour la table `tariff_area_price`
--
ALTER TABLE `tariff_area_price`
  ADD CONSTRAINT `FK_E39CF8BF4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_E39CF8BF54EC7A8F` FOREIGN KEY (`tariffarea_id`) REFERENCES `tariff_area` (`id`);

--
-- Contraintes pour la table `tax`
--
ALTER TABLE `tax`
  ADD CONSTRAINT `FK_8E81BA76727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `tax` (`id`),
  ADD CONSTRAINT `FK_8E81BA76AA9A9D46` FOREIGN KEY (`taxcategory_id`) REFERENCES `tax_category` (`id`),
  ADD CONSTRAINT `FK_8E81BA76E7881FEF` FOREIGN KEY (`taxcustomercategory_id`) REFERENCES `tax_customer_category` (`id`);

--
-- Contraintes pour la table `tax_line`
--
ALTER TABLE `tax_line`
  ADD CONSTRAINT `FK_CD9BBB0E2B5CA896` FOREIGN KEY (`receipt_id`) REFERENCES `receipt` (`id`),
  ADD CONSTRAINT `FK_CD9BBB0EB2A824D8` FOREIGN KEY (`tax_id`) REFERENCES `tax` (`id`);

--
-- Contraintes pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `FK_97A0ADA32B5CA896` FOREIGN KEY (`receipt_id`) REFERENCES `receipt` (`id`),
  ADD CONSTRAINT `FK_97A0ADA354EC7A8F` FOREIGN KEY (`tariffarea_id`) REFERENCES `tariff_area` (`id`),
  ADD CONSTRAINT `FK_97A0ADA39395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `FK_97A0ADA3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_97A0ADA3E1BC3B58` FOREIGN KEY (`discountprofile_id`) REFERENCES `discount_profile` (`id`);

--
-- Contraintes pour la table `ticket_line`
--
ALTER TABLE `ticket_line`
  ADD CONSTRAINT `FK_E3CFA1CE282FE425` FOREIGN KEY (`attributesetinstance_id`) REFERENCES `attribute_set_instance` (`id`),
  ADD CONSTRAINT `FK_E3CFA1CE4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_E3CFA1CE700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`),
  ADD CONSTRAINT `FK_E3CFA1CEB2A824D8` FOREIGN KEY (`tax_id`) REFERENCES `tax` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
