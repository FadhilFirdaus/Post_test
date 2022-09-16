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
-- Database: `db_laundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `outlet`
--

CREATE TABLE `outlet` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED DEFAULT NULL,
  `nama_outlet` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `nomor_telephone` varchar(255) DEFAULT NULL,
  `created_at` time DEFAULT current_timestamp(),
  `updated_at` time DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `outlet`
--

INSERT INTO `outlet` (`id`, `id_user`, `nama_outlet`, `alamat`, `nomor_telephone`, `created_at`, `updated_at`) VALUES
(1, 1, 'Kirana Laundry CB. Bekasi', 'Jl. Pahlawan V No.13', '+62 965 8365 7352', '13:45:47', '13:45:47'),
(2, 2, 'Kirana Laundry CB. Bandung', 'Jl. Merdeka V No.10', '+62 965 8365 7352', '13:45:47', '13:45:47'),
(3, 3, 'Kirana Laundry CB. jakarta', 'Jl. Mawar Merah VII No.98', '+62 965 8365 7352', '13:45:47', '13:45:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket`
--

CREATE TABLE `paket` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_paket` varchar(255) DEFAULT NULL,
  `harga` varchar(255) DEFAULT NULL,
  `satuan` varchar(255) DEFAULT NULL,
  `created_at` time DEFAULT current_timestamp(),
  `updated_at` time DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `paket`
--

INSERT INTO `paket` (`id`, `nama_paket`, `harga`, `satuan`, `created_at`, `updated_at`) VALUES
(1, 'Cucian Kamilia Mita', 'Rp 21.000', 'Rp 7.000/kg', '13:51:27', '13:51:27'),
(2, 'Cucian Doni Anwar', 'Rp 14.000', 'Rp 7.000/kg', '13:51:27', '13:51:27'),
(3, 'Cucian Ahmad Rizali', 'Rp 35.000', 'Rp 7.000/kg', '13:51:27', '13:51:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED DEFAULT NULL,
  `no_telepon` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `created_at` time DEFAULT current_timestamp(),
  `updated_at` time DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `id_user`, `no_telepon`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 1, '+62 987 8627 9376', 'Jl. Diponegoro II No.9', '13:40:45', '13:40:45'),
(2, 2, '+62 987 8627 9376', 'Jl. Diponegoro III No.87', '13:40:45', '13:40:45'),
(3, 3, '+62 987 8627 9376', 'Jl. Diponegoro VII No.67', '13:40:45', '13:40:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_pesanan` int(10) UNSIGNED DEFAULT NULL,
  `tanggal_bayar` date DEFAULT NULL,
  `jumlah_paket` varchar(255) DEFAULT NULL,
  `subtotal` varchar(255) DEFAULT NULL,
  `bukti_transfer` varchar(255) DEFAULT NULL,
  `created_at` time DEFAULT current_timestamp(),
  `updated_at` time DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `id_pesanan`, `tanggal_bayar`, `jumlah_paket`, `subtotal`, `bukti_transfer`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-09-16', '1', 'Rp 21.000', '20220916.png', '14:01:49', '14:01:49'),
(2, 2, '2022-09-13', '1', 'Rp 14.000', '20220913.png', '14:01:49', '14:01:49'),
(3, 3, '2022-09-14', '1', 'Rp 35.000', '20220914.png', '14:01:49', '14:01:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED DEFAULT NULL,
  `id_outlet` int(10) UNSIGNED DEFAULT NULL,
  `id_paket` int(10) UNSIGNED DEFAULT NULL,
  `status_pesanan` enum('diproses','selesai') DEFAULT NULL,
  `status_pembayaran` enum('lunas','belum lunas') DEFAULT NULL,
  `tanggal_pemesanan` date DEFAULT NULL,
  `created_at` time DEFAULT current_timestamp(),
  `updated_at` time DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id`, `id_user`, `id_outlet`, `id_paket`, `status_pesanan`, `status_pembayaran`, `tanggal_pemesanan`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'diproses', 'lunas', '2022-09-16', '13:54:58', '13:54:58'),
(2, 2, 2, 2, 'selesai', 'belum lunas', '2022-09-13', '13:54:58', '13:54:58'),
(3, 3, 3, 3, 'selesai', 'lunas', '2022-09-14', '13:54:58', '13:54:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `level` enum('admin','petugas','pelanggan') DEFAULT NULL,
  `email_verified_at` time DEFAULT current_timestamp(),
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` time DEFAULT current_timestamp(),
  `updated_at` time DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `level`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Kamilia Mita', 'Kamil.Mita@gmail.com', 'Mita K', 'pelanggan', '13:28:57', 'MItaaa9379', 'MItaaa9379', '13:28:57', '13:28:57'),
(2, 'Doni Anwar', 'AnwaRd0289@gmail.com', 'D. Anwar', 'pelanggan', '13:28:57', 'dOniyeu028', 'dOniyeu028', '13:28:57', '13:28:57'),
(3, 'Ahmad Rizali', 'ARizali939@gmail.com', 'A Rizali', 'pelanggan', '13:28:57', 'Rizali9272329', 'Rizali9272329', '13:28:57', '13:28:57');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users` (`id_user`);

--
-- Indeks untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_pelanggan` (`id_user`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pesanan` (`id_pesanan`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_paket` (`id_paket`),
  ADD KEY `fk_outlet` (`id_outlet`),
  ADD KEY `fk_user` (`id_user`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `outlet`
--
ALTER TABLE `outlet`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `paket`
--
ALTER TABLE `paket`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `outlet`
--
ALTER TABLE `outlet`
  ADD CONSTRAINT `fk_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD CONSTRAINT `fk_users_pelanggan` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `fk_pesanan` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id`);

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `fk_outlet` FOREIGN KEY (`id_outlet`) REFERENCES `outlet` (`id`),
  ADD CONSTRAINT `fk_paket` FOREIGN KEY (`id_paket`) REFERENCES `paket` (`id`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
