-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 03. Jul 2018 um 17:29
-- Server-Version: 10.1.33-MariaDB
-- PHP-Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr11_anna_oemer_php_car_rental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cars`
--

CREATE TABLE `cars` (
  `id` smallint(5) NOT NULL,
  `transmission` enum('manual','automatic') NOT NULL,
  `class` varchar(55) NOT NULL,
  `fuel` enum('gas','diesel','electric') NOT NULL,
  `available` enum('Y','N') NOT NULL,
  `seats` smallint(1) NOT NULL,
  `brand` varchar(55) NOT NULL,
  `fk_reservation` smallint(5) DEFAULT NULL,
  `fk_location` smallint(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `cars`
--

INSERT INTO `cars` (`id`, `transmission`, `class`, `fuel`, `available`, `seats`, `brand`, `fk_reservation`, `fk_location`) VALUES
(1, 'manual', 'Veracruz', 'gas', 'Y', 4, 'Hyundai', 1, 1),
(2, 'manual', 'Crossfire', 'gas', 'Y', 6, 'Chrysler', 2, 6),
(3, 'automatic', 'M3', 'diesel', 'Y', 5, 'BMW', 3, 6),
(4, 'manual', 'Quest', 'diesel', 'N', 8, 'Nissan', 4, 5),
(5, 'manual', '62', 'electric', 'Y', 2, 'Maybach', 5, 3),
(6, 'automatic', '911', 'diesel', 'Y', 5, 'Porsche', 6, 7),
(7, 'manual', 'Altima', 'gas', 'N', 5, 'Nissan', 7, 4),
(8, 'automatic', 'B2600', 'diesel', 'N', 8, 'Mazda', 8, 4),
(9, 'manual', 'V70', 'electric', 'Y', 5, 'Volvo', 9, 4),
(10, 'manual', 'Volt', 'electric', 'Y', 2, 'Chevrolet', 10, 2),
(11, 'manual', 'Mark LT', 'gas', 'Y', 8, 'Lincoln', 11, 1),
(12, 'automatic', 'Pajero', 'diesel', 'N', 2, 'Mitsubishi', 12, 9),
(13, 'manual', 'TL', 'gas', 'Y', 5, 'Acura', 13, 12),
(14, 'manual', 'Landaulet', 'electric', 'N', 2, 'Maybach', 14, 12),
(15, 'manual', 'Malibu', 'electric', '', 8, 'Chevrolet', 15, 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customers`
--

