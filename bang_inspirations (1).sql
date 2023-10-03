-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2023 at 05:02 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `bang_inspirations`
--

CREATE TABLE `bang_inspirations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `thumbnail` varchar(191) NOT NULL,
  `tittle` varchar(191) NOT NULL,
  `view_count` varchar(191) NOT NULL,
  `video_url` varchar(191) NOT NULL,
  `creator` varchar(191) NOT NULL,
  `profile_url` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bang_inspirations`
--

INSERT INTO `bang_inspirations` (`id`, `thumbnail`, `tittle`, `view_count`, `video_url`, `creator`, `profile_url`, `created_at`, `updated_at`) VALUES
(6, 'img4.jpg', 'Achieving Greatness: The Inspiring Journey of Success', '100 views', 'video1.mp4', 'Creator 1', 'profile1.jpg', NULL, NULL),
(7, 'img2.jpg', 'Empower Others: Making a Difference in the World', '200 views', 'video2.mkv', 'Creator 2', 'profile2.jpg', NULL, NULL),
(8, 'img3.jpg', 'Dream Big: Turning Dreams into Reality', '300 views', 'video1.mp4', 'Creator 3', 'profile3.jpg', NULL, NULL),
(9, 'img4.jpg', 'Overcoming Adversity: Finding Strength in Challenges', '400 views', 'video2.mkv', 'Creator 4', 'profile4.jpg', NULL, NULL),
(10, 'img5.jpg', 'Inspiring Change: Impacting Lives for the Better', '500 views', 'video1.mp4', 'Creator 5', 'profile5.jpg', NULL, NULL),
(11, 'img6.jpg', 'Passion for Excellence: The Key to Success', '600 views', 'video2.mkv', 'Creator 6', 'profile6.jpg', NULL, NULL),
(12, 'img2.jpg', 'Courageous Pursuit: Chasing Your Dreams Fearlessly', '700 views', 'video1.mp4', 'Creator 7', 'profile7.jpg', NULL, NULL),
(13, 'img4.jpg', 'Believe in Yourself: The Power of Self-Confidence', '800 views', 'video2.mkv', 'Creator 8', 'profile8.jpg', NULL, NULL),
(14, 'img1.jpg', 'Unleashing Potential: Embracing Limitless Possibilities', '900 views', 'video1.mp4', 'Creator 9', 'profile9.jpg', NULL, NULL),
(15, 'img3.jpg', 'Aspire to Inspire: Making the World a Better Place', '1000 views', 'video2.mkv', 'Creator 10', 'profile10.jpg', NULL, NULL),
(16, 'bangInspiration/65197f709c0ab.mp4', 'Hello world', '0', '65197f709c0ab.mp4', 'BangInspiration', 'bangInspiration/bang_logo.jpg', '2023-10-01 11:17:21', '2023-10-01 11:17:21'),
(17, 'bangInspiration/thumb/6519849430a88.jpg', 'Hello world', '0', '6519849430a80.mp4', 'BangInspiration', 'bangInspiration/bang_logo.jpg', '2023-10-01 11:39:16', '2023-10-01 11:39:16'),
(18, '6519856e36b0f.jpg', 'Hello world', '0', '6519856e36b06.mp4', 'BangInspiration', 'bangInspiration/bang_logo.jpg', '2023-10-01 11:42:54', '2023-10-01 11:42:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bang_inspirations`
--
ALTER TABLE `bang_inspirations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bang_inspirations`
--
ALTER TABLE `bang_inspirations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
