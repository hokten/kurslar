-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                8.0.36 - MySQL Community Server - GPL
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               12.13.0.7147
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- kursvt için veritabanı yapısı dökülüyor
DROP DATABASE IF EXISTS `kursvt`;
CREATE DATABASE IF NOT EXISTS `kursvt` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kursvt`;

-- tablo yapısı dökülüyor kursvt.kullanicilar
DROP TABLE IF EXISTS `kullanicilar`;
CREATE TABLE IF NOT EXISTS `kullanicilar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kullanici_adi` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL DEFAULT '0',
  `kullanici_sifresi` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL DEFAULT '0',
  `kullanici_rolu` int NOT NULL DEFAULT (0),
  PRIMARY KEY (`id`),
  KEY `FK__roller` (`kullanici_rolu`),
  CONSTRAINT `FK__roller` FOREIGN KEY (`kullanici_rolu`) REFERENCES `roller` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- kursvt.kullanicilar: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `kullanicilar` (`id`, `kullanici_adi`, `kullanici_sifresi`, `kullanici_rolu`) VALUES
	(1, 'admin', '123456', 1),
	(2, 'ahmethoca', '5678', 2),
	(3, 'ali', 'xyz', 3);

-- tablo yapısı dökülüyor kursvt.kurs_egitmen
DROP TABLE IF EXISTS `kurs_egitmen`;
CREATE TABLE IF NOT EXISTS `kurs_egitmen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kurs_id` int DEFAULT '0',
  `egitmen_id` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK__kurslar` (`kurs_id`),
  KEY `FK__kullanicilar` (`egitmen_id`),
  CONSTRAINT `FK__kullanicilar` FOREIGN KEY (`egitmen_id`) REFERENCES `kullanicilar` (`id`),
  CONSTRAINT `FK__kurslar` FOREIGN KEY (`kurs_id`) REFERENCES `kurslar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- kursvt.kurs_egitmen: ~1 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `kurs_egitmen` (`id`, `kurs_id`, `egitmen_id`) VALUES
	(1, 1, 2);

-- tablo yapısı dökülüyor kursvt.kurs_ogrenci
DROP TABLE IF EXISTS `kurs_ogrenci`;
CREATE TABLE IF NOT EXISTS `kurs_ogrenci` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kurs_id` int NOT NULL,
  `kursiyer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKy__kurslar` (`kurs_id`),
  KEY `FKy__kullanicilar` (`kursiyer_id`),
  CONSTRAINT `FKy__kullanicilar` FOREIGN KEY (`kursiyer_id`) REFERENCES `kullanicilar` (`id`),
  CONSTRAINT `FKy__kurslar` FOREIGN KEY (`kurs_id`) REFERENCES `kurslar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- kursvt.kurs_ogrenci: ~1 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `kurs_ogrenci` (`id`, `kurs_id`, `kursiyer_id`) VALUES
	(1, 1, 3);

-- tablo yapısı dökülüyor kursvt.kurslar
DROP TABLE IF EXISTS `kurslar`;
CREATE TABLE IF NOT EXISTS `kurslar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kursun_adi` varchar(500) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- kursvt.kurslar: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `kurslar` (`id`, `kursun_adi`) VALUES
	(1, 'PHP Eğitimi'),
	(2, 'ASP Eğitimi');

-- tablo yapısı dökülüyor kursvt.roller
DROP TABLE IF EXISTS `roller`;
CREATE TABLE IF NOT EXISTS `roller` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rol_adi` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- kursvt.roller: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `roller` (`id`, `rol_adi`) VALUES
	(1, 'Yönetici'),
	(2, 'Eğitmen'),
	(3, 'Kursiyer');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
