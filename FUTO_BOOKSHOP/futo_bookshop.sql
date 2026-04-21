-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2025 at 07:14 PM
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
-- Database: `futo_bookshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Top Admin','Admin','Sub Admin') DEFAULT 'Admin',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'Main Admin', '$2y$10$nIEIRGop8u9epxI.jkGs5.Ebounhkv056qWaiOBacdcgECSZn6/1S', 'Top Admin', '2025-10-25 09:32:54');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `level` int(11) NOT NULL,
  `semester` enum('harmattan','rain') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `price`, `level`, `semester`, `created_at`, `status`) VALUES
(2, 'BIO 1O1 Textbook', 'Prof. Mrs. Eze', 4000.00, 100, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(3, 'GST 111 Textbook and Manual', 'Mr. Anthony Chukwu', 6000.00, 100, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(4, 'MTH 201 Manual', 'DR. Mr. Emmanuel Chukwu', 3000.00, 100, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(5, 'COS 101 Textbook and Manual', 'Mr. Adebayo Areti', 5000.00, 100, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(6, 'GST 103 Textbook and Manual', 'Mr. Chigbo', 5000.00, 100, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(7, 'CHEM 101 Textbook and Manual', 'Engr. Dr. Amadi Emmanuel', 5000.00, 100, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(8, 'ENG 101 Handout and Manual', 'Dr. Mrs. G.N Ezeh', 3500.00, 100, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(9, 'PHY 103 Manual', 'Mrs. Vivian Mbamala', 2500.00, 100, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(10, 'STA 111 Textbook and Manual', 'Dr. Mrs. Chika Nora John', 5000.00, 100, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(11, 'PHY 101 Textbook and Manual', 'Mr. Akunyuli Taiwo', 6000.00, 100, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(12, 'FRN 101 Manual', 'Dr. Mr. Etus', 2000.00, 100, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(13, 'IGB 101 Novel and Manual', 'Prof. Mrs. Eze', 2500.00, 100, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(14, 'GET 101 Manual', 'Mr. Anthony ThankGod', 2000.00, 100, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(15, 'MTH 103 Manual', 'DR. Mr. Godsfavour Patrick', 2000.00, 100, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(16, 'GST 108 Textbook and Manual', 'Mr. Adebayo Areti', 5000.00, 100, 'rain', '2025-10-23 21:49:25', 'Available'),
(17, 'FRN 102 Manual', 'Mr. Chigbo', 2000.00, 100, 'rain', '2025-10-23 21:49:25', 'Available'),
(18, 'IGB 102 Novel and Manual', 'Mrs. Chidera Okani', 2500.00, 100, 'rain', '2025-10-23 21:49:25', 'Available'),
(19, 'BIO 102 Textbook and Manual', 'Dr. Mrs. G.N Ezeh', 5000.00, 100, 'rain', '2025-10-23 21:49:25', 'Available'),
(20, 'EGL 102 Manual', 'Mrs. Vivian Mbamala', 2500.00, 100, 'rain', '2025-10-23 21:49:25', 'Available'),
(21, 'PHY 104 Manual', 'Dr. Mrs. Chika Nora John', 2500.00, 100, 'rain', '2025-10-23 21:49:25', 'Available'),
(22, 'COS 102 Textbook and Manual', 'Mr. Akunyuli Taiwo', 5000.00, 100, 'rain', '2025-10-23 21:49:25', 'Available'),
(23, 'MTH 102 Manual', 'Dr. Mr. Etus', 2000.00, 100, 'rain', '2025-10-23 21:49:25', 'Available'),
(24, 'GST 112 Textbook and Manual', 'Prof. Mrs. Eze', 3500.00, 100, 'rain', '2025-10-23 21:49:25', 'Available'),
(25, 'PHY 102 Textbook', 'Mr. Anthony Chukwu', 4000.00, 100, 'rain', '2025-10-23 21:49:25', 'Available'),
(26, 'STA 112 Textbook and Manual', 'DR. Mr. Udemezuo Augustine', 4000.00, 100, 'rain', '2025-10-23 21:49:25', 'Available'),
(27, 'CHM 102 Manual', 'Mr. Adebayo Patrick', 2500.00, 100, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(29, 'MTH 203 Manual', 'Engr. Dr. Amadi Emmanuel', 2500.00, 200, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(30, 'GET 201 Textbook and Manual', 'Dr. Mrs. G.N Ezeh', 4000.00, 200, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(31, 'GET 211 Textbook and Manual', 'Mrs. Vivian Mbamala', 4000.00, 200, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(32, 'CSC 201 Textbook and Manual', 'Dr. Mrs. Chika Nora John', 4000.00, 200, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(33, 'ENG 201 Manual', 'Mr. Akunyuli Taiwo', 2500.00, 200, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(34, 'STA 211 Textbook', 'Dr. Mr. Etus', 4000.00, 200, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(35, 'MTH 202 Manual', 'Prof. Mrs. Eze', 2000.00, 200, 'rain', '2025-10-23 21:49:25', 'Available'),
(36, 'MTH 204 Manual', 'Mr. Anthony Chukwu', 2000.00, 200, 'rain', '2025-10-23 21:49:25', 'Available'),
(37, 'CSC 202 Textbook and Manual', 'DR. Mr. Emmanuel Chukwu & Mr. Henry', 6000.00, 200, 'rain', '2025-10-23 21:49:25', 'Available'),
(38, 'IFT 206 Manual', 'Mr. Ajaere I.', 2500.00, 200, 'rain', '2025-10-23 21:49:25', 'Available'),
(39, 'CIT 204 Textbook and Manual', 'Mr. Chigbo', 2500.00, 200, 'rain', '2025-10-23 21:49:25', 'Available'),
(40, 'ENG 226 Manual', 'Engr. Dr. Amadi Emmanuel', 2500.00, 200, 'rain', '2025-10-23 21:49:25', 'Available'),
(41, 'SIW 200 Logbook', 'Dr. Mrs. G.N Ezeh', 3000.00, 200, 'rain', '2025-10-23 21:49:25', 'Available'),
(42, 'IFT 301 Manual (Principles of Telecommummunication Technology)', 'Mr. Ajaere I.', 4000.00, 300, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(43, 'IFT 303 Manual (Data Communication and Networking)', 'Mr. Asimobi', 2500.00, 300, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(44, 'IFT 305 Manual (Multimedis Applications, Systems and Development)', 'Dr. Mr. John Gregory', 2500.00, 300, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(45, 'ENS 301 Textbook (Introduction to Enterpreneurship and Innovation)', 'Dr. Mr. Adau Hammed', 3000.00, 300, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(46, 'CIT 305 Manual (Introduction to Software Engineering)', 'Mrs. Eze', 2500.00, 300, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(47, 'IFT 302 Manual (Information and Network Security)', 'Dr. Etus', 2500.00, 300, 'rain', '2025-10-23 21:49:25', 'Available'),
(48, 'IFT 304 Manual (Computer Graphics)', 'Mr. Asimobi & Dr. John Gregory', 2500.00, 300, 'rain', '2025-10-23 21:49:25', 'Available'),
(49, 'CIT 302 Manual (Computer Programming II)', 'Mr. Adebayo & Mr. Asimobi', 2500.00, 300, 'rain', '2025-10-23 21:49:25', 'Available'),
(50, 'CIT 304 Textbook (Datatbase Management System I)', 'Mrs. Vivian Mbamala', 3500.00, 300, 'rain', '2025-10-23 21:49:25', 'Available'),
(51, 'CIT 306 Manual (Website Design and Programming I)', 'Engr. Dr. Amadi Emmanuel', 2500.00, 300, 'rain', '2025-10-23 21:49:25', 'Available'),
(52, 'ENS 302 Textbook (Business Creation Growth and Corporate Governance)', 'Dr. Mrs. G.N Ezeh', 3000.00, 300, 'rain', '2025-10-23 21:49:25', 'Available'),
(53, 'IFT 409 Manual (Data Science)', 'Dr. Mr. Adetokumbo John', 2500.00, 400, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(54, 'CIT 401 Manual (Database Management System II)', 'Mrs. Vivian Mbamala', 2500.00, 400, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(55, 'CIT 403 Manual (Web Design and Programming II)', 'Mr. Chigbo Nwanjah', 2500.00, 400, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(56, 'SIW 400 Logbook', 'FUTO SIWES Unit', 4000.00, 400, 'rain', '2025-10-23 21:49:25', 'Available'),
(57, 'IFT 503 Manual (Embedded Systems and Pervasive Computing)', 'Dr. Mr. Ekedebe', 2500.00, 500, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(58, 'IFT 505 Manual (Web Server Technologies and Administration)', 'Engr. Dr. Amadi Emmanuel', 2500.00, 500, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(59, 'IFT 511 Manual (Mobile Application Development)', 'Mr. Chigboaja', 2500.00, 500, 'harmattan', '2025-10-23 21:49:25', 'Available'),
(182, 'IFT 502 (Computer Modelling and Simulation)', 'Mr. Asimobi', 3500.00, 500, 'rain', '2025-10-25 13:56:14', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `message`, `submitted_at`) VALUES
(1, 'nwamadu confidence', 'nwamadu8@gmail.com', 'i have a complin', '2025-10-28 08:47:30'),
(2, 'nwamadu confidence', 'nwamadu8@gmail.com', 'help', '2025-10-28 08:57:57');

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `status` enum('Pending','In Transit','Delivered') DEFAULT 'Pending',
  `delivery_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` enum('Pending','Processed','Ready for Pickup','Delivered') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `pickup_day` varchar(20) DEFAULT NULL,
  `pickup_time` varchar(20) DEFAULT NULL,
  `penalty_amount` int(11) DEFAULT 0,
  `penalty_paid` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `student_id`, `book_id`, `quantity`, `status`, `created_at`, `pickup_day`, `pickup_time`, `penalty_amount`, `penalty_paid`) VALUES
(35, 1740, 42, 1, '', '2025-11-03 16:07:41', '2025-11-05', '9AM-11AM', 0, 0),
(36, 1025, 57, 1, '', '2025-11-03 17:35:27', '2025-11-03', '9AM-11AM', 0, 0),
(37, 1025, 58, 1, '', '2025-11-03 17:58:26', 'Not selected', 'Not selected', 0, 0),
(38, 1025, 59, 1, '', '2025-11-03 17:58:26', 'Not selected', 'Not selected', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pickup_slots`
--

