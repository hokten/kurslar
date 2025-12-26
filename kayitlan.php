<?php
session_start();
require "veritabani.php";
if(!isset($_SESSION["kullanicirolu"]) || $_SESSION["kullanicirolu"] != 3)
{
	header("Location: yasak.php");
	
}
?>
<html>
	<head>
	</head>
	<body>
	<?php 
	
	?>
	<table border="1">
		<tr>
			<td>Kursun Adı</td>
			<td>Olay</td>
		</tr>
	<?php
	require "veritabani.php";
	
	$kulid = $_SESSION["kullaniciid"];
	$ksql = "SELECT * FROM kurs_ogrenci WHERE kursiyer_id = :abc";
	$ksqlDeyimi = $baglanti->prepare($ksql);
	$ksqlDeyimi->bindParam(":abc", $kulid);
	$ksqlDeyimi->execute();
	$alkurslar = $ksqlDeyimi->fetchAll();
	echo "<pre>";
	var_dump($alkurslar);
	echo "</pre>";
	
	$kkurslar = array_map(function($kayit) { return $kayit["kurs_id"]; }, $alkurslar);
	
	echo "<pre>";
	var_dump($kkurslar);
	echo "</pre>";
	
	
	$ksql = "SELECT * FROM kurslar" ;
	$ksqlDeyimi = $baglanti->prepare($ksql);
	$ksqlDeyimi->execute();
	$kurslar = $ksqlDeyimi->fetchAll();
	foreach($kurslar as $kurs) {
		$id = $kurs["id"];
		echo "<tr>";
		echo "<td>" . $kurs["kursun_adi"] ."</td>";
		echo "<td><a href='kursakayit.php?kursid=$id'>Kayıt</a>";
	}

	?>
	</table>
	</body>
</html>
