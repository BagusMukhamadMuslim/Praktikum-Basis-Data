-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2025 at 06:13 AM
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
-- Database: `universitas`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_transaksi` (IN `p_id_pelanggan` CHAR(5), IN `p_id_buku` CHAR(5), IN `p_jumlah` INT)   BEGIN
    DECLARE v_harga_buku DECIMAL(10,2);
    DECLARE v_stok_saat_ini INT;
    DECLARE v_total_harga DECIMAL(10,2);
    DECLARE v_id_transaksi_baru CHAR(5);
    DECLARE v_nomor_urut INT;

    SELECT stok, harga INTO v_stok_saat_ini, v_harga_buku
    FROM buku WHERE id_buku = p_id_buku;
    
    IF v_stok_saat_ini < p_jumlah THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Transaksi Gagal: Stok buku tidak mencukupi.';
    ELSE
        SET v_total_harga = v_harga_buku * p_jumlah;
        UPDATE buku SET stok = stok - p_jumlah WHERE id_buku = p_id_buku;
        SELECT IFNULL(MAX(CAST(SUBSTRING(id_transaksi, 3) AS UNSIGNED)), 0) + 1 INTO v_nomor_urut FROM transaksi;
        SET v_id_transaksi_baru = CONCAT('TR', LPAD(v_nomor_urut, 3, '0'));
        INSERT INTO transaksi(id_transaksi, id_pelanggan, id_buku, jumlah, total_harga, tanggal_transaksi)
        VALUES (v_id_transaksi_baru, p_id_pelanggan, p_id_buku, p_jumlah, v_total_harga, CURDATE());
        UPDATE pelanggan 
        SET total_belanja = total_belanja + v_total_harga 
        WHERE id_pelanggan = p_id_pelanggan;
        SELECT 'Transaksi berhasil ditambahkan!' AS status_transaksi;
        
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `view_mhs_simple` ()   BEGIN
    SELECT npm, nama, no_hp FROM mahasiswa;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `hitung_diskon` (`p_total_belanja` DECIMAL(10,2)) RETURNS DECIMAL(10,2) DETERMINISTIC BEGIN
    DECLARE v_diskon DECIMAL(10,2);
    
    IF p_total_belanja >= 5000000 THEN
        SET v_diskon = p_total_belanja * 0.10;
    ELSEIF p_total_belanja >= 1000000 THEN
        SET v_diskon = p_total_belanja * 0.05; 
    ELSE
        SET v_diskon = 0;
    END IF;
    
    RETURN v_diskon;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `tambah` (`angka1` INT, `angka2` INT) RETURNS INT(11)  BEGIN 
	return angka1 + angka2;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_brg` char(3) NOT NULL,
  `nama_brg` varchar(50) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_brg`, `nama_brg`, `stok`) VALUES
('a11', 'keyboard', 15),
('a12', 'dvd r-w', 10),
('a13', 'modem', 6);

--
-- Triggers `barang`
--
DELIMITER $$
CREATE TRIGGER `deleteChild` AFTER DELETE ON `barang` FOR EACH ROW DELETE FROM pembelian
WHERE id_brg = OLD.id_brg
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` char(5) NOT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `penulis` varchar(100) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `penulis`, `harga`, `stok`) VALUES
('BK001', 'dasar-dasar pemrograman', 'andi susanto', 125000.00, 25),
('BK002', 'laskar pelangi', 'andrea hirata', 85000.00, 40),
('BK003', 'bumi manusia', 'pramoedya ananta toer', 115000.00, 30),
('BK004', 'kalkulus lanjut', 'dr. budi hartono', 210000.00, 15),
('BK005', 'seni untuk tidak bodo amat', 'mark manson', 98000.00, 30),
('BK006', 'atomic habits', 'james clear', 105000.00, 30),
('BK007', 'sejarah dunia yang disembunyikan', 'jonathan black', 150000.00, 20),
('BK008', 'pengantar kecerdasan buatan', 'siti rahayu', 180000.00, 18),
('BK009', 'cantik itu luka', 'eka kurniawan', 95000.00, 35),
('BK010', 'filosofi teras', 'henry manampiring', 88000.00, 45);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `npm` char(5) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `id_kelurahan` int(11) DEFAULT NULL,
  `jenis_kelamin` char(1) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `kode_prodi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`npm`, `nama`, `alamat`, `id_kelurahan`, `jenis_kelamin`, `no_hp`, `kode_prodi`) VALUES
('12345', 'imam adi nata', 'kajen', 1, 'l', '081215529989', 1),
('12346', 'budi sugandhi', 'bekasi', 109, 'l', '085643433321', 2),
('12347', 'toha sitohang', 'medan', 103, 'l', '08989787876', 2),
('12348', 'megawati', 'condong catur', 107, 'p', '0839303058', 1),
('12349', 'prabowo subiyanto', 'jkt', 107, 'l', '08132809811', NULL),
('12780', 'anis baswedan', 'jakarta', 234, 'l', '09898877663', NULL),
('12786', 'ganjar pranowo', 'jawa tengah', 123, 'l', '087656356622', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` char(5) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `total_belanja` decimal(10,2) DEFAULT 0.00,
  `status_member` enum('reguler','gold','platinum') DEFAULT 'reguler'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `total_belanja`, `status_member`) VALUES
