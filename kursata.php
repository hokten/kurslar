<?php
session_start();
require "veritabani.php";
if(!isset($_SESSION["kullanicirolu"]) || $_SESSION["kullanicirolu"] != 1)
{
	header("Location: yasak.php");
	
}
?>
<html>
	<head>
	</head>
	<body>
	<?php 
	if(empty($_POST)) {
	?>
	<h2>Kurs Ata</h2>
	
	<form action="kursata.php" method="post">
		Eğitmenler : <select name="fegitmen">
		<?php
		
		$ksql = "SELECT * FROM kullanicilar WHERE kullanici_rolu = 2";
		$ksqlDeyimi = $baglanti->prepare($ksql);
		$ksqlDeyimi->execute();
		$kayitlar = $ksqlDeyimi->fetchAll(); 
		var_dump($kayitlar);
		foreach($kayitlar as $kayit) {
			$id = $kayit["id"];
			$adi = $kayit["kullanici_adi"];
			echo "<option value='$id'>$adi</option>";
		}
		?>
		</select>
		
		
		Kurslar : <select name="fkurs">
		<?php
		
		$ksql = "SELECT * FROM kurslar";
		$ksqlDeyimi = $baglanti->prepare($ksql);
		$ksqlDeyimi->execute();
		$kayitlar = $ksqlDeyimi->fetchAll(); 
		var_dump($kayitlar);
		foreach($kayitlar as $kayit) {
			$id = $kayit["id"];
			$adi = $kayit["kursun_adi"];
			echo "<option value='$id'>$adi</option>";
		}
		?>
		</select>
		
		<input type="submit" value="Kursu Ata">
	</form>	
	<?php
	}
	else {
		$egitmen_id = $_POST["fegitmen"];
		$kurs_id = $_POST["fkurs"];
		
		$asql = "SELECT * FROM kurs_egitmen WHERE kurs_id = :abc";
		$asqlDeyimi = $baglanti->prepare($asql);
		$asqlDeyimi->bindParam(':abc', $kurs_id);
		$asqlDeyimi->execute();
		
		$kurssayisi = count($asqlDeyimi->fetchAll());
		if($kurssayisi > 0) {
			echo "Bu kurs bir eğitmen tarafında zaten verilmekte.";
		}
		else if($kurssayisi == 0) {
			$sql = "INSERT INTO kurs_egitmen (kurs_id, egitmen_id) VALUES(:kid, :egid)";
			$sqlDeyimi = $baglanti->prepare($sql);
			$sqlDeyimi->bindParam(':kid', $kurs_id);
			$sqlDeyimi->bindParam(':egid', $egitmen_id);
			$durum = $sqlDeyimi->execute();
			if($durum) {
				echo "Atama işlemi yapıldı.";
			}
			else {
				echo "Hata var.";
			}
		}
		
		
	}
	?>
	</body>
</html>
