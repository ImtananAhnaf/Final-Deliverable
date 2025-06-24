-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2025 at 05:08 PM
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
-- Database: `dialogflow_chatbot_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`ID`, `name`, `email`, `password`) VALUES
(1, 'Admin', 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `ID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `_to` varchar(255) NOT NULL,
  `_date` varchar(255) NOT NULL,
  `seen` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`id`, `course_id`, `name`, `start_date`, `end_date`) VALUES
(1, 2, 'Batch 1 of Mobile Development Using Kotlin ', '2025-05-14', '2025-07-14');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `ID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `fee` int(11) NOT NULL,
  `duration` varchar(100) NOT NULL,
  `level` varchar(50) NOT NULL,
  `mode` varchar(50) NOT NULL,
  `is_assigned` int(11) NOT NULL DEFAULT 0,
  `certification` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`ID`, `title`, `description`, `image`, `fee`, `duration`, `level`, `mode`, `is_assigned`, `certification`) VALUES
(1, 'Fundamentals of Python', 'Python is a popular programming language. It was created by Guido van Rossum, and released in 1991.\r\n\r\nIt is used for:\r\n\r\nweb development (server-side),\r\nsoftware development,\r\nmathematics,\r\nsystem scripting.\r\nWhat can Python do?\r\nPython can be used on a server to create web applications.\r\nPython can be used alongside software to create workflows.\r\nPython can connect to database systems. It can also read and modify files.\r\nPython can be used to handle big data and perform complex mathematics.\r\nPython can be used for rapid prototyping, or for production-ready software development.', '1745078134.jfif', 2000, '3 Months', 'Beginner', 'Online', 1, NULL),
(2, 'Mobile App Development Using Kotlin', 'A', '1745078216.jfif', 3500, '', '', '', 1, 'Certification Info for Kotlin Course\nCourse:<br> Mobile App Development Using Kotlin\n\nCertification Info:\nYes, you will receive a Certificate of Completion after successfully finishing the Kotlin course. The certificate is digitally signed and verifiable, and you can add it to your LinkedIn profile or resume.'),
(4, 'Web Development (Laravel)', 'A', '1747036223.png', 4500, '', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_enroll`
--

