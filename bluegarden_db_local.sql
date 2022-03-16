-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2022 at 02:47 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
(14, 'Gym', 'Gym', 200.00, 0),
(15, 'Additional Guest', 'Additional Guest', 500.00, 1),
(16, 'discount', 'discount', -500.00, 1),
(17, '50% Discount', '50% Discount', -2000.00, 0);

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
(1, 50553028, 7400.00),
(2, 50553028, 6000.00),
(3, 50552079, 7400.00),
(4, 50555190, 3000.00),
(5, 50554953, 7400.00),
(6, 63308779, 6000.00),
(7, 63335491, 3000.00),
(8, 67672376, 3000.00),
(9, 67687422, 9000.00),
(10, 68687628, 13200.00),
(15, 68694007, 14800.00),
(16, 68802740, 6000.00),
(17, 68808943, 3000.00);

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
(1, 'Senior/PWD', '.20', 0),
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
(3676281, 'Hacienda', 'Resort', 'null', '0947245073', '6933rauf@gmail.com', 'Manila, Philippines', 'Pangantucan', 0),
(35054100, 'Rauf', 'Dimaampao', 'null', '0947245073', '6933rauf@gmail.com', '41241', 'Pandi', 0),
(35057200, 'Rauf', 'Dimaampao', 'null', '0947245073', '6933rauf@gmail.com', '41241', 'Lal-lo', 0),
(35057361, 'Rauf', 'Dimaampao', 'null', '0947245073', '6933rauf@gmail.com', '41241', 'Pangantucan', 0),
(35057374, 'Rauf', 'Dimaampao', 'null', '0947245073', '6933rauf@gmail.com', '41241', 'Lal-lo', 0),
(36337984, 'Rauf', 'Dimaampao', 'null', '0947245073', '6933rauf@gmail.com', '41241', 'Maramag', 0),
(36339738, 'HH', 'JJ', 'null', '0947245073', '6933rauf@gmail.com', '41241', 'Malitbog', 0),
(36766923, 'Rauf', 'Dimaampao', 'null', '0947245073', '6933rauf@gmail.com', '41241', 'Mabini', 0),
(36863423, 'Rauf', 'Dimaampao', 'null', '0947245073', '6933rauf@gmail.com', '41241', 'Pamplona', 0),
(36863621, 'HH', 'JJ', 'null', '0947245073', '6933rauf@gmail.com', '41241', 'Obando', 0),
(36883298, 'HH', 'JJ', 'null', '0947245073', '6933rauf@gmail.com', '41241', 'Guindulman', 0),
(36886608, 'Hacienda', 'Resort', 'null', '0947245073', '6933rauf@gmail.com', 'Manila, Philippines', 'Pamplona', 0);

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

-- --------------------------------------------------------

--
-- Table structure for table `guest_discount`
--

