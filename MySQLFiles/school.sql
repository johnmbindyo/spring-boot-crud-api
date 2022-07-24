-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2022 at 06:52 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `admissionfile`
--

CREATE TABLE `admissionfile` (
  `idadmissionfile` int(10) UNSIGNED NOT NULL,
  `leaving_certificate` varchar(100) DEFAULT NULL,
  `guardian_1_name` varchar(100) DEFAULT NULL,
  `guadian_1_contact_info` varchar(100) DEFAULT NULL,
  `guardian_2_name` varchar(100) DEFAULT NULL,
  `guadian_2_contact_info` varchar(45) DEFAULT NULL,
  `previous_school` varchar(100) DEFAULT NULL,
  `previous_school_leaving_document` varchar(100) DEFAULT NULL,
  `medical_document` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admissionfile`
--

INSERT INTO `admissionfile` (`idadmissionfile`, `leaving_certificate`, `guardian_1_name`, `guadian_1_contact_info`, `guardian_2_name`, `guadian_2_contact_info`, `previous_school`, `previous_school_leaving_document`, `medical_document`) VALUES
(1, NULL, 'Mr John K', '345 Nairobi', NULL, NULL, 'Potter\'s Academy', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dormitory`
--

CREATE TABLE `dormitory` (
  `iddormitory` int(10) UNSIGNED NOT NULL,
  `dormitoryname` varchar(45) DEFAULT NULL,
  `no_of_wings` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dormitory`
--

INSERT INTO `dormitory` (`iddormitory`, `dormitoryname`, `no_of_wings`) VALUES
(1, 'Dormtory A', 3);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `idstudent` int(10) UNSIGNED NOT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `dormitory_iddormitory` int(10) UNSIGNED NOT NULL,
  `file_no` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`idstudent`, `surname`, `first_name`, `last_name`, `dob`, `dormitory_iddormitory`, `file_no`) VALUES
(1, 'Lionel', 'Michael', 'Messi', '1991-10-01', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_has_subject`
--

CREATE TABLE `student_has_subject` (
  `student_idstudent` int(10) UNSIGNED NOT NULL,
  `subject_idsubject` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_has_subject`
--

INSERT INTO `student_has_subject` (`student_idstudent`, `subject_idsubject`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `idsubject` int(10) UNSIGNED NOT NULL,
  `subjectname` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`idsubject`, `subjectname`) VALUES
(1, 'Mathematics Form 1'),
(2, 'English Form 1');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `idteacher` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `teacher_no` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`idteacher`, `full_name`, `teacher_no`) VALUES
(1, 'Mrs Susan', 'TSC001');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_has_subject`
--

CREATE TABLE `teacher_has_subject` (
  `teacher_idteacher` int(10) UNSIGNED NOT NULL,
  `subject_idsubject` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teacher_has_subject`
--

INSERT INTO `teacher_has_subject` (`teacher_idteacher`, `subject_idsubject`) VALUES
(1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admissionfile`
--
ALTER TABLE `admissionfile`
  ADD PRIMARY KEY (`idadmissionfile`),
  ADD UNIQUE KEY `idadmissionfile_UNIQUE` (`idadmissionfile`);

--
-- Indexes for table `dormitory`
--
ALTER TABLE `dormitory`
  ADD PRIMARY KEY (`iddormitory`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`idstudent`),
  ADD UNIQUE KEY `idstudent_UNIQUE` (`idstudent`),
  ADD KEY `fk_student_dormitory1_idx` (`dormitory_iddormitory`),
  ADD KEY `fk_student_admissionfile1_idx` (`file_no`);

--
-- Indexes for table `student_has_subject`
--
ALTER TABLE `student_has_subject`
  ADD PRIMARY KEY (`student_idstudent`,`subject_idsubject`),
  ADD KEY `fk_student_has_subject_subject1_idx` (`subject_idsubject`),
  ADD KEY `fk_student_has_subject_student1_idx` (`student_idstudent`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`idsubject`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`idteacher`),
  ADD UNIQUE KEY `idteacher_UNIQUE` (`idteacher`);

--
-- Indexes for table `teacher_has_subject`
--
ALTER TABLE `teacher_has_subject`
  ADD PRIMARY KEY (`teacher_idteacher`,`subject_idsubject`),
  ADD KEY `fk_teacher_has_subject_subject1_idx` (`subject_idsubject`),
  ADD KEY `fk_teacher_has_subject_teacher1_idx` (`teacher_idteacher`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admissionfile`
--
ALTER TABLE `admissionfile`
  MODIFY `idadmissionfile` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dormitory`
--
ALTER TABLE `dormitory`
  MODIFY `iddormitory` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `idstudent` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `idsubject` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `idteacher` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_student_admissionfile1` FOREIGN KEY (`file_no`) REFERENCES `admissionfile` (`idadmissionfile`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_student_dormitory1` FOREIGN KEY (`dormitory_iddormitory`) REFERENCES `dormitory` (`iddormitory`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_has_subject`
--
ALTER TABLE `student_has_subject`
  ADD CONSTRAINT `fk_student_has_subject_student1` FOREIGN KEY (`student_idstudent`) REFERENCES `student` (`idstudent`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_student_has_subject_subject1` FOREIGN KEY (`subject_idsubject`) REFERENCES `subject` (`idsubject`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `teacher_has_subject`
--
ALTER TABLE `teacher_has_subject`
  ADD CONSTRAINT `fk_teacher_has_subject_subject1` FOREIGN KEY (`subject_idsubject`) REFERENCES `subject` (`idsubject`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_teacher_has_subject_teacher1` FOREIGN KEY (`teacher_idteacher`) REFERENCES `teacher` (`idteacher`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
