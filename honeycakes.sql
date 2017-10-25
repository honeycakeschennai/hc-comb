-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 25, 2017 at 04:35 AM
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
-- Table structure for table `Items`
--

CREATE TABLE `Items` (
  `item_id` int(11) NOT NULL,
  `item_code` varchar(10) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_category` varchar(50) NOT NULL,
  `item_price` varchar(10) NOT NULL,
  `vendor_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(2, 'LN002', 'Perungudi');

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

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`token_id`, `user_id`, `generated_time`, `token`, `valid_till`) VALUES
(1, 1, '2017-08-30 22:10:10', 'OTc0YTY3NzdkNTg1ODJhZmRiYWRkYWVkNzMyMjhkMjk=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=NGU2NTAzZmExNWQ3MDUwZDJmODYzNDI4M2JiZmY3MWY=', '0000-00-00 00:00:00'),
(2, 1, '2017-08-30 22:13:11', 'YTFhZTMyZTNiMDNiNDk5ZmJhNDg1ODNmZTY2YWUxY2M=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=YzczZjQ2YmVmY2UxYjY2ZGEyNzdkNjBkMTAzNmNiM2M=', '0000-00-00 00:00:00'),
(3, 1, '2017-08-30 22:17:10', 'M2FlMTE2ZjA3NThjYThkYTA2NzY4NTc0YThhZmU1ZmM=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=OWZhYzg0ZGIzMjM3ODViNjZkNjA5NTlkYWQ4OGZiMjY=', '0000-00-00 00:00:00'),
(4, 1, '2017-08-30 22:17:16', 'NGRjMzdmOGEzODYxNDY3YmYzNGQyMzVlMWZkYzU5ZjQ=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=NjcyMGEwYTA4MDEwOWRiZmI0MTAyOTkyMDA3ZWMyNzM=', '0000-00-00 00:00:00'),
(5, 1, '2017-08-30 22:17:17', 'ZTI1YTQ5Y2UzMWYyODNlNzA4NmY2ZDdkZmNhNGRiYTY=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=OGJjZTJkMjI2NDQ5M2UxZGUwODIxMjIyYmNkYmYwZjA=', '0000-00-00 00:00:00'),
(6, 1, '2017-08-30 22:17:18', 'Y2FiYzdjZWI3MjBlOGI0NTg2YjY3Y2M4NTFjZjJhOTM=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=NWVlYTNlMDMzMThhNTYzYjI0M2FiOGYyNjA1MGEyNjY=', '0000-00-00 00:00:00'),
(7, 1, '2017-08-30 22:17:19', 'MTMxNGEyNzJhYWE0OWY2MjNjY2MzY2IxMmQ1MTM1Mzk=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=OWM4NmRiZTAxMmQwNDRmMDAyY2Y4MGZjYzE3MzRiNjM=', '0000-00-00 00:00:00'),
(8, 1, '2017-08-30 22:56:07', 'NzFiM2RiZmQwYTQ2NzJkOTZiMDBlZmNhYzlmMzExNjc=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=YjYwYjZmZTNkMWZkY2I5MzZjNDI2MDJmOTEyMjNhY2Y=', '0000-00-00 00:00:00'),
(9, 1, '2017-08-30 22:56:19', 'MjAyMjQyOWRiMTE5MTFlMTNiMTExYzY3MzQ4YWQ0Mzc=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=NzFjOWFmYmMyZjljY2JjOGVkNjI3NWJiNTc4ZWFmNDA=', '0000-00-00 00:00:00'),
(10, 1, '2017-08-30 22:56:20', 'MzYxY2M1YTA5NTZiOTUzZTZmNjNhMzRhYzU4ZDg5NDY=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=NTU1Y2E2YTMwMzA2ZjNhODY3ZWZlNGIwZDUzMmVkNDM=', '0000-00-00 00:00:00'),
(11, 1, '2017-08-30 22:56:21', 'YTk3ZDdlMTBhMzk2NTUwYmJiNTc2NGQxMDMzMzA0N2Q=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=ZGE1ZmI1ZDU4ZDY1YTgzYjUzMWFjMzczNjU5ZjRkNGY=', '0000-00-00 00:00:00'),
(12, 1, '2017-08-31 15:42:20', 'NzhlZGMyZDRkZGU1YWQwNzk0M2U5NDU1ZjhjZGY4YjY=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=NzI3ZjcxOWFhMTYyYjg4OTYxNzliMDE4Nzc1YTk0MGI=', '2017-09-02 17:42:20'),
(13, 1, '2017-08-31 15:48:40', 'ZDNhOGFiY2NmYzY1OTUzODM4NTYxNjVkY2QzY2NkYTU=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=OTM1NjAyM2NjYmJiNjUyYmE3YzI1MzljNTEwZDg5YTA=', '2017-09-02 21:18:40'),
(14, 1, '2017-08-31 15:57:30', 'NjcxZTRhYzcxNTlmOTE4NjVjNDQ5Zjk3YjUzZjRlOTU=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=NzEzYmQ0YzVkNmU2YTk3MzQ5MTEzNGYyNzdhNTg5YTU=', '2017-09-02 21:27:30'),
(15, 1, '2017-08-31 19:37:17', 'MTFkY2Y1NGU0MWQ5ODQ1NjE1NzdkM2ExNjQxYmIyOWM=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=MjUyNmRlMzNkZTBjZjMxOTdiYWJhMWZhNTcyZjViYzc=', '2017-08-31 21:27:59'),
(16, 1, '2017-08-31 18:27:42', 'NmYyYmVlMzgxMjQ3NmY3NDUyMDk1YTA1OTA5N2Y5YzU=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=ZTdiNDFiOGY0MDZiMjkxOTJjMjc4NDE3NjEyNTg2ZGQ=', '2017-08-31 22:35:41'),
(17, 1, '2017-08-31 18:38:22', 'NzJhMjQzNWVkZDVlYWYwMWEwMzdiM2M5ZmU2YWVlN2Q=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=ZGRmZDYyZWEyNTNkOGQwNzhlNjlhYzViZWQxMmQ1YzU=', '2017-09-03 00:08:22'),
(18, 1, '2017-08-31 18:39:30', 'OTA2YWQyZDkxZGMwNmE4YmRmNmJlMjFkNjY3OTgzNGI=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=NWU1NThmN2RlZjdkOWEyZGIwMWUyOTQ3ZmY1ZjEyMjU=', '2017-09-03 00:09:30'),
(19, 1, '2017-08-31 18:40:10', 'NzAwMGUyNjAyYzI0OTZiMGNkMTViYTE4MTA5Y2QyOGI=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=MDY0NTI1YjBlNjMwMTY4NWJiZGFiMWY2NjE0NWYxNmI=', '2017-09-03 00:10:10'),
(20, 1, '2017-08-31 18:41:00', 'ZjI0ZWFiODg1MzI1ZTVkZDViNjE3MThhYTU2YzUxMDU=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=MTdmYjUyNjIxZWVkNTI1N2Y4Mjk5YjE0NzI0NDZkZTY=', '2017-09-03 00:11:00'),
(21, 1, '2017-08-31 18:53:58', 'ZjAxMGQ2YTc2OTJjZDg2Y2FjM2YyNDM5NzQ0ZjY1NGE=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=MTQyMGM4ZWRhM2Y3ZDg3OTEwMDcwZWVmYzBlMDQyNzA=', '2017-09-01 00:22:44'),
(22, 1, '2017-08-31 18:59:30', 'Y2E1OTczOTE0MmFhYzYxZTU3ZjEzZDFiYjU4MjkwZDU=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=MzMwOWQ3Y2U1YTk4YTg4M2RjZTY5ZDQ2NjNiY2Y1ODg=', '2017-09-03 00:29:30'),
(23, 1, '2017-09-02 03:15:55', 'NTA4NWNjMDI4MDEzOWMyNTE1NzQ2OGFkYmYyZTMxNzE=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=NWQ1MjNhOWZkZjI3NDRmOGIwNDI4NTVjODc0ODk1ZjE=', '2017-09-04 08:45:55'),
(24, 1, '2017-10-22 17:34:18', 'NWYxMzA2ZmYzYzNkODExYmY3MjgwOTQyN2QwYTZjNjI=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=ZmU0MzQzOTliMzhhNTY5Y2M0MDBlZGE2YWM1YjVmNzA=', '2017-10-24 23:04:18'),
(25, 1, '2017-10-24 17:41:29', 'ZjJmZGFhODg2MDE4ODUwZDI2YjI4M2RkMzAwZjA4MDQ=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=NWIxMjkwMjY1NzRlYzlmZTZkNjg3YzEwYzE1YzY2N2U=', '2017-10-26 23:11:29');

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

-- --------------------------------------------------------

--
-- Table structure for table `vendor_items`
--

CREATE TABLE `vendor_items` (
  `vendor_item_id` int(11) NOT NULL,
  `vendor_code` varchar(10) NOT NULL,
  `item_code` varchar(10) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Items`
--
ALTER TABLE `Items`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `item_code` (`item_code`),
  ADD KEY `item_vendor` (`vendor_code`);

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
-- AUTO_INCREMENT for table `Items`
--
ALTER TABLE `Items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `token_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
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
  MODIFY `vendor_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vendor_items`
--
ALTER TABLE `vendor_items`
  MODIFY `vendor_item_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Items`
--
ALTER TABLE `Items`
  ADD CONSTRAINT `item_vendor` FOREIGN KEY (`vendor_code`) REFERENCES `vendors` (`vendor_code`);

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
