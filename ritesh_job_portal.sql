-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2025 at 07:01 PM
-- Server version: 8.0.43
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ritesh_job_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int NOT NULL,
  `email` varchar(250) NOT NULL,
  `address_type` varchar(50) DEFAULT NULL,
  `street` varchar(150) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `pin_code` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT 'India',
  `landmark` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `email`, `address_type`, `street`, `city`, `state`, `pin_code`, `country`, `landmark`) VALUES
(2, 'riteshsony2@gmail.com', 'Permanent ', 'VILL TONGRI TOLA', 'RANCHI', 'Jharkhand', '835222', 'India', 'NEAR SAI MANDIR'),
(4, 'riteshsony2@gmail.com', 'Office Address', 'Shakti Poly Glass', 'Ranchi', 'Jharkhand', '834005', 'India', 'Near Piska More OverBridge');

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int NOT NULL,
  `candidateId` int NOT NULL,
  `candidateCV` varchar(255) NOT NULL,
  `jobId` int NOT NULL,
  `employerId` int NOT NULL,
  `status` enum('Applied','Shortlisted','Interview','Hired','Rejected') DEFAULT 'Applied',
  `appliedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `candidateId`, `candidateCV`, `jobId`, `employerId`, `status`, `appliedAt`, `email`) VALUES
(2, 1, '1RITESHResume1758025392362.pdf', 7, 1, 'Hired', '2025-09-29 10:05:07', 'riteshsony2@gmail.com'),
(3, 1, '1RITESHResume1758025392362.pdf', 6, 1, 'Interview', '2025-09-29 10:08:47', 'riteshsony2@gmail.com'),
(4, 1, '1RITESHResume1758025392362.pdf', 6, 1, 'Interview', '2025-09-29 10:10:47', 'riteshsony2@gmail.com'),
(5, 1, '1RITESHResume1758025392362.pdf', 9, 1, 'Rejected', '2025-09-29 10:32:04', 'riteshsony2@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `id` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `SchoolUniversity` varchar(100) NOT NULL,
  `CourseDegree` varchar(100) NOT NULL,
  `year` varchar(10) NOT NULL,
  `result` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `email`, `SchoolUniversity`, `CourseDegree`, `year`, `result`) VALUES
(1, 'riteshsony2@gmail.com', 'Ranchi University', 'BCA', '2025', '80'),
(3, 'riteshsony2@gmail.com', 'RAM LAKHAN SINGH YADAV COLLEGE', 'INTER', '2019', '47'),
(4, 'riteshsony2@gmail.com', 'CNRAJ HIGH SCHOOL', '10', '2016', '59');

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

CREATE TABLE `employer` (
  `id` int NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(255) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `industry_type` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `logo` varchar(500) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `about` varchar(500) DEFAULT NULL,
  `hr_name` varchar(50) DEFAULT NULL,
  `hr_email` varchar(255) DEFAULT NULL,
  `hr_phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employer`
--

INSERT INTO `employer` (`id`, `email`, `password`, `company_name`, `industry_type`, `location`, `website`, `logo`, `create_at`, `about`, `hr_name`, `hr_email`, `hr_phone`) VALUES
(1, 'shaktipolyglass@gmail.com', 'Shakti@123', 'Shakti Poly Glass', 'Printing and Signage', 'Ranchi', 'www.shaktipolyglass.com', 'Shakti1758730424774.jpg', '2025-09-20 16:02:14', NULL, 'Ritesh Soni', 'hr.spg@gmail.com', '07004270485');

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE `experience` (
  `id` int NOT NULL,
  `email` varchar(250) NOT NULL,
  `job_title` varchar(100) NOT NULL,
  `company_name` varchar(150) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `start_date` varchar(20) DEFAULT NULL,
  `end_date` varchar(20) DEFAULT NULL,
  `description` text,
  `skills_used` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`id`, `email`, `job_title`, `company_name`, `location`, `start_date`, `end_date`, `description`, `skills_used`) VALUES
(4, 'riteshsony2@gmail.com', 'Graphic Designer in corel', 'Shakti Poly Glass', 'Ranchi', '2019', '2025', 'Core Java (J2SE), J2EE (Servlet, JSP), JDBC, Spring Boot, Hibernate, JPA, MySQL, Java, C, C++, PHP, Python (Basic)', 'Computer Skills'),
(6, 'riteshsony2@gmail.com', 'Writer', 'Sri Sai Cyber Cafe', 'Banglore', '2019', '2025', 'aaaaaa', 'Flexi and Corel');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int NOT NULL,
  `employerId` int NOT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `skills_required` varchar(255) DEFAULT NULL,
  `experience_required` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `salary_range` varchar(50) DEFAULT NULL,
  `job_type` varchar(50) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `photo` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `employerId`, `job_title`, `description`, `skills_required`, `experience_required`, `location`, `salary_range`, `job_type`, `expire_date`, `created_at`, `photo`, `email`) VALUES
(6, 1, 'Graphic Designer', 'need a designer', 'corel', '1', 'Ranchi', '7-9', 'Full-Time', '2025-09-23', '2025-09-28 15:51:20', '1759074680891.jpg', 'shaktipolyglass@gmail.com'),
(7, 1, 'Full Stack Engineer', 'need a fs engineer ', 'Full Stack Java Course Complete', '1', 'Banglore', '15', 'Full-Time', '2025-10-10', '2025-09-28 15:51:49', '1759074709585.jpg', 'shaktipolyglass@gmail.com'),
(8, 1, 'Form Filler', 'need a staff', 'computer', '1', 'Ranchi', '1-2', 'Full-Time', '2025-10-10', '2025-09-28 15:53:43', '1759074823011.jpg', 'shaktipolyglass@gmail.com'),
(9, 1, 'Writer', 'need a computer operator', 'computer', '1', 'Online', '1-2', 'Part-Time', '2025-10-11', '2025-09-28 16:04:14', '1759075454510.jpg', 'shaktipolyglass@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int NOT NULL,
  `email` varchar(250) NOT NULL,
  `project_title` varchar(150) NOT NULL,
  `description` text,
  `technologies` varchar(255) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `project_url` varchar(255) DEFAULT NULL,
  `github_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `email`, `project_title`, `description`, `technologies`, `role`, `start_date`, `end_date`, `project_url`, `github_url`) VALUES
