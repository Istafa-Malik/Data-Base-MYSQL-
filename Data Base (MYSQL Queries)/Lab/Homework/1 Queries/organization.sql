-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2022 at 06:16 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `organization`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `DEPT_NO` char(4) NOT NULL,
  `DEPT_NAME` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dept_emp`
--

CREATE TABLE `dept_emp` (
  `EMP_NO` int(11) DEFAULT NULL,
  `DEPT_NO` char(4) DEFAULT NULL,
  `FROM_DATE` date DEFAULT NULL,
  `TO_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dept_manager`
--

CREATE TABLE `dept_manager` (
  `DEPT_NO` char(4) NOT NULL,
  `EMP_NO` int(11) DEFAULT NULL,
  `FROM_DATE` date DEFAULT NULL,
  `TO_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EMP_NO` int(11) NOT NULL,
  `BIRTH_DATE` date DEFAULT NULL,
  `FIRST_NAME` varchar(14) DEFAULT NULL,
  `LAST_NAME` varchar(16) DEFAULT NULL,
  `SEX` enum('M''F') DEFAULT NULL,
  `HIRE_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `EMP_NO` int(11) DEFAULT NULL,
  `SALARY` int(11) DEFAULT NULL,
  `FROM_DATE` date NOT NULL,
  `TO_DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `title`
--

CREATE TABLE `title` (
  `EMP_NO` int(11) DEFAULT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  `FROM_DATE` date DEFAULT NULL,
  `TO_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`DEPT_NO`),
  ADD KEY `DEPT_NO` (`DEPT_NO`);

--
-- Indexes for table `dept_emp`
--
ALTER TABLE `dept_emp`
  ADD KEY `EMP_NO` (`EMP_NO`),
  ADD KEY `DEPT_NO` (`DEPT_NO`);

--
-- Indexes for table `dept_manager`
--
ALTER TABLE `dept_manager`
  ADD PRIMARY KEY (`DEPT_NO`),
  ADD KEY `EMP_NO` (`EMP_NO`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EMP_NO`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`FROM_DATE`,`TO_DATE`),
  ADD KEY `EMP_NO` (`EMP_NO`);

--
-- Indexes for table `title`
--
ALTER TABLE `title`
  ADD KEY `EMP_NO` (`EMP_NO`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `FK_DEPARTMENTS` FOREIGN KEY (`DEPT_NO`) REFERENCES `dept_manager` (`DEPT_NO`);

--
-- Constraints for table `dept_emp`
--
ALTER TABLE `dept_emp`
  ADD CONSTRAINT `FK_DEPARTMENT` FOREIGN KEY (`EMP_NO`) REFERENCES `employees` (`EMP_NO`),
  ADD CONSTRAINT `FK_DEPT` FOREIGN KEY (`DEPT_NO`) REFERENCES `departments` (`DEPT_NO`);

--
-- Constraints for table `dept_manager`
--
ALTER TABLE `dept_manager`
  ADD CONSTRAINT `FK_DEPT_EMP` FOREIGN KEY (`EMP_NO`) REFERENCES `employees` (`EMP_NO`);

--
-- Constraints for table `salaries`
--
ALTER TABLE `salaries`
  ADD CONSTRAINT `FK_SALARIES` FOREIGN KEY (`EMP_NO`) REFERENCES `employees` (`EMP_NO`);

--
-- Constraints for table `title`
--
ALTER TABLE `title`
  ADD CONSTRAINT `FK_TITLE` FOREIGN KEY (`EMP_NO`) REFERENCES `employees` (`EMP_NO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
