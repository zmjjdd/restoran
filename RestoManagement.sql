-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 08 Jan 2024 pada 16.21
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `RestoManagement`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `Branch`
--

CREATE TABLE `Branch` (
  `restaurant_id` int(11) NOT NULL,
  `restaurant_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `Branch`
--

INSERT INTO `Branch` (`restaurant_id`, `restaurant_name`) VALUES
(1, 'Surabaya'),
(2, 'Bandung'),
(3, 'Jakarta'),
(4, 'Padang'),
(5, 'Samarinda'),
(6, 'Kuta');

-- --------------------------------------------------------

--
-- Struktur dari tabel `Employee`
--

CREATE TABLE `Employee` (
  `employee_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `Employee`
--

INSERT INTO `Employee` (`employee_id`, `name`, `restaurant_id`) VALUES
(21, 'Nathan Turner', 4),
(22, 'Sophia Harris', 5),
(23, 'Ethan Phillips', 3),
(24, 'Ava Taylor', 1),
(25, 'Jackson Parker', 5),
(26, 'Olivia Adams', 2),
(27, 'Lucas Turner', 1),
(28, 'Ava Clark', 5),
(29, 'Carter Baker', 3),
(30, 'Emma Wood', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `Menu`
--

CREATE TABLE `Menu` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `Menu`
--

INSERT INTO `Menu` (`menu_id`, `menu_name`, `price`) VALUES
(21, 'Grilled Salmon', '18.99'),
(22, 'Vegetable Stir Fry', '11.99'),
(23, 'Chicken Parmesan', '13.99'),
(24, 'Mango Tango Smoothie', '4.99'),
(25, 'BBQ Ribs', '16.99'),
(26, 'Caprese Salad', '9.49'),
(27, 'Teriyaki Tofu Bowl', '12.49'),
(28, 'Fruit Salad', '7.99'),
(29, 'Beef and Broccoli', '14.99'),
(30, 'Pineapple Upside-Down Cake', '6.49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `Reservation`
--

CREATE TABLE `Reservation` (
  `reservation_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `orderer_name` varchar(255) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `table_type` varchar(50) DEFAULT NULL,
  `total_person` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `Reservation`
--

INSERT INTO `Reservation` (`reservation_id`, `employee_id`, `orderer_name`, `restaurant_id`, `table_type`, `total_person`) VALUES
(21, 21, 'Ella Turner', 4, 'Romantic', 2),
(22, 22, 'Mason Phillips', 5, 'General', 4),
(23, 23, 'Aria Harris', 3, 'Family', 6),
(24, 24, 'Logan Taylor', 1, 'Family', 8),
(25, 25, 'Zoe Parker', 5, 'General', 3),
(26, 26, 'Liam Adams', 2, 'Family', 7),
(27, 27, 'Lily Turner', 1, 'Family', 5),
(28, 28, 'Mia Clark', 5, 'Family', 4),
(29, 29, 'Noah Baker', 3, 'Romantic', 2),
(30, 30, 'Chloe Wood', 2, 'Romantic', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `Branch`
--
ALTER TABLE `Branch`
  ADD PRIMARY KEY (`restaurant_id`);

--
-- Indeks untuk tabel `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indeks untuk tabel `Menu`
--
ALTER TABLE `Menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indeks untuk tabel `Reservation`
--
ALTER TABLE `Reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `Reservation`
--
ALTER TABLE `Reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `Branch` (`restaurant_id`);

--
-- Ketidakleluasaan untuk tabel `Reservation`
--
ALTER TABLE `Reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `Employee` (`employee_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `Branch` (`restaurant_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