CREATE TABLE `guest_discount` (
  `id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 50553028, 7400.00, '2021-10-24 14:05:12.000000'),
(2, 50553028, 7400.00, '2021-10-24 14:05:21.000000'),
(3, 50553028, -1400.00, '2021-10-24 08:05:39.000000'),
(4, 50553028, 0.00, '2021-10-24 14:07:44.000000'),
(5, 50552079, 4400.00, '2021-10-24 14:08:23.000000'),
(6, 50552079, 4400.00, '2021-10-24 14:08:28.000000'),
(7, 50552079, -1400.00, '2021-10-24 08:08:55.000000'),
(8, 50552079, 0.00, '2021-10-24 14:09:05.000000'),
(9, 50555190, 1500.00, '2021-10-24 14:09:57.000000'),
(10, 50555190, 1500.00, '2021-10-24 14:10:19.000000'),
(11, 50555190, 0.00, '2021-10-24 14:10:51.000000'),
(12, 50554953, 8800.00, '2021-10-24 14:11:38.000000'),
(13, 50554953, 0.00, '2021-10-24 14:11:43.000000'),
(14, 50554953, -1400.00, '2021-10-24 08:11:54.000000'),
(15, 50554953, 0.00, '2021-10-24 14:12:24.000000'),
(16, 63308779, 1.00, '2021-11-08 09:07:35.000000'),
(17, 68687628, 6600.00, '2021-11-14 16:55:34.000000'),
(18, 68694007, 7399.00, '2021-11-14 16:58:31.000000'),
(19, 68802740, 6000.00, '2021-11-14 17:01:49.000000'),
(20, 68808943, 1500.00, '2021-11-14 17:02:20.000000'),
(21, 68694007, 7401.00, '2021-11-14 17:05:19.000000');

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
(3, 62103913, '7488-fallen44.jpg', '2021-05-15 09:27:30.00000');

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
(6363978, 36337984, 63308779, '2021-11-08 08:17:39', 'AA1623', 2, '2021-11-21', '2021-11-23', '2021-11-09 08:17:39', 0, 5),
(6367364, 3676281, 67687422, '2021-11-13 09:55:48', 'AB9447', 2, '2021-11-24', '2021-11-25', '2021-11-14 09:55:48', 0, 3),
(6368959, 36883298, 68802740, '2021-11-14 16:59:09', '1FCF6B', 2, '2021-11-15', '2021-11-16', '2021-11-14 23:59:59', 0, 5),
(63501801, 35057374, 50554953, '2021-10-24 14:11:09', '0C0CE3', 3, '2021-10-25', '2021-10-26', '2021-10-24 23:59:59', 0, 7),
(63502262, 35054100, 50552079, '2021-10-24 14:08:10', '84EC8B', 2, '2021-10-25', '2021-10-26', '2021-10-24 23:59:59', 0, 7),
(63502291, 35057200, 50555190, '2021-10-24 14:09:42', '1E2D8E', 1, '2021-10-25', '2021-10-26', '2021-10-24 23:59:59', 0, 7),
(63505599, 35057361, 50553028, '2021-10-24 14:04:43', '963548', 4, '2021-10-25', '2021-10-26', '2021-10-24 23:59:59', 0, 7),
(63639939, 36339738, 63335491, '2021-11-08 09:08:31', '272ADF', 1, '2021-11-15', '2021-11-16', '2021-11-09 09:08:31', 0, 3),
(63679970, 36766923, 67672376, '2021-11-13 09:45:48', 'D81F77', 1, '2021-11-14', '2021-11-15', '2021-11-13 23:59:59', 0, 3),
(63685114, 36886608, 68808943, '2021-11-14 17:02:07', 'E7F453', 2, '2021-11-17', '2021-11-18', '2021-11-15 17:02:07', 0, 5),
(63685373, 36863621, 68694007, '2021-11-14 13:59:39', 'DA8AD2', 8, '2021-11-17', '2021-11-18', '2021-11-14 23:59:59', 0, 6),
(63689641, 36863423, 68687628, '2021-11-14 13:42:16', 'F04A78', 2, '2021-11-15', '2021-11-18', '2021-11-14 23:59:59', 0, 5);

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
(13, 4, 'Superior Garden  A3', 0);

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
(1, 63505599, 1, 'Deluxe Garden Room', 4400.00, 'Deluxe Garden A1'),
(2, 63505599, 5, 'Family Room', 4400.00, 'Family Room A2'),
(3, 63505599, 8, 'Superior Suite', 3000.00, 'Superior Suite  A1'),
(4, 63505599, 9, 'Superior Suite', 3000.00, 'Superior Suite  A2'),
(5, 63502262, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(6, 63502262, 5, 'Family Room', 4400.00, 'Family Room A2'),
(7, 63502291, 4, 'Family Room', 3000.00, 'Family Room A1'),
(8, 63501801, 4, 'Family Room', 3000.00, 'Family Room A1'),
(9, 63501801, 5, 'Family Room', 4400.00, 'Family Room A2'),
(10, 6363978, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(11, 63639939, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(12, 63679970, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(13, 6367364, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(14, 6367364, 2, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A2'),
(15, 6367364, 3, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A3'),
(16, 63689641, 4, 'Family Room', 4400.00, 'Family Room A1'),
(17, 63685373, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(18, 63685373, 2, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A2'),
(19, 63685373, 5, 'Family Room', 4400.00, 'Family Room A2'),
(20, 63685373, 6, 'Family Room', 4400.00, 'Family Room A3'),
(21, 6368959, 1, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A1'),
(22, 6368959, 2, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A2'),
(23, 63685114, 3, 'Deluxe Garden Room', 3000.00, 'Deluxe Garden A3');

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
(2, 'Family Room', 4, 4500, 'Room size: 60 mÂ²/646 ftÂ² / Shower / Pool View / 1 bedroom with \n / sofa / 1 bedroom with double bed / Comfort room', 'Family Room-150-family_room.jpg', 1),
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
  MODIFY `additional_id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `discount_type`
--
ALTER TABLE `discount_type`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `guest_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36886609;

--
-- AUTO_INCREMENT for table `guest_additional`
--
ALTER TABLE `guest_additional`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guest_discount`
--
ALTER TABLE `guest_discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `receipt_photo`
--
ALTER TABLE `receipt_photo`
  MODIFY `receipt_photo_id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63689642;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `room_reservation`
--
ALTER TABLE `room_reservation`
  MODIFY `room_reservation_id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
