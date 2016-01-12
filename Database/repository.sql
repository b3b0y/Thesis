-- phpMyAdmin SQL Dump
-- version 2.11.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 12, 2016 at 06:08 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `repository`
--

-- --------------------------------------------------------

--
-- Table structure for table `fr_activityfolder`
--

CREATE TABLE IF NOT EXISTS `fr_activityfolder` (
  `ID` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `folder_name` varchar(100) NOT NULL,
  `folder_path` varchar(1000) NOT NULL,
  `folder_owner` int(11) NOT NULL,
  `parent_folder` int(11) NOT NULL,
  `Date_deadline` date NOT NULL,
  `Time_deadline` time NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `fr_activityfolder`
--


-- --------------------------------------------------------

--
-- Table structure for table `fr_course`
--

CREATE TABLE IF NOT EXISTS `fr_course` (
  `id` int(11) NOT NULL auto_increment,
  `CCode` varchar(50) NOT NULL,
  `CDesc` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `fr_course`
--

INSERT INTO `fr_course` (`id`, `CCode`, `CDesc`) VALUES
(1, 'BSIT', 'Bachelor of Science in Inforamtion Technology'),
(2, 'BSCS', 'Bachelor of Science in Computer Science'),
(3, 'ACT', 'Associate in Computer Technology'),
(4, 'BSCOE', 'Bachelor of Science in Computer Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `fr_deadline`
--

CREATE TABLE IF NOT EXISTS `fr_deadline` (
  `ID` int(11) NOT NULL auto_increment,
  `folder_id` varchar(200) NOT NULL,
  `date_deadline` date NOT NULL,
  `time_deadline` time NOT NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `folder_id` (`folder_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `fr_deadline`
--

INSERT INTO `fr_deadline` (`ID`, `folder_id`, `date_deadline`, `time_deadline`) VALUES
(4, '8', '2015-12-04', '08:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `fr_folder_owner`
--

CREATE TABLE IF NOT EXISTS `fr_folder_owner` (
  `ID` int(11) NOT NULL auto_increment,
  `Fid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=69 ;

--
-- Dumping data for table `fr_folder_owner`
--

INSERT INTO `fr_folder_owner` (`ID`, `Fid`, `uid`) VALUES
(1, 1, 1),
(53, 46, 27),
(54, 48, 28),
(55, 53, 29),
(56, 1, 27),
(62, 6, 28),
(67, 9, 28),
(68, 10, 28);

-- --------------------------------------------------------

--
-- Table structure for table `fr_ins_subject`
--

CREATE TABLE IF NOT EXISTS `fr_ins_subject` (
  `ID` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `SubPath` varchar(1000) NOT NULL,
  `Folder_Owner` int(11) NOT NULL,
  `Parent_F` int(11) NOT NULL,
  `Date_Created` date NOT NULL,
  `Time_Created` time NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `fr_ins_subject`
--

INSERT INTO `fr_ins_subject` (`ID`, `uid`, `Subject`, `SubPath`, `Folder_Owner`, `Parent_F`, `Date_Created`, `Time_Created`) VALUES
(7, 28, 'IT17', 'C:/xampp/htdocs/WLCFileRepoRev/Data/Instructor/Cantero, Joscoroc/2015-2016/1st Semester/IT17', 27, 57, '2004-12-15', '06:21:05'),
(9, 28, 'a', 'C:/xampp/htdocs/WLCFileRepoRev/Data/Instructor/Cantero, Joscoroc/2015-2016/1st Semester/IT17/a', 28, 7, '2016-01-04', '23:49:03'),
(10, 28, 'bb', 'C:/xampp/htdocs/WLCFileRepoRev/Data/Instructor/Cantero, Joscoroc/2015-2016/1st Semester/IT17/bb', 28, 7, '2016-01-04', '23:56:47');

-- --------------------------------------------------------

--
-- Table structure for table `fr_path`
--

CREATE TABLE IF NOT EXISTS `fr_path` (
  `pathID` int(11) NOT NULL auto_increment,
  `pathName` varchar(1000) NOT NULL,
  `Folder_Name` varchar(100) NOT NULL,
  `Parent_F` int(11) NOT NULL,
  PRIMARY KEY  (`pathID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=58 ;

--
-- Dumping data for table `fr_path`
--

INSERT INTO `fr_path` (`pathID`, `pathName`, `Folder_Name`, `Parent_F`) VALUES
(1, 'C:/xampp/htdocs/WLCFileRepoRev/Data', 'Data', 1),
(45, 'C:/xampp/htdocs/WLCFileRepoRev/Data/Dean', 'Dean', 1),
(46, 'C:/xampp/htdocs/WLCFileRepoRev/Data/Dean/Tarre, Cheryl', 'Tarre, Cheryl', 45),
(47, 'C:/xampp/htdocs/WLCFileRepoRev/Data/Instructor', 'Instructor', 1),
(48, 'C:/xampp/htdocs/WLCFileRepoRev/Data/Instructor/Cantero, Joscoroc', 'Cantero, Joscoroc', 47),
(51, 'C:/xampp/htdocs/WLCFileRepoRev/Data/Student', 'Student', 1),
(52, 'C:/xampp/htdocs/WLCFileRepoRev/Data/Student/BSIT', 'BSIT', 51),
(53, 'C:/xampp/htdocs/WLCFileRepoRev/Data/Student/BSIT/Marapoc-552', 'Marapoc-552', 52),
(56, 'C:/xampp/htdocs/WLCFileRepoRev/Data/Instructor/Cantero, Joscoroc/2015-2016', '2015-2016', 48),
(57, 'C:/xampp/htdocs/WLCFileRepoRev/Data/Instructor/Cantero, Joscoroc/2015-2016/1st Semester', '1st Semester', 56);

-- --------------------------------------------------------

--
-- Table structure for table `fr_rep`
--

CREATE TABLE IF NOT EXISTS `fr_rep` (
  `repID` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `Description` varchar(250) NOT NULL,
  `DateMod` datetime NOT NULL,
  `UserLvl` int(11) NOT NULL,
  PRIMARY KEY  (`repID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=161 ;

--
-- Dumping data for table `fr_rep`
--

INSERT INTO `fr_rep` (`repID`, `uid`, `Description`, `DateMod`, `UserLvl`) VALUES
(41, 1, ' Admin Added new Account  Tarre Cheryl', '2016-10-15 13:49:31', 5),
(42, 1, ' Admin Added new Account   ', '2016-10-15 13:49:54', 5),
(43, 2, 'tarre1 Last Log-in ', '2016-10-15 20:01:54', 4),
(44, 1, 'admin Last Log-in ', '2016-10-15 20:12:44', 5),
(45, 2, 'tarre1 Last Log-in ', '2016-10-15 20:13:04', 4),
(46, 2, 'tarre1 is Created a New Folder bb', '2016-10-15 14:14:48', 0),
(47, 1, 'admin is Created a New Folder bb', '2016-10-15 14:23:35', 0),
(48, 2, 'tarre1 is Created a New Folder bb', '2016-10-15 14:40:09', 0),
(49, 2, 'tarre1 is Created a New Folder bb', '2016-10-15 14:43:11', 0),
(50, 2, 'tarre1 is Created a New Folder bb', '2016-10-15 14:45:19', 0),
(51, 2, 'tarre1 is Created a New Folder bb', '2016-10-15 14:48:48', 0),
(52, 1, ' Admin Added new Generated Account  ', '2016-10-15 15:10:01', 5),
(53, 4, 'Leo MarapocAccount has been Activated ', '2016-10-15 21:10:28', 0),
(54, 4, ' Last Log-in ', '2016-10-15 21:10:30', 1),
(55, 1, ' Admin Added new Generated Account  ', '2016-10-15 15:16:37', 5),
(56, 5, 'Leo MarapocAccount has been Activated ', '2016-10-15 21:16:50', 0),
(57, 5, ' Last Log-in ', '2016-10-15 21:16:52', 1),
(58, 1, ' Admin Added new Generated Account  ', '2016-10-15 15:22:20', 5),
(59, 6, 'Leo MarapocAccount has been Activated ', '2016-10-15 21:23:36', 0),
(60, 6, ' Last Log-in ', '2016-10-15 21:23:41', 1),
(61, 1, ' Admin Added new Generated Account  ', '2016-10-15 15:25:12', 5),
(62, 7, 'Leo MarapocAccount has been Activated ', '2016-10-15 21:25:27', 0),
(63, 7, ' Last Log-in ', '2016-10-15 21:26:05', 1),
(64, 1, ' Admin Added new Generated Account  ', '2016-10-15 15:27:10', 5),
(65, 8, 'Leo MarapocAccount has been Activated ', '2016-10-15 21:27:38', 0),
(66, 8, ' Last Log-in ', '2016-10-15 21:27:40', 1),
(67, 1, ' Admin Added new Generated Account  ', '2016-10-15 15:28:34', 5),
(68, 9, 'Leo MarapocAccount has been Activated ', '2016-10-15 21:28:47', 0),
(69, 9, ' Last Log-in ', '2016-10-15 21:29:25', 1),
(70, 1, 'admin Last Log-in ', '2016-10-15 21:30:28', 5),
(71, 1, ' Admin Added new Generated Account  ', '2016-10-15 15:30:51', 5),
(72, 10, 'Leo MarapocAccount has been Activated ', '2016-10-15 21:31:05', 0),
(73, 10, ' Last Log-in ', '2016-10-15 21:31:06', 1),
(74, 10, 'marapoc is Created a New Folder aaa', '2016-10-15 15:31:36', 0),
(75, 10, 'marapoc is Created a New Folder aaa', '2016-10-15 16:02:25', 0),
(76, 2, 'tarre1 Last Log-in ', '2016-10-15 22:08:50', 4),
(77, 2, 'tarre1 Last Log-in ', '2016-10-15 22:11:57', 4),
(78, 1, 'admin Last Log-in ', '2016-10-15 22:13:40', 5),
(79, 1, ' Admin Added new Account   ', '2016-10-15 16:15:09', 5),
(80, 1, ' Admin Added new Account  Cantero Joscoro', '2016-10-15 16:23:29', 5),
(81, 2, 'Cheryl Tarre Added new Account  marapoc Leo', '2016-10-15 16:24:39', 4),
(82, 2, 'Cheryl Tarre Added new Account   ', '2016-10-15 16:24:46', 4),
(83, 1, ' Admin Added new Account   ', '2016-10-15 16:27:03', 5),
(84, 1, ' Admin Added new Account  Cantero Joscoro', '2016-10-15 16:29:34', 5),
(85, 1, ' Admin Added new Account   ', '2016-10-15 16:29:46', 5),
(86, 1, ' Admin Added new Account  Cantero Joscoro', '2016-10-15 16:37:30', 5),
(87, 2, 'Cheryl Tarre Added new Account  Marapoc Leo', '2016-10-15 16:40:02', 4),
(88, 10, 'marapoc Last Log-in ', '2016-10-15 22:46:19', 1),
(89, 18, 'cantero Last Log-in ', '2016-10-15 22:46:38', 3),
(90, 18, 'cantero is Created a New Folder BSIT', '2016-10-15 16:46:45', 0),
(91, 18, 'cantero Last Log-in ', '2016-10-15 22:49:21', 3),
(92, 18, 'cantero Last Log-in ', '2018-10-15 20:51:02', 3),
(93, 18, 'cantero Last Log-in ', '2027-10-15 00:33:40', 3),
(94, 1, 'admin Last Log-in ', '2027-10-15 00:35:57', 5),
(95, 18, 'cantero Last Log-in ', '2027-10-15 00:54:16', 3),
(96, 1, ' Admin Added new Generated Account  ', '2026-10-15 19:24:53', 5),
(97, 1, 'admin Last Log-in ', '2031-10-15 15:16:30', 5),
(98, 18, 'cantero Last Log-in ', '2031-10-15 15:43:06', 3),
(99, 18, 'cantero Last Log-in ', '2031-10-15 15:46:39', 3),
(100, 25, 'Romalyn BertudazoAccount has been Activated ', '2031-10-15 16:06:02', 0),
(101, 25, ' Last Log-in ', '2031-10-15 16:06:03', 1),
(102, 10, 'marapoc Last Log-in ', '2031-10-15 16:08:23', 1),
(103, 18, 'cantero Last Log-in ', '2031-10-15 16:16:41', 3),
(104, 10, 'marapoc Last Log-in ', '2031-10-15 16:17:15', 1),
(105, 25, 'romalyn Last Log-in ', '2031-10-15 16:18:28', 1),
(106, 24, 'Sheila ManceraAccount has been Activated ', '2031-10-15 16:19:57', 0),
(107, 24, ' Last Log-in ', '2031-10-15 16:19:59', 1),
(108, 18, 'cantero Last Log-in ', '2031-10-15 16:20:33', 3),
(109, 18, 'cantero Last Log-in ', '2031-10-15 18:52:33', 3),
(110, 26, 'Trina LarazzabalAccount has been Activated ', '2031-10-15 18:53:27', 0),
(111, 26, ' Last Log-in ', '2031-10-15 18:53:28', 1),
(112, 1, 'admin Last Log-in ', '2031-10-15 19:46:38', 5),
(113, 26, 'tambok Last Log-in ', '2031-10-15 19:46:55', 1),
(114, 25, 'romalyn Last Log-in ', '2031-10-15 19:47:08', 1),
(115, 1, 'admin Last Log-in ', '2019-11-15 06:15:47', 5),
(116, 1, ' Admin Added new Account  Tarre Cheryl', '2018-11-15 22:16:14', 5),
(117, 1, ' Admin Added new Account  Cantero Joscoroc', '2018-11-15 22:16:43', 5),
(118, 1, ' Admin Added new Generated Account  ', '2018-11-15 22:16:55', 5),
(119, 1, ' Admin Added new Generated Account  ', '2018-11-15 22:16:55', 5),
(120, 1, ' Admin Added new Generated Account  ', '2018-11-15 22:16:55', 5),
(121, 1, ' Admin Added new Generated Account  ', '2018-11-15 22:16:55', 5),
(122, 27, 'tarre1 Last Log-in ', '2019-11-15 06:17:29', 4),
(123, 29, 'Leo MarapocAccount has been Activated ', '2019-11-15 06:19:25', 0),
(124, 29, ' Last Log-in ', '2019-11-15 06:19:27', 1),
(125, 28, 'cantero Last Log-in ', '2019-11-15 06:19:43', 3),
(126, 27, 'tarre1 Last Log-in ', '2020-11-15 03:56:49', 4),
(127, 28, 'cantero Last Log-in ', '2020-11-15 03:57:58', 3),
(128, 29, 'b3b0y91 Last Log-in ', '2020-11-15 03:58:11', 1),
(129, 28, 'cantero Last Log-in ', '2024-11-15 01:12:33', 3),
(130, 29, 'b3b0y91 Last Log-in ', '2024-11-15 01:14:07', 1),
(131, 27, 'tarre1 Last Log-in ', '2024-11-15 01:18:51', 4),
(132, 28, 'cantero Last Log-in ', '2024-11-15 01:41:20', 3),
(133, 28, 'cantero Last Log-in ', '2024-11-15 02:02:44', 3),
(134, 29, 'b3b0y91 Last Log-in ', '2024-11-15 02:03:52', 1),
(135, 29, 'b3b0y91 Last Log-in ', '2024-11-15 02:39:49', 1),
(136, 29, 'b3b0y91 Last Log-in ', '2024-11-15 05:29:34', 1),
(137, 29, 'b3b0y91 Last Log-in ', '2024-11-15 05:35:53', 1),
(138, 28, 'cantero Last Log-in ', '2024-11-15 05:44:59', 3),
(139, 27, 'tarre1 Last Log-in ', '2024-11-15 06:47:12', 4),
(140, 28, 'cantero Last Log-in ', '2024-11-15 06:48:35', 3),
(141, 1, 'admin Last Log-in ', '2002-12-15 01:29:56', 5),
(142, 29, 'b3b0y91 Last Log-in ', '2002-12-15 01:32:19', 1),
(143, 28, 'cantero Last Log-in ', '2002-12-15 05:28:36', 3),
(144, 29, 'b3b0y91 Last Log-in ', '2002-12-15 05:29:04', 1),
(145, 28, 'cantero Last Log-in ', '2003-12-15 01:00:09', 3),
(146, 27, 'tarre1 Last Log-in ', '2003-12-15 02:37:20', 4),
(147, 27, 'tarre1 Last Log-in ', '2004-12-15 03:02:21', 4),
(148, 29, 'b3b0y91 Last Log-in ', '2004-12-15 03:14:08', 1),
(149, 27, 'tarre1 Last Log-in ', '2004-12-15 04:11:08', 4),
(150, 27, 'tarre1 is Created a New Folder a', '2004-12-15 04:39:29', 0),
(151, 27, 'tarre1 is Created a New Folder a', '2004-12-15 04:40:06', 0),
(152, 29, 'b3b0y91 Last Log-in ', '2004-12-15 05:12:33', 1),
(153, 28, 'cantero Last Log-in ', '2004-12-15 05:14:21', 3),
(154, 28, 'cantero is Created a New Folder a', '2004-12-15 05:22:55', 0),
(155, 27, 'tarre1 Last Log-in ', '2004-12-15 06:20:51', 4),
(156, 28, 'cantero Last Log-in ', '2004-12-15 06:21:20', 3),
(157, 1, 'admin Last Log-in ', '2001-01-16 19:21:03', 5),
(158, 28, 'cantero Last Log-in ', '2004-01-16 23:18:56', 3),
(159, 29, 'b3b0y91 Last Log-in ', '2004-01-16 23:47:15', 1),
(160, 1, 'admin Last Log-in ', '2013-01-16 01:54:07', 5);

-- --------------------------------------------------------

--
-- Table structure for table `fr_semester`
--

CREATE TABLE IF NOT EXISTS `fr_semester` (
  `SemID` int(11) NOT NULL auto_increment,
  `Semester` varchar(100) NOT NULL,
  `SYID` int(11) NOT NULL,
  PRIMARY KEY  (`SemID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `fr_semester`
--

INSERT INTO `fr_semester` (`SemID`, `Semester`, `SYID`) VALUES
(2, '1st Semester', 2),
(3, 'Summer', 2),
(4, '2nd Semester', 2),
(5, '1st Semester', 5);

-- --------------------------------------------------------

--
-- Table structure for table `fr_share_folder`
--

CREATE TABLE IF NOT EXISTS `fr_share_folder` (
  `shareID` int(11) NOT NULL auto_increment,
  `studID` int(11) NOT NULL,
  `Sub_Name` varchar(100) NOT NULL,
  `Folder_Name` varchar(1000) NOT NULL,
  `subID` int(11) NOT NULL,
  `Folder_Owner` int(11) NOT NULL,
  `Date_Created` date NOT NULL,
  `Time_Created` time NOT NULL,
  `upload` int(11) NOT NULL,
  `download` int(11) NOT NULL,
  PRIMARY KEY  (`shareID`),
  UNIQUE KEY `studID` (`studID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `fr_share_folder`
--

INSERT INTO `fr_share_folder` (`shareID`, `studID`, `Sub_Name`, `Folder_Name`, `subID`, `Folder_Owner`, `Date_Created`, `Time_Created`, `upload`, `download`) VALUES
(5, 29, 'IT17-a', 'a', 9, 28, '2016-01-04', '23:49:08', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fr_staff`
--

CREATE TABLE IF NOT EXISTS `fr_staff` (
  `id` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `FirstN` varchar(50) NOT NULL,
  `LastN` varchar(50) NOT NULL,
  `midN` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `fr_staff`
--

INSERT INTO `fr_staff` (`id`, `uid`, `FirstN`, `LastN`, `midN`) VALUES
(1, 1, '', 'Admin', ''),
(9, 27, 'Cheryl', 'Tarre', ''),
(10, 28, 'Joscoroc', 'Cantero', '');

-- --------------------------------------------------------

--
-- Table structure for table `fr_stud`
--

CREATE TABLE IF NOT EXISTS `fr_stud` (
  `ID` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `ControlNo` int(11) NOT NULL,
  `FName` varchar(50) NOT NULL,
  `LName` varchar(50) NOT NULL,
  `Mname` varchar(50) NOT NULL,
  `Course` varchar(30) NOT NULL,
  `Year` varchar(30) NOT NULL,
  `size` int(11) NOT NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ControlNo` (`ControlNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `fr_stud`
--

INSERT INTO `fr_stud` (`ID`, `uid`, `ControlNo`, `FName`, `LName`, `Mname`, `Course`, `Year`, `size`) VALUES
(23, 29, 552, 'Leo', 'Marapoc', '', 'BSIT', '4th Year', 0),
(24, 30, 445, 'Sheila', 'Mancera', '', 'BSIT', '4th Year', 0),
(25, 31, 443, 'Romalyn', 'Bertudazo', '', 'BSIT', '4th Year', 0),
(26, 32, 123, 'Trina', 'Larazzabal', '', 'BSBA', '3rd Year', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fr_stud_subject`
--

CREATE TABLE IF NOT EXISTS `fr_stud_subject` (
  `sID` int(11) NOT NULL auto_increment,
  `studID` int(11) NOT NULL,
  `Folder_Name` varchar(1000) NOT NULL,
  `SubPath` varchar(1000) NOT NULL,
  `subID` int(11) NOT NULL,
  `Date_Created` date NOT NULL,
  `Time_Created` time NOT NULL,
  `status` enum('APPROVED','DISAPPROVED') NOT NULL,
  PRIMARY KEY  (`sID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `fr_stud_subject`
--

INSERT INTO `fr_stud_subject` (`sID`, `studID`, `Folder_Name`, `SubPath`, `subID`, `Date_Created`, `Time_Created`, `status`) VALUES
(14, 29, '552-Marapoc-IT17', 'C:/xampp/htdocs/WLCFileRepoRev/Data/Instructor/Cantero, Joscoroc/2015-2016/1st Semester/IT17/552-Marapoc-IT17', 7, '2015-12-04', '06:21:37', 'APPROVED');

-- --------------------------------------------------------

--
-- Table structure for table `fr_subject`
--

CREATE TABLE IF NOT EXISTS `fr_subject` (
  `subID` int(11) NOT NULL auto_increment,
  `SubCode` varchar(250) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `status` enum('ASSIGNED','NOT ASSIGNED') NOT NULL default 'NOT ASSIGNED',
  `SemID` int(11) NOT NULL,
  PRIMARY KEY  (`subID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `fr_subject`
--

INSERT INTO `fr_subject` (`subID`, `SubCode`, `Description`, `status`, `SemID`) VALUES
(6, 'IT17', 'Information Security System', 'ASSIGNED', 2),
(7, 'IT8', 'Operating System', 'NOT ASSIGNED', 2),
(8, 'IT7', 'Computer Programming', 'NOT ASSIGNED', 2),
(9, 'IT4', 'presentation skills', 'NOT ASSIGNED', 2);

-- --------------------------------------------------------

--
-- Table structure for table `fr_sy`
--

CREATE TABLE IF NOT EXISTS `fr_sy` (
  `SYID` int(11) NOT NULL auto_increment,
  `SYstart` int(11) NOT NULL,
  `SYend` int(11) NOT NULL,
  PRIMARY KEY  (`SYID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `fr_sy`
--

INSERT INTO `fr_sy` (`SYID`, `SYstart`, `SYend`) VALUES
(2, 2015, 2016),
(10, 2016, 2017);

-- --------------------------------------------------------

--
-- Table structure for table `fr_user`
--

CREATE TABLE IF NOT EXISTS `fr_user` (
  `UserID` int(11) NOT NULL auto_increment,
  `UserName` varchar(20) NOT NULL,
  `UserPass` varchar(20) NOT NULL,
  `UserLvl` enum('1','2','3','4','5') NOT NULL,
  `last_login_date` datetime NOT NULL,
  `last_logout_date` datetime NOT NULL,
  `activate` int(11) NOT NULL default '1',
  `UserStat` enum('live','pending','offline') NOT NULL default 'pending',
  PRIMARY KEY  (`UserID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `fr_user`
--

INSERT INTO `fr_user` (`UserID`, `UserName`, `UserPass`, `UserLvl`, `last_login_date`, `last_logout_date`, `activate`, `UserStat`) VALUES
(1, 'admin', '12345', '5', '2016-01-13 01:54:07', '2015-12-02 05:28:27', 1, 'live'),
(27, 'tarre1', '12345', '4', '2015-12-04 06:20:51', '2015-12-04 06:21:17', 1, 'offline'),
(28, 'cantero', '12345', '3', '2016-01-04 11:18:56', '2015-12-04 06:20:36', 1, 'live'),
(29, 'b3b0y91', '12345', '1', '2016-01-04 11:47:14', '2015-12-04 04:11:03', 1, 'live'),
(30, '445', '123', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'pending'),
(31, '443', '123', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'pending'),
(32, '123', '123', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `fr_user_permissions`
--

CREATE TABLE IF NOT EXISTS `fr_user_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `upload` int(11) NOT NULL,
  `download` int(11) NOT NULL,
  `download_folders` int(11) NOT NULL,
  `create_folders` int(11) NOT NULL,
  `share` int(11) NOT NULL,
  `change_pass` int(11) NOT NULL,
  `rename_F` int(11) NOT NULL,
  `delete_F` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `fr_user_permissions`
--

INSERT INTO `fr_user_permissions` (`id`, `uid`, `upload`, `download`, `download_folders`, `create_folders`, `share`, `change_pass`, `rename_F`, `delete_F`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 0, 0),
(25, 27, 1, 1, 1, 0, 0, 1, 0, 0),
(26, 28, 1, 1, 1, 0, 0, 1, 0, 0),
(27, 29, 1, 1, 1, 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `not_id` int(11) NOT NULL auto_increment,
  `notification` varchar(500) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `folder_name` varchar(500) NOT NULL,
  `folder_owner` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY  (`not_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `notification`
--


-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE IF NOT EXISTS `position` (
  `ID` int(11) NOT NULL auto_increment,
  `Position` varchar(50) NOT NULL,
  `UserLvl` int(11) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`ID`, `Position`, `UserLvl`) VALUES
(1, 'admin', 5),
(2, 'Dean', 4),
(3, 'Instructor', 3),
(4, 'Working', 2),
(5, 'Student', 1);
