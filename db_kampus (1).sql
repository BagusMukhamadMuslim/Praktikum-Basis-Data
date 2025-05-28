-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2025 at 06:02 AM
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
-- Database: `db_kampus`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `nip` char(10) NOT NULL,
  `nama_dosen` varchar(50) DEFAULT NULL,
  `bidang` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nip`, `nama_dosen`, `bidang`) VALUES
('D001202301', 'Dr. Siti Lestari', 'Basis Data'),
('D001202302', 'Prof. Hendra Yuli', 'Jaringan Komputer'),
('D001202303', 'Ir. Rina Pramesti', 'Algoritma & Pemrograman'),
('D001202304', 'Dr. Anisa Maulida', 'Sistem Informasi'),
('D001202305', 'Bambang Widodo, M.Kom', 'Pemrograman Web'),
('D001202306', 'Dr. Yusuf Rahman', 'Kalkulus'),
('D001202307', 'Prof. Nina Kartika', 'Kecerdasan Buatan'),
('D001202308', 'Agus Haryanto, M.T.', 'Sistem Operasi'),
('D001202309', 'Ratna Dewi, S.Kom', 'Etika Profesi'),
('D001202310', 'Dian Eka Putra', 'Interaksi Manusia dan Komputer');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` char(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jurusan` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `jurusan`) VALUES
('1234567890', 'Andi', 'Informatika'),
('2301000001', 'Ahmad Fauzi', 'Teknik Informatika'),
('2301000002', 'Budi Santoso', 'Sistem Informasi'),
('2301000003', 'Clara Wijaya', 'Teknik Elektro'),
('2301000004', 'Dewi Kartika', 'Teknik Informatika'),
('2301000005', 'Eko Prasetyo', 'Sistem Informasi'),
('2301000006', 'Fadli Rahman', 'Teknik Komputer'),
('2301000007', 'Gina Maretha', 'Teknik Elektro'),
('2301000008', 'Hendra Saputra', 'Teknik Informatika'),
('2301000009', 'Indah Permata', 'Sistem Informasi'),
('2301000010', 'Joko Susilo', 'Teknik Komputer');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kode_mk` char(6) NOT NULL,
  `nama_mk` varchar(50) DEFAULT NULL,
  `sks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`kode_mk`, `nama_mk`, `sks`) VALUES
('MK001', 'Struktur Data', 3),
('MK002', 'Basis Data', 3),
('MK003', 'Jaringan Komputer', 2),
('MK004', 'Pemrograman Web', 3),
('MK005', 'Kalkulus', 4),
('MK006', 'Sistem Operasi', 3),
('MK007', 'Kecerdasan Buatan', 3),
('MK008', 'Algoritma dan Pemrograman', 3),
('MK009', 'Interaksi Manusia dan Komputer', 2),
('MK010', 'Etika Profesi', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tagihan`
--

CREATE TABLE `tagihan` (
  `id_tagihan` int(11) NOT NULL,
  `nim` char(10) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `jumlah` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tagihan`
--

INSERT INTO `tagihan` (`id_tagihan`, `nim`, `semester`, `jumlah`, `status`) VALUES
(1, '2301000001', 1, 1500000.00, 'Lunas'),
(2, '2301000002', 2, 1600000.00, 'Lunas'),
(3, '2301000003', 1, 1550000.00, 'Belum Lunas'),
(4, '2301000004', 3, 1700000.00, 'Lunas'),
(5, '2301000005', 2, 1650000.00, 'Belum Lunas');

-- --------------------------------------------------------

--
-- Table structure for table `temp_table`
--

CREATE TABLE `temp_table` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kode_mk`);

--
-- Indexes for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`id_tagihan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tagihan`
--
ALTER TABLE `tagihan`
  MODIFY `id_tagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
