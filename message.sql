-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2024 at 10:27 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `messages`
--

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(10) UNSIGNED NOT NULL,
  `phone` varchar(15) NOT NULL,
  `body` varchar(160) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `sent` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `phone`, `body`, `ts`, `sent`) VALUES
(3, '01203207078', 'Hello to my API', '2024-07-15 23:43:02', 1),
(4, '01243217078', 'Hello to my API 2', '2024-07-16 00:41:21', 1),
(5, '01343217078', 'Hello to my API 3', '2024-07-16 00:41:38', 1),
(6, '01443217078', 'Hello to my API 4', '2024-07-16 00:41:46', 1),
(7, '01203207027', 'Welcome to the first created SMS', '2024-07-16 15:08:22', 1),
(8, '01203207027', 'Welcome to the first created SMS 2', '2024-07-16 15:16:52', 1),
(9, '01203207027', 'Welcome to the first created SMS 3', '2024-07-16 16:13:51', 1),
(10, '01203207027', 'Welcome to the first created SMS 4', '2024-07-16 16:17:34', 1),
(11, '01203207027', 'Welcome to the first created SMS 5', '2024-07-16 16:22:46', 1),
(12, '01203207027', 'Welcome to the first created SMS 6', '2024-07-16 16:47:41', 1),
(13, '01203207027', 'Welcome to the first created SMS 7', '2024-07-16 17:30:02', 1),
(14, '01203207027', 'Welcome to the first created SMS 8', '2024-07-16 17:37:38', 1),
(15, '01203207027', 'Welcome to the first created SMS 9', '2024-07-16 17:40:12', 1),
(16, '01203207027', 'Welcome to the first created SMS 10', '2024-07-16 17:52:43', 1),
(17, '01203207027', 'Welcome to the first created SMS 11', '2024-07-16 17:52:54', 1),
(18, '01203207027', 'Welcome to the first created SMS 12', '2024-07-16 17:56:16', 1),
(19, '01203207027', 'Welcome to the first created SMS 13', '2024-07-16 19:05:03', 1),
(20, '01203207027', 'Welcome to the first created SMS 14', '2024-07-16 19:05:08', 1),
(21, '01203207027', 'Welcome to the first created SMS 15', '2024-07-16 19:05:12', 1),
(22, '01203207027', 'Welcome to the first created SMS 16', '2024-07-16 19:11:41', 1),
(23, '01203207027', 'Welcome to the first created SMS 17', '2024-07-16 19:11:44', 1),
(24, '01203207027', 'Welcome to the first created SMS 18', '2024-07-16 19:11:47', 1),
(25, '01284107414', 'Welcome to the API that send messages well', '2024-07-16 19:19:30', 1),
(26, '01203207027', 'Welcome to the API that send messages well 1', '2024-07-16 19:19:53', 1),
(27, '01203207027', 'Welcome to the API that send messages well 2', '2024-07-16 19:19:57', 1),
(28, '01203207027', 'Welcome to the API that send messages well 3', '2024-07-16 19:24:02', 1),
(29, '01203207027', 'Welcome to the API that send messages well 4', '2024-07-16 19:24:05', 1),
(30, '01203207027', 'Welcome to the API that send messages well 5', '2024-07-16 19:24:08', 1),
(34, '01203207027', 'Welcome to the API that send messages well 6', '2024-07-16 19:28:56', 1),
(35, '01203207027', 'Welcome to the API that send messages well 7', '2024-07-16 19:30:44', 1),
(36, '01203207027', 'Welcome to the API that send messages well 8', '2024-07-16 20:18:02', 1),
(37, '01203207027', 'Welcome to the API that send messages well 9', '2024-07-16 20:18:06', 1),
(38, '01203207027', 'Welcome to the API that send messages well 10', '2024-07-16 20:18:10', 1),
(39, '01203207027', 'Welcome to the API that send messages well 11', '2024-07-16 20:20:04', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