('PL001', 'ahmad dhani', 550000.00, 'gold'),
('PL002', 'siti nurhaliza', 120000.00, 'reguler'),
('PL003', 'bunga citra lestari', 1250000.00, 'platinum'),
('PL004', 'charlie setia band', 2045000.00, 'gold'),
('PL005', 'rossa roslaina', 980000.00, 'gold'),
('PL006', 'iwan fals', 2500000.00, 'platinum'),
('PL007', 'dewi perssik', 345000.00, 'reguler'),
('PL008', 'judika sihotang', 760000.00, 'gold'),
('PL009', 'raisa andriana', 450000.00, 'reguler'),
('PL010', 'afgan syahreza', 4950000.00, 'gold');

--
-- Triggers `pelanggan`
--
DELIMITER $$
CREATE TRIGGER `trg_update_status_member` BEFORE UPDATE ON `pelanggan` FOR EACH ROW BEGIN
    IF NEW.total_belanja >= 5000000 THEN
        SET NEW.status_member = 'platinum';
    ELSEIF NEW.total_belanja >= 1000000 THEN
        SET NEW.status_member = 'gold';
    ELSE
        SET NEW.status_member = 'reguler';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pem` int(11) NOT NULL,
  `id_brg` char(3) DEFAULT NULL,
  `jml_beli` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Triggers `pembelian`
--
DELIMITER $$
CREATE TRIGGER `updateStok` AFTER INSERT ON `pembelian` FOR EACH ROW UPDATE barang
SET stok = stok + NEW.jml_beli
WHERE id_brg = NEW.id_brg
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateStokEdit` AFTER UPDATE ON `pembelian` FOR EACH ROW UPDATE barang
SET stok = stok + (NEW.jml_beli - OLD.jml_beli)
WHERE id_brg = NEW.id_brg
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` char(5) NOT NULL,
  `id_pelanggan` char(5) DEFAULT NULL,
  `id_buku` char(5) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total_harga` decimal(10,2) DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pelanggan`, `id_buku`, `jumlah`, `total_harga`, `tanggal_transaksi`) VALUES
('TR001', 'PL001', 'BK002', 1, 85000.00, '2025-01-15'),
('TR002', 'PL003', 'BK001', 2, 250000.00, '2025-01-20'),
('TR003', 'PL002', 'BK005', 1, 98000.00, '2025-02-05'),
('TR004', 'PL005', 'BK006', 1, 105000.00, '2025-02-11'),
('TR005', 'PL004', 'BK010', 2, 176000.00, '2025-03-01'),
('TR006', 'PL006', 'BK003', 1, 115000.00, '2025-03-12'),
('TR007', 'PL008', 'BK007', 1, 150000.00, '2025-04-07'),
('TR008', 'PL007', 'BK009', 1, 95000.00, '2025-04-22'),
('TR009', 'PL010', 'BK004', 1, 210000.00, '2025-05-18'),
('TR010', 'PL009', 'BK008', 2, 360000.00, '2025-06-01'),
('TR011', 'PL004', 'BK005', 20, 1960000.00, '2025-06-10'),
('TR012', 'PL010', 'BK006', 30, 3150000.00, '2025-06-10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`npm`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pem`),
  ADD KEY `id_brg` (`id_brg`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_buku` (`id_buku`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_brg`) REFERENCES `barang` (`id_brg`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
