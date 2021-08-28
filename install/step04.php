<?php
if(file_exists('../lib/config.php')) {
	header('Location: ../index.php');
	die();
}
if(!isset($_POST['lv'])) {
	header('Location: step01.php');
	die();
}
if(!in_array($_POST['lv'], array('sd', 'smp', 'sma', 'smk', 'lainnya'))) {
	header('Location: step01.php');
	die();
}
if(!isset($_POST['modul'])) {
	header('Location: step01.php');
	die();
}
if(empty($_POST['modul'])) {
	header('Location: step01.php');
	die();
}
$error = '';
if(empty($_POST['admin_password'])) {
	$error = 'Password untuk Admin Kosong!';
}
if(empty($_POST['admin_username'])) {
	$error = 'Username untuk Admin Kosong!';
}
if(empty($_POST['web_address'])) {
	$error = 'Alamat Kosong!';
}
if(empty($_POST['web_name'])) {
	$error = 'Nama Website Kosong!';
}
if(empty($_POST['web_email'])) {
	$error = 'Email Website Kosong!';
}
if(empty($_POST['web_domain'])) {
	$error = 'Domain Website Kosong!';
}
if(empty($_POST['db_user'])) {
	$error = 'User Database Kosong!';
}
if(empty($_POST['db_name'])) {
	$error = 'Nama Database Kosong!';
}
if(empty($_POST['db_hostname'])) {
	$error = 'Hostname Database Kosong!';
}
if(empty($error)) {
	$template = array(
		'sd'   => '../temp/art_sd_atas/',
		'smp'  => '../temp/art_smp_atas/',
		'sma'  => '../temp/art_sma_bawah/',
		'smk'  => '../temp/art_smk_atas/',
		'lain' => '../temp/art_lain_atas/',
	);
	$dump = array(
		'sd'   => 'dump/dump_sd.sql',
		'smp'  => 'dump/dump_smp.sql',
		'sma'  => 'dump/dump_sma.sql',
		'smk'  => 'dump/dump_smk.sql',
		'lain' => 'dump/dump_lain.sql',
	);
	$config = array(
		'_WEBHOST_'     => $_POST['web_domain'],
		'_WEBMAIL_'     => $_POST['web_email'],
		'_NMSEKOLAH_'   => $_POST['web_name'],
		'_ALAMAT_'      => $_POST['web_address'],
		'_SPP_'         => $_POST['web_spp'],
		'_DSP_'         => $_POST['web_dsp'],
		'_DB_HOST_'     => $_POST['db_hostname'],
		'_DB_USER_'     => $_POST['db_user'],
		'_DB_PASSWORD_' => $_POST['db_password'],
		'_DB_NAME_'     => $_POST['db_name'],
		'_TEMPLATE_'    => $template[$_POST['lv']],
		'_MEMBER_'      => in_array('member', $_POST['modul']) ? 'ya' : 'tidak',
		'_SIM_'         => in_array('sim', $_POST['modul']) ? 'ya' : 'tidak',
		'_TINGKAT_'     => $_POST['lv']
	);
	$error_reporting = error_reporting();
	$fp = fopen('../lib/config.php', 'w');
	if(!$fp) {
		$error = 'Tidak dapat membuat file lib/config.php!';
	} else {
		$fs      = fopen('config.sample.php', 'r');
		$content = fread($fs, filesize('config.sample.php') + 1);
		fclose($fs);
		$content = str_replace(array_keys($config), array_values($config), $content);
		fwrite($fp, $content);
		fclose($fp);
		error_reporting(0);
		$db = mysql_connect($_POST['db_hostname'], $_POST['db_user'], $_POST['db_password']);
		if(!$db) {
			$error = 'Tidak dapat melakukan koneksi ke database, silahkan periksa konfigurasi database anda!';
		} else {
			if(!mysql_select_db($_POST['db_name'])) {
				$error = 'Tidak dapat menemukan nama database dalam konfigurasi, silahkan periksa apakah database anda telah di buat?';
			} else {
				$line = file($dump[$_POST['lv']]);
				if(!$line) {
					$error = 'File '.$dump[$_POST['lv']].' hilang!';
				} else {
					$sql = '';
					while($each = each($line)) {
						$sql .= $each['value'];
						if(substr(trim($each['value']), -1) == ';') {
							@mysql_query($sql);
							$sql = '';
						}
					}
				}
			}
		}
		error_reporting($error_reporting);
		include "../functions/fungsi_pass.php";
		mysql_query("TRUNCATE `user`");
		mysql_query("TRUNCATE `user_level`");
		mysql_query("INSERT INTO `user` VALUES ('1', '".str_replace(' ', '', strtolower($_POST['admin_username']))."', '".hex(addslashes($_POST['admin_password']),82)."', 'alanrm82@yahoo.com', '127.0.0.1', '01:10:00 14/06/2012', '0', '1')");
		mysql_query("INSERT INTO `user_level`(`idlevel`,`userid`,`menu`,`utama`) values ('1', '1', 'membersiswa', '5'),('2', '1', 'importsiswa', '5'),('3', '1', 'dtortu', '5'),('4', '1', 'dtsiswa', '5'),('5', '1', 'dtmengajar', '4'),('6', '1', 'importguru', '4'),('7', '1', 'dtguru', '4'),('8', '1', 'pelajaran', '3'),('9', '1', 'kelas', '3'),('10', '1', 'program', '3'),('11', '1', 'semester', '3'),('12', '1', 'kategori', '3'),('13', '1', 'gambar', '3'),('14', '1', 'template', '3'),('15', '1', 'posisi', '3'),('16', '1', 'profil', '3'),('17', '1', 'admin', '3'),('18', '1', 'dtlaporan', '2'),('19', '1', 'dtspp', '2'),('20', '1', 'dtabsensi', '2'),('21', '1', 'dtbpbk', '2'),('22', '1', 'dtmateri', '2'),('23', '1', 'dtnilai', '2'),('24', '1', 'banner', '1'),('25', '1', 'jajak', '1'),('26', '1', 'pesandepan', '6'),('27', '1', 'prestasi', '1'),('28', '1', 'silabus', '1'),('29', '1', 'kumpulsoal', '1'),('30', '1', 'materiajar', '1'),('31', '1', 'infosekolah', '1'),('32', '1', 'infoalumni', '1'),('33', '1', 'link', '1'),('34', '1', 'galeri', '1'),('35', '1', 'forum', '1'),('36', '1', 'bukutamu', '1'),('37', '1', 'berita', '1'),('38', '1', 'agenda', '1'),('39', '1', 'artikel', '1'),('40', '1', 'naikkelas', '5'),('41', '1', 'dtalumni', '5'),('42', '1', 'member', '6'),('43', '1', 'koordinator', '6'),('44', '1', 'opini', '6');
");
	}
}
if(!empty($error) && file_exists('../lib/config.php')) {
	@unlink('../lib/config.php');
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
					<h4>Langkah 3 - Instalasi</h4>
				</div>
				<div class="page_content clearfix">
        			<?php
					if(empty($error)) {
						?>
      					<div class="alert alert-success">
							<strong>Selamat!</strong> CMS Balitbang telah berhasil diinstalasi<br />
						</div>
						<p>
							Login Admin :
							<dl class="dl-horizontal">
								<dt>Username :</dt>
								<dd><?php echo str_replace(' ', '', strtolower($_POST['admin_username']))?></dd>
								<dt>Password :</dt>
								<dd><?php echo $_POST['admin_password']?></dd>
							</dl>
							<br />
							<a href="../index.php" class="btn">Lihat Web</a>
							<a href="../admin/index.php" class="btn" target="_blank">Login Admin</a>
						</p>
						<?php
					} else {
						?>
						<div class="alert alert-error">
							<strong>TERJADI KESALAHAN!</strong><br />
							<?php echo $error;?>
						</div>
						<button type="button" id="btn_back" class="btn">Kembali</button>
						<?php
					}
					?>
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
<script>
	$(document).ready(function() {
		$('#btn_back').click(function() {
			history.back();
		});
	});
</script>
</body>
</html>