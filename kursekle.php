<html>
	<head>
	</head>
	<body>
	<?php 
	if(empty($_POST)) {
	?>
	<h2>Kurs Ekle</h2>
	
	<form action="kursekle.php" method="post">
		Kursun Adı : <input type="text" name="fkursadi" /><br />
		<input type="submit" value="Kurs Ekle" />
	</form>	
	<?php
	}
	else {
		require "veritabani.php";
		
		$f_kurs_adi = $_POST["fkursadi"]; 
		
		$ksql = "INSERT INTO kurslar (kursun_adi) VALUES(:ksa)";
		
		$ksqlDeyimi = $baglanti->prepare($ksql);
		$ksqlDeyimi->bindParam(':ksa', $f_kurs_adi );
		
		$durum = $ksqlDeyimi->execute();
		if($durum) {
			echo "Kurs Eklendi.";
		}
	}
	
?>
	</body>
</html>
