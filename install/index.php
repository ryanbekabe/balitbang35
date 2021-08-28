<?php
if(file_exists('../lib/config.php')) {
	header('Location: ../index.php');
}
?><!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>CMS Balitbang</title>
	<link href="css/bootstrap.css" rel="stylesheet" media="screen" />
	<link href="css/install.css" rel="stylesheet" media="screen" />
</head>
<body>
<div class="container ">
	<div class="row">
		<div class="span8 offset2">
			<div class="page">
				<div class="page_title">
					<h4>Selamat Datang di Instalasi CMS Balitbang</h4>
				</div>
				<div class="page_content clearfix">
					<h5>Sebelum memulai, Anda harus mendapatkan beberapa informasi ini terlebih dahulu.</h5>
					<p>Pengguna boleh mencantumkan nama sebagai pengembang/redesign pada CMS yang telah direvisi versi tertentu, dan dapat disebarluaskan dengan ciri khas sendiri tanpa merubah kata-kata dari copyright.<br /><strong>Contoh :</strong></p>
					<div class="well" style="text-align: center;">
						<small>
						Copyright &copy; 2012 SMAN 1 Percontohan<br />
						Website engine's code is copyright © 2012 Tim Balitbang Kemdikbud v3.5.2
						</small>
					</div>
					<br />
					<h5>Peraturan Penggunaan CMS Balitbang</h5>
					<ol>
						<li>CMS Balitbang dapat digunakan <strong>gratis</strong> oleh siapapun.</li>
						<li>Diperkenankan merubah script dengan kewajiban <strong>melaporkan dan mengirimkan file yang di update</strong> kepada Tim Pengembang CMS Balitbang.</li>
						<li>Dilarang <strong>memperjualbelikan</strong> CMS Balitbang atau <strong>memberikan tarif/harga</strong> untuk membuat web menggunakan CMS Balitbang, <strong>kecuali memberikan tarif/harga meliputi biaya sewa hosting, pembelian/perpanjangan domain, dan jasa instalasi CMS Balitbang</strong>.</li>
					</ol>
					<br />
					<br />
					<a href="step01.php" class="btn btn-primary pull-right">Saya Setuju</a>
				</div>
				<div class="page_footer">
					<blockquote>
						Copyright &copy; 2012 Tim Balitbang Kemdikbud<br />
						<small>Website engine's code is copyright © 2012 Tim Balitbang Kemdikbud v3.5.2</small>
					</blockquote>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>