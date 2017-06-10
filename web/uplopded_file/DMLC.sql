-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.41-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema dmlc
--

CREATE DATABASE IF NOT EXISTS dmlc;
USE dmlc;

--
-- Definition of table `comments_on`
--

DROP TABLE IF EXISTS `comments_on`;
CREATE TABLE `comments_on` (
  `comment_id` int(10) unsigned NOT NULL auto_increment,
  `comment` varchar(600) NOT NULL,
  `employee_name` varchar(150) NOT NULL,
  `date_time` datetime NOT NULL,
  `document_id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`comment_id`),
  KEY `FK_comments_on_document` (`document_id`),
  KEY `FK_comments_on_employee` (`employee_id`),
  CONSTRAINT `FK_comments_on_document` FOREIGN KEY (`document_id`) REFERENCES `document` (`document_id`),
  CONSTRAINT `FK_comments_on_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments_on`
--

/*!40000 ALTER TABLE `comments_on` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments_on` ENABLE KEYS */;


--
-- Definition of table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `document_id` int(10) unsigned NOT NULL auto_increment,
  `date_time` datetime NOT NULL,
  PRIMARY KEY  (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `document`
--

/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;


--
-- Definition of table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `employee_id` int(10) unsigned NOT NULL auto_increment,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `comtact_info` varchar(300) NOT NULL,
  `contact_cell` varchar(14) NOT NULL,
  `contact_email` varchar(50) NOT NULL,
  `num_compleated_task` int(10) unsigned NOT NULL,
  `is_active` int(10) unsigned NOT NULL,
  `employee_organogram_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`employee_id`),
  KEY `FK_employee_employee_organogram` (`employee_organogram_id`),
  CONSTRAINT `FK_employee_employee_organogram` FOREIGN KEY (`employee_organogram_id`) REFERENCES `employee_organogram` (`employee_organogram_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


--
-- Definition of table `employee_organogram`
--

DROP TABLE IF EXISTS `employee_organogram`;
CREATE TABLE `employee_organogram` (
  `employee_organogram_id` int(10) unsigned NOT NULL auto_increment,
  `designation` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `has_parent` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`employee_organogram_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_organogram`
--

/*!40000 ALTER TABLE `employee_organogram` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_organogram` ENABLE KEYS */;


--
-- Definition of table `letter`
--

DROP TABLE IF EXISTS `letter`;
CREATE TABLE `letter` (
  `letter_id` int(10) unsigned NOT NULL auto_increment,
  `current_status` varchar(10) NOT NULL,
  `receiving_date` date NOT NULL,
  `department_of_origin` varchar(50) NOT NULL,
  `request_id` varchar(50) NOT NULL,
  `subject_of_letter` varchar(300) NOT NULL,
  `end_date` date NOT NULL,
  `document_id` int(10) unsigned NOT NULL,
  `short_desc` varchar(600) NOT NULL,
  `scan_fite` varchar(300) NOT NULL,
  PRIMARY KEY  (`letter_id`),
  KEY `FK_letter_document` (`document_id`),
  CONSTRAINT `FK_letter_document` FOREIGN KEY (`document_id`) REFERENCES `document` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `letter`
--

/*!40000 ALTER TABLE `letter` DISABLE KEYS */;
/*!40000 ALTER TABLE `letter` ENABLE KEYS */;


--
-- Definition of table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` int(10) unsigned NOT NULL auto_increment,
  `message` varchar(300) NOT NULL,
  `message_to_user` int(10) unsigned NOT NULL,
  `is_seen` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY  (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;


--
-- Definition of table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `notification_id` int(10) unsigned NOT NULL auto_increment,
  `notification` varchar(200) NOT NULL,
  `is_seen` int(10) unsigned NOT NULL,
  `notification_to_user` varchar(150) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY  (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notification`
--

/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;


--
-- Definition of table `receives_document`
--

DROP TABLE IF EXISTS `receives_document`;
CREATE TABLE `receives_document` (
  `forwarding_id` int(10) unsigned NOT NULL auto_increment,
  `acknowledgement_date_time` datetime NOT NULL,
  `forwarding_date_time` datetime NOT NULL,
  `forwarded_to_employee_username` varchar(150) NOT NULL,
  `acknowledged_by_employee_username` varchar(150) NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `letter_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`forwarding_id`),
  KEY `FK_receives_document_employee` (`employee_id`),
  KEY `FK_receives_document_letter` (`letter_id`),
  CONSTRAINT `FK_receives_document_letter` FOREIGN KEY (`letter_id`) REFERENCES `letter` (`letter_id`),
  CONSTRAINT `FK_receives_document_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `receives_document`
--

/*!40000 ALTER TABLE `receives_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `receives_document` ENABLE KEYS */;


--
-- Definition of table `response_document`
--

DROP TABLE IF EXISTS `response_document`;
CREATE TABLE `response_document` (
  `response_document_id` int(10) unsigned NOT NULL auto_increment,
  `published_status` varchar(10) NOT NULL,
  `current_working_employee` varchar(150) NOT NULL,
  `document_id` int(10) unsigned NOT NULL,
  `response_file` varchar(300) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY  (`response_document_id`),
  KEY `FK_response_document_document` (`document_id`),
  CONSTRAINT `FK_response_document_document` FOREIGN KEY (`document_id`) REFERENCES `document` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `response_document`
--

/*!40000 ALTER TABLE `response_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `response_document` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
