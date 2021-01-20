-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2020 at 05:17 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_proyek`
--

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL DEFAULT '85ee216203c0f18db0fc0c19fee67564',
  `level` enum('Admin','User') NOT NULL,
  `unit` int(100) NOT NULL,
  `status` enum('A','T') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `Username`, `email`, `Password`, `level`, `unit`, `status`) VALUES
(1, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin', 0, 'A'),
(2, 'gusti', 'user123@gmail.com', '2c309021e3d4c0f9129d66e733825b48', 'User', 2, 'A'),
(5, 'TIK', 'tik@gmail.com', 'a54eba296e7f21fabd54923d9dcbd101', 'User', 19, 'A'),
(11, 'asep', 'cot@gamil.com', '97223fab7b0d4c64c07e6e004c602302', 'User', 7, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `tb_anggaran`
--

CREATE TABLE `tb_anggaran` (
  `id_pengajuan` int(100) NOT NULL,
  `tanggal` date NOT NULL,
  `id_rencana` int(100) NOT NULL,
  `keterangan` varchar(500) NOT NULL,
  `besaran` int(100) NOT NULL,
  `status` enum('Diajukan','Disetujui') NOT NULL,
  `alasan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_anggaran`
--

INSERT INTO `tb_anggaran` (`id_pengajuan`, `tanggal`, `id_rencana`, `keterangan`, `besaran`, `status`, `alasan`) VALUES
(19, '2020-01-21', 70, 'untuk di ruangan COT masih ada yang kurang meja nya', 1500000, 'Disetujui', 'lanjut kan ke proses penyelesaian'),
(20, '2020-03-25', 71, 'Rumah sedang tahap pembangunan', 50000000, 'Disetujui', 'Oke, lanjut ke proses penyelesaian'),
(22, '2019-06-27', 72, 'masih butuh renovasi', 17000000, 'Disetujui', 'silahkan lanjut ke proses renovasi'),
(23, '2020-01-23', 73, 'kami butuh', 600000, 'Disetujui', 'oke lanjut');

-- --------------------------------------------------------

--
-- Table structure for table `tb_penyelesaian`
--

CREATE TABLE `tb_penyelesaian` (
  `id_penyelesaian` int(100) NOT NULL,
  `tanggal` date NOT NULL,
  `id_pengajuan` int(100) NOT NULL,
  `realisasi` int(100) NOT NULL,
  `selisih` int(100) NOT NULL,
  `bukti` varchar(100) NOT NULL,
  `keterangan` varchar(500) NOT NULL,
  `status` enum('Pending','Selesai') NOT NULL,
  `alasan` varchar(255) NOT NULL,
  `kd_unit` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penyelesaian`
--

INSERT INTO `tb_penyelesaian` (`id_penyelesaian`, `tanggal`, `id_pengajuan`, `realisasi`, `selisih`, `bukti`, `keterangan`, `status`, `alasan`, `kd_unit`) VALUES
(21, '2020-01-23', 23, 400000, 200000, 'bukti3.jfif', 'ookokkokokojl', 'Selesai', 'kokoko\r\n', 2),
(22, '2019-06-26', 22, 15000000, 2000000, 'bukti3.jfif', 'ioiopuopuoyoiy', 'Selesai', 'bgiufkjblkj', 7),
(23, '2020-01-23', 19, 1300000, 200000, 'bukti2.png', 'sip', 'Selesai', 'mantap', 7),
(24, '2020-01-22', 20, 30000000, 20000000, 'bukti2.png', 'siap', 'Selesai', 'selesai', 7);

-- --------------------------------------------------------

--
-- Table structure for table `tb_rencana`
--

