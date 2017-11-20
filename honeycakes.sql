-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 20, 2017 at 09:17 PM
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
(7, 'IT007', 'Vanilla', '1', '700', 1),
(8, 'PARTY01', 'Party Hat', '2', '10', 1),
(9, 'PARTY02', 'Snow Spray', '2', '60', 1),
(10, 'PARTY03', 'Poppers', '2', '100', 1),
(11, 'PARTY04', 'Fancy Candle', '2', '5', 1);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `location_code` varchar(10) NOT NULL,
  `location_name` varchar(100) NOT NULL,
  `delivery_vendor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `location_code`, `location_name`, `delivery_vendor`) VALUES
(1, 'LN001', 'Thiruvanmiyur', 'VN004'),
(2, 'LN002', 'Perungudi', 'VN003'),
(3, 'LN003', 'Thoraipakkam', 'VN003'),
(4, 'LN004', 'Karapakkam', 'VN001'),
(5, 'LN005', 'Sholinganallur', 'VN001'),
(6, 'LN006', 'Chemmancherry', 'VN002'),
(7, 'LN007', 'Navallur', 'VN002'),
(8, 'LN008', 'SRP Tools', 'VN004');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL COMMENT 'orderNumber',
  `user_id` int(11) NOT NULL,
  `vendor_code` varchar(10) NOT NULL,
  `deliver_to` varchar(200) NOT NULL COMMENT 'complete delivery address will be added up here for all historical references',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_message` varchar(100) NOT NULL,
  `delivery_time` varchar(7) NOT NULL,
  `delivery_date` date NOT NULL,
  `total_amount` varchar(10) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `vendor_code`, `deliver_to`, `timestamp`, `order_message`, `delivery_time`, `delivery_date`, `total_amount`, `status`) VALUES
(1, 1, 'VN003', 'D411, Vaikund Sundaram, Vendarasi Amman kovil stree, Karapakkam, Chennai - 97.', '2017-11-20 19:08:01', '', '', '0000-00-00', '1875', 0),
(2, 1, 'VN003', 'D411, Vaikund Sundaram, Vendarasi Amman kovil stree, Karapakkam, Chennai - 97.', '2017-11-20 19:08:04', '', '', '0000-00-00', '1875', 0),
(3, 1, 'VN003', 'D411, Vaikund Sundaram, Vendarasi Amman kovil stree, Karapakkam, Chennai - 97.', '2017-11-20 19:08:06', '', '', '0000-00-00', '1875', 0),
(4, 1, 'VN003', 'D411, Vaikund Sundaram, Vendarasi Amman kovil stree, Karapakkam, Chennai - 97.', '2017-11-20 19:12:16', '', '', '0000-00-00', '1875', 0),
(5, 1, 'VN003', 'D411, Vaikund Sundaram, Vendarasi Amman kovil stree, Karapakkam, Chennai - 97.', '2017-11-20 19:18:54', '', '', '0000-00-00', '1875', 0),
(6, 1, 'VN003', 'D411, Vaikund Sundaram, Vendarasi Amman kovil stree, Karapakkam, Chennai - 97.', '2017-11-20 19:19:28', '', '', '0000-00-00', '1875', 0),
(7, 1, 'VN003', 'D411, Vaikund Sundaram, Vendarasi Amman kovil stree, Karapakkam, Chennai - 97.', '2017-11-20 19:20:13', '', '', '0000-00-00', '1875', 0),
(8, 1, 'VN004', 'D411, Vaikund Sundaram, Vendarasi Amman kovil stree, Karapakkam, Chennai - 97.', '2017-11-20 19:20:58', '', '', '0000-00-00', '1580', 0),
(9, 1, 'VN004', 'D411, Vaikund Sundaram, Vendarasi Amman kovil stree, Karapakkam, Chennai - 97.', '2017-11-20 19:31:35', '', '', '0000-00-00', '1580', 0),
(10, 1, 'VN004', 'D411, Vaikund Sundaram, Vendarasi Amman kovil stree, Karapakkam, Chennai - 97.', '2017-11-20 19:33:19', '', '', '0000-00-00', '1010', 0),
(11, 1, 'VN004', 'D411, Vaikund Sundaram, Vendarasi Amman kovil stree, Karapakkam, Chennai - 97.', '2017-11-20 19:38:57', '112334', '', '0000-00-00', '1560', 0);

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
  `order_id` int(11) NOT NULL COMMENT 'orderNumber',
  `item_code` varchar(10) NOT NULL,
  `qty` varchar(10) NOT NULL,
  `price` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `item_code`, `qty`, `price`) VALUES
