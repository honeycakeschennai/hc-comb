-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 04, 2017 at 06:14 PM
-- Server version: 5.6.35
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `honeycakes`
--

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `item_code` varchar(10) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_category` varchar(50) NOT NULL,
  `item_price` varchar(10) NOT NULL,
  `qty_slab` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_code`, `item_name`, `item_category`, `item_price`, `qty_slab`) VALUES
(1, 'IT001', 'Blackforest', '1', '850', 1),
(2, 'IT002', 'Whiteforest', '1', '850', 1),
(3, 'IT003', 'Chocotruffle', '1', '700', 1),
(4, 'IT004', 'Jelly Cake', '1', '900', 1),
(5, 'IT005', 'Strawberry', '1', '750', 1),
(6, 'IT006', 'Butterscotch', '1', '750', 1),
(7, 'IT007', 'Vanilla', '1', '700', 1);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `location_code` varchar(10) NOT NULL,
  `location_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `location_code`, `location_name`) VALUES
(1, 'LN001', 'Thiruvanmiyur'),
(2, 'LN002', 'Perungudi'),
(3, 'LN003', 'Thoraipakkam'),
(4, 'LN004', 'Karapakkam'),
(5, 'LN005', 'Sholinganallur'),
(6, 'LN006', 'Chemmancherry'),
(7, 'LN007', 'Navallur');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_number` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vendor_code` varchar(10) NOT NULL,
  `deliver_to` varchar(200) NOT NULL COMMENT 'complete delivery address will be added up here for all historical references',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total_amount` varchar(10) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_feedback`
--

CREATE TABLE `order_feedback` (
  `order_feedback_id` int(11) NOT NULL,
  `order_number` int(11) NOT NULL,
  `rating` int(1) NOT NULL,
  `remarks` varchar(500) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_number` int(11) NOT NULL,
  `item_code` varchar(10) NOT NULL,
  `qty` varchar(10) NOT NULL,
  `price` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `token_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `generated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `token` varchar(200) NOT NULL,
  `valid_till` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `date_of_birth` date NOT NULL,
  `email_status` varchar(50) NOT NULL DEFAULT 'NOT_VERIFIED',
  `mobile_status` varchar(50) NOT NULL DEFAULT 'NOT_VERIFIED',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `mobile`, `date_of_birth`, `email_status`, `mobile_status`, `created_time`) VALUES
