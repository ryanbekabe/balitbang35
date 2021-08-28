<?php
if(file_exists('../lib/config.php')) {
	header('Location: ../index.php');
}
if(!isset($_GET['lv'])) {
	header('Location: step01.php');
	die();
}
if(!in_array($_GET['lv'], array('sd', 'smp', 'sma', 'smk', 'lain'))) {
	header('Location: step01.php');
	die();
}
if(!isset($_GET['modul'])) {
	header('Location: step01.php');
	die();
}
if(empty($_GET['modul'])) {
	header('Location: step01.php');
	die();
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
					<h4>Langkah 3 - Konfigurasi CMS Balitbang</h4>
				</div>
				<div class="page_content clearfix">
				<form action="step04.php" method="POST" class="form-horizontal">
				<input type="hidden" name="lv" value="<?php echo $_GET['lv']?>" />
				<?php
				while($each = each($_GET['modul'])) {
					?><input type="hidden" name="modul[]" value="<?php echo $each['value'];?>" /><?php
				}
				reset($_GET['modul']);
				?>
				<fieldset>
					<legend>Database</legend>
					<div class="control-group">
						<label class="control-label" for="db_hostname">Database Hostname</label>
						<div class="controls">
							<input type="text" id="db_hostname" name="db_hostname" placeholder="hostname" value="localhost" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="db_name">Database Name</label>
						<div class="controls">
							<input type="text" id="db_name" name="db_name" placeholder="Database Name"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="db_user">Database User</label>
						<div class="controls">
							<input type="text" id="db_user" name="db_user" placeholder="Database User"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="db_password">Database Password</label>
						<div class="controls">
							<input type="text" id="db_password" name="db_password" placeholder="Database Password"/>
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend>Profil</legend>
					<div class="control-group">
						<label class="control-label" for="web_domain">Domain Website</label>
						<div class="controls">
							<input type="text" id="web_domain" name="web_domain" placeholder="Domain" class="span4"/>
							<span class="help-block">Contoh: <em>namasekolah.sch.id</em></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="web_email">Email Website</label>
						<div class="controls">
							<input type="text" id="web_email" name="web_email" placeholder="Email"/>
							<span class="help-block">Contoh: <em>admin@namasekolah.sch.id</em></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="web_name">Nama Website</label>
						<div class="controls">
							<input type="text" id="web_name" name="web_name" placeholder="Nama" class="span5"/>
							<span class="help-block">Contoh: <em>Sekolah Menengah Atas Negeri 1 Percontohan</em></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="web_address">Alamat</label>
						<div class="controls">
							<input type="text" id="web_address" name="web_address" placeholder="Alamat" class="span5"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="web_spp">Jumlah SPP</label>
						<div class="controls">
							<input type="text" id="web_spp" name="web_spp" placeholder="SPP" style="text-align: right;" value="0"/>
							<span class="help-inline">Jika tidak tahu, isikan 0</span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="web_dsp">Jumlah DSP</label>
						<div class="controls">
							<input type="text" id="web_dsp" name="web_dsp" placeholder="DSP" style="text-align: right;" value="0"/>
							<span class="help-inline">Jika tidak tahu, isikan 0</span>
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend>Admin</legend>
					<div class="control-group">
						<label class="control-label" for="admin_username">Username</label>
						<div class="controls">
							<input type="text" id="admin_username" name="admin_username" placeholder="Username" value="admin"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="admin_password">Password</label>
						<div class="controls">
							<input type="text" id="admin_password" name="admin_password" placeholder="Password"/>
						</div>
					</div>
				</fieldset>
				<div class="form-actions">
					<button type="submit" class="btn_install btn btn-primary">Install</button>
					<button type="button" class="btn_back btn">Kembali</button>
				</div>
				</form>
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
	function to_number(text) {
		var chars = "1234567890";
		var data  = "";
		for(var i = 0; i < text.length; i++) {
			if(chars.indexOf(text[i]) >= 0) {
				if(data == "") {
					if(text[i] != "0") {
						data += text[i];
					}
				} else {
					data += text[i];
				}
			}
		}
		var result = parseInt(data);
		return isNaN(result) ? 0 : result;
	}
	function number_format(text) {
		data  = to_number(text).toString();
		data  = data == "NaN" ? "" : data;
		text  = "";
		var n = 0;
		for(i = data.length - 1; i >= 0; i--) {
			text = data[i] + text;
   			n++;
   			if(n >= 3) {
   				n    = 0;
   				text = "." + text;
   			}
		}
		if(text[0] == ".") {
			text = text.substr(1);
		}
		return text;
	}
	$(document).ready(function() {
		$('#web_spp, #web_dsp').keyup(function() {
			$(this).val(number_format($(this).val()).toString());
		});
		$('.btn_back').click(function() {
			document.location.href = 'step01.php';
		});
	});
</script>
</body>
</html>