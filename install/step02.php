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
					<h4>Langkah 2 - Pilih Modul</h4>
				</div>
				<div class="page_content clearfix">
				<form action="step03.php" method="GET" class="form-horizontal">
				<input type="hidden" name="lv" value="<?php echo $_GET['lv'];?>" />
				<div class="control-group">
					<label class="control-label" for="paket">Paket</label>
					<div class="controls">
						<select id="paket">
							<option value="1">Standard</option>
							<option value="2">Komunitas</option>
							<option value="3">Lengkap</option>
							<option value="4">Custom</option>
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="modul[]">Modul</label>
					<div class="controls">
						<label class="checkbox">
							<input type="checkbox" id="modul_profil" name="modul[]" value="profil" readonly="true" checked="true" /> Profil
						</label>
						<label class="checkbox">
							<input type="checkbox" id="modul_member" name="modul[]" value="member" /> Member
						</label>
						<label class="checkbox">
							<input type="checkbox" id="modul_sim" name="modul[]" value="sim" /> Sistem Informasi dan Manajemen
						</label>
					</div>
				</div>
				<div class="form-actions">
					<button type="submit" class="btn_install btn btn-primary">Lanjut</button>
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
	$(document).ready(function() {
		$('.btn_back').click(function() {
			document.location.href = 'step01.php';
		});
		$('#paket').change(function() {
			switch($(this).val()) {
				case '1' :
					$('#modul_member').removeAttr('checked');
					$('#modul_sim').removeAttr('checked');
				break;
				case '2' :
					$('#modul_member').attr('checked', 'true');
					$('#modul_sim').removeAttr('checked');
				break;
				case '3' :
					$('#modul_member').attr('checked', 'true');
					$('#modul_sim').attr('checked', 'true');
				break;
			}
		});
		$('#modul_member, #modul_sim').change(function() {
			var member = $('#modul_member').attr('checked');
			var sim    = $('#modul_sim').attr('checked');
   			if(!member && !sim) {
   				$('#paket').val('1');
   			} else if(member && !sim) {
   				$('#paket').val('2');
   			} else if(member && sim) {
   				$('#paket').val('3');
   			} else {
   				$('#paket').val('4');
   			}
		});
	});
</script>
</body>
</html>