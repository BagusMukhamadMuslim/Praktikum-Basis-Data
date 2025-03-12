-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2025 at 07:16 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `khs`
--

-- --------------------------------------------------------

--
-- Table structure for table `nilai_mahasiswa`
--

CREATE TABLE `nilai_mahasiswa` (
  `id_mahasiswa` int(11) NOT NULL,
  `nama_mahasiswa` varchar(50) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `mata_kuliah` varchar(50) NOT NULL,
  `nilai` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nilai_mahasiswa`
--

INSERT INTO `nilai_mahasiswa` (`id_mahasiswa`, `nama_mahasiswa`, `jurusan`, `mata_kuliah`, `nilai`) VALUES
(1, 'Bagus', 'T.Informasi', 'Kalkulus', 95.00),
(2, 'Helen', 'T.Informasi', 'Kalkulus', 97.00),
(3, 'Aleph', 'Teknik Sihir', 'Konfigurasi Sihir', 95.00),
(4, 'Daleth', 'Teknik sihir', 'Konfigurasi Sihir', 91.00),
(5, 'Yod', 'Spiritualisme', 'Demonologi', 87.00),
(6, 'Sephira', 'Spiritualisme', 'Demonologi', 89.00),
(7, 'Helen', 'T.Informasi', 'Algoritma Sihir', 90.00),
(8, 'Aleph', 'Teknik Sihir', 'Sihir Unsur', 91.00),
(9, 'Daleth', 'Teknik Sihir', 'Sihir Unsur', 93.00),
(10, 'Yod', 'Spiritualisme', 'Sihir Roh', 90.00),
(11, 'Sephira', 'Spiritualisme', 'Sihir Roh', 97.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nilai_mahasiswa`
--
ALTER TABLE `nilai_mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nilai_mahasiswa`
--
ALTER TABLE `nilai_mahasiswa`
  MODIFY `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
