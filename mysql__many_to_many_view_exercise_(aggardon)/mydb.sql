-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2019 at 01:52 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

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
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(3) NOT NULL,
  `comp_name` varchar(20) NOT NULL,
  `comp_found_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `comp_name`, `comp_found_date`) VALUES
(0, 'ASIA PACIFIC COLLEGE', '2000-01-15'),
(1, 'JOCLARAVAL', '1998-02-04'),
(2, 'Philsca', '1998-06-21');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(5) NOT NULL,
  `emp_fname` varchar(20) NOT NULL,
  `emp_lname` varchar(20) NOT NULL,
  `emp_initial` varchar(3) NOT NULL,
  `emp_email` varchar(50) NOT NULL,
  `emp_phone_number` int(11) NOT NULL,
  `emp_type` varchar(20) NOT NULL,
  `comp_id` int(3) NOT NULL,
  `emp_manager` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `emp_fname`, `emp_lname`, `emp_initial`, `emp_email`, `emp_phone_number`, `emp_type`, `comp_id`, `emp_manager`) VALUES
(1, 'Aj', 'Fruka', 'E', 'aj@gmail.com', 982134566, 'type b', 1, 'hr'),
(2, 'Jansen', 'Bemuda', 'J', 'Jansen@gmail.com', 986745236, 'type a', 1, 'hr'),
(3, 'Jam', 'Ejercito', 'K', 'jam@gmail.com', 912363242, 'type a', 2, 'sc');

-- --------------------------------------------------------

--
-- Stand-in structure for view `employeesview`
-- (See below for the actual view)
--
CREATE TABLE `employeesview` (
`comp_id` int(3)
,`emp_fname` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `hr_employees`
-- (See below for the actual view)
--
CREATE TABLE `hr_employees` (
`id` int(5)
,`emp_fname` varchar(20)
,`emp_manager` varchar(10)
,`hsm_fname` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `hr_sc_manager`
--

CREATE TABLE `hr_sc_manager` (
  `id` int(11) NOT NULL,
  `hsm_fname` varchar(20) NOT NULL,
  `hsm_lname` varchar(20) NOT NULL,
  `hsm_initial` varchar(3) NOT NULL,
  `hsm_email_add` varchar(50) DEFAULT NULL,
  `hsm_phone_number` int(11) DEFAULT NULL,
  `hsm_department` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hr_sc_manager`
--

INSERT INTO `hr_sc_manager` (`id`, `hsm_fname`, `hsm_lname`, `hsm_initial`, `hsm_email_add`, `hsm_phone_number`, `hsm_department`) VALUES
(1, 'abdul', 'shakul ', 'g', 'abdul@gmail.com', 988876567, 'hr'),
(2, 'awit', 'may ', 'l', 'awit@gmail.com', 989898989, 'sc');

-- --------------------------------------------------------

--
-- Table structure for table `hr_sc_manager_has_employees`
--

CREATE TABLE `hr_sc_manager_has_employees` (
  `hr and sc manager_id` int(11) NOT NULL,
  `employees_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hr_sc_manager_has_employees`
--

INSERT INTO `hr_sc_manager_has_employees` (`hr and sc manager_id`, `employees_id`) VALUES
(1, 1),
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `order1`
--

CREATE TABLE `order1` (
  `order_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `order_delivery` date NOT NULL,
  `order_status` varchar(30) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order1`
--

INSERT INTO `order1` (`order_id`, `order_date`, `order_delivery`, `order_status`, `cust_id`, `food_id`) VALUES
(1, '2019-10-28', '2019-10-30', 'Processing', 1, 1),
(2, '2019-10-28', '2019-10-28', 'Delivered', 2, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersview`
-- (See below for the actual view)
--
CREATE TABLE `ordersview` (
);

-- --------------------------------------------------------

--
-- Structure for view `employeesview`
--
DROP TABLE IF EXISTS `employeesview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employeesview`  AS  select `employees`.`comp_id` AS `comp_id`,`employees`.`emp_fname` AS `emp_fname` from (`employees` join `company` on((`employees`.`comp_id` = `company`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `hr_employees`
--
DROP TABLE IF EXISTS `hr_employees`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hr_employees`  AS  select `employees`.`id` AS `id`,`employees`.`emp_fname` AS `emp_fname`,`employees`.`emp_manager` AS `emp_manager`,`hr_sc_manager`.`hsm_fname` AS `hsm_fname` from (`employees` join `hr_sc_manager` on((`employees`.`id` = `hr_sc_manager`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `ordersview`
--
DROP TABLE IF EXISTS `ordersview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordersview`  AS  select `b`.`order_id` AS `order_id`,`b`.`order_date` AS `order_date`,`b`.`order_delivery` AS `order_delivery`,`b`.`order_status` AS `order_status`,`a`.`cust_id` AS `cust_id`,`a`.`cust_lname` AS `cust_lname`,`a`.`cust_fname` AS `cust_fname` from (`customer` `a` join `order1` `b`) where (`a`.`cust_id` = `b`.`cust_id`) ;

--
-- Indexes for dumped tables
--

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
-- Indexes for table `hr_sc_manager`
--
ALTER TABLE `hr_sc_manager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_sc_manager_has_employees`
--
ALTER TABLE `hr_sc_manager_has_employees`
  ADD PRIMARY KEY (`hr and sc manager_id`,`employees_id`),
  ADD KEY `fk_hr and sc manager_has_employees_employees1_idx` (`employees_id`) COMMENT ' ',
  ADD KEY `fk_hr and sc manager_has_employees_hr and sc manager_idx` (`hr and sc manager_id`) COMMENT ' ';

--
-- Indexes for table `order1`
--
ALTER TABLE `order1`
  ADD PRIMARY KEY (`order_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hr_sc_manager_has_employees`
--
ALTER TABLE `hr_sc_manager_has_employees`
  ADD CONSTRAINT `fk_hr and sc manager_has_employees_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hr and sc manager_has_employees_hr and sc manager` FOREIGN KEY (`hr and sc manager_id`) REFERENCES `hr_sc_manager` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
