-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2022 at 09:07 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_shop_db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `category_add` (IN `nameCategory` VARCHAR(50), IN `descriptionCat` TEXT, IN `statusCat` TINYINT, IN `date_createdCat` DATETIME)  BEGIN
INSERT INTO categories (category, description, `status`, date_created)
VALUES (nameCategory, descriptionCat, statusCat, date_createdCat);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `category_delete` (IN `idCategory` INT)  BEGIN
	DELETE FROM categories
    WHERE id = idCategory;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `category_listed` ()  BEGIN  
   SELECT * FROM categories;
   -- add where condition if needed
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `category_update` (IN `nameCategory` VARCHAR(50), IN `descriptionCat` TEXT, IN `statusCat` TINYINT, IN `date_createdCat` DATETIME, IN `idCategory` INT(3))  BEGIN
	UPDATE categories SET category=nameCategory,  	   
    description = descriptionCat, `status` = statusCat, 
    date_created = date_createdCat 
    WHERE id=idCategory;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `clients_add` (IN `firstnameClient` VARCHAR(100), IN `lastnameClient` VARCHAR(100), IN `genderClient` VARCHAR(50), IN `contactClient` VARCHAR(50), IN `emailClient` VARCHAR(100), IN `passwordClient` TEXT, IN `addressClient` TEXT, IN `dateClient` DATETIME)  BEGIN
	INSERT INTO clients (firstname, lastname, gender, 
                         contact, email, `password`, 
                         default_delivery_address, 
                         date_created) 
    VALUES (firstnameClient, lastnameClient, 
            genderClient, contactClient, emailClient, 
            md5(passwordClient), addressClient, dateClient);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `clients_delete` (IN `idClient` INT)  BEGIN
	DELETE FROM clients WHERE id = idClient;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `clients_list` ()  BEGIN

	SELECT * FROM clients;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `clients_update` (IN `firstnameClient` VARCHAR(100), IN `lastnameClient` VARCHAR(100), IN `genderClient` VARCHAR(50), IN `contactClient` VARCHAR(50), IN `emailClient` VARCHAR(100), IN `passwordClient` TEXT, IN `addressClient` TEXT, IN `dateClient` DATETIME, IN `idClient` INT)  BEGIN
	UPDATE clients SET firstname=firstnameClient, 
    lastname=lastnameClient, gender=genderClient, 
    contact=contactClient, email=emailClient, 
    password=md5(passwordClient), 
    default_delivery_address=addressClient, 
    date_created=dateClient 
    WHERE id=idClient;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inventory_add` (IN `idProd` INT, IN `quantityInv` DOUBLE, IN `priceInv` FLOAT, IN `date_crInv` DATETIME, IN `date_updInv` DATETIME)  BEGIN

	INSERT INTO inventory (product_id, quantity, price, 
                           date_created, date_updated) 		VALUES (idProd, quantityInv, priceInv, date_crInv,                 date_updInv);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inventory_delete` (IN `idInv` INT)  BEGIN
	DELETE FROM inventory WHERE id=idInv;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inventory_list` ()  BEGIN
	SELECT * FROM inventory;
    -- where condition if needed
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inventory_update` (IN `idProd` INT, IN `quantityInv` DOUBLE, IN `priceInv` FLOAT, IN `date_crInv` DATETIME, IN `date_updInv` DATETIME, IN `idInv` INT)  BEGIN

	UPDATE inventory 
    SET product_id=idProd, quantity=quantityInv, 
    	price=priceInv, date_created=date_crInv, 
        date_updated=date_updInv
    WHERE id=idInv; 

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `order_add` (IN `client_idOrder` INT, IN `addressOrder` TEXT, IN `paymentOrder` VARCHAR(50), IN `typeOrder` TINYINT, IN `amountOrder` DOUBLE, IN `statusOrder` TINYINT, IN `paidOrder` TINYINT, IN `date_crOrder` DATETIME, IN `date_updOrder` DATETIME)  BEGIN
INSERT INTO orders (client_id, delivery_address, payment_method, order_type, amount, `status`, paid, date_created, date_updated)
VALUES (client_idOrder, addressOrder, paymentOrder, typeOrder, amountOrder, statusOrder, paidOrder, date_crOrder, date_updOrder);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `order_delete` (IN `idOrder` INT)  BEGIN
	DELETE FROM orders WHERE id=idOrder;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `order_list` ()  BEGIN
	SELECT * FROM orders;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `order_update` (IN `client_idOrder` INT, IN `addressOrder` TEXT, IN `paymentOrder` VARCHAR(50), IN `typeOrder` TINYINT, IN `amountOrder` DOUBLE, IN `statusOrder` TINYINT, IN `paidOrder` TINYINT, IN `date_crOrder` DATETIME, IN `date_updOrder` DATETIME, IN `idOrder` INT)  BEGIN
	UPDATE orders 
    SET client_id=client_idOrder,  	   
    delivery_address = addressOrder, payment_method = 
    paymentOrder, order_type = typeOrder, amount = 
    amountOrder, `status` = statusOrder, paid = 
    paidOrder, date_created = date_crOrder, date_updated 
    = date_updOrder 
    WHERE id=idOrder;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `products_add` (IN `idCategory` INT, IN `idSubCategory` INT, IN `titleProd` VARCHAR(50), IN `authorProd` TEXT, IN `descriptionProd` TEXT, IN `statusProd` TINYINT, IN `dateProd` DATETIME)  BEGIN
	INSERT INTO products (category_id, sub_category_id, 
                          title, author, description, 
                          `status`, date_created) 
    VALUES (idCategory, idSubCategory, titleProd, 
            authorProd, descriptionProd, statusProd, 
            dateProd);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `products_delete` (IN `idProd` INT)  BEGIN
	DELETE FROM products WHERE id = idProd;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `products_list` ()  BEGIN
	SELECT * FROM products;
    -- where condition if needed
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `products_update` (IN `idCategory` INT, IN `idSubCategory` INT, IN `titleProd` VARCHAR(50), IN `authorProd` TEXT, IN `descriptionProd` TEXT, IN `statusProd` TINYINT, IN `dateProd` DATETIME, IN `idProd` INT)  BEGIN
	UPDATE products SET category_id = idCategory, 
    sub_category_id = idSubCategory, title = titleProd, 
    author = authorProd, description = descriptionProd,
	`status` = statusProd, date_created = dateProd 
    WHERE id = idProd;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sub_cat_add` (IN `parentCatId` INT, IN `nameSubCat` VARCHAR(50), IN `descriptionSubCat` TEXT, IN `statusSubCat` TINYINT, IN `dateSubCat` DATETIME)  BEGIN

	INSERT INTO sub_categories (parent_id, sub_category, 
                                description, `status`, 
                                date_created) 
    VALUES (parentCatId, nameSubCat, descriptionSubCat, 
            statusSubCat, dateSubCat);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sub_cat_delete` (IN `idSubCat` INT)  BEGIN
	DELETE FROM sub_categories WHERE id = idSubCat;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sub_cat_list` ()  BEGIN
	SELECT * FROM sub_categories;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sub_cat_update` (IN `parentCatId` INT, IN `nameSubCat` VARCHAR(50), IN `descriptionSubCat` TEXT, IN `statusSubCat` TINYINT, IN `dateSubCat` DATETIME, IN `idSubCat` INT)  BEGIN
	UPDATE sub_categories SET parent_id=parentCatId, 
    sub_category = nameSubCat, description = 
    descriptionSubCat, `status` = statusSubCat, 
    date_created = dateSubCat 
    WHERE id = idSubCat;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `client_id`, `inventory_id`, `price`, `quantity`, `date_created`) VALUES
