-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2019 at 03:43 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(5) NOT NULL,
  `cl_fname` varchar(20) NOT NULL,
  `cl_lname` varchar(20) NOT NULL,
  `cl_initial` varchar(3) NOT NULL,
  `cl_email_add` varchar(50) DEFAULT NULL,
  `cl_phone_number` int(11) DEFAULT NULL,
  `cl_type` varchar(20) DEFAULT NULL,
  `president_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `cl_fname`, `cl_lname`, `cl_initial`, `cl_email_add`, `cl_phone_number`, `cl_type`, `president_id`) VALUES
(1, 'Mike', 'Clock', 'S', 'mikec@times.com', 1237888, 'W', 1),
(2, 'Grace', 'Fowl', 'V', 'gfv@zarks.com', 6532362, 'W', 3),
(3, 'Vince', 'Navigate', 'B', 'wazevince@waze.com', 6535877, 'N', 2);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `comp_name` varchar(20) NOT NULL,
  `comp_found_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `comp_name`, `comp_found_date`) VALUES
(1, 'Kaspersky', '2011-02-10'),
(2, 'Robinsons', '1992-05-09'),
(3, 'J&J', '2004-10-10');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(5) NOT NULL,
  `emp_fname` varchar(20) NOT NULL,
  `emp_lname` varchar(20) NOT NULL,
  `emp_initial` varchar(3) NOT NULL,
  `emp_email_add` varchar(50) DEFAULT NULL,
  `emp_phone_number` int(11) DEFAULT NULL,
  `emp_type` varchar(20) NOT NULL,
  `employee type_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee type`
--

CREATE TABLE `employee type` (
  `id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `finance manager`
--

CREATE TABLE `finance manager` (
  `id` bit(1) NOT NULL,
  `fm_fname` varchar(20) NOT NULL,
  `fm_lname` varchar(20) NOT NULL,
  `fm_initial` varchar(3) NOT NULL,
  `fm_email_add` varchar(50) DEFAULT NULL,
  `fm_phone_num` int(11) DEFAULT NULL,
  `president_id` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hr and sc manager`
--

CREATE TABLE `hr and sc manager` (
  `id` bit(1) NOT NULL,
  `hsm_fname` varchar(20) NOT NULL,
  `hsm_lname` varchar(20) NOT NULL,
  `hsm_initial` varchar(3) NOT NULL,
  `hsm_email_add` varchar(50) DEFAULT NULL,
  `hsm_phone_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `manypresident`
-- (See below for the actual view)
--
CREATE TABLE `manypresident` (
`pres_fname` varchar(20)
,`comp_name` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `president`
--

CREATE TABLE `president` (
  `id` varchar(3) NOT NULL,
  `pres_fname` varchar(20) NOT NULL,
  `pres_lname` varchar(20) NOT NULL,
  `pres_initial` varchar(45) NOT NULL,
  `presidentcol` varchar(3) NOT NULL,
  `pres_email_add` varchar(50) NOT NULL,
  `pres_address` varchar(100) NOT NULL,
  `pres_phone_num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `president`
--

INSERT INTO `president` (`id`, `pres_fname`, `pres_lname`, `pres_initial`, `presidentcol`, `pres_email_add`, `pres_address`, `pres_phone_num`) VALUES
('1', 'Brent', 'Manzo', 'P', 'B22', 'manzobrent@yahoo.com', 'Makati City', 3467784),
('2', 'James', 'Doug', 'D', 'D22', 'freshlikedougie@doug.com', 'Muntinlupa City', 5345347),
('3', 'Joe', 'Gragasin', 'T', 'GG6', 'joemamma@moms.com', 'Cavite City', 4563777);

-- --------------------------------------------------------

--
-- Stand-in structure for view `presidentview`
-- (See below for the actual view)
--
CREATE TABLE `presidentview` (
`id` int(11)
,`pres_fname` varchar(20)
,`comp_found_date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id` bit(1) NOT NULL,
  `wh_location` varchar(30) NOT NULL,
  `wh_capacity` varchar(20) NOT NULL,
  `wh_type` varchar(20) NOT NULL,
  `wh_owner` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure for view `manypresident`
--
DROP TABLE IF EXISTS `manypresident`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `manypresident`  AS  select `president`.`pres_fname` AS `pres_fname`,`company`.`comp_name` AS `comp_name` from ((`president` join `client` on(`president`.`id` = `client`.`id`)) join `company` on(`client`.`id` = `company`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `presidentview`
--
DROP TABLE IF EXISTS `presidentview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `presidentview`  AS  select `company`.`id` AS `id`,`president`.`pres_fname` AS `pres_fname`,`company`.`comp_found_date` AS `comp_found_date` from (`company` join `president` on(`company`.`id` = `president`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee type`
--
ALTER TABLE `employee type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance manager`
--
ALTER TABLE `finance manager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr and sc manager`
--
ALTER TABLE `hr and sc manager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `president`
--
ALTER TABLE `president`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