CREATE TABLE `customers` (
  `id` smallint(5) NOT NULL,
  `firstName` varchar(55) NOT NULL,
  `lastName` varchar(55) NOT NULL,
  `phoneNumber` int(20) NOT NULL,
  `licenceNumber` varchar(55) NOT NULL,
  `creditCard` int(30) NOT NULL,
  `under25` enum('Y','N') NOT NULL,
  `fk_reservation` smallint(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customers`
--

INSERT INTO `customers` (`id`, `firstName`, `lastName`, `phoneNumber`, `licenceNumber`, `creditCard`, `under25`, `fk_reservation`) VALUES
(1, 'Briana', 'Ledner', 411174, '3940834', 2147483646, 'Y', 1),
(2, 'Allison', 'Wilderman', 134534534, '9048903485', 2147483645, 'Y', 2),
(3, 'Kole', 'Jacobson', 34534534, '23429343432', 2147483644, 'Y', 3),
(4, 'Leonard', 'Ullrich', 1123534534, '7298806', 2147483643, 'N', 4),
(5, 'Brady', 'Littel', 2147483647, '32493248', 2147483642, 'N', 5),
(6, 'Melany', 'Labadie', 1345395049, '48304983', 2147483641, 'Y', 6),
(7, 'Camille', 'Heidenreich', 36345345, '48230498', 2147483640, 'Y', 7),
(8, 'Forest', 'Mohr', 66043940, '283423943', 2147483639, 'N', 8),
(9, 'Ryleigh', 'Bode', 2147483647, '912432423', 2147483638, 'Y', 9),
(10, 'Pearline', 'Christiansen', 134534534, '329408320', 2147483637, 'Y', 10),
(11, 'Daisha', 'Cormier', 51371445, '1901223482', 2147483636, 'Y', 11),
(12, 'Virginie', 'Nicolas', 13453453, '74855859', 2147483635, 'N', 12),
(13, 'Seth', 'Harber', 923480543, '1752342334', 2147483634, 'N', 13),
(14, 'Gladys', 'Reilly', 506390480, '7968224234', 2147483647, 'N', 14),
(15, 'Macey', 'Kunde', 40839483, '19379391', 2147483632, 'Y', 15);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location`
--

CREATE TABLE `location` (
  `id` smallint(5) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `longitude` float(10,7) NOT NULL,
  `latitude` float(10,7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `location`
--

INSERT INTO `location` (`id`, `name`, `address`, `longitude`, `latitude`) VALUES
(1, 'Wien Kagran', 'Wagramer Str. 177, 1220 Wien', 16.4496746, 48.2590981),
(2, 'Wien City', 'Am Stadtpark 1, 1030 Wien', 16.3833771, 48.2062263),
(3, 'Wien Vösendorf', 'Ortsstraße 18A, 2331 Vösendorf', 16.3221416, 48.1244850),
(4, 'Wien Flughafen', 'Mietwagenzentrum Objekt 134 Wien, 1300 Schwechat', 16.5643063, 48.1208344),
(5, 'Wien Hauptbahnhof', 'Am Hauptbahnhof 1/1, 1100 Wien', 16.3760815, 48.1851234),
(6, 'Wien Innenstadt', 'Schubertring 9, 1010 Wien', 16.3758202, 48.2017136),
(7, 'Wien Süd', 'Liesinger-Flur-Gasse 12, 1230 Wien', 16.3035336, 48.1319199),
(8, 'Wien MQ', 'Museumsplatz 1, 1070 Wien', 16.3581944, 48.2049217),
(9, 'Wien Josefstadt', 'Pfeilgasse 20, 1080 Wien', 16.3443928, 48.2090149),
(10, 'Wien Hietzing', 'Hietzinger Hauptstraße 12, 1130 Wien', 16.3024406, 48.1867027),
(11, 'Wien Simmering', 'Rinnböckstraße 60, 1110 Wien', 16.4122429, 48.1788063),
(12, 'Wien Ottakring', 'Huttengasse 41, 1160 Wien', 16.3087921, 48.2067528);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `office`
--

CREATE TABLE `office` (
  `id` smallint(5) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `street` varchar(55) NOT NULL,
  `number` smallint(5) NOT NULL,
  `citycode` smallint(5) NOT NULL,
  `city` varchar(55) NOT NULL,
  `phone_number` int(20) NOT NULL,
  `fk_customer` smallint(5) DEFAULT NULL,
  `fk_reservation` smallint(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `office`
--

INSERT INTO `office` (`id`, `name`, `street`, `number`, `citycode`, `city`, `phone_number`, `fk_customer`, `fk_reservation`) VALUES
(1, 'Innere Stadt', 'Liliana Fort', 608, 32767, 'Rainaside', 43830945, 1, 1),
(2, 'Flughafen', 'Uriah Square', 8393, 23243, 'West Berniece', 1483286346, 2, 2),
(3, 'Josefstadt', 'Dicki Valley', 32767, 32767, 'North Heidi', 12343453, 3, 3),
(4, 'Hauptbahnhof', 'Lind Stream', 32767, 32767, 'East Lorena', 345454, 4, 4),
(5, 'Westbahnhof', 'Dibbert Roads', 27, 32767, 'North Amparo', 6612343, 5, 5),
(6, 'Mitte', 'Jasen Grove', 3802, 32767, 'O\'Connerland', 2147483647, 6, 6),
(7, 'Simmering', 'Buckridge Haven', 567, 32767, 'Stiedemannview', 34534534, 7, 7),
(8, 'Hietzing', 'Hintz Rapids', 2053, 32767, 'South Kaylie', 134543545, 8, 8),
(9, 'Vösendorf', 'Durward Centers', 32767, 32767, 'Darwinland', 64345435, 9, 9),
(10, 'Linz', 'Kirlin Brook', 451, 32767, 'East Jamison', 3534543, 10, 10),
(11, 'Salzburg', 'Gregoria Ridges', 32767, 12758, 'New Vedashire', 25934534, 11, 11),
(12, 'Innsbruck', 'Zieme Stravenue', 690, 32767, 'Lake Janae', 2147483647, 12, 12),
(13, 'Favoriten', 'Amalia Parks', 7091, 32767, 'Letaland', 480732343, 13, 13),
(14, 'Döbling', 'Waelchi Ways', 32767, 21558, 'Port Annachester', 55234324, 14, 14),
(15, 'Spittelau', 'Rice Fields', 16220, 3906, 'East Vicky', 12423432, 15, 15);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservation`
--

CREATE TABLE `reservation` (
  `id` smallint(5) NOT NULL,
  `fk_car` smallint(5) DEFAULT NULL,
  `fk_customer` smallint(5) DEFAULT NULL,
  `fk_office` smallint(5) DEFAULT NULL,
  `pickupDate` date NOT NULL,
  `returnDate` date NOT NULL,
  `insurance` enum('min','med','max','') NOT NULL,
  `insuranceQuote` smallint(3) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `reservation`
--

INSERT INTO `reservation` (`id`, `fk_car`, `fk_customer`, `fk_office`, `pickupDate`, `returnDate`, `insurance`, `insuranceQuote`, `price`) VALUES
(1, 1, 1, 1, '1975-04-09', '2000-02-15', 'max', 75, 466),
(2, 2, 2, 2, '2007-02-21', '1985-11-30', 'med', 50, 345),
(3, 3, 3, 3, '1974-08-05', '1981-01-02', 'min', 25, 796),
(4, 4, 4, 4, '1977-06-11', '1986-05-25', 'med', 50, 134),
(5, 5, 5, 5, '1993-01-01', '1988-10-22', 'min', 25, 345),
(6, 6, 6, 6, '1970-04-05', '2006-07-26', 'med', 50, 573),
(7, 7, 7, 7, '1970-06-09', '1999-03-04', 'med', 50, 366),
(8, 8, 8, 8, '1991-01-17', '2016-10-23', 'max', 75, 854),
(9, 9, 9, 9, '2006-08-24', '1995-03-16', 'med', 50, 961),
(10, 10, 10, 10, '1991-09-05', '1975-07-05', 'max', 75, 454),
(11, 11, 11, 11, '1999-05-19', '1991-02-24', 'max', 75, 690),
(12, 12, 12, 12, '2011-02-08', '1976-07-24', 'min', 25, 221),
(13, 13, 13, 13, '1981-12-17', '1973-02-25', 'max', 75, 808),
(14, 14, 14, 14, '2000-10-21', '1996-06-22', 'min', 25, 568),
(15, 15, 15, 15, '1981-08-26', '2006-08-15', 'max', 75, 101);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `userEmail` varchar(60) NOT NULL,
  `userPass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`userId`, `userName`, `userEmail`, `userPass`) VALUES
(0, 'anna mario', 'anna@mario.at', '18652f11d1964a53ba251f59e1fa65a9e4e261b05b18fcf83dc9dab5537db589');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reservation` (`fk_reservation`),
  ADD KEY `fk_location` (`fk_location`);

--
-- Indizes für die Tabelle `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reservation` (`fk_reservation`);

--
-- Indizes für die Tabelle `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer` (`fk_customer`),
  ADD KEY `fk_reservation` (`fk_reservation`);

--
-- Indizes für die Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer` (`fk_customer`),
  ADD KEY `fk_office` (`fk_office`),
  ADD KEY `fk_car` (`fk_car`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `cars`
--
ALTER TABLE `cars`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT für Tabelle `customers`
--
ALTER TABLE `customers`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT für Tabelle `location`
--
ALTER TABLE `location`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `office`
--
ALTER TABLE `office`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT für Tabelle `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`fk_reservation`) REFERENCES `reservation` (`id`),
  ADD CONSTRAINT `cars_ibfk_2` FOREIGN KEY (`fk_location`) REFERENCES `location` (`id`);

--
-- Constraints der Tabelle `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`fk_reservation`) REFERENCES `reservation` (`id`);

--
-- Constraints der Tabelle `office`
--
ALTER TABLE `office`
  ADD CONSTRAINT `office_ibfk_2` FOREIGN KEY (`fk_customer`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `office_ibfk_3` FOREIGN KEY (`fk_reservation`) REFERENCES `reservation` (`id`);

--
-- Constraints der Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_customer`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_office`) REFERENCES `office` (`id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`fk_car`) REFERENCES `cars` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
