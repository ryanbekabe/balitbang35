<?php
error_reporting(0);
date_default_timezone_set("Asia/Jakarta");
date("Y-m-d H:i:s", mktime(date("H")+1, date("i"), date("s"), date("m"), date("d"), date("Y")));

$webhost = "_WEBHOST_";
$webmail = "_WEBMAIL_";
$nmsekolah = "_NMSEKOLAH_";
$almtsekolah = "_ALAMAT_";
$jum_spp= "_SPP_";
$jum_dsp= "_DSP_";

/* LOCAL DATABASE CONNECTION config */
// database constant
// change below setting according to your database configuration
$dbhost = "_DB_HOST_";
$dbuser = "_DB_USER_";
$dbpasswd = "_DB_PASSWORD_";
$dbname = "_DB_NAME_";

$dbprefix  = "t_";
$alan = "_TEMPLATE_";
$email1 = "alanrm82";
$email2 = "";
$noacak = "82";
$kolom="3";
$versi="3.5";
$cmsmember = "_MEMBER_"; //diisi ya atau tidak
$cmssim = "_SIM_"; //diisi ya atau tidak
$cmstingkat = "_TINGKAT_"; // diisi sd,smp,sma,smk,lain
$folderadmin="admin";
$multibahasa="tidak"; // diisi "ya" apabila akan dijadikan multi bahasa dan 
//diisi "tidak" apabila tidak akan mengaktifkan multibahasa
$nmhost = "http://$webhost/";
// konfigurasi ID aplikasi Facebook
$appid  = ''; // contoh  169993669715242
$secret = ''; // contoh 81158039568d1a5f8d7990b70f7186c9

?>