(2, 'riteshsony2@gmail.com', 'Portfolio', 'React + Vite', 'react', 'Full Stack Role', '2025-09-03', '2025-09-10', 'https://riteshxoni.netlify.app/', 'https://github.com/riteshxoni/Portfolio'),
(3, 'riteshsony2@gmail.com', 'Job Portal', 'working', 'HTML,CSS,JS,Advance Java', 'Full Stack Role', '2025-09-03', '2025-09-20', 'NOT READY', 'NOT READY');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `skill` varchar(50) DEFAULT NULL,
  `proficiency` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `email`, `skill`, `proficiency`) VALUES
(1, 'riteshsony2@gmail.com', 'Java', 'Intermediate'),
(2, 'riteshsony2@gmail.com', 'Advance Java', 'Intermediate'),
(3, 'riteshsony2@gmail.com', 'Spring Framwork', 'Intermediate');

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `id` int NOT NULL,
  `email` varchar(250) NOT NULL,
  `platform` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(30) NOT NULL,
  `city` varchar(25) NOT NULL,
  `fields` varchar(122) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `maritalStatus` varchar(50) DEFAULT NULL,
  `fatherName` varchar(50) DEFAULT NULL,
  `motherName` varchar(50) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `heading` varchar(500) DEFAULT NULL,
  `photo` varchar(500) DEFAULT (_cp850'profile.jpg'),
  `resume` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `gender`, `dob`, `email`, `phone`, `password`, `city`, `fields`, `title`, `nationality`, `maritalStatus`, `fatherName`, `motherName`, `language`, `heading`, `photo`, `resume`) VALUES
(1, 'RITESH KUMAR SONI', 'Men', '2001-09-15', 'riteshsony2@gmail.com', '7004270485', 'Ritesh@123', 'RANCHI', 'Software Development', 'Full Stack Java Developer', 'Indian', 'Single', 'Mahavir Soni', 'Punam Devi', 'Hindi, English', 'Aspiring Project Leader in Java Technologies with strong foundation in Core Java, Spring Boot, Hibernate, JDBC, and MySQL. Experienced in end-to-end SDLC execution through academic projects and internships including requirement gathering, database design, coding, testing, and deployment. Seeking to contribute in Java/J2EE enterprise-grade projects with a focus on team collaboration, technical architecture, and client-server applications.', '1RITESH1758002186550.JPG', '1RITESHResume1758025392362.pdf'),
(5, 'Anisha Kumari', 'women', NULL, 'anishasingh5666@gmail.com', NULL, 'Anisha@123', 'Bengaluru', 'Software Development', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aaaaaa.jpg', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employer`
--
ALTER TABLE `employer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `hr_email` (`hr_email`),
  ADD UNIQUE KEY `hr_phone` (`hr_phone`);

--
-- Indexes for table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employer`
--
ALTER TABLE `employer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `experience`
--
ALTER TABLE `experience`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
