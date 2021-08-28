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
					<h4>Langkah 1 - Penggunaan CMS Balitbang</h4>
				</div>
				<div class="page_content clearfix">
					<h5>Silahkan pilih peruntukan instalasi CMS Balitbang</h5>
					<div class="clearfix">
					<?php
					$level = array(
						'sd'   => 'Sekolah Dasar / Madrasah Ibtidaiyah',
						'smp'  => 'Sekolah Menengah Pertama / Madrasah Tsanawiyah',
						'sma'  => 'Sekolah Menengah Atas / Madrasah Aliyah',
						'smk'  => 'Sekolah Menengah kejuruan',
						'lain' => 'Lainnya (PersonalBlog, PT, Instansi, dsb)'
					);
					while($each = each($level)) {
						echo '<a href="step02.php?lv='.$each['key'].'" class="btn span4" style="margin: 3px auto;">'.$each['value'].'</a><br />';
					}
					?>
					</div>
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