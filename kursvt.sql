-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                8.0.36 - MySQL Community Server - GPL
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               12.8.0.6908
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
CREATE DATABASE IF NOT EXISTS `kursvt` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kursvt`;

-- tablo yapısı dökülüyor kursvt.kayitlar
CREATE TABLE IF NOT EXISTS `kayitlar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kurs_id` int DEFAULT '0',
  `egitmen_id` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK3` (`kurs_id`),
  KEY `FK4` (`egitmen_id`),
  CONSTRAINT `FK3` FOREIGN KEY (`kurs_id`) REFERENCES `kurslar` (`id`),
  CONSTRAINT `FK4` FOREIGN KEY (`egitmen_id`) REFERENCES `kullanicilar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- kursvt.kayitlar: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `kayitlar` (`id`, `kurs_id`, `egitmen_id`) VALUES
	(2, 2, 4),
	(4, 2, 5),
	(5, 1, 4);

-- tablo yapısı dökülüyor kursvt.kullanicilar
CREATE TABLE IF NOT EXISTS `kullanicilar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kullanici_adi` varchar(100) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `kullanici_sifre` varchar(50) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `rol_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_kullanicilar_roller` (`rol_id`),
  CONSTRAINT `FK_kullanicilar_roller` FOREIGN KEY (`rol_id`) REFERENCES `roller` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- kursvt.kullanicilar: ~5 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `kullanicilar` (`id`, `kullanici_adi`, `kullanici_sifre`, `rol_id`) VALUES
	(1, 'ayildirim', '12345', 2),
	(2, 'root', '5678', 1),
	(3, 'msimsek', 'xyz', 2),
	(4, 'adurdu', '789', 3),
	(5, 'tates', '987', 3);

-- tablo yapısı dökülüyor kursvt.kurslar
CREATE TABLE IF NOT EXISTS `kurslar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kursun_adi` varchar(500) COLLATE utf8mb4_turkish_ci NOT NULL DEFAULT '0',
  `egitmen_id` int NOT NULL DEFAULT (0),
  PRIMARY KEY (`id`),
  KEY `FK2` (`egitmen_id`),
  CONSTRAINT `FK2` FOREIGN KEY (`egitmen_id`) REFERENCES `kullanicilar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- kursvt.kurslar: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `kurslar` (`id`, `kursun_adi`, `egitmen_id`) VALUES
	(1, 'PHP Eğitimi', 1),
	(2, 'ASP Eğitimi', 3);

-- tablo yapısı dökülüyor kursvt.roller
CREATE TABLE IF NOT EXISTS `roller` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rol_adi` varchar(100) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- kursvt.roller: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `roller` (`id`, `rol_adi`) VALUES
	(1, 'Admin'),
	(2, 'Eğitmen'),
	(3, 'Kursiyer');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
