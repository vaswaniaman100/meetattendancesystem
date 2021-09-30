-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2021 at 03:39 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `classname`
--

CREATE TABLE `classname` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(10);

-- --------------------------------------------------------

--
-- Table structure for table `lectureattendance`
--

CREATE TABLE `lectureattendance` (
  `id` int(11) NOT NULL,
  `lectureid` int(11) NOT NULL,
  `studentname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lectureattendance`
--

INSERT INTO `lectureattendance` (`id`, `lectureid`, `studentname`) VALUES
(1, 31, 'Aman Vaswani'),
(2, 39, 'Aman Vaswani'),
(3, 39, 'Aman Vaswani'),
(4, 40, 'Aman Vaswani'),
(5, 40, 'Aman Vaswani'),
(6, 41, 'Aman Vaswani'),
(7, 41, 'Aman Vaswani'),
(8, 42, 'Aman Vaswani'),
(9, 42, 'Aman Vaswani');

-- --------------------------------------------------------

--
-- Table structure for table `lectures`
--

CREATE TABLE `lectures` (
  `lectureid` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `classname` varchar(255) DEFAULT NULL,
  `dateoflec` timestamp NULL DEFAULT NULL,
  `lecturecomments` varchar(255) DEFAULT NULL,
  `teachername` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lectures`
--

INSERT INTO `lectures` (`lectureid`, `subject`, `classname`, `dateoflec`, `lecturecomments`, `teachername`) VALUES
(31, 'a', 'a', '2021-09-27 21:08:48', 'a', 'a'),
(32, 'q', 'q', '2021-09-27 21:09:58', 'q', 'q'),
(33, 'b', 'b', '2021-09-27 21:16:58', 'b', 'b'),
(34, 'w', 'w', '2021-09-27 21:23:37', 'w', 'w'),
(35, 'w', 'w', '2021-09-27 21:24:05', 'w', 'w'),
(36, 'w', 'w', '2021-09-27 21:24:09', 'w', 'w'),
(37, 'w', 'w', '2021-09-27 21:24:40', 'w', 'w'),
(38, 'a', 'a', '2021-09-27 21:24:54', 'aqa', 'a'),
(39, '', '', '2021-09-27 21:27:05', '', ''),
(40, 'a', 'a', '2021-09-27 21:27:21', 'aman', 'a'),
(41, 'q', 'q', '2021-09-27 21:28:44', 'pappu', 'q'),
(42, 's', 's', '2021-09-27 21:36:06', 'aqaa', 's');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subjectname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subjectname`) VALUES
(10, '');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `password`) VALUES
(20, 'aman', '1234'),
(21, 'lucky', 'asa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classname`
--
ALTER TABLE `classname`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `lectureattendance`
--
ALTER TABLE `lectureattendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lectures`
--
ALTER TABLE `lectures`
  ADD PRIMARY KEY (`lectureid`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subjectname` (`subjectname`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classname`
--
ALTER TABLE `classname`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lectureattendance`
--
ALTER TABLE `lectureattendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `lectures`
--
ALTER TABLE `lectures`
  MODIFY `lectureid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
