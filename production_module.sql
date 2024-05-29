-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2024 at 07:02 PM
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
-- Database: `production_module`
--

-- --------------------------------------------------------

--
-- Table structure for table `grading`
--

CREATE TABLE `grading` (
  `GradingID` int(50) NOT NULL,
  `PiecesFormed` varchar(50) NOT NULL,
  `GradeType` varchar(50) NOT NULL,
  `packing_id` int(11) NOT NULL,
  `Value` int(50) NOT NULL,
  `MachineAllotted` varchar(50) NOT NULL,
  `LaborAllotted` varchar(50) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `PurcOrder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grading`
--

INSERT INTO `grading` (`GradingID`, `PiecesFormed`, `GradeType`, `packing_id`, `Value`, `MachineAllotted`, `LaborAllotted`, `status`, `PurcOrder`) VALUES
(1, '1600', 'A', 0, 400, 'machine1', 'labor1', 'ToDo', 36),
(2, '1600', 'B', 0, 800, 'machine1', 'labor1', 'ToDo', 36),
(3, '1600', 'C', 0, 400, 'machine1', 'labor1', 'ToDo', 36);

-- --------------------------------------------------------

--
-- Table structure for table `inventorytable`
--

CREATE TABLE `inventorytable` (
  `id` int(50) NOT NULL,
  `TotalQuantity` int(50) NOT NULL,
  `SupplierName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventorytable`
--

INSERT INTO `inventorytable` (`id`, `TotalQuantity`, `SupplierName`) VALUES
(7, 100, 'supplier2');

-- --------------------------------------------------------

--
-- Table structure for table `iteminfo`
--

CREATE TABLE `iteminfo` (
  `id` int(11) NOT NULL,
  `Color` varchar(255) DEFAULT NULL,
  `Size` varchar(255) DEFAULT NULL,
  `OrderQuantity` int(11) DEFAULT NULL,
  `PurcOrder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `iteminfo`
--

INSERT INTO `iteminfo` (`id`, `Color`, `Size`, `OrderQuantity`, `PurcOrder`) VALUES
(62, 'Red', '4x4', 50, 36),
(63, 'Green', '8x8', 50, 36),
(64, 'Red', '10x10', 120, 37),
(65, 'Green', '12x12', 225, 38),
(66, 'Yellow', '4x4', 110, 39),
(67, 'White', '10x12', 200, 39);

-- --------------------------------------------------------

--
-- Table structure for table `packing`
--

CREATE TABLE `packing` (
  `id` int(11) NOT NULL,
  `grading_type` varchar(50) NOT NULL,
  `pieces` varchar(50) NOT NULL,
  `packing_type` varchar(50) NOT NULL,
  `packing_info` varchar(50) NOT NULL,
  `packing_status` varchar(50) NOT NULL,
  `packing_data` varchar(50) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `PurcOrder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packing`
--

INSERT INTO `packing` (`id`, `grading_type`, `pieces`, `packing_type`, `packing_info`, `packing_status`, `packing_data`, `status`, `PurcOrder`) VALUES
(65, 'A', '400', 'bundles', 'bundles: 80, boxes: 0', 'no pieces left in grading to be packed', '', 'ToDo', 36);

-- --------------------------------------------------------

--
-- Table structure for table `productionplan`
--

CREATE TABLE `productionplan` (
  `ProdID` int(50) NOT NULL,
  `PurcOrder` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchordertable`
--

CREATE TABLE `purchordertable` (
  `PurcOrder` int(11) NOT NULL,
  `ProdOrder` int(50) NOT NULL,
  `OrderType` varchar(50) NOT NULL,
  `UOM` text NOT NULL,
  `IssueDate` date NOT NULL,
  `CompletionDate` date NOT NULL,
  `PackingType` text NOT NULL,
  `Description` varchar(300) NOT NULL,
  `ItemCode` int(50) NOT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchordertable`
--

INSERT INTO `purchordertable` (`PurcOrder`, `ProdOrder`, `OrderType`, `UOM`, `IssueDate`, `CompletionDate`, `PackingType`, `Description`, `ItemCode`, `status`) VALUES
(36, 354, 'order1', 'KGs', '2024-04-30', '2024-05-24', 'Bundles', 'mix towels', 4837, 'incomplete'),
(37, 84375, 'order2', 'KGs', '2024-06-01', '2024-06-08', 'Bundles', 'red towels', 8583948, 'incomplete'),
(38, 4948, 'order3', 'KGs', '2024-04-28', '2024-05-23', 'Bundles', 'green towels', 2983, 'incomplete'),
(39, 31625, 'order4', 'KGs', '2024-06-13', '2024-07-06', 'Bundles', 'towles', 7383, 'incomplete');

-- --------------------------------------------------------

--
-- Table structure for table `stitchings`
--

CREATE TABLE `stitchings` (
  `StitchingID` int(11) NOT NULL,
  `Total` int(11) DEFAULT NULL,
  `WasteCount` int(11) DEFAULT NULL,
  `Remaining` int(11) DEFAULT NULL,
  `MachineAllotted` varchar(50) DEFAULT NULL,
  `LaborAllotted` varchar(50) DEFAULT NULL,
  `PiecesSize` varchar(50) DEFAULT NULL,
  `PiecesFormed` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `PurcOrder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stitchings`
--

INSERT INTO `stitchings` (`StitchingID`, `Total`, `WasteCount`, `Remaining`, `MachineAllotted`, `LaborAllotted`, `PiecesSize`, `PiecesFormed`, `status`, `PurcOrder`) VALUES
(44, 100, 20, 80, 'machine1', 'labor1', '2X2', 1600, 'ToDo', 36);

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `Id` int(50) NOT NULL,
  `ItemName` varchar(50) NOT NULL,
  `Quantity` int(50) NOT NULL,
  `Price` int(50) NOT NULL,
  `InventoryId` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`Id`, `ItemName`, `Quantity`, `Price`, `InventoryId`) VALUES
(13, 'Yellow', 50, 190, 7),
(14, 'Black', 50, 220, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `grading`
--
ALTER TABLE `grading`
  ADD PRIMARY KEY (`GradingID`),
  ADD KEY `fk_grading_PurcOrder` (`PurcOrder`);

--
-- Indexes for table `inventorytable`
--
ALTER TABLE `inventorytable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iteminfo`
--
ALTER TABLE `iteminfo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_iteminfo_PurcOrder` (`PurcOrder`);

--
-- Indexes for table `packing`
--
ALTER TABLE `packing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_packing_PurcOrder` (`PurcOrder`);

--
-- Indexes for table `productionplan`
--
ALTER TABLE `productionplan`
  ADD PRIMARY KEY (`ProdID`);

--
-- Indexes for table `purchordertable`
--
ALTER TABLE `purchordertable`
  ADD PRIMARY KEY (`PurcOrder`),
  ADD UNIQUE KEY `PurcOrder` (`PurcOrder`),
  ADD UNIQUE KEY `PurcOrder_2` (`PurcOrder`);

--
-- Indexes for table `stitchings`
--
ALTER TABLE `stitchings`
  ADD PRIMARY KEY (`StitchingID`),
  ADD KEY `fk_stitchings_PurcOrder` (`PurcOrder`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `stocksfk` (`InventoryId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `grading`
--
ALTER TABLE `grading`
  MODIFY `GradingID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inventorytable`
--
ALTER TABLE `inventorytable`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `iteminfo`
--
ALTER TABLE `iteminfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `packing`
--
ALTER TABLE `packing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `purchordertable`
--
ALTER TABLE `purchordertable`
  MODIFY `PurcOrder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `stitchings`
--
ALTER TABLE `stitchings`
  MODIFY `StitchingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `Id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `grading`
--
ALTER TABLE `grading`
  ADD CONSTRAINT `fk_grading_PurcOrder` FOREIGN KEY (`PurcOrder`) REFERENCES `purchordertable` (`PurcOrder`);

--
-- Constraints for table `iteminfo`
--
ALTER TABLE `iteminfo`
  ADD CONSTRAINT `fk_iteminfo_PurcOrder` FOREIGN KEY (`PurcOrder`) REFERENCES `purchordertable` (`PurcOrder`);

--
-- Constraints for table `stitchings`
--
ALTER TABLE `stitchings`
  ADD CONSTRAINT `fk_stitchings_PurcOrder` FOREIGN KEY (`PurcOrder`) REFERENCES `purchordertable` (`PurcOrder`);

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocksfk` FOREIGN KEY (`InventoryId`) REFERENCES `inventorytable` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
