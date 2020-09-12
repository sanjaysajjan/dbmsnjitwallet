-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 07, 2020 at 10:03 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs631`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_modification`
--

CREATE TABLE `account_modification` (
  `name` varchar(25) NOT NULL,
  `ssn` int(9) NOT NULL,
  `email` varchar(9) NOT NULL,
  `phone` varchar(9) NOT NULL,
  `primaryacc` int(10) NOT NULL,
  `secondaryacc` int(10) DEFAULT NULL,
  `addsec` int(10) DEFAULT NULL,
  `secondaryemail` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account_modification`
--

INSERT INTO `account_modification` (`name`, `ssn`, `email`, `phone`, `primaryacc`, `secondaryacc`, `addsec`, `secondaryemail`) VALUES
('Ben Strokes', 99890000, 'ben@g.cm', '', 10010110, 10010101, NULL, 'bens@g'),
('Andrew', 99890010, 'andw@g.cm', '', 10010110, 10010101, NULL, 'andrew@g');

-- --------------------------------------------------------

--
-- Table structure for table `bank_account`
--

CREATE TABLE `bank_account` (
  `bankid` varchar(9) NOT NULL,
  `banumber` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bank_account`
--

INSERT INTO `bank_account` (`bankid`, `banumber`) VALUES
('AmExp01', 10010110),
('Chase01', 10001001),
('Chase02', 10010101);

-- --------------------------------------------------------

--
-- Table structure for table `electronic_address`
--

CREATE TABLE `electronic_address` (
  `identifier` varchar(9) NOT NULL,
  `ssn` int(9) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `electronic_address`
--

INSERT INTO `electronic_address` (`identifier`, `ssn`, `type`, `verified`) VALUES
('91191191', 1234567890, 'phone', 1),
('9343899', 123456789, 'phone', 1),
('97343891', 99890100, 'phone', 1),
('97343892', 99890000, 'phone', 1),
('97343893', 99890010, 'phone', 1),
('97343894', 99890011, 'phone', 1),
('97343895', 99890001, 'phone', 1),
('973652659', 98563254, 'phone', 1),
('adam@g.cm', 99890011, 'email', 1),
('andr@g.cm', 99890010, 'email', 1),
('ben@g.cm', 99890000, 'email', 1),
('feck@g.cm', 123456789, 'email', 1),
('john@g.cm', 99890001, 'email', 1),
('joy@g.cm', 88888888, 'email', 1),
('rafe@g.cm', 99890100, 'email', 1),
('san@g.cm', 1234567890, 'email', 1),
('shre@g.cm', 98563254, 'email', 1);

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `ssn` int(9) NOT NULL,
  `email` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email`
--

INSERT INTO `email` (`ssn`, `email`) VALUES
(99890000, 'ben@g.cm'),
(99890001, 'john@g.cm'),
(99890010, 'andr@g.cm'),
(99890011, 'adam@g.cm'),
(99890100, 'rafe@g.cm'),
(1234567890, 'san@g.cm');

-- --------------------------------------------------------

--
-- Table structure for table `has_additional`
--

CREATE TABLE `has_additional` (
  `ssn` int(9) NOT NULL,
  `bankid` varchar(9) NOT NULL,
  `banumber` int(10) NOT NULL,
  `verified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `has_additional`
--

INSERT INTO `has_additional` (`ssn`, `bankid`, `banumber`, `verified`) VALUES
(98563254, 'AmExp01', 10010110, 1),
(98563254, 'Chase02', 10010101, 1),
(99890001, 'AmExp01', 10010110, NULL),
(99890010, 'Chase02', 10010101, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(25) NOT NULL,
  `password` varchar(10) NOT NULL,
  `regtime` datetime NOT NULL,
  `ssn` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `regtime`, `ssn`) VALUES
('ben@g.cm', 'qwerty', '2016-12-22 09:27:58', 99890000),
('john@g.cm', '1234', '2020-05-03 11:12:51', 123456789),
('san@g.cm', 'sanjay', '2020-05-03 11:12:51', 1234567890),
('Shreyas', '123', '2020-05-07 06:02:24', 98563254);

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

CREATE TABLE `phone` (
  `phone` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `phone`
--

INSERT INTO `phone` (`phone`) VALUES
('97343891'),
('97343892'),
('97343893'),
('97343894'),
('97343895'),
('97343899');

-- --------------------------------------------------------

--
-- Table structure for table `request_transaction`
--

CREATE TABLE `request_transaction` (
  `rtid` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `datestamp` datetime NOT NULL DEFAULT current_timestamp(),
  `memo` varchar(50) DEFAULT NULL,
  `ssn` int(9) NOT NULL,
  `identifier` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request_transaction`
--

INSERT INTO `request_transaction` (`rtid`, `amount`, `datestamp`, `memo`, `ssn`, `identifier`) VALUES
(4, 20, '2020-05-07 06:06:51', 'Gimme My money back mate', 98563254, 'san@g.cm'),
(5, 20, '2020-05-07 07:56:48', 'asa', 99890000, 'san@g.cm');

-- --------------------------------------------------------

--
-- Table structure for table `rfrom`
--

CREATE TABLE `rfrom` (
  `rtid` int(11) NOT NULL,
  `identifier` varchar(9) NOT NULL,
  `percentage` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rfrom`
--

INSERT INTO `rfrom` (`rtid`, `identifier`, `percentage`) VALUES
(1, 'ben@g.cm', 100),
(2, 'john@g.cm', 100),
(3, 'ben@g.cm', 100),
(4, 'san@g.cm', 100),
(5, 'san@g.cm', 100);

-- --------------------------------------------------------

--
-- Table structure for table `send_transaction`
--

CREATE TABLE `send_transaction` (
  `stid` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `datestamp` datetime NOT NULL DEFAULT current_timestamp(),
  `memo` varchar(50) DEFAULT NULL,
  `cancelled` varchar(50) DEFAULT NULL,
  `ssn` int(9) NOT NULL,
  `identifier` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `send_transaction`
--

INSERT INTO `send_transaction` (`stid`, `amount`, `datestamp`, `memo`, `cancelled`, `ssn`, `identifier`) VALUES
(1, 250, '2020-05-02 02:32:05', 'tired', '0', 88888888, 'ben@g.cm'),
(2, 20, '2020-05-03 23:13:39', 'test', '0', 123456789, 'ben@g.cm'),
(3, 20, '2020-05-03 23:14:13', 'test', '0', 123456789, 'ben@g.cm'),
(4, 20, '2020-05-07 06:03:46', 'Testing Mate', '0', 98563254, 'san@g.cm');

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `ssn` int(9) NOT NULL,
  `name` varchar(25) NOT NULL,
  `bankid` varchar(9) NOT NULL,
  `banumber` int(10) NOT NULL,
  `pbaverified` varchar(1) DEFAULT NULL,
  `phone` varchar(9) DEFAULT NULL,
  `balance` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`ssn`, `name`, `bankid`, `banumber`, `pbaverified`, `phone`, `balance`) VALUES
(88888888, 'Test', 'Chase01', 10001001, '1', NULL, 10000),
(98563254, 'Shreyas Bhat', 'Chase01', 10001001, '1', '973569856', 25500),
(99890000, 'Ben Stokes', 'AmExp01', 10010110, '1', '97343892', 10020),
(99890001, 'John Smith', 'Chase01', 10001001, '1', '97343895', 10000),
(99890010, 'Andrew', 'AmExp01', 10010110, '1', '97343893', 10000),
(99890011, 'Adam Hill', 'Chase01', 10001001, '1', '97343894', 10000),
(99890100, 'Rafe Nadal', 'AmExp01', 10010110, '1', '97343891', 10000),
(123456789, 'Testr', 'Chase01', 10001001, '1', '97343899', 10000),
(1234567890, 'sanjay', 'Chase01', 10001001, '1', '91191191', 9980);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_modification`
--
ALTER TABLE `account_modification`
  ADD PRIMARY KEY (`ssn`);

--
-- Indexes for table `bank_account`
--
ALTER TABLE `bank_account`
  ADD PRIMARY KEY (`bankid`,`banumber`);

--
-- Indexes for table `electronic_address`
--
ALTER TABLE `electronic_address`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`email`),
  ADD KEY `emailssnfk` (`ssn`);

--
-- Indexes for table `has_additional`
--
ALTER TABLE `has_additional`
  ADD PRIMARY KEY (`ssn`,`bankid`,`banumber`),
  ADD KEY `hasadditionlbankidnumfk` (`bankid`,`banumber`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`,`password`);

--
-- Indexes for table `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`phone`);

--
-- Indexes for table `request_transaction`
--
ALTER TABLE `request_transaction`
  ADD PRIMARY KEY (`rtid`),
  ADD KEY `reqssnfk` (`ssn`);

--
-- Indexes for table `rfrom`
--
ALTER TABLE `rfrom`
  ADD PRIMARY KEY (`rtid`,`identifier`),
  ADD KEY `frommidfk` (`identifier`);

--
-- Indexes for table `send_transaction`
--
ALTER TABLE `send_transaction`
  ADD PRIMARY KEY (`stid`),
  ADD KEY `stssnfk` (`ssn`),
  ADD KEY `sendtransidfk` (`identifier`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`ssn`),
  ADD KEY `bankidnumfk` (`bankid`,`banumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `request_transaction`
--
ALTER TABLE `request_transaction`
  MODIFY `rtid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rfrom`
--
ALTER TABLE `rfrom`
  MODIFY `rtid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `send_transaction`
--
ALTER TABLE `send_transaction`
  MODIFY `stid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_modification`
--
ALTER TABLE `account_modification`
  ADD CONSTRAINT `accmodfk` FOREIGN KEY (`ssn`) REFERENCES `user_account` (`ssn`);

--
-- Constraints for table `email`
--
ALTER TABLE `email`
  ADD CONSTRAINT `emailidfk` FOREIGN KEY (`email`) REFERENCES `electronic_address` (`identifier`) ON UPDATE CASCADE;

--
-- Constraints for table `has_additional`
--
ALTER TABLE `has_additional`
  ADD CONSTRAINT `hasadditionalfk` FOREIGN KEY (`ssn`) REFERENCES `user_account` (`ssn`) ON UPDATE CASCADE,
  ADD CONSTRAINT `hasadditionlbankidnumfk` FOREIGN KEY (`bankid`,`banumber`) REFERENCES `bank_account` (`bankid`, `banumber`);

--
-- Constraints for table `request_transaction`
--
ALTER TABLE `request_transaction`
  ADD CONSTRAINT `reqssnfk` FOREIGN KEY (`ssn`) REFERENCES `user_account` (`ssn`) ON UPDATE CASCADE;

--
-- Constraints for table `rfrom`
--
ALTER TABLE `rfrom`
  ADD CONSTRAINT `frommidfk` FOREIGN KEY (`identifier`) REFERENCES `electronic_address` (`identifier`);

--
-- Constraints for table `user_account`
--
ALTER TABLE `user_account`
  ADD CONSTRAINT `bankidnumfk` FOREIGN KEY (`bankid`,`banumber`) REFERENCES `bank_account` (`bankid`, `banumber`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