(17, 10, 14, 1749, 1, '2021-11-11 21:24:23'),
(18, 10, 6, 2999, 1, '2021-11-11 21:24:38');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Educational', 'In this category of books you can find different kind of programming and grammar books. You can check them out by clicking in the category name.', 1, '2021-07-16 09:08:44'),
(2, 'Fiction', 'If you are more interested in fictional books, here is the best option for you. Check the latest books and pre-order now.', 1, '2021-07-16 09:09:25'),
(3, 'Novels', 'If you love adventure or fantasy, if you want to feel something different and get in the world of the story, here is where you belong. Visit the best books and don\'t lose your chance to order it now.', 1, '2021-07-16 09:09:46'),
(4, 'Best Sellers', 'Here you can find all the latest books from the most famous authors in the world and those that are best sellers right now.', 1, '2021-07-16 11:33:52');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `reset_code` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `reset_code`, `date_created`) VALUES
(2, 'Alteo', 'Mihali', 'Male', '0696927529', 'alteomihali3@gmail.com', '1e22c856afc92a7834fc08691ff8045d', 'Tirane, Albania', 'OYM713VP96', '2022-01-08 17:08:59'),
(17, 'arben', 'taku', 'male', '123', 'arben.taku@yahoo.com', 'b1cc2ce0c73dcb2679bec9a80208eeb8', 'Tirana', NULL, '2021-11-24 10:29:33'),
(26, 'book', 'shop', 'Male', '12345', 'bookshop2122@gmail.com', 'ffbd10a7a1242f4a4fe1fbb5814a18a6', 'Tirane, AL', 'RA4D5P817V', '2021-12-27 14:02:51'),
(27, 'Paola', 'Trey', 'Female', '0417695527', 'paolatrey@gmail.com', '34aef4c51369a68070ba077c09cdd0f8', 'Boston, USA', NULL, '2022-01-08 20:50:57');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `price`, `date_created`, `date_updated`) VALUES
(1, 1, 50, 169, '2021-07-16 10:02:39', '2021-11-11 22:38:24'),
(2, 2, 20, 139, '2021-07-16 10:09:08', '2021-11-11 22:38:10'),
(3, 3, 10, 205, '2021-07-16 12:05:54', '2021-11-11 22:37:55'),
(4, 4, 50, 29, '2021-07-16 13:12:10', '2021-11-11 22:37:29'),
(5, 5, 30, 249, '2021-11-10 22:02:14', '2021-11-11 22:37:16'),
(6, 6, 40, 149, '2021-11-10 22:06:03', '2021-11-11 22:35:08'),
(7, 7, 10, 249, '2021-11-10 22:29:21', '2021-11-11 22:35:25'),
(8, 8, 50, 219, '2021-11-10 22:36:09', '2021-11-11 22:35:34'),
(9, 9, 32, 339, '2021-11-10 22:39:25', '2021-11-11 22:35:47'),
(10, 10, 15, 169, '2021-11-10 22:41:43', '2021-11-11 22:35:56'),
(11, 11, 16, 199, '2021-11-10 22:47:25', '2021-11-11 22:36:13'),
(12, 12, 9, 115, '2021-11-10 22:50:03', '2021-11-11 22:36:23'),
(13, 13, 20, 179, '2021-11-10 22:53:35', '2021-11-11 22:36:36'),
(14, 14, 33, 174, '2021-11-10 23:08:08', '2021-11-11 22:36:46'),
(15, 15, 25, 49, '2021-11-10 23:10:46', '2021-11-11 22:37:02'),
(16, 16, 7, 49, '2021-11-10 23:13:57', '2021-11-11 22:33:32'),
(17, 17, 23, 69, '2021-11-10 23:18:52', '2021-11-11 22:33:43'),
(18, 18, 26, 49, '2021-11-10 23:22:31', '2021-11-11 22:33:55'),
(19, 19, 10, 129, '2021-11-10 23:25:12', '2021-11-11 22:34:06'),
(20, 20, 22, 65, '2021-11-10 23:29:57', '2021-11-11 22:34:21'),
(21, 21, 30, 74, '2021-11-10 23:36:59', '2021-11-11 22:34:37'),
(22, 22, 21, 70, '2021-11-10 23:44:15', '2021-11-11 22:34:47'),
(23, 23, 10, 25, '2021-11-10 23:46:11', '2021-11-11 22:34:57'),
(24, 24, 14, 29, '2021-11-10 23:49:03', '2021-11-11 22:33:13'),
(25, 25, 20, 119, '2021-11-11 21:40:00', '2021-11-11 22:32:51'),
(26, 26, 25, 39, '2021-11-11 21:42:45', '2021-11-11 22:32:31'),
(27, 27, 33, 109, '2021-11-11 21:46:33', '2021-11-11 22:32:22'),
(28, 28, 17, 79, '2021-11-11 21:48:55', '2021-11-11 22:32:10'),
(29, 29, 45, 89, '2021-11-11 21:59:17', '2021-11-11 22:32:01'),
(30, 30, 18, 69, '2021-11-11 22:05:43', '2021-11-11 22:31:50'),
(31, 31, 26, 45, '2021-11-11 22:11:47', NULL),
(32, 32, 56, 79, '2021-11-11 22:18:26', NULL),
(33, 33, 35, 29, '2021-11-11 22:26:06', NULL),
(34, 34, 14, 39, '2021-11-11 22:28:20', NULL),
(35, 35, 46, 99, '2021-11-11 22:30:50', NULL),
(36, 36, 83, 84, '2021-11-11 22:44:27', NULL),
(37, 37, 37, 55, '2021-11-11 22:46:46', '2021-11-11 22:49:03'),
(38, 38, 45, 69, '2021-11-11 22:48:34', NULL),
(39, 39, 76, 79, '2021-11-11 22:50:43', NULL),
(40, 40, 60, 65, '2021-11-11 22:52:44', NULL),
(41, 41, 78, 79, '2021-11-11 22:56:03', NULL),
(42, 42, 66, 63, '2021-11-11 22:58:05', NULL),
(43, 43, 55, 99, '2021-11-11 22:59:49', NULL),
(44, 44, 120, 129, '2021-11-11 23:01:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(1, 1, 'Sample Address', 'Online Payment', 2, 8500, 0, 1, '2021-07-16 11:14:58', NULL),
(4, 1, 'Sample Address', 'Online Payment', 2, 5000, 5, 1, '2021-07-16 13:13:42', '2021-07-16 13:52:56'),
(7, 2, 'Tirane, Albania', 'cod', 2, 2500, 4, 0, '2021-11-09 13:58:40', '2021-11-11 21:20:40'),
(8, 2, 'Tirane, Albania', 'Online Payment', 2, 3500, 2, 1, '2021-11-09 14:07:02', '2021-11-09 14:08:26'),
(9, 3, 'test demo', 'Online Payment', 1, 1999.99, 1, 1, '2021-11-10 12:53:11', '2021-11-10 12:53:55'),
(11, 10, 'Boston, USA', 'cod', 2, 2998, 0, 0, '2021-11-11 21:24:11', NULL),
(12, 1, '', 'Online Payment', 2, 178, 0, 1, '2021-11-11 23:03:38', NULL),
(13, 2, 'Tirane, Albania', 'Online Payment', 1, 550, 5, 1, '2021-11-14 22:27:12', '2021-11-14 22:28:08'),
(14, 2, 'Tirane, Albania', 'Online Payment', 1, 249, 0, 1, '2021-11-15 13:29:19', NULL),
(16, 2, 'Tirane, Albania', 'Online Payment', 1, 258, 3, 1, '2021-12-07 08:59:49', '2021-12-08 16:31:42'),
(17, 1, 'Tirane', 'cod', 1, 149, 0, 0, '2021-12-15 12:19:54', NULL),
(18, 22, 't3st test', 'Online Payment', 2, 249, 1, 1, '2021-12-16 10:59:21', '2021-12-16 11:00:06'),
(19, 2, 'Tirane, Albania', 'Online Payment', 2, 339, 1, 1, '2021-12-21 17:00:47', '2021-12-21 17:01:43'),
(21, 1, '', 'cod', 2, 205, 0, 0, '2021-12-27 12:16:17', NULL),
(24, 27, 'Boston, USA', 'cod', 2, 70, 0, 0, '2022-01-08 21:00:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `quantity`, `price`, `total`) VALUES
(1, 1, 2, 1, 3500, 3500),
(2, 1, 1, 2, 2500, 5000),
(3, 4, 3, 2, 2500, 5000),
(6, 7, 1, 1, 2500, 2500),
(7, 8, 2, 1, 3500, 3500),
(8, 9, 4, 1, 1999.99, 1999.99),
(10, 11, 17, 2, 1499, 2998),
(11, 12, 29, 2, 89, 178),
(12, 13, 31, 1, 45, 45),
(13, 13, 36, 1, 84, 84),
(14, 13, 21, 1, 74, 74),
(15, 13, 25, 2, 119, 238),
(16, 13, 27, 1, 109, 109),
(17, 14, 5, 1, 249, 249),
(18, 15, 30, 2, 69, 138),
(19, 16, 44, 2, 129, 258),
(20, 17, 6, 1, 149, 149),
(21, 18, 5, 1, 249, 249),
(22, 19, 9, 1, 339, 339),
(24, 21, 3, 1, 205, 205),
(27, 24, 22, 1, 70, 70);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_temp`
--

CREATE TABLE `password_reset_temp` (
  `email` varchar(250) NOT NULL,
  `key` varchar(250) NOT NULL,
  `expDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `title` varchar(250) NOT NULL,
  `author` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `title`, `author`, `description`, `status`, `date_created`) VALUES
(1, 1, 1, 'The Joy of PHP: A Beginner\\\'s Guide to Programming', 'Alan Forbes', 'A beginner\'s guide to programming interactive web applications with PHP and MySQL', 1, '2021-07-16 09:43:11'),
(2, 1, 1, 'Modern PHP: New Features and Good Practices', 'Josh Lockhart', 'Enter in an advanced chapter of learning and programming in PHP and MySQL. You will get to know the modern part of PHP and after this course book you will be able to start coding and build complex applications using PHP.', 1, '2021-07-16 10:08:53'),
(3, 1, 2, 'English Grammar in Use', 'Raymond Murphy, Surai Pongtongcharoen', '&lt;p style=\\&quot;text-align: justify; \\&quot;&gt;A self-study reference and practice book for intermediate learners of English with answers. 5th Edition&lt;/p&gt;', 1, '2021-07-16 12:03:08'),
(4, 1, 2, 'English Grammar for Dummies', 'Geraldine Woods', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\\&quot;&gt;Learn English now properly and move from beginner to intermediate to pro.&lt;/p&gt;', 1, '2021-07-16 13:11:17'),
(5, 1, 1, 'Illustrated Guide to Python 3', 'Matt Harrison', '&lt;p&gt;Treading on Python Series.&lt;/p&gt;&lt;p&gt;A complete walkthrough of beginning Python with unique illustrations showing how Python really works.&lt;/p&gt;', 1, '2021-11-10 21:57:47'),
(6, 1, 1, 'Real Python', 'Fletcher Heisler', 'Learn Python language by different examples and go from beginner to advanced level.', 1, '2021-11-10 22:05:36'),
(7, 1, 1, 'Mastering Ruby - Strings and Encodings', 'Aaron Lasseigne', '&lt;p&gt;Learn essential, valuable knowledge for all Ruby on Rail developers! Start now from scratch to becoming a pro.&lt;/p&gt;', 1, '2021-11-10 22:28:55'),
(8, 1, 1, 'Java Programming', 'The Wikibooks Edition', '&lt;p&gt;This book is an introduction to programming in Oracle\\\'s Java programming language,&amp;nbsp; a widely used programming language and software platform. This book serves as a comprehensive guide, complete with a series of tutorials&amp;nbsp;to help users better understand the many ways one can program in Java. In its entirety, this book is meant to be both an introductory guide and a useful reference on Java and related technologies.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-10 22:35:48'),
(9, 1, 1, 'Algorithms in Java, Third Edition', 'Robert Sedgewick', '&lt;p&gt;In this book you will learn all the fundamentals, data structures, sorting and searching topic about Java.&lt;/p&gt;', 1, '2021-11-10 22:39:06'),
(10, 1, 1, 'Coding Art', 'Yu Zhang, Mathias Funk', '&lt;p&gt;The four steps to creative programming with the Processing Language.&lt;/p&gt;', 1, '2021-11-10 22:41:26'),
(11, 1, 2, 'English Practice Grammar - New Edition', 'Michael Macfarlane', '&lt;p&gt;For intermediate learners of English&lt;br&gt;For home-study and classroom use&lt;br&gt;Authentic examples of language in use&lt;br&gt;Full answer key and self-assessment test&lt;/p&gt;', 1, '2021-11-10 22:46:50'),
(12, 1, 2, 'Grammar Scan', 'Michael Swan, David Baker', '&lt;p&gt;Diagnostic tests for Practical English Usage, third edition&amp;nbsp;&lt;/p&gt;', 1, '2021-11-10 22:49:40'),
(13, 1, 2, 'On Screen', 'Virginia Evans, Jenny Dooley', '&lt;p&gt;Workbook &amp;amp; Grammar Book - Level B1+ Intermediate by Express Publishing&lt;/p&gt;', 1, '2021-11-10 22:52:57'),
(14, 2, 3, 'Catcher in the Rye', 'J. D. Salinger', 'The novel details two days in the life of a 16-year-old Holden Caufield after he has been expelled from school preparations.&amp;nbsp;Confused and disillusioned, Holden searches for truth and rails against the &ldquo;phoniness&rdquo; of the adult world.', 1, '2021-11-10 23:07:48'),
(15, 2, 3, 'The Crying Book', 'Heather Christie', '&lt;p&gt;Heather Christle has just lost a dear friend to suicide and now must reckon with her own depression and the birth of her first child. As she faces her grief and impending parenthood, she decides to research the act of crying: what it is and why people do it, even if they rarely talk about it.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-10 23:10:25'),
(16, 2, 3, 'Exploring Art and Literature', 'Aron Medrano', '&lt;p&gt;Interpretations, perspectives and influences&lt;/p&gt;', 1, '2021-11-10 23:13:41'),
(17, 2, 3, 'Monstrous Lies', 'Shina James', '&lt;p&gt;Amelia Waters has accepted her destiny and is determined to find Aaron no matter what it takes. As she treks forward on her quest, she embarks on a gloomy, foul-smelling creation that is very similar to a dream she once had. The moment she sets foot to ground she runs for her life as horrific creatures pour out of every dark shadow. With her life in grave danger, Amelia finds it difficult to stay hopeful on finding Aaron, until an ever changing ally opens her eyes and helps her see that there is more to the creation than she thinks and that it involves a dark force from the past.&amp;nbsp;When Amelia learns that she has the power to save every lost soul, she makes it her mission to destroy the creation along with it\\\'s creator.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-10 23:18:27'),
(18, 2, 3, 'The Mystery of the Sea', 'Bram Stoker', '&lt;p&gt;It tells the&amp;nbsp;story of an Englishman living in Aberdeenshire, Scotland, who meets and falls in love with an American heiress. She is involved with the intrigues of the Spanish-American War, and a complex plot involving second sight, kidnapping, and secret codes unfolds over the course of the novel.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-10 23:22:08'),
(19, 2, 3, 'Adventures in Literature', 'Judith Kay, Rosemary Gelshenen ', '&lt;p&gt;New pathways in reading&lt;/p&gt;', 1, '2021-11-10 23:24:53'),
(20, 2, 3, 'Fall To Earth', 'Ken Britz', '&lt;p&gt;A book written about Indiana Beckam. Her life ambition and dream is to be the best swordsman. She joins Arthur Macbabran, a scientist that has invented a device that can make or break the world. Indiana transforms so she can enter the energy course Arthur has created. However,&amp;nbsp; Cornwall Marks wants to have power and is determined to do anything to keep it.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-10 23:29:31'),
(21, 2, 3, 'I am Watching You', 'Teresa Driscoll', '&lt;p&gt;When Ella Longfield overhears two attractive young men flirting with teenage girls on a train, she thinks nothing of it - until she realises they are fresh out of prison and her maternal instinct is put on high alert. But just as she\\\'s decided to call for help, something stops her.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-10 23:36:38'),
(22, 2, 4, 'The Wayfarer', 'Jennifer F. Hayes', '&lt;p&gt;Emma Clayton&rsquo;s love life is decidedly passionless and predictable. Following her move from Los Angeles to a quaint English village with her fianc&eacute; Ben, all that changes when a violent electrical storm whisks her one hundred and sixty years into the past.&lt;br style=\\&quot;\\&quot;&gt;&lt;br style=\\&quot;\\&quot;&gt;Trapped in Victorian England, Emma is determined to find a way home, back to her fianc&eacute; and the life he&rsquo;s mapped out for them. That is until she meets the captivating Lord Henry Drake, son to the Earl of Pembrooke. Handsome and gallant, he quickly challenges her understanding of love and duty.&lt;br style=\\&quot;\\&quot;&gt;&lt;br style=\\&quot;\\&quot;&gt;But Emma is hiding a terrible secret. She knows of Lord Henry&rsquo;s untimely death, a date which is fast approaching. And before long, she will be forced to choose between saving the man she loves and returning to a life that seems so far away.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-10 23:43:48'),
(23, 2, 4, 'Pragmatism', 'Louis Menand', '&lt;p&gt;&ldquo;The pragmatists believed&amp;nbsp;that ideas were tools,&rdquo; said Menand, &ldquo;that they were produced by groups and were dependent on human carriers and on the environment, like germs.&rdquo; Ideas, in this view, are simply mental constructs that humans forge in order to cope with the world.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-10 23:45:46'),
(24, 2, 4, 'Ancient Israel\\\'s History', 'Bill T. Arnold, Richard S. Hess', '&lt;p&gt;The history of Israel is a much-debated topic in Old Testament studies. On one side are minimalists who find little of historical value in the Hebrew Bible. On the other side are those who assume the biblical text is a precise historical record. Many serious students of the Bible find themselves between these two positions and would benefit from a careful exploration of issues in Israelite history.&lt;br style=\\&quot;\\&quot;&gt;&lt;br style=\\&quot;\\&quot;&gt;This substantive history of Israel textbook values the Bible\\\'s historical contribution without overlooking critical issues and challenges. Featuring the latest scholarship, the book introduces students to the current state of research on issues relevant to the study of ancient Israel. The editors and contributors, all top biblical scholars and historians, discuss historical evidence in a readable manner, using both canonical and chronological lenses to explore Israelite history.&lt;br style=\\&quot;\\&quot;&gt;&lt;br style=\\&quot;\\&quot;&gt;Illustrative items, such as maps and images, visually support the book\\\'s content. Tables and sidebars are also included.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-10 23:48:46'),
(25, 3, 5, 'Impervious', 'Laura Kirwan', '&lt;p style=\\&quot;padding: 0px; margin-right: 0px; margin-bottom: 14px; margin-left: 0px;\\&quot;&gt;&ldquo;Why couldn\\\'t she get me?&rdquo;&lt;/p&gt;&lt;p style=\\&quot;padding: 0px; margin: -4px 0px 14px;\\&quot;&gt;&ldquo;Magic doesn\\\'t work on you. You\\\'re impervious . . .&rdquo;&lt;/p&gt;&lt;p style=\\&quot;padding: 0px; margin: -4px 0px 14px;\\&quot;&gt;Meaghan Keele faces menopause with no husband, no kids, and a job she hates. At her brother\\\'s request, Meaghan moves from Arizona to Pennsylvania to help care for their dying father, taking over his job as lawyer for the tiny town of Eldrich.&lt;/p&gt;&lt;p style=\\&quot;padding: 0px; margin: -4px 0px 14px;\\&quot;&gt;What Meaghan doesn\\\'t know is that law was merely her father\\\'s day job. Gateways to magical worlds riddle the forests surrounding Eldrich. Unaffected by magic-&lt;span style=\\&quot;font-size: 1rem;\\&quot;&gt;impervious-her father spent decades mediating magical disputes and guarding the human world. Without his imposing presence, old enemies are stirring.&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;padding: 0px; margin: -4px 0px 14px;\\&quot;&gt;Impervious, like her father, Meaghan soon senses that everyone around her is keeping secrets. A shocking confrontation on her first day of work quickly clues her in to her new reality. Her office manager and her secretary are witches. Jamie, her handsome young assistant, isn\\\'t exactly human. Eldrich City Hall is haunted. And Meaghan is expected to take over both of her father\\\'s jobs.&lt;/p&gt;&lt;p style=\\&quot;padding: 0px; margin: -4px 0px 14px;\\&quot;&gt;Struggling to accept her destiny, Meaghan is soon drawn into a brutal struggle in another world and a budding romance with John Smith-exiled king, town drunk, and Jamie\\\'s estranged father.&lt;/p&gt;', 1, '2021-11-11 21:39:42'),
(26, 3, 5, 'A Time of Witches', 'Mya Duong', '&lt;p style=\\&quot;padding: 0px; margin-right: 0px; margin-bottom: 14px; margin-left: 0px;\\&quot;&gt;In MINDFUL THINGS, Lauren embraces her true nature as she cultivates her growing powers. She continues to be hunted by loyalists to Raefield, a reminder that he&rsquo;ll do anything to obtain the essence of her powers, even at the cost of her life.&lt;/p&gt;&lt;p style=\\&quot;padding: 0px; margin: -4px 0px 14px;\\&quot;&gt;Now, Lauren and Quinn must flee Chicago to protect her family and friends from Raefield&rsquo;s accomplices. Lauren is determined to finally defeat the forces of evil in a timeless struggle for power. She travels to New Haven, Connecticut, with her family to reconnect with her past and to gain insight into her true identity. Helen conjures up a spell, sending Lauren to confront the secrets that has haunted her family for over a century. She is lured deeper into a world of magic, where visions of hope and prosperity weave within the darkness of Raefield&rsquo;s world, where survival becomes a turn of fate. Armed with new knowledge, Lauren challenges Raefield and is left defeated.&lt;/p&gt;&lt;p style=\\&quot;padding: 0px; margin: -4px 0px 0px;\\&quot;&gt;Lauren receives mysterious gifts from her mother. As Raefield&rsquo;s forces clashes with their lives, Lauren gathers her friends to decipher their meaning. They unravel connections to Lauren, but are thwarted when a power shift surges out of control. Will they be too late to stop the destruction of their world?&lt;/p&gt;', 1, '2021-11-11 21:42:31'),
(27, 3, 5, 'Chosen', 'Caroline Noe', '&lt;p style=\\&quot;padding: 0px; margin: -4px 0px 14px;\\&quot;&gt;Fleeing into the desert to escape the wrath of his brother, the once prince ekes out a harsh existence, forever hiding his true skin.&lt;/p&gt;&lt;p style=\\&quot;padding: 0px; margin: -4px 0px 14px;\\&quot;&gt;The new king takes his throne, embodying everything he vowed not to be, crushed beneath his own rage.&lt;/p&gt;&lt;p style=\\&quot;padding: 0px; margin: -4px 0px 14px;\\&quot;&gt;Canellian slavery grinds ever onward, despite the mounting death toll of the Rebellion. Its Great Prophecy has burned to ash, along with those believed to be the Eye.&lt;/p&gt;&lt;p style=\\&quot;padding: 0px; margin: -4px 0px 14px;\\&quot;&gt;But, deep in the unknown, something is moving. The concealed past is about to rise. A Power beyond words will finally make the choice.&lt;/p&gt;', 1, '2021-11-11 21:46:18'),
(28, 3, 5, 'The House of Sacrifice', 'Anna Smith Spark', '&lt;p&gt;The House of Sacrifice wraps up the downright bloody tragic stories of Marith and Thalia, Orhan and Bil and Darath, and Landra and Tobias. We follow the army of Amrath as it smears blood and death and destruction across the land, unstoppable in their march to conquer the world for their god king.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-11 21:48:36'),
(29, 3, 5, 'Pollyanna', 'Eleanor H. Porter', '&lt;p&gt;Pollyanna by Eleanor H. Porter is the story of a&amp;nbsp;young orphan girl, Pollyanna, who goes to live with her Aunt Polly after the death of her father. Aunt Polly, an aristocratic woman, only cares for Pollyanna as a sense of duty. This doesn\\\'t deter Pollyanna\\\'s boundless optimism, however.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-11 21:59:02'),
(30, 3, 5, 'The Fall of Iromouth - Tales of Naimonet', 'Thalia Blake', '&lt;p&gt;Eleven Kingdoms filled with magic, romance, and adventure! Two princesses in search of a future of their own choosing. A vision of a sapphire crown with waves crashing against dark rocky cliffs has brought Merione and her sister Ezabelle to the faraway island of Mulrane in search of a destiny that is worth living.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-11 22:05:18'),
(31, 3, 6, 'Black Thunder', 'Riley Peyton', '&lt;p&gt;In Black Thunder, Arna Bontemps offers&amp;nbsp;a fictional account of an 1800 slave revolt in Virginia. In the novel, inspired by Toussaint Louverture\\\'s uprising in Haiti, Gabriel leads his fellow slaves against their owner, Thomas Prosser. The cruel owner\\\'s savage murder of an elderly man, Bundy, ignites the outrage.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-11 22:10:24'),
(32, 3, 6, 'Fallen Angel', 'John Ling', '&lt;p&gt;She used to hunt down terrorists...&amp;nbsp;Now she has to hunt down the man she loves...&lt;br style=\\&quot;\\&quot;&gt;Kendra Shaw was once an assassin for her government. Lethal and invisible, she worked in the shadows, hunting down terrorists all around the world. But after a harrowing mission in Iraq goes wrong, the pressure becomes too much for her to take, and she suffers a nervous breakdown.&lt;br style=\\&quot;\\&quot;&gt;Now disgraced and suspended from duty, Kendra is sent back home, where she spends months recovering from the trauma.&lt;br style=\\&quot;\\&quot;&gt;She thinks she is out of the game, but any peace is short-lived.&lt;br style=\\&quot;\\&quot;&gt;One afternoon, on a busy street corner, Kendra spots a familiar face from her past - Ryan Hosseini, the lover she left behind years ago when she decided to serve her country.&lt;br style=\\&quot;\\&quot;&gt;Wrestling with old regrets, she is about to approach him when she realizes that he isn\\\'t alone. A surveillance team is hovering close by. Affiliation unknown. Intention unknown. And before Kendra can make sense of the situation, a bomb detonates and rips through the lunchtime crowd. And amidst the fire and rubble, Ryan vanishes.&lt;br style=\\&quot;\\&quot;&gt;Now Kendra finds herself on the hunt once more, searching the city, determined to uncover the truth. Is Ryan a victim of circumstance? Or is he a home-grown terrorist on the verge of unleashing an even deadlier attack?&lt;br&gt;&lt;/p&gt;', 1, '2021-11-11 22:18:08'),
(33, 3, 6, 'Sea Voyager', 'J. M. Morgans', '&lt;p&gt;\\&quot;A magical adventure on the high seas...\\&quot;&lt;/p&gt;', 1, '2021-11-11 22:25:41'),
(34, 3, 6, 'Revenge of the Maya', 'Clay Farrow', '&lt;p&gt;A thousand-year-old, Mayan goblet bearing a hieroglyphic formula is unearthed in Guatemala\\\'s ancient city of Tikal. The formula snares Dr. Monica Fremont and fianc&eacute;, Hilton Hastings, in a murderous battle between the armies of science and religion.&lt;br style=\\&quot;\\&quot;&gt;&lt;br style=\\&quot;\\&quot;&gt;A mysterious death and Monica\\\'s kidnapping, pit the couple against a ruthless United States Senator, an unscrupulous televangelist, an amoral scientist and Guatemala\\\'s rule of law: law of the jungle, rule of the gun.&lt;br style=\\&quot;\\&quot;&gt;Will Hilton &amp;amp; Monica meet an untimely end, or unravel the mystery in time to live another day and wed?&lt;br&gt;&lt;/p&gt;', 1, '2021-11-11 22:28:05'),
(35, 3, 6, 'Selected by Fate', 'Mitch Rosen', '&lt;p&gt;Eighteen-year-old Trinity is unlike any other werewolf in her pack. For one, there were unusual circumstances surrounding her birth, for another, she is the only pack member to never shift into a wolf form. So now she doesn\\\'t quite belong anywhere.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-11 22:30:34'),
(36, 4, 7, 'Harry Potter and the Cursed Child', 'J. K. Rowling', '&lt;p&gt;&ldquo;Harry Potter and the Cursed Child&rdquo; is about&amp;nbsp;the journey Albus takes while growing up, and the roles he and his best friend, Scorpius (Draco Malfoy\\\'s son), play when dark forces, perhaps in league with Voldemort, once again threaten the fate of the planet.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-11 22:43:59'),
(37, 4, 7, 'The Good Sister and her Flying Monkeys', 'Alexa Blye', '&lt;p&gt;Elena Lacosta, a paranoid, take-no-prisoners drug trafficker turned FBI fugitive, marries a cop and fights her inner demons; her new life depends on it.&lt;br style=\\&quot;\\&quot;&gt;&lt;br style=\\&quot;\\&quot;&gt;When Elena\\\'s oldest brother Gabriel is killed, she listens to what seems like endless accolades about him at his memorial service, held in a packed church with standing room only; and before the dirt on his grave can settle, she is scheming to reinvent herself in her dead brother\\\'s image to launch her new life.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-11 22:46:27'),
(38, 4, 7, 'The Goldfinch', 'Donna Tartt', '&lt;p&gt;The novel is a coming-of-age tale told in the first person. The protagonist, 13-year-old Theodore Decker, survives a terrorist bombing at an art museum where his mother is killed. While staggering through the debris, he takes with him a small Dutch Golden Age painting called The Goldfinch.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-11 22:48:21'),
(39, 4, 7, 'The Girl on the Train', 'Paula Hawkins', '&lt;p&gt;The Girl on the Train is a psychological thriller that tells the story of three women and how their lives intersect.&amp;nbsp;Rachel Watson is an alcoholic. Rachel often drinks to excess and experiences blackouts. She was fired from her job because of her drinking.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-11 22:50:27'),
(40, 4, 7, 'The Fighters - Americans in Combat', 'C. J. Chivers', '&lt;p&gt;Chivers reported on both wars from their beginnings. The Fighters vividly conveys the&amp;nbsp;physical and emotional experience of war&amp;nbsp;as lived by six combatants: a fighter pilot, a corpsman, a scout helicopter pilot, a grunt, an infantry officer, and a Special Forces sergeant.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-11 22:52:17'),
(41, 4, 7, 'Crescent City', 'Sarah J. Mass', '&lt;p&gt;Set in a universe where humans struggle with survival and hierarchies of the magical creatures they live among, Crescent City will follow half-human, half-Sidhe Bryce Quinlan as she seeks to&amp;nbsp;avenge the death&amp;nbsp;of her best friend, who was brutally murdered.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-11 22:55:51'),
(42, 4, 7, 'The Clockmaker\\\'s Daughter', 'Kate Morton', '&lt;p&gt;A rich, spellbinding new novel from the author of The Lake House--the story of a love affair and a mysterious murder that cast their shadows across generations, set in England from the 1860s until the present day.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-11 22:57:47'),
(43, 4, 7, 'Deeply Odd', 'Dean Koontz', '&lt;p&gt;About a month after the events detailed in Odd Apocalypse,&amp;nbsp;Odd Thomas encounters a demented truck driver. During this encounter, when he touches the trucker, Odd suddenly has a vision of three children being burned alive by someone wearing a red suit, black shirt, and black mask.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-11 22:59:36'),
(44, 4, 7, 'Becoming', 'Michelle Obama', '&lt;p&gt;Becoming is the memoir of former First Lady of the United States Michelle Obama, published in 2018. Described by the author as a deeply personal experience, the book talks about her roots and how she found her voice, as well as her time in the White House, her public health campaign, and her role as a mother.&lt;br&gt;&lt;/p&gt;', 1, '2021-11-11 23:01:01');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(1, 3, 8500, '2021-07-16 11:18:12'),
(2, 4, 5000, '2021-07-16 13:13:42'),
(5, 7, 2500, '2021-11-09 13:58:40'),
(6, 8, 3500, '2021-11-09 14:07:02'),
(7, 9, 1999.99, '2021-11-10 12:53:11'),
(9, 11, 2998, '2021-11-11 21:24:11'),
(10, 12, 178, '2021-11-11 23:03:38'),
(11, 13, 550, '2021-11-14 22:27:12'),
(12, 14, 249, '2021-11-15 13:29:20'),
(13, 15, 138, '2021-11-21 22:08:53'),
(14, 16, 258, '2021-12-07 08:59:49'),
(15, 17, 149, '2021-12-15 12:19:54'),
(16, 18, 249, '2021-12-16 10:59:21'),
(17, 19, 339, '2021-12-21 17:00:47'),
(19, 21, 205, '2021-12-27 12:16:17'),
(22, 24, 70, '2022-01-08 21:00:55');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(1, 1, 'Programming', 'Here you can find various books in the field of programming. Order now and start programming!', 1, '2021-07-16 09:10:44'),
(2, 1, 'Grammar', 'Grammar books', 1, '2021-07-16 09:11:05'),
(3, 2, 'Literary', 'Literary books', 1, '2021-07-16 09:11:36'),
(4, 2, 'Historical', 'Historical books', 1, '2021-07-16 09:12:51'),
(5, 3, 'Fantasy', 'Fantasy books', 1, '2021-07-16 09:13:28'),
(6, 3, 'Action and Adventure', 'All the action and adventure books', 1, '2021-07-16 09:13:49'),
(7, 4, 'Latest Books', 'Latest books from famous authors worldwide', 1, '2021-07-16 11:34:22');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Online Book Shop'),
(6, 'short_name', 'Books'),
(11, 'logo', 'uploads/1626397500_book_logo.jpg'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1626397620_books.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Admin', 'System', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-11-11 23:29:21'),
(4, 'John', 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', NULL, NULL, 0, '2021-06-19 08:36:09', '2021-11-10 08:36:19'),
(5, 'Claire', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', NULL, NULL, 0, '2021-06-19 10:01:51', '2021-06-19 12:03:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