CREATE TABLE `course_enroll` (
  `ID` int(11) NOT NULL,
  `S_ID` int(11) NOT NULL,
  `C_ID` int(11) NOT NULL,
  `fee_status` varchar(50) NOT NULL DEFAULT 'Not Paid'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `course_enroll`
--

INSERT INTO `course_enroll` (`ID`, `S_ID`, `C_ID`, `fee_status`) VALUES
(1, 1, 1, 'Paid'),
(2, 1, 4, 'Not Paid'),
(3, 1, 2, 'Not Paid');

-- --------------------------------------------------------

--
-- Table structure for table `course_material`
--

CREATE TABLE `course_material` (
  `ID` int(11) NOT NULL,
  `C_ID` int(11) NOT NULL,
  `title` text NOT NULL,
  `material` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_registrations`
--

CREATE TABLE `course_registrations` (
  `id` int(11) NOT NULL,
  `student_name` varchar(100) DEFAULT NULL,
  `student_email` varchar(100) DEFAULT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `registered_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_registrations`
--

INSERT INTO `course_registrations` (`id`, `student_name`, `student_email`, `course_name`, `registered_on`) VALUES
(2, 'Asad', 'asad@gmail.com', 'Fundamentals of Python', '2025-05-12 16:46:21'),
(5, 'Asad', 'asad@gmail.com', 'Mobile App Development Using Kotlin', '2025-05-12 16:52:06');

-- --------------------------------------------------------

--
-- Table structure for table `course_teacher`
--

CREATE TABLE `course_teacher` (
  `ID` int(11) NOT NULL,
  `T_ID` int(11) NOT NULL,
  `C_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `course_teacher`
--

INSERT INTO `course_teacher` (`ID`, `T_ID`, `C_ID`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `course_video`
--

CREATE TABLE `course_video` (
  `ID` int(11) NOT NULL,
  `C_ID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `video` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `live_classes`
--

CREATE TABLE `live_classes` (
  `ID` int(11) NOT NULL,
  `C_ID` int(11) NOT NULL,
  `_date` varchar(100) NOT NULL,
  `_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `ID` int(11) NOT NULL,
  `Q_ID` int(11) NOT NULL,
  `op1` varchar(255) NOT NULL,
  `op2` varchar(255) NOT NULL,
  `op3` varchar(255) NOT NULL,
  `op4` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `ID` int(11) NOT NULL,
  `C_ID` varchar(100) NOT NULL,
  `question` varchar(255) NOT NULL,
  `correct` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_attempts`
--

CREATE TABLE `quiz_attempts` (
  `ID` int(11) NOT NULL,
  `S_ID` int(11) NOT NULL,
  `Q_ID` int(11) NOT NULL,
  `attempted_on` varchar(100) NOT NULL,
  `obtain_marks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `day_of_week` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `batch_id`, `day_of_week`, `start_time`, `end_time`) VALUES
(1, 1, 'Wednesday', '18:40:00', '20:40:00');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_quiz`
--

CREATE TABLE `schedule_quiz` (
  `ID` int(11) NOT NULL,
  `C_ID` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `start_date` varchar(100) NOT NULL,
  `end_date` varchar(100) NOT NULL,
  `marks` int(11) NOT NULL,
  `quiz_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `fName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `cellNo` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`ID`, `name`, `fName`, `email`, `image`, `address`, `cellNo`, `password`) VALUES
(1, 'Shaheer', 'Asim Ali', 'sohailqureshi718@gmail.com', '1745493562.png', 'teh and dist mansehra vil and PO shehalia', '03331231233', '1234'),
(2, 'Farwa Rani', 'Asim Ali', 'sohailqureshi718@gmail.com', '1746167898.png', 'teh and dist mansehra vil and PO shehalia', '03001234568', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `cellNo` varchar(100) NOT NULL,
  `qual` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`ID`, `name`, `email`, `address`, `cellNo`, `qual`, `password`, `image`) VALUES
(1, 'Abdul Manan', 'manan@gmail.com', 'Abc city', '03122343234', 'Masters', '1234', '1747121314.png'),
(2, 'Shahid Iqbal', 'shahid@gmail.com', 'Islamabad f-10 markaz ', '03001204033', 'BSSE', '1234', '1747148606.png');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `TrxID` int(11) NOT NULL,
  `S_ID` int(11) NOT NULL,
  `C_ID` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `date_created` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `user_interests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `interest` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`TrxID`, `S_ID`, `C_ID`, `amount`, `date_created`) VALUES
(1, 1, 1, 2000, '2025-05-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`ID`);



ALTER TABLE `user_interests`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `course_enroll`
--
ALTER TABLE `course_enroll`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `course_material`
--
ALTER TABLE `course_material`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `course_registrations`
--
ALTER TABLE `course_registrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_teacher`
--
ALTER TABLE `course_teacher`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `course_video`
--
ALTER TABLE `course_video`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `live_classes`
--
ALTER TABLE `live_classes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batch_id` (`batch_id`);

--
-- Indexes for table `schedule_quiz`
--
ALTER TABLE `schedule_quiz`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`TrxID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `course_enroll`
--
ALTER TABLE `course_enroll`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `course_material`
--
ALTER TABLE `course_material`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_registrations`
--
ALTER TABLE `course_registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `course_teacher`
--
ALTER TABLE `course_teacher`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course_video`
--
ALTER TABLE `course_video`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_classes`
--
ALTER TABLE `live_classes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `schedule_quiz`
--
ALTER TABLE `schedule_quiz`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `TrxID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `batches`
--
ALTER TABLE `batches`
  ADD CONSTRAINT `batches_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`ID`);

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