CREATE TABLE `pickup_slots` (
  `id` int(11) NOT NULL,
  `day_name` varchar(15) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `status` enum('available','full') DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pickup_slots`
--

INSERT INTO `pickup_slots` (`id`, `day_name`, `date`, `start_time`, `end_time`, `status`) VALUES
(1, 'Monday', '2025-11-10', '09:00:00', '11:00:00', 'available'),
(2, 'Monday', '2025-11-10', '11:00:00', '13:00:00', 'available'),
(3, 'Tuesday', '2025-11-04', '09:00:00', '11:00:00', 'available'),
(4, 'Tuesday', '2025-11-04', '11:00:00', '13:00:00', 'available'),
(5, 'Wednesday', '2025-11-05', '09:00:00', '11:00:00', 'available'),
(6, 'Wednesday', '2025-11-05', '11:00:00', '13:00:00', 'available'),
(7, 'Thursday', '2025-11-06', '09:00:00', '11:00:00', 'available'),
(8, 'Thursday', '2025-11-06', '11:00:00', '13:00:00', 'available'),
(9, 'Friday', '2025-11-07', '09:00:00', '11:00:00', 'available'),
(10, 'Friday', '2025-11-07', '11:00:00', '13:00:00', 'available');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `date_purchased` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_pickups`
--

CREATE TABLE `student_pickups` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `slot_id` int(11) DEFAULT NULL,
  `status` enum('scheduled','completed','missed') DEFAULT 'scheduled',
  `penalty_paid` enum('yes','no') DEFAULT 'no',
  `scheduled_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `matric` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(10) NOT NULL,
  `department` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `matric`, `name`, `password`, `level`, `department`) VALUES
(1025, '20201213202', 'Nwamadu Confidence', '$2y$10$DvSgxwfZxS6lUnIlhGj89.RkbxsfFD.tDcgmU1WAPrPi9P0qXryxq', '500 Level', 'Information Technology'),
(1026, '20241422252', 'Achonwa paulchurchill udochukwu', '$2y$10$ex7N9zJ2Wf1pW.VbOB1pDen3u9eO8XO6xwhglSdc8WaOPLO.AC7NW', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1027, '20241495062', 'Adibe Ifechukwu Johnbosco', '$2y$10$ALg0ZywaDPjJj4g5onvKrOMg2WaAh/iY9T2uSxPo4EhoLLy7zQFRG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1028, '20241436972', 'Adimora Oluchi Mary', '$2y$10$Dv40pU6W1k1V6DXMua34UOxcQ2D4JYF52Q7DvAvFqaoWJNqS6OJ3S', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1029, '20241468092', 'Adum Fidelis Somtochukwu', '$2y$10$NLpMZ21XOvRVETMDTYiFie8jPAV.RhzMYqYv2qxkYgEM/ko0Riscq', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1030, '20241422682', 'Agbo Matthew Chidera', '$2y$10$t0Oq/kl9slHtC4LJg.jPEO1S/L1748oAtfigzPGDeNt4Ojn5rGz4i', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1031, '20241430062', 'Aguhalam Godswill Chinemerem', '$2y$10$xg0l1Uyxm9Mbgpxm/lJttuWUKPYgmez1fU37ELkhtASThfjl5ZZRi', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1032, '20241457322', 'Agwaramgbo Able Chiemeria', '$2y$10$dJj48ENqKbW4G4k0LcngxeZlYD.Gm.BNw2w3HGJxy7tHNouwD7fZe', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1033, '20241458302', 'Ahuche Ephraim Chukwuebuka', '$2y$10$C5V1vlTRsw8PAUusJDiTH.8CZmqG5PMXOnMhQml4bsuwkoF1XmqIS', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1034, '20241482162', 'Ajeroh Chidalu Chiemerie', '$2y$10$zDqM.xUyG2CvJITqohBOse1UhXY/5zXkPw/fPVMH0uXQPimwTI7VG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1035, '20241422962', 'Ajunwa Esther Nkechinyere', '$2y$10$afK2qiWhnN3EIXIEIzrv7.mzVZ3q8Upax3VEbFc8S88W5n/219VsC', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1036, '20241457292', 'Akagbusim Uchenna Samuel', '$2y$10$1nWlL20wpMQhBxFtH5GTBudcGJGEJyFSEXp21jIqyqPJsFuEsSBo6', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1037, '20241485542', 'Akoma Ihechimere W', '$2y$10$3RJ4oD9FNs1LRNcx8yitKeIuCoLon7SXrJlkbIfcum0ydRvwnmFF.', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1038, '20241487552', 'Akubuo Pascal chidiebere', '$2y$10$NfUrUwMz4v4XzsmyfjP60urt6fuZxqLpLU0AGU2VsNCplBbeamPAy', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1039, '20241462622', 'Akujobi Ebubechukwu Osinachi', '$2y$10$pc87LVj2UmYOtuom.gKdouoN5yNYbDjWvYdNlGop/oUytP79IP.LG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1040, '20241442072', 'Alozie Albright Ogochukwu', '$2y$10$FgNiAlgwhTkhlFiFaqwh.OZf1OokwpP6h6XbuDJc2GAcwpoWKkTS.', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1041, '20241434412', 'Amadi Prince Nelson', '$2y$10$kpYiZCBW.T99oZAxC0ItoeOwkpkL.PHM.dpIG5xR5DjyTnuM7./Tu', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1042, '20241466752', 'Amadi Samuel Chinedu', '$2y$10$iU1LNeEmcNELGWY3/Y/MJ.ZCP8LiL3c2YOVg7.OHGd/IeufAGsu42', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1043, '20241481472', 'Amaechi Charles Maduabuchukwu', '$2y$10$0hjCMbzlyvQksBHbs5sa0O2kCUatVg5AU.TiTm69Vbs5hkF/eDTru', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1044, '20241459612', 'Amaechi Samuel Chisom', '$2y$10$dBmQXJzakjTjuVUwZsiyv.3elO5iuLEGJ2hipUraAHvmKPlkNZQhy', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1045, '20241457452', 'Amaje Samuel Chimeremeze', '$2y$10$XZo5V5ZcMyUXhVdYMAN4q.js8jfm9mMiYJpkd5Wrmo0LnQRbua4va', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1046, '20241488772', 'Amiebo collins otsealete', '$2y$10$YxPMEs0XDvRly5j1c2GO1.4CaeUUZv8Oa0PWaqnYb63Z0mz5NYyjK', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1047, '20241464842', 'Anderson Brentford Chimka', '$2y$10$l3EK43k3yfsfcx7AiReBcOR2Isl5ciucfoIH33fbCfxnjn7JeDRYO', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1048, '20241479902', 'Aneke chidera Gift David', '$2y$10$8m0yVB4S9EiaoSFlp9Aq4OezzXlQdfVC.SBpK2QL7B343F8vDzR8O', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1049, '20241486722', 'Ani chukwuebuka Christian', '$2y$10$/1o2kofra6jpSCsEboasoOBd5U74nozSP3jbocRyNj/tt.jbdrMDa', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1050, '20241487402', 'Ani ifunanya Gabriella', '$2y$10$iAqhVNHb99lYnI3SwG7iN.KdU7IXa0NCs9CizRF3txlF6D6ckD9YS', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1051, '20241493382', 'Anokwuru Chukuwuebuka Bryan.', '$2y$10$aCYhQt4ADmEgXQPNEZ0RL.bWzcu1S/nEWAzo5lqF4MZBM4JMAcgVu', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1052, '20241422922', 'Anosike Emmanuella Mmesomachukwu', '$2y$10$0YKLTFvrDOkHgJwxLZWFx.p4VqdxM7vBU.4F1aoY5/5kllzpoZLTa', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1053, '20241458972', 'Anozie desmond Chinonoso', '$2y$10$1BNlk7EZTFy4wBhZKoXUbO7poeAku5RBBl.3IIvFNvGaHNoiLb/KW', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1054, '20241458052', 'Anozieinnocent Newton Chidire', '$2y$10$u8SvQ65BcZ2vhPGj/hccsupvth/7kizN/59AL0bHwR/ZZn.p63WsG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1055, '20241463692', 'Anucha Yagazie Ugochukwu', '$2y$10$HZTM9qqB05.fEEQbvYFuheJTItmKjAbmbRTRparuqzuWAUUwZ59fS', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1056, '20241466302', 'Anyanwu Favour Chidinma', '$2y$10$qOdob6vTcs93SZQmYXR6suQ.PmC2trpmtfW3jkHUAbYR/Y5FRbFKW', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1057, '20241480822', 'Anyanwu John Onyekachi', '$2y$10$R07wLiFYmRt9yp0aq64Lk.2k6j44q2XdqCTruBxbHRo8kobnc5dd.', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1058, '20241462352', 'Aroh Global-John david', '$2y$10$XPOsTbg8371Z12RdCba9XO/RTDassnAtpvWeivaNB8Qy88i1toXOy', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1059, '20241481122', 'Asouzu Obinna Emmanuel', '$2y$10$lvxUu8d6rFl.Tso4i7jw5e0pyt2tD3pia0N0oHL6HKZIB.l4BFUXS', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1060, '20241468602', 'Atuma Daniel Chima', '$2y$10$AioSnFAi6xmJk79u2B/Fb.w1zHLZYe3n.oqiZjRRr/azXDqEv988e', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1061, '20241470412', 'Ayoo-Angwe Annum', '$2y$10$ZSBVw4HD5G43e/sJBdDDmuBiPZmhAtln1FSXVuv7tguRN2q/g1PAy', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1062, '20241464212', 'Azubuike Chiamaka Chiemerie', '$2y$10$Cha6MaVSDqyhE0.WrbiCiOBil0BPNh3Cbzpi53N9RhYGZv4YnnVAe', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1063, '20241458712', 'Azuka Tochukwu Wilson', '$2y$10$oRa/r0pjM9JvAYbs2mGoDeuOmYBsHZ2nbFbXze.kEtu3jvpOErrFK', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1064, '20241492752', 'Barnabas Chibueze Great ', '$2y$10$gs8YFfUeyzjeRFZ2NqnyTumasdccnOgYTsFSG8vLc60dJwo6MsFoG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1065, '20241468632', 'Benjamin Ononiwu I F', '$2y$10$Qu42vWwPun/n27bcWHD3t.oQ25zus8R84PAcP6LeqmHtVW4Ua3jXu', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1066, '20241420542', 'Bright Onyebuchi Madueke', '$2y$10$9BXo0glKmFI6pslZKUvclu3HfhxBgl4kRkCOVwOWoclpAYmu.Eo7q', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1067, '20241467892', 'Callistus uchechukwu Jeremiah', '$2y$10$jI2IvYg/QAfUrd0Y3/NqrOmHTleChuI/qskdDVmSUE8MueIb0ZkOG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1068, '20241462602', 'Chibuisi Chikezirim Godswill', '$2y$10$qoN7PLR52UnG1u/jfWcNwei0d3kE.JPobsbE7BwlI78k0p498viSu', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1157, '20241421452', 'Chibuzor God\'swill', '$2y$10$nKebVx5MdLoD1HAacqTTo.yGrawGZRkYt2zpzaqSXMDpqdSZeMaPu', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1158, '20241460112', 'Chidiebere Blossom Chimzurum', '$2y$10$mOYPWMdq0rzsE.LhkoineO92/ka/fDQngDJum2lAQU4nvVaaIInZe', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1159, '20241457332', 'Chidiebere Promise Somtochukwu', '$2y$10$vxSvGLkNfD1nvtAt1OX1vuwbh7Dc97C6HPKMxKxc1ZMcIU5mRTXS2', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1160, '20241430852', 'Chidubem Bruno Chizoba', '$2y$10$6xGXReueqCcTfWFz86xM2.Pn2iTCQ5jAy5yG6RGy3cyzKaTGt98cm', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1161, '20241458332', 'Chidubem Martins Uzoma', '$2y$10$wYcBi5WqFlX0m4X6ccJfjuIRP5.8h9XMZ.Twvv37pje5GVGSZVo92', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1162, '20241465932', 'Chiedoziem Emmanuel Ugonna', '$2y$10$Vg1SQgtXYPJsd4vfZaWDBu7gsjobjdDYu0nrUyp.eLIUrlx..4Ntq', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1163, '20241484902', 'Chiejine Gabriella Ifechukwude', '$2y$10$BclZQXm3kqwT0fcVTdjl4Om02Rv7veMyWabHnNn.94dVvHK18X7ci', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1164, '20241437232', 'Chikere Wisdom Izuchukwu', '$2y$10$7gHL5E/H353LWnZ7WW6GUuv/hhbaN.jMy9PKccQ32RykEgxi1pSKa', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1165, '20241450302', 'Chikereuba Favour Chukwutem', '$2y$10$L3bFoV3CriczVwdV01CUqOg4D7HlkZp1jwCXxoA19f4UbMdqKPJDG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1166, '20241492712', 'Chima Ezika Ebubechukwu', '$2y$10$vZMF8X1bph6yFc6YJ4j6YewzFthO6VgFNNpjSyWTAgOO1YaKPVswa', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1168, '20241480192', 'Chima Martin Ebere', '$2y$10$Wzx1FPq4bvXDiUjiocOJIOGYhCDJ547OKjVaRZ2x4W1WKNYMip6C2', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1169, '20241462722', 'Chimezie Daniella Chinemerem', '$2y$10$FuFX0Uy3nRHAMAhoUIW4S.vuEHKgAWBvTN.5EQpN8f2EhfqGfjO3G', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1170, '20241487632', 'Chimezie Joseph Oluchi', '$2y$10$8nQiYX6qtUxli.b6YU3Mwug9DrvBP/KbWxeFXmtBHQ6JXWLrFAhxa', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1171, '20241441882', 'Chinedu Eze', '$2y$10$.FkCA0ynADpjVEvfyeYmLuIE1lcO8xB3poZdAu7K68uG6JfD9MZFG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1172, '20241478162', 'Chinedu Peters Dominion', '$2y$10$.nb5X9KsWrNpsZfuYhYUCe3ukocHO8zi/r3McAY5x0yxyptxqjMD.', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1173, '20241440212', 'Chinelu Emmanuel Chiagozie', '$2y$10$ialkhayg6nfIW3phwazzpOyiyWbu6V16/GgMvY4wUtbh/cLZaTspG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1174, '20241463532', 'Chinemerem Sean Nwakanma', '$2y$10$JrVBrEptHEUSYkC15ADasuwyVkTE7pIRb0q60Nwvi567gx.m7Ii9a', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1175, '20241429182', 'Chukwu Precious Chizaram', '$2y$10$BsctHz13gulSO0oRIqM3Puc8hQmThxfEsQnFmiHj/6f5N23jEFqB2', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1176, '20241434952', 'Chukwudi WIlliams Chikadibia', '$2y$10$fgBzM896tLKUJkZYgUlBveOzMmAWocBRPlEJPQhprpOdSxzEZ2wzK', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1177, '20241485872', 'Chukwuemeka Akachukwu Marvellous', '$2y$10$lgahY833DsSV5cUkPhGd8uatC7lsRdtTGB5R8dyPEltPamBZhwjfW', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1178, '20241480432', 'Chukwuemeka Chimeremeze Ezekwesiri', '$2y$10$aKerQP14HrZoejOj6LW0Luli4b7zAyOklIT0Uno7Sbt2Bcu8uOPBu', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1179, '20241466812', 'Chukwuemeka Elvis Uzoma', '$2y$10$rtTHNvhKXyBJjhVs3EVAtuuNf/R4Bv27lcu.Ok8wt/O6LEM2ENagq', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1180, '20241451512', 'Chukwuemeka Munachimso David', '$2y$10$03IuFi7xRoVj70FQq3bnpODxopWD9jUBGacthFkmXQ0KACIZ7OTba', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1181, '20241428682', 'Daniel Chisimdi Destiny', '$2y$10$3kLV6fEpH8NuHAp5nkXwHuBmC71k118qMr848YmpX8yS4FjnD4hjy', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1182, '20241465792', 'Dede Nwojo Daniel', '$2y$10$DNjN721RmqR.EsAY8CswvuPoc39ctd7xhFfu32A.W1CjAL7tMI8BC', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1183, '20241487482', 'Dike vitalis kelechi', '$2y$10$pO6SubjF.zMSqDwr2aaTgeSn8e6wxQV/FQPojuzrnv7Z/.0MxtF3q', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1184, '20241479452', 'Dominic Chidinma Gold', '$2y$10$kqlS8H7BMPKmaS1hXMlz2.jkyaVET/AGQi7HS1WFv.kvQh9zHyv8.', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1185, '20241493862', 'Duru Bright Chinedu', '$2y$10$Rtg0IhM43e6zbfbUHYfxcO6QS3IW9y/z1mjHOnOwHI9gwBmlsZuOG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1186, '20241460812', 'Duru Solomon ugochukwu', '$2y$10$x6pa7qMI3oQW/JWLOMBQc.R82gAs2xWfbE/e2UIxFUzvxBp6dSGq2', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1187, '20241493782', 'Duruanyaoha Joseph C.', '$2y$10$x5VpHDJ6ICko4An3BbCR.OOulDu6iwz5HLct3Zb3wRrdOaN9thD1m', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1188, '2021458732', 'Ebelechukwu Emmanuel Chibuodogwu', '$2y$10$AT6Q6Deo4gz7AVcT1E96H.JQ.nugHxfNE2H8hfO/7oNEu/cPNDWRi', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1189, '202440806409CF', 'Ebere Chimdiebube M ', '$2y$10$urc.wJuYp3XbGLcYeq/3RuAFQyMalG35zfOiQbBqnApfoWW0.yGIu', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1190, '20241495882', 'Ebere Chimdiebube Margaret', '$2y$10$mPx7bqbIQQJLObadDoAg0OKj8jrfMvokZFm6LJDnd6ReUjlaXSr7a', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1191, '20241485292', 'Ebube Oguh Innocent ', '$2y$10$z3jbCJd/rRrkRosqk.lKxuyqm6ILFhr3I0FwV1uhO1Jv3hpjeES.O', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1192, '20241489542', 'Edeh Frankline Chinecherem', '$2y$10$a/n5N7dQlC0pIG9JKZe7uuG1RawqIuUylNpGBA.WnewXdR3SZvsMS', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1193, '20241465602', 'Edidi Chinemerem Francis', '$2y$10$711TRDXtjHU99ooy4lBDe.nCvq5NXbm9ZA9MF.IQpxCcg9BMvle4m', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1194, '20241486472', 'Egwu Marvellous Ifunanya', '$2y$10$rKvpL2ko9OJGqZPCDi.iuOn2uEJa69oY9QZ5XyK9eqqXw8xPZkMtO', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1195, '20241481932', 'Eheka Precious', '$2y$10$o6dGnvOkbz9x.QGQKoZB.ef0egY4ChbradIR7YHZlAl07Y8XM09LK', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1196, '20241439332', 'Ejieke George kelechi', '$2y$10$VH14BBR5uvnaVe6o7cSq5.AmOUeMjDynnEq07Ev1QEjjE6kE0r/c.', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1197, '20241470532', 'Eke David James', '$2y$10$OLTU7JZoUjUw2qO.xfQJseavV0GoQ/h2U0Pw4FdmLZEdR.So7oIZG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1198, '20241490042', 'Ekeada Freedom S', '$2y$10$cDamVuW5b7jIZY.Sl5vWvOY1JxP.TP4OxXXN2/lZtzKiV//bSm3nu', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1199, '20242467912', 'Ekeigwe Wisdom Chidiebube', '$2y$10$ZFfw7gbT/W1sjtHTG51FxuJ15d0LUhDSHdIGFKi0B/YjPSquX2zEm', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1200, '20241486422', 'Emeka Elvis Onyewuchi', '$2y$10$qcavCxEl6eH3gq0RK474ZesKuGR9G7p4eWN0mM0xbYtSw0zZQwXHC', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1202, '20241433522', 'Emeli Ezekiel ayodele', '$2y$10$nye2E9xMJ1AANlGcFo/D8OGxfIeHASQGD0Ow9A275o8J92kl7odpO', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1203, '20241465682', 'Emmanuel Chidera Favour', '$2y$10$/M056DF0kl0zEQmlN0ISGeDSU6wQQJak8lNhQydfPzlGRyAvtnzTK', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1204, '20241494882', 'Emmanuel Chidindu George', '$2y$10$cMzvq1ygohsmhPq5vmzCwuoiv8ECFSUP3kbzh4Z9fBy9jH9LtieZa', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1205, '20241447802', 'Emmanuel Kingdavid Sopuruchi', '$2y$10$PWXSs8iZudsi1Iaj0rG/xO15jNKPZNYfunWKzzaczH0E.ZP/Rqj2S', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1206, '20241458372', 'Enebechi Covenant Chukwunwikem', '$2y$10$sdEAceQdfHGFNl7tapjDgO9i4Un/OsUKlPisNICSfU23neTv9300O', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1207, '20241489562', 'Enereujama Nteigbe Praise', '$2y$10$EJMwf/6O8ZnOSbtfGlMh5e6ZsWR1hcbT8XdLsFH7H.s4x8jEPmX.W', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1208, '20241435492', 'Ernest Fortune Izuchukwu', '$2y$10$J5/T0JbrECyvtIep9Zgm3.p/Q5hubxqA0JplUN8QljYp9/VPo1dIa', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1209, '20241490892', 'Etete Destiny Andrew ', '$2y$10$2MLooEY2lTQaeMnyk1F25uTWVvdpXCZCczbC4l3GHhGSJ49fmudz2', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1210, '20241486332', 'Esike Joshua Chibueze', '$2y$10$tKLrZFVvmmCvh.pe6KS6sOrq85qhd9IUbYf7FzM2S36SNhJXb8qyC', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1211, '20241426332', 'Eugene uchechi Blessing', '$2y$10$G4VMEISXI6jKxBmuhhT6/.JypOc.IFDKpFoWD8zWNlfYRaFk67NxW', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1212, '20241476522', 'Eze Blessing Chidinma', '$2y$10$FoN9q4AN/v6wCIaZTqaAZezHqyXsqgrKoSvMx/oNVPisQhtpYzvfq', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1213, '20241463802', 'Eze great ifeanyi', '$2y$10$bR0Tx5quWJ.2g/6wSwumW.wNCgN/CbeZb.qp9UU8xXx/L1nGDiFc6', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1214, '20241490542', 'Eze-Obaji Gideon Chijioke', '$2y$10$36GbVok2y1lGotuyP9wSq.81u3kmJIkoXBz44zfY4JxnLBkDf8MA.', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1215, '20242479352', 'Ezeama Chukwuemeka Vincent', '$2y$10$BerWwbG.EWvZFia7W4OB3OKrXYqDIOZD1iRCUXXSrtodEYlAPC2gu', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1216, '20241468802', 'Ezeh Emmanuel Elochukwu', '$2y$10$l1epNMAaH4ZvRBdQOzFJFOg5NQKocGBUmty8ajBSfqeD80plDepJq', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1217, '20241469932', 'Ezeh Raymond chibuzor', '$2y$10$cPEO/58QYsNBhytBJAaieukrPyyq9a01wql2MON3zBaGsHs2bKL5i', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1218, '20241460102', 'Ezeiruaku Chiedozie Emmanuel', '$2y$10$TnStuhLFJmrleQcq5o.rU.HzvD3T9cCDlp9Yo6K1VfNkoGcn01EkO', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1219, '20241477856', 'Ezejiofor -agu victor chinonso', '$2y$10$nKGOCgFA2LaEGRj7U6.VRuguEBrbIr.ECarH/AFbevVxZrfpFfu8u', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1220, '20241459502', 'Ezembaji Nnadubem Kamsiyonna', '$2y$10$6Pwp6SgsuvcfSeZONv0sQ.8Tc00be8lVvwxYzWxXRgt/0wx3Vbow2', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1221, '20241458102', 'Ezeonyeka nnamdi nnadozie', '$2y$10$hB5q0tHoLjAwJYN/Hd8ZAegXcOt.4cTSLKQyywQZg.pV7daINbLTS', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1222, '20241471712', 'Ezeozue Chisimdi Anthony', '$2y$10$.Gc0BUm9ePbm5sr8yJVeduqydxEgUT7HkanUzve5d3wo9JyUy.XMi', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1223, '20241478642', 'Ezetoha Chinonso N', '$2y$10$osMfBIFjH7.JwQJBDNUwpu8Q34v7SByNdTaSiT3yMjHed2TslPS7y', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1224, '20241443032', 'Fasinu Sejoro Timothy', '$2y$10$ZDn3BRkl2Ceompu6FPqHkeEeZQABvoqXrJywoWTp/VLJrxf9e3tsW', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1225, '20241457992', 'Ferdinand Samuel obonyano', '$2y$10$3zCA41mOGx3oOTVP8hRSIOK68KBbGY0okc6CEfIOnGe.jVNdrpBIy', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1226, '20241460132', 'Francis Joshua chijioke', '$2y$10$D4xYKxVc9mUyB5M8O86j4eQuFnKqB1umzTlFNgzkGz98YeBWamWna', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1227, '20241495852', 'Godwin Ositadinma Wise', '$2y$10$AGnnfOi3ueVfJHTOlG5hnOmITI9TUcEpJNu37YVrzUswWz83KNaVG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1228, '20241444092', 'Godwin valentine chidera', '$2y$10$BJ/7P/WoP0WOX.vZ8qPhzek1BHhmpmeDyxbzK8kSHUlQbT2EZYh6y', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1229, '20241488972', 'Guman Bengari', '$2y$10$8ZLrcR9Px5Sr0BAmyO3cAeqURgNV7gjqSXBv43g/lYstiTSzNi.yW', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1230, '20241461032', 'Henry Aluka Chukwuemeka', '$2y$10$ziliBNW0pMy7du0b87By.uVzZC01YPErzhJQs6zsJogJKYtLLFWea', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1231, '20241493372', 'Ibe McLloyd', '$2y$10$GJYIpkojaebZuRsSyh0we.ymq4/gPpJynbrIwuj3tgvmi4NA70j5C', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1232, '20241483802', 'Ibeh Precious Chiazokam', '$2y$10$s4fwMVz84rdAjvDwGmg1y.2ZvatP5qNfhxijgAf3tFfQ5a2L911LG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1233, '20241480532', 'Ibekwe David Soromtochukwu', '$2y$10$Q3R3Jl6XcQV/vU3u.0AmMO193cK5Br/zikdeZF08FHP5u6B9zhpkW', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1234, '20241450402', 'Ibezim Chimeremeze Chinedu', '$2y$10$AA5wNNKTvKLLQ5VIfWmAQehwUFqIJvOqKt5QGj4WTE7U6WjPR5.y6', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1235, '20241484912', 'Ideba Chibuzor Benjamin', '$2y$10$YTN9qqWfwxq8XcJhGXavA.cm50wWvIKkS1tZwd3A4CQFpaLInk7ei', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1236, '202440040422DF', 'Idemyor Emmanuella Barisinto', '$2y$10$7WuqnEedZifGdyXHktEH0OX6t0trFs9DbkkfRAnu0H/f0uDIjBE0S', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1237, '20241484732', 'Ifeanyi Emmanuel', '$2y$10$bSfIqr40VF647xp.zRIEduDkkckqyAoWwsvPblewuBiopFMqyVBkW', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1238, '20241460922', 'Ifeanyi Emmanuel chidiebube', '$2y$10$V9V0bQ14RHtHAOPABvmL/uqdrAcbcTlM//W9kyX66QoSKZ71TgIeG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1239, '20241422832', 'Ifeanyichukwu Chidubem Kelly', '$2y$10$mQOAp.6cy3S30eWLa8U2iuAHzyNvhvpMqVbxGpRyCNYGIPYKZJ9bO', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1240, '20241458382', 'Ifekpolugo Alphonsus Ikechukwu', '$2y$10$vUnQf6DE.kHFMeLfa8oOp.4UnqVB/wvrVJeWcKJHP9lBmr2r1HQMq', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1241, '20241459422', 'Igbonekwu Nnamdi valentine', '$2y$10$T2yoXHzVldRn1kU5Z76yi.aVRThfrOztSDSRWeg8D02yn6Q31qMUW', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1242, '20241488732', 'Igwe destiny Ezinne', '$2y$10$5xFT8Rvo4RzrklsyPkWw0eAEHWSOvUyu6jIa3jnVbtJ.bn/wgUEZi', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1243, '20241473392', 'Igwe Nnamdi Okereke', '$2y$10$Vjt8VzSfw7OxXH7O4j26fuNVgvX2JsXkfBkPMMSxDHrg1cWCA6zha', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1244, '20241435922', 'Iheanachor Joseph Chibueze', '$2y$10$d3AT69h5sWHekdq3VE2KVuwBD0lsE6atyzBzkmJkgDDtDW35zWr6S', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1245, '20241467122', 'Ihezuo Somtochukwu fortune', '$2y$10$TyOxaOnU2Q4yM.J1h.8M9eo3GnYLQqQYk6kTwI2vSv3uo6Drg8hti', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1246, '20241487392', 'Ijeoma Augustine Markdera', '$2y$10$MlLUzw3L9EA4qPzpeYiivemAKqyftnMHaF4opezaSVPnUp0276c1m', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1249, '20241460182', 'Ikeh-Ezeji Ifeanyi Henry', '$2y$10$CSoO2Poe11XAGY5/O3tf9.Tssd23leIDLg2CJTTutxbGTS/anwPr2', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1250, '20241458952', 'Ikenna Davidson Chima', '$2y$10$KHRqLkjzrt0Fa3s6ZsR6NurFoOcMekFHsBoF7SIluFNKIJIl24eLG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1251, '20241424632', 'Ikewelugo Helen Chinonye', '$2y$10$l6LkeAoH4STbFlX2wxgrROw/LQx7YlYc1HIfkk.RXWAtZyAT71UiW', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1252, '20241457462', 'Ikoyo-Eweto Efemena Marthins', '$2y$10$ntc0lm4he2Ift1sEhn.No.lKkTd3oBveNPuR5VezZ2Q8KtDzRcRoq', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1253, '20241458992', 'Innocent Marvelous Atebe', '$2y$10$awry2Zw7dBJuUKFQ02mgaetmBlDAJpyl8mnUXa4R/ZCqYs7RKplbS', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1254, '20242490622', 'Innocent Prince Nwachukwu', '$2y$10$zlFCis.9uWjS7VpRNdGWgeh5B7XmZvpGUpaTcxE/XvAr.spEyp95K', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1255, '20241465802', 'Iruke obinna chidiebere', '$2y$10$FSeWbrWiH49xshAs70gUKuHRHeGny38eOmRyO6GEAyEY4MpDJkAVa', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1256, '20241458432', 'Israel Wisdom Akachukwu', '$2y$10$Q65wPIetGYeiLB7rdvsdEev7KXqj8Q2H025GVXEQllNkuYImHrkie', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1257, '20241428212', 'Iyoke goodluck chisom', '$2y$10$QcYznvRSKlUL0ElPNzv4neIWIrjNJv6Ajb.OJehZQgJSApB5PSPEy', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1258, '20241488862', 'James Michael Chinonso', '$2y$10$okaWGXdGDGA.fqD84V/W..ekPuF0bOanu/0R9hti2G5nw/IuWf7aq', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1259, '20241466842', 'James victor nnanna', '$2y$10$zDKMGohN1wtc6sG5S4cCceHJ0c4wbwvOkYbZfmvr41U5QtnIMYbvy', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1260, '20241458462', 'Jikeme Akachukwu Delight', '$2y$10$kCIuSfTy6zCBVOF0m3VQ8.OkpKG/ZKpmNqT0nIyEPcutrDO.Gc.ey', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1261, '20241492972', 'John Innocent Onyedikachi', '$2y$10$qXlrWbi8Fp0jclsioPCy2enr7YiwI1NKZsNWTF4neGudgnvYs1INq', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1262, '20241468432', 'Kalu Favour Ihuoma', '$2y$10$.dq6dVPz9/gFmSYCiqGYvufQva.73kylZL2YqAEeqnYhVfXrIXQyG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1263, '20241482442', 'Kalu john greatness', '$2y$10$T55U8KQNmmjI4fwRYM2PWuxprlixwYOqXEzJZuAPnIGPWKrVf/Rg2', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1264, '20241474772', 'Kama Chima David', '$2y$10$CZvrK8uaZRazEEt1Dxb.suTAKZu/zhKpsF2ton57eLjCKmEdEQMqS', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1265, '20241464292', 'Kelechi prosper ikechukwu', '$2y$10$LCeZcvpnOjcx7VOcqZd/VuuLPpEOAyLk6h9ti.2zocjBMNg5FtD4m', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1266, '20241464492', 'Ken-Okonkwo Chukwudiebube John', '$2y$10$iyEUuEbaqtV/VA2XbpLlZui6xW0RBMRioAK4sj9w8yMll39hf1Pha', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1267, '20242491872', 'King Anointing Uchenna', '$2y$10$.GJM63K01D.ZThkMEzNeSONXXqI6mwDxIskGiB.SEe53Vg3HR5w1i', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1268, '20241426892', 'Leonard Ebuka Joshua ', '$2y$10$LsBo5Wqo3hEE2hSApFW/WO6Zs9UqpyiEwEvtNLTQ/xopTTV8phvwy', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1269, '20241463882', 'Madu Godsent Chidiebere', '$2y$10$pqFoQXdqQ2s2ic3xiWdYP.nnJz.a7s/O5TNPj8PFBz38stxdvG0b.', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1270, '20241478052', 'Maduabuchi Daniel Chidera', '$2y$10$8y95xOOWoiV6CJbnWftxxeZyDfnc8PP53g.6W0YQ82KG2/B4OQK4m', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1271, '20241485352', 'Maduabuchi Excel Chiemelameze', '$2y$10$684g/b1cBjNXkO8tfbscxO1Qs7g2ZyRXa2tLp.QO5SaoYtNe1hL3y', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1272, '20241491952', 'Maduagwu Charles Ifeanyi', '$2y$10$WWOSNgkqAY2PsugnnSJTCOgvZhbXCvkUBYiu2dVb/Sr8rIo5a8gZG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1273, '20241423112', 'Maduagwu Zepheneth .T.', '$2y$10$JwlJol1wfxbo.FvsU0wILu40tI/bEFzSqyJM7M6jyohsGgx6ACcPC', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1274, '20241490742', 'Mark Daniel Kelechi', '$2y$10$GqQ8Yi53bnjCnJpJaIsUQ.VQ4K/.qb7sDhABvNtwpSyQ.Vc2BtGxq', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1275, '20241461232', 'Mark favour Amarachi', '$2y$10$4kDnOV1Rlh6sINMTOgTP0ec./VHwarLNryVicAyFpDMu3deVVaZXq', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1276, '20241450852', 'Martins Precious Chikodi', '$2y$10$27d2rTHn6tiO0JNgVMw71Ov0U63W8gyWLPzvCw3Xco5r1CwqwNVI6', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1277, '20241473422', 'Mbah Joshua Makuachukwu', '$2y$10$zuZjv0GMQyILdmGhvODcQOsuF1WDJgmxWpxUfM0K3rFoA/8sd5uVa', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1278, '20241481112', 'Mbaukwu Somtochukwu Great', '$2y$10$.YMJRvydmAeGabh97elLdutpwho68S9FAwYfdcibYuChg3BRnAsDG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1279, '20241463672', 'Mbudimma Chris-Santus', '$2y$10$aguPkZ9xmacisOaCKG7fz.VaMOAAJWTN5WPdcXI4rAVo4MzDDRA3a', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1280, '20241469552', 'Megwa Courage C', '$2y$10$26Rx9HYPgYiPrDAPRSyaJuV4JiQ0aYisahLFdvQaOZdpRHe3S3.0q', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1281, '20241478622', 'Mekibe Dennis Jude', '$2y$10$K3xWHym9ky/OTZOl73EXq.afn1Rox8QMFtyUwleUchKYjpFfS4HH6', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1282, '20241480352', 'Nathaniel Louis Victor chibuenyim', '$2y$10$AVmhPKun7WVzcxXzSfXj0OHhet0tla7TP66ndLmKoVmq2LduG4Fam', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1283, '20241469192', 'Ndubuisi Divine Chiagoziem', '$2y$10$ttNIcLPN1mkPW6rKtCD4Bec3UFuUuOAVPkCLuPtBQxU6wtVw/e5Ym', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1285, '20241460752', 'Njoku Ikechukwu Mark', '$2y$10$3Kwx9ZK8IoSEbcuKcyQ.7uforIK6tuz0HgssT4Z3Im.i2.bjrcjj6', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1286, '20241426592', 'Nkemdirim Desmond ikechukwu', '$2y$10$k39dS.Ubd.NSzd90s79vTuQyJKKgxfzYpdF.ybw95D1pgk5oRMpLC', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1287, '20241437092', 'Nnaji Emmanuel obinna', '$2y$10$vehSy4ZlokxGQYvFyPmHXO9DlXnjxCrytG0dFm.xv/hTLesV8XrQS', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1288, '20241489502', 'Nnajiuba Divine Chukwuemeka', '$2y$10$FldOaHlvhLxHM.sYL7tcMuzJ.R5y/CVZhhbwj0NcE7ABwwdDs67FW', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1289, '20241468452', 'Nnani Joshua Ikeka', '$2y$10$qA6u/RGi8lFx3KibjxMcb.nZXFuLPzfTyV9iLpKoDVHDvc2cjoM5K', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1290, '20241462582', 'Nnawuihe Victor onyeka', '$2y$10$VB2fGoF2v8bvUS31CTlvXOYp0N.eNbnaIxcgVKCzgtS4Bdm2IcpEu', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1291, '20241442732', 'Nneli Uchechukwu Emmanuel', '$2y$10$HVIGr64QolBNknJtNJK9GecYSRM8ZfiXjkKSHNLWJdi12/Al5oQbi', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1292, '20241460802', 'Nshiowo Chidiogo David', '$2y$10$7/Pt0CmX7P9UejCTwthEFuaq3mY7h9ekcFtIz8XA2LzRDZRSH0wTu', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1293, '20241469392', 'Nwabueze Prince C', '$2y$10$zQPu15T8WylbhyRugitiY.1VMDN6LPhi2zoOrEJFD1BwZcHw1XbnS', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1294, '20241479732', 'Nwachukwu chinonye jane', '$2y$10$F1ZwDLuPTAs4v.Zy2vfamu90g5/rqZkmONVxBSbmzrELIehxbVtP.', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1295, '20241423722', 'Nwachukwu Emmanuel Chinedum', '$2y$10$NHe3oU8OnwhPEkkeaTjgBuLWyNvEBwKkdTbBorsC.Vzg9G0nEkcNW', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1296, '20241481972', 'Nwachukwu Emmanuel okechukwu', '$2y$10$7vhG1MWyJwlg29q8a285yOK2ApXLdMPZNSPTL7f6OslT02i8ctkEa', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1297, '20241474992', 'Nwachukwu uchechi favour', '$2y$10$vH3Y21Kb18K02LX8A2a6V.BkzxluJaVkL9Xr1Ch8qf.qSP2UQm2cS', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1298, '20241438912', 'Nwaefunamba Deborah Chinenyenwa', '$2y$10$W9GL7JkF2iQYtSYabEBfcOqesPjK2UdxaimqKYsADYp7BYHMsy/JO', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1299, '20241427272', 'Nwaigwe Chioma melody', '$2y$10$XMC5gGfgwl.enpIGzV9Aiey9mAtY8IEgp/3KFNu13lZCUkTPfKziW', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1300, '20241470752', 'Nwaiwu-chima Rejoice Chinenyenwa', '$2y$10$.LgWgi/oAf.XbB2RVjtXqeHkEBRMaGNL10Q5S42w51urYVnlinMlq', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1301, '20241443962', 'Nwajichukwu blessing nmesomachi', '$2y$10$/sI089Sd.QZ1IeJfKrYVXeFd8Gdqhu5.RvieEXltiJeXtmO7Q7VmK', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1302, '20241465552', 'Nwalima kluivert chidiebube', '$2y$10$SdC04rHAS31Nt3f1LqUZm.UJWDWCt2WzAjuirgS.hrbTRLjVWjeNe', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1303, '20241460222', 'Nwaneri Ugochi Laura', '$2y$10$7WmpuIIAcX0UEHMlWQ2sC.c5aCn4B6OXEWR0ZjdhTfMu/UUfTNzt6', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1304, '20241423692', 'Nwankpa jidechukwu ', '$2y$10$5qYoMlueUvXl/KVF6XLuM.TdWrsa9bNIHzeH1GR4Qom6dIEviaGme', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1305, '20241483322', 'Nwankwo Mary chiagoziem', '$2y$10$SYa5RKDoJVO.Ccq7gDYmXOnwfOaYRfB9ZKBf7vDSjWHmLnbGUwno6', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1306, '20241467082', 'Nwanna Chibuikem Joseph', '$2y$10$ptKRzpIpsThVUgMDGYgELu5jl.zy6e6uP3SmRvBQkHyUJ3UXuDRMC', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1307, '20242491612', 'Nwaorgu christabel Chinaememma', '$2y$10$4p46Bcb.TF9he2kolvxbvund0NhybSJhAlO97uT/mtPVseoNvqpm6', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1308, '20241434152', 'Nweke Omasirichi Sonia', '$2y$10$FZ7kaC6CJupLiXN05xX87extu4QIOZqYI0aJ9XYmksFL3SENRNW6O', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1309, '20241487332', 'Nwigbo Emmanuel Chinonso', '$2y$10$ErCmFk1DEwtD/JS2KU7KiOr0p5miMUWc2PC4m1NAlNb6BpG0wkpdm', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1310, '20241468212', 'Nwode Arinze Joshua', '$2y$10$3q2Zl/oaLA0OWJLpiDwhn.Nm8HrVvpvYh8iyeHIh.efkN3fc3BpSe', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1311, '20241476272', 'Nwoha Chinedu Stephen', '$2y$10$UlZ9g7c27kDz89WrHALDVe1A.5Tbob.nOQ2fpebm4P6TGF0yS72b2', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1312, '20241488262', 'Nwokike Favour Ifeanyichukwu', '$2y$10$7CXYTAKPW8CaIs4YKUILVOEO8/bWK/1eIF2SF70aSV1oblZcud7qe', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1313, '20241472002', 'Nworgu chijioke god\'spower', '$2y$10$hfplUmjI7XVKFySo4j6mke6HvYnYlH10./MKWgFhfsJ7aIpctNvM2', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1314, '20241462442', 'Nwosu Collins Uzochukwu', '$2y$10$u..OaTob4YrF9PRDP7t7uOosOF6yo2qZaTwDAR0wo/a4rwQ/FxNMq', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1315, '20241475682', 'Nze Chinazaekpele Eunice.C.', '$2y$10$.ljcLEdO4EpY63bVoYdfw.4/BNyeD0.4ULSMqz0XUK8UAIQtKFznG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1316, '20241448942', 'Nzekwe Chukwuma Paul', '$2y$10$sa9p8J9uyxNPjTciAeFY.e936oiNvu1q2EGY1P7XWKJVUFwiSxV5.', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1317, '', 'Nzemechi Nicole Chinaza', '$2y$10$8l/PeoRoQBRNJMbsFVWXUuVlHpqg01jiD3A5CZkV2i1jhZSjbklh.', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1318, '20241486662', 'Nzubechukwu Oranuka', '$2y$10$Iq9knjksulA5fLYtXfvEhuI5B6EScvCqVHybhq.1bCjNNzheCvFBe', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1319, '20241449442', 'Obeta chukwualuka David', '$2y$10$QuwVpMnuLCS3pPBArz7VHuCn4np2rcZcukAACnayf5gZkldvQgDbG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1320, '20241440552', 'Obi-Unoji Yvonne Chigozirim', '$2y$10$Qv/YF3ggdx2Im4LC0pLFhOjs8dn8Z8LMyxrxPLBRwQ8sVIB/iH1dy', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1321, '20241473822', 'Obiajulu Chinemerem Daniel', '$2y$10$XefKpd911AfVf.BT340fjOZq.0XWk22qO8uddWHovIbaKujo6vdya', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1322, '20241466642', 'Obidiaso Somto Christian', '$2y$10$G/j1oM6CoH0PkwFIi7emIOdSX/LxkFSOTeVP0v2eeoZemSD0H9My6', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1323, '20241484502', 'Obika Bless Chinedum', '$2y$10$mUa2k3ZTPF5D8t0T7/KEJe9yV9Qqb3BarfCxFwOaif6fWbHbsIq0q', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1324, '20241427672', 'Obika Ifeanyi Vincent ', '$2y$10$f0N0JSZwdh7dDkd.NlPAnOt70xh5w2/jtHZ.bIWwEUo/lEw22tT5S', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1325, '20241495122', 'Obilo Kenneth Chibuike', '$2y$10$lFHsdwMXunkPXEplgeIXsuxPFE/SZ3s/lAQmEODFORyZIy9nlOfzO', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1326, '20241488142', 'Obisike chigozie Joseph', '$2y$10$IFB1HHPLpZhqe5I39Q.mMum8rJjy4eGlUdBvLbPfS1U8/KVFSwaiW', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1327, '202440151880BF', 'Obodo Uchechukwu C', '$2y$10$x5iTq2bmVVuuMTNUhKVU3.GxAzBqviTiAyJTjJsC4/.gEK/8GPg/.', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1328, '20241463222', 'Ofoegbu Michael chinedu', '$2y$10$lVaLhNflgQ2L4jMKApIv..aF.fvLGAUVrt5sVoYxCf.bXQpLedVti', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1329, '20241463962', 'Ogbonna-okafor Gift Nmeri', '$2y$10$7/TLz2uswDMfhOHdqEj3DeQ4d1tgPJRpXG13F.WP5fnMtKu26eY9C', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1330, '20241437622', 'Ohakwe Patrick nzubechi', '$2y$10$Pf4givdv6OOd.7Ua8DQ2QOF45Udrxz8x0sqbalp7RRIu1TxD4NdXi', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1331, '20241475872', 'Ojukwu Chinonso', '$2y$10$xuK4driWvgK3tr2X.2NTz.zPEZ8bqcONu0/Cx1mPytcj3w1x2mog6', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1332, '20241430712', 'Okechukwu Favour Chinwoke', '$2y$10$RYv9/F9s1YlAPC9CGc25u.UXWfHZ2.SDAbBmr8GJ0dH5j1C.CHOQC', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1333, '20241476712', 'Okeke Tobenna Victor', '$2y$10$y6dlFkP9pNkmrDt/PhrduuIGiRP1hDNjH0LAoE.abUeDd6NtmE5Q.', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1334, '20241491012', 'Okon ThankGod Chimidi', '$2y$10$hePzj/mO3xbfEv8YwZIhz.M90I3emjW6xxs3lo/3rMrdv64edWdgO', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1335, '20241450252', 'Okonkwo Johnbosco Uchenna', '$2y$10$UR9CXe7Fj1rALVCaut.K3.VNgC72CJwB7wz673ZnX/vXdB0sST13m', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1336, '20241464052', 'Okorie ezinne Florence', '$2y$10$DDf5EWZ3OVambd11gsOBju3yLkeq9nVQjQ/6Gs.uab5OGV7c9khIm', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1337, '20241479622', 'Okorie Kamsiyochukwu Peculiar', '$2y$10$3bqUq.O2aVAemUxsikRO9.9H3xCJBPZhsfKCOMyjRGxl5wfeVYQ2i', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1338, '20241473972', 'Okoro Anthony Martins', '$2y$10$tkRM8jK6rqCUFnR9tZrO5O8ohkpu6qR.hqhXG2Atcgw.XPuR2OvxC', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1339, '20241458362', 'Okoro Eddy Emeka', '$2y$10$T7hP1n9hvp7bjBTCmiJ6uOQMJae4BoOu3zTWezGwLMoyKEtU2HV96', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1340, '20241431482', 'Okorocha prosper chimezie', '$2y$10$Md50h8sYr0m6DS2LvLcXHe7owsZ.RsrzD2B6VdHNTbBkHonZ9EVdG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1341, '20241447822', 'Okwunwanne Ekenechukwu Levi', '$2y$10$Qzvao25h4JESBOqfMke90.CwSDQOgkPlId2loV1FukYY3jBSY1g3.', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1342, '20241480512', 'Oluigbo Mmesomachukwu Elina', '$2y$10$k0GPsZSZpldpTkpvZVJePOYpnoLXmUznpK6zAusER6BPl2XgMrCKK', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1343, '20241465512', 'Omah Favour chinonso', '$2y$10$OSXoKZex2w8FVVD8axsm0O.3g85QuCS9c/stIWcVBxjC8LPLUoeZS', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1344, '20241438142', 'Omeire Joy Chimamanda', '$2y$10$pcsZhKeQ1XN57Yi2s.GUB.w/6ZGC5DMukApuRs98Otgnzg0Vi2KWa', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1345, '20241483672', 'Onah Mcfred Ebuka', '$2y$10$D1jeTGn1xrLLALI1PF2ktOglGbexrtg/NsqtaarYaPr7cjcvLKtxe', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1346, '20241493182', 'Onoh Favour Mmesoma', '$2y$10$BhiCHMq0LB2HWpGd3Q7cTOTz4.KHNodQu6g01dF3Q22d1JuVtZafa', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1347, '20244146992', 'Ononaku Vivian ifechukwu', '$2y$10$z4MXLRaH/ii32iilqhu5xeWYoFhKfXdnNtMhrFavkiRNRVgW2Hhqm', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1348, '20241489822', 'Ononiwu David S', '$2y$10$bKkyz472ChyoHMd5YKJVDudrnpUAuNUekifl7CBri1OEf8bCxeeoS', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1349, '20241465672', 'Onu Theresa Chioma', '$2y$10$Nes42oI8Vbm.A.Lvltbib.ewKDMbaTYGH5eDlsCid5ND4Yu71S/Wm', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1350, '20241470502', 'Onuoha David Ndukwe', '$2y$10$AclTbKNeRpj.1skLSHdK4eC77.RYhA.mjdFWAlEEW1HV9/Dc4JTTW', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1351, '20241487992', 'Onuoha Preston Ugochukwu', '$2y$10$VKNxFjwGL217uX8wTEfdCe6o5/loitaXl4mXUqzJxQoI5/EGkZo7W', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1352, '20241459922', 'Onwumah Charles Ifeanyichukwu', '$2y$10$3cowoNL90mgnHyNp52q7Ueqk989nN50ePMNW9m/4vIMbwQGA4F1au', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1353, '20241447042', 'Onyebuenyi Ekeoma Tobenna', '$2y$10$9V4D2N0l44nFmNxP7UotpubyZ.tQ7/0fB3X/.l37Mqf4cfUH3PneC', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1354, '202441920710IA', 'Onyeka Somotochukwu Stephen', '$2y$10$BfwmaiAnl6l5WRtI.y2MSu4eW7lJBqqcLh6YX8555bWw9hxha6swy', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1355, '20241492442', 'Onyekachi ThankGod A', '$2y$10$t0A7UlsK2Vd.f.lciNKVzOpZaTH35jxwodH25/ngwvKU9zS7thCXe', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1356, '20241468002', 'Onyekachi Williams Onyekachi', '$2y$10$0U0cwEeFZvie3fqHibD8zOTqO6iAyZo8VQs50hQaOX3RhzQQVOuJq', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1357, '20241423422', 'Onyelucheya Samuel U', '$2y$10$FwEg7SKh9NSB5VGCZwH.ye43nOIvMRZ0OXsxES98ifqFqj2BOYk82', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1358, '202441940429JF', 'Oparaji David Chidozie', '$2y$10$3DLWgwsXxQmV5z/TD3n8LuKmnuhGJk0uF7UnqjPBC2IwwOoFPu2Uy', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1359, '20241464332', 'Oraegbuna Emmanuella Chioma', '$2y$10$gqWxjjyxVGS4U0VDyuX6f.wqHMdZed8xajoQCi1ii3kjc6P../wIK', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1360, '20241486042', 'Orakwue chidubem David', '$2y$10$oVKoRsXgA3wqRtR3UDmef./I3dDSyY3QV2/U70mwQOLaJT/kSz19i', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1361, '20241492172', 'Orbashi-Okeoma S. F', '$2y$10$TAeuMf.GFtPy6eETTqedq.zZYalNQRHANn/nbZ5zto3bskXo/ATAK', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1362, '20241489992', 'Orji Emmanuel Mba', '$2y$10$kya1V7z4yzv77MwX0.abSuYPzbvbs9mt7QwH6JTiOJTwjW.dixpyG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1363, '20241469682', 'Orjiegbulam somtochi fortune', '$2y$10$nVd0pMORonndSvebI9rouON/cFAXBPtIDPVv42N41Mlo9aM/E9Sbm', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1364, '20241473372', 'Orodo Benedict Uchechukwu', '$2y$10$VsayFLZkwUFR8d.BLPRsGeXRMc4drBuNnBY/AkYrc.e6xm/GL4zQe', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1365, '20241464702', 'Orueze Kosisochukwu Amos', '$2y$10$EVGR9VEXDIvlCSr4unew/eXkRatazoLUHgAba9CWW6CC7XOuWuPY6', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1366, '20241469852', 'Orumade Justice Chinonso', '$2y$10$1hf144EwyTNISTitSPzKku56OxFX/tbih8B2Ul1xJezxDxhYNkalO', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1367, '20241474202', 'Osizigbo Franklyn Chigozie', '$2y$10$0BjeTapxCbdXTRjW9y4pL.ejZgTGR.8rfWvkqngAG3316nwLdeFlq', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1368, '20242495322', 'Osondu Chidera Stephanie ', '$2y$10$Tq7jcMI5qA/YiIdee.8yqubT10wNAytjfWwFzrZX4meu.DTen1wCa', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1369, '20241482352', 'Osondu Lucky Ebubechukwu', '$2y$10$TfajisE79uIosHkm5MnLQ.FptbLAaplB2IJOpUG/wiWN5AEA.I7B2', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1370, '20241491252', 'Ossy Henry Ebube', '$2y$10$MzvDWtj5VXYqLgA2XLc8h.VPl9BE6xR6pm2eGnNzF9uIZmgN6sw8O', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1371, '20241486982', 'Osude Chisom Bonaventure', '$2y$10$w3fpafALVD9pT818wXRMveeNeBElREokFzx5U5f1bB83M15cKK6Dy', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1372, '20241464372', 'Osuji Oscar Ihechimmere', '$2y$10$HkCNg752iO3B5eq/JZ/v8.Zp0yPDbuWxt6wP0fj2x3Fh32XB1Y7EO', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1373, '20241483652', 'Oti Chidozie Prince Solomon', '$2y$10$NPBhGFZI5L419FjlQj/utOjRdQXBAkYcgYMa2MRC6ArLiKp8fA2xe', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1374, '20241479832', 'Otti Chima Godswilll', '$2y$10$PQY.TiimmsSbskZzX6wbZeLqoih36EFQPNSdsGntum1bkT5kjRw4y', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1375, '20241477812', 'Otubah Francis Tikuochukwu', '$2y$10$3NL5egLlvN.c4pVL94cwI.K64VhJKycxu0xJrDRkpwtTagVQVgVI6', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1376, '20241477932', 'Ovuo Emmanuel Nzubechi', '$2y$10$lYa8NX/s.51jX2ZXNa7BjujmfzQNb/y5buKgaJHUN7tHd/p82klei', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1377, '20241458232', 'Paschal Success Chimnonso', '$2y$10$x0d26MVQNXtCkZezgzQY.uIg.2.0bKABJMB4GJAuGorAzQPBORmWu', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1378, '20241487512', 'Peters-Joshua Ubaabata', '$2y$10$qfyYqkv20mcmxO/oyIAc/.g9DRf2Oj.g2SJsN9z4.Vc/KPMVLR/hW', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1379, '20241480622', 'Pius Excellent chidiebube', '$2y$10$g4peByMQ4yR2zCAARId2M.uA.fvDLGmHe62GBRtXjOQF9YjymRoWK', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1380, '20241463302', 'Raphael Testimony Chukwubuikem', '$2y$10$myTLOBMNjGevd2Po4pQHv.vvUnudeTwynDfmomqjV2Kd4Ks4ozn0K', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1381, '20241477352', 'Rockwell Williams Stephen-Ijeoma ', '$2y$10$VX6wkSQ.82Q7eCqbFnft2./8CaSn3rUiJTmWUmjLpzOFLAN9kkY/i', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1382, '20241469492', 'Rowland-Njoku Franklin Chukwuemeka', '$2y$10$ddHoDwK1avUR.GnMSUv23ekHdvyN6gASfRM/iSRpVzDCJ/J91P9Pq', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1383, '20241489472', 'Rufus Emmanuel Chukwubuikem', '$2y$10$Xm6CBwuOuyO0bKMu7k/Jdu0DxQfRvV5F3mwLazI.w/lPfXKxbbN7a', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1384, '20241430922', 'Sam-ejiba blessed Chinweotito', '$2y$10$ngJlVtAg1e9wNkMf5zOZFen34HFMXQMWbt2.s3Ov6VvW5eWCAyqlm', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1385, '20241426992', 'Samuel Egburonu Wisdom', '$2y$10$L0SHp49lRScmvQbEhQRI2ukEZuZcZT1a7QXYpztOwYZOK0Z731EiG', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1386, '20241453792', 'Soroibe promise nkwachi', '$2y$10$7fEfdqMInXWZKYlztXNlRO.C.jFQXUVrineyDFGti6bHtqVqkeREa', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1387, '20241472142', 'Steve Joshua Chinedum', '$2y$10$v57Zar8xe1UzsUBjH538GuoBNAGcMDXreQ/mJt8oDKffTZnFQE.ey', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1388, '20241476622', 'Ubaka Marvellous C', '$2y$10$TwrPvnhkdk7IMpZ8hcej7.dqvegTRqN.NKuMpn84mzkrwerO9b7s6', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1389, '20241485742', 'Uchagu Ikenna Anthony', '$2y$10$DL6MpEVdl/SZXRosGUaySuNFqb3EtBU7CfjbOr6pQl5sjgDsoqUbC', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1390, '20241434682', 'Uche Chizaram Goodness', '$2y$10$DmvZsQeUJIZrrSkjmXBaGOXOqgRJaZE4WYRb6zkr1CES2BSOWqjve', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1391, '20241457972', 'Uchendu-onu Samuel M', '$2y$10$T02HJVYNlKiFPbDosvyStOG8YlqDWhE855ktzBPFj1zEYobXa4EcK', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1392, '20241483742', 'Uchendu-onyema somtochukwu Daniel', '$2y$10$WI8HyI6QdNaPQhr3AQH7AuDTiFp7nAdzyoYXTag7b3rOFx2g8QTnS', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1393, '20241465572', 'Udalor Frank ebube', '$2y$10$276zGbix3Rp9Q.IpOe8fi.dy3.jkW1.DbMJUQeU/f6OrdLnRyNRZ.', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1394, '20241486252', 'Udeala David Chidozie ', '$2y$10$hPtuidBBDaPrGjCP/iVXTOn86qXa0PLkTnyEK5cH10Ss8P9bEBhoi', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1395, '20241463782', 'Udeh Daniel Tobechi', '$2y$10$2q8oQph6ULeGnIc5WlIEO.X2JycyoKOYBRprbqIMsgkmlkjB488xi', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1396, '20241466632', 'Udogu Chiamaka Favour', '$2y$10$Q38xMsqHuZjxPBvv8ltisuX0R6MmWxOCpX4bN/QIREiZfANcurjcK', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1397, '20241428052', 'Udonsi Kelechi Nelson', '$2y$10$6sNzSpV6.CvHYh8kikZLm.8jD3X1q0vxY1LAHSlzx0ROiq3Js5hGO', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1398, '20241467292', 'Ugwo peace chinecherem', '$2y$10$mrwenK5PRygTsqv5ghcx4.UFq6zZ0sQlYcLDI2tNlyQwVubDN5Dxa', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1399, '20241477712', 'Ugwu Chiamaka Comfort', '$2y$10$l.nHJ14cPqoZsemlHGIC0ux4c92N7ZvaITXD8Eg.HWJm9IhyROtOW', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1400, '20241464612', 'Ugwuegbu Prosper Nwachinemerem', '$2y$10$6tF3prHvTGydiGuK4UUwf.iIPqzlE0FKIBViFcm8lApLNvhOet/FC', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1401, '20241464102', 'Ukachukwu Chibunkem Franklin', '$2y$10$xe24PiMrp6rr.RXEOq6GU.5OFfst5c.gOl7yHGkhnnqZU7A29RnF2', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1402, '20241473472', 'Ukachukwu Destiny Chimuanya', '$2y$10$Vsi78fUjOos7qVSD1WjVUeUymgHrYpMO3JRS09woew4oIj0aOcSo6', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1403, '20241455462', 'Ukaegbu chinedu samuel', '$2y$10$PEEJtvrivs/LzEuI3mbxxeOK74e2J6K6tB3ByWK844POxRchRvNKW', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1404, '20241490782', 'Ukoh Daniel Ifeanyichukwu', '$2y$10$cIpFaj8oks45BbJYI2YbJuXSvSKk.RgJ.gbNxQGp.ItNUiHMYPBuq', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1405, '20241486562', 'Ukwunna JohnPaul U', '$2y$10$x3LR6p5OWj8qVfW0Nr.AZemjNT5mm.GUd9qMEeK7zwPUdwjEJ/iiW', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1406, '20241453912', 'Ulor Chiemerie Anthony', '$2y$10$HDkZEtqd56z6/iKj5Q/jEu8p9NbqwVswKDsUkPoPg742LjW2kIZVS', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1407, '20241432532', 'Umeugokwe Obinna Casmir', '$2y$10$JEhqwprjBmMiaHUdM5LRf.yRijsLUlxjDbX2WZNgCOr3K5uH/xrp2', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1408, '20241464622', 'Umukoro Ebruphiyor Peter', '$2y$10$z84T6UBQ56MsaRdZEXc7KO0a/G2/4Ddyj3PMU7F2sgs37OEkmI95K', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1409, '20241463542', 'Uwandu Ezra Ngozichukwuka', '$2y$10$gWHkJRU37lbiiYRofyn5suOmmFO.WD5Y62k0YKSe81glz1JJQp0VW', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1410, '20241467682', 'Uwaoma Lorraine Chisom', '$2y$10$vLnBN7soLBYQff0Jcxc9/O9iiSv9uo1DXXvxVnLV75atlxLtcciZm', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1411, '20241446852', 'Uzoho Gregory Ifeanyi', '$2y$10$55Eronk5AhUte0x4e2kbh.rayCg3HVZrk3zh4d/8yR.EoVlJicwEO', '100 LEVEL', 'INFORMATION TECHNOLOGY'),
(1412, '20231412082', 'ADIOLE CHINAZA ROSE', '$2y$10$t1j9u4yOyFk30fcPctA5KuOLeQNZAPaAzomElL4V8qe4GnmOUW1Ii', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1413, '20231387742', 'AGBASIERE FRANCIS CHIMAROKE', '$2y$10$bqF7HNl/5QcD3ghqafNLb.eMvZzC5VYJK6oxrJmBNQKviJcm.WXZS', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1414, '20231409552', 'AGU CHIGOZIE DANIEL', '$2y$10$Z8EyTYB1.oR3fSMhkn9t2eWGtbTP.p8FG5/DEv0bEnStixIfU1Inq', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1415, '20231414082', 'AGU CHUKWUMA EMMANUEL', '$2y$10$SkVOA4FFeK8ozKrcMcSQme01e75T6IS0rs8L.9d/NjE.Z87zilvwm', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1416, '20231393622', 'AGWARAONYE CHIZARAM VIVIAN', '$2y$10$e6wXPFyJrduoSM9Wv.fty.gJ6rjIHORAS9YzylBOc/5TcM4JN/iCy', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1417, '20231403862', 'AHAMEFULA BEST CHIDERA', '$2y$10$bBwq/SEiVPASLA2XYz/VLOgpeAIzln7mdk90HwngxWd5k7Wp4UQTO', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1418, '20231397182', 'AJA-OKIKE DANIEL CHIMEZIRIM', '$2y$10$ITW7tyX.XPKkq8PEF.8/tuCPCuRfCDqsV8vkMGqhA9f4u.bponp72', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1419, '20231403102', 'AJUKA OKECHUKWU WISDOM', '$2y$10$Xt7GNfSDLxqaTBQPN5y4ouKeS44ofrw8PW1X9kNEehVyhr2qiZpaW', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1420, '20231392462', 'AKUDINOBI CHIEMERIE SAMUEL', '$2y$10$Nrbv67lveX1Yv4f9.D45c.rNLweJEMmDIi29lciLH5nXpqYeODin.', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1421, '20231410642', 'ALBERT LILY CHINEMEREM', '$2y$10$CMO2r5raUKIGcAvTHw.TlOmS9R/KH9zrVzl280/h0yQPYHDEiYrwy', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1422, '20231392562', 'AMA-ABASI ABASIANYANGA DANIEL', '$2y$10$C3QyCCsYC7TobHvl7MvpK.680F2hU/h75ZsnMvwP5FAxclYqCGyjG', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1423, '20231407392', 'AMADI JOEL CHIZITERE', '$2y$10$PqJtfsOdOddg0EGgP769K.pqtWBTg5yKc51gz6QBNYI6tDTOrh3zi', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1424, '20231412462', 'AMAEFULE CHIEBUKA VICTOR', '$2y$10$xF/t3r.QgTRlwUHfaGdR9eypCz45VsLjMV08pc29/HSWAkYbC19RC', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1425, '20231392012', 'AMANDIKWA CHUKWUEMEKA ZIDON', '$2y$10$1bNMT3faNm6D97gWj2om8.X4qzXtEimbrdFcg7LyNN4iQHnWPFyfi', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1426, '20231379962', 'ANOKWURU CLINTON HUGHES', '$2y$10$CD0cUgaXBwykeP9Uj5BhUOYDIF6c6L5cqRDgPToEtJWocSs3h6IcW', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1427, '20231389612', 'ANOKWURU EZE RICHMOND', '$2y$10$M0BE4w3P2290LO8L6Nb1BOB7C4pTh.OZhH0wLk9WS/2KPPopl2Ovm', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1428, '20231384382', 'ANOKWURU FAVOUR CHIDERA', '$2y$10$jIyKoSqixHZnyoG1GboY5ONcVKzlWcKCnaiNlTn1PQ6jBTyeoBMuW', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1429, '20231417262', 'ANUCHI CHIBUIKEM VICTOR', '$2y$10$kK4Rc65qO.r9c9EaR1Cnc.hJ.gDdsGtrIB3WUlVJH2CaUY9cDR3d.', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1430, '20231387552', 'ANUNOBI BENJAMIN CHIJIOKE', '$2y$10$cIPuUv8IOpJSf6pXV3fZZeXcQPDaLH66Vi2Oj0F52mh8vnUQF9Lvq', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1431, '20231377632\r', 'ANYADIUBA  ANGEL DIVINE', '$2y$10$S5fOv4EgVHOmeOG.A5ocX.Z31cy0eIfGW2OYOumU3DM3xV41cj/Em', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1432, '20231398582', 'ANYAIBE FRANCIS ONYEDIKACHI', '$2y$10$5JX6rFLC7Wd2CuCXbJoorOSST7KQqGzr/GdcRHnLVU/0IX27hderm', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1433, '20231380322', 'ARHUERAKPO OLIVET OGHENEVURIRI', '$2y$10$PeFs7E78LHo7DeJb7apuoOxHPCxLSiKk8v2ZuF69nLvPkoBIETivq', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1434, '20231394232', 'ARINZE MITCHELL ISIOMA', '$2y$10$KRUJ1eJFuTTxDBaYOerIPeACMrJXnU.PQ3X6V2X5Cbhargq8nABU.', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1435, '20231400372', 'ASHIEGBU ELVIS CHIBUEZE', '$2y$10$sThHG2bgNjel55lCSuM1peT0Ps4QiXWe./YVgaotDpAO09XvQp3sK', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1436, '20231407362', 'AWURUIBE CHIBUIKE MARTINS', '$2y$10$8dbaBmA0i.iv1W6L367mX.SNWG8gv.6P9WtMTqklR9qnGDViQdNgu', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1437, '20231372052', 'AZUBIKE DIVINE IKENNA', '$2y$10$7WIlHemRwLYI1VfuUo4m6efnwlIFC3c76Fq37zqBFR6lXkU/rLo0.', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1438, '20231395792', 'BABALOLA SHOLA', '$2y$10$ZbTuNvoLrGnY1I6aK7h3M.aTALL8y4Cfeoc.0rN2cjUToitan3fgy', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1439, '20231383442', 'BAYEM CHINAZA REINHARD', '$2y$10$TEYz92oaE8S4sI.pPguiOez.Ij5EIpXneaTSksDESdmdFF7wmo45O', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1440, '20231373042', 'BEBIEM JOSEPH OBI', '$2y$10$J4mXarfWUGXm3uX752o6BuzORf/DWBnxfPgtCpkjVEiLQTjltSHuW', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1441, '20231376792', 'BENJAMIN CHINONSO CORNELIUS', '$2y$10$xmLlUl.C6ctVetQYc7ZRHObqbJX7ifUp0.fDleOGcAx0XO495v8Ke', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1442, '20231377722', 'CHARLES-OKOLI FAVOUR', '$2y$10$UaacYIgbCmBqOoW/WV8.e.Jm6Q9QkoBDCHRmjLcCEWijcUBZRGis2', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1443, '20231410922', 'CHIBUEZE SOMTOCHUKWU STEPHEN', '$2y$10$3KM3cDwOS7.jEZ1lqgApkOm7pkl3F1DHf1.MEGSoCduKF9FtBxJ8O', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1444, '20231394952', 'CHICKA CHIKAMNSO CHARLES', '$2y$10$j1qu.x.DCyUqs4wkRwOb4.gxzdKbiDjmbn0uimwNmYJBSQBx.aseS', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1445, '20231376282', 'CHIDIEBERE SUNDAY CHIMA', '$2y$10$z02qodupGHi9WDShtCWIS.Ns4Y4AcdhcS5lmZ33aPlp0QVyxmp53q', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1446, '20231414362', 'CHIGERE EVARISTUS NZUBECHUKWU', '$2y$10$TV4zYQjL2g6Ulsf75lS51eovIAXmdCBpJyNQ3fPWP2NTvb0zvsa4O', '200 LEVEL', 'INFORMATION TECHNOLOGY');
INSERT INTO `users` (`id`, `matric`, `name`, `password`, `level`, `department`) VALUES
(1447, '20231404612', 'CHIKEZIE CHIMEREMEZENWA GODWIN', '$2y$10$kYqWEy91OPx4h9mvCDOeDuaR8nFtfWQTzk9iPKGUd10uxTDXfv9oy', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1448, '20231365882', 'CHIMA - JAMES CHUKUEBUKA DIVINE', '$2y$10$kknyiBOZQa8U3JWwbxmL8uC9G22giCTCzOdqhW5tCWZWMltkxArv6', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1449, '20231392782', 'CHIMAEZE CHUKWUEMEKA VICTOR', '$2y$10$JoGqyHXjVV0JLCUxbL6LyOo3uAVcCY4xlxO0QrrWu0Pk.q56L9u0i', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1450, '20231414722', 'CHIMELUMEZE WEALTH CHINEDU', '$2y$10$Ba8fD7OtlhSIZZciqOykgOUnuw97GXxaFahwLsV5H49eI.I1cd35y', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1451, '20231373132', 'CHIMEZIE CHIMAOBI VICTOR', '$2y$10$2ytYLPPjWoLGOIPpgHjK2e9Juck/WyllVuGsvYcawm4CQCWSqgasS', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1452, '20231418372', 'CHINEDU DAVID SOMADINA', '$2y$10$0UgW0HC8ZjaeBDEHr1syte8RrjdB.2Pj8yxwtyiOfR2GdXf7myW1K', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1453, '20231378532', 'CHINWEZE NKEMAKOLAM ONYEKACHI', '$2y$10$2GYDUztQ8gkbiW6Vi.JxxuKupv5uhFWmp0ppUbatQmX8Df7OftuT.', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1454, '20231407622', 'CHUKWU OLUEBUBE MICHEAL', '$2y$10$zJ.tKDI6osNwykoJZTRW0OJsMMhzvbxx5dVdVJylWiHqo1Tx2Hs1K', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1455, '20231369902', 'CHUKWUEMEKA WISDOM', '$2y$10$rjvZxzlE1tTCD.lAIJAHNewX1GK2H5esoQjG.QvvRlaCr6Bjjq.0q', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1456, '20233394102', 'CHUKWUEZI JOHNPAUL UDOKA', '$2y$10$7J2jgnKb7dx8w2CmOOc5Bel1x2fecU2WNsVQqUqB5O8KRCmXj7N8W', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1457, '20231384802', 'CHUKWUMA CHUKWUEBUKA STEPHEN', '$2y$10$9iuVHQndQs4NRQSac32P8OVv8szs7/XGlL8G.jnW4sWtc17JsmIwG', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1458, '202313704212_', 'CHUKWUNWEIKE JOY', '$2y$10$Y07sFGb7vW9cKfA24D0rcu2hjlRZcG9JOLfakPRtcpi1KK2clGyUO', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1459, '20231412092', 'DANIELS MARVELOUS', '$2y$10$gbL5kOd/OqNm5M8RYZjQKO4aMKGxQG6ilr6gc1CxtafRQdy7pDzIG', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1460, '20231407082', 'DICKSON PRECIOUS ONYINYECHI', '$2y$10$sTTy3m8YNx7bo4AN1gEEpOLbm8keUOvXyftWYdY4SxKkK1wha9pgu', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1461, '20231361402', 'DIKEOCHA ALEX EBUKA', '$2y$10$RQMNyDfNlSxfkpn.4k9szu97kcz1VigWLU7EFN4RNdS5XjQYkJHDO', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1462, '20231386532', 'EBE FAVOUR NNADOZIE', '$2y$10$3ZIzlkND1RGIKfjPkezrLeSsYjXXHZkLJJafFZcRnnBL69QROEItO', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1463, '20231398522', 'EBIRINGA BENEDICT CHUKWUKA', '$2y$10$FPhQFMtBpPE7IUUjiyqrBe0KlVysedJvsTaK8wmJdaFVtMzWGr4Yu', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1464, '20231398842', 'EDOMOBI MARVELLOUS', '$2y$10$no.w/9jkREtncGkaf1tl.OpAe3KnteiqXYLfAAmJOPtMBfdiJIwpy', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1465, '20231398032', 'EGBUCHULAM EDOZIE WISDOM', '$2y$10$TxSbf.HWsxCwfdZTFOOI4ep2rorpW8/ssFZpNk1hSn2oR12oE8n26', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1466, '20231406092', 'EGBUSINWA DIVINE AMUCHE', '$2y$10$ZiSHd9nLZnDUx9wDNEjW4uVuVaRkBMk/h7lTyUIGzzjmIXw.4Q89a', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1467, '20231415342', 'EGWUATU VICTOR CHUKWUEMEKA', '$2y$10$JZQrD6RfdYGK.pobvV90tubegJuC.TexFGUzwze7cvo8htHmKJ7sG', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1468, '20231377442', 'EHIRIM EMMANUEL SOPURUCHI', '$2y$10$7umYVZcx8wKywN8Ay.CdJe6EUxBgHikLhJrQgmu2hCOFxZIChCM6K', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1469, '20231377082', 'EJEH SOMTOCHUKWU PROSPER', '$2y$10$jW8Teg5klhngDwdVt6wZ3ecQwsMEur21WOh7DcLFwXmSUBw.Yu.d6', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1470, '20231372622', 'EJIOGU DIVINE CHIMA', '$2y$10$vJR2GDW8LZieOV0GecUn1OR8RJRGLYc7a82HdEmO5QTDWsby2SDEu', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1471, '20231377352', 'EKE DESTINY CHUKWUEBUKA', '$2y$10$sVKaHqJQZhm7v7B8tUNYUe0sa2cBqjDKTxV6xe4jgFiEV8WchZMMq', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1472, '20231363272', 'EKE MICHAEL CHUKWUEMEKA', '$2y$10$hf9EEfeyqn065hD3XKXwaO0Oqk7uffEN3hmfMWUc5FvLHLjQT84ma', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1473, '20231372922', 'EKENTA DIVINE ODINAKA', '$2y$10$DnJUKONMBpIZM9Qh7MoBBe5h8WbDNz2lUFB2yK3bZWHS/zgL3VSPO', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1474, '20231415872', 'EKWE SUNDAY EMMANUEL', '$2y$10$p.suebWAP0stdoBZpJfavOVh8xFWIcYfVk21aCLa3XMcevRgD5dEm', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1475, '20231396912', 'EMMANUEL MAC JOHN', '$2y$10$n5Bl/FEumAX6aIfB37aI5ehbOst7Cc3rLI60IRUkc46f.1F7Zbyya', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1476, '20231389512', 'ETUGEMADU EMMANUEL IFEANYI', '$2y$10$PMu8pPj2azVKpxvEzCxxuOixha6g8vQ2Cw9TaGO.TSqlzjp/aBtr2', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1477, '20231411732', 'EZE COLLINS CHIDALU', '$2y$10$oFhk.IETdxKtqQQ3GXekBegSmntbfhDNwlBOxiUSvNVwRGkjAPdsy', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1478, '20231380542', 'EZE DAVID CHUKWUEMEKA', '$2y$10$G4WSTEQUZ5jl66eanxYjfOvsDKZf3L5ka5enX1dFezD98VcMCnoEO', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1479, '20231403402', 'EZEH CHIBUEZE JOHNPAUL', '$2y$10$dzdfGe7R8Hpjkv9NG6hHa.u4XDcQL/lw6R3qZuuM.QOr4HrvmfZR2', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1480, '20231381472', 'EZENWA VICTOR SOMTOCHUKWU', '$2y$10$zimJM1DPS.2mtjWQAqhvAODInjIxCtb2faLdjPsyCpV5HFNqzVrSa', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1481, '20231381222', 'EZIRIM PRAISE CHUKWUDIRE', '$2y$10$UmsBWenhrp5uWSx7dn.Mze9i2iJcfgyj0D22SZ0jABJXQfuS45i8C', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1482, '20231375342', 'EZIRIM VALENTINE.C.', '$2y$10$S1/dFt6AykNU/u690j1.Y.0j6Ck4Av5C1eFm8ddsbaZI37niXP4H6', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1483, '20231385302', 'EZUMA CHUKWUEMEKA EMMANUEL', '$2y$10$eEQA6kVYUOlKRw2hNLVrHe2i6fCzuNjhGVTTpF4wv8Kl3IvQxhg06', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1484, '20231371842', 'FELIX EMMANUEL', '$2y$10$TZ14UMSUm/xzINhEs3Fr5uXY1WG7j4MqEUW6Pec4hpLQHfu7UkjzC', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1485, '20231375242', 'GBENGA GOODLUCK CHIDERA', '$2y$10$zSt7v7NXcrlkJfFblX2qVe3tKx.yf1tYBn3QWI1DsrsdIDMDvMVCO', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1486, '20231395552', 'IBE DANIEL ONYEKACHI', '$2y$10$ZRZgN.QHslmBv2.f50RR2.gdyBAIjoIN.yAxjKg/VAY8eL4STRS4W', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1487, '20231392302', 'IBEABUCHI TAGBO', '$2y$10$u3huRuXSMPeif3Otygy9Uum1X1HnFnsnV20KCC.0TWfadtW.R03e6', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1488, '20231378822', 'Ibekwe Wisdom Kamsiyochi', '$2y$10$NwMN/vPTkLnmSWjA5Mx3aeaWl8HbIFx8mWdiT74YuuCZLAqr83XPW', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1489, '20231403772', 'IDOWU EBENEZER FAITH', '$2y$10$h2xbZ8Bv54c/l5dyoHFDOuKK8auuvk0Q7.2Tvmth5kEfquhHfcXdO', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1490, '20231386662', 'IFEANYICHUKWU EMMANUEL CHUKWUBUIKEM ', '$2y$10$mu3nug6uKVT0Z1NrJZo3dewaIxqaibzO.tXEld1Ouch.5xJi2np3S', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1491, '20231387452', 'IGWE EMMANUEL AKACHUKWU', '$2y$10$m8S2ys8sWGdAQM1hyko3SOXdAjCmE6pX44BfY4qeRnwoZ5My1IbgS', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1492, '20231385632', 'IHEAGWAM CHINONSO', '$2y$10$fFSFYQYCf0Ph4oR0vyf05.2.9x24/Uahxv.M/EHXvyiA/etchsU/W', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1493, '20231370712', 'IHEAGWAM SHARON ONYINYECHI', '$2y$10$4amdVYjEOM0DTCydJ.MjauZe3tR0J1YVbkrWuUnSI3jTLXyV6a.M.', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1494, '20231377042', 'IHEDIOHA CHIAMAKA EMMANUELLA', '$2y$10$6pfCcCmK1uHCqXi94ZdDtufCxzRDREbzbmB6SOTVaKEVWyXOgrji6', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1495, '20231404122', 'IHENAGWAM SOMTOCHI DOMINIC', '$2y$10$runa1fU9mVH6X0Z.kANeMuqgTdEOu/o.jCH04/Ny2okL6M9k0Q/wy', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1496, '20231413443', 'IKEIJE PREVAIL CHINKATA', '$2y$10$we7yoje5pyVZwBMf6LBz7.yApsNhKokJeyEWWa0TJVCgFasrZXuZO', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1497, '20231380042', 'IKENNA IZUCHUKWU ISAIAH', '$2y$10$FLytYInMgFIdLBEV7/sj3eez6XzfbE8zcoUcOm.OMSN8c4.o8/F6C', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1498, '20231410792', 'IKWUAKOLAM AKACHI FAVOUR', '$2y$10$7Jch4LrQGXBfsesJ7OlaWOwjque3wkvEFVPW1.AQIXrEtTmMmWVbG', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1499, '20231404702', 'INNOCENT CHARLES OBINNA', '$2y$10$vDudipOaUv82q2.vBw3vZOYY38v9eMpTChVOlnlKpzJAQ.JlM8WLW', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1500, '20231388402', 'INNOCENT CHIDIEBERE PRAISE', '$2y$10$wk2cavMH5xiV16UaXCmqnO9d51LVvqpO0IOxsmzGCA6kvl3iG.lZ6', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1501, '20231378512', 'IROHA FAVOUR OYINYECHI', '$2y$10$tETrwqoSofU5ROGkwfroXOR8ATtjR4gV1RxVu3Mes6rhd8jQC/Yme', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1502, '20231399362', 'IWEZOR EBUBECHUKWU EMMANUEL', '$2y$10$lKrI5OgiGzAqS6lj9ThYH.49ohOA0GloEPK2Q.ueu3yF75CEvm2ky', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1503, '20231388662', 'IZUEGBU DAVID TOCHUKWU', '$2y$10$J18ghGL23QYOj6rli7kGUemhqR8yhaTItta/wMaMhb67ddW7XjNhi', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1504, '20231417622', 'JOHN CALEB ONYINYECHI', '$2y$10$8v/RnryyCRyWKDgj/QYAS.83EBHlNwHi.q4VCs1HuSO9BnKK0Z6by', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1505, '20231412372', 'JOHN OZOEMENA', '$2y$10$3/1qyYxc9U3Fc.kvgVJZROq9J80FS.JbAAOYTdbMyi1wt47/azY5q', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1506, '20231416772', 'JONAH UDUAK SYLVANUS', '$2y$10$yU3CSnFuMmKbgGc0ZWdiiu2XKZr3u5FPY3UneItcO/WkD.afWv1Qm', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1507, '20231378402', 'JOSEPH PRINCE AKANINYENE', '$2y$10$/DuhyRGsYN5WgQhekBHHsullxgHmNyVZzaF2naP27X1l4m/37WNnC', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1508, '20231404102', 'JOSHUA CHIBUNNA PHILIP', '$2y$10$velu6wox28qbuC/bzvMll.YgqXSUVTHBQFkNLOBGKtTkpko2jP4Si', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1509, '20231375232', 'KELECHI DANIEL OLUEBUBE', '$2y$10$PJmuQVvQENHIupI63rSdGum7xi6bNZJB/T9yTgm8M1c59ZqnORueG', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1510, '20231402852', 'KELVIN TOCHUKWU ELVIS', '$2y$10$l/YNYCZ4BLhrwPDxKebwUO/.VLdmYUkrs3YnkUZ0OspaJHWGP8T1S', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1511, '20231385892', 'LEONARD EKEH FORTUNE', '$2y$10$0BjGxhdlzldm/8Zl0lJDxef5OjGeNbSWBtm1J5nrBKk/NpZoGAw62', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1512, '20231396512', 'LEWIS REUBEN KACHAK', '$2y$10$pS8WX7GlenWhEVzGxtARFucc1hwxkgB6Shsa97YZNEt5vu6y/IyLS', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1513, '20231372312', 'MADU DANIELLA OBIANUJU', '$2y$10$PGrHva.NIpODmrB8i1rsaeZjXB4AN2uijgEzJSObJFv8SZU55SSZO', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1514, '20231362472', 'MADUEKE CHIDERA DIVINE', '$2y$10$M0DhjJYUuyhXsfGgqKnO5uoGQErfl/6VSwwNjvopBFwJRURofxsea', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1515, '20231400802', 'MARAIZU SAMUEL CHIDIEBUBE', '$2y$10$JRHxFABziDi2dSTRG/ZTTerAVa6L9RVEKLqmo2F49z8Nua.3Vr35K', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1516, '20231391582', 'MAURICE-JUDE SAMUEL CHIBUIKEM', '$2y$10$32wBDEbHWYKAFndbdjZtieYdS4lbKa0k/TMkH4pbqRh/YaQ085/L6', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1517, '20231374522', 'MBA IFEANYI OBUBA', '$2y$10$GKOmEc7lurUiAOdyLwYc1.NQoux37pdHuL0pUmshgtJT4GVseSjn2', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1518, '20231390382', 'MBATA AUGUSTINE CHIZITERE', '$2y$10$oK6sFmpYHxE7gj9mm2AxnO0verVhqyMOnc0wa/CHJRZe9myBIVyUq', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1519, '20231411232', 'MEGWA DANIEL ONYEKACHI', '$2y$10$.ftKp3zMr2OygNDL1EYpRu0tbAj7Y.eVAdpIm7fJLiiNXb9nKvbCq', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1520, '20231368702', 'MICHAEL PRAISE OLUCHI', '$2y$10$ox75OryS5q23G7CbJTZoIuOwdO004bn0QMdY5G3dnrFy1RjtC4fXO', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1521, '20221332832', 'MIRACLE JOSHUA CHIDERA', '$2y$10$yCU.if6F.ncBpht0q4UKBefUAlkt8ZSlbnYTEOTquEk8XOsfXOLtO', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1522, '20231394512', 'MUOEBONAM WENDY GOLD SOCHINAEMEREM ', '$2y$10$g8393PnYGWewEiDeqI4cAebAdSqOZX61pe5VXJbU8FAm7vX/AoezW', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1523, '20231402712', 'NDUBUEZE ONYEKACHI DESTINY', '$2y$10$rVbkiurOMc2ATSxGhlIz9uENWkzPftZzuqtvQNoeJSuLFCAVBPlJi', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1524, '20231379772', 'NDUKANMA PRAISE CHIMEREMUCHEYA', '$2y$10$bHgfheBEfgwBtC6Lla5bnukoNklvuoo54td0h0ZlKBeYKkEQAA53C', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1525, '20231378182', 'NDUKWE CHIDERA DAVID', '$2y$10$8pnrL1DH35xeCZra80l7iePHo66b3/ZdH4/rLGpcwnIZzHiQgbFAe', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1526, '20231375972', 'NJOKU ARINZE MACANTHONY', '$2y$10$rqAsgGKyEQS97C/FElfMUOn6VP5DZpdehrk/Sp2MQXFnKbVSXrMQO', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1527, '20231373782', 'NJOKU FORTUNE IKECHUKWU', '$2y$10$qhRP9wnEwalX2SoouK4/5u/xrVT64uIxte/0KEVt59odsX7M4t6Ui', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1528, '20231405272', 'NKARU SAMUEL', '$2y$10$DvQf0SC1SZoaWABm1.qDK.RXhtQNTW/5XkO2bz62oK9C5BvJdxX2C', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1529, '20231363512', 'NNAJI DAVID IFEANYI', '$2y$10$HHiEm3a1EsKUjUeC3GUySOIO2m5Ha4S76fk2e3bwjSXNhefqG1awq', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1530, '20231376102', 'NNAMDI KINGSLEY CHUKWUEMEKA', '$2y$10$qpXrKakL8mfHAeddOgXg2OhWyGGOXwbGKM7oXKE/2Sb3N8BFyVdPS', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1531, '20231374782', 'NNAMDI NELSON OBINNA', '$2y$10$pH4lt6jxdc/47jQ/hPCo1e67KEjqqN48MoH6pt8.0d.TrWVUuULGq', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1532, '20231389242', 'NNANNA EBERECHI DIVINE', '$2y$10$/ZG3bM0g27.lIPy53XkUju8PLmeCQqgGFVlngSDFCO2VhdbYT9R2S', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1533, '20231380932', 'NSOFOR EBUBE', '$2y$10$fZT7XRWBz3DU2WuJ.YYupe0.oRzvfuYO3NEiPpPmhXVIUdhyOfKMS', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1534, '20231367092', 'NWACHUKWU MALVIN CHIOZOADIGI', '$2y$10$nv1MudlO9uiLrcYKpvP2KurhZ4KtyUc4N/nMEoh0iwwxoO7Dq/7b.', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1535, '20231277322', 'NWAKAIRE JOSEPH CHIMDIUTO', '$2y$10$.dvNWKzcuO.v1ZvVP21.ZOsY2wguCcJ6MM1b5SQT4N/0ol5L5ntTO', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1536, '20231396622', 'NWALA JUSTICE CHIDIEBUBE', '$2y$10$3Ui2AXLxoOK2rpJt/ztgtu457uGkQOfbgbSyzqMcvrBDaO3zRUao6', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1537, '20231384272', 'NWALOZIE BEDE CHIMEZIE', '$2y$10$djz4BtmB4rth7VKflw0IFuWnT9V3aEhu0sWo80ZjyU/P0aNb1t6zG', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1538, '20231411212', 'NWANTI DELIGHT IFECHUKWU', '$2y$10$XTmVf5F.45Fl4tGF69m5deyIPvTUxumblGZ4MruS/umPLg.GzfoMq', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1539, '20231395262', 'NWAOKEOMA KINGSLEY CHIDOZIE', '$2y$10$RIIW9B8O8jAMsSf8SNh9V.0ApnaVka/bjKbKruJH8To14bK3Wina2', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1540, '20231364752', 'NWAOKU OBINNA JONATHAN', '$2y$10$hI.VSb4S2AMSkUQBmlhv/OitQQgRutIOdt1YhqEyBhJbEAE2A3gk2', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1541, '20231384782', 'NWEKE DAVID CHUKWUEMEKA', '$2y$10$oSxKOMdDtK0mj8nGuJbv.O6GZTM/VrIyivOD4awV73I51BDI2pX7a', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1542, '20231388542', 'NWOKE OBINNA WISDOM', '$2y$10$NhlJBj.bxwgaJ9cSJtongOBQzQQOAwDf.6WD5FWZ7gviU54.cZ.06', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1543, '20231363982', 'NWOKE SOLOMON CHINEDU', '$2y$10$QCMMek6ckmYCQQnIjavNTePXG9754VexmNHc7aEk9TmN2EMYmTeU2', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1544, '20231380142', 'NYEAKA CHIDIEBUBE AWESOME', '$2y$10$MW3m1cUqQ4qj2SfJBTJuRO2oN3OOjxcs6X8ZFmekhyrJfX8C2Js/2', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1545, '20231407522', 'NZEAGWU CHIEMEKA FRANKLYN', '$2y$10$vyj9ENTQE2qUd00OG.KBX.Hq8m5R4GyuDp15oAf6hzd/NuYqIRzru', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1546, '20231376612', 'OBI CHINAZA JOSEPH', '$2y$10$ActfafKWUm2OSAm6ywUJIORkNw0ncSSz/0s1o6Vwpf64Fh2EMKl6O', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1547, '20231407652', 'OBIOHA OBINNA DAVID', '$2y$10$AEqCy7XoFoXcCOl32CubRe6M74Wx6E4.WKym.DiFgPT6qwBUzuXgm', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1548, '20231403342', 'OBUKWE EBUBECHI', '$2y$10$IQkwUF7ORsPvyN.J.yHmQeqLQOmul6MlV1Djr0cv452DWSC847c8a', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1549, '20231376542', 'OCHIABUTOR AKACHI KENNETH', '$2y$10$22uIBf0Z3Ao01f9XMbyP3OpKKQ6BCXArUjfujly87sg6R7xI3apaW', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1550, '20231397282', 'ODOR STEPHEN', '$2y$10$UBFixvrStAA1jdQLvqCcQ.3eQi2M705s9ZprC62eRc/2dpEJ3cPuG', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1551, '20231371722', 'ODUNZE RICHARD IZUCHUKWU', '$2y$10$UneOpGKCZF7EKJAZcVcSHOFUh8Fyxsml4z0mRJPfV/d126RMOoHm.', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1552, '20231397002', 'OGBUZUO ONYEKA JUSTIN', '$2y$10$E/0bXjyp2vhnVcMk2/2KgeqiAa7CTA8TGzt8FG1.Ph6yUvku.fyA2', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1553, '20231378032', 'OGUERUM ABDULRAHMAN CHINWENDU', '$2y$10$Yt0NYvN6nbng.p5.5QDfC.fxscttoJpblz3NApnGQfUDueq4FIuSi', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1554, '20231380852', 'OHAGWA CHINONYE EMMANUELLA', '$2y$10$e6Gb0FeL9d5Pkm9BBppF4esYswa9QyUMCdPipglY09ATQr.z4YVqC', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1555, '20231369052', 'OHAWUCHI NNAEMEKA VALENTINE', '$2y$10$vuIoCFKvg7yWckne4rtMveE/fBRalYZ6cf66V9NKSIvkHMzbJgGIC', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1556, '20231371472', 'OHAZURIKE UDOCHUKWU STEPHEN', '$2y$10$0OWDbGEtPxeFmyC.kjvUp.5Bqp2PoYkg5A7aZl72tE3NikHOXSFsy', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1557, '20231407732', 'OHIA PRECIOUS CHINENYE', '$2y$10$qHf8DkpjTtwQcvhKQesFQe84kfkwDW9Oq6GtbOhhD9XdvAfqwqd8W', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1558, '20231395982', 'OJIAKU CHIGOZIE GEORGE', '$2y$10$8qnQNo9PSuMv.1QiejFgceNcdTz8bK2US1W9mc4wGSKmm.dEhCZsW', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1559, '20231402942', 'OJIAKU SAMUEL IFECHUKWU', '$2y$10$hRAsDnJfBkOgMa5WfgIVtO2HBhkC5VwQ12YggEZPqFk2aH/inCyHG', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1560, '20231395732', 'Ojukwu Chikanyima kingsley', '$2y$10$n0EoKfoZOctfRCltcCy3leB.EJpgPTE3.WM7YctlsLgVYQV7HP4Wq', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1561, '20231386462', 'OKALLA MMADUABUCHI HENRY', '$2y$10$j6lERTy9XFpeaGR81GOHGOK9z3bG9vIDGrRIgechxUM3tUVLK8EjW', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1562, '20231391382', 'OKAY IKECHUKWU FRANK', '$2y$10$ag.VS8N7VB2t2vIVEcP.MuxqmFtTn0wQNSmjocX9lOksSTu.JiQbq', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1563, '20231364602', 'OKECHUKWU CASMIR CHIGOZIE', '$2y$10$AaYqCHNPN.ud2UcS/vIVMeCnjKrjQla44T1z3VV40g84ZSVrmJCfC', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1564, '20231393212', 'OKEKE ONYEDIKA FRANCIS', '$2y$10$NcCGaNMK8mk5qSJhf3ZDcezAmQ9vpBaCeL90dhLp2YhQ8Yw9wOu22', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1565, '20231416182', 'OKEKE PAUL EKENE', '$2y$10$GbOTKxewOPbikEYmj93aye3RwcfAUQT0MDdG/0zvoms1931PRN6W2', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1566, '20231394302', 'OKEREKE UGOCHI KALU', '$2y$10$qOIVF45ZcGaaBUcV.9VldOu4xE/uhz/roOc3rtEfbguQL2XRiDx2i', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1567, '20231375802', 'OKOKWE UZOMA CHRIS', '$2y$10$FhcFqejiYlczcAiA6A30TeTObSd133UN0pk4WGTECf55VMmSZy9qa', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1568, '20231362412', 'OKOLI MELVIS SOGIBUCHI', '$2y$10$sS5UcMSu6WXHCj7nI9HKaeZxfETb1w4u7bEIXMjpQz4RNUeqPbR2a', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1569, '20231395382', 'OKORIE CHINONSO STEPHEN', '$2y$10$KT7zXG6tKj68J/dNV0u/jujIFpmGFiELgi9b2nRuPW7cuUXOFYwEq', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1570, '20231385792', 'OKORIE DUKE CHIDERA', '$2y$10$iE9N3DjYwhIcvwDgZg8xOOHsJjvPf8D7esbriM8eu7zSqIGg3BIBe', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1571, '20231388202', 'OKORIE GREAT UZOMA', '$2y$10$m0je9FM7sFoUHE7KHTj6rO6nk5kWHQH/WmuEuPfkYqNUrHtu2s5M.', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1572, '20231372412', 'OKORO CHIGOZIE CLINTON', '$2y$10$drhN8kmjeV3BYlFOfs2H1uYZmCwaTbT4SPdAANb1/rrV6nim5Wjee', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1573, '20231375132', 'OKORO WISDOM CHIBUEZE', '$2y$10$zMgZqgUzEu5HXp.YY38v3u/UElJjFeAivOly/iviUJt6mBrEuyzh6', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1574, '20231386622', 'OKOROAFOR CHIAMAKA JANET-SCARLET', '$2y$10$UFuC8xhRGdNt9Mo1Bj2ML.UyLWtv5sr5UpoRHH1GRuyhANXyxooku', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1575, '20231396382', 'OKPOKPO ABASIONO UWEM', '$2y$10$9Ou6bZM1ThgGgnEKbsf1FuU9mE18T.V/GEauxZHbvfatk3ncsu.kq', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1576, '20231414442', 'OKWUBUNKA DARLINGTON CHINEMEREM', '$2y$10$IseEjUDY4JGZ/t/24eByvOyZo9/55y.nu92VfGZO2BGY/frPfLs/i', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1578, '20231373882', 'OKWUOBASI FAVOUR IFEANYI', '$2y$10$pg3usfI8YHwEThAZqG/kN.qL/ADIymi3rv4tXouDAuOi1AP4/Wau.', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1579, '20231416082', 'OLOFIN JOELMIRACLE IFEDAYO', '$2y$10$Uj45sS5hBMlQ3CzB6HHx2.ouNuaaZO2GNDo4TBymPH80KsUh6cOGi', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1580, '20231364452', 'ONONOGBO EBUBECHI AMOS', '$2y$10$1vzC.rUMT/ILpH4iY0fCDucJrHkgx53jdh8nahMeoAReltqyv3dwm', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1581, '20231409932', 'ONOTU DIVINE ONORIODE', '$2y$10$DpDsqZB5sAgVfRYCUKgQL.u1tsCOfOMSkEfcnUpLT0rzloZ287TGi', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1582, '20231364922', 'ONUAGWASIOBI EMMANUEL UCHECHUKWU', '$2y$10$wKJpbV./REsbEFb/WqqMrOxAPoLAIsDb.b12DLpEvvI0GGSZ6wSpa', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1583, '20231377742', 'ONUOHA PRINCE CHIDIEBUBE', '$2y$10$HbqipG2lubHaEY8XJT9VcutlzlTIWcROT4AmBW92weeQT8wAi4a3m', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1584, '20231373272', 'ONWUKWE AKACHUKWU CHINWEIZU', '$2y$10$q27N/Zxy7edB6m8QEpdrBe0.K2SBSHAXQNJOylg6WYLDaJGFkeMcO', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1585, '20231375012', 'ONWUMERE ALEXANDER CHIZITERE', '$2y$10$A0/GjuKGEjn6Pivcn77k4OG8T6IpAE1NPneILrWbw43.7wM5TjixC', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1586, '20231370702', 'ONWUZURIKE STEPHEN NDUBUEZE', '$2y$10$A/Ebw9EHhezMqn3io8uZyuFhduoHNWnE/MaMIs1.WJuFjKnGnGmsu', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1587, '20231374272', 'ONYEKA JOSEPH ULONNA', '$2y$10$aNPQBuM8tdVZ63aFkFHZAOS4sxgX/PzJL3z4sDB6v3n.6yTPwS/wa', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1588, '20231380562', 'ONYEKWERE JESSE SOMTOCHUKWU', '$2y$10$KPoaQA6R623J2pvvVfK6buHYGzrousEtx1BlKfC/brJDspSwGbrYm', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1589, '20231395282', 'ONYEKWUO CHRISTOPHER CHIBUIKE', '$2y$10$af13eKQ7c1CmBBzpptqqX.IdMDYwvCmuVmE.otDU5pH03KXNNn/.a', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1590, '20231374282', 'ONYEMAECHI HENRY EZECHIMERE', '$2y$10$x57woDX3nS4.hypP6Ki96O.hnIOvckt61vgXUAe65VX3VGbJVaTrG', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1591, '20231375662', 'ONYEMEAZE KINGSLEY CHIDIEBUBE', '$2y$10$rCz8R4DiWgBjSj8BP41qN.wYMMX6niDuu1VW9zbe6jTEIp9qk7UWK', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1592, '20231397722', 'ONYEOYIBO JOSHUA IZUCHUKWU', '$2y$10$HJC8P3PwlbTkMffpRn8MNO8fJFvGKHEk7/wjkQI1e/TfjQRRAvIcu', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1593, '20231407052', 'ONYEUGBO VICTOR CHISOM', '$2y$10$./lY36gc0EM3b8XpB7OXn.JAxhvBVyXY4j5ACL78RzlW1JRAl3rlq', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1594, '20231375552', 'ONYIRIUKA JUSTIN IFEANYI', '$2y$10$c0nBAmlC7XLuGKdmzL.0peBq8g0OeeEblbWoI6tUk6GbikLspf5pm', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1595, '20231378652', 'OPARA CHIBUIKEM SAMUEL', '$2y$10$dBYhd6s0SGG/xxvSYdL/yu1WorOa1ojDOeNhAeKwJzCCBh3bHIckW', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1596, '20231377982', 'OPARA ELVIS CHIBUEZE', '$2y$10$HafY8erMqmcPHLJ76mYsqe8TPPp3Bv0hwsR4nIvWX33ZSu16WG0h.', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1597, '20231405342', 'OPIAH MARIS EMEKA', '$2y$10$uZH.bLSctggk.rLf6M4EreyAbfhzj3msKmMLaJxBT0Umh.nkI5l6S', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1598, '20231379652', 'ORJI JOSIAH IHEANYI', '$2y$10$iAjsLQoG5f5wpvzV7gE4WuBMKXnhp5I1wJ7sGw0wWDF3Vos1ZR/U6', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1599, '20231384772', 'ORJI SUCCESS IKECHUKWU', '$2y$10$A1QIRU6HDdgTK6mxwPnaGeXFMFsfNpSTIt69EtNoOWGjjXcnX.eIq', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1600, '20231384342', 'ORJI UGOCHUKWU JAMES', '$2y$10$3spabbtNRAXghktMnPXHUezoUyVZzdIQW2Za/0ntiIcTgTEpISFb6', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1601, '20231413132', 'OSUJI EMMANUEL CHIDIEBERE', '$2y$10$d5qulh7VjHNoQlHmDpbNYOjsEP3nJQwJ3YohP6a4sKhdOCG7q458S', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1602, '20231379492', 'PASCHAL VICTORY IFEANYICHUKWU ', '$2y$10$TvJvHvH0Gl/qRktJkNDPNO1LujlnACtOIOoWFTH0ViuPUrKhh5li.', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1603, '20231393282', 'PETER CHUKWUEMEKA JOHNSON', '$2y$10$T8LVAXG1FytTQlBbp9Nlk.S4perAqRbvFGWBLvuILhapefg.JFjDK', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1604, '20231396892', 'SAMUEL EMMANUEL', '$2y$10$oqJ36IMLb1vK8PoMR.BfzO6zlls2IGZ6OO96tW0MNu4NPqg.Ch7SK', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1605, '20231399802', 'SAMUEL EMMANUEL CHUKWUEBUKA', '$2y$10$U8SrigKey2N00r0RpjvYY.VS9DehZXDyDld.s10HvrcmSvwcKpSKi', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1606, '20231410912', 'SORONNADI CHIDIEBERE PRINCE', '$2y$10$5zMJjbP841XhQ0aOPjbhIu2MtAUgGyAH0BbepTRg9AynIoAMZP4Lm', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1607, '20231370932', 'SUNDAY DANIEL CHIDIEBUBE', '$2y$10$IwUJdNoB8XtqBG9eYk32BeJnTSROifsn3INX1CrYa8BUMzehWThYa', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1608, '20231375502', 'UBA KELECHI GABRIEL', '$2y$10$j8X61w3gQcL7D8eOR7VHR.baavtSdyu0hfVCJ7qKhnw3nbYcKBic2', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1609, '20231403302', 'UBAH UCHENNA COLLINS', '$2y$10$pBquRjxabssW6czW1a3Z3uhRatWyKQofT7oFM.nsROGxYrKUXVJgu', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1610, '20231380922', 'UBANNA PRINCESS CHIKAODI', '$2y$10$8Eh8FX60SI9mzyHY0hih2OLPVYBw4cTcyKJR5Zxe7/pygxm95/NMG', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1611, '20231392242', 'UCHE CHUKWUMA HENRY', '$2y$10$gwwIq/AvBIRRIx0P4c8/ruUUHyxV65Xb6LPtyQHhVoaVWs6blEnzi', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1612, '20231387922', 'UCHE MUNACHIMSO  EXCEL', '$2y$10$/rH.AWglxw0UaHND2rOJP.pRtuASf68L6MQyUI3v2McfWoLGIDERm', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1613, '20231407612', 'UFONDU CHUKWUKA DONALD', '$2y$10$L6/Sgi2TJkX6B2vvaYvp7Ok/smWCguNaFrdzbNe3SJTRNge8mKV7W', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1614, '20231404232', 'UGOCHUKWU BORNGREAT', '$2y$10$Gh2avu8CVulX2iFHGm4XFeLreoXsGCu3kg5t8yWMEyl3B8HG52rVa', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1615, '20231391722', 'UGOCHUKWU DAVID CHIBUEZE', '$2y$10$RUUYKXaJ9nR.lgqZMGaJ9eKY/9cyHE3xYH8Ah/pjl8Qpi4snWgeDm', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1616, '20231381122', 'UGOCHUKWU VICTORY EMMANUEL', '$2y$10$VAjbjkV8OZZtNBacIsbtGOtoPa1o4lQJRGw9Phaw28CfZy2ryWUKO', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1617, '20231383372', 'UHUEGBU MICHAEL NZUBECHI', '$2y$10$BPv09An1OLw0Ea2dCgIW2OZoTSYX7fMeRrrU05TV62qopNmHSnSSq', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1618, '20231379062', 'UKACHI BRYANT UGWUMSINACHI', '$2y$10$BvrE/0Ek96XRsXwd/Zazd.EcyW0eMliaFo.ZX9..g5NUKCULnvq7a', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1619, '20231396902', 'UKELONU UZOCHUKWU MARK', '$2y$10$XkEX0/.LZWTvGQho.uTnfuUWCwwohXR/eNm84yOoG.aIWGYe7juHe', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1620, '20231366802', 'UMOH EMMANUEL BASSEY', '$2y$10$8gLB7EpPi7G2QEK1jp7nWejlGBRJE5zQd1kvzUgsU8zSJ7wVpuvvu', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1621, '20231410902', 'UNACHUKWU CHUKWUEZUTEM DANIEL', '$2y$10$FDLCpNKjcTyDAAZm3kFeSuizwN7jwJQz3XXZbdM.ZIUSU0MTzqYGC', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1622, '20231375202', 'URENYERE PROSPER CHIMEREMEZE ', '$2y$10$q9.bQoLn7LmRyXj1zsrto.PwwI5C1dHe/IZOQbFKFP98LwYW6fY3W', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1623, '20231379712', 'UWAKWE EMMANUEL UGOCHUKWU', '$2y$10$RmxyRJYDpWjEV5rwM6Ivg.GKXwa8M6FCvqJOyOkpFf/suawnIM3uK', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1624, '20231376532', 'UZOR-OKEREKE CHIMBUSONMA ALMOND', '$2y$10$zuXK3Lolws4mUSdPNL4IIuVQer4uTGw/aQXxyvbRkwbkb.1J7Y1kq', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1625, '20231414552', 'VAMBE FESTUS TARVESHIMA ', '$2y$10$OaB4wRb4ksAQ6WXJ7.LsSuQZWvTffrjiRCQzX/cB0v8tm4v9TlbSW', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1626, '20231375912', 'VITALIS CHIJINDU VICTOR', '$2y$10$cFDCcjjx5osnbGCzNLCOmuc7WBO8Ayc4bd1dnYqFKfmzuA2.Z6i9e', '200 LEVEL', 'INFORMATION TECHNOLOGY'),
(1628, '20221350032', 'ADIMORAH oluebube victor', '$2y$10$eHkXW0eOlAb39Gp6fmYBd.mlWMisCMH6LOSXxZXPFtLOUFwdX8qY2', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1629, '20221332262', 'AGEH David Onyekachukwu', '$2y$10$oYHwv2pAMYlEPUE8yJvCO.ea6SaZaXG2qhg1z34lUr85yrLNud97.', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1630, '20221339572', 'AGUWAMBA humble ikechukwu', '$2y$10$nIyQgR16MywlUeTFk6tv4umwuLdtiIpz8W//1cEwts6SBVFTDs0UW', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1631, '20221350552', 'Akah Tochukwu Deodatus', '$2y$10$cdCR52c5kcphFWs9Rx8fMOogxOasY0ZSQcOr/Dht0Vec4bG.cQ51q', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1632, '20221328922', 'AKANEME Charles Chukwuma', '$2y$10$z0oC39fmjM0jW4xIqY8LrOa1rWTlUFbtxKqF230nxzCKzMq.hWL6y', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1633, '20221340792', 'ALONYA CHINEMEREM FAVOUR', '$2y$10$UxJWAC2YbeUDXLManqkZiu2.TQcRGnHjWQjltbYijSSz0gAIfEIaW', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1634, '20221348882', 'AMADI Mervyn Chukwudi', '$2y$10$0bAHfw8sxpOchJRiGs68cesmrZF6p0E9VRTpPJASwfrCqFYHw2.5u', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1635, '20221351752', 'AMAECHI CHRISTOPHER CHIMAOBI ', '$2y$10$fj3vi8mLL/nvUnN4r6bUwuUIhYsrMosSBVuJgXGtBIvyzErkQHSsC', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1636, '20221327062', 'ANOKWURU IKECHUKWU DAVID', '$2y$10$8AMIAdCwG4HG8TqiplsBDezYsyv20ygTJiESaT1Le4jW5PM4QKgx6', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1637, '20221311922', 'ANOSIKE Augustus Chinecherem', '$2y$10$mrLAW40J5wGcwSu0Tmf/3OysHC0WDbQParhukJhLvD5VXf4sYIhU.', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1638, '20221354812', 'Anukam Bethel chibuike', '$2y$10$LXPC14WbG5iwH6c0BjTzE.8T5KHqDU6VBTpCUiWL9PYbGLCbkfav2', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1639, '20221349072', 'ANYANWU Sophia Amarachukwu', '$2y$10$kUkM3rNHiTBxbCGzSlRk4eVcI6eRBuvpHel6dEksBYIhEfmQZ1X4W', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1640, '20221345942', 'Anyanwuocha-Collins David', '$2y$10$6dLYxIP/QCQKjZaB1vBCjOJ3x0CPlgrweZAkPu.Y0ctNwOuKDkAjq', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1641, '20221315922', 'Bestman Kenneth Obinna', '$2y$10$jo8zmkvqcLEez1Ze7vVSFO67ZbtNZqQQXhrNJbdbxn4bRU7KQbqJi', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1642, '20221309262', 'Chibuzor christabel chinyere', '$2y$10$INpIFiddjCdij8j5GjCBPOXe/CfeLGfziNVrPAOmafGZUlSJ3KUau', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1643, '20221355662', 'CHIKA-KALU Davidson Uchechukwu', '$2y$10$yRdE7Metn.oxnUpCtXbWeOsnJGiUKfMR5ArHLCMUw7g9z9REq.Uo.', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1644, '20221330272', 'Chima chimezie victor ', '$2y$10$VLh/wUK73yHrC1Cq88STluYDR3viSoaWlaC.LNAIkBV0PlCx9fwwW', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1645, '20221314812', 'CHIMA Michael kemjika', '$2y$10$FZhQEjmnrmMNRpbTCZaweOA0miqE/FVcxUv13O2S.I6vF1wJYMGqi', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1646, '20221327492', 'Chinedu chukwuemerie Uchechukwu', '$2y$10$owjQel2Rn2Z.6D3y40nBKe2/Xi2aDCE4XvZQ/QqNzBGnqVNRSCqjC', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1647, '20221342652', 'Chinedu Emmanuel Ikechukwu', '$2y$10$twLrPYzMs8v.Ia19bYYn4O1O4gbCsvDVyjgJy/ypXCDgsieva4Qfi', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1648, '20221316882', 'Chinedu Godswill ifeanyichukwu ', '$2y$10$w332ZtMHquYObSWUoJmXsO9FdyvKISQbXYqBAaoiMFeBYKHnRmpbi', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1649, '20221349682', 'CHINEDU PAUL CHUKWUEMEKA', '$2y$10$8Z/zN5mF6j5fTC.de4WTieJsFKxKKTIq8bStfNN.gvIOsAXlGBOyW', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1650, '20221345682', 'CHRISTIAN Miracle Nmesoma', '$2y$10$APc/ibOycqWwQ9lolFYt8.0IFtvo5Q.EJKpbKYyGkEkaC6fuOmVlG', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1651, '20221345002', 'Chukwuneye ugonna princewilliams', '$2y$10$LsugEa1Bz1roZPZ7mDbcQutTir1aNDkGUrHU2pWQ9oPVfX7drzro2', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1652, '20221359402', 'David Princess Chinelo', '$2y$10$ysGvEXdYOVIIK8TIngyppOAlfQuTqKOxqL/IZ3YpBiqQSj3h2kd1y', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1653, '20221335622', 'DAVIDSON Vincent Chibuike', '$2y$10$N1p4YqK2tI/5Y37lOeJPiOy7PGoKIOSloN4uxjG5xkS.SxULZ0UQK', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1654, '20221346032', 'Dike Chinedu Emmanuel ', '$2y$10$O8F4UfRMjia8ElhnmCjnVeaPeRpGhBesE/e5bSs7cRGUJHEfK0Sn2', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1655, '20221336222', 'DIKE Gift Melody', '$2y$10$aCIriCHpVl0N5o.QPXRW9eyMu10V6lrQurdXYksM3Hoq7rZo.pi5K', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1656, '20221314502', 'Duru ifeanyi David', '$2y$10$qsr/5bLC1MIqjFwq5NFUw.KlbBXkapZ4Jj9eiIp6JCH7kjwlJL4/6', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1657, '20221351412', 'Ebere victor chukwudi', '$2y$10$r0RIc51.mJ.F2kP0wQ7XpeSDW4LSareSrstzq1s1a7PoTALI1f9A.', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1658, '20221349642', 'Ebereonwu Prince Chimdi ', '$2y$10$oT/RR28amgYpeXD1fQ8ynufLI78jbr/uJzdmlb3S2XPnI/m.ZWemi', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1659, '20221351952', 'EBIZIE IZUCHUKWU JOSEPH', '$2y$10$q0ZKjlAGco8LbG/cyvq.xepVbGc/Fmvmmo4vOZWgVkLp8MgQKljqy', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1660, '20221352492', 'EBUZOR Bethel Ebubechukwu', '$2y$10$trfRXyjhl.rJr3.SXd5L0urNvWhoroOEGXQSt5yHEsbB4Fdez2Eoa', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1661, '20221334132', 'EGBUHUZOR Ifeanyi Kenrick', '$2y$10$fxGSTG97sO97TlkyA/U5oeUiQzknm5exR0xYlQqz1Q0nb2fGAc1..', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1662, '20221314032', 'EGBUNINE OLISAELOKA FRANKLYN ', '$2y$10$nrDhAk.t/Z/6rCoNoJ3Myech8lAi47.XHRGBgs21L3h7jLFfW0KYm', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1663, '20221341432', 'EGEMBA Daniel Chidubem', '$2y$10$epYrAqk/97AoH2esut4Ixeo2pJnEFzUxI6M2YShNTsYElNhFUeJxy', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1664, '20221347732', 'Ejiekpe Victor sochimaobim', '$2y$10$O6roQ1A50oQAePTPTIFK0eCwUDcsgx7GvKKqaBdxgUQ4QjVsJby3O', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1665, '20221342812', 'Ekeh Chikaodi Victoria', '$2y$10$kUPAwbUpzJbK/bSrqNYkuuhgtkzJmLqfLKim6ywy23TYcEKnux0nK', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1666, '20221327962', 'Ekeopara Ikenna Humphrey', '$2y$10$5bN2x1YvKChv/mywYQjxsunChLeZZCmTBm.2/G2azEeFWjH49Sv9K', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1667, '20221344832', 'EMEKA Miracle Chizaram', '$2y$10$/TL1wklU9GRBgVzNzWlZWuntN3ocfEMYkwboSeBrhdOw2nIWxecPa', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1668, '20221343672', 'EMEKA PRINCEWILL CHINONSO', '$2y$10$pywPBD2yJgiPxlzm6MF6x.4vz9TyX5GbNW0b1Naq3yW0IrinVdMbK', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1669, '20221324752', 'EMMANUEL GOD\'SFAVOUR CHIBUIKE', '$2y$10$rZ2K9KXvncSnqiduxwYDpOOymdXiEmquEpPQLiUJS.euLZSLAo1W2', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1670, '20221349422', 'EMMANUEL NZUBECHI PROSPER', '$2y$10$epV3RGu0DAtDPsTfO5.KkONAWGxhX8vfEukXMeJmfcaS.Lz1XTpSi', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1671, '20221313532', 'ENETE PASCHAL CHUKWUEBUKA', '$2y$10$GdrLHUb0NObQQVGaLrSp0.MaDi0KhMyZuRX7nzHRh4Bjy1H79l/0K', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1672, '20221357512', 'ERIC TESSY UCHECHUKWU', '$2y$10$1Fh3pi0SNtOs1IR5JW58gOvD2jZhlY92TloiSj25E.bD9b3yfNQm2', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1673, '20221340592', 'EZE Ugochukwu Christaugunus', '$2y$10$cU5bBTgRRQ6IHZjwBEcCiuUQnG2JIzbldnNsde/QdYOZl6CzLkRLe', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1674, '20221308222', 'EZEH Francis Nchedochukwu', '$2y$10$YpY9MqYMU80TBfJHUctjc.g2TZCRpQJMBLPV1vQO0Jx2OXIubwoHa', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1675, '20221331432', 'EZENDU Franklyn Chibuikem', '$2y$10$YmQ2mBxLRgmwzPm1Le4gbuWABzWHUmg/bacZy3GD.QG0xiJPVYAZC', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1676, '20221355422', 'Ezeonyeasi Valentine Chianugo', '$2y$10$OM2FtvEnjGXtz48sMMz7xeNcEBvFi.D4yUKkwgZWwlQ8XfFkQh92m', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1677, '20221324112', 'FRANKLIN fechi Norman', '$2y$10$X0bOGA45Owg/0KwVjCTLqui3Xegjf84jcOdxPu6JLZrBfFgik0ii6', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1678, '20221357542', 'GODSLIGHT Gary Chukwunyerem', '$2y$10$CdDx7l8L3Ztbyjf621bgPOVQ8fR2UYtx2UAUBq12UQdD0hVc/4ex6', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1679, '20221329692', 'IGBOSOROEZE ugochukwu prosper', '$2y$10$GJ0oKqroFLT2WPINPyaZpeSXbAgyoKvzggHSUkfxMS7Kl5uZP9LWO', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1680, '20221329072', 'Ikhenadoe bosede favour', '$2y$10$kp3GqJD0qG7vXgUP/sXONOtBByEhAXHa1VoK0wRD0uROW/GZhjp4.', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1681, '20221333162', 'Ikoro Emmanuel Chukwubuikem', '$2y$10$AOF79u52HprDg8gwdNnYIeiMrT8729920b3aBYvF0BoCJ77hgl43.', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1682, '20221336982', 'IKUDIKE Charles Chukwuebuka', '$2y$10$sKSWv2MmR7mk0cUgAGrHhu6HhndpVIZibpAgpJ.dBJ3CO11PKkgfG', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1683, '20221352932', 'IQUAIBOM EDARA DAVID', '$2y$10$1l6qx5AlDa.tiA.KdSBaR.AXIZDiJ2.AtQQxlBSHxIrjPG6sMvQLq', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1684, '20221334052', 'Isip Samuel Christopher', '$2y$10$rfML/P/t3PwCQiv8DPxxAOXDN/N.Uli07df5sSyT.pRuO3vwcCDRW', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1685, '20221339692', 'IWU JONATHAN AHANNA', '$2y$10$sFntTM44s6.hwgolA9mKKOzSzsz5ihxnPQTFt/SotETK1hIETboiG', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1686, '20221309492', 'Jatto Joseph Omeiza Junior', '$2y$10$G/8sliFYKypR3otL9OF9pusK2Erm4KEHznWfHj7dTI6FIE8MFx70m', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1687, '20221335712', 'JOHN Emmanuel Ifeanyi', '$2y$10$SO.m6lAOErJ36O8m2m3cKuUGewncJDhPvL4VRgmQH24SeNh30XuAW', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1688, '20221355872', 'JOHN Kennedy Chinecherem', '$2y$10$Aimz6RJyc5c/ktcql3NmxOuMK.d0DVyaFXVe83cNjgmGxPQl21ZG.', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1689, '20221339682', 'Johnson Janet Regina', '$2y$10$6vt/MoKwHFfZILh3Yup9k.P2eyF7EIZ1MfuNH0ZTMn6hjnwsJ/zpS', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1690, '20221351652', 'JONATHAN Charles onyekachukwu', '$2y$10$DtqUc6O6aQvVHSDPi39M7uuvIeNLv1uFGONC/iDpCx6eAS.wBWzGa', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1691, '20221326502', 'JONATHAN GREAT IKENNA', '$2y$10$4Kx2iLR3vIlFA/iHmclL2.mAa5L9YYoVbytq/jRHxKZ11rqSPQpte', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1692, '20221348092', 'JOSEPH Unimke Miracle', '$2y$10$ByphRLUaK5NedJTTervDBuktpWC46XBC4pZTnYVHiCe6/B370vBs.', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1693, '20221338362', 'JULIUS ONYEDIKACHI KELVIN', '$2y$10$WTrzNXxKSxBjNUKP6SGTZ.eyej58t0jmuNrhkIi4hqEyXRdPH4niS', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1694, '20221343272', 'KALU Christian Odum', '$2y$10$QB5fmi0.ILhGIEZQtoqm1uqNdWB4CfhlPDlcHMhyCWrQShZ1liy0a', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1695, '20221332442', 'Kelechi Wisdom', '$2y$10$Tm1yIH/ZqP2a.LazfGvh..s9rTHZf.jm3QDRNRMwa41w1QDGNPEgy', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1696, '20221348292', 'LINUS-ELEAZU Adrian chukwuebuka', '$2y$10$6TfDYAivrEtTeOmVTq5Y4.3/w5FQlrS2GL3HfShA5ca64fF0bCbhS', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1697, '20221331102', 'MALIZE munachi Kingsley', '$2y$10$A8FvoJ5G8RFTFypjO9kZDO/SlMkBwT7UG5vCWYwSgIPxpB91A/yYi', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1698, '20221325252', 'MARTINS Victor chibuzor', '$2y$10$FlrzEXmm1x5KBsnmWLV4yegn1E0Bwi6HXoaQAhf3PY1Ed768h.0yS', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1699, '20221344722', 'MBANASO uchechukwu obioma', '$2y$10$Z1ljEHQbTXlntI0vT.Bx0urfjoe/SRZ/8xkGEl9ZSN/fkS/LNgF22', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1700, '20221353082', 'Muhammad Ibrahim Eluagu', '$2y$10$bRzsVLnmYus8kZ8hj7S/QOBIuCIImG7xjRFOhE.iWUZVmYYNHNxmS', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1701, '20221317942', 'NDUBUAKU uchechukwu promise', '$2y$10$PeZvqpIGkZBSRKJPTtEG9eJHMkAyM5OswbR2UdgTKe57J2BaREidW', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1702, '20221345022', 'NDUBUISI bright onyekachi', '$2y$10$M3SWgS70cQGd3znqjMLqYOzngry5yMYwH3cF/2SdMCwGUU3mfamJq', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1703, '20221316242', 'Ndudim chuckwemeka darlington', '$2y$10$IPOYzDMKuIh/Ui9wN5P/BeITduvBsmCEu3EOdbDKN/TW1T34fJIFq', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1704, '20221359932', 'Ndudinakachi kosisochukwu Emmanuel', '$2y$10$0is1flFNs4T1Kn.tbBv8a.MxbrOg.UrnLDvYqxNaMI29Y5oyPr4Ia', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1705, '20221322702', 'NDUKA chibueze oliver', '$2y$10$mIsZcICIKJEV3H79MLpNFOrwIF2iF5dnIqodFWX0BGWDC/PNQhThS', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1706, '20221326872', 'Njemanze Chigozirim Bernard ', '$2y$10$aMLa0nT/h/xlhvdVoE.bMeTnZI5Hx/./AO2LjjIqkKJr7M6EE796i', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1707, '20221316222', 'NKWOCHA FAITH CHINONYE', '$2y$10$gE5eUU5zKJASKbKvkQv87OgrQxGWWrIO8ilKzjXjXDBv6iJqqEp.u', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1708, '20221326062', 'Nkwor chibuike justice ', '$2y$10$bjSFHZ0kBzJb8n/ZKrfp7On1.ZH/8s7wEg0J6CCGfS5h5dIzUT22i', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1709, '20221333952', 'NNAJI Augustine Uzoma', '$2y$10$n6dpjn67N.4q7ERM7uaJY.JnrJRJk2NM034VXMAwl3aOEz6QoWx.S', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1710, '20221342892', 'NNAMDI Chukwuemeka Godswill', '$2y$10$N9QOH./PmCaUb21oAOzG2.ETfMOSBoy3rhzWk/i2of9oT6SAkIXWe', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1711, '20221349632', 'NNEJI silas chinedu', '$2y$10$SCOSwTNf2YQQn3QNLiNim.sWInnEcHThTNJoezlGndUhwJoP41l5e', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1712, '20221319072', 'Nwachukwu Chimaraeme ', '$2y$10$j/KOTr3uMIH880NF891TQeH/GAh7YRvaItyuHFgnmdoar6ru3poni', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1713, '20221355832', 'NWACHUKWU Cynthia Oluomachi', '$2y$10$Uo07uNOxb926.p1AEXo8COIa85g.YLl7AjzNorz0xW8bAhO3MP7FO', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1714, '20221350092', 'Nwadike Duke chidiebere', '$2y$10$qN2dBQMstIbE9X52SndN7ehP/zOixDEaPN//abkd.ilkNeNVsjiyy', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1715, '20221350502', 'Nwadike kosisochukwu Michael', '$2y$10$G7WawShv1sCvPskpXLNpDOuNp2lHTy1CW1HwIqMYA.72qTEuOESjm', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1716, '20221338372', 'NWANEGBO Izunna Emmanuel P', '$2y$10$h0hJJLWy/YqAlYym7bA/MeLbHfoUVJw/NPwahD6NZraR3fl1mFKkS', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1717, '20221339922', 'NWANGELE MARTINS ARINZE ', '$2y$10$4pv8M2QMV9nQVBy8FuPl7Oxa/EiQWnxAG2/kploadBd4h6bNqC3K6', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1718, '20221325512', 'Nwaru Enyichukwu Rejoice', '$2y$10$Hy4.eWIqu1NKWOBv9XZoBeN1S.D2K9D0TrVzYrxR4txRiYir5FRdm', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1719, '20221360172', 'Nwibe Kamsiriyochukwu Chizaram', '$2y$10$r069b9uMcf5OCOfLnrY/3.tWiuzbH7bs/uxItqHOUAlcOzPow1.sm', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1720, '20221311372', 'NWOKOCHA Daniel Chidubem', '$2y$10$irgd9gpoq8FxV5AyQRNXr.6K9ExAGZyW1JHBeMyjTwP26RmZ4LA52', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1721, '20221354232', 'Nwokoma Jonas Ihechukwu', '$2y$10$XDBrDMh/Dvu8.7ttWSVjQeIICCbLncFz5xKNu2qK8NQFDR7g800R2', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1722, '20221320152', 'NWOSU adanna chimezurum', '$2y$10$FZo4R5xqaVV7so0N7BVQn.o.hTf7l.pxv5ofcDVLvH1TX79mc/qmm', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1723, '20221332992', 'Nwowu david', '$2y$10$h7kHLi3Vq3RlIa5TvzhpsORi76ycawWDpA9oa7HsTgI8mnfzv9g9i', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1724, '20221320732', 'Nwude CHIBUIKE EMMANUEL', '$2y$10$fuG2Yv6yxO0hoN2eEWRyPevAhlA9wk8dFkKXkQJaDs7MQllcGtzv6', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1725, '20221339622', 'OBIAKOR Chiemerie Hyginus', '$2y$10$6gyRvLKvNgOiwLRWiZhm1OqO2879qR/3b/Ne7fBoNyxwTlbYzYGbi', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1726, '20221338502', 'OBIDIKE CHIBUIKE ELVIS ', '$2y$10$c94LeuGApKTf9ktNb6F4g.sgFRWO.0rQh/6iekEmQ6rkz7wGMyFPS', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1727, '20221338812', 'OBODO FELIX CHIKADIBIA', '$2y$10$j.4JD.kQs4aQqL0HuzAlV.etIfCfDu6mg6ZaiAzChH9WkSiCVFeq6', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1728, '20221330352', 'ODII marshall Chibuike', '$2y$10$0LWYLzPGKBggz9Lor8uty.MU8I5FrrznH/HyzAxqpakc9d6feYa4G', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1729, '20221349192', 'Offor Divine chukwuebuka', '$2y$10$kB7sQ5mAzdUidvH2hFDuReTI/ZhnFno68hYE6Yax74yXP6sax94Ei', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1730, '20221357012', 'OFODILE CHIDUBEM EDWARD', '$2y$10$6qYvOppTHSip9C9SWpjv4uPAAntlU7FTSAz27e2jThMQgfzz2aezC', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1731, '20221344752', 'OFOEGBU uchenna nnaemeka', '$2y$10$DLWh5ioutap.C6OMcQ5YuejD9TTZDBAa7WzIYZBshENAePuNKHJW2', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1732, '20221330462', 'OFORKA EMMANUEL TOCHUKWU', '$2y$10$F29xKEidm88ymVsEwet7OON2i/0xdMiaebLD4IOiQ04Kl1xEUVj36', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1733, '20221337452', 'OGBAH Chidimma Favour', '$2y$10$4GqkGgHOj.ypHJXR/aFdDOkcUFHQBZEI0nxKPPZyKvKmVlR7Wwzii', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1734, '20221324872', 'Ogbenna Daniel Chiemerie', '$2y$10$iULxtwpt3cYCJFnwK/yMS.wdKR/wscrmT1Z2HdgHGMbkSx6letUZu', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1735, '20221345562', 'Ogbonna chinomso Brendan', '$2y$10$dxCO6lzE9s5cq4eBQPiGseH7fNv.C.KqBtoI.pP2BrDqNKf8WD3zi', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1736, '20221333782', 'OHAYA Pascal Chidozie', '$2y$10$oHdJd1vNhRGYfjZvQKZtJue/ZPUn.WPZfWVvCRojW6GfT7O23EtOe', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1737, '20221344332', 'Ohiri kInghenry onyedikachi', '$2y$10$VCI.Tn43Ec40tzTC4U/XRuxCRBlSnQieNoYlJ/Xkfskh/.w8/ElHi', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1738, '20221331492', 'OJEAMIREN kelvin oiseweme', '$2y$10$zUrf5wrzGWjBTRvMAj9ETOCfE24pepaTu4b4qmLyPl7DhKMd1r9xK', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1739, '20221347052', 'Ojimadu Uchechukwu Peter', '$2y$10$RakAZ4iqcYhomINUTa.Fl.hNCLE9B/Eke6HuBh2q6pTy5Uf/vmc8i', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1740, '20221324282', 'OJUKWU Emmanuel Onyekachi', '$2y$10$uVtnT8MKnqfyiamIqunKQ.XXoU6QmmWe0RW6Oec5KjDrjr95lBCiu', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1741, '20221330932', 'Okafor chibueze chidozie ', '$2y$10$I8LofFZBM1MUeXDI2XjdLOQu.aakWUWA98S3luS8r8Gy1nn37xVKm', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1742, '20221310982', 'OKAFOR odinaka paul', '$2y$10$XKrb/qAS.N/D5PkDjGFVRuozyxTd7YTC2pwWdoHtHpwIOOZzW.DOi', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1743, '20221322302', 'OKAFOR Samuel Obioha', '$2y$10$7o3cZ0o0Z1.68YTG96v1eOQjf9Dgv2tO91ql5fvFDt1gBX2fIUXzC', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1744, '20221315492', 'Okechukwu Chiamaka Cynthia ', '$2y$10$AOpF2soxciqbJaBgE9.4V.JJTQ5ca64nO.et2EIInXHU4zgy1KEOe', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1745, '20221359472', 'Okechukwu chiemerie mirian', '$2y$10$X3dtRyDltVPXu0.vp/wqt.yM5q.Bhgja7a.21bWSnUY8PuOu07ZaK', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1746, '20221322332', 'OKECHUKWU SHADRACH CHIZURUOKE', '$2y$10$iWwUWDC20Eqw5.KX/8/ZIeweGNO9dovMbbo6IKWnJQxJmsl.yqKiO', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1747, '20221346292', 'Okeke Ebube kamsiyochukwu ', '$2y$10$ewcGVXRhKDaOIZTpfaQlbuvNfMrdJpvAH5GuhAz0cxJEbGfgm1pQu', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1748, '20221336372', 'OKEKE Mmesoma Emmanuel', '$2y$10$p07NR/0yIK8ZQdkqWk/Yy.DDltS0QWZ8rqP.kNp2jK9n0Jb5xNWay', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1749, '20221358612', 'OKORIE CHIDERA Charles', '$2y$10$WBVKgHz25efoCfxDP8vkOOC/Lw/G/kUugRNxIzkRri6qIjejuRG7m', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1750, '20221330232', 'OKORIE Emmanuel chukwuebuka', '$2y$10$GL6reUeQ0pCLIqr7WZy/ou76H5CE652aocneoehsPea8F4nXRqqwm', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1751, '20221326182', 'OKORO Prince Chisomaga', '$2y$10$Q7xBnf2u26Cd8qyJOxem.ODDv3LqfXYIFJc/5.2OXFhMlKsh9mu36', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1752, '20221344932', 'OKPARA peace chizaram', '$2y$10$N0thyAEwWFrCPJb/XZuyduf62pbi8CcEqajrU8HmDlwk1uIGqdCyG', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1753, '20221350942', 'OKPO CHRISTOPHER ASUQUO', '$2y$10$3TAFGBYagklCkfMWZdmBReLWNa0dNO6urdY9d6TC4CEBuTtbDKKS.', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1754, '20221354952', 'ONAH shedrack kenechi', '$2y$10$tq1SVEohnXvsFB8lt5UieOcYRkihYahXaoqX6xw8hjLRmpVhr6ouO', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1755, '20221344732', 'ONOVO CHIMAMANDA ESTHER', '$2y$10$gvZ/4c2VhT.Sd2IC3cKn5./7WnihkUOHs2OgRvzdSKW5u6UW2O/s6', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1756, '20221344232', 'ONUH NZUBE GODSWILL', '$2y$10$8tBdC6rt6YNgL85zKUvjG.RQjzVB7AwS/2ZVchOp6YyQoKR.HixSG', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1757, '20221343252', 'Onukwufor Emmanuel eberechukwu ', '$2y$10$sM.Orz5qKEl7AdqaHADaTuWgLXTDF0WcsIgUtxKY77i4KCSXKucKi', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1758, '20221321053', 'ONUNWA SANTUS OLUEBUBE', '$2y$10$qhPmiEQ4rXI5JUGnENTLT.y2qio2Un6KYoyhisuEnNq7bW93KzoIq', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1759, '20221347402', 'ONUOHA-NNAMDI precious-levi chinonso', '$2y$10$N/ouvax0ipjqU1GJ3u4cdOwkTYlmMG4FN0QbG.91ByHK7L.V8NiX2', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1760, '20221317202', 'ONYEABOR Chidera Jessica', '$2y$10$Er2oykxOKqaMlFs38ywAyuHZwr2t1OmiRCvwSraL/zfMYRXIlTGw6', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1761, '20221347102', 'ONYEANUSI UCHE PROSPER', '$2y$10$FDY0dAIt2JoAQKdaIrRsC./M2JYfVxbZfsenNylYGX2KUf/HXrJ/.', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1762, '20221328382', 'ONYEBUCHI Chinedum Divine', '$2y$10$ESbktdu4l0KtYW8fxW2SHe0HWL4SqhqZn5/sN8nzsTyu36J9kl/MG', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1763, '20221357202', 'ONYEKA chinonso oluwaseun', '$2y$10$dhBzXk9kydKJRbiqSfPIeOtQ4R2HJFOhpxoQkL1iU46na0kLzQYUm', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1764, '20221337892', 'ONYEKWELE Chibuike Kingsley', '$2y$10$4GwjKBJ8XEYAQvL6LyBAPexEvNOat/f1TKv930k9NWVvpB/GpNxL.', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1765, '20221337242', 'ONYEMA valentine chibuike', '$2y$10$Kt9ugswfMC1.8KKTgwrmUuqN.1W5wAaEQAYHxTB9.NApoxT/9SdDG', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1766, '20221347142', 'OPARAOCHA FESTUS NGOZI', '$2y$10$kzoiOoHLi0Ll.t7TxQ.GnePskBFj.Tmc15rC5z8F6mE.geCnyXc.C', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1767, '20221346182', 'OPARAUGO rhema onyebuchi', '$2y$10$47alqp5vEI8.nCQfTPci1u.A5BW/V/iOhsi4/.1R587C2tWUcYLym', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1768, '20221321152', 'Osigwe Maryprisca Chioma', '$2y$10$Ft6nGJJzo8Hbqd4SXg6NKOU2gtAE73vCqByVmCjt3lWVME3Quo8jO', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1769, '20221330442', 'OSUIGWE Laura Munachi', '$2y$10$2GbbvUK2yPZmS2b1y8mwtu4xAk9jdBE.4/3emZLbYFfjvS8LDARIK', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1770, '20221359022', 'OSUJI johnbarnabas nnamdi', '$2y$10$/67mYwZ3EI97dy/rZXKW/ebgB/RJP.h9lQTW9sfiwzQD2ghSbmM86', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1771, '20221336992', 'OZOH Julius Chimezie', '$2y$10$TCYHcFWqMqG0chwTmTfh4OeQmUNs7SDqlON47qVYv0T35l75MA/Mm', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1772, '20221325302', 'REGINALD ogochukwu great', '$2y$10$H0vvU7GOkvm5FONNelwSAuv8V77pIIaa/9TuHhaGTyrmj1NjA/80S', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1773, '20221333802', 'Richard David Chukwuemeka', '$2y$10$WfbB9ICJCx9uPOHrHsHxHuK9TLsHhySFkk0DgJiCZFH9f1wpEo7ji', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1774, '20221308312', 'RUPERT Alex', '$2y$10$JAjdITxq1/iQqW.NF71e8eqH8Ie8r97alRf.8r2mxwBm/yQWvpURi', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1775, '20221325742', 'Timothy David favour', '$2y$10$T9LRAlSH64OAdm4y2L.Na.sfkJyTH6UgJyJjQaBt7oBcjlc8hYleO', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1776, '20221350122', 'UBOCHI Daniel chibuike', '$2y$10$ZyH1TqP/uqxQ.yURJjhEXOELZiQ0gsNln/r0QWGlF/ZxdTeZ54fu2', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(1777, '20221314622', 'UCHE Emmanuel kalu', '$2y$10$8L75WvFl9Z3cX/Waan1fj.R5fHToS8qegr/EjVOw3h9o6LGEyOvTi', '300 LEVEL', 'INFORMATION TECHNOLOGY');
INSERT INTO `users` (`id`, `matric`, `name`, `password`, `level`, `department`) VALUES
(1778, '20221318922', 'UCHE-OFURUM, Daniel Chimereze', '$2y$10$5jKvtJ0l5.FDGPwIACyYgeetvC8buwmSpbKDU3Qnh7b7WKxzKtvOO', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(2444, '20221344642', 'Uche-Ohia Chioma Christabel', '$2y$10$jgwcGdR9XCGM5By3TfV8UuRblGePnaYzJUfCbZTbfJ.b.Eq15I3ni', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(2445, '20221329452', 'Uchewuako success .c.', '$2y$10$zs4daDt5Nf.qLpIuUqiZEudvZ0i0ZWNqYhN7ttXZqCnUDW.xWsH5a', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(2446, '20221333882', 'UDAH Ogechukwu Young', '$2y$10$a9j4icpEsd90X0fG7/5xLensa1NbBuEMuTUBwueJe02.wuqarzVmS', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(2448, '20221348702', 'UGWOKAEGBE CHUKWUEBUKA ', '$2y$10$CVyAwzSQSS4/2Ra9wpBClOlrkPsUMK6Sc1nOUGVaDZRDavxvMP.B2', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(2449, '20233406772', 'Ugwu Emmanuel oluebube ', '$2y$10$put2kSAWXXtcwAFoIM0Zu.fUq/i8NPowbeLGsQZI47GWHAeESDX8m', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(2450, '20221316532', 'Ukachi Divine', '$2y$10$vIt459Hv5QpTtn4j/YmtR.eIq0lj0McNVKmSrd80yz9sXy124zwCu', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(2451, '20221339632', 'Ukaegbu Favour Nneoma ', '$2y$10$69G9N56iiIMaH9f9eYti3.6ZATra3t6UmP7lsmMA0AXcgWuyAO38i', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(2452, '20221349182', 'Umunnakwe Chidindu Anthony', '$2y$10$ukBkTOWRvWHYfmSebYcFf.6/F4w3dfV4pdaGoCn6cxGwlxh4L3YTq', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(2453, '20221346752', 'UNAMBA Promise Chibuikem', '$2y$10$.rIIXX8msA36c9zKC83XruSqVSVbki1QUczj3F9px1qvUakEM.BX6', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(2454, '20221336702', 'UZOR chisimdiri godspower', '$2y$10$Aq.yeK84WcOzd2iOEbBI5eB926BUqOG7N9hfDKVJVDVTQSW9FLmUS', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(2455, '20221335032', 'Venas Sharon Oluchi ', '$2y$10$qDP3KP0eVM21mjZQEXZLOunRC2ze.nmCgi.FxwPprWicskwFFKtLi', '300 LEVEL', 'INFORMATION TECHNOLOGY'),
(2456, '20211292402', 'Aguoru Chiagoziem Divinefavour', '$2y$10$TPYuMEy6tBL/8RqZxaLkDew1V0Y25thaGcnq6hVvT8ZWn7.BBLPnS', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2457, '20211284402', 'Agwuoma Chidiuto Francisca', '$2y$10$HVeIZ.Io0lJlaiKnSVqFcuByUbOQXpFMX1kpp.6.JRJ1a21vGfyuO', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2458, '20211282642', 'Ahamefula John Nnamdi', '$2y$10$AMTVMIufzAKpigoo3OOG.ecq21nNqLN1F0Mwo/me5mKHUGngRemjm', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2459, '20211267612', 'Aharanwa Elsie Somachi', '$2y$10$ZRXNYUt.rLIZ20kKrYKtveg/skVPFP/M3uaQPwJNKEQ1phc1m6YA.', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2460, '20211299142', 'Akinrogunde Adedayo Olamilekan', '$2y$10$kN89ZJ5KTYj2BLX6SKlb7u5AvomauJ6EVSnVPVIUu8npwN5YvIgOC', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2461, '20211299732', 'Alaribe Daberechi Michael', '$2y$10$7ZNyofdVsJ52qbVmuDJizu9kAnGG5IMplgSVlNncH9.336MJ11nzK', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2462, '20211282852', 'Amadi Godswill Uchenna', '$2y$10$9sIEsYYGg6jmnbAYRBsC7u5Crib1xA9q6KTGOSl4LfPT.2albHtQO', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2463, '20211289962', 'Amado Christian Obinna', '$2y$10$j7hYQIyrwKb18Kwv2d.BxO89NHCTnWeWbZAMV/XcrHehPieYRgojy', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2464, '20211282582', 'Amaechi Henry Chibuike', '$2y$10$t5cTS1lAF3N67J3BpEfrXOAokfI0iB4ZCO0bUT7Yosrom9IA3EI7y', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2465, '20211269772', 'Amaechi Victory Chisom', '$2y$10$c6CS9iFsstRgriNm64pX4OhrK7zsLvq5B/CM.vN7uhy5OA0vOmV7.', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2466, '20211289782', 'Amaefula Excel Chidindu', '$2y$10$9J.FZzDQr.0Y3k1sq3afi.z626DRizZjujmQKCbqerNMnqQiMRDIi', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2467, '20211268042', 'Amam Prince Ebuka', '$2y$10$FDTb6c6McN7rfj5GEGcoIu8yhJ48CV/2XoEVHfsib7aQlw8YlG7bO', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2468, '20211260402', 'Amaobi Victor Chisom', '$2y$10$EHRSmAoDvjPpUX73pAWDrOKpi8WH/87sPmNNPn.E2QZqO.2yxejyC', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2469, '20211267542', 'Anayo Chukwuka Johnbosco', '$2y$10$KNu9IsSy97cK..w5VCBlZeQO.WXhmxmQhQLl1jGsiLvivQWFchnL2', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2470, '20211294102', 'Ananike Eberemna Godspower', '$2y$10$iVLin2Nv1yhzAivFYjYD4uE7Th9mSHsj3hu22GkKiIkVV/Uodt1oS', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2471, '20211290052', 'Anoruo Chigaemezu Alloysius', '$2y$10$swqVPsgDnPxnlP8bDe3tkOVm/BMLCbyHgMnXp4wREjWpiwZe/AVKm', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2472, '20211302742', 'Anyaehie Miracle Anyaehie', '$2y$10$qzMOR/YQiIT3KAOCIN/2d.Vm39g7VoNzwWtxGpiJ2TGxjC/3MEHra', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2473, '20211293882', 'Anyanwu Divine Kelechi', '$2y$10$DV7juql1dh9Ks2InfGR68OvACiB6uwg.VB5oBVtL1LG25Aoxk89rG', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2474, '20211267292', 'Anyaorah Chimezie Precious', '$2y$10$jWB2XEjOQn21enSh4ZHoHehSlYhm/GTnqpniLxjKRMv1MRMMV6nBi', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2475, '20211262662', 'Augustus Victor Chisom', '$2y$10$YCW0TEL4PnLMxEFrmG2DPey8KPaIfywl3yfgQE8b9tJ7N1BKz4IXy', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2476, '20211264332', 'Awa Avalon Kalu', '$2y$10$GnexYVGoQsUjhgXxw4VpkupFBp.iOAvpI0XVAxplgOctRB4mYXE62', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2477, '20211277572', 'Awuchi Delight Onyekachi.', '$2y$10$lWajXwse7MNEKuQvW4HZgetN7NTqVGdQgr37/RLxFPUpMLm6B.nG2', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2478, '20211293912', 'Charles Emmanuella Amarachi', '$2y$10$6OnraIqpYrjWhTp..PXzG.kawQOef789y/k0Eu.oE5xBRFsxup4He', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2479, '20211301052', 'Chigere Martins Chidalu', '$2y$10$vw7AQNLt9k6QZj1lkPeWxucx7/vRmAewFHfh6Rd4yu897RqSYyoya', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2480, '20211295242', 'Chukwukere Emmanuel Obinna', '$2y$10$xqP1R2QdcQkpmI33r.KqjuSTUrbbZEmvvV8WV/lZIMfvCR19XPL9a', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2481, '20211287812', 'Chukwuma Favour Chimuanya', '$2y$10$tt5AFcyKjPgbQnsQNWcg3e183nUTmbFwFvj/xce0Yln01pWw0RGeq', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2482, '20211302592', 'Diala Joshua Chukwuike', '$2y$10$O4TdizvKP0Y.MrN8FafHcucv7r4wSsZdHT4ygsP87qt7ZOAF2nouS', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2483, '20211301722', 'Dike Chidera Daniel', '$2y$10$fh8EuXz5hBeaZlk6LPR52eO/Sw6Ad4alHrFy5aOkb3Ky2qfpL3hRm', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2484, '20211265652', 'Dozieobi Chidozie Donald', '$2y$10$w2wDqFd2mftCjffoh7Mag.RBnECw/fgxiCuljHe06CgTXJt8YtjW2', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2485, '20211280942', 'Echere Ugochukwu Samuel', '$2y$10$UOdNRy7AQ21xzkdPUPyJru1WhtvRCM1QpbKpopV2/9Q9c0JR1w53C', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2486, '20211272672', 'Egemba Chisom Godswill', '$2y$10$wBRAb6nKqDAQh/CPpi10l.2DQV03n4Furo5CDb8ZiiwYr4ulLEGCa', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2487, '20211278722', 'Ejiofor Samuel Somtochukwu', '$2y$10$9R9y.PrHNuPpGj..1KseA.1EXqG74kBJ3Rod26Cl.F86gkx4Nd9bW', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2488, '20211263522', 'Ejiogu Henry Kelechi', '$2y$10$Giqet/m7QTFUsL07ScqZT.vQm4N0nb86Mi5haY6PSv/OzaMn7u/V6', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2489, '20211290712', 'Ekwomadu Marvelous Ebuka', '$2y$10$TaTIH0.yhqQYmxekskLuu.hMcn60EFCuJFrFM.8XLloAoA/HUsj7W', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2490, '20211261342', 'Emenike Kelvin Izuchi', '$2y$10$1dcfJbY2mpssHOBPzMKNjeuu0SmNQj4oXBbWGhCBBAXYrJSgLmori', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2491, '20211261352', 'Emenike Kingsley Ikemba', '$2y$10$Jifi68kVuobnn4RyVrly2e7SXKc0JunzLxP6tEkcgy2DfkSusLzoO', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2492, '20211269052', 'Enyinnaya Uchechi Rejoice', '$2y$10$rom3/F6YhgxzKZeFoRJAI.uZ3kG1a4mKpqxFEZSeeSn.MPE9HbRne', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2493, '20211266232', 'Etim Ediomi Celestine', '$2y$10$1dfzZJDFrBzmPY2g1hRpsuuBDiNb7En6cruzG9WJc.l14kmmTjl2K', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2494, '20211285542', 'Ezeh Franklin Chidubem', '$2y$10$e6Qm/ovslf7Qwgz3jOa/zO9cbOhJ4s2ZNLRTIv57unODadN6HJ69W', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2495, '20211263652', 'Ezennaya Augustine Chukwuemeka', '$2y$10$MvF4qi4ZNtA28ZuJ0iDA7O1QynwRXsEwk08AyXa35teIBRZjvvhPO', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2496, '20211298692', 'Eziechile Nmesoma Blessing', '$2y$10$pmhnSJzVL1LF2HuyyXlPJ.sx1s.2frRq2s2YScgoxkfH/wVPQ7tCW', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2497, '20211271402', 'Frank Ugochukwu Benjamin', '$2y$10$xDfnwzNsA9F9URVYjo/RWuLkZMoc3Udynx5TfH1kUg8JHgNS87agu', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2498, '20211290732', 'Gabriel Emmanuel Chinonso', '$2y$10$SiBXmTKbKyaHS893fqIc9O/bT1QQwsXcrNpiuNWH/vlxIj1sLaAOu', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2499, '20211293032', 'Gideon Marvellous Chukwuebuka', '$2y$10$D3Bnyc2xL7ySgl6EAr5IS.Rp8gfETTIS.Wf806VqW5/qVKNg/zStG', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2500, '20211299212', 'Ibekwe Jefferson Tochi', '$2y$10$6Hnq2J4WoD8/MCNT/DhGPOrCnPPZnD1ILM1WfB2.jgnebihninl2e', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2501, '20211299022', 'Igbokwe Ugochukwu Walter', '$2y$10$WqGtaGM8iOpUimc4ga7k5OFfMGPlm8SiwI0FX8wMwhSUm.b.IYmsy', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2502, '20211260982', 'Ihedioha David Somadina', '$2y$10$49kk6w44DVlwNwKLv9ynTefwZG.AMaUUjPQ2GxGW662PM2XxoKfPC', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2503, '20211273572', 'Ihekwoaba Success Chihurumnanya', '$2y$10$oeHcj7R4ioz90/7V.NEzeejm141GAM4d.nIuP.It6RlA7AkIPNHwW', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2504, '20211292002', 'Ihunweze Samuel Ugochukwu', '$2y$10$Cv2oJ7Q78uyXlFme8oNXIebLYY15J5hRP4fLoHlf5kJhrOiY/HwjW', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2505, '20211290152', 'Ikechukwu Precious Chidera', '$2y$10$gxCYeoTT5MwwK2RWB6GSDeAXB/Tc6ZQgWqdeIet.zgiVCu6lBHgxi', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2506, '20211263142', 'Iloka Onyinyechi Judith', '$2y$10$mP4nd1yLohi9OvxaQnGvAOb5dx9Exzuik8XQ.fHLWCpafPGs7BBVq', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2507, '20211271432', 'Iwu Precious Ifeoma', '$2y$10$pecfRJMVH2gDPZ9S9hRaEe/NpCHhADnbHtxqrkay4m8GXpEaKrt9a', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2508, '20211298852', 'Kalu David Ikechukwu', '$2y$10$K2tM5JldzEOvC1RQYH/WV.T2qI25bRR8biYD4IdDRBs8GlnRl81ny', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2509, '20211286162', 'Manufor Benjamin Amaeze', '$2y$10$UIcmqq9RPDCFOy/rWA8ANOgCm160uN6I65p23Jbim01UUb5ZFrhjC', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2510, '20211266022', 'Mathias Benjamin Ekenedirichukwu', '$2y$10$tTBPV9EoZkIf5ZUrDz0jq.8v6ECnHhUHIZH1GzQjDjgpsD5CaNFQ2', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2511, '20211298702', 'Mbachu Victor Ifeanyi', '$2y$10$blk9hBgTnTQJPp8YmuvaAeWguYJOVZjRDGhfInWZK9scgx3jmGfR2', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2512, '20211300262', 'Mbadugha Chukwuebuka Precious', '$2y$10$xY1WJUUYTyAoDcXIVZ0ekeJPf9gdiiM/0QSLmZGzu4UFpyjII0wMO', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2513, '20211262642', 'Mbaukwu Precious Amarachi', '$2y$10$/axry/n9jKnQSoSW4bkftOuFbbBFbCVgpaw/U1aytWZ1a34l1nnx2', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2514, '20211272452', 'Mberede Anthony Chisom', '$2y$10$49Hx17cZADD5KCPQ66erZ.lPPv1xZ4YrL8eS0zpiE2WI0hsXnVijG', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2515, '20211265612', 'Michael Favour Chukwuemeka', '$2y$10$KOpi2eB2QzVabXa851zFyOd0yWJLa637QTS65OseVS1qY8UbAW5tO', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2516, '20211282682', 'Nkwopara Onyedikachi Paschal', '$2y$10$YBmRng04HK5PxrrTn47yXuLgweTF3ttYzTKOQqevbQGS9RwwAmZI6', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2517, '20211302752', 'Nnacheta Victor Rapuluchukwu', '$2y$10$KyjbZFRuo1ld2vGcdBXYJOAzMZnEOFepyvu25gu23AjDWNVP62ydS', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2518, '20211285512', 'Nnewihe Chinedu Christopher', '$2y$10$aEa4s5UYuTXitLIn4/GWueJlLrCe1Edz8B/YEhb2qRYa1axA3wf9.', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2519, '20211269162', 'Nwabudo Vincent Ugochukwu', '$2y$10$ikcqSuWTpMiWCgakzr73DuVgz/3MWBRkl3IAX4jYlU3hZiXTn3lee', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2520, '20211287192', 'Nwachukwu Akachukwu Chiazom', '$2y$10$kWbDFNfxK8U4bmvvz5pyoOF9O1rpbFQ6kWoLtqaTwLFiCYkYcoqqu', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2521, '20211265312', 'Nwadike Chinecherem Favour', '$2y$10$wLJ3khyzL1cWlZfG8uuSoOkfExHZlDrvbxkUYWTW8TLYlcAunvK8m', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2522, '20211274832', 'Nwamara Dominion Chinaedozi', '$2y$10$kxI1tDr3XhIpn0.6lgRT1efWoe5LQan78b7gfEQlwTjBZwABsgaIy', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2523, '20211287872', 'Nwobi Victor Tochukwu', '$2y$10$u9aOu.SoXqOBwN2ioYBYH.XhHZ4n6iETEd1puSEqXnoe3IMMAedF6', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2524, '20211288082', 'Nwoke Kelechukwu Chibueze', '$2y$10$qnn4cLWXH.M0Dtm0TRhSOuEt725zXOAH7k47SjvYx.gZmq7QLaFIu', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2525, '20211304462', 'Nwokorie Henrietta Kosisochukwu', '$2y$10$hI.ara1RSY/5hA.ajkAohuktLodS86mqJvh8kOA9jrrbiCffkjSjC', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2526, '20211282822', 'Obi Chukwudumaga Francis', '$2y$10$mLqNfTckDKilM2lOPDCyCe.K31hQEiFRz4FE4Ar3Ct0u2IS79S9Qu', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2527, '20211290802', 'Obiekea Uchechukwu Christopher', '$2y$10$5vJPZY5wYQjoqkEOhnNm0eTZxsnx9kbLshqbSopBw4PYvh/A9FGK2', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2528, '20211263362', 'Obi-Onwudiwe Zoe Chizurum', '$2y$10$b/CsLP1URA7mo4BYyI6hWeB/uLVFA./CeIYx9KHe6J9t7oJrri1gi', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2529, '20211275342', 'Obiorah Marvellous Kenechukwu', '$2y$10$3W/avdwa7pbe4kwe62C2JeCuF7hH8VwX2.8gHYphPR29CbFrR8nXm', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2530, '20211264942', 'Ogbonnaya Samuel Chiagoziem', '$2y$10$z4C9y9K6vgI4HbhZeKj9/.JQSwQYpV6HhTmZ.XS/0u4zHLiA/v6t2', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2531, '20211282462', 'Ogu Gift Chinaemerem', '$2y$10$tnrDT3tMTx8D9bA0j8sejOrvwgqI/BKNIkYir4yu1fAK0VUKsKHfi', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2532, '20211260702', 'Ojiako Prevail Udochukwu', '$2y$10$0rhdES1M50YrPqJiZ0NSdOb0S7rkQCkvGamBXm1xAc0VXFbljs3Li', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2533, '20211266672', 'Okeke Okwuchukwu Joseph', '$2y$10$MmFV4PI4Hf3gt.EtOyPTzeo7k0B8xxBDyj77b74VI51VROcJ2tXBa', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2534, '20211286502', 'Okoloigwe Chimuanya Patrick', '$2y$10$TVpS31J3yWwznW9rvZAusO6OBHYon2BoHG38E90yqBHnc0HQM3Thi', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2535, '20211258122', 'Okoro Emeka John', '$2y$10$aI4rGF3cFoJDbPJtt2QfWuSJi4dyoh2CCI0afbxn8pocOARmG9T5G', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2536, '20211262142', 'Okoro Wendy Nmesomachi', '$2y$10$dF/BbL885FWZ0/93j6PiWOinwOIHeGaeb.Dtss4AfLkwLbqRbkr8y', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2537, '20211259472', 'Okpala Gregory Toochukwu', '$2y$10$aTMm/tAqfvHBp1J6H.pt7.z3PG.yATvjGx7e/4E6TrM7igFFbs97u', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2538, '20211284992', 'Okwu Ikechukwu Emmanuel', '$2y$10$ATdp2naZSi/I2dh8M31yZuQ81vH6HAA55x9cUMz1PPajMlsZqBv2m', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2539, '20211266752', 'Omenaoba Kosisochukwu Bonaventure', '$2y$10$H6EvJCQFvUbvs5YU.I7aAO6JaNXoF/TvFTsE5GAODX0QstTIukqoG', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2540, '20211272462', 'Onwumah Chigoziri Chibuenyim.', '$2y$10$sgwsD5/ZHL8sHu4vLe4vQeo5HrEWASdIG8hu0MdauNZzHy3YJaqZS', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2541, '20211292882', 'Onyegbule Dunamis Chijindu', '$2y$10$Xcj5caVikRIPN.6DxE5xE.B6YNq9zuMhsDNW23kTjG2TdPEmW03sa', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2542, '20211283382', 'Onyeka Chiamaka Maryann', '$2y$10$zmfLGRgjI1yoOzlzwVBJGu79/SZQHU77BDegr2mJlbHTf.ooQzXQ2', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2543, '20211290032', 'Onyemaechi Joshua Chukwuebuka', '$2y$10$QPVfLJ8YrqlviQoTpKg1TutgmLMXVpqw89wxjJJ3veps/XBKk2MhK', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2544, '20211272642', 'Onyetorochi Michael Chidera', '$2y$10$i4TD3ojAmAhqk.eJiX7N/uUWgM7i0dy/gHXtLlE7QQbPn.UCgAE36', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2545, '20211283702', 'Opara-Chuka Chinweizu Ariel', '$2y$10$T.zakB7g7T6hqZAQJY5xQ.83UnHzt2Fj4YcLIbTRL1zNb7oZpEmsy', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2546, '20211273542', 'Oparanmegwa Mitchell Munachiso', '$2y$10$F9hf49.CVNvLFrUP02EYNetdiYorzb6bZT0ylsBCZ4aK5MA/DwmUm', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2547, '20211279822', 'Orafunam kosisochukwu Clinton', '$2y$10$LAtZvf0vDjKuqOV0y55BZ.DLYEAgVCpFYYYhc21tDk1k4c5I4J2Di', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2548, '20211260382', 'Osuala George Chukwuemeka', '$2y$10$mmnqmaA73YwEJRq69cpVXeRJfmZKwMNs9bexfjtHrbIbkYs55qPKK', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2549, '20211281542', 'Perez Amabuo Sanderson', '$2y$10$73Y.tdA7AVLtROcAJ24WxujQlsYgJjUyz./mQT1pa04LvqO4d1EJu', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2550, '20211278022', 'Tasie Godson Christian', '$2y$10$2FG5XGw5RK6V1YidzfALUeH1TQMvmX5kuzaEcqFwfUnCukB9NnsQ2', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2551, '20211272042', 'Tochukwu God\'sfavour Chikamnele', '$2y$10$mPRyd5j./yGwunMB66YyROkrFFVJeb2q7RkX39uEi5Lsntk9PRImq', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2552, '20211278052', 'Uche Chibueze Favour', '$2y$10$FSdoOf1jqghL9wKY8QoPFejnbaOWTjmIJ7dUl4T0uxVhmpMms/dSK', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2553, '20211286242', 'Uche Peter Onyedikachi', '$2y$10$w0Xv/x0EODslFpp1RVlgqebkz3/vEshfPFo6dPD1rNkyDvevPIDr6', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2554, '20211264432', 'Uche Victory Chinaza', '$2y$10$Mv2gb2gRWQpyG5GIJStPheHw6HSJAEldUdMPAt8gSgInE0/m.9C5y', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2555, '20211261792', 'Uchendu Samuel Chinaegbomkpam', '$2y$10$Rh5NUHb5D06QHMbJBlxGVOym8xyV30nXkjduyqSp.fDckNhxcwO3a', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2556, '20211293132', 'Udeh Grace Ezekiel', '$2y$10$RNyKe5d0Y/aJtG5pCcsejeppZ1yyvcgC8Tl3uI6Wrnc.sLNvqx1U.', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2557, '20211266742', 'Ufomadu David Munachiso', '$2y$10$RSdIJDpyTF/LxxPqcYrkM.F7TCw4eKzL7qa5qd8sGCIsSEBN2xL5K', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2558, '20211276882', 'Ugbor Stanley Chinemerem', '$2y$10$E80.AiMizUZqiicoiTvMceScyOpuVM66wDoMqSlImRqlEg2EGti9q', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2559, '20211295902', 'Ugorji Kenneth Chigozie', '$2y$10$K7pMQ8dm6wI87z97BervyurvdsQikVcg6jYAthKp/IlZjR4w7JF.2', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2560, '20211286522', 'Uko Victor Kalu', '$2y$10$uir4wYu3tE7OAENQz1Trn.oMQvk54xu7dZ0Vms0kzjjWxa1HPSvKS', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2561, '20211264872', 'Ukwuomanwogba David Chidi', '$2y$10$N1MfQdImO93mIqR8tQG8YOKa1C1pIwrRdjg88OgKZckort.3Pe5Se', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2562, '20211262202', 'Uwalaka Ebubechukwu Caleb', '$2y$10$ahEg1ZaQdpjKeHoEmllOKOQ/HjeZN5R4Pk601fR1eYOrPXrgGOuz6', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2563, '20211303372', 'Uzoukwu Ikenna Edward', '$2y$10$/DrEQ9gaFqLYppvKb52FZuq1kns6BrQ0PZmC8BrN596xiLZ5suXNm', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2564, '20211270232', 'Uzozie Emmanuel Chibuzor', '$2y$10$FqHgokqLSCkqVYL1/NBKOetx3/QfX76qYRcFwj0Xp/Scp68Jr21Xe', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2565, '20211276942', 'Young bright onyedikachi', '$2y$10$n8xm3MolcnAUY/tYi0zuP.tdpsUCpiSYqjFsHMoGxzIH8/Eo2HMai', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2566, '20222340262', 'Ukachukwu Prince Okechukwu', '$2y$10$dbyrpAAdt1MLHM7IH2xJcOMlaLYp7UUaIOTNqE0C25Xshd6iMsRnS', '400 LEVEL', 'INFORMATION TECHNOLOGY'),
(2567, '20201230326', 'ADIEGWU PRECIOUS CHIBUZO', '$2y$10$tH8zgp62rX1IlqgNbadW0uBE/bExioDlJL/eDjAdjHP11vDOimUU2', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2568, '20201213076', 'AGUGUA CHIAMAKA TREASURE', '$2y$10$P3uiC6XEI7L8Rcnv.yg0eOjkHU.tPLkh2vaOeFT.JR9Jkkze/Hkiq', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2569, '20201208302', 'AGUOGA GUY SOMADINA', '$2y$10$Usd.s90klt8DskbIZPEUmuDwNT2sMrW44L73pBWYr1qT3t4CxDW/2', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2570, '20212298072', 'AKANBI ADEKEMI ', '$2y$10$WRSntqeOJUnBzRP22OV11OlzEetdvGY/W2ZB40zv8t5FFw.SY0L6a', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2571, '20201222232', 'AMAECHI UZOMA FRANK', '$2y$10$Gd415NI73DABbAB6DeJZluC6bhx8bGgcTAeaDUQKfHl04ScCcBMIq', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2572, '20201213252', 'AMAKA CHIBUIHE VICTOR', '$2y$10$LDmTFbWh.cewmdQ7jEAhGOhM8NqndTMfmwl8StETO3i0bagkZMxKi', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2573, '20201216812', 'ANYAMELE PRAISE IKENNA', '$2y$10$qc/O4XrDs8tRlxHjOKiZTORbrtEkgUctzNCyDCc2Wnvy0/Hapi.Pi', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2574, '20201212442', 'AZUBUIKE EKENE VICTOR', '$2y$10$eSkPCxDcjJL2Nwl.dx7nZeRHZsLzK1rHikGAcfBP4H7zr3H0Jf0eS', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2575, '20201215602', 'CHIBUNDU FRANCIS JUNIOR A', '$2y$10$BmOvUJajU.63YmIfpR/5d.o148QWoTdx.GLmgFaY2BLFU136/wOjO', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2576, '20201228562', 'CHIDOZIE CHINEDUM VINCENT', '$2y$10$l7F362UPvqH/3IZylzZ1U.fzxMBETiBSmvbAa2cSr7hRH/LTkuTKG', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2577, '20201230032', 'CHIJOKE VICTOR NMESOMA', '$2y$10$Q8YVgeOmopkTMaSBhbeX4OXfXrnZldO60K5/5QqOvZdOASCBo4nre', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2578, '20201235432', 'CHIKA FAVOUR CHISOM', '$2y$10$Wf86nNmvw6Nc.keaKc49L.RI2257o9ugUR7DTw15TZHBYm7TxPCOW', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2579, '20201246662', 'CHILAKA VICTOR CHUKWUKA', '$2y$10$Z0PxbDP0ROAark9XO3WngeyKYhvrfRRi8KO4b4mdcxCAK6VYEgmL.', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2580, '20201220356', 'CHINATU DANIEL CHIMERIRI', '$2y$10$fK.CbHPTIg6AHCVs4dHs/egMtAXJyKQRargOCQOvH5hD4zYS3Ht1u', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2581, '20201213322', 'CHINEDU JOEL IFEANYI', '$2y$10$R.n6C.LJ1gaxxbr0UhJag.lcKhIsPh0B24QAHIJiJcgn5efD2xshm', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2582, '20201253912', 'CHINEDU KINGSLEY OKECHUKWUNTA', '$2y$10$MngjFrm.JrBQHo6So/qd.ulrjqLIqUXMl32dlw6mAOG0gA3HsZEiG', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2583, '20201242442', 'CHINWE EKEKE EUSTACE', '$2y$10$h.lkMf62zLpYrU76GjXvv.fmVhFG01QMSJwCux9FG.oFpDCdbNLYK', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2584, '20201240592', 'DANIEL CHIBUEZE CHIAZAM', '$2y$10$EujMy49CNfyuZP5X0/Qnb./nRrBHQ9F83B5RHo6DEJ5XUiYhFhjs6', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2585, '20201217912', 'DIJEH SYLVESTER UGOCHUKWU', '$2y$10$U.3dah4/ougw.6MQukH/mORzXKrBk/CcHKarWvWrjE.L7kirqNTpy', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2586, '20201204542', 'DUNUJOSEPH AMANDA MUNACHISO', '$2y$10$fGw2Dt9V075tjjb9Say5dOTrNC8PzTZB12w.pQKNSEgSJZ97c3Iyu', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2587, '20201227482', 'DURU KELECHI SAMUEL', '$2y$10$n6WDjoBFG3f841zPyIjZ9OLKQ2BVv.DKF9Vj0Q9V2LS4ci/HhW4ra', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2588, '20201230092', 'EBOCHUE WISDOM CHIZITERE', '$2y$10$zMf3sPq2qxJC2t4FKrXybObmN9CcK/JLz5GRHmeYdQJaL7f7MKeBm', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2589, '20201237952', 'EKEH DIVINE IKECHUKWU', '$2y$10$IgSS5qZ3Y5jejE0GNbSz8OG0vJ6TSD5ZYmNNS0C/y0WV0D6LlHggO', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2590, '20201206702', 'EKEH OLUCHUKWU CHINEMEREM', '$2y$10$KtvtPFiw4ytQ33o65UrSoOPLMx12MxN2PvT8IC6Dz.VYEiZ4Vi49W', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2591, '20201232132', 'EKENZE FRANKLINJOE NNAMDI', '$2y$10$x60Kt1wZbyGIo2Hf7nhUZON9GiqqyGIgHrJTtUk4l34uGv5nzAuBK', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2592, '20201228502', 'EKWEALOR IFECHUKWU ANTHONY', '$2y$10$255qLZkAdH.gSZ6kfza29.5Zrw.KiTl0oSWA9A3AM.cimV0kEEs.W', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2593, '20212298192', 'EKWEM DIVINE UCHECHUKWU ', '$2y$10$J6zbOVaTxockb2zdb936guCebXvlKpBORqSI2aYBfTHw/oSF8l7m2', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2594, '20201244992', 'ENWERE DIVINE CHIAMAKA', '$2y$10$akNLbR2i9t6t8dA7ct6FEuGXko9rbPaJbdq24M5K3oxB5XQ8pAcWi', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2595, '2021305202', 'EREGE JESSICA CHIAMAKA ', '$2y$10$AA1BYwQIxpZs/3nYcNIfgu61MNyopJj425mPj6vN3eF8TRzsH3BDy', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2596, '20201220833', 'ESOMONU BRIAN ESOMOCHUKWU', '$2y$10$wkJI6sUwVh00csTxeQU2n.I74VqsklPcwP1EwPUd3zOlNWdF7ZlJK', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2597, '20201213762', 'ETOAMAIHE UGOCHI BLESSING', '$2y$10$MGv46LzVijMRX259jQuRgOh5d/QYFbv96nDhs6wqzK4psucrc3ZN.', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2598, '20201218612', 'EWALEFOH RAPHAEL', '$2y$10$Q71TIC2vcuA0LFh7bePj8u.naofXLn066kR2uIiQcWSt8Q8tHmik.', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2599, '20201227642', 'EZE ANTHONY IFEANYI', '$2y$10$DdmtdtlAqu53WI2xKoZP8eNPiKTvliti6VXxm7RJptqfgdPqNHfaO', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2600, '20201220006', 'EZENNWA KINGDAVID CHIBUEZE', '$2y$10$FvACAmEX4Eu1sLnnl5m4ROgpVu/e76GodJQLLRFxgpBa4mdjq.Fu2', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2601, '20201235202', 'EZIRIM SAMUEL CHIBUNNA', '$2y$10$htvfaWvCFjbQcogd8pHhCeVTiLwAxFA46MX40LrVHuNAwwwxH5H0a', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2602, '20201221882', 'EZIUKA CHIKA JEPHTHAH', '$2y$10$7Iwa54w2jNL.fmCAu.ZZAOcAojJ/DqjJa38ywE4MBTNoGmXohBWiG', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2603, '20201214572', 'HARRISON INDOMITABLE CHINEMEREM', '$2y$10$AnpBDcq3jxnU9pjvXirOUukQYTXvaOckiKirLPYfFzcrs.jJmXQym', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2604, '20201242722', 'IBEH IKECHUKWU', '$2y$10$JRsJZLSWxSLuvlfxlqtmdeoNcNTK6ImYzVCzERaBQfFDNax7cmaY.', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2605, '20201239006', 'IBEH PATRICK CHINEDU', '$2y$10$wSbEi/Ir/f2i3KQKXKYiWeKljwNsqwqwTYlBk6yH.S.0zRyVl8FD6', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2606, '20201223492', 'IBEKWE SUCCESS CHUKWUEMEKA', '$2y$10$dh8aSXI6leOAy9ND4mSDRum7JsJL9Di0/Jtf5VXWPXA2ilQ86zVjy', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2607, '20201217512', 'IBIAM IHEANYI VICTORY', '$2y$10$gjPdDTokofOha8YHsoo9Se9pj3AxgnZK9/.HR4XXMuw9pNlY.BvNS', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2608, '20201245822', 'IFEANYICHUKWU AMBLESSED MASCOT', '$2y$10$9O6OYNCEdeVssW4.9SnRju0Co/10ZFBrQeiZfWbwTFZLWRsOVC/HG', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2609, '20201206402', 'IKE IKENNA EMMANUEL', '$2y$10$CB15p9FMuDjk.HY/sg9b5efbuqfc1XFjWzX.HOpjCCgOzrFaOawai', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2610, '20201206572', 'IKEFUNA STELLA LEBECHI', '$2y$10$dPEW0lE7y1C7P31.omQweeXvOGppM4dIaAsgttLiHlTuipn/L6ItG', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2611, '20201228612', 'IKEJIAKU SAMUEL CHINEMEREM', '$2y$10$MLmx4NS2WjKUA7dl.BNrYO/6LylroCH2Ri3jjpZwFT9gFedLmAat2', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2612, '20201213402', 'IMAH IYAMBA EBE', '$2y$10$KJNTV1R9sLCT/NA7y6.BOO3djL.yMglFi2GiJG47ZfSDg.CasTtCG', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2613, '20201216972', 'IWUANYANWU RAPHAEL C', '$2y$10$jI4rMM7d/d4L3H9KZde3M.hXoDjCyu8zRaJvm//YV08gFzzYPYm8u', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2614, '20201222292', 'IWUANYANWU UCHECHI FAVOUR', '$2y$10$sX/VQ34Bq9w7oXMfZNoan.zik0.Bh7FI04U7BlNr11REj5PsaX/LC', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2615, '20212298372', 'JACKSON OKORO UGONNAYA', '$2y$10$znkNpI0kIyxzqdPvUxpCheH9i/PsecAK5h1YApz72ttjy9qZBKvA6', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2616, '20201248642', 'JAJA BRIDGET', '$2y$10$V3WvYu9ZLzabT.A3jCKaI.3WCLoOE5I.kFqwsZpOCPx22XrRbg1lS', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2617, '20201204752', 'KALU IKECHUKWU', '$2y$10$SsQ8uFaCMjalsbvbdE8XsOovTkE.Wws6T9Bb/FOy07BL.ZSf/CBtW', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2618, '20201248532', 'KENNETH VICTORY', '$2y$10$OBfuN17yT9POTQavH28Fie5vkvR1UV8sCS9BWQ1SBCTZTIAi8Pb4S', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2619, '20201210986', 'MADUEZIM SOMTOCHUKWU PROMISE', '$2y$10$ckgA7FiJME.G.6j96mF2QudlBg6USRsnc2TmEcmy7ZFsYQPNm742i', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2620, '20201207502', 'MARIOGHAE ARURE LORD-DENNING', '$2y$10$.kkpj8LjqYtShsiat6X5m.u2ewFqplAc4Tygz72IygOqNuB0Ymk3y', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2621, '20201252082', 'MARK CLINTON CHUKWUEBUKA', '$2y$10$HZxflVD4F12qZCW0ibtSQ.0l/E3Q1quSKD9OznFXpsd30ljXgX1/.', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2622, '20201216712', 'MBAMARA STEPHEN NOSIKE', '$2y$10$Qjdg3fQR5F/DX9wlCdmJ2.zBlfEKcj90/vivUTE9QoxwrC1yxMpUe', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2623, '20201222192', 'MCBENNETH CHIAMAKA PRECIOUS', '$2y$10$kt66nO2E3qDmn4DKEuFd2eUfZOHmlnTMxIRCwiPEaJe0zj1CS7MrG', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2624, '20201233242', 'MENEKE CYNTHIA CHINEMEREM', '$2y$10$SqtvbbYYuKCpPNsE96TE6uLCJ7f3eg0dmNQUask7UXIQWuLdc3B.W', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2625, '20201239316', 'MGBEAHURU GLORY CHIEMERIE', '$2y$10$xkl0HzzX9iyGCZuJxKoBYeUsfkw.i0v5dYGAQ2AXFcYhafVEETxOO', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2626, '20201216182', 'MICHAEL TOCHUKWU GODSWILL', '$2y$10$.nLydHea6eHwt8e2CbRJzO0Mr3YsnH9.oi3h4rWNCW2iZAMOWZYP.', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2627, '20201204086', 'MONYE WISDOM CHIDINDU', '$2y$10$9F/sx2ZwniGf866/B0sLguzb/DT9EFaz3SZATXZTYPfQpRWWcy0Su', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2628, '20201206786', 'NDUKWU HENRY CHIBUIKEM', '$2y$10$R/PEO057JSPVkVVURY4w0eGouLAxAI3TotWdR6.06DrPurF8mAFmq', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2629, '20201232252', 'NDUKWU VICTOR CHIBUIKE', '$2y$10$XgcQuEHmeY4pWElx8Unic./OJQHdtTwMatj.GjfjESYNvupbfe2Xy', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2630, '20201248902', 'NNADI WISDOM CHIDINDU', '$2y$10$G3T2B6oK1urgDGvPtL/RV.4wBp8y7bqCRE7GquJPcd1zRrbZm6Xhi', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2631, '20201240762', 'NNAKA MICHAEL', '$2y$10$nNb1Hs90S6pajacM0mGPbuYrZd28VHwUAOy4nemsuvSlkpBzLY7KG', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2632, '20201208406', 'NNODIM IZUCHUKWU PRINCE', '$2y$10$GEuTMZOAIuBI3eGc.pzfq.jOvN7GgYYrRAaKKmwBmNfijrcDoN3zi', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2633, '20201207682', 'NOKWAMCHUKWU JOSHUA NKWACHI', '$2y$10$LHlFRdHntaHo8.oCUC880eg5uOFzCD7buPTNiCYloetNvJBgd1n9e', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2634, '20201234682', 'NWABU PROMISE CHIEDOZIE', '$2y$10$YTTuSJ3iKHoDXMGM/xsQKeXypULioiJJXelmYeNLcMyZDEUB5NtJK', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2635, '20201244402', 'NWABUEZE CLINTON CHINENYE', '$2y$10$9mG8AxC1iwtwougLYEzWy.1CYHn7AEAruKUopeeNP5XPagFKDWZkG', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2636, '20201233476', 'NWABUEZE WINNER DAVID', '$2y$10$beo3/WqRSitOeUt5C3q4WuV1pnqwU.lotvX5.SXaP9xw3k4Cb23/a', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2637, '20201254022', 'NWAIZIM CHARLES EBUBE', '$2y$10$VhSYKadvUUgRbfx3n/n38OBEM8jIxkZ5YUakttaNqFQTxT6cNNywK', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2639, '20201242612', 'NWAWUBA ANTHONIA FEECHI', '$2y$10$Bln1mJySr2mm7NJ7gPw0HOu//JXWH3jQIwbFJGnEKbFHsKDfWNyVy', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2640, '20201222212', 'NZE CHRISTIAN CHIBUIKE', '$2y$10$bD7AvDLV9byAlpbE2S9goerptfBk//YaRmiyb7RLcwZDU0.UcNMUK', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2641, '20201213102', 'NZENWEAKU EBUBECHUKWU EMMANUEL', '$2y$10$cOY2dxLyf.jIAUG1q/aSkOLiNmgO.7k3AE/9lZzyzVuz5s7sKrqFG', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2642, '20212297752', 'OBASI EDWIN UDOCHUKWU ', '$2y$10$H897NtB6GUFi16GnuIhLgeJHpRCFpiMKGYecB97Aok3ecuksch9vG', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2643, '20212297542', 'OBIEFUNE CHUKWUSOLU MARK ANTHONY ', '$2y$10$ftaK7jHvoHowvLYW2HN4XeTDCDPrAI2tMjXKmSpXwUjn57WV/RVuu', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2644, '20201228742', 'OBILOR EMMANUEL', '$2y$10$/L2Jw1h5m1O82llLxTHsv.MZTfd/i1XeDpf.Ii5xdEjX.FPdTMoSa', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2645, '20201211992', 'OGBUEGHU RICHMOND ENYICHI', '$2y$10$FffWDH2LvZcnvZc6r/s8jOdLwKqror2zpIVJpdX0F63YthrFGWSaS', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2646, '20201212802', 'OGBUEHI EMMANUEL ONYEBUCHI', '$2y$10$iGdlWtm/sHeqTHEnr0NmmO9J9EEdlbdDGURoUht9y3Jx1053jcdSq', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2647, '20201231306', 'OGUERI JEREMIAH CHIKE', '$2y$10$1Dl0/CV4gDhDZ8qTIih1B.IyhQY5J5yEZghuutumHROV91M9xMjoS', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2648, '20201221562', 'OKE-EKENWA NDUBUISI', '$2y$10$WsWpc97EBitsMEIseDis4OHxsqUgaFH/S2JL95dFRlVRilj5Abiee', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2649, '20201204562', 'OKEREKE CHIDINMA MARY', '$2y$10$a8en2Aa7GL.UOYo.ChYCWO6QRRoh/kkPHMyi.sqXWWjMmCoyNBCjK', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2650, '20201230342', 'OKOLIE AMUCHE ANTHONY', '$2y$10$efYvUMI0TvAq0BXvZNlhf.suDsczRB8P3qVnvEF67YLax97Xsd4B6', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2651, '20201225576', 'OKONKWO FRANKLIN CHIDUBEM', '$2y$10$GwJN7IfdONhczaG2MOdVU.aBVgSZECWHuhmZH9pMNlNcGGyYGgPTq', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2652, '20201218982', 'OKOYE VICTOR KENECHUKWU', '$2y$10$cXccvJ5gQ7.wbn.VRWiIPunuI5noiI8i.vNGcog7JPJRNA.UbULgu', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2653, '20201252092', 'OKWARA CHUKWUDI EZEMA', '$2y$10$g1YHUe1T5he4hmeYnLnVqeHjw0PWSuXVCej3vY1S02BEku5DTR5V6', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2654, '20201220436', 'OKWUNNWANNE ONYEKA DAVID', '$2y$10$xaUgnIMW6NLeXtDOfekRQuUx.kL7T7xYjm5.qcbT0eQ1XOeDxQ8PW', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2655, '20201217196', 'OLUOHA JUDE OKECHUKWU', '$2y$10$DIsNnq3jMBDC0ZrYlqrRQekEt7X8i9ZrvOV3F8pprQhGKQarHz7da', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2656, '20201210772', 'ONUMA MICHAEL ONYEMAECHI', '$2y$10$rNSQxOKKQGEG2eZklhBVI.Cg7UB12dPvenkjqsQ055i/1zZISUBiy', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2657, '20201211152', 'ONUOHA PHILIP OGBONNA', '$2y$10$4Ww8QTgLO99klBGVMsTXu.080q0B73AnRXH14RU4QQ1/MDdy6Th2m', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2658, '20201229462', 'ONYEBULE DAVID UDOCHUKWU', '$2y$10$3Pn4.BlpAwVmLeDzEQMgkO2C66hdxHPxRQHqV7yTHB3JiuO3w9Lje', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2659, '20212297792', 'ONYEKAOZURU MARTINS GODFREY EBUBECHUKWU ', '$2y$10$uH9PK/jXyivbB8.I.WDcTe5BP2em1IFBkOK/veudnN6HfZzV9qGSO', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2660, '20201249192', 'ONYENALI CHIGOZIE EMMANUEL', '$2y$10$yKOlyBA3Z9z6l6kJx3tMgexGAZ3RvFInyw.DwPDaRAO8Yx6chz9yO', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2661, '20201205532', 'OPARA MICHAEL UZOCHUKWU', '$2y$10$CJyXjJguxXLDmtKFm2Idy.tuj8YxM/SEyJOEpIfIfRkye/GI4C7EG', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2662, '20201206142', 'OPIAH CHIEDOZIE EXCEL', '$2y$10$2kG1U2c1yZxJ6BWWa/r74eBPf9bdUUcJyoVqSfp4FLJ2v64iTvaAu', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2663, '20201231842', 'ORIERE EMMANUEL OGBEMUDIA', '$2y$10$/XF2OnYWQSTyZVqB7vg86.X5u4vYce15Fori1sHVjSqPgbVMrI7Vu', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2664, '20201242632', 'ORJI FRANKLIN OLISA', '$2y$10$YKGbYJCdVaapqJGts0sbi.R9wFhIz3ikfwYw0q3mDDaDuW8EgWGLe', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2665, '20201226432', 'OSUAGWU RACHAEL CHINONYEREM', '$2y$10$VW8BGtmK9tYL6YBCFQF77.gBVXeWgSwsLZprxXOXjScbfo99nkthu', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2666, '20201216002', 'OSUOHA PRECIOUS CHIDIEBUBE', '$2y$10$ocVLEKQhwPTfhvqVd7i7Z.6om5IN8FFxypTvLVTSz.AzJE4eTlBmi', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2667, '20201214616', 'RAYMOND GREAT', '$2y$10$N1Xu/vIDZEZ1Hwo3uUmph.FFErzYA7AkRjEfPnPlsfvmTurErPB2a', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2668, '20201205652', 'SAMUEL EXCELLENCE TOBECHUKWU', '$2y$10$/S9LcLcM3XYXoLVO0pclieVD3kJGKaI2ceJnhR74zSyrssuMyjnH.', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2669, '20201234362', 'UCHEOMA CHIEMEZUE CHIEDOZIE', '$2y$10$P5qtJlb2Xphw/J7ziW1hYOo9lmmeUUOvmIm4bLBLNzzi6HwgJQmGy', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2670, '20201249402', 'UGOARU KINGSLEY NWACHUKWU', '$2y$10$cwmj63y18ulgqGhwTbjHeuiMmt6yqUZ1dfgJWszB/C7I3F3S.y18q', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2671, '20201230982', 'UGWULOR IKENNA DOMINIC', '$2y$10$sQjfDqtWbVaCkuM453A1RuOhbkWTDUrdzrxJacRprAs6z7X48j0uS', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2672, '20201247802', 'UKAGHA PAUL CHIBUIKE', '$2y$10$KcuoSdC6EP48ndse65BAEertQbKCR1aCRUTnb6OjIaLOCnnwfpxaO', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2673, '20201243412', 'UMEH RICHARD CHIMEREMEZE', '$2y$10$Rla/1w.3T/bmFkcfQIW6POraLgw.Tl8O.r9GX/ShJtxwWTaKgU/oi', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2674, '20201230062', 'UNAEZE EMMANUEL CHINAEMEREM', '$2y$10$fHK8G6LB8u/.faGJ9FRqee1WLOuNcudIsrFdT23c3jnrMjc.6qI.2', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2675, '20201206902', 'VINCENT DAVE', '$2y$10$GIA59NeUx9p9NmNWpO475.6qwwLwPh4Z0tOVt0x4ztuWuMUUAUD5u', '500 LEVEL', 'INFORMATION TECHNOLOGY'),
(2676, '20201241982', 'VITUS SOCHIMA MCANTHONY', '$2y$10$GtNR9bd1IYLfsNnfVohskO.ZTAiZRboxha.AdYbtDhkwVMVP9cD7a', '500 LEVEL', 'INFORMATION TECHNOLOGY');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `pickup_slots`
--
ALTER TABLE `pickup_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `student_pickups`
--
ALTER TABLE `student_pickups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matric` (`matric`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `pickup_slots`
--
ALTER TABLE `pickup_slots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_pickups`
--
ALTER TABLE `student_pickups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2677;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `deliveries_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
