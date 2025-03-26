-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2025 at 04:49 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sub_query2`
--

-- --------------------------------------------------------

--
-- Table structure for table `ambil_mk`
--

CREATE TABLE `ambil_mk` (
  `nim` char(5) NOT NULL,
  `kode_mk` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ambil_mk`
--

INSERT INTO `ambil_mk` (`nim`, `kode_mk`) VALUES
('M001', 'MK101'),
('M002', 'MK102'),
('M003', 'MK104'),
('M005', 'MK105'),
('M006', 'MK101'),
('M007', 'MK102'),
('M008', 'MK104');

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `kode_dos` char(4) NOT NULL,
  `nama_dos` varchar(20) NOT NULL,
  `Jabatan` varchar(20) NOT NULL,
  `alamat_dos` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`kode_dos`, `nama_dos`, `Jabatan`, `alamat_dos`) VALUES
('D001', 'Budi', 'Ketua Jurusan Teknol', 'Jakarta'),
('D002', 'Andi', 'Dosen Senior', 'Bandung'),
('D003', 'Siti', 'Dosen', 'Jakarta'),
('D004', 'Joko', 'Dosen', 'Surabaya'),
('D005', 'Rina', 'Dosen', 'Yogyakarta');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `kd_jur` char(2) NOT NULL,
  `nama_jur` varchar(20) NOT NULL,
  `kd_dos` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`kd_jur`, `nama_jur`, `kd_dos`) VALUES
('TI', 'Teknologi Informasi', 'D001'),
('TE', 'Teknik Elektro', 'D021'),
('TM', 'Tekenik Mesin', 'D031');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` char(4) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `alamat` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `jk`, `alamat`) VALUES
('M001', 'Ahmad', 'L', 'Jakarta'),
('M002', 'Rina', 'P', 'Bandung'),
('M003', 'Siti', 'P', 'Jakarta'),
('M004', 'Budi', 'L', 'Surabaya'),
('M005', 'Andika', 'L', 'Yogyakarta'),
('M006', 'Dewi', 'P', 'Jakarta'),
('M007', 'Fajar', 'L', 'Bandung'),
('M008', 'Lina', 'P', 'Surabaya'),
('M010', 'Agas', 'P', 'Bandung'),
('M011', 'Dila', 'P', 'Surabaya');

-- --------------------------------------------------------

--
-- Table structure for table `mk`
--

CREATE TABLE `mk` (
  `kd_mk` char(5) NOT NULL,
  `nama_mk` varchar(20) NOT NULL,
  `sks` int(1) NOT NULL,
  `semester` int(1) NOT NULL,
  `kode_dos` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mk`
--

INSERT INTO `mk` (`kd_mk`, `nama_mk`, `sks`, `semester`, `kode_dos`) VALUES
('MK101', 'Struktur Data', 3, 1, 'D0'),
('MK102', 'Basis Data', 4, 2, 'D0'),
('MK103', 'Pemrograman Web', 3, 3, 'D0'),
('MK104', 'Jaringan Komputer', 3, 4, 'D0'),
('MK105', 'Keamanan Informasi', 2, 5, 'D0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`kode_dos`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `mk`
--
ALTER TABLE `mk`
  ADD PRIMARY KEY (`kd_mk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
