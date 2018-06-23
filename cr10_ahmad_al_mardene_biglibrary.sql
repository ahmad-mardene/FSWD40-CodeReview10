-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2018 at 04:56 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr10_ahmad_al_mardene_biglibrary`
--

-- --------------------------------------------------------

--
-- Table structure for table `auther`
--

CREATE TABLE `auther` (
  `autherId` int(11) NOT NULL,
  `autherName` varchar(30) NOT NULL,
  `autherSurname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auther`
--

INSERT INTO `auther` (`autherId`, `autherName`, `autherSurname`) VALUES
(1, ' Amy', 'Chozick '),
(2, 'Stephen', 'Hawking'),
(3, 'Bob Woodward', 'Carl Bernstein');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `mediaId` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `auther` varchar(55) NOT NULL,
  `ISBN` int(11) DEFAULT NULL,
  `publisher` varchar(55) NOT NULL,
  `publishDate` date DEFAULT NULL,
  `type` varchar(55) NOT NULL,
  `discription` varchar(500) DEFAULT NULL,
  `fk_autherId` int(11) NOT NULL,
  `fk_publisherId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`mediaId`, `title`, `image`, `auther`, `ISBN`, `publisher`, `publishDate`, `type`, `discription`, `fk_autherId`, `fk_publisherId`) VALUES
(1, 'Chasing Hillary', 'img/Chasing Hillary.jpg', 'Amy Chozick ', 97800624, 'Harper', '2018-04-01', 'book', 'this is a discription', 1, 1),
(2, 'A Brief History of Time', 'img/a brief history of time.jpg', 'Stephen Hawking', 553380168, 'Bantam', '1989-09-01', 'book', 'A landmark volume in science writing by one of the great minds of our time, Stephen Hawking’s book explores such profound questions as: How did the universe begin—and what made its start possible? Does time always flow forward? Is the universe unending—or are there boundaries? Are there other dimensions in space? What will happen when it all ends?', 2, 2),
(3, 'All The President\'s Men', 'img/all the president\'s men.jpg', 'Bob Woodward  and Carl Bernstein', 671894412, 'Simon & Schuster', '1994-06-16', '', 'The full account of the Watergate scandal from the two Washington Post reporters who broke the story. This is “the work that brought down a presidency…perhaps the most influential piece of journalism in history” (Time, All-Time 100 Best Nonfiction Books).', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisherId` int(11) NOT NULL,
  `publisherName` varchar(55) NOT NULL,
  `address` varchar(255) NOT NULL,
  `size` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisherId`, `publisherName`, `address`, `size`) VALUES
(1, 'HarperCollins', 'New York City\r\n wall-street 121 ', 'medium'),
(2, 'Bantam', 'Washington DC, white house street 20/54/16', 'larg'),
(3, 'Simon & Schuster', 'somewhere in the world , in their company', 'small');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `userEmail` varchar(60) NOT NULL,
  `userPass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `userName`, `userEmail`, `userPass`) VALUES
(1, 'ahmad', 'ahmad@mail.com', 'bbdefa2950f49882f295b1285d4fa9dec45fc4144bfb07ee6acc68762d12c2e3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auther`
--
ALTER TABLE `auther`
  ADD PRIMARY KEY (`autherId`),
  ADD UNIQUE KEY `autherSurname` (`autherSurname`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`mediaId`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `fk_autherId` (`fk_autherId`),
  ADD KEY `fk_publisherId` (`fk_publisherId`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisherId`),
  ADD UNIQUE KEY `publisherName` (`publisherName`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `userEmail` (`userEmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auther`
--
ALTER TABLE `auther`
  MODIFY `autherId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `mediaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisherId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`fk_autherId`) REFERENCES `auther` (`autherId`),
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`fk_publisherId`) REFERENCES `publisher` (`publisherId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
