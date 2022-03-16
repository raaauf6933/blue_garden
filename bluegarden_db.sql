-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 16, 2022 at 06:43 AM
-- Server version: 5.6.51-cll-lve
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bluegarden_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `additional_type`
--

CREATE TABLE `additional_type` (
  `additional_id` int(32) NOT NULL,
  `additional_type` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `additional_amount` float(10,2) NOT NULL,
  `status` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `additional_type`
--

INSERT INTO `additional_type` (`additional_id`, `additional_type`, `description`, `additional_amount`, `status`) VALUES
(13, 'Extra bed', 'Extra bed', 200.00, 1),
(15, 'Additional Guest', 'Additional Guest', 500.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `id` int(32) NOT NULL,
  `billing_id` int(32) NOT NULL,
  `original_capital` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`id`, `billing_id`, `original_capital`) VALUES
(1, 50655208, 3000.00),
(2, 50931576, 6000.00),
(3, 51594848, 3000.00),
(4, 52194470, 3000.00),
(5, 60174717, 3000.00),
(6, 60255129, 4000.00),
(7, 60946692, 4000.00),
(8, 60946692, 3000.00),
(9, 61926088, 6000.00),
(10, 61926088, 13200.00),
(11, 61933315, 4000.00),
(12, 61935374, 8800.00),
(13, 61959925, 6000.00),
(14, 61959925, 8800.00),
(15, 62019839, 3000.00),
(16, 62019839, 4400.00),
(17, 62034285, 3000.00),
(18, 62866112, 6000.00),
(19, 62866112, 4400.00),
(20, 63461197, 35200.00),
(21, 65354759, 4400.00),
(22, 65355123, 3000.00),
(23, 65385050, 3000.00),
(24, 65408797, 3000.00),
(25, 65435469, 8800.00),
(26, 65517958, 24000.00),
(27, 65517958, 17600.00),
(28, 65525952, 4400.00),
(29, 65525952, 3000.00),
(30, 67178939, 4000.00),
(31, 67667512, 4400.00),
(32, 67681519, 4400.00),
(33, 67694543, 4400.00),
(35, 67708398, 2400.00),
(37, 67913910, 1500.00),
(38, 67929251, 3000.00),
(39, 67924386, 6000.00),
(44, 68731065, 4800.00),
(47, 68731060, 20800.00),
(49, 68748145, 13200.00),
(50, 68744739, 3000.00),
(52, 68758516, 9000.00),
(54, 68759522, 8800.00),
(56, 68882751, 4800.00),
(58, 68889320, 9000.00),
(59, 69458326, 6000.00),
(60, 69466686, 3000.00),
(61, 69463283, 3000.00),
(62, 69567517, 6000.00),
(63, 6956390, 12000.00),
(64, 69574009, 12000.00),
(65, 69695506, 13200.00),
(66, 69717763, 18000.00),
(67, 69721995, 9000.00),
(69, 69742766, 3000.00),
(73, 69756643, 9000.00),
(74, 69769756, 8000.00),
(76, 69776183, 3000.00),
(77, 697496, 7200.00),
(78, 69767572, 12000.00),
(79, 73921678, 1500.00),
(80, 74106930, 6000.00),
(81, 74119010, 6000.00),
(83, 74131372, 5640.00),
(85, 74688849, 1500.00),
(86, 74788995, 3000.00),
(88, 74809897, 3000.00),
(89, 74803388, 26400.00),
(90, 71919946, 3000.00);

-- --------------------------------------------------------

--
-- Table structure for table `discount_type`
--

CREATE TABLE `discount_type` (
  `id` int(32) NOT NULL,
  `discount_name` varchar(255) NOT NULL,
  `discount_value` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `discount_type`
--

INSERT INTO `discount_type` (`id`, `discount_name`, `discount_value`, `status`) VALUES
(1, 'Senior/PWD', '.20', 1),
(2, '50% Discount', '.50', 1),
(3, '30% Discount', '.30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `guest_id` int(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `addressline_1` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zipcode` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`guest_id`, `first_name`, `last_name`, `gender`, `contact_number`, `email`, `addressline_1`, `city`, `zipcode`) VALUES
(3688232, 'kenneth', 'balderama', 'null', '09616215920', 'kennethbalderama0409@gmail.com', '#80 Patricia Village', 'Aritao', 0),
(3741271, 'kenneth', 'balderama', 'Male', '09616215920', 'kennethbalderama0409@gmail.com', '', 'Biliran', 1001),
(35092472, 'Thomas Emmanuel', 'Benito', 'null', '09275186903', 'thomlovesu@gmail.com', 'Unit 3E Camachile, Westmont Village Condominiums, Sucat Paranaque City', 'ParaÃ±aque', 0),
(35218426, 'Bernadette', 'Fajut', 'null', '09616215920', 'kennethbalderama0409@gmail.com', '', 'Roxas', 0),
(36098871, 'Anne', 'Faminialagao', 'null', '09211243538', 'annefajut21@gmail.com', '20 villaresis street, Bagumbayan', 'Roxas', 0),
(36197022, 'GREEZE', 'DE ZOSA', 'null', '09091', 'maygreeze.dezosa@ue.edu.ph', '', 'Rizal', 0),
(36198459, 'GREEZE', 'DE ZOSA', 'null', '0911', 'maygreeze.dezosa@ue.edu.ph', '', 'Plaridel', 0),
(36282216, 'kenneth', 'balderama', 'null', '09616215920', 'kennethbalderama0409@gmail.com', 'banganan', 'Aritao', 0),
(36343994, 'Norman', 'Faminialagao', 'null', '09208643148', 'normanf_14@yahoo.com', 'Roxas', 'Roxas', 0),
(36531253, 'kenneth', 'balderama', 'null', '09616215920', 'kennethbalderama0409@gmail.com', 'aritao', 'Aritao', 0),
(36542306, 'Thomas Emmanuel', 'Benito', 'null', '09275186903', 'thomlovesu@gmail.com', 'Unit 3E Camachile, Westmont Village Condominiums, Sucat Paranaque City', 'ParaÃ±aque', 0),
(36717531, 'Thomas Emmanuel', 'Benito', 'null', '09275186903', 'thomlovesu@gmail.com', 'Unit 3E Camachile, Westmont Village Condominiums, Sucat Paranaque City', 'ParaÃ±aque', 0),
(36876061, 'kenneth', 'balderama', 'null', '09616215920', 'kennethbalderama0409@gmail.com', 'Aritao', 'Kalibo', 0),
(36944223, 'Thomas Emmanuel', 'Benito', 'Male', '09275186903', 'thomlovesu@gmail.com', 'Unit 3E Camachile, Westmont Village Condominiums, Sucat Paranaque City', 'ParaÃ±aque', 1720),
(36945798, 'Thomas Emmanuel', 'Benito', 'null', '09275186903', 'thomlovesu@gmail.com', 'Unit 3E Camachile, Westmont Village Condominiums, Sucat Paranaque City', 'ParaÃ±aque', 0),
(36964171, 'Thomas Emmanuel', 'Benito', 'null', '09275186903', 'thomlovesu@gmail.com', 'Unit 3E Camachile, Westmont Village Condominiums, Sucat Paranaque City', 'ParaÃ±aque', 0),
(36971125, 'Joy', 'Solis', 'null', '09621354545', 'joysolis0101@gmail.com', '#80 patricia village', 'Aritao', 0),
(36972439, 'kenneth', 'balderama', 'null', '09616215920', 'kennethbalderama0409@gmail.com', '#80 patricia village', 'Aritao', 0),
(36973847, 'Karen', 'Garcia', 'null', '09616215920', 'kennethbalderama0409@gmail.com', 'Bagumbayan', 'Roxas', 0),
(36975339, 'kenneth', 'balderama', 'null', '09616215920', 'kennethbalderama0409@gmail.com', '#80 patricia village', 'Aritao', 0),
(36977066, 'kenneth', 'balderama', 'null', '09616215920', 'kennethbalderama0409@gmail.com', '#80 patricia village', 'Aritao', 0),
(36978153, 'Kenneth', 'Balderama', 'null', '09616215920', 'kennethbalderama0409@gmail.com', '#80 patricia village', 'San Remigio', 0),
(36978880, 'anne', 'fajut', 'null', '09616215920', 'annefajut21@gmail.com', '', 'Roxas', 0),
(37468115, 'kenneth', 'balderama', 'null', '09616215920', 'kennethbalderama0409@gmail.com', '#80 Patricia village', 'Aritao', 0),
(37478099, 'keneth', 'dela cruz', 'null', '09610011922', 'kenethdc73@gmail.com', 'obando', 'Obando', 0),
(37481442, 'kenneth', 'balderama', 'null', '09616215920', 'kennethbalderama0409@gmail.com', '#80 patricia village', 'Aritao', 0),
(37485680, 'Thomas Emmanuel', 'Benito', 'null', '09275186903', 'thomlovesu@gmail.com', 'Unit 3E Camachile, Westmont Village Condominiums, Sucat Paranaque City', 'ParaÃ±aque', 0),
(47197932, 'hhhds', 'xmdndn', 'null', '09234322233', 'sjsbshs@gmail.com', '', 'San Francisco', 0);

-- --------------------------------------------------------

--
-- Table structure for table `guest_additional`
--

CREATE TABLE `guest_additional` (
  `id` int(32) NOT NULL,
  `reservation_id` int(32) NOT NULL,
  `additional_id` int(32) NOT NULL,
  `additional_type` varchar(255) NOT NULL,
  `additional_amount` float(32,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guest_additional`
--

INSERT INTO `guest_additional` (`id`, `reservation_id`, `additional_id`, `additional_type`, `additional_amount`) VALUES
(1, 6365206, 13, 'Extra bed', 200.00),
(2, 63683110, 13, 'Extra bed', 200.00),
(3, 63683110, 15, 'Additional Guest', 500.00),
(4, 63698894, 15, 'Additional Guest', 500.00),
(5, 63698894, 15, 'Additional Guest', 500.00),
(6, 63698894, 15, 'Additional Guest', 500.00),
(7, 63691371, 13, 'Extra bed', 200.00),
(8, 63744799, 13, 'Extra bed', 200.00),
(11, 637426, 13, 'Extra bed', 200.00),
(12, 63741148, 13, 'Extra bed', 200.00);

-- --------------------------------------------------------

--
-- Table structure for table `guest_discount`
--

CREATE TABLE `guest_discount` (
  `id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guest_discount`
--

INSERT INTO `guest_discount` (`id`, `reservation_id`, `discount_id`) VALUES
(1, 63673403, 1),
(2, 63672555, 2),
(3, 63685428, 1),
(4, 63688779, 1),
(5, 63695505, 1),
(6, 63744809, 1),
(7, 637426, 2);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(32) NOT NULL,
  `billing_id` int(32) NOT NULL,
  `payed_capital` float(32,2) NOT NULL,
  `payment_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `billing_id`, `payed_capital`, `payment_date`) VALUES
(1, 50655208, 1500.00, '2021-10-24 16:57:02.000000'),
(2, 50655208, 1500.00, '2021-10-24 16:58:49.000000'),
(3, 50655208, 0.00, '2021-10-24 16:59:19.000000'),
(4, 51594848, 2000.00, '2021-10-25 19:08:48.000000'),
(5, 51594848, 2000.00, '2021-10-25 19:09:32.000000'),
(6, 51594848, -1000.00, '2021-10-25 11:10:01.000000'),
(7, 51594848, 0.00, '2021-10-25 19:10:26.000000'),
(8, 50931576, 1.00, '2021-10-25 21:35:50.000000'),
(9, 50931576, 5999.00, '2021-10-25 21:36:17.000000'),
(10, 50931576, 0.00, '2021-10-25 21:36:36.000000'),
(11, 52194470, 1500.00, '2021-10-26 11:41:50.000000'),
(12, 52194470, 1500.00, '2021-10-26 11:42:17.000000'),
(13, 52194470, 0.00, '2021-11-01 12:16:28.000000'),
(14, 61935374, 4400.00, '2021-11-06 18:40:08.000000'),
(15, 61935374, 4000.00, '2021-11-06 18:46:21.000000'),
(16, 61926088, 19200.00, '2021-11-06 20:21:02.000000'),
(17, 61959925, 7400.00, '2021-11-06 20:21:17.000000'),
(18, 61959925, 7400.00, '2021-11-06 20:21:50.000000'),
(19, 61926088, 0.00, '2021-11-06 20:22:44.000000'),
(20, 61926088, 0.00, '2021-11-06 20:23:48.000000'),
(21, 62019839, 3700.00, '2021-11-06 20:35:32.000000'),
(22, 62019839, 3700.00, '2021-11-06 20:36:06.000000'),
(23, 62019839, 0.00, '2021-11-06 20:39:14.000000'),
(24, 62034285, 1500.00, '2021-11-06 20:58:36.000000'),
(25, 62034285, 1500.00, '2021-11-06 20:59:16.000000'),
(26, 62034285, 0.00, '2021-11-06 21:01:52.000000'),
(27, 62866112, 5200.00, '2021-11-07 20:09:42.000000'),
(28, 62866112, 5200.00, '2021-11-07 20:10:00.000000'),
(29, 62866112, 0.00, '2021-11-07 20:12:45.000000'),
(30, 61935374, 400.00, '2021-11-07 20:19:39.000000'),
(31, 65354759, 1.00, '2021-11-10 17:15:35.000000'),
(32, 65354759, 4339.00, '2021-11-10 17:16:13.000000'),
(33, 65355123, 1500.00, '2021-11-10 17:22:19.000000'),
(34, 65355123, 1500.00, '2021-11-10 17:22:42.000000'),
(35, 65354759, 60.00, '2021-11-10 17:23:34.000000'),
(36, 65385050, 20.00, '2021-11-10 18:14:35.000000'),
(37, 65408797, 1500.00, '2021-11-10 19:29:58.000000'),
(38, 65408797, 1500.00, '2021-11-10 19:30:44.000000'),
(39, 65435469, 8800.00, '2021-11-10 19:44:08.000000'),
(40, 65435469, 0.00, '2021-11-10 19:44:55.000000'),
(41, 65355123, 0.00, '2021-11-11 12:55:41.000000'),
(42, 65408797, 200.00, '2021-11-13 10:27:13.000000'),
(43, 67708398, 2400.00, '2021-11-13 10:29:42.000000'),
(44, 67708398, 0.00, '2021-11-13 13:19:05.000000'),
(45, 67913910, 1500.00, '2021-11-13 16:23:18.000000'),
(46, 67913910, 0.00, '2021-11-13 16:24:29.000000'),
(47, 67913910, 0.00, '2021-11-13 16:25:06.000000'),
(48, 68731065, 3000.00, '2021-11-14 15:08:10.000000'),
(49, 68731065, 1800.00, '2021-11-14 15:09:04.000000'),
(50, 68731065, 0.00, '2021-11-14 15:11:41.000000'),
(51, 68748145, 1.00, '2021-11-14 15:21:38.000000'),
(52, 68744739, 1500.00, '2021-11-14 15:29:09.000000'),
(53, 68744739, 1500.00, '2021-11-14 15:29:34.000000'),
(54, 68748145, 13199.00, '2021-11-14 15:31:17.000000'),
(55, 68748145, 700.00, '2021-11-14 15:32:19.000000'),
(56, 68882751, 3001.00, '2021-11-14 19:12:57.000000'),
(57, 69458326, 3000.00, '2021-11-15 11:10:40.000000'),
(58, 69458326, 3000.00, '2021-11-15 11:12:24.000000'),
(59, 69458326, 0.00, '2021-11-15 11:12:39.000000'),
(60, 68882751, 1500.00, '2021-11-15 11:14:19.000000'),
(61, 69466686, 3000.00, '2021-11-15 11:22:58.000000'),
(62, 69463283, 1500.00, '2021-11-15 11:24:23.000000'),
(63, 69463283, 1.00, '2021-11-15 11:24:35.000000'),
(64, 69463283, 1499.00, '2021-11-15 11:26:00.000000'),
(65, 68882751, 299.00, '2021-11-15 11:26:34.000000'),
(66, 69567517, 6000.00, '2021-11-15 14:06:03.000000'),
(67, 69567517, 1500.00, '2021-11-15 14:07:18.000000'),
(68, 6956390, 12000.00, '2021-11-15 14:17:00.000000'),
(69, 6956390, 0.00, '2021-11-15 14:17:16.000000'),
(70, 69574009, 12000.00, '2021-11-15 14:24:23.000000'),
(71, 69574009, 0.00, '2021-11-15 14:25:26.000000'),
(72, 69695506, 7000.00, '2021-11-15 17:38:49.000000'),
(73, 69695506, 6300.00, '2021-11-15 17:39:16.000000'),
(74, 69717763, 9000.00, '2021-11-15 18:16:32.000000'),
(75, 69717763, 9000.00, '2021-11-15 18:22:49.000000'),
(76, 69466686, 0.00, '2021-11-15 18:22:54.000000'),
(77, 69695506, 100.00, '2021-11-15 18:23:10.000000'),
(78, 69769756, 4001.00, '2021-11-15 19:38:39.000000'),
(79, 69769756, 3.00, '2021-11-15 19:39:01.000000'),
(80, 69769756, 3.00, '2021-11-15 19:39:45.000000'),
(81, 69721995, 4500.00, '2021-11-15 19:53:01.000000'),
(82, 69721995, 4.00, '2021-11-15 19:53:20.000000'),
(83, 69721995, 4496.00, '2021-11-15 19:54:08.000000'),
(84, 69717763, 0.00, '2021-11-15 20:01:07.000000'),
(85, 697496, 4501.00, '2021-11-15 20:04:36.000000'),
(86, 697496, 2699.00, '2021-11-15 20:05:02.000000'),
(87, 697496, 0.00, '2021-11-15 20:05:31.000000'),
(88, 69776183, 1500.00, '2021-11-15 20:06:04.000000'),
(89, 69776183, 1.00, '2021-11-15 20:06:20.000000'),
(90, 69776183, 1499.00, '2021-11-15 20:07:10.000000'),
(91, 73921678, 750.00, '2021-11-20 15:09:22.000000'),
(92, 73921678, 750.00, '2021-11-20 15:10:42.000000'),
(93, 73921678, 0.00, '2021-11-20 15:11:02.000000'),
(94, 74106930, 3001.00, '2021-11-20 20:26:42.000000'),
(95, 74106930, 2999.00, '2021-11-20 20:38:37.000000'),
(96, 74119010, 6000.00, '2021-11-20 20:42:02.000000'),
(97, 74119010, 200.00, '2021-11-20 20:44:28.000000'),
(98, 74131372, 7040.00, '2021-11-20 20:58:48.000000'),
(99, 74131372, -1400.00, '2021-11-20 13:00:06.000000'),
(100, 74131372, 0.00, '2021-11-20 21:31:42.000000'),
(101, 74688849, 1500.00, '2021-11-21 12:28:10.000000'),
(102, 74688849, 0.00, '2021-11-21 12:29:00.000000'),
(103, 74688849, 200.00, '2021-11-21 13:01:27.000000'),
(104, 74788995, 1500.00, '2021-11-21 15:17:22.000000'),
(105, 74788995, 1499.00, '2021-11-21 15:19:06.000000'),
(106, 74788995, 201.00, '2021-11-21 15:27:54.000000'),
(107, 74803388, 13200.00, '2021-11-21 15:45:21.000000'),
(108, 74809897, 2400.00, '2021-11-21 15:45:41.000000');

-- --------------------------------------------------------

--
-- Table structure for table `receipt_photo`
--

CREATE TABLE `receipt_photo` (
  `receipt_photo_id` int(32) NOT NULL,
  `reservation_id` int(32) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `upload_date` datetime(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receipt_photo`
--

INSERT INTO `receipt_photo` (`receipt_photo_id`, `reservation_id`, `photo`, `upload_date`) VALUES
(1, 62108608, '1078-CPP 111.jpg', '2021-05-15 09:25:04.00000'),
(2, 62103913, '2155-feathers.png', '2021-05-15 09:26:47.00000'),
(3, 62103913, '7488-fallen44.jpg', '2021-05-15 09:27:30.00000'),
(4, 63618452, '1975-belen.jpg', '2021-11-06 18:34:15.00000'),
(5, 63618452, '5549-christmas.jfif', '2021-11-06 18:36:12.00000'),
(6, 63612538, '7539-PikPng.com_drop-png_759626.png', '2021-11-06 18:51:02.00000'),
(7, 63627892, '9328-dog-puppy-on-garden-royalty-free-image-1586966191.jpg', '2021-11-06 20:30:28.00000'),
(8, 63625181, '5568-dog-puppy-on-garden-royalty-free-image-1586966191.jpg', '2021-11-07 20:08:35.00000'),
(10, 63672555, '2244-wp3638902.jpg', '2021-11-13 16:22:40.00000'),
(11, 63683110, '6258-wp3638902.jpg', '2021-11-14 15:21:04.00000'),
(12, 63741148, '2575-Presentor Zoom Background.png', '2021-11-21 15:15:54.00000');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(32) NOT NULL,
  `guest_id` int(32) NOT NULL,
  `billing_id` int(32) NOT NULL,
  `reservation_date` datetime NOT NULL,
  `booking_reference` varchar(255) NOT NULL,
  `num_guest` int(32) NOT NULL,
  `checkin_date` date NOT NULL,
  `checkout_date` date NOT NULL,
  `expiration_date` datetime NOT NULL,
  `reservation_type` int(32) NOT NULL,
  `status` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `guest_id`, `billing_id`, `reservation_date`, `booking_reference`, `num_guest`, `checkin_date`, `checkout_date`, `expiration_date`, `reservation_type`, `status`) VALUES
(637426, 37468115, 74688849, '2021-11-21 12:27:17', 'CCD06F', 1, '2021-11-22', '2021-11-23', '2021-11-21 23:59:59', 0, 7),
(6352306, 35218426, 52194470, '2021-10-26 11:40:47', '4F2A69', 2, '2021-10-27', '2021-10-28', '2021-10-26 23:59:59', 0, 7),
(6365206, 36542306, 65408797, '2021-11-10 18:36:36', '434CDB', 1, '2021-11-11', '2021-11-12', '2021-11-10 23:59:59', 0, 7),
(63506118, 35092472, 50931576, '2021-10-25 00:32:19', '43914C', 2, '2021-10-27', '2021-10-28', '2021-10-26 00:32:19', 0, 7),
(63605772, 36098871, 60946692, '2021-11-05 14:44:21', '00F8BE', 2, '2021-11-15', '2021-11-16', '2021-11-06 14:44:21', 0, 3),
(63616463, 36198459, 61926088, '2021-11-06 17:58:20', '091B59', 10, '2021-11-08', '2021-11-09', '2021-11-07 17:58:20', 0, 7),
(63618452, 36197022, 61935374, '2021-11-06 18:13:06', '80CB45', 6, '2021-11-15', '2021-11-26', '2021-11-07 18:13:06', 0, 7),
(63636373, 36343994, 63461197, '2021-11-08 12:40:42', '09412E', 2, '2021-11-11', '2021-11-13', '2021-11-09 12:40:42', 0, 3),
(63652149, 36531253, 65355123, '2021-11-10 17:19:41', 'E13A48', 2, '2021-11-13', '2021-11-15', '2021-11-10 23:59:59', 0, 7),
(63673825, 36717531, 67178939, '2021-11-12 19:43:33', 'C05250', 2, '2021-11-13', '2021-11-14', '2021-11-12 23:59:59', 0, 3),
(63683981, 36876061, 68759522, '2021-11-14 15:39:59', 'AEA09C', 3, '2021-11-15', '2021-11-17', '2021-11-15 15:39:59', 0, 8),
(63688779, 3688232, 68882751, '2021-11-14 19:09:11', '8B388A', 3, '2021-11-15', '2021-11-16', '2021-11-14 23:59:59', 0, 7),
(63691371, 36964171, 69695506, '2021-11-15 17:37:14', '5062AE', 1, '2021-11-16', '2021-11-17', '2021-11-15 23:59:59', 0, 7),
(63691435, 36978880, 69776183, '2021-11-15 20:03:39', 'A5C0DC', 2, '2021-11-16', '2021-11-17', '2021-11-15 23:59:59', 0, 7),
(63691468, 36944223, 69466686, '2021-11-15 11:22:10', '8337B7', 2, '2021-11-16', '2021-11-17', '2021-11-15 23:59:59', 1, 7),
(63693014, 36978153, 69742766, '2021-11-15 19:02:36', '7A605B', 2, '2021-11-16', '2021-11-17', '2021-11-15 23:59:59', 0, 3),
(63693143, 36973847, 69756643, '2021-11-15 19:28:40', '113843', 3, '2021-11-21', '2021-11-24', '2021-11-15 23:59:59', 0, 8),
(63693377, 36945798, 69458326, '2021-11-15 11:08:45', '797BC3', 3, '2021-11-16', '2021-11-17', '2021-11-15 23:59:59', 0, 7),
(63694933, 36975339, 69717763, '2021-11-15 18:15:52', '1416DB', 3, '2021-11-16', '2021-11-19', '2021-11-15 23:59:59', 0, 7),
(63695444, 36977066, 69767572, '2021-11-15 19:41:53', '0B641F', 2, '2021-11-21', '2021-11-24', '2021-11-15 23:59:59', 0, 8),
(63695505, 36971125, 697496, '2021-11-15 19:01:47', '93AC73', 2, '2021-11-17', '2021-11-20', '2021-11-16 19:01:47', 0, 7),
(63699963, 36972439, 69721995, '2021-11-15 18:26:46', '11BA30', 2, '2021-11-16', '2021-11-19', '2021-11-15 23:59:59', 0, 7),
(63741148, 37478099, 74788995, '2021-11-21 15:12:51', '047621', 2, '2021-11-22', '2021-11-23', '2021-11-21 23:59:59', 0, 7),
(63741482, 37481442, 74803388, '2021-11-21 15:36:03', '3F0FC5', 2, '2021-11-24', '2021-11-30', '2021-11-21 23:59:59', 0, 5),
(63744363, 37485680, 74809897, '2021-11-21 15:36:23', '6B9101', 1, '2021-11-22', '2021-11-23', '2021-11-21 23:59:59', 0, 5),
(63744799, 3741271, 74119010, '2021-11-20 20:35:05', '0A69EA', 2, '2021-11-21', '2021-11-23', '2021-11-20 23:59:59', 1, 7),
(64713786, 47197932, 71919946, '2022-03-14 01:15:21', '77DF5E', 1, '2022-03-14', '2022-03-15', '2022-03-15 01:15:21', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `roomtype_id` int(32) NOT NULL,
  `room_num` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `roomtype_id`, `room_num`, `status`) VALUES
(1, 1, 'Deluxe Garden A1', 0),
(2, 1, 'Deluxe Garden A2', 0),
(3, 1, 'Deluxe Garden A3', 0),
(4, 2, 'Family Room A1', 0),
(5, 2, 'Family Room A2', 0),
(6, 2, 'Family Room A3', 0),
(7, 2, 'Family Room A4', 0),
(8, 3, 'Superior Suite  A1', 0),
(9, 3, 'Superior Suite  A2', 0),
(10, 3, 'Superior Suite  A3', 0),
(11, 4, 'Superior Garden  A1', 0),
(12, 4, 'Superior Garden  A2', 0),
(13, 4, 'Superior Garden  A3', 0),
(15, 1, 'Deluxe Garden A4', 0),
(16, 1, 'Deluxe Garden A5', 0);

-- --------------------------------------------------------

--
-- Table structure for table `room_reservation`
--

CREATE TABLE `room_reservation` (
  `room_reservation_id` int(32) NOT NULL,
  `reservation_id` int(32) NOT NULL,
  `room_id` int(32) NOT NULL,
  `roomtype_name` varchar(255) NOT NULL,
  `room_price` float(32,2) NOT NULL,
  `room_num` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_reservation`
--

INSERT INTO `room_reservation` (`room_reservation_id`, `reservation_id`, `room_id`, `roomtype_name`, `room_price`, `room_num`) VALUES
(1, 63508387, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(2, 63506118, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(3, 63506118, 2, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A2'),
(4, 63512478, 3, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A3'),
(5, 6352306, 2, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A2'),
(6, 63605330, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(7, 63608825, 11, 'Superior Garden Room', 4000.00, 'Superior Garden  A1'),
(8, 63605772, 11, 'Superior Garden Room', 4000.00, 'Superior Garden  A1'),
(9, 63605772, 8, 'Superior Suite', 3000.00, 'Superior Suite  A1'),
(10, 63616463, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(11, 63616463, 2, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A2'),
(12, 63616463, 4, 'Family Room', 4400.00, 'Family Room A1'),
(13, 63616463, 5, 'Family Room', 4400.00, 'Family Room A2'),
(14, 63616463, 6, 'Family Room', 4400.00, 'Family Room A3'),
(15, 63612538, 11, 'Superior Garden Room', 4000.00, 'Superior Garden  A1'),
(16, 63618452, 4, 'Family Room', 4400.00, 'Family Room A1'),
(17, 63618452, 5, 'Family Room', 4400.00, 'Family Room A2'),
(18, 63611866, 5, 'Family Room', 3000.00, 'Family Room A2'),
(19, 63611866, 4, 'Family Room', 4400.00, 'Family Room A1'),
(20, 63627892, 3, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A3'),
(21, 63627892, 4, 'Family Room', 4400.00, 'Family Room A1'),
(22, 63621470, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(23, 63625181, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(24, 63625181, 2, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A2'),
(25, 63625181, 4, 'Family Room', 4400.00, 'Family Room A1'),
(26, 63636373, 4, 'Family Room', 4400.00, 'Family Room A1'),
(27, 63636373, 5, 'Family Room', 4400.00, 'Family Room A2'),
(28, 63636373, 6, 'Family Room', 4400.00, 'Family Room A3'),
(29, 63636373, 7, 'Family Room', 4400.00, 'Family Room A4'),
(30, 6365132, 4, 'Family Room', 4400.00, 'Family Room A1'),
(31, 63652149, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(32, 63653586, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(33, 6365206, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(34, 63655978, 4, 'Family Room', 4400.00, 'Family Room A1'),
(35, 63653592, 2, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A2'),
(36, 63653592, 3, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A3'),
(37, 63653592, 4, 'Family Room', 4400.00, 'Family Room A1'),
(38, 63654520, 5, 'Family Room', 4400.00, 'Family Room A2'),
(39, 63654520, 8, 'Superior Suite', 3000.00, 'Superior Suite  A1'),
(40, 63673825, 11, 'Superior Garden Room', 4000.00, 'Superior Garden  A1'),
(41, 63677949, 4, 'Family Room', 4400.00, 'Family Room A1'),
(42, 63675826, 4, 'Family Room', 4400.00, 'Family Room A1'),
(43, 63674857, 4, 'Family Room', 4400.00, 'Family Room A1'),
(44, 63673403, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(45, 63672555, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(46, 63675669, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(47, 63672067, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(48, 63685428, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(49, 63685428, 2, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A2'),
(50, 63682995, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(51, 63682995, 2, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A2'),
(52, 63682995, 4, 'Family Room', 4400.00, 'Family Room A1'),
(53, 63683110, 4, 'Family Room', 4400.00, 'Family Room A1'),
(54, 6368808, 1, 'Deluxe Garden Rooms', 3000.00, 'Deluxe Garden A1'),
(55, 63683981, 4, 'Family Room', 4400.00, 'Family Room A1'),
(56, 63689763, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(57, 63689763, 2, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A2'),
(58, 63689763, 3, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A3'),
(59, 63688779, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(60, 63688779, 2, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A2'),
(61, 63689687, 3, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A3'),
(62, 63693377, 3, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A3'),
(63, 63693377, 15, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A4'),
(64, 63691468, 3, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A3'),
(65, 63698103, 15, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A4'),
(66, 63698894, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(67, 63698441, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(68, 63698441, 2, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A2'),
(69, 6369603, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(70, 6369603, 2, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A2'),
(71, 63691371, 4, 'Family Room', 4400.00, 'Family Room A1'),
(72, 63691371, 5, 'Family Room', 4400.00, 'Family Room A2'),
(73, 63691371, 6, 'Family Room', 4400.00, 'Family Room A3'),
(74, 63694933, 10, 'Superior Suite', 3000.00, 'Superior Suite  A3'),
(75, 63694933, 2, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A2'),
(76, 63699963, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(77, 63695505, 3, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A3'),
(78, 63693014, 15, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A4'),
(79, 63693143, 8, 'Superior Suite', 3000.00, 'Superior Suite  A1'),
(80, 63694955, 11, 'Superior Garden Room', 4000.00, 'Superior Garden  A1'),
(81, 63695444, 11, 'Superior Garden Room', 4000.00, 'Superior Garden  A1'),
(82, 63691435, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(83, 63734052, 17, 'Supreme', 1500.00, '1'),
(84, 63747810, 4, 'Family Room', 3000.00, 'Family Room A1'),
(85, 63747810, 6, 'Family Room', 3000.00, 'Family Room A3'),
(86, 63744799, 3, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A3'),
(87, 63744809, 5, 'Family Room', 3000.00, 'Family Room A2'),
(88, 637426, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(89, 63741148, 4, 'Family Room', 3000.00, 'Family Room A1'),
(90, 63741482, 4, 'Family Room', 4400.00, 'Family Room A1'),
(91, 63744363, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(92, 64713786, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1');

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE `room_type` (
  `roomtype_id` int(32) NOT NULL,
  `roomtype_name` varchar(255) NOT NULL,
  `roomtype_capacity` int(32) NOT NULL,
  `roomtype_price` int(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `roomtype_photo` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_type`
--

INSERT INTO `room_type` (`roomtype_id`, `roomtype_name`, `roomtype_capacity`, `roomtype_price`, `description`, `roomtype_photo`, `status`) VALUES
(1, 'Deluxe Garden Room', 2, 3000, 'Room size: 35 mÂ²/377 ftÂ² / Shower / Pool View / 1 double bed / Comfort room', 'Deluxe Garden Room-4895-delux_garden_room.jpg', 1),
(2, 'Family Room', 4, 4400, 'Room size: 60 mÂ²/646 ftÂ² / Shower / Pool View / 1 bedroom with \n / sofa / 1 bedroom with double bed / Comfort room', 'Family Room-150-family_room.jpg', 1),
(3, 'Superior Suite', 4, 3000, 'Room size: 57 mÂ²/614 ftÂ² /\n / Shower\n / Pool View\n / 2 queen beds\n / Comfort Room', 'Superior Suite-2311-superior_suit.jpg', 1),
(4, 'Superior Garden Room', 5, 4000, 'Room size: 48 mÂ²/517 ftÂ²\n / Shower\n / Pool View\n / 2 queen beds\n / Comfort Room', 'Superior Garden Room-1079-superior_garden_room.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_accounts`
--

CREATE TABLE `user_accounts` (
  `user_id` int(32) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_accounts`
--

INSERT INTO `user_accounts` (`user_id`, `first_name`, `last_name`, `username`, `password`, `status`) VALUES
(20205126, 'Admin', 'Account', 'admin', '123', 1),
(202096718, 'test', 'account', 'test', '123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vat_settings`
--

CREATE TABLE `vat_settings` (
  `id` int(32) NOT NULL,
  `value` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vat_settings`
--

INSERT INTO `vat_settings` (`id`, `value`) VALUES
(1, 1.12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_type`
--
ALTER TABLE `additional_type`
  ADD PRIMARY KEY (`additional_id`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_type`
--
ALTER TABLE `discount_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`guest_id`);

--
-- Indexes for table `guest_additional`
--
ALTER TABLE `guest_additional`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guest_discount`
--
ALTER TABLE `guest_discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `receipt_photo`
--
ALTER TABLE `receipt_photo`
  ADD PRIMARY KEY (`receipt_photo_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `room_reservation`
--
ALTER TABLE `room_reservation`
  ADD PRIMARY KEY (`room_reservation_id`);

--
-- Indexes for table `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`roomtype_id`);

--
-- Indexes for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vat_settings`
--
ALTER TABLE `vat_settings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `additional_type`
--
ALTER TABLE `additional_type`
  MODIFY `additional_id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `discount_type`
--
ALTER TABLE `discount_type`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `guest_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47197933;

--
-- AUTO_INCREMENT for table `guest_additional`
--
ALTER TABLE `guest_additional`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `guest_discount`
--
ALTER TABLE `guest_discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `receipt_photo`
--
ALTER TABLE `receipt_photo`
  MODIFY `receipt_photo_id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64713787;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `room_reservation`
--
ALTER TABLE `room_reservation`
  MODIFY `room_reservation_id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `room_type`
--
ALTER TABLE `room_type`
  MODIFY `roomtype_id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vat_settings`
--
ALTER TABLE `vat_settings`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
