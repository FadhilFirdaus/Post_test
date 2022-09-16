-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Sep 2022 pada 09.02
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rental_mobil`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(4) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `telp` varchar(12) DEFAULT NULL,
  `username` varchar(15) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `email`, `alamat`, `telp`, `username`, `password`) VALUES
(1, 'Heri Setiawan', 'HeriS0837@gmail.com', 'Jl. IDK YA No.18', '089796956565', 'Hery S', 'SetiaHeri7939'),
(2, 'Heri Setiawan', 'HeriS0837@gmail.com', 'Jl. IDK YA No.18', '089796956565', 'Hery S', 'SetiaHeri7939'),
(3, 'Heri Setiawan', 'HeriS0837@gmail.com', 'Jl. IDK YA No.18', '089796956565', 'Hery S', 'SetiaHeri7939');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_supir` int(11) DEFAULT NULL,
  `jasa_supir` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `id_transaksi`, `id_supir`, `jasa_supir`) VALUES
(1, 1, 1, 1500000),
(2, 2, 2, 750000),
(3, 3, 3, 1000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` int(4) NOT NULL,
  `nama` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `nama`) VALUES
(1, 'Minibus'),
(2, 'Sedan'),
(3, 'SUV');

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `id_konfirmasi` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `bukti` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `konfirmasi`
--

INSERT INTO `konfirmasi` (`id_konfirmasi`, `id_transaksi`, `bukti`) VALUES
(1, 1, '22/08/12.png'),
(2, 2, '0379330.png'),
(3, 3, '0282902.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mobil`
--

CREATE TABLE `mobil` (
  `id_mobil` int(11) NOT NULL,
  `id_jenis` int(4) NOT NULL,
  `no_mobil` varchar(10) DEFAULT NULL,
  `merk` varchar(20) DEFAULT NULL,
  `nama_mobil` varchar(30) DEFAULT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  `harga` int(7) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mobil`
--

INSERT INTO `mobil` (`id_mobil`, `id_jenis`, `no_mobil`, `merk`, `nama_mobil`, `gambar`, `harga`, `status`) VALUES
(101, 1, 'B 1981 FJH', 'Suzuki', 'APV', 'APV.Png', 0, '0'),
(102, 2, 'B 7642 FDK', 'Honda', 'Civic', 'Civic.Png', 0, '0'),
(103, 3, 'B 8623 FNU', 'Suzuki', 'XL7', 'XL7.Png', 0, '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `no_ktp` varchar(16) DEFAULT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `no_telp` varchar(12) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `no_ktp`, `nama`, `email`, `no_telp`, `alamat`, `username`, `password`) VALUES
(1, '9187625347919871', 'Anwar Rizaldi', 'RojaliA0961@gmail.com', '0897 9894 62', 'Jl IDK.YA II No.98', 'Rojali Anw', 'AARojal8721'),
(2, '9187625347919871', 'Muhammad Rizal', 'MIjal9543@gmail.com', '0897 9894 62', 'Jl IDK.YA II No.98', 'M Rizal', 'MRijal8090'),
(3, '9187625347919871', 'Adi Pratama', 'APrtama1@gmail.com', '0897 9894 62', 'Jl IDK.YA II No.98', 'Tama Adi', 'Tama092673');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supir`
--

CREATE TABLE `supir` (
  `id_supir` int(11) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `telp` varchar(12) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `supir`
--

INSERT INTO `supir` (`id_supir`, `nama`, `telp`, `alamat`, `status`) VALUES
(1, 'Asep', '0897 9865 73', 'Jl Perjuangan III No 12', '1'),
(2, 'Ridwan', '0897 9865 73', 'Jl Merdeka VII No 9', '1'),
(3, 'Januar', '0897 9865 73', 'Jl Persatuan I No 63', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_mobil` int(11) NOT NULL,
  `tgl_sewa` datetime DEFAULT NULL,
  `tgl_ambil` datetime DEFAULT NULL,
  `tgl_kembali` datetime DEFAULT NULL,
  `lama` int(1) DEFAULT NULL,
  `total_harga` int(7) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL,
  `jaminan` varchar(30) DEFAULT NULL,
  `denda` int(7) DEFAULT NULL,
  `jatuh_tempo` datetime DEFAULT NULL,
  `konfirmasi` enum('0','1') DEFAULT NULL,
  `pembatalan` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pelanggan`, `id_mobil`, `tgl_sewa`, `tgl_ambil`, `tgl_kembali`, `lama`, `total_harga`, `status`, `jaminan`, `denda`, `jatuh_tempo`, `konfirmasi`, `pembatalan`) VALUES
(1, 1, 101, '2022-08-12 00:00:00', '2022-08-19 00:00:00', '2022-08-22 00:00:00', 3, 3750000, '1', 'KTP', 0, '2022-08-22 00:00:00', '1', '0'),
(2, 2, 102, '2022-08-12 00:00:00', '2022-08-19 00:00:00', '2022-08-20 00:00:00', 1, 2500000, '1', 'KTP', 0, '2022-08-20 00:00:00', '1', '0'),
(3, 3, 103, '2022-08-12 00:00:00', '2022-08-19 00:00:00', '2022-08-21 00:00:00', 2, 3000000, '1', 'KTP', 0, '2022-08-21 00:00:00', '1', '0');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `fk_supir` (`id_supir`);

--
-- Indeks untuk tabel `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indeks untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indeks untuk tabel `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`id_mobil`),
  ADD KEY `fk_jenis` (`id_jenis`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `supir`
--
ALTER TABLE `supir`
  ADD PRIMARY KEY (`id_supir`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `fk_pelanggan` (`id_pelanggan`),
  ADD KEY `fk_mobil` (`id_mobil`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id_jenis` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `supir`
--
ALTER TABLE `supir`
  MODIFY `id_supir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `fk_supir` FOREIGN KEY (`id_supir`) REFERENCES `supir` (`id_supir`),
  ADD CONSTRAINT `fk_transaksi2` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`);

--
-- Ketidakleluasaan untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD CONSTRAINT `fk_transaksi` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`);

--
-- Ketidakleluasaan untuk tabel `mobil`
--
ALTER TABLE `mobil`
  ADD CONSTRAINT `fk_jenis` FOREIGN KEY (`id_jenis`) REFERENCES `jenis` (`id_jenis`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_mobil` FOREIGN KEY (`id_mobil`) REFERENCES `mobil` (`id_mobil`),
  ADD CONSTRAINT `fk_pelanggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
