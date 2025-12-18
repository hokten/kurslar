<?php session_start() ?>
<html>
	<head>
		<title>Profil Sayfası</title>
	</head>
	<?php 
	if(isset($_SESSION["girisyaptimi"]) && $_SESSION["girisyaptimi"] == "evet") {
		echo "Merhaba kayıtlı kullanıcı {$_SESSION["kullanici_ismi"]},";
		echo "çıkış yapmak için <a href='cikis.php'>tıkla</a>";
	}
	else {
		echo "Merhaba ziyaretçi. Bu sayfayı görme yetkiniz yok. Giriş yapamak için <a href='giris.php'>tıklayınız</a>";
		echo "<br />";
		echo "Kullanıcı rolünüz : ". $_SESSION["kullanicirolu"];
	}
	?>
	</body>
</html>
