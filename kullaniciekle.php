<?php
require "veritabani.php";

$ksql = "SELECT * FROM roller" ;
$ksqlDeyimi = $baglanti->prepare($ksql);
$ksqlDeyimi->execute();
$roller = $ksqlDeyimi->fetchAll();
 


		
?>

<html>
	<head>
	</head>
	<body>
	<?php 
	if(empty($_POST)) {
	?>
	<h2>Kullanıcı Ekle</h2>
	<form action="kayitol.php" method="post">
		Kullanıcı İsmi : <input type="text" name="kulis" /><br />
		Şifre : <input type="password" name="ksifre" /><br />
		Kullanıcı Rolü : 
		<select name="krolu">
			<?php foreach($roller as $rol): ?>
			<option value="<?= $rol["id"] ?>"><?= $rol["rol_adi"] ?></option>
			<?php endforeach; ?>
		</select>
		<input type="submit" value="Yeni Kullanıcı Ekle" />
	</form>	
	<?php
	}
	else {
		
		/*
		
		$f_gelen_eposta = $_POST["feposta"];
		$f_gelen_sifre = $_POST["fsifre"];
		
		$ksql = "SELECT * FROM users WHERE eposta = :pst";
		$ksqlDeyimi = $baglanti->prepare($ksql);
		$ksqlDeyimi->bindParam(':pst', $f_gelen_eposta);
		$ksqlDeyimi->execute();
		$kayit_sayisi = $ksqlDeyimi->fetchAll(); 
		if(count($kayit_sayisi) > 0) {
			echo "Zaten kayıtlısınız";
		}
		else {
			$sql = "INSERT INTO users (eposta, sifre) VALUES(:pst, :sfr)";
			$sqlDeyimi = $baglanti->prepare($sql);
			$sqlDeyimi->bindParam(':pst', $f_gelen_eposta);
			$sqlDeyimi->bindParam(':sfr', $f_gelen_sifre);
			$durum = $sqlDeyimi->execute();
			if($durum) {
				echo "Kaydınız başarılı bir şekilde gerçekleşti.";
			}
		}
		*/
	}
	
?>
	</body>
</html>