CREATE TABLE `tb_rencana` (
  `id_rencana` int(100) NOT NULL,
  `nama_aktivitas` varchar(100) NOT NULL,
  `kode_rekening` varchar(255) NOT NULL,
  `kd_unit` int(100) NOT NULL,
  `tahun_anggaran` varchar(100) NOT NULL,
  `uraian_aktivitas` varchar(500) NOT NULL,
  `jenis_anggaran` enum('Rutin','Investasi') NOT NULL,
  `pelaksanaan` date NOT NULL,
  `penyelesaian` date NOT NULL,
  `total` int(100) NOT NULL,
  `status` enum('Setuju','Tidak Setuju') DEFAULT NULL,
  `alasan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rencana`
--

INSERT INTO `tb_rencana` (`id_rencana`, `nama_aktivitas`, `kode_rekening`, `kd_unit`, `tahun_anggaran`, `uraian_aktivitas`, `jenis_anggaran`, `pelaksanaan`, `penyelesaian`, `total`, `status`, `alasan`) VALUES
(70, 'pembelian meja', '427117', 7, '2020', 'di ruangan COT masih ada meja yang kurang', 'Rutin', '2020-01-21', '2020-01-28', 1500000, 'Setuju', 'untuk itu maka kami dari admin menyetujui'),
(71, 'Rencana pembelian Rumah', '427117', 7, '2020', 'Membutuhkan dana', 'Rutin', '2020-01-01', '2020-06-30', 50000000, 'Setuju', 'Oke rencana anda diterima'),
(72, 'pembaharuan rungan COT', '427117', 7, '2019', 'ruangan butuh di renovasi', 'Rutin', '2019-06-12', '2019-06-28', 17000000, 'Setuju', 'lanjut kan ke proses selanjut nya'),
(73, 'pembelian meja', '427112', 2, '2020', 'kami butuh meja', 'Rutin', '2020-01-23', '2020-01-29', 600000, 'Setuju', 'lanjutkan');

-- --------------------------------------------------------

--
-- Table structure for table `tb_unit`
--

CREATE TABLE `tb_unit` (
  `kd_unit` int(100) NOT NULL,
  `nama_unit` varchar(100) NOT NULL,
  `kode_rekening` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_unit`
--

INSERT INTO `tb_unit` (`kd_unit`, `nama_unit`, `kode_rekening`) VALUES
(0, 'Admin', 123456),
(1, 'Direktur', 427111),
(2, 'Wadir 1', 427112),
(3, 'Wadir 2', 427113),
(4, 'Wadir 3', 427114),
(5, 'LSP', 427115),
(6, 'SPMI', 427116),
(7, 'COT', 427117),
(8, 'Prodi D3 TI', 427118),
(9, 'Prodi D4 TI', 427119),
(10, 'Prodi D3 MI', 427120),
(11, 'Prodi D3 AK', 427121),
(12, 'Prodi D4 AK', 427122),
(13, 'Prodi D3 MB', 427123),
(14, 'Prodi D4 MB', 427124),
(15, 'Prodi D3 LB', 427125),
(16, 'Prodi D4 LB', 427126),
(17, 'BAAK', 427127),
(18, 'BAUK', 427128),
(19, 'TIK', 427129),
(20, 'HUMAS', 427130),
(21, 'BAHASA', 427131);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_anggaran`
--
ALTER TABLE `tb_anggaran`
  ADD PRIMARY KEY (`id_pengajuan`),
  ADD KEY `id_rencana` (`id_rencana`);

--
-- Indexes for table `tb_penyelesaian`
--
ALTER TABLE `tb_penyelesaian`
  ADD PRIMARY KEY (`id_penyelesaian`),
  ADD KEY `id_pengajuan` (`id_pengajuan`);

--
-- Indexes for table `tb_rencana`
--
ALTER TABLE `tb_rencana`
  ADD PRIMARY KEY (`id_rencana`);

--
-- Indexes for table `tb_unit`
--
ALTER TABLE `tb_unit`
  ADD PRIMARY KEY (`kd_unit`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_anggaran`
--
ALTER TABLE `tb_anggaran`
  MODIFY `id_pengajuan` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tb_penyelesaian`
--
ALTER TABLE `tb_penyelesaian`
  MODIFY `id_penyelesaian` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tb_rencana`
--
ALTER TABLE `tb_rencana`
  MODIFY `id_rencana` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
