<?php session_start() ?>
<html>
	<head>
		<title>Profil Sayfası</title>
	</head>
	<?php 
	if(isset($_SESSION["kullanici"]) && !empty($_SESSION["kullanici"])) {
		echo "Merhaba {$_SESSION["kullanici"]}, ";
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
