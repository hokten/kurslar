<?php 
session_start();
if(isset($_SESSION["kullanici"]) && !empty($_SESSION["kullanici"])) {
	header("Location: panel.php");
}
?>
<html>
<head>
    <meta charset="UTF-8" />
  </head>
	<body>
	<?php 
	if(empty($_POST)) {
	?>
	<h2>Giriş</h2>
	<form action="giris.php" method="post">
		Kullanıcı Adı : <input type="text" name="fkulad" placeholder="Kullanıcı adınızı giriniz."><br />
		Şifre : <input type="text"  name="fsifre" placeholder="Şifrenizi giriniz">
		 <button type="submit">Giriş Yap</button>
	</form>	
	<?php
	}
	else {
		require "veritabani.php";
		$f_gelen_kulad = $_POST["fkulad"];
		$f_gelen_sifre = $_POST["fsifre"];
		
		$ksql = "SELECT * FROM kullanicilar WHERE kullanici_adi = :pst AND kullanici_sifresi = :sfr" ;
		
		$ksqlDeyimi = $baglanti->prepare($ksql);
		$ksqlDeyimi->bindParam(':pst', $f_gelen_kulad);
		$ksqlDeyimi->bindParam(':sfr', $f_gelen_sifre);
		$ksqlDeyimi->execute();
		$kayit = $ksqlDeyimi->fetch(); 
		if(count($kayit) > 0) {
			$_SESSION["kullanici"] = $f_gelen_kulad;
			$_SESSION["kullanicirolu"] = $kayit["kullanici_rolu"]; 
			echo "Giriş yaptınız";
		}
		else {
			$_SESSION["kullanici"] = "";
			echo "E-postanız veya şifreniz hatalı";
		}
	}
?>
	</body>
</html>