(1, 7, 'PARTY01', '1', '10'),
(2, 7, 'PARTY02', '1', '60'),
(3, 7, 'PARTY03', '1', '100'),
(4, 7, 'PARTY04', '1', '5'),
(5, 7, 'IT002', '2', '1700'),
(6, 8, 'PARTY02', '3', '180'),
(7, 8, 'IT007', '2', '1400'),
(8, 9, 'PARTY02', '3', '180'),
(9, 9, 'IT007', '2', '1400'),
(10, 10, 'PARTY02', '1', '60'),
(11, 10, 'PARTY03', '1', '100'),
(12, 10, 'IT001', '1', '850'),
(13, 11, 'PARTY02', '1', '60'),
(14, 11, 'PARTY03', '1', '100'),
(15, 11, 'IT003', '2', '1400');

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
(25, 1, '2017-10-24 17:41:29', 'ZjJmZGFhODg2MDE4ODUwZDI2YjI4M2RkMzAwZjA4MDQ=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=NWIxMjkwMjY1NzRlYzlmZTZkNjg3YzEwYzE1YzY2N2U=', '2017-10-26 23:11:29'),
(26, 1, '2017-10-25 02:39:03', 'YTlkYWU1N2EzODRmMjU3Yzk3ZTBlNDFmOWRkOTg3NmE=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=NWRmMDQyYmNjM2IwMTA5NWY1MDcwMjZkOTQ5ZTk2NjY=', '2017-10-27 08:09:03'),
(27, 1, '2017-11-03 07:35:52', 'NmQ0M2YzZTg2YjkyZmI1ZGI5ODc3NzdlN2MwMzExNDk=MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI=NjQ5MGZmN2Q3ZjJjYjljZGE0ODExOWMzMDljNmE3NTI=', '2017-11-05 13:05:52'),
(28, 1, '2017-11-03 07:37:43', 'YzZhODVhNjk0YTZmMGRjNTc2NjYxNmUzNGFmNDY5MDA_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_Y2ExNTFjZTkxMGViZWY5OWE4OTYwOWY3MmM3ZDZiOTk_', '2017-11-05 13:07:43'),
(29, 1, '2017-11-03 13:26:12', 'MThmYWYyYjVmNmRkMTI4NGIxMGU4ZDI0MzgyNGZkNTA_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_YTYzOTNlYjExYTE5M2RmYzFjYmEwM2EwMjI1YmNjMmQ_', '2017-11-05 18:56:12'),
(30, 1, '2017-11-05 15:54:44', 'MDcxY2Y0ZTMxYmYxNWVjZGRmMjliZDZiN2IwN2NhNmU_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_MjYzMjM4YmI3YzY1YzEyN2UxZjc3MWI1M2JkOGYzMWQ_', '2017-11-07 21:24:44'),
(31, 1, '2017-11-07 15:59:45', 'YmQ0ZWNjY2EwYjhhNzc0Mzc5MzQzY2RhMDY1MGU0ZDE_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_NDlmMDVlNWM2ZGI5MWZmNTMzZTliOTU2NGY4MmU2ZTc_', '2017-11-09 21:29:45'),
(32, 1, '2017-11-09 19:16:49', 'MDgwZDQxZGMyYjVjMDdjNTczNTlhOTlhM2E4MjIyMzQ_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_NDEwN2QyOWY0NDMwMGIyZjAzNTI2OTMzZTZkMDNlNmU_', '2017-11-12 00:46:49'),
(33, 1, '2017-11-12 01:45:20', 'ZWI0NjY3ZmYzOTM3OWEzZjJhZGM2MTQzMDA4YjkxNGM_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_YTZlMjdmNmM1Y2VlN2I5Mzk0ZDViMTc2Njk3NWQ5MzI_', '2017-11-14 07:15:20'),
(34, 1, '2017-11-12 11:54:39', 'MzE1NTJlMGNlNTEwYTlmM2IxYzU2YzRmOTUzNGI0YWY_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_MmMyNTU4MTczNTUzYjFmNDYyYzY4NTZmMGVhMThiY2I_', '2017-11-14 17:24:39'),
(35, 1, '2017-11-12 13:47:55', 'Mzc1MTkwMzQwNGRhNjgyZmI0NGJjMjRlNWM3MzBhNWQ_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_MmQ4MmQwZjQwYzg3ZTA5OTRjOWQ0OTQ5MmVhM2MyMGI_', '2017-11-14 19:17:55'),
(36, 1, '2017-11-13 15:09:17', 'ZGRkMDBjYzhkY2RjYTAwZGJiZTJiMGI3NDc2OWQyYzE_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_ZDY0YmUwYTk1OGQ4ODYxMTFjZTQ5YTk2ODk3NWNlNDc_', '2017-11-15 20:39:17'),
(37, 1, '2017-11-13 15:21:41', 'OWU4NzA0MTQ1NzY1NDcxMjNkMzYzZmU4MDQ1YzU0ZmU_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_ZjJhZTFhM2JhMTNlZTFjY2JlMzhkMGEwOTQzMmUzYjM_', '2017-11-15 20:51:41'),
(38, 1, '2017-11-13 15:43:47', 'ZmM1NzY2MzExYjY2ODEwYjU5NzQwMDNmOGZmZTU1ZGI_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_YzEwYTU4ZDdjYzFkOTg3NmZmZWNkMDc4ZTExMTdlMDQ_', '2017-11-15 21:13:47'),
(39, 1, '2017-11-13 16:05:01', 'YWU2OWZkZDBkYWM2OTE1ODUwMWVmM2U2YzA0YjViOGE_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_NmI0NzhkNzFmM2ZjODM5Njk2ZDgwOTc0YzIwNmU4YmI_', '2017-11-15 21:35:01'),
(40, 1, '2017-11-13 16:07:32', 'NTljMGJlODIzMTEyZmJiMzlkMjhhNTg2Y2MzOWJmMjM_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_N2Y3MGIwNTg2MWQ5MWI5NTFhNjk4NGJlOTdiNjA5ZjQ_', '2017-11-15 21:37:32'),
(41, 1, '2017-11-13 16:26:51', 'MzBjZDk1YzdiNWYyMGU4MjI4OTExYTE5MjkwNDRlMjY_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_MjllNWM1OGYxMDIwNWJlYzMzMjgxMGRmYWZlOWVlZjY_', '2017-11-15 21:56:51'),
(42, 1, '2017-11-13 16:44:06', 'ZmVhYjcxN2U3NGIxNTE2OTAwZDY3NTBlMTgyYTRkMWI_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_ZjU0ZTBmMjAxY2JmZTI0ZWVkNzY4Y2I2ZTMzN2Y5NmM_', '2017-11-15 22:14:06'),
(43, 1, '2017-11-13 16:44:51', 'N2U2MzgxYmVkNTMzZTE3NDJlOWIzZmYxMzcyZjM4NmU_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_YmRmYzI3ZjVjMDYzYjY0ZDYxOWQxY2EyMzZiNWUxYTA_', '2017-11-15 22:14:51'),
(44, 1, '2017-11-13 16:58:31', 'Y2UxMDM1M2MyMmQyMzRiYjlmNmM5ZDdmOTZmZTk0ZTI_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_ZjNjYmQwNjhiMDliNWYwNGNlZjJmYmIzODgxOWFjMTc_', '2017-11-15 22:28:31'),
(45, 1, '2017-11-13 17:20:58', 'ZmNiYmJjNGMzMzdhZjI4NjVhOWZjNWQyOGNjODY3NGM_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_ZDYxMTQwMzVmNjhhMzJmMmU2OTg1NWE5N2QyOWQ2NWI_', '2018-11-13 22:50:58'),
(46, 1, '2017-11-13 17:40:10', 'OWQyZTBjNGY2MmM2NzI2MWMxZDI1YTYxZmZkZTNjNGY_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_NjgwYjkxYmIyZDQ2MzE3ZjY2YmM1ZThkMzkyMjY2ZTU_', '2018-11-13 23:10:10'),
(47, 1, '2017-11-13 17:40:26', 'ZDY2MjQxMmM5MjMxZjIyMGE2NDkwMzkxYTE5NTM1Njk_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_NDYyNGM1NjQwNTcyNDY5ZTA5N2Q4MDZhMWNlZTdkZTI_', '2018-11-13 23:10:26'),
(48, 1, '2017-11-13 17:42:28', 'ZGIzNThjMjI5OGFkYjhlZmI0NzViYjZmYTBiYTQ0NzM_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_YTMxMmFiYTdiNDYwMThjYTlkMGUyZTdmNzM2M2EzNjg_', '2018-11-13 23:12:28'),
(49, 1, '2017-11-13 17:57:07', 'NzMwOTBiOTA4MGIzNDk5ZjNhYzUwNDJlNmU1NmJmMGM_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_NjQ2NmY0YzI3NDhjYTk4ZTZiZGZkNmRmZmIwNGI2ZWM_', '2018-11-13 23:27:07'),
(50, 1, '2017-11-14 01:59:18', 'NmVmYjQ3MTMyYWY1N2NlMDk5NDk4YjhiNDFlNTE3YjI_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_NGQ4YmQ0MTUwN2I2ZjY2OTYzN2ZjNDAwY2FmOGI5Njk_', '2018-11-14 07:29:18'),
(51, 1, '2017-11-14 02:20:09', 'YjY0ZjU5ZTYwZWRkNjRjOGNlNTdiZGNmZTc3NzljMjc_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_MzYyZWZjMTk3YTU5OTZkNzkwZTJjNjdlNDA5NGM3Mzg_', '2018-11-14 07:50:09'),
(52, 1, '2017-11-14 02:46:05', 'OWU1ODYxODZkNGJmNDJjZjQ0NWM2ZGYxOTA3ZjdkOTc_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_ZmU3YTkxYTlhNTA4YWUzNDVmMWQwZDQ3MzkzNmZjYzc_', '2018-11-14 08:16:05'),
(53, 1, '2017-11-14 16:54:04', 'MThmMjY1YzRjNWRiNzAwN2ZjNjdhNzEwYTkzNGJlNzU_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_OThmZGNjZjc4NmUzNWU4NmQ1N2ZkNGM0M2NkMThmODE_', '2018-11-14 22:24:04'),
(54, 1, '2017-11-14 18:18:21', 'MzIyMzg4MzVkZjJmYmYzM2E5MWQ2NjYwMjAxZDU1Zjc_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_MDE4MGJiYTBkYzlhMWViZjkxZjgzMDAyNWJlNjczYmM_', '2018-11-14 23:48:21'),
(55, 1, '2017-11-14 18:49:04', 'N2FmMDBlMjNiNTY2YWQ3MzM2Yjc5YWI1YzFiYjAxZjk_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_ZDZkNTM0ZTE5ZjUzOWUxYTBjYjdkNTMyNDIxNGU1Njg_', '2018-11-15 00:19:04'),
(56, 32, '2017-11-15 14:26:41', 'NzNlMTg4YzI1Mzg0YzJmOTE3MWYzZDE1ZWMyNTFhNzI_NmRiMDhkZmJlMDYyMDg3ZDVjNGFlYzRmMDBhOTJiM2M_YWI1MjE1NGJhZjQ5ZGRjYWM0NTNkMjVhYWVmNTQ5MzQ_', '2018-11-15 19:56:41'),
(57, 49, '2017-11-15 18:32:31', 'Yzg1ZjY3MTFiMmY2ODBhOTBmMDk4ODE0OTczN2UxOWQ_ZWM1YmFkNzQzYTY3ODkxZjhhODI5Y2VhZjA0NDEzYjI_NmM1ZjZjODMwZWM4MGI2NDY0ODE2N2IzMWM4OWE2NTM_', '2018-11-16 00:02:31'),
(58, 49, '2017-11-15 18:32:53', 'MWRjYTg0Y2FkOWE3NjUyYWM4N2JmMmFkOTM1N2NlZWM_ZWM1YmFkNzQzYTY3ODkxZjhhODI5Y2VhZjA0NDEzYjI_OGJjNmRiZTQxOTgzZWIzZWNmNWE0ZGZjZjcxZTFiYTU_', '2018-11-16 00:02:53'),
(59, 54, '2017-11-15 18:47:42', 'NGFmMmRkMjM1N2QzZDAyMDI5YTgxNGZiOWY3NzU3NDY_Y2I0MjdkYmY2MjQ3NmM4ZGU3NTllOWZiZTgzYTUwOGU_Yzk5ZTdlMTM4ODc4MDc5YTRjNTI2OWM3ZDYyMDI3OGI_', '2018-11-16 00:17:42'),
(60, 55, '2017-11-15 19:16:17', 'M2MwMmU3ZTljMmIwNjRlZTNlOTZlODNiOTc3N2RkZTQ_MTgyOTNkMTQ0NDAwZmY0ZjE1ZTAxN2YzMTA4OWZhODc_YjZhODg4OWE1ZjQ5YjFhNzUzNTE3YzJjYmVlOWJhYmI_', '2018-11-16 00:46:17'),
(61, 54, '2017-11-18 04:59:03', 'NGZiYzliZDNjNmJjYjAxZmZiNjU0OTQ3ZGQ0MGRiMjE_Y2I0MjdkYmY2MjQ3NmM4ZGU3NTllOWZiZTgzYTUwOGU_MGJkOWVhNTNhNWIyMjVmNGQxZDY4YmMyNjVhMDdiOTc_', '2018-11-18 10:29:03'),
(62, 54, '2017-11-18 05:00:20', 'M2FhYWJhYWE0OWU3M2EwNjM4MGJkNjA5ODg1MjFhNDE_Y2I0MjdkYmY2MjQ3NmM4ZGU3NTllOWZiZTgzYTUwOGU_M2U2MGUxYjYyNTc5NjJlMGY3MjIyYjBhZDAwMTJkOGE_', '2018-11-18 10:30:20'),
(63, 1, '2017-11-18 05:18:19', 'MTA3NTliOTNlODQwN2Q0NmI0ZDcxNjY1N2M3NDZjNWE_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_ZDRmOWU3NWNmYzIzMmM0N2I0OWM2Mzg3NDk5M2Y1Nzg_', '2018-11-18 10:48:19'),
(64, 1, '2017-11-18 05:27:10', 'Mjk4YWU5MTI5NDZkZmY2ZjRkZDMzODQ3MDI2YTViNDg_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_MWQyNmQwZDk4YzBlNTE4NzU5NDVkYWEwMDRjZDMzNGQ_', '2018-11-18 10:57:10'),
(65, 1, '2017-11-18 05:27:12', 'NDkwYmUzY2Q4ODY4NzI4MDY0ZTJkMmVmYjNlMjc1YWU_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_NWE3M2M2NGU4YjQ2YWFmYTczOGFjNGM4YTNmOWRkYzc_', '2018-11-18 10:57:12'),
(66, 1, '2017-11-18 05:27:13', 'NjczMzVkMjg1MjFjZTc0NjA1NjRkNmUwZWQ1MDhjYWM_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_MzQ5OTNjYjZjY2MzMDk2OGNiZDNjMmJlZGY0MThjOTc_', '2018-11-18 10:57:13'),
(67, 1, '2017-11-18 05:27:13', 'OWM0Mjk0MmZhMGRlODg5Yjc1NzIzMmFhN2I0MTI3YjE_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_MzQ5OTNjYjZjY2MzMDk2OGNiZDNjMmJlZGY0MThjOTc_', '2018-11-18 10:57:13'),
(68, 1, '2017-11-18 05:27:13', 'NTFkNDg4ZDRkZWZhMGUxZjk4OWRkMmUyYzQ1YzdlYmE_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_MzQ5OTNjYjZjY2MzMDk2OGNiZDNjMmJlZGY0MThjOTc_', '2018-11-18 10:57:13'),
(69, 1, '2017-11-18 05:27:13', 'MWIzZDZiZjRkYzUzMTRhZmJlODRmZjRiMzYzNWRlNDc_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_MzQ5OTNjYjZjY2MzMDk2OGNiZDNjMmJlZGY0MThjOTc_', '2018-11-18 10:57:13'),
(70, 1, '2017-11-18 05:27:13', 'ZjI5ZTc0ZjBhNDJiZjhlMDYyZjI3NzVmYzhlOGIzZTQ_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_MzQ5OTNjYjZjY2MzMDk2OGNiZDNjMmJlZGY0MThjOTc_', '2018-11-18 10:57:13'),
(71, 1, '2017-11-18 05:29:05', 'Nzc0NDQ2ZDdmZjNhYzYxZDI3ODM0ZGUwYzc0OWIyMDE_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_NWY2MmJkNWI1MjIxYThmYzE0NDc2YmE1YWNhYTVjNDA_', '2018-11-18 10:59:05'),
(72, 1, '2017-11-18 05:29:07', 'YmQzYTgyMzNkMTBjM2VlYmY2NDgyYmJkZDEwN2EzOGM_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_OWU1YzVhZGMzMmIzODcwMmVjMGFiNzcxOGFjNjdjMGE_', '2018-11-18 10:59:07'),
(73, 1, '2017-11-18 05:40:22', 'NmE5NWFmOGI3M2I1ZGE1YmY5YWY1NDI3MDhiYjJlYzc_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_NjQ0Yzc0ODU4N2IyMGE5ODU5M2IwZmFjNTA5YjAyZWM_', '2018-11-18 11:10:22'),
(74, 1, '2017-11-18 05:42:17', 'N2YxZjI5ZTY5MmJhMDEwMzc4YTk4NjFkYWI4NmNhNTI_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_YWJkMjAxYTc0NzUxMzFjMDkyZWU5NjRmOGFkZjZmMWE_', '2018-11-18 11:12:17'),
(75, 1, '2017-11-18 05:44:17', 'ZTEzNzZiODVlNGE4ZTMzMTJhMzUxNjFkZmUxZTZkMmY_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_OTBiMjk1MzMwZjg5ZjUwN2ZhY2ExOTAwZGViMjI1MDQ_', '2018-11-18 11:14:17'),
(76, 1, '2017-11-18 05:44:44', 'NjM3YzVjZjYxNjBiNWZiZTczYjA4NTUxNTQxYzYxOWE_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_ODJlNTFiYjI5MTIzYTRhNzg0MTY5ZWViNTVjYmI2MjI_', '2018-11-18 11:14:44'),
(77, 1, '2017-11-18 05:45:07', 'MTE2OWU1YWNiYzBkN2VkNDYzYjgzYWYxMGNmZDgzMjc_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_MmNlZWMzNDVmNzhjMGViNWQwNThjZDkwODMyODdhZGE_', '2018-11-18 11:15:07'),
(78, 1, '2017-11-18 05:54:50', 'MGMzMDdjYTAzZWQ4MmVkZWRmYjVhM2UzNzk5MGQxODc_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_ZWIzNjhiODdjZDU1NmViYjJjZTdhOWJiYTM0YjUwNDE_', '2018-11-18 11:24:50'),
(79, 1, '2017-11-18 05:59:19', 'YjdhNWMxMWEzYTU5ZWNiZTNlODcwOTEwZjJjZDE2ZDU_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_YmFlODc0YTdmNjQ0ZjkzMTlmNjhiMWJlY2JmZTM1ZGQ_', '2018-11-18 11:29:19'),
(80, 54, '2017-11-18 06:00:55', 'MWUxZjg0NWE0NDNiMjA4YTg5MmQwNGZkNmM0YjU4MTA_Y2I0MjdkYmY2MjQ3NmM4ZGU3NTllOWZiZTgzYTUwOGU_Y2I5OTljMDVlNjc0NzE1ZDIwZjUzNjk1N2Y4MjQwN2I_', '2018-11-18 11:30:55'),
(81, 1, '2017-11-18 06:01:52', 'NmQ4NWJkNDYwNjA0YjJiNTc0YjY3YWU5NTVmMDFlZTk_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_YjYzY2ZkNDFkZGE1NjYxMzNlMzE0ZGE5MmNjODVhODY_', '2018-11-18 11:31:52'),
(82, 57, '2017-11-18 06:04:30', 'YmUwMWE1NjA1MDJhYjcwYjg5NmQxODViN2U5NjYyMTg_ZGE2YzEwNmI4NDY0Y2Q4NTdmYzJlMGYwYTRiMDE3MDY_NmIwY2E2OWEzZDAxNzc4OTZiYmM2OTRjYjllYzg3Yzk_', '2018-11-18 11:34:30'),
(83, 54, '2017-11-18 06:12:20', 'ODIwYjg2YzMwMjBkZWYxZTE2OTg5NWYyMzA2ZTgzMzU_Y2I0MjdkYmY2MjQ3NmM4ZGU3NTllOWZiZTgzYTUwOGU_MTFiZjEzMTNlY2VmMjdiNWNlMjQyODc2MDFiYTQzODE_', '2018-11-18 11:42:20'),
(84, 58, '2017-11-18 15:28:03', 'ZDM3MTY5NzA5NGE3MzU3NzA3NGMxMGZiNjY4OGYyZmY_MTYyMTFiMjc0NmM0NzIxMzcwYjExNmJiYTI2YjQ5ZTk_MTI1ZDZkNjg2NmMwYjkwZGI3YmUwMjlhOWZkYjI4ZmM_', '2018-11-18 20:58:03'),
(85, 1, '2017-11-18 15:29:47', 'YzFjMjllZTYzODM2YWVkZTM3ZGRkZDZmOTZlYWY3YzY_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_YWI5Nzg5NjJkMWU2M2YyNWVkNWNkYTkxZTM3OWI5NzE_', '2018-11-18 20:59:47'),
(86, 1, '2017-11-18 15:38:26', 'ZDk3ZDg5NTFkOWQ2MDFiMzI4ZDRiYjIzMTc5OWFhNGI_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_NzNlYmY3Mjk2ODQ4MmU1MGRmYTNjYzVjM2Y3MjUxOGQ_', '2018-11-18 21:08:26'),
(87, 1, '2017-11-18 16:39:08', 'YTE2OWVhYTliY2I2YzA1NWRkZjdhZjdjN2MyODljZWU_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_NTIwMTNlZDg1NTgzNzNkOWRjMDlhODFiYjMwMjE4MWM_', '2018-11-18 22:09:08'),
(88, 2, '2017-11-18 16:43:27', 'ZGNmNGEyMjVlNTJhOTQ0ZjYwZmU1ODg3YzEwZDZjMDI_MWQ0NWE4Mzc4YjcwYjk5MWJlMDVjZTUxZjVmMzg3MmM_NWY3YTE0OGVjZGZlNDMxOTc4ZDVlYzRmYWQyM2UzNmU_', '2018-11-18 22:13:27'),
(89, 1, '2017-11-20 02:51:46', 'MTFjZjRhNDQ1ZGUwMTEyNThiZGRmNTc3NDQ0Njk1ODc_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_OTI3MjBkNDEyZjJjMGQ5YWJkOThlZTc2M2YwYTAyYjI_', '2018-11-20 08:21:46'),
(90, 1, '2017-11-20 15:46:19', 'YzNiZjg4ZGZhYTZmZmM4M2M4OGE2ZWJhMzNiM2E3YzY_MGQ4ZjQyOTMwZDFmMTYyOTdlOTQ2MDZmODhlMmU2ZGI_ODk2OWI4ZmM4NzBmZDRhZTFkZjAyMWVjNjZiZDA1OWE_', '2018-11-20 21:16:19');

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
(20, 'ramu', 'rama', 'ramu.rulez@gmail.com', '9894130822', '1993-09-02', 'NOT_VERIFIED', 'NOT_VERIFIED', '2017-08-31 18:23:51'),
(32, 'Ramu', 'Ramasamy', 'r@ymail.com', '9789413082', '0000-00-00', 'NOT_VERIFIED', 'NOT_VERIFIED', '2017-11-15 14:24:39'),
(38, 'rams', 'rams', 'hr@honeycakes.in', '9894130825', '0000-00-00', 'NOT_VERIFIED', 'NOT_VERIFIED', '2017-11-15 14:54:16'),
(46, 'Ramu', 'Ramasamy', 'rr@ymail.com', '9789413089', '0000-00-00', 'VERIFIED', 'VERIFIED', '2017-11-15 18:20:54'),
(49, 'qwert', 'asddf', 'q@q.com', '789123456', '0000-00-00', 'NOT_VERIFIED', 'VERIFIED', '2017-11-15 18:31:49'),
(54, 'q', 'q', 'q@w.com', '9894130820', '0000-00-00', 'NOT_VERIFIED', 'VERIFIED', '2017-11-15 18:47:30'),
(55, 'a', 'a', 'a@a.com', '3456789023', '0000-00-00', 'NOT_VERIFIED', 'VERIFIED', '2017-11-15 19:15:47'),
(57, 'ramu', 'rams', 'r@r.com', '345678901', '0000-00-00', 'NOT_VERIFIED', 'VERIFIED', '2017-11-18 06:03:58'),
(58, 'rams', 'rams', 'r@q.com', '8190912852', '0000-00-00', 'NOT_VERIFIED', 'VERIFIED', '2017-11-18 15:27:33'),
(59, 'r', 'r', 'r', '788996656', '0000-00-00', 'NOT_VERIFIED', 'NOT_VERIFIED', '2017-11-19 05:26:11'),
(65, 'q', 'q', 'op', '1234567811', '0000-00-00', 'NOT_VERIFIED', 'NOT_VERIFIED', '2017-11-19 06:33:10'),
(69, 'l', 'l', 'l@l.com', '23468900', '0000-00-00', 'NOT_VERIFIED', 'NOT_VERIFIED', '2017-11-19 06:38:54'),
(70, 'san', 'san', 'san@g.com', '8877665544', '0000-00-00', 'NOT_VERIFIED', 'NOT_VERIFIED', '2017-11-19 08:08:29');

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

