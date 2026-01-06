-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2025 at 05:05 PM
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
-- Database: `govlashlaundrydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notificationID` int(11) NOT NULL,
  `recipientID` int(11) NOT NULL,
  `notificationMessage` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `serviceID` int(11) NOT NULL,
  `serviceName` varchar(100) NOT NULL,
  `serviceDescription` varchar(500) NOT NULL,
  `servicePrice` double NOT NULL,
  `serviceDuration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`serviceID`, `serviceName`, `serviceDescription`, `servicePrice`, `serviceDuration`) VALUES
(1, 'cuci motor', 'cucian motor ya apalagi', 100000, 3),
(2, 'cuci mobil', 'cucian mobil ya apalagi', 200000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transactionID` int(11) NOT NULL,
  `serviceID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `receptionistID` int(11) DEFAULT NULL,
  `laundryStaffID` int(11) DEFAULT NULL,
  `transactionDate` date NOT NULL,
  `transactionStatus` varchar(50) NOT NULL,
  `totalWeight` double DEFAULT NULL,
  `transactionNotes` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transactionID`, `serviceID`, `customerID`, `receptionistID`, `laundryStaffID`, `transactionDate`, `transactionStatus`, `totalWeight`, `transactionNotes`) VALUES
(3, 2, 4, 7, 8, '2025-12-11', 'Finished', 3, 'wow'),
(4, 2, 9, 7, 3, '2025-12-12', 'Finished', 3, 'wawawa top global granger nih bos'),
(5, 1, 9, 7, 8, '2025-12-12', 'Finished', 10, 'motornya granger ini'),
(6, 2, 9, NULL, NULL, '2025-12-12', 'Pending', 40, 'cuci cuci');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `userName` varchar(100) NOT NULL,
  `userEmail` varchar(150) NOT NULL,
  `userPassword` varchar(100) NOT NULL,
  `userGender` varchar(10) NOT NULL,
  `userDOB` date NOT NULL,
  `userRole` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `userName`, `userEmail`, `userPassword`, `userGender`, `userDOB`, `userRole`) VALUES
(1, 'Admin Utama', 'admin@email.com', 'admin123', 'Male', '1990-01-01', 'Admin'),
(3, 'staff', 'staff@govlash.com', '123456', 'Female', '2004-12-09', 'Laundry Staff'),
(4, 'cust1', 'aa@email.com', '123456', 'Male', '2000-01-10', 'Customer'),
(5, 'cust2', 'cust2@email.com', '123456', 'Female', '2000-01-01', 'Customer'),
(6, 'cust3', 'aaa@email.com', '123456', 'Male', '2002-12-12', 'Customer'),
(7, 'receptionist', 'rec@govlash.com', '123456', 'Female', '2005-12-07', 'Receptionist'),
(8, 'siti', 'siti@govlash.com', '123456', 'Female', '2003-12-11', 'Laundry Staff'),
(9, 'marfii', 'marfii@email.com', '123456', 'Male', '2006-12-06', 'Customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notificationID`),
  ADD KEY `recipientID` (`recipientID`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`serviceID`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transactionID`),
  ADD KEY `serviceID` (`serviceID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `receptionistID` (`receptionistID`),
  ADD KEY `laundryStaffID` (`laundryStaffID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `userEmail` (`userEmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notificationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `serviceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transactionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`recipientID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`serviceID`) REFERENCES `service` (`serviceID`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `user` (`userID`),
  ADD CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`receptionistID`) REFERENCES `user` (`userID`),
  ADD CONSTRAINT `transaction_ibfk_4` FOREIGN KEY (`laundryStaffID`) REFERENCES `user` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