(1, 'Ramu', 'Ramasamy', 'rram.ramasamy@gmail.com', '9894130821', '1993-09-02', 'NOT_VERIFIED', 'NOT_VERIFIED', '2017-08-31 15:33:16'),
(2, 'Rakshana', 'Ravichandran', 'rakshanakr@gmail.com', '8190912853', '1995-06-10', 'NOT_VERIFIED', 'NOT_VERIFIED', '2017-08-31 15:33:16'),
(20, 'ramu', 'rama', 'ramu.rulez@gmail.com', '9894130822', '1993-09-02', 'NOT_VERIFIED', 'NOT_VERIFIED', '2017-08-31 18:23:51');

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE `user_address` (
  `user_address_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `home` varchar(200) DEFAULT NULL,
  `office` varchar(200) DEFAULT NULL,
  `other` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_credentials`
--

CREATE TABLE `user_credentials` (
  `user_login_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_credentials`
--

INSERT INTO `user_credentials` (`user_login_id`, `user_id`, `password`) VALUES
(1, 1, 'ODFkYzliZGI1MmQwNGRjMjAwMzZkYmQ4MzEzZWQwNTU='),
(2, 2, 'ODFkYzliZGI1MmQwNGRjMjAwMzZkYmQ4MzEzZWQwNTU=');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `vendor_id` int(11) NOT NULL,
  `vendor_code` varchar(10) NOT NULL,
  `vendor_name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact_mobile` varchar(10) NOT NULL,
  `contact_email` varchar(50) NOT NULL,
  `location_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`vendor_id`, `vendor_code`, `vendor_name`, `address`, `contact_mobile`, `contact_email`, `location_code`) VALUES
(1, 'VN001', 'FB Cakes', 'Karapakkam', '9876543210', '123@gmail.com', 'LN004'),
(2, 'VN002', 'Cake House', 'Thiruvanmiyur', '1234567890', '234@gmail.com', 'LN001'),
(3, 'VN003', 'Yum Cakes', 'Thoraipakkam', '8765432190', '789@gmail.com', 'LN003'),
(4, 'VN004', 'Bakers Code', 'Perungudi', '765421098', '667@gmail.com', 'LN002');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_items`
--

CREATE TABLE `vendor_items` (
  `vendor_item_id` int(11) NOT NULL,
  `vendor_code` varchar(10) NOT NULL,
  `item_code` varchar(10) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vendor_items`
--

INSERT INTO `vendor_items` (`vendor_item_id`, `vendor_code`, `item_code`, `status`) VALUES
(1, 'VN001', 'IT001', 1),
(2, 'VN001', 'IT002', 1),
(3, 'VN001', 'IT003', 0),
(4, 'VN001', 'IT004', 1),
(5, 'VN001', 'IT005', 0),
(6, 'VN001', 'IT006', 1),
(7, 'VN001', 'IT007', 1),
(8, 'VN002', 'IT001', 1),
(9, 'VN002', 'IT002', 1),
(10, 'VN002', 'IT003', 1),
(11, 'VN002', 'IT004', 1),
(12, 'VN002', 'IT005', 1),
(13, 'VN002', 'IT006', 1),
(14, 'VN002', 'IT007', 1),
(15, 'VN003', 'IT001', 1),
(16, 'VN003', 'IT002', 1),
(17, 'VN003', 'IT003', 0),
(18, 'VN003', 'IT004', 1),
(19, 'VN003', 'IT005', 1),
(20, 'VN003', 'IT006', 1),
(21, 'VN003', 'IT007', 1),
(22, 'VN004', 'IT001', 1),
(23, 'VN004', 'IT002', 1),
(24, 'VN004', 'IT003', 1),
(25, 'VN004', 'IT004', 1),
(26, 'VN004', 'IT005', 0),
(27, 'VN004', 'IT006', 1),
(28, 'VN004', 'IT007', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vendor_items_view`
-- (See below for the actual view)
--
CREATE TABLE `vendor_items_view` (
`item_code` varchar(10)
,`item_name` varchar(50)
,`item_category` varchar(50)
,`item_price` varchar(10)
,`qty_slab` int(11)
,`location_code` varchar(10)
,`vendor_code` varchar(10)
,`status` int(1)
);

-- --------------------------------------------------------

--
-- Structure for view `vendor_items_view`
--
DROP TABLE IF EXISTS `vendor_items_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vendor_items_view`  AS  select `item`.`item_code` AS `item_code`,`item`.`item_name` AS `item_name`,`item`.`item_category` AS `item_category`,`item`.`item_price` AS `item_price`,`item`.`qty_slab` AS `qty_slab`,`vendor`.`location_code` AS `location_code`,`vendor`.`vendor_code` AS `vendor_code`,`vendor_item`.`status` AS `status` from ((`items` `item` join `vendors` `vendor`) join `vendor_items` `vendor_item`) where ((`item`.`item_code` = `vendor_item`.`item_code`) and (`vendor`.`vendor_code` = `vendor_item`.`vendor_code`)) order by `item`.`item_code`,`vendor`.`location_code` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `item_code` (`item_code`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`),
  ADD UNIQUE KEY `location_code` (`location_code`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_number`),
  ADD KEY `orders_users` (`user_id`),
  ADD KEY `orders_vendors` (`vendor_code`);

--
-- Indexes for table `order_feedback`
--
ALTER TABLE `order_feedback`
  ADD PRIMARY KEY (`order_feedback_id`),
  ADD KEY `order_num_feedback` (`order_number`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_num_items` (`order_number`),
  ADD KEY `order_item_code` (`item_code`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`token_id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`user_address_id`);

--
-- Indexes for table `user_credentials`
--
ALTER TABLE `user_credentials`
  ADD PRIMARY KEY (`user_login_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`vendor_id`),
  ADD UNIQUE KEY `vendor_code` (`vendor_code`),
  ADD KEY `vendor_location_1` (`location_code`);

--
-- Indexes for table `vendor_items`
--
ALTER TABLE `vendor_items`
  ADD PRIMARY KEY (`vendor_item_id`),
  ADD KEY `vendor_item_status_1` (`vendor_code`),
  ADD KEY `vendor_item_status_2` (`item_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_number` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_feedback`
--
ALTER TABLE `order_feedback`
  MODIFY `order_feedback_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `token_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `user_address_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_credentials`
--
ALTER TABLE `user_credentials`
  MODIFY `user_login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `vendor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vendor_items`
--
ALTER TABLE `vendor_items`
  MODIFY `vendor_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `orders_vendors` FOREIGN KEY (`vendor_code`) REFERENCES `vendors` (`vendor_code`);

--
-- Constraints for table `order_feedback`
--
ALTER TABLE `order_feedback`
  ADD CONSTRAINT `order_num_feedback` FOREIGN KEY (`order_number`) REFERENCES `orders` (`order_number`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_item_code` FOREIGN KEY (`item_code`) REFERENCES `Items` (`item_code`),
  ADD CONSTRAINT `order_num_items` FOREIGN KEY (`order_number`) REFERENCES `orders` (`order_number`);

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `user_credentials`
--
ALTER TABLE `user_credentials`
  ADD CONSTRAINT `user_credentials_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `vendors`
--
ALTER TABLE `vendors`
  ADD CONSTRAINT `vendor_location_1` FOREIGN KEY (`location_code`) REFERENCES `locations` (`location_code`);

--
-- Constraints for table `vendor_items`
--
ALTER TABLE `vendor_items`
  ADD CONSTRAINT `vendor_item_status_1` FOREIGN KEY (`vendor_code`) REFERENCES `vendors` (`vendor_code`),
  ADD CONSTRAINT `vendor_item_status_2` FOREIGN KEY (`item_code`) REFERENCES `Items` (`item_code`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
