<?php
try {
		$baglanti = new PDO("mysql:host=localhost;dbname=kursvt", "root", "123456");
		$baglanti->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		
	} catch (PDOException $e) {
		print "Error: " . $e->getMessage();
	}
	//deneme
?>	