--
-- Dumping data for table `user_address`
--

INSERT INTO `user_address` (`user_address_id`, `user_id`, `home`, `office`, `other`) VALUES
(1, 1, 'D411, Vaikund Sundaram, Vendarasi Amman kovil stree, Karapakkam, Chennai - 97.', 'IVTL Infoview Technologies, Melaram Towers, Karapakkam, Chennai - 97.', '');

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
(1, 1, '$2a$07$DvIszgECG3eQZfctfVd32O1gefPvmZb3ZKiNXC5amJIthjo5hlaeC'),
(2, 2, '$2a$07$DvIszgECG3eQZfctfVd32O1gefPvmZb3ZKiNXC5amJIthjo5hlaeC'),
(4, 32, '$2y$10$3Vzs1tGS4xy6dzqq8EqbxOVaHFnaGOg8ltX8/JDg2w5UVmV4bqe7O'),
(8, 46, '$2y$10$NRPw/cNXu0L2V2WThe1Fj.8Che7hv5bpHDLNd7At8DkwYSJmcC3u.'),
(9, 49, '$2y$10$GkOHxEJ2bIfuDT4012e21OOWzdEXYLDXwgBMqC8L8tbJgT/1rmJAq'),
(10, 54, '$2y$10$baxvdSefai91Lxp6EuX6nOYfdf1szKhHdQ.IX8/p3PP909P31k/Iy'),
(11, 55, '$2y$10$8zyynk91NchPqwBFka3IX.Tn6g.aAk.v4naFkKmCI0yKx8wZP3w1y'),
(12, 57, '$2y$10$KEnp4HDWtXzZWh/ZVaMFa.qVqXp1pvihSUAmsFRJIPjHqWcZSFv.q'),
(13, 58, '$2y$10$j5CxMduZ3D4Bt1ZvC1sVe.64W0Emkdc/F8knA39/PpT0j4O7uUnou'),
(17, 65, '$2y$10$kpZyzmxojKREwJgyoNDwEeV1pQloziLiRU9btuPTBM3FiYKrGH6Bi'),
(20, 69, '$2y$10$yLP1wxYAEsTsqpLnoy/WqO2xKKw1Fybz0hziDrxs.SXJ9X5wS0rn6'),
(21, 70, '$2y$10$D0lK9l1FkY9waQH5Rq7eT.JypAQGo2Pc48DFnQeYWpvGrU3eqfBbW');

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `notification_type` varchar(5) NOT NULL,
  `message_type` varchar(11) NOT NULL,
  `delivery_to` varchar(50) NOT NULL,
  `message_content` varchar(540) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`notification_id`, `user_id`, `notification_type`, `message_type`, `delivery_to`, `message_content`, `date_time`) VALUES
