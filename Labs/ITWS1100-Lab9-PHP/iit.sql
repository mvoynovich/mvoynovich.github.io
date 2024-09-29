-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2023 at 01:49 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iit`
--

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `actorid` int(10) UNSIGNED NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `first_names` varchar(50) NOT NULL,
  `dob` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `actors`
--

INSERT INTO `actors` (`actorid`, `last_name`, `first_names`, `dob`) VALUES
(1, 'Yeoh', 'Michelle', '1962-08-06'),
(2, 'Hong', 'James', '1929-02-02'),
(3, 'Hsu', 'Stephanie', '1990-11-25'),
(4, 'Quan', 'Ke Huy', '1971-08-20'),
(5, 'Curtis', 'Jamie', '1958-11-22'),
(6, 'Hamill', 'Mark', '1951-09-25'),
(7, 'Ford', 'Harrison', '1942-07-13'),
(8, 'Pratt', 'Christopher', '1979-07-21'),
(9, 'Watson', 'Emma', '1990-04-15'),
(10, 'Gambon', 'Michael', '1940-10-19'),
(11, 'McKellen', 'Ian', '1939-05-25');

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `characterid` int(10) UNSIGNED NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`characterid`, `role`) VALUES
(1, 'Luke SkyWalker'),
(2, 'Han Solo'),
(3, 'Gandalf'),
(4, 'Hermoine Granger'),
(5, 'Albus Dumbeldore'),
(6, 'Star-Lord'),
(7, 'Mario'),
(8, 'Owen Grady'),
(9, 'Evelyn Wang'),
(10, 'Joy Wang'),
(11, 'Deirdre Beaubeirdra');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movieid` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `year` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movieid`, `title`, `year`) VALUES
(1, 'The Lord of the Rings: The Fellowship of the Ring', '2001'),
(2, 'Jurassic World', '2015'),
(3, 'Star Wars: Episode IV – A New Hope', '1977'),
(4, 'Harry Potter and the Philosopher\'s Stone', '2001'),
(5, 'Everything Everywhere All at Once', '2022'),
(6, 'The Super Mario Bros. Movie', '2023'),
(7, 'Avengers: Endgame', '2019'),
(8, 'Guardians of the Galaxy', '2014');

-- --------------------------------------------------------

--
-- Table structure for table `relationships`
--

CREATE TABLE `relationships` (
  `relationshipid` int(10) UNSIGNED NOT NULL,
  `movieid` int(10) UNSIGNED NOT NULL,
  `actorid` int(10) UNSIGNED NOT NULL,
  `characterid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `relationships`
--

INSERT INTO `relationships` (`relationshipid`, `movieid`, `actorid`, `characterid`) VALUES
(1, 1, 11, 3),
(2, 2, 8, 8),
(3, 3, 6, 1),
(4, 3, 7, 2),
(5, 4, 9, 4),
(6, 4, 10, 5),
(7, 5, 1, 9),
(8, 5, 3, 10),
(9, 5, 5, 11),
(10, 6, 8, 7),
(11, 7, 8, 6),
(12, 8, 8, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`actorid`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`characterid`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movieid`);

--
-- Indexes for table `relationships`
--
ALTER TABLE `relationships`
  ADD PRIMARY KEY (`relationshipid`),
  ADD KEY `movieid` (`movieid`),
  ADD KEY `actorid` (`actorid`),
  ADD KEY `characterid` (`characterid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actors`
--
ALTER TABLE `actors`
  MODIFY `actorid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `characterid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movieid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `relationships`
--
ALTER TABLE `relationships`
  MODIFY `relationshipid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `relationships`
--
ALTER TABLE `relationships`
  ADD CONSTRAINT `relationships_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  ADD CONSTRAINT `relationships_ibfk_2` FOREIGN KEY (`actorid`) REFERENCES `actors` (`actorid`),
  ADD CONSTRAINT `relationships_ibfk_3` FOREIGN KEY (`characterid`) REFERENCES `characters` (`characterid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