(3, 69, '', 'OTP', 'l@l.com', 'Your OTP for Honeycakes signup is 375454. Please do not share this with anyone.', '2017-11-19 06:38:54'),
(4, 69, '', 'OTP', '23468900', 'Your OTP for Honeycakes signup is 791973. Please do not share this with anyone.', '2017-11-19 06:38:54'),
(5, 70, 'EMAIL', 'OTP', 'san@g.com', 'Your OTP for Honeycakes signup is 751051. Please do not share this with anyone.', '2017-11-19 08:08:30'),
(6, 70, 'SMS', 'OTP', '8877665544', 'Your OTP for Honeycakes signup is 659676. Please do not share this with anyone.', '2017-11-19 08:08:30');

-- --------------------------------------------------------

--
-- Table structure for table `user_otp`
--

CREATE TABLE `user_otp` (
  `otp_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `otp_for` varchar(6) NOT NULL,
  `otp_value` varchar(6) NOT NULL,
  `generated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user_otp`
--

INSERT INTO `user_otp` (`otp_id`, `user_id`, `otp_for`, `otp_value`, `generated_time`) VALUES
(7, 46, 'email', '177904', '2017-11-15 16:30:44'),
(8, 46, 'mobile', '345321', '2017-11-15 16:30:44'),
(9, 49, 'email', '111934', '2017-11-15 18:31:05'),
(10, 49, 'mobile', '278767', '2017-11-15 18:31:05'),
(11, 54, 'email', '406884', '2017-11-15 18:47:09'),
(12, 54, 'mobile', '100007', '2017-11-15 18:47:09'),
(13, 55, 'email', '973151', '2017-11-15 19:15:20'),
(14, 55, 'mobile', '230172', '2017-11-15 19:15:20'),
(15, 57, 'email', '860635', '2017-11-18 06:03:22'),
(16, 57, 'mobile', '480332', '2017-11-18 06:03:22'),
(17, 58, 'email', '700454', '2017-11-18 15:27:03'),
(18, 58, 'mobile', '288034', '2017-11-18 15:27:03'),
(30, 69, 'email', '375454', '2017-11-19 06:38:54'),
(31, 69, 'mobile', '791973', '2017-11-19 06:38:54'),
(32, 70, 'email', '751051', '2017-11-19 08:08:30'),
(33, 70, 'mobile', '659676', '2017-11-19 08:08:30');

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
(2, 'VN002', 'Cake House', 'Navallur', '1234567890', '234@gmail.com', 'LN007'),
(3, 'VN003', 'Yum Cakes', 'Thoraipakkam', '8765432190', '789@gmail.com', 'LN003'),
(4, 'VN004', 'Bakers Code', 'Thiruvanmyur', '765421098', '667@gmail.com', 'LN002');

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
(28, 'VN004', 'IT007', 1),
(29, 'VN001', 'PARTY01', 1),
(30, 'VN001', 'PARTY02', 1),
(31, 'VN001', 'PARTY03', 1),
(32, 'VN001', 'PARTY04', 0),
(33, 'VN002', 'PARTY01', 1),
(34, 'VN002', 'PARTY02', 1),
(35, 'VN002', 'PARTY03', 1),
(36, 'VN002', 'PARTY04', 1),
(37, 'VN003', 'PARTY01', 1),
(38, 'VN003', 'PARTY02', 1),
(39, 'VN003', 'PARTY03', 1),
(40, 'VN003', 'PARTY04', 1),
(41, 'VN004', 'PARTY01', 0),
(42, 'VN004', 'PARTY02', 1),
(43, 'VN004', 'PARTY03', 1),
(44, 'VN004', 'PARTY04', 1);

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vendor_items_view`  AS  select `item`.`item_code` AS `item_code`,`item`.`item_name` AS `item_name`,`item`.`item_category` AS `item_category`,`item`.`item_price` AS `item_price`,`item`.`qty_slab` AS `qty_slab`,`vendor`.`location_code` AS `location_code`,`vendor`.`vendor_code` AS `vendor_code`,`vendor_item`.`status` AS `status` from ((`items` `item` join `vendors` `vendor`) join `vendor_items` `vendor_item`) where ((`item`.`item_code` = `vendor_item`.`item_code`) and (`vendor`.`vendor_code` = `vendor_item`.`vendor_code`)) order by `item`.`item_code`,`vendor`.`vendor_code` ;

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
  ADD PRIMARY KEY (`order_id`),
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
  ADD KEY `order_num_items` (`order_id`),
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
  ADD PRIMARY KEY (`user_address_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_credentials`
--
ALTER TABLE `user_credentials`
  ADD PRIMARY KEY (`user_login_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id_notification` (`user_id`);

--
-- Indexes for table `user_otp`
--
ALTER TABLE `user_otp`
  ADD PRIMARY KEY (`otp_id`),
  ADD KEY `user_otp_id` (`user_id`);

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
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'orderNumber', AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `order_feedback`
--
ALTER TABLE `order_feedback`
  MODIFY `order_feedback_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `token_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT for table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `user_address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_credentials`
--
ALTER TABLE `user_credentials`
  MODIFY `user_login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user_otp`
--
ALTER TABLE `user_otp`
  MODIFY `otp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `vendor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vendor_items`
--
ALTER TABLE `vendor_items`
  MODIFY `vendor_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
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
  ADD CONSTRAINT `order_num_feedback` FOREIGN KEY (`order_number`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_item_code` FOREIGN KEY (`item_code`) REFERENCES `Items` (`item_code`),
  ADD CONSTRAINT `order_num_items` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `user_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `user_credentials`
--
ALTER TABLE `user_credentials`
  ADD CONSTRAINT `user_credentials_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD CONSTRAINT `user_id_notification` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `user_otp`
--
ALTER TABLE `user_otp`
  ADD CONSTRAINT `user_otp_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

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
