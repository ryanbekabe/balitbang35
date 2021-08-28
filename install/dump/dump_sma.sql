-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Dec 16, 2012 at 09:41 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `db_sma`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `calendarevent`
-- 

CREATE TABLE `calendarevent` (
  `id` int(11) NOT NULL default '0',
  `date_start` datetime default NULL,
  `date_end` datetime default NULL,
  `eventTitle` varchar(255) collate latin1_general_ci default NULL,
  `EventDetail` text collate latin1_general_ci,
  `color` varchar(255) collate latin1_general_ci default NULL,
  `status` int(2) default NULL,
  `picture_id` int(11) default NULL,
  `file_id` int(11) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `calendarevent`
-- 

INSERT INTO `calendarevent` VALUES (1, '2012-12-03 00:00:00', '2012-12-12 00:00:00', 'UTS', 'UTS KELAS X, XI dan XII ', '#FFFF33', 1, 1, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `calendarevent_picture`
-- 

CREATE TABLE `calendarevent_picture` (
  `id` int(11) NOT NULL auto_increment,
  `calendarevent_id` int(11) NOT NULL default '0',
  `picture_sm_name` varchar(255) collate latin1_general_ci NOT NULL default '',
  `picture_bg_name` varchar(255) collate latin1_general_ci NOT NULL default '',
  `picture_detail` text collate latin1_general_ci,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `calendarevent_picture`
-- 

INSERT INTO `calendarevent_picture` VALUES (7, 7, 'alan.gif', 'alanaa', 'saasa');

-- --------------------------------------------------------

-- 
-- Table structure for table `counter`
-- 

CREATE TABLE `counter` (
  `id` tinyint(11) NOT NULL auto_increment,
  `ip` text collate latin1_general_ci NOT NULL,
  `counter` int(11) NOT NULL default '0',
  `hits` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `counter`
-- 

INSERT INTO `counter` VALUES (1, '127.0.0.1-', 336, 9643);

-- --------------------------------------------------------

-- 
-- Table structure for table `soal_hasil`
-- 

CREATE TABLE `soal_hasil` (
  `idhasil` int(10) NOT NULL auto_increment,
  `idsoalutama` int(10) NOT NULL,
  `nis` varchar(25) NOT NULL,
  `benar` int(3) NOT NULL,
  `salah` int(3) NOT NULL,
  `nilai` int(3) NOT NULL,
  `kesempatanjawab` int(2) NOT NULL,
  `lama` int(3) NOT NULL,
  `tglpengerjaan` datetime NOT NULL,
  PRIMARY KEY  (`idhasil`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `soal_hasil`
-- 

INSERT INTO `soal_hasil` VALUES (1, 2, '070810119', 0, 0, 0, 1, 0, '2012-11-26 19:25:27');
INSERT INTO `soal_hasil` VALUES (2, 4, '070810119', 0, 2, 0, 1, 3, '2012-11-26 19:32:35');
INSERT INTO `soal_hasil` VALUES (3, 6, '070810119', 0, 5, 0, 1, 0, '2012-11-26 19:55:55');

-- --------------------------------------------------------

-- 
-- Table structure for table `soal_jawab`
-- 

CREATE TABLE `soal_jawab` (
  `idjawab` int(10) NOT NULL auto_increment,
  `idhasil` int(10) NOT NULL,
  `idsoal` int(10) NOT NULL,
  `ket` varchar(10) default NULL,
  PRIMARY KEY  (`idjawab`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `soal_jawab`
-- 

INSERT INTO `soal_jawab` VALUES (1, 2, 1, 'Salah');
INSERT INTO `soal_jawab` VALUES (2, 2, 2, 'Salah');
INSERT INTO `soal_jawab` VALUES (3, 3, 1, 'Salah');
INSERT INTO `soal_jawab` VALUES (4, 3, 2, 'Salah');
INSERT INTO `soal_jawab` VALUES (5, 3, 3, 'Salah');
INSERT INTO `soal_jawab` VALUES (6, 3, 4, 'Salah');
INSERT INTO `soal_jawab` VALUES (7, 3, 5, 'Salah');

-- --------------------------------------------------------

-- 
-- Table structure for table `soal_kelas`
-- 

CREATE TABLE `soal_kelas` (
  `id` int(10) NOT NULL auto_increment,
  `kelas` varchar(10) default NULL,
  `idsoalutama` int(10) default NULL,
  `proses` varchar(10) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `soal_kelas`
-- 

INSERT INTO `soal_kelas` VALUES (1, 'X - 4', 1, '0');
INSERT INTO `soal_kelas` VALUES (2, 'X - 4', 2, '0');
INSERT INTO `soal_kelas` VALUES (4, 'X - 4', 3, '0');
INSERT INTO `soal_kelas` VALUES (5, 'X - 4', 4, '0');
INSERT INTO `soal_kelas` VALUES (6, 'X - 4', 5, '0');
INSERT INTO `soal_kelas` VALUES (7, 'X - 4', 6, '0');

-- --------------------------------------------------------

-- 
-- Table structure for table `soal_opsi`
-- 

CREATE TABLE `soal_opsi` (
  `idsoal` int(10) NOT NULL auto_increment,
  `nip` varchar(25) NOT NULL,
  `pertanyaan` text NOT NULL,
  `opsia` text NOT NULL,
  `opsib` text NOT NULL,
  `opsic` text NOT NULL,
  `opsid` text NOT NULL,
  `jawaban` text NOT NULL,
  `pembahasan` text NOT NULL,
  `status` int(1) NOT NULL COMMENT '1. Terbuka\r\n2. Tertutup',
  `pelajaran` varchar(30) default NULL,
  `tingkat` int(1) default NULL COMMENT '1. Mudah, 2.Sedang 3.Sulit',
  PRIMARY KEY  (`idsoal`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- 
-- Dumping data for table `soal_opsi`
-- 

INSERT INTO `soal_opsi` VALUES (1, '400001001', '<p>ibukota ntt adalah....</p>', '<p>bandung</p>', '<p>jakarta</p>', '<p>denpasar</p>', '<p>mataram</p>', '<p>kupang</p>', '<p>ibukota ntt adalah kupang&nbsp;</p>', 1, 'Matematika', 1);
INSERT INTO `soal_opsi` VALUES (2, '400001001', '<p>siapa saya?</p>', '<p>guru</p>', '<p>polisi</p>', '<p>wirausaha</p>', '<p>direktur</p>', '<p>siswa</p>', '<p>anda adalah seorang pelajar anda disebut siswa</p>', 1, 'Matematika', 1);
INSERT INTO `soal_opsi` VALUES (3, '400001001', '<p>siapa ketua panitia balitbang?</p>', '<p>Ms. Erwin</p>', '<p>Mr. Agung</p>', '<p>Mr. Dodi</p>', '<p>Mr. Candra</p>', '<p>Mr. Erwin</p>', '<p>Siapa ya,.....</p>', 1, 'Matematika', 1);
INSERT INTO `soal_opsi` VALUES (4, '400001001', '<p>Dimana kegiatan Cms balitbang berlangsung?</p>', '<p>tmorrrrr</p>', '<p>tumor</p>', '<p>kangker</p>', '<p>ter</p>', '<p>t-more</p>', '<p>t-more dong</p>', 1, 'Matematika', 1);
INSERT INTO `soal_opsi` VALUES (5, '400001001', '<p>siapakah instruktur yg baru dateng?</p>', '<p>bank erwin</p>', '<p>kang dodi</p>', '<p>kang agung</p>', '<p>mas okky</p>', '<p>mr candra</p>', '<p>mr candra lah</p>', 1, 'Matematika', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `soal_test`
-- 

CREATE TABLE `soal_test` (
  `idsoaltest` int(10) NOT NULL auto_increment,
  `idsoalutama` int(10) NOT NULL,
  `idsoal` int(10) NOT NULL,
  PRIMARY KEY  (`idsoaltest`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

-- 
-- Dumping data for table `soal_test`
-- 

INSERT INTO `soal_test` VALUES (1, 3, 2);
INSERT INTO `soal_test` VALUES (2, 3, 1);
INSERT INTO `soal_test` VALUES (3, 2, 2);
INSERT INTO `soal_test` VALUES (4, 2, 1);
INSERT INTO `soal_test` VALUES (5, 4, 2);
INSERT INTO `soal_test` VALUES (6, 4, 1);
INSERT INTO `soal_test` VALUES (7, 5, 5);
INSERT INTO `soal_test` VALUES (8, 5, 4);
INSERT INTO `soal_test` VALUES (9, 5, 3);
INSERT INTO `soal_test` VALUES (10, 5, 2);
INSERT INTO `soal_test` VALUES (11, 5, 1);
INSERT INTO `soal_test` VALUES (12, 6, 5);
INSERT INTO `soal_test` VALUES (13, 6, 4);
INSERT INTO `soal_test` VALUES (14, 6, 3);
INSERT INTO `soal_test` VALUES (15, 6, 2);
INSERT INTO `soal_test` VALUES (16, 6, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `soal_utama`
-- 

CREATE TABLE `soal_utama` (
  `idsoalutama` int(10) NOT NULL auto_increment,
  `nip` varchar(25) NOT NULL,
  `thajar` varchar(10) NOT NULL,
  `sem` int(1) NOT NULL,
  `pel` varchar(30) NOT NULL,
  `jenis` int(2) NOT NULL COMMENT '1. Ulangan Harian\r\n2. Ulangan Blok\r\n3. Ulangan MID Semester\r\n4. Ulangan Akhir Semester\r\n5. Latihan Soal\r\n6. Remedial',
  `materi` varchar(50) NOT NULL,
  `jml_tampil` int(3) NOT NULL,
  `metode` int(1) NOT NULL COMMENT '1. Berurutan\r\n2. Acak',
  `psswd_soal` varchar(30) NOT NULL,
  `kesempatan` int(2) NOT NULL,
  `waktu` int(3) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_akhir` date NOT NULL,
  PRIMARY KEY  (`idsoalutama`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- 
-- Dumping data for table `soal_utama`
-- 

INSERT INTO `soal_utama` VALUES (1, '400001001', '2010/2011', 1, 'Matematika', 1, 'logika', 20, 2, '12345', 1, 90, '2012-11-26', '2012-11-30');
INSERT INTO `soal_utama` VALUES (2, '400001001', '2012/2013', 1, 'Matematika', 1, 'dd', 10, 2, '12345', 1, 90, '2012-11-24', '2012-11-30');
INSERT INTO `soal_utama` VALUES (3, '400001001', '2010/2011', 1, 'Matematika', 1, 'ww', 5, 2, '12345', 1, 90, '2012-11-24', '2012-11-30');
INSERT INTO `soal_utama` VALUES (4, '400001001', '2010/2011', 1, 'Matematika', 1, 'sssssssssssssss', 2, 1, '123', 2, 3, '2012-11-17', '2012-11-30');
INSERT INTO `soal_utama` VALUES (5, '400001001', '2012/2013', 1, 'Matematika', 1, 'aljabar', 5, 2, '123', 0, 1, '2012-11-25', '2012-11-28');
INSERT INTO `soal_utama` VALUES (6, '400001001', '2010/2011', 1, 'Matematika', 1, 'aljabar1', 5, 2, '123', 2, 0, '2012-11-24', '2012-11-28');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_absensi`
-- 

CREATE TABLE `t_absensi` (
  `idabsen` int(10) NOT NULL auto_increment,
  `nis` varchar(25) collate latin1_general_ci NOT NULL default '',
  `stabsen` varchar(1) collate latin1_general_ci NOT NULL default '0',
  `tglabsen` date NOT NULL default '0000-00-00',
  `terlambat` varchar(8) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`idabsen`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_absensi`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_artikel`
-- 

CREATE TABLE `t_artikel` (
  `id` int(10) NOT NULL auto_increment,
  `tanggal` varchar(20) collate latin1_general_ci NOT NULL default '',
  `judul` varchar(100) collate latin1_general_ci NOT NULL default '',
  `isi` longtext collate latin1_general_ci NOT NULL,
  `pengirim` varchar(80) collate latin1_general_ci NOT NULL default '',
  `visits` int(10) NOT NULL default '0',
  `admin` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=37 ;

-- 
-- Dumping data for table `t_artikel`
-- 

INSERT INTO `t_artikel` VALUES (12, '16/08/2009', 'Cara Belajar Efektif', '<div>Belajar emang nggak seterusnya menyenangkan. kalu enak, ya beljar. tetapi sebaiknya setiap hari biasakanlah berdisiplin waktu untuk belajar. Berikut ini tips dari Mr. Tips gimana cara belajar efektif.</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<p>&nbsp;</p>\r\n<div>Suasana Hati,Cipakanlah suasana yang positif untuk belajar. Bisa dilakukan dengan menentukan&nbsp;waktu, lingkungan dan sikap belajar yang sesuai dengan pribadimu. Buat ruang belajar kamu senyaman mungkin sehingga kmu bisa belajar dengan tenang dan konsentrasi penuh.</div>\r\n<p>&nbsp;</p>\r\n<div><strong>Pemahaman</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />\r\nTandai informasi bahan pelajaran yang tidak kamu mengerti. Fokuskan perhatianmu pada bahan tersebut.&nbsp;<br />\r\nBentuk kelompok belajar yang anggotanya teman-teman yang kamu kenal, dalam artian jangan salah memilih&nbsp;<br />\r\nteman.<br />\r\n<br />\r\n<strong>Kilas Ulang</strong><br />\r\nSetelah belajar satu bagian, berhentilah dan ulangi bahan dari bagian tersebut dengan kata-kata yang kamu buat sendri. Cobalah buat tulisan-ulisan singkat mengenai bagian itu dalam sebuah catatanmu.<br />\r\n<br />\r\n<strong>Telaah dan Pelajari Kembali</strong><br />\r\nKalau ada beberapa bagian yang belum kamu mengerti juga, carilah bahan lain yang terkait dengan bagian itu. Bisa dari buku teks, artikel, internet, selebaran dan sumber-sumber lain yang bisa kamu percaya.&nbsp;&nbsp;</div>\r\n<p>&nbsp;</p>\r\n<div><strong>Mengingat&nbsp;&nbsp;</strong> <br />\r\nSetelah belajar beberapa waktu. Tutuplah buku pelajaran tersebut dan kamu memejamkan mta untuk&nbsp;&nbsp;&nbsp;<br />\r\nmenggambarkan yang kamu baca tadi.</div>\r\n<p>&nbsp;</p>\r\n<div><strong>Metode Menulis</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />\r\nKamu juga bisa belajar dengan cara menulis. Karena dengan menulis maka otak akan bisa lebih mengingat&nbsp;<br />\r\ndaripada sekedar dibaca apalagi dihapal, yang akan membuat kamu tambah pusing.</div>\r\n<p>&nbsp;</p>\r\n<div><strong>Membuat Ringkasan</strong></div>\r\n<p>&nbsp;</p>\r\n<div>Ini termasuk metode yang sangat lazim. namun kamu seharsnya membuat ringkasan yang lain dari&nbsp;<br />\r\nbiasanya. Ringkasan itu bisa saja hanya berupa bagan atau skema.&nbsp;<br />\r\n<br />\r\nSekian yang bisa disampaikan oleh Mr. Tips. Lain kali kita pasti bisa berjumpa lagi. Sayonara.</div>', '-', 13, 3);
INSERT INTO `t_artikel` VALUES (13, '16/08/2009', 'Tiba Saatnya Mengakhiri Pendidikan?', '<p>MANA yang harus didahulukan antara anak dan pendidikan? Kedua isu tersebut tidak bisa didikotomikan karena setali tiga uang, terlebih jika kita memperbincangkan masa depan kita. Pendidikan merupakan bekal untuk menapaki masa depan anak cucu kita. <br />\r\n<br />\r\nNamun, bahwa dunia pendidikan kita belum menunjukkan gambaran yang menjanjikan. Menurut data dari Balitbang Departemen Pendidikan Nasional (2001) bahwa sekitar tujuh juta anak terancam berhenti sekolah. Mereka terpaksa menjadi pekerja anak sebagai akibat dari kemiskinan dan tekanan hidup. <br />\r\n<br />\r\nSementara itu, 15 juta anak- anak yang sekarang masuk kelas satu sekolah dasar (SD), diperkirakan hanya 70 persen yang dapat mencapai kelas enam. Dari yang lulus tersebut, hanya kurang dari separuhnya yang kemungkinan dapat meneruskan pendidikannya ke sekolah lanjutan. <br />\r\n<br />\r\nTak perlu heran bila saat ini terdapat sekitar 12 juta anak usia 7 hingga 15 tahun tidak bersekolah dan terancam putus sekolah. Lebih 3,5 juta anak di antaranya menjadi pekerja anak. Maka, realitas di atas telah memberi sedikit diskripsi apa yang terjadi sekarang. <br />\r\n<br />\r\nPENDIDIKAN merupakan tabungan masa depan bagi peradaban kita. Artinya baik-buruknya, makmur-sengsaranya, berkualitas-jeleknya wajah peradaban kita, tergantung proses pendidikan tersebut. Maka, wajah kita yang saat ini dipolesi oleh kemiskinan dan kebodohan menunjukkan kegagalan dari pendidikan kita. <br />\r\n<br />\r\nTingkat pengangguran yang tinggi, frekuensi kriminalitas yang menaik, dan keresahan sosial yang muncul dalam berbagai bentuk merupakan efek ganda (multifler effect) dari kemiskinan yang kita alami saat ini. Sedangkan kemiskinan dan kebodohan yang merupakan momok bagi negara berkembang seperti Indonesia, adalah rantai sosial pertama dalam kegagalan pendidikan kita. <br />\r\n<br />\r\nTahun 2000 lalu kualitas sumber daya manusia (human development index, HDI) kita menduduki peringkat rendah, yaitu 109 dari 174 negara. Dua tahun kemudian, Indonesia tidak jauh beda yakni peringkat 106 dari 170 negara. Angka ini jauh di bawah negara-negara ASEAN lainnya seperti Malaysia (peringkat 56), Filipina (77), Thailand (67), Singapura (22) dan Brunei Darussalam (25). Sehingga, dapat dipastikan tahun ini kita belum bisa keluar dari kualitas hidup yang rendah akibat beberapa stimulus-bom Bali; kenaikan harga BBM, TDL, dan telepon-yang justru kontraproduktif terhadap pertumbuhan ekonomi. <br />\r\n<br />\r\nMaka, upaya memberantas kebodohan dan kemiskinan tidak bisa tidak harus melewati jembatan emas yakni pendidikan. Dalam hal ini pendidikan harus melakukan reposisi dan refungsi kalau ingin menjadi perubah wajah peradaban kita yang tidak sehat ini. <br />\r\n<br />\r\nDalam UUD 1945 dijelaskan, pendidikan adalah hak warga negara, sehingga monopoli negara dalam dunia pendidikan menjadi pilihan yang pahit. Negara sebagai lembaga yang bertanggung jawab dalam proses pendidikan harus menempatkan pendidikan sebagai proses pencarian makna hidup yang lebih baik menuju keadilan dan kesejahteraan. <br />\r\n<br />\r\nSayangnya, pendidikan justru menjadi metode negara dalam mengontrol rakyat. Sehingga, pendidikan sering kali tidak lebih dari upaya setengah-setengah dari negara untuk mengubah peradaban miskin ini. <br />\r\n<br />\r\nDarodjah, Kepala TK Tarbiyatul Banin VIII Desa Pucung, Kecamatan Bancak, Kabupaten Semarang</p>', 'Darodjah', 36, 3);
INSERT INTO `t_artikel` VALUES (15, '16/08/2009', 'Pendidikan dan Proses Humanisasi', '<p>Manusia adalah sebagai makhluk sosial ( <em>Homo Sosius</em> ), yang dibekali Tuhan dengan akal, di mana akal akan menjadikan manusia mengetahui segala sesuatu. Sesuatu yang sepele terkadang terlupakan begitu saja dalam kehidupan. Manusia sering terfokus kepada persoalan besar, namun sering kali terlena pada permasalahan yang sepele.</p>\r\n<p>Padahal bila ditinjau secara filosofis, akan menjadi fondasi untuk membangun kesadaran intelektual. Maka dari itu manusia seharusnya memahami hakekat diri dan lingkungan dalam proses perubahan. Proses penyadaran di sini menjadi amat penting di dalam kehidupan manusia.</p>\r\n<p>Pendidikan merupakan proses yang dilakukan oleh sebagian masyarakat di belahan dunia manapun. Namun pendidikan yang diharapkan sebagai bagian dari proses kehidupan yang dapat mengentaskan manusia dari penindasan dan kesengsaraan ternyata menjadi bagian yang menindas manusia itu sendiri.</p>\r\n<p>Oleh karena itu bagaimana sekarang memposisikan proses pembelajaran sebagai hal yang suci dan sesuai dengan harapan masyarakat, yaitu sebuah proses pembelajaran yang tidak menindas dan tidak ada yang tertindas. Ketika seseorang merasakan hak-haknya dirampas, maka seharusnya ia menuntut.</p>\r\n<p>Pada dasarnya tidak ada yang dapat mengubah nasib kita kecuali diri kita sendiri. Oleh karena itu, setiap manusia harus berusaha keluar dari segala bentuk penindasan dan berusaha memerangi setiap bentuk penindasan. Selama ini kita melihat penindasan justru lahir dari dunia pendidikan yang selama ini kita banggakan.</p>\r\n<p>Sekolah selama ini dijadikan sebuah pabrik, di mana lulusan-lulusannya siap menjadi tenaga kerja siap pakai. Maka sebagian fungsi sekolah yang ada di Indonesia tidak lebih hanya sebagai cara untuk mencari bekal untuk kerja. Tidak mengherankan ketika siswa tidak menjadi semakin cerdas, tapi menjadi semakin beringas dan brutal.</p>\r\n<p>Tawuran pelajar terjadi dimana-mana dan banyak sekali penyalahgunaan NARKOBA yang dilakukan oleh pelajar. Hal itu merupakan bukti ketidakberhasilan sekolah untuk membentuk siswa menjadi manusia pembelajar. Pembelajar adalah individu-individu yang dapat memilah dan memilih mana yang baik dan yang buruk.</p>\r\n<p>Beberapa contoh di atas merupakan pertanda bahwa pendidikan hanya dijadikan ajang penindasan bagi siswa. Erat kaitannya dengan hal tersebut, Freire yang adalah seorang tokoh pendidikan menggagas adanya <em>concientizacao</em> ( kesadaran untuk melakukan ). <em>Concientizacao</em> adalah kesadaran untuk melakukan pembelaan kemanusiaan. Dapat memberantas buta huruf di kalangan orang dewasa misalnya, dimaknai sebagai usaha membebaskan manusia dari belenggu kebodohan.</p>\r\n<p>Freire mengklarifikasikan kesadaran dalam tiga hal. Pertama, kesadaran magis ( <em>magical conciousness</em> ) yaitu kesadaran yang tidak mampu melihat kaitan antara satu faktor dengan yang lainnya, dalam hal ini melihat faktor di luar manusia. Kedua, kesadaran naf (<em> Naival consciousness</em> ) yaitu manusia menjadi akar penyebab masalah masyarakat. Ketiga, kesadaran kritis (<em> critical conciousness</em> ) yaitu sistem dan struktur sebagai sumber masalah. Kritis penyadaran struktur dan sistem politik, sosial, ekonomi, budaya pada masyarakat. Hal ini menunjukan bahwa kritisme sangatlah penting di dalam pelembagaan penyadaran masyarakat.</p>\r\n<p>Sebuah kenyataan tidak harus menjadi suatu keharusan. Jika kenyataan menyimpang dari keharusan, maka tugas manusia untuk merubahnya, agar sesuai dengan apa yang seharusnya. Kenyataan tersebut sering disebut dengan fitrah. Fitrah manusia sejati adalah pelaku ( subyek ), bukan obyek atau penderita. Fitrah manusia adalah menjadi merdeka dan menjadi bebas. Kesemuanya itu sering disebut dengan tujuan humanisasi Freire.</p>\r\n<p>Freire juga menyebutkan pendidikan seharusnya berorientasi kepada pengenalan realitas dari manusia dan dirinya. Hal itu berarti bahwa pendidikan bukan hanya sebagai ajang<em> transfer of knowledge</em> akan tetapi bagaimana ilmu pengetahuan dijadikan sarana untuk mendidik manusia agar mampu membaca realitas sosial. Hal ini juga didukung oleh Lodge yang menyatakan<em> life is education, education is life</em>.</p>\r\n<p>*) Penulis adalah Benny Setiawan, mahasiswa fakultas Syari''ah Universitas Islam Negeri (UIN) Sunan Kalijaga, Yogyakarta.</p>', 'www.sekolahindonesia.com', 53, 3);
INSERT INTO `t_artikel` VALUES (23, '16/08/2009', 'Apa Itu Pemanasan Global', '<div>&quot;Panas banget ya hari ini!&rdquo; Seringkah Anda mendengar pernyataan tersebut terlontar dari orang-orang di sekitar Anda ataupun dari diri Anda sendiri? Anda tidak salah, data-data yang ada memang menunjukkan planet bumi terus mengalami peningkatan suhu yang mengkhawatirkan dari tahun ke tahun. Selain makin panasnya cuaca di sekitar kita, Anda tentu juga menyadari makin banyaknya bencana alam dan fenomena-fenomena alam yang cenderung semakin tidak terkendali belakangan ini. Mulai dari banjir, puting beliung, semburan gas, hingga curah hujan yang tidak menentu dari tahun ke tahun. Sadarilah bahwa semua ini adalah tanda-tanda alam yang menunjukkan bahwa planet kita tercinta ini sedang mengalami proses kerusakan yang menuju pada kehancuran! Hal ini terkait langsung dengan isu global yang belakangan ini makin marak dibicarakan oleh masyarakat dunia yaitu Global Warming (Pemanasan Global). Apakah pemanasan global itu? Secara singkat pemanasan global adalah peningkatan suhu rata-rata permukaan bumi. Pertanyaannya adalah: mengapa suhu permukaan bumi bisa meningkat?</div>\r\n<div>&nbsp;</div>\r\n<div><span style="font-size: small;"><b><span style="color: green;">Penyebab Pemanasan Global</span></b></span></div>\r\n<div>Penelitian yang telah dilakukan para ahli selama beberapa dekade terakhir ini menunjukkan bahwa ternyata makin panasnya planet bumi terkait langsung dengan gas-gas rumah kaca yang dihasilkan oleh aktifitas manusia. Khusus untuk mengawasi sebab dan dampak yang dihasilkan oleh pemanasan global, Perserikatan Bangsa Bangsa (PBB) membentuk sebuah kelompok peneliti yang disebut dengan International Panel on Climate Change (IPCC). Setiap beberapa tahun sekali, ribuan ahli dan peneliti-peneliti terbaik dunia yang tergabung dalam IPCC mengadakan pertemuan untuk mendiskusikan penemuan-penemuan terbaru yang berhubungan dengan pemanasan global, dan membuat kesimpulan dari laporan dan penemuan- penemuan baru yang berhasil dikumpulkan, kemudian membuat persetujuan untuk solusi dari masalah tersebut . Salah satu hal pertama yang mereka temukan adalah bahwa beberapa jenis gas rumah kaca bertanggung jawab langsung terhadap pemanasan yang kita alami, dan manusialah kontributor terbesar dari terciptanya gas-gas rumah kaca tersebut. Kebanyakan dari gas rumah kaca ini dihasilkan oleh peternakan, pembakaran bahan bakar fosil pada kendaraan bermotor, pabrik-pabrik modern, peternakan, serta pembangkit tenaga listrik.</div>\r\n<div>&nbsp;</div>\r\n<div><span style="font-size: small;"><b><span style="color: green;">Apa itu Gas Rumah Kaca?</span></b></span></div>\r\n<div>Atmosfer bumi terdiri dari bermacam-macam gas dengan fungsi yang berbeda-beda. Kelompok gas yang menjaga suhu permukaan bumi agar tetap hangat dikenal dengan istilah &ldquo;gas rumah kaca&rdquo;. Disebut gas rumah kaca karena sistem kerja gas-gas tersebut di atmosfer bumi mirip dengan cara kerja rumah kaca yang berfungsi menahan panas matahari di dalamnya agar suhu di dalam rumah kaca tetap hangat, dengan begitu tanaman di dalamnya pun akan dapat tumbuh dengan baik karena memiliki panas matahari yang cukup. Planet kita pada dasarnya membutuhkan gas-gas tesebut untuk menjaga kehidupan di dalamnya. Tanpa keberadaan gas rumah kaca, bumi akan menjadi terlalu dingin untuk ditinggali karena tidak adanya lapisan yang mengisolasi panas matahari. Sebagai perbandingan, planet mars yang memiliki lapisan atmosfer tipis dan tidak memiliki efek rumah kaca memiliki temperatur rata-rata -32o Celcius.</div>\r\n<div>Kontributor terbesar pemanasan global saat ini adalah Karbon Dioksida (CO2), metana (CH4) yang dihasilkan agrikultur dan peternakan (terutama dari sistem pencernaan hewan-hewan ternak), Nitrogen Oksida (NO) dari pupuk, dan gas-gas yang digunakan untuk kulkas dan pendingin ruangan (CFC). Rusaknya hutan-hutan yang seharusnya berfungsi sebagai penyimpan CO2 juga makin memperparah keadaan ini karena pohon-pohon yang mati akan melepaskan CO2 yang tersimpan di dalam jaringannya ke atmosfer. Setiap gas rumah kaca memiliki efek pemanasan global yang berbedabeda. Beberapa gas menghasilkan efek pemanasan lebih parah dari CO2. Sebagai contoh sebuah molekul metana menghasilkan efek pemanasan 23 kali dari molekul CO2. Molekul NO bahkan menghasilkan efek pemanasan sampai 300 kali dari molekul CO2. Gas-gas lain seperti chlorofluorocarbons (CFC) ada yang menghasilkan efek pemanasan hingga ribuan kali dari CO2. Tetapi untungnya pemakaian CFC telah dilarang di banyak negara karena CFC telah lama dituding sebagai penyebab rusaknya lapisan ozon.</div>\r\n<p>&nbsp;</p>\r\n<p>Sumber : http://pemanasanglobal.net</p>\r\n<p>&nbsp;</p>', 'Uswatun Hasanah', 46, 3);
INSERT INTO `t_artikel` VALUES (24, '16-12-2012 14:46', 'Pendidikan Sebagai Investasi Jangka Panjang', '<p align="justify"><span style="font-family: arial; font-size: x-small;">Profesor Toshiko Kinosita mengemukakan bahwa sumber daya manusia Indonesia masih sangat lemah untuk mendukung perkembangan industri dan ekonomi. Penyebabnya karena pemerintah selama ini tidak pernah menempatkan pendidikan sebagai prioritas terpenting. Tidak ditempatkannya pendidikan sebagai prioritas terpenting karena masyarakat Indonesia, mulai dari yang awam hingga politisi dan pejabat pemerintah, hanya berorientasi mengejar uang untuk memperkaya diri sendiri dan tidak pernah berfikir panjang (Kompas, 24 Mei 2002). </span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Pendapat Guru Besar Universitas Waseda Jepang tersebut sangat menarik untuk dikaji mengingat saat ini pemerintah Indonesia mulai melirik pendidikan sebagai investasi jangka panjang, setelah selama ini pendidikan terabaikan. Salah satu indikatornya adalah telah disetujuinya oleh MPR untuk memprioritaskan anggaran pendidikan minimal 20 % dari APBN atau APBD. Langkah ini merupakan awal kesadaran pentingnya pendidikan sebagai investasi jangka pangjang. Sedikitnya terdapat tiga alasan untuk memprioritaskan pendidikan sebagai investasi jangka panjang. </span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Pertama, pendidikan adalah alat untuk perkembangan ekonomi dan bukan sekedar pertumbuhan ekonomi. Pada praksis manajemen pendidikan modern, salah satu dari lima fungsi pendidikan adalah fungsi teknis-ekonomis baik pada tataran individual hingga tataran global. Fungsi teknis-ekonomis merujuk pada kontribusi pendidikan untuk perkembangan ekonomi. Misalnya pendidikan dapat membantu siswa untuk mendapatkan pengetahuan dan keterampilan yang diperlukan untuk hidup dan berkompetisi dalam ekonomi yang kompetitif. </span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Secara umum terbukti bahwa semakin berpendidikan seseorang maka tingkat pendapatannya semakin baik. Hal ini dimungkinkan karena orang yang berpendidikan lebih produktif bila dibandingkan dengan yang tidak berpendidikan. Produktivitas seseorang tersebut dikarenakan dimilikinya keterampilan teknis yang diperoleh dari pendidikan. Oleh karena itu salah satu tujuan yang harus dicapai oleh pendidikan adalah mengembangkan keterampilan hidup. Inilah sebenarnya arah kurikulum berbasis kompetensi, pendidikan life skill dan broad based education yang dikembangkan di Indonesia akhir-akhir ini. Di Amerika Serikat (1992) seseorang yang berpendidikan doktor penghasilan rata-rata per tahun sebesar 55 juta dollar, master 40 juta dollar, dan sarjana 33 juta dollar. Sementara itu lulusan pendidikan lanjutan hanya berpanghasilan rata-rata 19 juta dollar per tahun. Pada tahun yang sama struktur ini juga terjadi di Indonesia. Misalnya rata-rata, antara pedesaan dan perkotaan, pendapatan per tahun lulusan universitas 3,5 juta rupiah, akademi 3 juta rupiah, SLTA 1,9 juta rupiah, dan SD hanya 1,1 juta rupiah.</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Para penganut teori human capital berpendapat bahwa pendidikan adalah sebagai investasi sumber daya manusia yang memberi manfaat moneter ataupun non-moneter. Manfaat non-meneter dari pendidikan adalah diperolehnya kondisi kerja yang lebih baik, kepuasan kerja, efisiensi konsumsi, kepuasan menikmati masa pensiun dan manfaat hidup yang lebih lama karena peningkatan gizi dan kesehatan. Manfaat moneter adalah manfaat ekonomis yaitu berupa tambahan pendapatan seseorang yang telah menyelesaikan tingkat pendidikan tertentu dibandingkan dengan pendapatan lulusan pendidikan dibawahnya. (Walter W. McMahon dan Terry G. Geske, Financing Education: Overcoming Inefficiency and Inequity, USA: University of Illionis, 1982, h.121).</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Sumber daya manusia yang berpendidikan akan menjadi modal utama pembangunan nasional, terutama untuk perkembangan ekonomi. Semakin banyak orang yang berpendidikan maka semakin mudah bagi suatu negara untuk membangun bangsanya. Hal ini dikarenakan telah dikuasainya keterampilan, ilmu pengetahuan dan teknologi oleh sumber daya manusianya sehingga pemerintah lebih mudah dalam menggerakkan pembangunan nasional. </span></p>\r\n<p><span style="font-family: arial; font-size: x-small;"> Nilai </span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Balik Pendidikan<br /> Kedua, investasi pendidikan memberikan nilai balik (rate of return) yang lebih tinggi dari pada investasi fisik di bidang lain. Nilai balik pendidikan adalah perbandingan antara total biaya yang dikeluarkan untuk membiayai pendidikan dengan total pendapatan yang akan diperoleh setelah seseorang lulus dan memasuki dunia kerja. Di negara-negara sedang berkembang umumnya menunjukkan nilai balik terhadap investasi pendidikan relatif lebih tinggi dari pada investasi modal fisik yaitu 20 % dibanding 15 %. Sementara itu di negara-negara maju nilai balik investasi pendidikan lebih rendah dibanding investasi modal fisik yaitu 9 % dibanding 13 %. Keadaan ini dapat dijelaskan bahwa dengan jumlah tenaga kerja terdidik yang terampil dan ahli di negara berkembang relatif lebih terbatas jumlahnya dibandingkan dengan kebutuhan sehingga tingkat upah lebih tinggi dan akan menyebabkan nilai balik terhadap pendidikan juga tinggi (Ace Suryadi, Pendidikan, Investasi SDM dan Pembangunan: Isu, Teori dan Aplikasi. Balai Pustaka: Jakarta, 1999, h.247).</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Pilihan investasi pendidikan juga harus mempertimbangkan tingkatan pendidikan. Di Asia nilai balik sosial pendidikan dasar rata-rata sebesar 27 %, pendidikan menengah 15 %, dan pendidikan tinggi 13 %. Dengan demikian dapat dikemukakan bahwa semakin tinggi tingkat pendidikan seseorang maka manfaat sosialnya semakin kecil. Jelas sekali bahwa pendidikan dasar memberikan manfaat sosial yang paling besar diantara tingkat pendidikan lainnya. Melihat kenyataan ini maka struktur alokasi pembiayaan pendidikan harus direformasi. Pada tahun 1995/1996 misalnya, alokasi biaya pendidikan dari pemerintah Indonesia untuk Sekolah Dasar Negeri per siswa paling kecil yaitu rata-rata hanya sekirat 18.000 rupiah per bulan, sementara itu biaya pendidikan per siswa di Perguruan Tinggi Negeri mendapat alokasi sebesar 66.000 rupiah per bulan. Dirjen Dikti, Satrio Sumantri Brojonegoro suatu ketika mengemukakan bahwa alokasi dana untuk pendidikan tinggi negeri 25 kali lipat dari pendidikan dasar. Hal ini menunjukkan bahwa biaya pendidikan yang lebih banyak dialokasikan pada pendidikan tinggi justru terjadi inefisiensi karena hanya menguntungkan individu dan kurang memberikan manfaat kepada masyarakat.</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Reformasi alokasi biaya pendidikan ini penting dilakukan mengingat beberapa kajian yang menunjukkan bahwa mayoritas yang menikmati pendidikan di PTN adalah berasal dari masyarakat mampu. Maka model pembiayaan pendidikan selain didasarkan pada jenjang pendidikan (dasar vs tinggi) juga didasarkan pada kekuatan ekonomi siswa (miskin vs kaya). Artinya siswa di PTN yang berasal dari keluarga kaya harus dikenakan biaya pendidikan yang lebih mahal dari pada yang berasal dari keluarga miskin. Model yang ditawarkan ini sesuai dengan kritetia equity dalam pembiayaan pendidikan seperti yang digariskan Unesco.</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Itulah sebabnya Profesor Kinosita menyarankan bahwa yang diperlukan di Indonesia adalah pendidikan dasar dan bukan pendidikan yang canggih. Proses pendidikan pada pendidikan dasar setidaknnya bertumpu pada empat pilar yaitu learning to know, learning to do, leraning to be dan learning live together yang dapat dicapai melalui delapan kompetensi dasar yaitu membaca, menulis, mendengar, menutur, menghitung, meneliti, menghafal dan menghayal. Anggaran pendidikan nasional seharusnya diprioritaskan untuk mengentaskan pendidikan dasar 9 tahun dan bila perlu diperluas menjadi 12 tahun. Selain itu pendidikan dasar seharusnya &ldquo;benar-benar&rdquo; dibebaskan dari segala beban biaya. Dikatakan &ldquo;benar-benar&rdquo; karena selama ini wajib belajar 9 tahun yang dicanangkan pemerintah tidaklah gratis. Apabila semua anak usia pendidikan dasar sudah terlayani mendapatkan pendidikan tanpa dipungut biaya, barulah anggaran pendidikan dialokasikan untuk pendidikan tingkat selanjutnya. </span></p>\r\n<p><span style="font-family: arial; font-size: x-small;"> Fungsi </span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Non Ekonomi<br /> Ketiga, investasi dalam bidang pendidikan memiliki banyak fungsi selain fungsi teknis-ekonomis yaitu fungsi sosial-kemanusiaan, fungsi politis, fungsi budaya, dan fungsi kependidikan. Fungsi sosial-kemanusiaan merujuk pada kontribusi pendidikan terhadap perkembangan manusia dan hubungan sosial pada berbagai tingkat sosial yang berbeda. Misalnya pada tingkat individual pendidikan membantu siswa untuk mengembangkan dirinya secara psikologis, sosial, fisik dan membantu siswa mengembangkan potensinya semaksimal mungkin (Yin Cheong Cheng, School Effectiveness and School-Based Management: A Mechanism for Development, Washington D.C: The Palmer Press, 1996, h.7).</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Fungsi politis merujuk pada sumbangan pendidikan terhadap perkembangan politik pada tingkatan sosial yang berbeda. Misalnya pada tingkat individual, pendidikan membantu siswa untuk mengembangkan sikap dan keterampilan kewarganegaraan yang positif untuk melatih warganegara yang benar dan bertanggung jawab. Orang yang berpendidikan diharapkan lebih mengerti hak dan kewajibannya sehingga wawasan dan perilakunya semakin demoktratis. Selain itu orang yang berpendidikan diharapkan memiliki kesadaran dan tanggung jawab terhadap bangsa dan negara lebih baik dibandingkan dengan yang kurang berpendidikan.</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Fungsi budaya merujuk pada sumbangan pendidikan pada peralihan dan perkembangan budaya pada tingkatan sosial yang berbeda. Pada tingkat individual, pendidikan membantu siswa untuk mengembangkan kreativitasnya, kesadaran estetis serta untuk bersosialisasi dengan norma-norma, nilai-nilai dan keyakinan sosial yang baik. Orang yang berpendidikan diharapkan lebih mampu menghargai atau menghormati perbedaan dan pluralitas budaya sehingga memiliki sikap yang lebih terbuka terhadap keanekaragaman budaya. Dengan demikian semakin banyak orang yang berpendidikan diharapkan akan lebih mudah terjadinya akulturasi budaya yang selanjutnya akan terjadi integrasi budaya nasional atau regional.</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Fungsi kependidikan merujuk pada sumbangan pendidikan terhadap perkembangan dan pemeliharaan pendidikan pada tingkat sosial yang berbeda. Pada tingkat individual pendidikan membantu siswa belajar cara belajar dan membantu guru cara mengajar. Orang yang berpendidikan diharapkan memiliki kesadaran untuk belajar sepanjang hayat (life long learning), selalu merasa ketinggalan informasi, ilmu pengetahuan serta teknologi sehingga terus terdorong untuk maju dan terus belajar.</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Di kalangan masyarakat luas juga berlaku pendapat umum bahwa semakin berpendidikan maka makin baik status sosial seseorang dan penghormatan masyarakat terhadap orang yang berpendidikan lebih baik dari pada yang kurang berpendidikan. Orang yang berpendidikan diharapkan bisa menggunakan pemikiran-pemikirannya yang berorientasi pada kepentingan jangka panjang. Orang yang berpendidikan diharapkan tidak memiliki kecenderungan orientasi materi/uang apalagi untuk memperkaya diri sendiri.</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Kesimpulan<br /> Jelaslah bahwa investasi dalam bidang pendidikan tidak semata-mata untuk mendongkrak pertumbuhan ekonomi tetapi lebih luas lagi yaitu perkembangan ekonomi. Selama orde baru kita selalu bangga dengan pertumbuhan ekonomi yang tinggi, namun pertumbuhan ekonomi yang tinggi itu hancur lebur karena tidak didukung oleh adanya sumber daya manusia yang berpendidikan. Orde baru banyak melahirkan orang kaya yang tidak memiliki kejujuran dan keadilan, tetapi lebih banyak lagi melahirkan orang miskin. Akhirnya pertumbuhan ekonomi hanya dinikmati sebagian orang dan dengan tingkat ketergantungan yang amat besar.</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Perkembangan ekonomi akan tercapai apabila sumber daya manusianya memiliki etika, moral, rasa tanggung jawab, rasa keadilan, jujur, serta menyadari hak dan kewajiban yang kesemuanya itu merupakan indikator hasil pendidikan yang baik. Inilah saatnya bagi negeri ini untuk merenungkan bagaimana merencanakan sebuah sistem pendidikan yang baik untuk mendukung perkembangan ekonomi. Selain itu pendidikan juga sebagai alat pemersatu bangsa yang saat ini sedang diancam perpecahan. Melalui fungsi-fungsi pendidikan di atas yaitu fungsi sosial-kemanusiaan, fungsi politis, fungsi budaya, dan fungsi kependidikan maka negeri ini dapat disatukan kembali. Dari paparan di atas tampak bahwa pendidikan adalah wahana yang amat penting dan strategis untuk perkembangan ekonomi dan integrasi bangsa. Singkatnya pendidikan adalah sebagai investasi jangka panjang yang harus menjadi pilihan utama.</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Bila demikian, ke arah mana pendidikan negeri ini harus dibawa? Bagaimana merencanakan sebuah sistem pendidikan yang baik? Marilah kita renungkan bersama.</span></p>\r\n<p><span style="font-family: arial; font-size: x-small;">Nurkolis, Dosen Akademi Pariwisata Nusantara Jaya di Jakarta. </span></p>\r\n<p><span style="font-size: small;"><strong>Saya Drs. Nurkolis, MM setuju jika bahan yang dikirim dapat dipasang dan digunakan di Homepage Pendidikan Network dan saya menjamin bahwa bahan ini hasil karya saya sendiri dan sah (tidak ada copyright). . </strong></span></p>', 'Drs. Nurkolis, MM', 6, 3);

-- --------------------------------------------------------

-- 
-- Table structure for table `t_artikel_kom`
-- 

CREATE TABLE `t_artikel_kom` (
  `idkom` int(11) NOT NULL auto_increment,
  `id` int(11) default NULL,
  `nama` varchar(40) collate latin1_general_ci default NULL,
  `email` varchar(50) collate latin1_general_ci default NULL,
  `tgl` varchar(20) collate latin1_general_ci NOT NULL,
  `komentar` text collate latin1_general_ci,
  PRIMARY KEY  (`idkom`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_artikel_kom`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_banner`
-- 

CREATE TABLE `t_banner` (
  `id` int(10) NOT NULL auto_increment,
  `alt` varchar(30) collate latin1_general_ci default NULL,
  `url` varchar(100) collate latin1_general_ci default NULL,
  `visits` int(10) NOT NULL default '0',
  `status` int(3) NOT NULL default '0',
  `admin` int(10) NOT NULL default '0',
  `aktif` char(1) collate latin1_general_ci NOT NULL default '',
  `jenis` varchar(5) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=9 ;

-- 
-- Dumping data for table `t_banner`
-- 

INSERT INTO `t_banner` VALUES (1, 'Kajian website', 'http://www.kajianwebsite.org', 2, 13, 3, '1', 'jpg');
INSERT INTO `t_banner` VALUES (3, 'edukasi', 'http://e-dukasi.net', 1, 12, 2, '1', 'jpg');
INSERT INTO `t_banner` VALUES (5, 'wikipedia Indonesia', 'http://id.wikipedia.org', 1, 12, 2, '1', 'jpg');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_belajar`
-- 

CREATE TABLE `t_belajar` (
  `idbelajar` int(11) NOT NULL auto_increment,
  `thajar` varchar(10) default NULL,
  `sem` int(1) default NULL,
  `pelajaran` varchar(30) NOT NULL,
  `nip` varchar(25) NOT NULL,
  `tglawal` date default NULL,
  `tglakhir` date default NULL,
  `status` varchar(2) default NULL,
  `ket` varchar(200) default NULL,
  PRIMARY KEY  (`idbelajar`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `t_belajar`
-- 

INSERT INTO `t_belajar` VALUES (1, '2012/2013', 1, 'Matematika', '400001001', '2012-11-01', '2012-11-30', '1', 'sel');
INSERT INTO `t_belajar` VALUES (2, '2012/2013', 1, 'Matematika', '400001001', '2012-11-09', '2012-11-30', '1', 'sel2');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_belajar_detail`
-- 

CREATE TABLE `t_belajar_detail` (
  `iddetail` int(11) NOT NULL auto_increment,
  `idbelajar` int(11) default NULL,
  `materi` text,
  `jenis` varchar(2) default NULL,
  `stshow` varchar(1) default NULL,
  `pertemuan` int(2) default NULL,
  `urut` int(2) default NULL,
  PRIMARY KEY  (`iddetail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_belajar_detail`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_belajar_kls`
-- 

CREATE TABLE `t_belajar_kls` (
  `id` int(11) NOT NULL auto_increment,
  `idbelajar` int(11) default NULL,
  `kelas` varchar(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `t_belajar_kls`
-- 

INSERT INTO `t_belajar_kls` VALUES (1, 1, 'X - 4');
INSERT INTO `t_belajar_kls` VALUES (2, 1, 'X - 4');
INSERT INTO `t_belajar_kls` VALUES (3, 2, 'X - 4');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_belajar_log`
-- 

CREATE TABLE `t_belajar_log` (
  `tglakses` datetime default NULL,
  `nis` varchar(25) default NULL,
  `idbelajar` int(11) default NULL,
  `akses` varchar(50) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `t_belajar_log`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_bpbk`
-- 

CREATE TABLE `t_bpbk` (
  `id` int(11) NOT NULL auto_increment,
  `nis` varchar(25) collate latin1_general_ci default NULL,
  `guru` varchar(100) collate latin1_general_ci default NULL,
  `kelas` varchar(15) collate latin1_general_ci default NULL,
  `tgl` date default NULL,
  `sem` char(1) collate latin1_general_ci default NULL,
  `penilaian` text collate latin1_general_ci,
  `ket` text collate latin1_general_ci,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_bpbk`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_buku`
-- 

CREATE TABLE `t_buku` (
  `id_buku` int(10) NOT NULL auto_increment,
  `nama` varchar(40) collate latin1_general_ci default NULL,
  `email` varchar(30) collate latin1_general_ci default NULL,
  `alamat` varchar(40) collate latin1_general_ci default NULL,
  `komentar` text collate latin1_general_ci,
  `posttime` varchar(20) collate latin1_general_ci NOT NULL default '',
  `postdate` varchar(20) collate latin1_general_ci NOT NULL default '',
  `ipkom` varchar(20) collate latin1_general_ci default NULL,
  `tanggapan` text collate latin1_general_ci,
  PRIMARY KEY  (`id_buku`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `t_buku`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_chat`
-- 

CREATE TABLE `t_chat` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `from` varchar(50) collate latin1_general_ci NOT NULL default '',
  `to` varchar(50) collate latin1_general_ci NOT NULL default '',
  `message` varchar(200) collate latin1_general_ci NOT NULL,
  `sent` datetime NOT NULL default '0000-00-00 00:00:00',
  `recd` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_chat`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_download`
-- 

CREATE TABLE `t_download` (
  `id` int(10) NOT NULL auto_increment,
  `judul` varchar(200) collate latin1_general_ci NOT NULL default '',
  `deskripsi` text collate latin1_general_ci NOT NULL,
  `kategori` varchar(30) collate latin1_general_ci NOT NULL default '0',
  `file` varchar(50) collate latin1_general_ci NOT NULL default '',
  `visit` int(10) NOT NULL default '0',
  `ukuran` varchar(50) collate latin1_general_ci NOT NULL default '',
  `tanggal` varchar(20) collate latin1_general_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=20 ;

-- 
-- Dumping data for table `t_download`
-- 

INSERT INTO `t_download` VALUES (5, 'Tutorial MS. Word', 'Tulisan ini memuat tutorial singkat bagi pemula yang ingin belajar tentang Microsoft Word. Disertai dengan banyak gambar dan praktek langsung, sehingga memudahkan bagi pemula untuk mempelajari aplikasi Microsoft Word. \r\n\r\nTulisan Microsoft Word ini telah dipakai sebagai bahan materi untuk kegiatan kursus komputer dasar bagi para trainee Indonesia di Jepang. \r\nPenulis: Deddy Nurzaman dan Team Kursus Komputer Trainee Jepang\r\nPublisher: IlmuKomputer.Com', 'T I K', 'al5.zip', 1, '484,36 Kbytes', '12/07/2006 20:01:18');
INSERT INTO `t_download` VALUES (6, 'Teknik dan Logika Pemrograman', 'Penulis: Findra Kartika Sari Dewi\r\nPublisher: IlmuKomputer.Com\r\n', 'T I K', 'al6.zip', 1, '145,00 Kbytes', '12/07/2006 20:01:32');
INSERT INTO `t_download` VALUES (7, 'Tool Dasar Photoshop 7', 'Adobe Photoshop 7.0 menyediakan tool-tool yang terintegrasi dan tertata secara praktis untuk menciptakan dan menghasilkan karya dalam bentuk vektor dan teks yang sempurna. Bentuk grafik yang berdasarkan vektor dan teks bisa ditransfer menjadi image yang berdasarkan pixel untuk mendapatkan efek desain yang lebih sempurna. Pada tulisan ini akan diulas secara mendetail bagaimana cara menguasai adobe photoshop7.0. Disertai dengan banyak gambar dan contoh, sehingga mudah dimengerti.\r\nPenulis: Eko Purwanto\r\nPublisher: IlmuKomputer.Com', 'T I K', 'al7.zip', 1, '594,35 Kbytes', '12/07/2006 20:00:32');
INSERT INTO `t_download` VALUES (8, 'Uji Kemampuan Fisika', 'Materi berupa animasi Flash yang di design untuk dipahami sendiri.', 'Fisika', 'al8.swf', 6, '157,19 Kbytes', '16/12/2012 09:33:25');
INSERT INTO `t_download` VALUES (9, 'Uji Kemampuan Biologi', 'Animasi flash yang dirancang untuk memudahkan siswa dalam belajar mandiri.\r\nSumber : www.e-dukasi.net', 'Biologi', 'al9.swf', 3, '166,75 Kbytes', '16/12/2012 09:32:27');
INSERT INTO `t_download` VALUES (10, 'Persamaan Kuadrat', 'Animasi flash yang dirancang untuk memudahkan siswa dalam belajar mandiri.\r\nSumber : www.e-dukasi.net', 'Matematika', 'al10.swf', 3, '76,90 Kbytes', '16/12/2012 09:32:17');
INSERT INTO `t_download` VALUES (11, 'ATMOSFER (Cuaca dan Iklim)', 'Animasi flash yang dirancang untuk memudahkan siswa dalam belajar mandiri.\r\nSumber : www.e-dukasi.net', 'Geografi', 'al11.pdf', 6, '504,49 Kbytes', '16/12/2012 09:32:50');
INSERT INTO `t_download` VALUES (13, 'Dinamika Partikel 1', 'Materi berupa penjelasan mengenai Dinamika Partikel bagian ke 1.\r\nSumber : www.e-dukasi.net', 'Fisika', 'al13.zip', 6, '522,53 Kbytes', '12/07/2006 20:20:29');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_dsp`
-- 

CREATE TABLE `t_dsp` (
  `iddsp` int(11) NOT NULL auto_increment,
  `nis` varchar(25) collate latin1_general_ci NOT NULL,
  `tgl_bayar` datetime default NULL,
  `tingkat` varchar(10) collate latin1_general_ci default NULL,
  `dsp` int(11) default NULL,
  `sisa` int(11) default NULL,
  `tu` varchar(30) collate latin1_general_ci default NULL,
  `ket` varchar(8) collate latin1_general_ci default '0',
  PRIMARY KEY  (`iddsp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_dsp`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_forum`
-- 

CREATE TABLE `t_forum` (
  `forum_id` int(10) NOT NULL auto_increment,
  `forum_nama` varchar(60) collate latin1_general_ci NOT NULL default '',
  `forum_ket` varchar(255) collate latin1_general_ci NOT NULL default '',
  PRIMARY KEY  (`forum_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `t_forum`
-- 

INSERT INTO `t_forum` VALUES (1, 'Diskusi Pendidikan', 'Diskusi seputar dunia pendidikan di negara kita');
INSERT INTO `t_forum` VALUES (2, 'Diskusi Guru', 'Diskusi seputar aktivitas dan keluhan guru');
INSERT INTO `t_forum` VALUES (3, 'Diskusi Materi Pengajaran', 'Diskusi seputar materi pengajaran di sekolah / kurikulum sekolah');
INSERT INTO `t_forum` VALUES (4, 'Diskusi Lingkungan Sekolah', 'Diskusi seputar aktivitas sekolah-sekolah');
INSERT INTO `t_forum` VALUES (5, 'Diskusi Siswa', 'Diskusi seputar kegiatan siswa di berbagai sekolah');
INSERT INTO `t_forum` VALUES (6, 'Diskusi Pelayanan Pendidikan', 'Diskusi seputar pelayanan pendidikan di tingkat sekolah maupun kantor Dinas.');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_forum_balas`
-- 

CREATE TABLE `t_forum_balas` (
  `balas_id` int(10) NOT NULL auto_increment,
  `balas_body` text collate latin1_general_ci,
  `balas_tgl` datetime default NULL,
  `userid` int(10) NOT NULL default '0',
  `isi_id` int(10) NOT NULL default '0',
  `forum_id` int(10) NOT NULL default '0',
  PRIMARY KEY  (`balas_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_forum_balas`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_forum_isi`
-- 

CREATE TABLE `t_forum_isi` (
  `isi_id` int(10) NOT NULL auto_increment,
  `isi_judul` varchar(60) collate latin1_general_ci NOT NULL default '',
  `isi_body` text collate latin1_general_ci NOT NULL,
  `isi_tgl` datetime default NULL,
  `userid` int(10) NOT NULL default '0',
  `forum_id` int(10) NOT NULL default '0',
  PRIMARY KEY  (`isi_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_forum_isi`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_forum_moderator`
-- 

CREATE TABLE `t_forum_moderator` (
  `moderator_id` int(10) NOT NULL auto_increment,
  `userid` int(10) NOT NULL default '0',
  `forum_id` int(10) NOT NULL default '0',
  PRIMARY KEY  (`moderator_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `t_forum_moderator`
-- 

INSERT INTO `t_forum_moderator` VALUES (2, 1, 4);

-- --------------------------------------------------------

-- 
-- Table structure for table `t_galeri`
-- 

CREATE TABLE `t_galeri` (
  `id` int(10) NOT NULL auto_increment,
  `ket` text collate latin1_general_ci NOT NULL,
  `idalbum` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=34 ;

-- 
-- Dumping data for table `t_galeri`
-- 

INSERT INTO `t_galeri` VALUES (11, 'Asik Belajar', 3);
INSERT INTO `t_galeri` VALUES (12, 'Asiknya', 3);
INSERT INTO `t_galeri` VALUES (13, 'Semangat', 3);
INSERT INTO `t_galeri` VALUES (14, 'Belajar Teknologi', 3);
INSERT INTO `t_galeri` VALUES (15, '', 3);

-- --------------------------------------------------------

-- 
-- Table structure for table `t_galerialbum`
-- 

CREATE TABLE `t_galerialbum` (
  `idalbum` int(11) NOT NULL,
  `album` varchar(100) collate latin1_general_ci default NULL,
  `tanggal` varchar(20) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`idalbum`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `t_galerialbum`
-- 

INSERT INTO `t_galerialbum` VALUES (3, 'Ayo Belajar....', '12-12-2012');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_gambaratas`
-- 

CREATE TABLE `t_gambaratas` (
  `id` int(5) NOT NULL auto_increment,
  `judul` varchar(20) collate latin1_general_ci default NULL,
  `jenis` varchar(5) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=9 ;

-- 
-- Dumping data for table `t_gambaratas`
-- 

INSERT INTO `t_gambaratas` VALUES (5, 'header_sma_atas', 'jpg');
INSERT INTO `t_gambaratas` VALUES (6, 'header sma atas', 'jpg');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_info`
-- 

CREATE TABLE `t_info` (
  `id` int(10) NOT NULL auto_increment,
  `isi` text collate latin1_general_ci,
  `subject` text collate latin1_general_ci,
  `postdate` varchar(12) collate latin1_general_ci NOT NULL default '0000-00-00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `t_info`
-- 

INSERT INTO `t_info` VALUES (2, '<p>Untuk menghadapi pekan olimpiade nasional maka sekolah akan menyelenggarakan seleksi olimpiade. Materi soal Olimpiade Matematika dan Sains Internasional tingkat dasar atau International Mathematics and Science Olympiad for Primary School yang diselenggarakan kedua kalinya, 14-19 November 2005, diarahkan untuk lebih menuntut kreativitas dan daya kritis peserta. </p>', 'Persiapan Pekan Olimpiade sekolah', '15/12/2012');
INSERT INTO `t_info` VALUES (4, '<p>Rapat kerja tahun 2008 akan diselenggarakan pada tanggal 20 - 25 November 2008. Kegiatan akan membahas tentang RAPBS tahun 2008-2009 dan Pemilihan wakil kepala sekolah.</p>', 'Rapat Kerja Tahun 2008', '15/12/2012');
INSERT INTO `t_info` VALUES (5, '<p style="text-align: center;"><strong><span class="berita"><img src="../userfiles/image/Snap1.jpg" alt="" /><br /> </span></strong></p>\r\n<p style="text-align: center;"><strong><span class="berita"><img src="../userfiles/image/Snap2.jpg" alt="" /></span></strong></p>\r\n<p>&nbsp;</p>', 'Pekan Ulangan Semester 1 Tahun 2008-2009', '15/12/2012');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_kategori`
-- 

CREATE TABLE `t_kategori` (
  `id_kategori` int(10) NOT NULL auto_increment,
  `kategori` varchar(30) collate latin1_general_ci NOT NULL default '',
  `jenis` int(5) NOT NULL default '0',
  PRIMARY KEY  (`id_kategori`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=16 ;

-- 
-- Dumping data for table `t_kategori`
-- 

INSERT INTO `t_kategori` VALUES (1, 'Pemerintah', 0);
INSERT INTO `t_kategori` VALUES (2, 'Organiasasi', 0);
INSERT INTO `t_kategori` VALUES (3, 'Tutorial', 0);
INSERT INTO `t_kategori` VALUES (4, 'Project', 0);
INSERT INTO `t_kategori` VALUES (5, 'Sekolah', 0);
INSERT INTO `t_kategori` VALUES (6, 'Umum', 0);
INSERT INTO `t_kategori` VALUES (7, 'Lain-lain', 1);
INSERT INTO `t_kategori` VALUES (9, 'Soal Olimpiade', 2);
INSERT INTO `t_kategori` VALUES (8, 'Soal UN', 2);
INSERT INTO `t_kategori` VALUES (10, 'Soal UTS', 2);
INSERT INTO `t_kategori` VALUES (11, 'Univeristas', 0);
INSERT INTO `t_kategori` VALUES (12, 'Banner Depan 160 x 60 px', 3);
INSERT INTO `t_kategori` VALUES (13, 'Banner Depan 300 x 80 px', 3);
INSERT INTO `t_kategori` VALUES (14, 'Member Banner 160 x 60 px', 3);
INSERT INTO `t_kategori` VALUES (15, 'Banner Siswa Tengah', 3);

-- --------------------------------------------------------

-- 
-- Table structure for table `t_kelas`
-- 

CREATE TABLE `t_kelas` (
  `kelas` varchar(13) collate latin1_general_ci NOT NULL default '',
  `nip` varchar(25) collate latin1_general_ci NOT NULL default '',
  `tingkat` varchar(1) collate latin1_general_ci default NULL,
  `program` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`kelas`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `t_kelas`
-- 

INSERT INTO `t_kelas` VALUES ('X - 1', '480137735', '1', '-');
INSERT INTO `t_kelas` VALUES ('X - 2', '131805943', '1', '-');
INSERT INTO `t_kelas` VALUES ('X - 3', '130896744', '1', '-');
INSERT INTO `t_kelas` VALUES ('X - 4', '400001001', '1', '-');
INSERT INTO `t_kelas` VALUES ('X - 5', '132126005', '1', '-');
INSERT INTO `t_kelas` VALUES ('X - 6', '130889465', '1', '-');
INSERT INTO `t_kelas` VALUES ('X - 7', '132068645', '1', '-');
INSERT INTO `t_kelas` VALUES ('X - 8', '132122047', '1', '-');
INSERT INTO `t_kelas` VALUES ('XI IPA 1', '132086211', '2', 'IPA');
INSERT INTO `t_kelas` VALUES ('XI IPA 2', '132108283', '2', 'IPA');
INSERT INTO `t_kelas` VALUES ('XI IPA 3', '132108312', '2', 'IPA');
INSERT INTO `t_kelas` VALUES ('XI IPA 4', '131975019', '2', 'IPA');
INSERT INTO `t_kelas` VALUES ('XI IPA 5', '132108298', '2', 'IPA');
INSERT INTO `t_kelas` VALUES ('XI IPS 1', '131630516', '2', 'IPS');
INSERT INTO `t_kelas` VALUES ('XI IPS 2', '132122049', '2', 'IPS');
INSERT INTO `t_kelas` VALUES ('XI IPS 3', '131813622', '2', 'IPS');
INSERT INTO `t_kelas` VALUES ('XII IPA 1', '400001002', '3', 'IPA');
INSERT INTO `t_kelas` VALUES ('XII IPA 2', '400001003', '3', 'IPA');
INSERT INTO `t_kelas` VALUES ('XII IPA 3', '132105436', '3', 'IPA');
INSERT INTO `t_kelas` VALUES ('XII IPA 4', '131975072', '3', 'IPA');
INSERT INTO `t_kelas` VALUES ('XII IPA 5', '131286221', '3', 'IPA');
INSERT INTO `t_kelas` VALUES ('XII IPS 1', '131850412', '3', 'IPS');
INSERT INTO `t_kelas` VALUES ('XII IPS 2', '132122031', '3', 'IPS');
INSERT INTO `t_kelas` VALUES ('XII IPS 3', '131683538', '3', 'IPS');
INSERT INTO `t_kelas` VALUES ('XI BHS 1', '400001001', '2', 'Bahasa');
INSERT INTO `t_kelas` VALUES ('XI BHS 2', '400001001', '2', 'Bahasa');
INSERT INTO `t_kelas` VALUES ('XII BHS 1', '400001002', '3', 'Bahasa');
INSERT INTO `t_kelas` VALUES ('XII BHS 2', '196805181995121004', '3', 'Bahasa');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_laporan`
-- 

CREATE TABLE `t_laporan` (
  `idlap` int(10) NOT NULL auto_increment,
  `tgl_kirim` date default NULL,
  `judul` varchar(250) collate latin1_general_ci default NULL,
  `file` varchar(20) collate latin1_general_ci default NULL,
  `status` varchar(1) collate latin1_general_ci default NULL,
  `nip` varchar(25) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`idlap`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_laporan`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_link`
-- 

CREATE TABLE `t_link` (
  `id` int(10) NOT NULL auto_increment,
  `alamat` varchar(200) collate latin1_general_ci NOT NULL default '',
  `ket` text collate latin1_general_ci,
  `jenis` int(5) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=16 ;

-- 
-- Dumping data for table `t_link`
-- 

INSERT INTO `t_link` VALUES (7, 'www.ilmukomputer.com', 'website yang berisikan tutorial seputar TIK', 3);
INSERT INTO `t_link` VALUES (8, 'www.sekolahIndonesia.com', 'SekolahIndonesia.com adalah portal pendidikan yang memuat secara lengkap dan terperinci seluruh data sekolah dan murid yang telah menjadi anggota Proyek Sistem Informasi Akademik Sekolah Online.', 6);
INSERT INTO `t_link` VALUES (9, 'www.unpad.ac.id', 'website Universitas Padjadjaran', 11);
INSERT INTO `t_link` VALUES (10, 'www.dikmenum.go.id', 'Website resmi Dikmenum ', 1);
INSERT INTO `t_link` VALUES (3, 'www.jabar.go.id', 'Website resmi Propinsi Jawa Barat', 1);
INSERT INTO `t_link` VALUES (12, 'http://www.thinkquest.com', 'Thinkquest merupakan kumpulan project siswa-siswa sedunia yang dimiliki oleh ORACLE', 4);
INSERT INTO `t_link` VALUES (5, 'www.sekolah2000.or.id', '-', 2);
INSERT INTO `t_link` VALUES (6, 'www.kajianwebsite.net', 'website yang terdapat beberapa project interaktif untuk aktivitas siswa dengan beberapa negara', 4);
INSERT INTO `t_link` VALUES (2, 'www.bandung.go.id', 'Website resmi Kota Bandung', 1);
INSERT INTO `t_link` VALUES (1, 'www.kemdiknas.go.id', 'Website resmi Dinas Pendidikan Nasional', 1);
INSERT INTO `t_link` VALUES (11, 'http:/www.alcobindonesia.org', '-', 2);
INSERT INTO `t_link` VALUES (13, 'www.sman4bdg.sch.id', 'Website resmi SMA Negeri 4 Bandung', 5);
INSERT INTO `t_link` VALUES (14, 'www.smkyappi-wns.sch.id/', 'Website remsi SMK Yappi Gunung Kidul', 5);

-- --------------------------------------------------------

-- 
-- Table structure for table `t_member`
-- 

CREATE TABLE `t_member` (
  `userid` int(10) NOT NULL auto_increment,
  `nama` varchar(30) collate latin1_general_ci NOT NULL default '',
  `tgllahir` varchar(12) collate latin1_general_ci NOT NULL default '',
  `kelamin` char(1) collate latin1_general_ci NOT NULL default '',
  `kerja` varchar(20) collate latin1_general_ci NOT NULL default '',
  `alamat` varchar(100) collate latin1_general_ci NOT NULL default '',
  `negara` char(3) collate latin1_general_ci NOT NULL default '',
  `telp` varchar(30) collate latin1_general_ci NOT NULL default '',
  `sekolah` varchar(50) collate latin1_general_ci NOT NULL default '',
  `homepage` varchar(50) collate latin1_general_ci NOT NULL default '',
  `profil` text collate latin1_general_ci NOT NULL,
  `username` varchar(50) collate latin1_general_ci NOT NULL default '',
  `password` varchar(50) collate latin1_general_ci NOT NULL default '',
  `email` varchar(60) collate latin1_general_ci NOT NULL default '',
  `pengingat` char(1) collate latin1_general_ci NOT NULL default '',
  `jawaban` varchar(30) collate latin1_general_ci NOT NULL default '',
  `kategori` char(2) collate latin1_general_ci NOT NULL default '',
  `status` char(1) collate latin1_general_ci NOT NULL default '',
  `tgl_login` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `nis` varchar(25) collate latin1_general_ci NOT NULL default '',
  `kelas` varchar(10) collate latin1_general_ci NOT NULL default '',
  `ket` varchar(10) collate latin1_general_ci NOT NULL default '',
  `stblog` char(1) collate latin1_general_ci NOT NULL default '0',
  `kunjungblog` int(10) NOT NULL default '1',
  `point` int(11) default '0',
  `stlogin` varchar(1) collate latin1_general_ci default '0',
  `totlogin` int(11) default '0',
  `ip` varchar(16) collate latin1_general_ci default NULL,
  `stprofil` varchar(4) collate latin1_general_ci default 'open',
  `setfacebook` varchar(100) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=19 ;

-- 
-- Dumping data for table `t_member`
-- 

INSERT INTO `t_member` VALUES (2, 'Dody Firmansyah', '01-01-1983', 'm', 'Guru', 'Jl. Kol Enjo Martadisastra No.15 Bogor', 'Ind', '081317579751', 'SMK Negeri 1 Bogor', 'www.kickdody.com', 'Web Programming, 3 Dimensi dan Visual Efek', 'kickdody@yahoo.com', '0004d0b59e19461ff126e3a08a814c33', 'kickdody@yahoo.com', '1', 'aa', '2', '1', '2009-10-29 22:22:47', '400001002', '-', 'Guru', '0', 1, 103, '0', 41, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (1, 'BAYU ALI AKBAR', '03-02-1993', 'm', 'Siswa', 'Jl. Bojongkokosan No.24 Antapani Bandung2', 'Ind', '32423423', 'SMA NEGERI 4 BANDUNG', 'bayu.wordpress.com', 'saya adalah .....', '070810120', 'e10adc3949ba59abbe56e057f20f883e', 'alan@alanrm.net', '2', '123456', '1', '1', '2011-04-28 21:01:26', '070810120', 'X - 4', 'Siswa', '1', 7, 823, '0', 174, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (3, 'Alan Ridwan M', '01-01-1981', 'm', 'Guru', 'Jl. Bojongkokosan No.24 Antapani Bandung', 'Ind', '085624070482', 'SMA NEGERI 4 BANDUNG', 'www.alanrm.com', 'Web Programming', 'alanrm82@yahoo.com', '51f3eb940fd73a19119534c063967bff', 'alanrm82@yahoo.com', '1', 'a', '3', '1', '2012-11-26 18:53:51', '400001001', 'undefined', 'Guru', '1', 7, 296, '1', 155, '127.0.0.1', 'open', 'tidak');
INSERT INTO `t_member` VALUES (7, 'Drs. Choirul Anam, S.ST', '01-01-1995', 'm', 'Guru', 'Jl. Tenggiri X/1 Minomartani, Sleman Yogyakarta.', 'ID', '08121563213', 'SMK YAPPI Wonosari', 'www.choirulyogya.wordpress.com', '-', 'choirulyogya', 'e10adc3949ba59abbe56e057f20f883e', 'choirulyogya@yahoo.com', '1', '1', '3', '1', '2009-10-29 22:25:25', '196105221984031005', '-', 'Guru', '0', 1, 4, '0', 3, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (8, 'Warjana, S.Pd', '01-01-1995', 'm', 'Guru', 'Jl. Perum Taman Sedayu Blok B 12 A Bantul Yogyakarta', 'ID', '08157915641', 'SMK Negeri 2 Yogyakarta', 'www.warjana.wordpress.com', '-', 'wardjana', 'e10adc3949ba59abbe56e057f20f883e', 'wardjana@yahoo.com', '1', '1', '1', '1', '2009-10-29 22:26:15', '196605202006041001', '-', 'Guru', '0', 1, 2, '0', 1, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (10, 'Yulianto Sri Utomo, S.Kom', '01-01-1995', 'm', '', 'Jl. Bimo martani ngemplak Yogyakarta', 'ID', '085697111588', '', '', '', 'tomi', 'e10adc3949ba59abbe56e057f20f883e', 'yulianto_sri_utomo@yahoo.com', '1', '1', '0', '1', '2009-10-29 22:28:14', '400001004', '-', 'Guru', '0', 1, 3, '0', 2, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (4, 'Taufik N. Syah, S.Pd', '01-01-1995', 'm', 'Guru', 'Komplek Timah Jl. Margasatwa, Pondok Labu Jakarta Selatan ', 'ID', '08881869114', 'SMKN 41 Jakarta', '-', 'SMKN 41 Jakarta', 'taufik', 'e10adc3949ba59abbe56e057f20f883e', 'taufikns@cbn.net.id', '1', '1', '3', '1', '2009-10-29 22:21:37', '400001003', '-', 'Guru', '0', 1, 4, '0', 3, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (12, 'Agung Purnomo', '01-01-1995', 'm', 'Guru', 'Bandung', 'ID', '-', '-', '-', '-', 'alumni', 'e10adc3949ba59abbe56e057f20f883e', 'root23it@yahoo.co.id', '1', '1', '1', '1', '2009-10-29 22:40:20', '', '2008', 'Alumni', '0', 1, 3, '0', 2, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (5, 'Siswanto, S.Pd', '01-01-1995', 'm', 'Guru', 'Jl. Kapi anala 4 Malang', 'ID', '081233081768', 'SMA Negeri 10 Malang', 'www.tesdigital.com', 'siswanto-mlg@telkom.net', 'siswanto', 'e10adc3949ba59abbe56e057f20f883e', 'siswanto-mlg@telkom.net', '1', '1', '0', '1', '2009-10-29 22:21:11', '196805181995121004', '-', 'Guru', '0', 1, 3, '0', 2, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (9, 'Drs. H. Cucu Saputra, M.M.Pd', '01-01-1995', 'm', 'Guru', '-', 'Ind', '-', 'SMA NEGERI 4 BANDUNG', '-', '-', 'kepsek', '5d2c2cee8ab0b9a36bd1ed7196bd6c4a', 'cs_muasa@yahoo.com', '1', '1', '4', '1', '2009-10-29 22:40:03', '131853696', '', 'Admin', '0', 1, 9, '0', 8, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (6, 'Wuryanta', '01-01-1995', 'm', 'Guru', 'Jl. Saluyu Indah XVII No 140 Riung Bandung', 'ID', '081320454229', 'SMA Negeri 4 Bandung', '-', '-', 'masjava', 'e10adc3949ba59abbe56e057f20f883e', 'mas_java2@yahoo.com', '1', '1', '3', '1', '2009-10-29 22:20:46', '196504281989121001', '-', 'Guru', '0', 1, 5, '0', 4, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (11, 'Hafidz Muksin', '01-01-1995', 'm', '-', '-', 'ID', '-', '-', '-', '-', 'orangtua', 'e10adc3949ba59abbe56e057f20f883e', 'aa@aa.com', '1', '1', '1', '1', '2009-10-29 22:34:07', '05061005', '-', 'Orang Tua', '0', 1, 3, '0', 2, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (16, 'ANNY MAULINA', '01/01/2008', 'f', '', '-', 'ID', '-', 'SMA Negeri 4 Bandung', '', '', '070810005', '95e62984b87e90645a5cf77037395959', 'aa@aa.com', '1', '1', '1', '1', '2012-11-26 15:34:48', '070810005', 'X - 1', 'Siswa', '0', 1, 3, '0', 3, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (17, 'agung saja', '', 'm', '', '', 'ID', '085793259558', '', '', '', 'ii@ii.com', '5e7d00134ba3a8b3e37edf5038bc51fc', 'ii@ii.com', '1', '1', '2', '1', '2012-11-26 15:07:21', '070810005', 'X - 1', 'Orang Tua', '0', 1, 0, '0', 0, NULL, 'open', NULL);
INSERT INTO `t_member` VALUES (18, 'ADIMAS FIQRI RAMDHANSYA', '01/01/2008', 'm', '', '-', 'ID', '-', 'SMA Negeri 4 Bandung', '', '', '070810119', '6d9c547cf146054a5a720606a7694467', 'aa@aaaaaa.com', '1', '1', '1', '1', '2012-11-26 19:24:34', '070810119', 'X - 4', 'Siswa', '0', 1, 15, '1', 15, '127.0.0.1', 'open', NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `t_memberfoto`
-- 

CREATE TABLE `t_memberfoto` (
  `idfoto` int(11) NOT NULL auto_increment,
  `idalbum` int(11) default NULL,
  `tanggal` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `judul` varchar(255) collate latin1_general_ci default NULL,
  `stopen` varchar(1) collate latin1_general_ci default '0',
  PRIMARY KEY  (`idfoto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_memberfoto`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_memberfoto_album`
-- 

CREATE TABLE `t_memberfoto_album` (
  `idalbum` int(11) NOT NULL auto_increment,
  `userid` int(10) default NULL,
  `keterangan` varchar(255) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`idalbum`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_memberfoto_album`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_memberfoto_kom`
-- 

CREATE TABLE `t_memberfoto_kom` (
  `idfotokom` int(11) NOT NULL auto_increment,
  `idfoto` int(11) default NULL,
  `userid` int(10) default NULL,
  `komentar` varchar(255) collate latin1_general_ci default NULL,
  `tanggal` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`idfotokom`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_memberfoto_kom`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_membergroup`
-- 

CREATE TABLE `t_membergroup` (
  `idgroup` int(11) NOT NULL auto_increment,
  `nmgroup` varchar(100) collate latin1_general_ci NOT NULL,
  `ket` varchar(255) collate latin1_general_ci default NULL,
  `tanggal` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `stgroup` varchar(1) collate latin1_general_ci default '0' COMMENT '0=terbuka atau 1=tertutup',
  `idjenis` int(11) default NULL,
  `userid` int(10) default NULL,
  PRIMARY KEY  (`idgroup`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_membergroup`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_membergroup_anggota`
-- 

CREATE TABLE `t_membergroup_anggota` (
  `idgroup` int(11) NOT NULL,
  `userid` int(10) NOT NULL,
  `tanggal` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `kategori` varchar(1) collate latin1_general_ci default '0' COMMENT '0=biasa , 1=petugas/moderator',
  `status` varchar(1) collate latin1_general_ci default '0' COMMENT '0=diajak orang/invite ,1=ok,2=mengajukan ikut bergabung'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `t_membergroup_anggota`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_membergroup_diskusi`
-- 

CREATE TABLE `t_membergroup_diskusi` (
  `idtopik` int(11) NOT NULL auto_increment,
  `idgroup` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `userid` int(10) NOT NULL,
  `judul` varchar(100) collate latin1_general_ci default NULL,
  `isi` text collate latin1_general_ci,
  PRIMARY KEY  (`idtopik`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_membergroup_diskusi`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_membergroup_diskusibalas`
-- 

CREATE TABLE `t_membergroup_diskusibalas` (
  `idbalas` int(11) NOT NULL auto_increment,
  `idtopik` int(11) default NULL,
  `tanggal` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `userid` int(10) default NULL,
  `isi` text collate latin1_general_ci,
  PRIMARY KEY  (`idbalas`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_membergroup_diskusibalas`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_membergroup_info`
-- 

CREATE TABLE `t_membergroup_info` (
  `idgroupinfo` int(11) NOT NULL auto_increment,
  `judul` varchar(100) collate latin1_general_ci default NULL,
  `idgroup` int(11) default NULL,
  `isi` text collate latin1_general_ci,
  `userid` int(10) default NULL,
  `tanggal` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`idgroupinfo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_membergroup_info`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_membergroup_infokom`
-- 

CREATE TABLE `t_membergroup_infokom` (
  `idinfokom` int(11) NOT NULL auto_increment,
  `idgroupinfo` int(11) default NULL,
  `userid` int(10) default NULL,
  `komentar` varchar(255) collate latin1_general_ci default NULL,
  `tanggal` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`idinfokom`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_membergroup_infokom`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_membergroup_jenis`
-- 

CREATE TABLE `t_membergroup_jenis` (
  `idjenis` int(11) NOT NULL auto_increment,
  `jenis` varchar(100) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`idjenis`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `t_membergroup_jenis`
-- 

INSERT INTO `t_membergroup_jenis` VALUES (1, 'Kelas di Sekolah');
INSERT INTO `t_membergroup_jenis` VALUES (2, 'Kegiatan Sekolah');
INSERT INTO `t_membergroup_jenis` VALUES (3, 'Mata Pelajaran');
INSERT INTO `t_membergroup_jenis` VALUES (4, 'Ekstrakurikuler');
INSERT INTO `t_membergroup_jenis` VALUES (5, 'Group Alumni');
INSERT INTO `t_membergroup_jenis` VALUES (6, 'Group Komunitas');
INSERT INTO `t_membergroup_jenis` VALUES (7, 'Umum');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_memberlihat`
-- 

CREATE TABLE `t_memberlihat` (
  `idlihat` int(11) NOT NULL auto_increment,
  `userid` int(10) default NULL,
  `userlihat` int(10) default NULL,
  `tanggal` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`idlihat`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AVG_ROW_LENGTH=1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_memberlihat`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_memberstatus`
-- 

CREATE TABLE `t_memberstatus` (
  `idstatus` int(11) NOT NULL auto_increment,
  `userid` int(10) default NULL,
  `tanggal` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `pengirim` int(10) default NULL,
  `pesan` varchar(255) collate latin1_general_ci default NULL,
  `jenis` varchar(1) collate latin1_general_ci default '0',
  PRIMARY KEY  (`idstatus`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=17 ;

-- 
-- Dumping data for table `t_memberstatus`
-- 

INSERT INTO `t_memberstatus` VALUES (1, 1, '2009-10-27 00:21:52', 1, 'akhiiirny ngntuuk juga', '0');
INSERT INTO `t_memberstatus` VALUES (2, 3, '2009-10-29 21:52:07', 3, 'Hari yang melelahkan..tetap semangat', '0');
INSERT INTO `t_memberstatus` VALUES (3, 5, '2009-10-29 22:04:34', 5, 'Malang...hujan gede...', '0');
INSERT INTO `t_memberstatus` VALUES (4, 4, '2009-10-29 22:05:05', 4, 'Macet juga deh Depok...', '0');
INSERT INTO `t_memberstatus` VALUES (5, 2, '2009-10-29 22:07:01', 2, 'mm...bogor ujan lagi...trusss', '0');
INSERT INTO `t_memberstatus` VALUES (6, 6, '2009-10-29 22:09:08', 6, 'ya...ditinggal lagi dehhh...', '0');
INSERT INTO `t_memberstatus` VALUES (7, 7, '2009-10-29 22:23:43', 7, 'Ayoo..Yogya..gabung yuu', '0');
INSERT INTO `t_memberstatus` VALUES (8, 8, '2009-10-29 22:25:55', 8, 'Wah..dimana nihhh', '0');
INSERT INTO `t_memberstatus` VALUES (9, 10, '2009-10-29 22:28:08', 10, 'waduh...kembali ke alam nihh', '0');
INSERT INTO `t_memberstatus` VALUES (10, 11, '2009-10-29 22:28:33', 11, 'Haloo temen-temen', '0');
INSERT INTO `t_memberstatus` VALUES (11, 12, '2009-10-29 22:30:31', 12, 'mm.. ngapain ya dikantor..?', '0');
INSERT INTO `t_memberstatus` VALUES (12, 9, '2009-10-29 22:34:33', 9, 'Selamat Pagi..anak-anak..', '0');
INSERT INTO `t_memberstatus` VALUES (13, 3, '2011-04-02 19:52:37', 3, 'test coba', '0');
INSERT INTO `t_memberstatus` VALUES (14, 3, '2011-04-02 20:04:31', 3, 'teeessss', '0');
INSERT INTO `t_memberstatus` VALUES (15, 3, '2011-04-02 20:05:15', 3, 'test lg', '0');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_memberstatus_kom`
-- 

CREATE TABLE `t_memberstatus_kom` (
  `idstatuskom` int(11) NOT NULL auto_increment,
  `idstatus` int(11) NOT NULL,
  `userid` int(10) NOT NULL,
  `tanggal` datetime default NULL,
  `pesan` varchar(200) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`idstatuskom`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AVG_ROW_LENGTH=1 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `t_memberstatus_kom`
-- 

INSERT INTO `t_memberstatus_kom` VALUES (1, 11, 3, '2009-10-29 22:41:28', 'nah gitu kerja ya...');
INSERT INTO `t_memberstatus_kom` VALUES (2, 1, 3, '2009-10-29 22:47:36', 'belajar yang benar ya..');
INSERT INTO `t_memberstatus_kom` VALUES (3, 11, 3, '2009-12-21 15:08:52', 'dfgvds');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_member_contact`
-- 

CREATE TABLE `t_member_contact` (
  `id` int(10) NOT NULL auto_increment,
  `id_master` int(10) NOT NULL default '0',
  `id_con` int(10) NOT NULL default '0',
  `status` char(1) collate latin1_general_ci NOT NULL default '0' COMMENT '0=status blm distujui, 1=sudah ok\r\n2=blok',
  `host` int(11) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=31 ;

-- 
-- Dumping data for table `t_member_contact`
-- 

INSERT INTO `t_member_contact` VALUES (1, 3, 2, '1', 0);
INSERT INTO `t_member_contact` VALUES (2, 3, 7, '1', 0);
INSERT INTO `t_member_contact` VALUES (3, 3, 6, '1', 0);
INSERT INTO `t_member_contact` VALUES (4, 3, 10, '1', 0);
INSERT INTO `t_member_contact` VALUES (5, 3, 5, '1', 0);
INSERT INTO `t_member_contact` VALUES (6, 3, 8, '1', 0);
INSERT INTO `t_member_contact` VALUES (7, 3, 11, '1', 0);
INSERT INTO `t_member_contact` VALUES (8, 5, 3, '1', 0);
INSERT INTO `t_member_contact` VALUES (9, 4, 3, '1', 0);
INSERT INTO `t_member_contact` VALUES (10, 6, 3, '1', 0);
INSERT INTO `t_member_contact` VALUES (11, 2, 3, '1', 0);
INSERT INTO `t_member_contact` VALUES (12, 3, 4, '1', 0);
INSERT INTO `t_member_contact` VALUES (13, 7, 3, '1', 0);
INSERT INTO `t_member_contact` VALUES (14, 7, 2, '0', 0);
INSERT INTO `t_member_contact` VALUES (15, 7, 4, '0', 0);
INSERT INTO `t_member_contact` VALUES (16, 7, 6, '0', 0);
INSERT INTO `t_member_contact` VALUES (17, 8, 3, '1', 0);
INSERT INTO `t_member_contact` VALUES (18, 10, 3, '1', 0);
INSERT INTO `t_member_contact` VALUES (19, 11, 3, '1', 0);
INSERT INTO `t_member_contact` VALUES (20, 11, 2, '0', 0);
INSERT INTO `t_member_contact` VALUES (21, 11, 4, '0', 0);
INSERT INTO `t_member_contact` VALUES (22, 12, 3, '1', 0);
INSERT INTO `t_member_contact` VALUES (23, 12, 9, '0', 0);
INSERT INTO `t_member_contact` VALUES (24, 12, 11, '1', 0);
INSERT INTO `t_member_contact` VALUES (25, 11, 12, '1', 0);
INSERT INTO `t_member_contact` VALUES (26, 9, 12, '1', 0);
INSERT INTO `t_member_contact` VALUES (27, 12, 9, '1', 0);
INSERT INTO `t_member_contact` VALUES (28, 3, 12, '1', 0);
INSERT INTO `t_member_contact` VALUES (29, 3, 1, '1', 0);
INSERT INTO `t_member_contact` VALUES (30, 1, 3, '1', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `t_member_custom`
-- 

CREATE TABLE `t_member_custom` (
  `userid` int(10) NOT NULL,
  `bgbody` text collate latin1_general_ci,
  `widgetkanan` text collate latin1_general_ci,
  `widgetkiri` text collate latin1_general_ci,
  PRIMARY KEY  (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `t_member_custom`
-- 

INSERT INTO `t_member_custom` VALUES (1, 'body { /* background gambar */\r\n	font-family: "Arial", serif;\r\n	font-size: 76%;\r\n	margin-top: 0px;\r\n	color:#666666;\r\n	background: #fff url(profil/back1.jpg);\r\n}\r\n#konten {   /* lebar layout web tengah */\r\n	width:900px;				\r\n	margin-left: auto;\r\n	margin-right: auto;\r\n	background-color:#FFFFFF;\r\n}', NULL, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `t_member_games`
-- 

CREATE TABLE `t_member_games` (
  `idgames` int(11) NOT NULL auto_increment,
  `judul` varchar(50) collate latin1_general_ci default NULL,
  `ket` varchar(200) collate latin1_general_ci default NULL,
  `visit` int(11) default '0',
  `kategori` varchar(20) collate latin1_general_ci default NULL,
  `jenis` varchar(1) collate latin1_general_ci default '0' COMMENT '0=file flash, 1=iframe ke website laen',
  `link` varchar(225) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`idgames`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=24 ;

-- 
-- Dumping data for table `t_member_games`
-- 

INSERT INTO `t_member_games` VALUES (1, '3D Rally', 'Balap mobil rally', 2, 'Balapan', '0', NULL);
INSERT INTO `t_member_games` VALUES (2, 'Virtual Champions League', 'Liga Sepakbola online', 1, 'Olahraga', '0', NULL);
INSERT INTO `t_member_games` VALUES (3, 'Motor Cross', 'Motor rintangan', 0, 'Balapan', '0', NULL);
INSERT INTO `t_member_games` VALUES (4, 'The Classroom', 'Games kondisi di ruang kelas', 0, 'Teka-teki', '0', NULL);
INSERT INTO `t_member_games` VALUES (5, 'Marios Adventure 2', 'Petualangan Mario Bross', 2, 'Petualangan', '0', NULL);
INSERT INTO `t_member_games` VALUES (6, 'Mini Pingpong', 'Bermain pingpong online', 1, 'Olahraga', '0', NULL);
INSERT INTO `t_member_games` VALUES (7, 'Bolling', 'Pemainan Bolling', 15, 'Olahraga', '0', NULL);
INSERT INTO `t_member_games` VALUES (8, 'Catur', 'Bermain catur dengan komputer', 1, 'Teka-teki', '0', NULL);
INSERT INTO `t_member_games` VALUES (9, 'Cheatmaster', 'Cheatmaster room', 0, 'Lain-lain', '0', NULL);
INSERT INTO `t_member_games` VALUES (10, 'Fish Tales', 'Permainan Ikan ', 1, 'Lain-lain', '0', NULL);
INSERT INTO `t_member_games` VALUES (11, 'Sudoku', 'Permainan menyusun angka', 0, 'Teka-teki', '0', NULL);
INSERT INTO `t_member_games` VALUES (12, 'Tennis Lapangan', 'Permainan Tennis Lapangan', 7, 'Olahraga', '0', NULL);
INSERT INTO `t_member_games` VALUES (13, 'The Farmer', 'Permainan berkebun', 1, 'Petualangan', '0', NULL);
INSERT INTO `t_member_games` VALUES (14, 'Burger Restaurant', 'Permainan Menjadi pelayanan restoran', 0, 'Petualangan', '0', NULL);
INSERT INTO `t_member_games` VALUES (15, 'Ambulance Race.', 'Balap Ambulan', 1, 'Balapan', '0', NULL);
INSERT INTO `t_member_games` VALUES (16, 'Fruit Twirls', 'Permainan seperti Zuma', 0, 'Teka-teki', '0', NULL);
INSERT INTO `t_member_games` VALUES (17, 'Uno Card', 'Permainan kartu', 0, 'Teka-teki', '0', NULL);
INSERT INTO `t_member_games` VALUES (18, 'Janes Hotel', 'Permainan menjadi pelayan di Hotel', 0, 'Petualangan', '0', NULL);
INSERT INTO `t_member_games` VALUES (19, 'Mommy Challenge', 'Permainan menjadi seorang Ibu', 0, 'Petualangan', '0', NULL);
INSERT INTO `t_member_games` VALUES (20, 'Penguin Diner', 'Permainan menjadi pelayanan ', 0, 'Petualangan', '0', NULL);
INSERT INTO `t_member_games` VALUES (21, 'Parkir Perfection', 'Parkir Perfection', 2, 'Lain-lain', '0', NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `t_member_pesan`
-- 

CREATE TABLE `t_member_pesan` (
  `id` int(10) NOT NULL auto_increment,
  `judul` varchar(60) collate latin1_general_ci NOT NULL default '',
  `pesan` text collate latin1_general_ci,
  `userid` int(10) NOT NULL default '0',
  `tgl` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `status` char(1) collate latin1_general_ci NOT NULL default '0' COMMENT '0=baru ngirim, 1 udah dibuka',
  `semua` char(1) collate latin1_general_ci NOT NULL default '0' COMMENT '0=tidak semua, 1=semua teman dikirim',
  `tujuan_id` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_member_pesan`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_mengajar`
-- 

CREATE TABLE `t_mengajar` (
  `idajar` int(11) NOT NULL auto_increment,
  `nip` varchar(25) collate latin1_general_ci default NULL,
  `kelas` varchar(10) collate latin1_general_ci default NULL,
  `pel` varchar(30) collate latin1_general_ci default NULL,
  `program` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`idajar`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=15 ;

-- 
-- Dumping data for table `t_mengajar`
-- 

INSERT INTO `t_mengajar` VALUES (1, '400001001', 'XII IPA 1', 'Matematika', NULL);
INSERT INTO `t_mengajar` VALUES (2, '400001001', 'XII IPA 2', 'Matematika', NULL);
INSERT INTO `t_mengajar` VALUES (7, '400001002', 'X - 2', 'B. Inggris', '-');
INSERT INTO `t_mengajar` VALUES (9, '400001001', 'X - 4', 'BK', '-');
INSERT INTO `t_mengajar` VALUES (13, '400001002', 'X - 4', 'Matematika', NULL);
INSERT INTO `t_mengajar` VALUES (14, '400001001', 'X - 1', 'Matematika', NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `t_news`
-- 

CREATE TABLE `t_news` (
  `id` int(10) NOT NULL auto_increment,
  `isi` longtext collate latin1_general_ci,
  `subject` text collate latin1_general_ci,
  `pengirim` varchar(40) collate latin1_general_ci default NULL,
  `posttime` varchar(20) collate latin1_general_ci default NULL,
  `postdate` varchar(20) collate latin1_general_ci NOT NULL default '',
  `visits` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=26 ;

-- 
-- Dumping data for table `t_news`
-- 

INSERT INTO `t_news` VALUES (17, '<div class="views-field-field-berita-isi-value">\r\n<div class="field-content">\r\n<p class="rtejustify">Jakarta --- Persiapan perubahan kurikulum sudah memasuki tahap uji publik pada Desember ini. Kemarin, (11/12), Menteri Pendidikan dan Kebudayaan Mohammad Nuh melaporkan perkembangan persiapan Kurikulum 2013 kepada Wakil Presiden Boediono, selaku Ketua Komite Pendidikan. &ldquo;Kami melaporkan yang sudah dan sedang dilaksanakan, dan yang akan datang di akhir tahun,&rdquo; ujar Mendikbud kemarin sore, di ruangannya.</p>\r\n<p class="rtejustify">Menteri Nuh melaporkan, persiapan kurikulum untuk standar kompetensi lulusan, perumusan kompetensi dasar, dan struktur kurikulum untuk tingkat SD dan SMP sudah selesai. Namun untuk tingkat SMA masih dalam proses. Kepada Wapres Boediono, ia juga memberikan laporan terkini tentang hasil Uji Publik Kurikulum 2013 secara online, melalui alamat <a href="http://kurikulum2013.kemdikbud.go.id/">http://kurikulum2013.kemdikbud.go.id</a>.</p>\r\n<p class="rtejustify">Berdasarkan data per 10 Desember 2012, pukul 15.00 WIB, terdapat sekitar enam ribu pengunjung aktif situs uji publik Kurikulum 2013. &ldquo;Ada 6172 yang aktif dan 3132 yang memberikan komentar. Komentarnya juga bukan sekedar komentar. Ini panjang-panjang. Itu yang menarik . Orang kalau nggak tertarik ngapain ngasih komentar,&rdquo; imbuhnya.</p>\r\n<p class="rtejustify">Ia menjelaskan, komentar-komentar yang masuk dari masyarakat tersebut sebagian besar bernada positif. Komentar-komentar tersebut akan disatukan menjadi buku, sesuai sistematika, sehingga bisa menjadi dokumen. &ldquo;Nanti ada bukti sejarah. Pertama kali kita mengembangkan kurikulum dengan uji publik. Hasil pandangan publik seperti ini. Itu menjadi dokumen. Sejarah. Ada partisipasi publik&rdquo;.</p>\r\n<p class="rtejustify">Selain melaporkan hasil uji publik, Menteri Nuh juga membahas strategi implementasi kurikulum baru dengan Wapres. Ada empat hal yang dibahas mengenai impelmentasi, yaitu dokumen kurikulum, persiapan buku, persiapan guru, dan jadwal induk. Namun, yang menjadi fokus pembicaraan dengan orang nomor dua di Indonesia tersebut adalah mengenai persiapan guru. Wapres Boediono meminta Mendikbud mematangkan konsep dalam persiapan guru menghadapi perubahan kurikulum. &ldquo;Wapres memberikan penekanan di situ,&rdquo; katanya. (DM)</p>\r\n</div>\r\n</div>', 'Mendikbud Laporkan Perkembangan Kurikulum ke Wapres', '3', '12:08:42', '12/16/2012', 1);
INSERT INTO `t_news` VALUES (24, '<div class="views-field-field-berita-isi-value">\r\n<div class="field-content">\r\n<p class="rtejustify">Jakarta --- Konsep pelatihan para guru dalam menghadapi kurikulum 2013 akan dilakukan dengan menggunakan metode master teacher. Guru-guru berprestasi dan memiliki skill atau kemampuan mengajar yang baik akan dilatih terlebih dahulu untuk kemudian menyampaikan ilmu yang didapat kepada guru yang lain. "Bisa guru juara lomba nasional, guru teladan nasional, guru terbaik di sekolah-sekolah swasta, negeri, sekolah internasional, ada juga sebagian dosen dan praktisi sebagai pelatih. Mereka yang akan memberikan pelatihan ke guru-guru yang akan menjadi master teacher," jelas Mendikbud Mohammad Nuh di ruangannya, pada Selasa (11/12) lalu.</p>\r\n<p>Tiga hal yang penting dalam pelatihan guru ini adalah materi pelatihan, target guru yang dilatih, dan metode pelatihan yang digunakan. Guru yang mendapat prioritas pelatihan adalah guru kelas I, IV, VII, dan X dengan materi seputar konsep kurikulum baru. "Sebenarnya, opsinya kan ada beberapa terkait teknis pelaksanaan. Tetapi, kemungkinan besar adalah diterapkan pada kelas I, IV, VII, dan X," ujar Menteri Nuh.</p>\r\n<p>Ia menjelaskan, setiap pelatihan nantinya akan selalu ada pre-test dan post test. "Dari situ kita lihat master teacher terbaik. Sehingga kita punya stok master teacher," katanya. Salah satu tujuan konsep master teacher ini adalah untuk menumbuhkan rasa percaya diri guru, dan memotivasi guru&nbsp; untuk berprestasi.</p>\r\n<p>Guru-guru yang akan dipilih untuk mengikuti pelatihan menjadi master teacher tidak hanya berasal dari kota besar, tetapi juga dari tingkat kabupaten. "Kita ingin membangun atmosfer supaya guru berlomba untuk berprestasi. Karirnya tidak hanya berupa tunjangan profesi, pangkat, tapi ada status yang lain, yaitu&nbsp;master teacher," tutur Menteri Nuh.</p>\r\n<p>Pelatihan guru akan dilakukan secara paralel dengan pelatihan master teacher, yaitu berupa angkatan. "Begitu angkatan satu master teacher selesai dan dinyatakan qualified, dia langsung terjun ke lapangan, training guru-guru di mana-mana," terang Mendikbud. Sementara angkatan master teacher yang pertama melakukan pelatihan untuk guru-guru, pelatihan angkatan kedua untuk master teacher terus dilakukan, dan seterusnya. Dalam menjalankan pelatihan guru tersebut, Kemdikbud akan terus menjamin quality control para guru yang menjadi peserta pelatihan. (DM)</p>\r\n</div>\r\n</div>', 'Master Teacher Jadi Konsep Pelatihan Guru untuk Hadapi Kurikulum 2013', '3', '13:05:09', '12/16/2012', NULL);
INSERT INTO `t_news` VALUES (18, '<p>Program Pendataan Pendidikan Menengah hingga saat ini telah berjalan sesuai dengan yang diharapkan, meskipun masih terdapat kendala dalam proses pelaksanaannya.</p>\r\n<p>&nbsp;</p>\r\n<p>Salah satu kendala yang <strong>cukup mengganggu adalah tentang NPSN</strong> yang belum dimiliki oleh beberapa sekolah, dari data yang ada, sekitar 4000 sekolah masih belum memiliki NPSN.</p>\r\n<p>&nbsp;</p>\r\n<p>Di sisi yang lain ditemukan bahwa data nama sekolah yang masuk tidak sesuai dengan standar format (nomenklatur) penamaan sekolah, demikian juga halnya dengan referensi wilayah.</p>\r\n<p>&nbsp;</p>\r\n<p>Dari hasil evaluasi tersebut, maka telah di ambil kebijakan perihal<strong> penerbitan NPSN secara otomatis</strong> oleh sistem serta tindakan untuk melakukan perbaikan format penamaan sekolah berikut referensi wilayahnya.</p>\r\n<p>&nbsp;</p>\r\n<p>Adapun layanan permintaan NPSN sudah dilakukan dengan system generate NPSN otomatis. Bagi sekolah yang belum memiliki NPSN ataupun sudah diharapkan mengecek ulang NPSN sekolah masing-masing dengan alamat link sebagai berikut http://pendataan.dikmen.kemdikbud.go.id/sipdikmen/html/npsn.php?id=npsn, sehingga dengan adanya NPSN tersebut diharapkan bagi sekolah yang belum mengirimkan/sinkron&nbsp; datanya untuk segera melakukan sinkronisasi keserver dikmen.(jls)</p>\r\n<p>&nbsp;</p>', 'Updating NPSN Pendataan Dikmen', '3', '13:09:43', '12/16/2012', NULL);
INSERT INTO `t_news` VALUES (19, '<p><span class="upperdeck"><span style="font-size: medium;">Pembangunannya diprioritaskan di kawasan timur Indonesia. </span></span> <span class="deskripsi"><span class="deskripsi">YOGYAKARTA--Pemerintah tampaknya serius mengedapankan sektor pendidikan dalam pembangunan tahun depan. Setidaknya hal ini bisa dilihat dari rencana pemerintah yang akan membangun 10 ribu ruang kelas baru (RKB) dan unit sekolah baru (USB) untuk mendukung pelaksanaan dan penuntasan wajib belajar pendidikan dasar sembilan tahun.</span></span></p>\r<BR><p align="justify">''''Pembangunan RKB dan UKB akan dilakukan secara bertahap mulai 2006,'''' kata Dirjen Manajemen Pendidikan Dasar dan Menengah (Mandikdasmen) Departemen Pendidikan Nasional, Suyanto, di Yogyakarta, Sabtu (19/11). Menurut dia, di sela-sela <em>sharing</em> desentralisasi pendidikan di Universitas Muhammadiyah Yogyakarta (UMY), pembangunan RKB dan USB akan diprioritaskan pada daerah yang angka partisipasi pendidikannya masih rendah atau kurang dari 60 persen dan daerah perbatasan, terutama di Kawasan Timur Indonesia (KTI) dan luar Jawa.</p>\r<BR><p align="justify">Ia mengatakan, pembangunan RKB dan USB membutuhkan dana yang tidak sedikit. Untuk membangun satu USB beserta sarana dan prasarananya saja, lanjut Suyanto, dibutuhkan dana sekitar Rp 1,7 miliar.</p>\r<BR><p align="justify">Selain membangun ruang kelas dan sekolah baru, pemerintah, kata dia, juga akan mengangkat sekitar 110 ribu guru bantu menjadi pegawai negeri sipil (PNS). ''''Namun, pemerintah tidak akan menambah jumlah guru bantu,'''' tandas Suyanto yang juga Rektor Universitas Negeri Yogyakarta (UNY) ini.</p>\r<BR><p align="justify">Pada acara <em>sharing</em> desentralisasi pendidikan, Suyanto mengatakan, UU No 22/1999 mengenai Desentralisasi Pendidikan yang diberikan pada pemerintah daerah menyebutkan bahwa penyelenggaraan pendidikan bukan saja termasuk urusan yang didesentralisasikan, tetapi menjadi urusan wajib. ''''Artinya, pusat wajib menyerahkan penyelenggaraan urusan itu kepada daerah, dan daerah tidak bisa menolak dengan alasan apa pun untuk menyelenggarakannya,'''' katanya.</p>\r<BR><p align="justify">Menurut dia, penyelenggaraan desantralisasi pendidikan yang diserahkan ke daerah di antaranya meliputi pembiayaan, pengelolaan atau manajemen pendidikan, dan kurikulum. ''''Namun, kesiapan daerah untuk melaksanakan kebijakan itu ternyata beragam. Ada daerah yang siap untuk melaksanakannya, ada pula daerah yang menghadapi kendala dalam mengimplementasikannya,'''' katanya.</p>\r<BR><p align="justify"><strong>SMP Rintisan </strong> Sebanyak 27 Sekolah Menengah Pertama (SMP) berstatus sekolah rintisan, yaitu sekolah yang jumlah siswanya maksimal 90 orang, di Kabupaten Sleman, Provinsi Daerah Istimewa Yogyakarta, memperoleh dana Bantuan Khusus Sekolah (BKS) dari pemerintah pusat masing-masing sebesar Rp 25 juta.</p>\r<BR><p align="justify">Kepala Bidang Pendidikan SMP Dinas Pendidikan Kabupaten Sleman, Tri Pujantoro, mengatakan pemanfaatan dana bantuan tersebut belum ada petunjuknya. Tetapi dana itu hanya diperbolehkan untuk biaya pengadaan sarana fisik sekolah, seperti pembelian komputer, pengadaan sarana laboratorium, dan biaya kegiatan sekolah, misalnya dana penambahan jam belajar bagi siswa pada sore hari.</p>\r<BR><p align="justify">''''Prinsispnya dana bantuan itu dapat dipergunakan untuk apa saja, tetapi yang bersifat menunjang kemajuan pendidikan, bukan untuk membangun atau merehab gedung sekolah,'''' ujar Tri.</p>\r<BR><p align="justify">Kepada sekolah penerima bantuan ini diminta memanfaatkan dana itu sebaik mungkin, sehingga dapat meningkatkan kualitas pendidikan yang akhirnya dapat meningkatkan status ke jenjang berikutnya.</p>\r<BR><p align="justify">Menurut Tri, sekarang ini ada beberapa status jenjang pendidikan tingkat SMP dan SMA, yaitu sekolah berstatus rintisan, potensial, sekolah standar nasional (SSN), dan sekolah berstatus standar internasional (SSI). ''''SMP dinyatakan berstatus rintisan manakala sekolah bersangkutan jumlah seluruh siswanya dari kelas I-III maksimal 90 siswa, dan untuk jenjang berikutnya ditentukan oleh kualitas pendidikannya dan pemberian jenjang status tersebut berlaku untuk semua sekolah SMP dan SMA/SMK negeri dan swasta,'''' katanya. (ant ) <strong><span class="tgl">Republika Senin,&nbsp;21 Nopember 2005</span></strong></p>', 'Depdiknas Bangun 10 Ribu Kelas dan Sekolah Baru ', '1', '22:32:44', '11/23/2005', NULL);
INSERT INTO `t_news` VALUES (20, '<p><font class="berita"> </font></p>\r\n<p><span style="font-size: medium;"><font class="berita"><strong><span class="judul">Banyak Guru-guru Lain yang Bisa Ditiru.</span></strong></font></span></p>\r\n<p><font class="berita">&quot;Hari<b> </b>yang bersejarah untuk saya,&quot; Begitu komentar Muslimah Hafsari Hamid binti K.A. Abdul Hamid (55), atau akrab disapa Bu Musmilah saat berbincang-bincang dengan Persda Network, di Jakarta, Selasa (2/12). </font></p>\r\n<p><font class="berita">Pernyataan itu dilontarkan Bu Muslimah sehubungan penghargaan Satyalencana Pendidikan yang baru saja diberikan Presiden Susilo Bambang Yudhoyono (SBY) pada acara puncak peringatan Hari Guru Nasional dan HUT Ke-63 PGRI, di Stadion Tennis Indoor, Gelora Bung Karno, Senayan pada pagi harinya. Selain Bu Muslimah, penghargaan serupa juga diberikan kepada ratusan guru lainnya.</font></p>\r\n<p><font class="berita">Terkait tokoh yang diceritakan dalam film dan novel laris Laskar Pelangi, karya Andrea Hirata, itu, SBY berpesan agar para guru meniru mental dan kreasi Bu Mulismah. Guru yang saat ini mengajar di SDN Gantong, Belitung, itu juga dianggap sebagai inspirator bagi Andrea Hirata. &quot;Jadilah bapak-bapak dan ibu-ibu menjadi Ibu Muslimah yang lain dengan banyak inisiatif, bermental baja untuk memberi semangat kepada murid-muridnya,&quot; kata SBY saat memberikan sambutan. <br />\r\nMendengar pernyataan tersebut, Muslimah mengaku bangga sekaligus kaget. Ia bangga karena menerima penghargaan satyalencana dan kaget mendengar pesan SBY.</font></p>\r\n<p><font class="berita">&quot;Banyak guru-guru lain yang bisa ditiru. Saya mohon maaf kepada guru-guru yang lain. Kalau memang ada yang bisa ditiru dan dicontoh, ya silakan saja. Saya tidak mengharapkan hal-hal yang berlebihan,&quot; ujar Muslimah.</font></p>\r\n<p><font class="berita">Muslimah mengatakan ia tidak pernah bermimpi untuk mendapatkan penghargaan Satyalencana Pendidikan. Penganugerahan itu pun diketahuinya sekitar dua minggu lalu lewat sebuah surat dari Departemen Pendidikan Nasional (Depdiknas). Dalam surat tersebut, Muslimah terlebih dahulu diminta mengirimkan sejumlah data.</font></p>\r\n<p><font class="berita">Ke depan, Muslimah mengaku akan berbuat lebih baik untuk dunia pendidikan tanah air, khususnya di tempat ia mengajar. Guru yang sebelumnya mengajar di SD Muhammadiyah Belitung itu juga mengajak seluruh guru di Indonesia melakukan hal yang sama. &quot;Mari kita berjuang semaksimal mungkin dengan hati,&quot; imbuhnya. (<strong>Persda Network/mun/ade</strong>)</font></p>\r\n<p><font class="berita">Sumber : http://tribunjabar.co.id</font></p>', 'Ibu Guru Laskar Pelangi Terima Satyalencana Pendidikan', '1', '07:29:46', '12/13/2008', 1);
INSERT INTO `t_news` VALUES (21, '<div align="justify" class="news">\r\n<p style="text-align: justify;"><strong>Jakarta, Selasa (7 Juli 2009) </strong>-- Pada Bulan Juli 2009 ini Indonesia kembali mengirimkan siswa - siswa sekolah menengah atas (SMA) ke olimpiade sains internasional. Sebanyak empat tim akan berlaga di bidang Fisika, Matematika, Biologi, dan Kimia.<br />\r\n<br />\r\nTim-tim yang akan berlaga membawa nama bangsa diterima Selasa (7/07/2009) oleh Direktur Jenderal Manajemen Pendidikan Dasar dan Menengah Depdiknas Suyanto di Gedung Depdiknas, Jakarta. <br />\r\n<br />\r\nPada bidang Fisika, Tim Olimpiade Fisika Indonesia (TOFI) akan berlaga di International Physics Olympiad (IPhO) ke-40 di Merida Yucatan, Meksiko pada 12 - 18 Juli 2009. Pembina pembina Yohanes Surya mengatakan, tim yang diberangkatkan adalah hasil seleksi Olimpiade Fisika Asia ke-10 di Bangkok, Thailand yang meraih dua medali emas, empat medali perak, dan dua medali perunggu. &quot;Targetnya meraih tiga medali emas,&quot; katanya. <br />\r\n<br />\r\nTOFI terdiri atas Paul Zakharia Fajar Hanakata, siswa SMAN 1 Denpasar, Bali; Dzuhri Radityo Utomo, siswa SMAN 1 Yogyakarta; Andri Pradana, siswa SMAK 1 BPK Penabur DKI Jakarta; Winson Tanputraman, siswa SMAK 1 BPK Penabur DKI Jakarta; dan Fernaldo Richtia Winnerdy, siswa SMAK BPK Penabur, Gading Serpong, Banten.<br />\r\n<br />\r\nPada bidang Matematika, Indonesia mengirim sebanyak enam siswa ke International Mathematical Olympiad (IMO) ke-50 yang diselenggarakan pada 10 - 22 Juli 2009 di Bremen, Jerman. Tim ditargetkan meraih dua medali perak dan empat medali perunggu.<br />\r\n<br />\r\nTim IMO Indonesia terdiri atas Joseph Andreas, siswa SMAK 1 BPK Penabur Jakarta; Aldrian Obaja, siswa SMAK 1 BPK Penabur Bandung; Andreas Dwi Maryanto Gunawan, siswa SMAK Kolese Santo Yusup Malang, Jawa Timur; Raja Oktovin, siswa SMAN 1 Pekanbaru, Riau; Ivan Wangsa Cipta Lingga, siswa SMAK 1 BPK Penabur Jakarta; dan Ronald Widjojo, siswa SMAK St.Louis 1 Surabaya.<br />\r\n<br />\r\nPada bidang Biologi, tim akan berlaga di arena kompetisi International Biology Olympiad (IBO) ke-20 &nbsp;pada 12 - 19 Juli 2009 di Tsukuba, Jepang. Tim IBO mengirimkan sebanyak empat siswa dan ditargetkan menyumbangkan medali emas. Ajang IBO diikuti oleh sebanyak 220 siswa dari 55 negara.<br />\r\n<br />\r\nTim IBO Indonesia terdiri atas Anugerah Erlaut, siswa kelas XII SMA Kharisma Bangsa, Tangerang; Irfan Haris, siswa kelas X SMAN 1 Pringsewu, Lampung; Danang Crysnanto, siswa kelas XI SMAN 1 Wonogiri, Jawa Tengah; dan Elbert Wijaya, siswa kelas XII SMAK Penabur DKI Jakarta.<br />\r\n<br />\r\nAdapun pada bidang Kimia, Tim Olimpiade Kimia Internasional (OKI) Indonesia akan bersaing di International Chemistry Olympiad (IChO) ke-41. Kompetisi akan berlangsung pada 18 - 27 Juli 2009 di London, Inggris. Tim OKI mengirimkan sebanyak empat siswa. Tim ditargetkan meraih medali setara penyelenggaraan IChO ke-40 di Budapest, Hungaria yaitu sebanyak satu medali emas, satu medali perak, dan satu medali perunggu atau minimal meraih dua medali perak dan dua medali perunggu. IChO akan diikuti sebanyak 66 negara peserta.<br />\r\n<br />\r\nTim OKI Indonesia terdiri atas Dimas Ramadhan Abdillah Fikri, siswa SMA Taruna Nusantara Magelang, Jawa Tengah; Ivana Polim, siswa SMA Sutomo 1 Medan, Sumatera Utara; Bening Tirta Muhammad, siswa SMAN 8 Pekanbaru, Riau; dan Adhitya Mangalaputra, siswa SMAK 1 BPK Penabur, Jakarta Barat.<br />\r\n<br />\r\nSuyanto berharap agar tim dapat mempertahankan perolehan medali yang selama ini telah diraih. Dia menyebutkan, sepanjang 2008 Indonesia telah memperoleh sebanyak 118 medali emas dari berbagai ajang olimpiade. &quot;Kepada tim Biologi, Fisika, dan Kimia agar membawa emas sebanyak - banyaknya. Khusus tim Matematika mudah - mudahan medali emasnya pecah tahun ini,&quot; katanya.***</p>\r\n</div>\r\n<em><br />\r\nSumber: Pers Depdiknas</em>', 'Indonesia Kirim Empat Tim ke Olimpiade Sains Internasional 2009', '2', '22:12:28', '07/10/2009', 4);
INSERT INTO `t_news` VALUES (22, '<p>Jaringan penelitian dan pengembangan (Jarlitbang) pendidikan merupakan wahana kerjasama lintas sektoral antara Pemerintah Pusat (Depdiknas) dan Pemerintah Daerah (Balitbangda/Bappeda, Dinas Pendidikan Propinsi/Kabupaten/Kota) dalam kegiatan penelitian dan pengembangan di bidang pendidikan.&nbsp;</p>\r<BR><p>Jarlitbang pada awalnya dikembangkan oleh Pusat Penelitian Kebijakan dan Inovasi Balitbang Depdiknas dengan sebutan jaringan penelitian (Jarlit). Setelah otonomi daerah dan adanya kepentingan bersama dalam mensinkronkan kebijakan pendidikan pusat dan daerah, pada tahun 2006 berkembang menjadi Jaringan Penelitian dan Pengembangan (Jarlitbang)<br />\r<BR>yang melibatkan Sekretariat dan seluruh pusat di lingkungan Balitbang Depdiknas, yaitu: Pusat Penelitian Kebijakan dan Inovasi Pendidikan (Puslitjaknov), Pusat Statistik Pendidikan (PSP), Pusat Kurikulum (Puskur), dan Pusat Penilaian Pendidikan (Puspendik).</p>\r<BR><p>Melalui Jarlitbang diharapkan dapat membantu pimpinan daerah dalam merencanakan dan melaksanakan serta memecahkan masalah-masalah kebijakan pendidikan di daerahnya. Hal ini sejalan dengan tuntutan dan kewenangan pemerintah daerah di era otonomi daerah. Oleh karena itu, keberadaaan Jarlitbang Pendidikan sangat diperlukan dalam upaya mensinkronkan berbagai kebijakan pendidikan nasional dan membantu memecahkan berbagai permasalahan pendidikan (melalui penelitian,<br />\r<BR>pendataan/statistik persekolahan, kurikulum, dan penilaian pendidikan).</p>\r<BR><p>Sejalan dengan itu, Balitbang Depdiknas merasa perlu melakukan sinkronisasi kebijakan pendidikan nasional di berbagai jenis dan jenjang pendidikan dengan pemerintah daerah agar terjadi sinergi penyelenggaraan kebijakan pendidikan antarpusat dan antardaerah. Hal ini perlu dilakukan secara sinergi mengingat institusi penelitian dan pengembangan bidang pendidikan (penelitian kebijakan, pendataan, kurikulum, penilaian dan akreditasi sekolah/madrasah) di pusat dan daerah telah terjadi jalinan kerjasama di bidang masing-masing.</p>\r<BR><p>Selain dari pada itu, Balitbang yang berperan memfasilitasi Badan Standar Nasional Pendidikan (BSNP), Badan Akreditasi Nasional Pendidikan Tinggi (BAN PT), Badan Akreditasi Nasional Sekolah/Madrasah (BAN S/M) dan Badan Akreditasi Nasional Pendidikan Non Formal (BAN PNF) perlu memberikan informasi dan dukungan agar pelaksanaan standar nasional pendidikan, akreditasi sekolah/madrasah, akreditasi pendidikan non formal, dan akreditasi perguruan tinggi berjalan secara optimal.</p>\r<BR><p>Di samping itu, untuk mewujudkan layanan pendidikan bagi seluruh lapisan masyarakat diperlukan komitmen seluruh pemangku kepentingan (stakeholder) pendidikan. Dalam kerangka mewujudkan komitmen seluruh pihak terkait dan sesuai dengan fungsi strategis Bappeda, Balitbangda, Dinas Pendidikan, dan LPMP dalam penetapan kebijakan daerah, maka instansi tersebut diharapkan mengkoordinasikan penelitian kebijakan, pendataan, kurikulum, penilaian dan akreditasi sekolah/madrasah di tingkat kabupaten/kota dan provinsi.</p>\r<BR><p>Dalam rangka mengkoordinasikan dan menyinkronkan seluruh proses pembangunan pendidikan dirasakan perlu melakukan koordinasi melalui Rapat Koordinasi Nasional dengan tema: &rdquo;Peningkatan peran Jaringan Penelitian dan Pengembangan Dalam Rangka Penuntasan Target Pembangunan Pendidikan Tahun 2009&rdquo;.</p>\r<BR><p>Kegiatan Rakornas Jarlitbang Pendidikan dilaksanakan selamat 3 (tiga) hari, pada hari Selasa sampai dengan Kamis, tanggal 26-28 Mei 2009, yang diselenggarakan di Hotel Patrajasa Semarang, Jawa Tengah.</p>\r<BR><p>Peserta yang diundang adalah anggota Jaringan Penelitian dan Pengembangan (Jarlitbang) yang dinilai aktif dalam waktu tiga tahun terakhir, dan seluruh Lembaga Penjaminan Mutu Pendidikan (LPMP) yang berjumlah sekitar 220 orang, yang terdiri dari:</p>\r<BR><p>1. Ketua Balitbangda/Bappeda Propinsi<br />\r<BR>2. Ketua Balitbangda/Bappeda Kabupaten/Kota<br />\r<BR>3. Kepala Dinas Pendidikan Propinsi/Kabupaten/Kota<br />\r<BR>4. Ketua LPMP seluruh Indonesia</p>\r<BR><p>Panitia Penyelenggara Rakornas Jarlitbang Pendidikan Tahun 2009 dibentuk berdasarkan Surat Keputusan Kepala Badan Penelitian dan Pengembangan Departemen Pendidikan Nasional Nomor 000/G/Kep/PG/2009 tanggal 1 April 2009.</p>\r<BR><p>Apabila peserta Rakornas Jarlitbang memerlukan informasi atau bantuan berkaitan dengan penyelenggaraan Rakornas Jarlitbang dapat menghubungi:</p>\r<BR><p>Sekretariat Balitbang Depdiknas<br />\r<BR>Gedung E Lantai 2<br />\r<BR>Jalan Jenderal Sudirman, Senayan - Jakarta<br />\r<BR>Telpon : 021-57900405, 5733129, 5737102<br />\r<BR>Fax: 021-5721245, 5721244<br />\r<BR>SMS : 0811-9999-80<br />\r<BR>Email : jarlitbang2009@yahoo.com</p>\r<BR><p>Penyelenggaraan Rapat Koordinasi Nasional Jaringan Penelitian Pendidikan Tahun 2009 merupakan kerjasama antara Balitbang Depdiknas Jakarta, Balitbang Propinsi Jawa Tengah dan Dinas Pendidikan Propinsi Jawa Tengah.</p>\r<BR><p>Sumber:&nbsp;Balitbang Depdiknas</p>', 'Rapat Koordinasi Nasional Jaringan Penelitian Dan Pengembangan Pendidikan Tahun 2009', '2', '22:18:30', '07/10/2009', 12);
INSERT INTO `t_news` VALUES (23, '<p>&nbsp;</p>\r<BR><p><strong>Jakarta, Senin (3 Agustus 2009)</strong> -- Presiden RI, Susilo Bambang Yudhoyono (SBY) menegaskan, pemerintah akan mempertahankan anggaran pendidikan minimal 20 persen dari Anggaran Pendapatan dan Belanja Negara (APBN). Kebijakan ini merupakan salah satu prioritas belanja pemerintah untuk mendukung sasaran - sasaran pembangunan sesuai rencana kerja pemerintah (RKP) 2010 dalam Rencana APBN 2010.<br /> <br /> "Dengan anggaran pendidikan yang mencapai 20 persen dari APBN kita berharap dapat meningkatkan mutu pendidikan di negeri kita guna membangun keunggulan dan daya saing bangsa di abad 21," katanya saat menyampaikan pokok - pokok Rancangan APBN tahun 2010 dan nota keuangan 2010 pada Rapat Paripurna Luar Biasa Dewan Perwakilan Rakyat (DPR) pada masa reses persidangan empat tahun sidang 2008/2009 di Ruang Rapat Paripurna, Gedung DPR RI, Senayan, Jakarta, Senin (3/08/2009).<br /> <br /> Hadir pada acara Ketua dan Wakil Ketua DPR RI, para anggota Dewan Perwakilan Daerah RI, Ketua, Wakil Ketua, dan anggota lembaga - lembaga negara, duta besar dan pimpinan perwakilan badan - badan dan organisasi internasional, serta para gubernur kepala daerah.<br /> <br /> Presiden SBY menyebutkan, prioritas lain belanja pemerintah adalah untuk memperbaiki kesejahteraaan aparatur negara dan pensiunan, melanjutkan seluruh program kesejahteraan rakyat seperti Program Nasional Pemberdayaan Masyarakat (PNPM), Bantuan Operasional Sekolah (BOS), Program Jaminan Kesehatan Masyarakat (Jamkesmas), Program Keluarga Harapan (PKH) dan beras bersubsidi atau tadinya disebut raskin. Selain itu, kata Presiden SBY, melanjutkan pembangunan infrastruktur transportasi, pertanian, energi, dan proyek padat karya lainnya. <br /> <br /> Prioritas lainnya, kata Predisen SBY, adalah mendorong revitalisasi industri dan pemulihan dunia usaha, meneruskan reformasi birokrasi guna mewujudkan tata kelola pemerintahan yang baik dan peningkatan pelayanan publik. Kemudian meningkatkan anggaran operasional, pemeliharaan, dan pengadaan alat tama sistem senjata Tentara Nasional Indonesia (Alutsista TNI), serta meningkatkan kualitas pengelolaan sumber daya alam dan kapasitas penanganan perubahan iklim. <br /> <br /> Presiden SBY mengatakan, sesuai dengan prioritas RKP 2010 dalam RAPBN tahun 2010 pemerintah mengalokasikan anggaran sebesar Rp.37 triliun untuk pemeliharaan kesejahteraan rakyat, serta penataan kelembagaan dan pelaksanaan sistem perlindungan sosial. "Sasaran yang hendak dicapai dari prioritas tersebut adalah menurunkan angka kemiskinan menjadi 12 sampai dengan 13,5 persen," katanya.<br /> <br /> Sementara itu, lanjut Presiden SBY, alokasi anggaran yang akan digunakan untuk meningkatkan kualitas sumber daya manusia(SDM) Indonesia pada tahun 2010 direncanakan mencapai Rp.51,2 triliun. Sasaran yang hendak dicapai dengan alokasi di anggaran tersebut antara lain adalah untuk bidang pendidikan. "Yaitu meningkatnya akses dan pemerataan pada jenjang pendidikan dasar yang berkualitas bagi semua anak usia tujuh sampai dengan lima belas tahun," katanya.<br /> <br /> Presiden SBY menyebutkan, sasaran lainnya adalah menurunnya angka putus sekolah, meningkatnya kualitas pendidikan, dan meningkatnya kesejahteraan pendidik. Selain itu, di bidang kesehatan yaitu tersedianya fasilitas kesehatan dasasr dan rujukan, serta terlayaninya seluruh penduduk miskin untuk mendapatkan pelayanan kesehatan dasar di Puskesmas dan jaringannya, serta di kelas III rumah sakit. <br /> <br /> Sasaran berikutnya adalah di bidang perbaikan gizi yaitu meningkatnya cakupan pemberian makanan pendamping air susu ibu (ASI) pada anak usia 6 sampai dengan 24 bulan keluarga miskin. "Bidang Keluarga Berencana (KB) yaitu terlayaninya peserta KB baru sekitar 7,1 juta peserta diantaranya 3,7 juta adalah peserta KB baru miskin dan meningkatkan peserta KB aktif menjadi sekitar 26,7 juta peserta diantaranya 11,9 juta adalah peserta KB aktif miskin," katanya. <br /> <br /> Lebih lanjut Presiden SBY menyampaikan, dari alokasi anggaran belanja pemerintah pusat tahun 2010 sebesar Rp.699,7 triliun, anggaran belanja direncanakan untuk seluruh kementerian negara dan lembaga mencapai Rp.327,6 triliun atau naik sebesar Rp.10,6 triliun dibandingkan dengan perkiraan realisasinya di tahun 2009. "Kenaikan anggaran belanja kementerian dan lembaga tersebut terutama untuk mendukung pencapaian sasaran-sasaran yang direncanakan dalam RKP tahun 2010," ujarnya.<br /> <br /> Presiden SBY mengatakan, berdasarkan prioritas RKP 2010, serta mempertimbangkan tugas pokok dan fungsi kementerian negara dan lembaga dalam RAPBN tahun anggaran 2010, terdapat beberapa kementerian negara atau lembaga yang mendapat alokasi anggaran yang cukup besar. Presiden SBY menyebutkan, Departemen Pendidikan Nasional (Depdiknas) dalam tahun 2010 mendatang direncanakan memperoleh alokasi anggaran sebesar Rp.51,8 triliun, Departemen Pertahanan (Dephan) Rp.40,7 triliun, Departemen Pekerjaan Umum (Dep PU) Rp.34,3 triliun, Departemen Agama (Depag) Rp.26 triliun, Kepolisian Negara RI Rp.25,8 triliun, Departemen Kesehatan (Depkes) Rp.20,8 triliun dan Departemen Perhubungan (Dephub) Rp.16 triliun.<br /> <br /> Presiden SBY menyampaikan, alokasi anggaran pendidikan yang besar pada Depdiknas dan Depag dimaksudkan terutama untuk menuntaskan pelaksanaan program wajib belajar pendidikan dasar 9 tahun , pemerataan dan perluasan akses pendidikan, serta peningkatan mutu, relevansi dan daya saing pendidikan. "Anggaran itu juga ditujukan untuk menaikkan kesejahteraan guru," kata Presiden SBY.<br /> <br /> Sementara, kata Presiden SBY, dalam rangka mendukung pelaksanaan desentralisasi fiskal dalam 2010 mendatang alokasi anggaran transfer ke daerah direncanakan mencapai Rp.309,8 triliun. "Dari jumlah tersebut alokasi dana perimbangan direncanakan mencapai Rp.293 triliun atau naik Rp.7,7 triliun," katanya. <br /> <br /> Presiden SBY menyebutkan, kenaikan terbesar dari dana perimbangan dalam tahun 2010 tersebut berasal dari rencana realokasi tunjangan profesi yang dialokasikan sebagai dana alokasi umum (DAU) tambahan untuk tunjangan profesi guru sebesar Rp.8,9 triliun. "Rencana realokasi tunjangan profesi guru ke dalam DAU mulai tahun 2010 sejalan dengan semangat Peraturan Pemerintah Nomor. 41 Tahun 2009 tentang Tunjangan Profesi Guru dan Dosen," katanya. <br /> <br /> Oleh karena itu, lanjut Presiden SBY, mulai tahun 2010 alokasi DAU dalam struktur APBN akan terdiri dari DAU murni yang dialokasikan dengan menggunakan formula murni dan DAU tambahan untuk tunjangan profesi guru. "Tunjangan tersebut diberikan kepada guru dan dosen yang memiliki sertifikat pendidik sebagai penghargaan atas profesionalitasnya sesuai dengan kewenangannya, " katanya.<br /> <br /> Disamping itu, kata Presiden SBY, untuk melanjutkan kebijakan yang diambil pada 2009 tentang penghasilan minimal golongan terendah guru sebesar Rp.2 jt per bulan maka dalam RAPBN 2010 masih dialokasikan dana penyesuaian berupa tambahan tunjangan kependidikan bagi guru sebesar Rp.7,9 triliun. "Kita semua berharap dengan ditingkatkannya alokasi anggaran ini kesejahteraan para guru dan dosen akan semakin membaik dan akhirnya sesuai dengan harapan rakyat Indonesia mutu pendidikan kita harus meningkat lebih tinggi lagi," katanya.<br /> <br /> Sebelumnya, Presiden SBY, menyampaikan pendapatan negara dan hibah direncanakan mencapai Rp.911,5 triliun atau meningkat Rp.38,8 triliun dari sasaran RAPBN Perubahan tahun anggaran 2009. Belanja negara direncanakan mencapai Rp.1.009,5 triliun yang berarti lebih tinggi sebesar 3,8 triliun rupiah dari yang dianggarkan dalam RAPBN-P tahun 2009. "Dengan demikian defisit anggaran dalam tahun 2010 direncanakan mencapai Rp.98 triliun atau 1,6 persen dari product domestic bruto (PDB)," katanya.<br /> <br /> Jumlah ini, kata Presiden SBY, mengalami penurunan sebesar Rp.35 triliun bila dibandingkan target yang direncanakan dalam RAPBN-P 2009 sebesar &Acirc;&nbsp;Rp.133 triliun atau 2,5 persen dari PDB. "Untuk mencapai sasaran pendapatan negara pada tahun anggaran 2010 mendatang, pemerintah akan terus melanjutkan langkah - langkah optimalisasi penerimaan baik penerimaan dari pajak maupun penerimaan negara bukan pajak (PNBP)," katanya.<br /> <br /> Presiden SBY menyebutkan, dari rencana pendapatan negara dan hibah yang ditargetkan mencapai Rp.911,5 triliun, dalam tahun 2010 penerimaan perpajakan direncanakan mencapai Rp.729,2 triliun, sedangkan PNBP diperkirakan mencapai Rp.180,9 triliun.***</p>\r<BR><p><em><br /> <em>Sumber: Pers Depdiknas</em></em></p>\r<BR><p>&nbsp;</p>\r<BR><p>&nbsp;</p>', 'Pemerintah Pertahankan Anggaran Pendidikan 20 Persen Dari APBN', '3', '11:43:29', '08/16/2009', 10);

-- --------------------------------------------------------

-- 
-- Table structure for table `t_news_kom`
-- 

CREATE TABLE `t_news_kom` (
  `idkom` int(11) NOT NULL auto_increment,
  `id` int(11) default NULL,
  `nama` varchar(40) collate latin1_general_ci default NULL,
  `email` varchar(50) collate latin1_general_ci default NULL,
  `tgl` varchar(20) collate latin1_general_ci default NULL,
  `komentar` text collate latin1_general_ci,
  PRIMARY KEY  (`idkom`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_news_kom`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_nilai`
-- 

CREATE TABLE `t_nilai` (
  `kd_nilai` varchar(10) collate latin1_general_ci NOT NULL,
  `pelajaran` varchar(30) collate latin1_general_ci default NULL,
  `semester` char(1) collate latin1_general_ci NOT NULL,
  `ujian_ke` int(11) NOT NULL,
  `status` varchar(1) collate latin1_general_ci NOT NULL,
  `tgl_ujian` datetime default NULL,
  `skbm` int(3) default NULL,
  `guru` varchar(50) collate latin1_general_ci default NULL,
  `ket` tinytext collate latin1_general_ci,
  `kd_remedial` varchar(10) collate latin1_general_ci default NULL,
  `kelas` varchar(10) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`kd_nilai`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `t_nilai`
-- 

INSERT INTO `t_nilai` VALUES ('1011000001', 'Matematika', '1', 1, '3', '2012-11-26 00:00:00', 70, '400001001', '', '1', 'X - 4');
INSERT INTO `t_nilai` VALUES ('1213000001', 'BK', '2', 2, '3', '2012-11-26 00:00:00', 70, '400001001', 'kd rt', '2', 'X - 4');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_nilai_detail`
-- 

CREATE TABLE `t_nilai_detail` (
  `kd_nilai` varchar(10) collate latin1_general_ci NOT NULL,
  `NIS` varchar(25) collate latin1_general_ci NOT NULL,
  `no_ljk` varchar(7) collate latin1_general_ci default NULL,
  `nilai` decimal(5,0) default NULL,
  `tuntas` char(1) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`kd_nilai`,`NIS`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `t_nilai_detail`
-- 

INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810119', '-', 90, '1');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810120', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810121', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810122', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810123', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810124', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810125', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810126', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810127', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810128', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810129', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810130', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810131', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810132', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810133', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810134', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810135', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810136', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810137', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810138', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810139', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810140', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810141', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810142', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810143', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810144', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810145', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810146', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810147', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810148', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810149', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810150', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810151', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810152', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810153', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810154', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810155', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810156', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1011000001', '070810157', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810119', '-', 50, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810120', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810121', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810122', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810123', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810124', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810125', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810126', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810127', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810128', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810129', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810130', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810131', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810132', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810133', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810134', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810135', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810136', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810137', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810138', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810139', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810140', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810141', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810142', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810143', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810144', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810145', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810146', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810147', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810148', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810149', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810150', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810151', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810152', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810153', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810154', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810155', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810156', '-', 0, '0');
INSERT INTO `t_nilai_detail` VALUES ('1213000001', '070810157', '-', 0, '0');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_online`
-- 

CREATE TABLE `t_online` (
  `visit` int(10) NOT NULL default '0',
  `time` int(10) default NULL,
  `type` text collate latin1_general_ci,
  PRIMARY KEY  (`visit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `t_online`
-- 

INSERT INTO `t_online` VALUES (10, 1122370277, 'guest');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_pelajaran`
-- 

CREATE TABLE `t_pelajaran` (
  `kode_pel` varchar(20) collate latin1_general_ci NOT NULL default '',
  `idpel` int(11) NOT NULL auto_increment,
  `pelajaran` varchar(50) collate latin1_general_ci NOT NULL default '',
  `pel` varchar(30) collate latin1_general_ci default NULL,
  `program` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`idpel`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=28 ;

-- 
-- Dumping data for table `t_pelajaran`
-- 

INSERT INTO `t_pelajaran` VALUES ('AGAMA', 1, 'Pend. Agama', 'Pend. Agama', '-');
INSERT INTO `t_pelajaran` VALUES ('WRGNGR', 2, 'Pend. Kewarganegaraan', 'PKn', '-');
INSERT INTO `t_pelajaran` VALUES ('BHSIND', 3, 'Bhs. dan Sastra Indonesia', 'B. Indonesia', '-');
INSERT INTO `t_pelajaran` VALUES ('BHSING', 4, 'Bhs. Inggris', 'B. Inggris', '-');
INSERT INTO `t_pelajaran` VALUES ('MTK', 5, 'Matematika', 'Matematika', '-');
INSERT INTO `t_pelajaran` VALUES ('PENJAS', 6, 'Pend. Jasmani', 'Penjaskes', '-');
INSERT INTO `t_pelajaran` VALUES ('SJR', 7, 'Sejarah Nasional dan Umum', 'Sejarah', '-');
INSERT INTO `t_pelajaran` VALUES ('GEO', 8, 'Geografi', 'Geografi', '-');
INSERT INTO `t_pelajaran` VALUES ('EKO', 9, 'Ekonomi dan Akuntansi', 'Ekonomi', '-');
INSERT INTO `t_pelajaran` VALUES ('SOS', 10, 'Sosiologi', 'Sosiologi', '-');
INSERT INTO `t_pelajaran` VALUES ('FIS', 11, 'Fisika', 'Fisika', '-');
INSERT INTO `t_pelajaran` VALUES ('KIM', 12, 'Kimia', 'Kimia', '-');
INSERT INTO `t_pelajaran` VALUES ('BIO', 13, 'Biologi', 'Biologi', '-');
INSERT INTO `t_pelajaran` VALUES ('TIK', 14, 'Tek. Informasi & Komunikasi', 'T I K', '-');
INSERT INTO `t_pelajaran` VALUES ('BHSJER', 15, 'Bahasa Jerman', 'B. Jerman', 'Bahasa');
INSERT INTO `t_pelajaran` VALUES ('BK', 16, 'Bimbingan dan Konseling', 'BK', '-');
INSERT INTO `t_pelajaran` VALUES ('SMUSIK', 17, 'Pend. Seni Musik', 'Pendidikan Seni', '-');
INSERT INTO `t_pelajaran` VALUES ('AKUN', 18, 'Akuntansi', 'Akuntansi', '-');
INSERT INTO `t_pelajaran` VALUES ('PLH', 19, 'PLH', 'PLH', '-');
INSERT INTO `t_pelajaran` VALUES ('BSUN', 20, 'B. Sunda', 'B. Sunda', '-');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_pesan`
-- 

CREATE TABLE `t_pesan` (
  `id` int(10) NOT NULL auto_increment,
  `pengirim` int(10) NOT NULL,
  `pesan` varchar(100) collate latin1_general_ci NOT NULL default '',
  `waktu` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `t_pesan`
-- 

INSERT INTO `t_pesan` VALUES (1, 3, 'body { /* background gambar */<br />\n	font-family: \\&quot;Arial\\&quot;, serif;<br />\n	font-size: 76%', '2012-06-14 01:03:31');
INSERT INTO `t_pesan` VALUES (2, 3, 'ada', '2012-06-14 01:04:04');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_pesan_alum`
-- 

CREATE TABLE `t_pesan_alum` (
  `id` int(10) NOT NULL auto_increment,
  `pengirim` varchar(50) collate latin1_general_ci NOT NULL default '',
  `pesan` text collate latin1_general_ci NOT NULL,
  `waktu` varchar(25) collate latin1_general_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=20 ;

-- 
-- Dumping data for table `t_pesan_alum`
-- 

INSERT INTO `t_pesan_alum` VALUES (15, 'alan', 'Reuni Akbar angkatan 1990 akan diadakan pada Tanggal 3 Novem', '2009-07-21 02:00:27');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_pos_menu`
-- 

CREATE TABLE `t_pos_menu` (
  `id` int(2) NOT NULL auto_increment,
  `menu` varchar(40) collate latin1_general_ci default NULL,
  `posisi` char(1) collate latin1_general_ci default NULL,
  `urut` int(2) default NULL,
  `kategori` varchar(10) collate latin1_general_ci default NULL,
  `fungsi` varchar(20) collate latin1_general_ci default NULL,
  `sembunyi` char(1) collate latin1_general_ci default 't',
  `idtemp` int(2) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=57 ;

-- 
-- Dumping data for table `t_pos_menu`
-- 

INSERT INTO `t_pos_menu` VALUES (1, 'Jajak Pendapat', 'R', 4, 'depan', 'jajak', 't', 1);
INSERT INTO `t_pos_menu` VALUES (2, 'Agenda', 'L', 4, 'depan', 'tanggal', 't', 1);
INSERT INTO `t_pos_menu` VALUES (3, 'Statistik', 'L', 3, 'depan', 'statistik', 't', 1);
INSERT INTO `t_pos_menu` VALUES (4, 'Info Sekolah', 'R', 2, 'depan', 'info', 't', 3);
INSERT INTO `t_pos_menu` VALUES (5, 'Materi Ajar', 'R', 3, 'profil', 'matpel', 't', 1);
INSERT INTO `t_pos_menu` VALUES (6, 'Berita Terbaru', 'T', 1, 'depan', 'berita', 't', 2);
INSERT INTO `t_pos_menu` VALUES (7, 'Visi Misi Sekolah', 'R', 1, 'profil', 'visimisi', 'y', 3);
INSERT INTO `t_pos_menu` VALUES (50, 'Silabus', 'L', 2, 'siswa', 'silabus', 't', 3);
INSERT INTO `t_pos_menu` VALUES (31, 'Agenda', 'L', 3, 'siswa', 'tanggal', 't', 3);
INSERT INTO `t_pos_menu` VALUES (8, 'Statistik', 'R', 2, 'profil', 'statistik', 'y', 1);
INSERT INTO `t_pos_menu` VALUES (9, 'Selayang Pandang Kepala Sekolah', 'T', 1, 'profil', 'profil', 't', 2);
INSERT INTO `t_pos_menu` VALUES (10, 'Lokasi Sekolah', 'T', 2, 'profil', 'profil2', 't', 2);
INSERT INTO `t_pos_menu` VALUES (16, 'Banner', 'T', 2, 'guru', 'banner1', 't', 0);
INSERT INTO `t_pos_menu` VALUES (14, 'Info Sekolah', 'L', 1, 'guru', 'info', 't', 1);
INSERT INTO `t_pos_menu` VALUES (41, 'Materi Ajar Terbaru', 'R', 3, 'depan', 'materi', 't', 3);
INSERT INTO `t_pos_menu` VALUES (15, 'Materi Ajar Terbaru', 'L', 1, 'siswa', 'materi', 't', 1);
INSERT INTO `t_pos_menu` VALUES (38, 'Pencarian', 'L', 1, 'depan', 'cari', 't', 1);
INSERT INTO `t_pos_menu` VALUES (39, 'Login Member', 'L', 2, 'depan', 'login', 't', 1);
INSERT INTO `t_pos_menu` VALUES (40, 'Login Member', 'L', 1, 'profil', 'login', 't', 1);
INSERT INTO `t_pos_menu` VALUES (11, 'Jajak Pendapat', 'R', 2, 'guru', 'jajak', 't', 1);
INSERT INTO `t_pos_menu` VALUES (19, 'Jajak Pendapat', 'L', 1, 'alumni', 'jajak', 't', 1);
INSERT INTO `t_pos_menu` VALUES (13, 'Statistik', 'L', 3, 'guru', 'statistik', 't', 1);
INSERT INTO `t_pos_menu` VALUES (42, 'Artikel Terbaru', 'T', 3, 'depan', 'artikel2', 't', 2);
INSERT INTO `t_pos_menu` VALUES (49, 'SIlabus', 'R', 2, 'guru', 'silabus', 't', 3);
INSERT INTO `t_pos_menu` VALUES (18, 'Banner', 'L', 1, 'depan', 'banner2', 't', 1);
INSERT INTO `t_pos_menu` VALUES (12, 'Agenda', 'L', 2, 'guru', 'tanggal', 't', 1);
INSERT INTO `t_pos_menu` VALUES (20, 'Agenda', 'L', 2, 'alumni', 'tanggal', 't', 1);
INSERT INTO `t_pos_menu` VALUES (51, 'Login Member', 'L', 1, 'siswa', 'login', 'y', 3);
INSERT INTO `t_pos_menu` VALUES (22, 'Info Sekolah', 'R', 2, 'alumni', 'info', 't', 3);
INSERT INTO `t_pos_menu` VALUES (23, 'Banner', 'T', 2, 'alumni', 'banner3', 't', 0);
INSERT INTO `t_pos_menu` VALUES (24, 'Pesan Alumni', 'R', 1, 'alumni', 'pesanalumni', 't', 1);
INSERT INTO `t_pos_menu` VALUES (21, 'Artikel', 'T', 1, 'alumni', 'artikel', 't', 2);
INSERT INTO `t_pos_menu` VALUES (43, 'Banner', 'T', 2, 'depan', 'banner1', 't', 0);
INSERT INTO `t_pos_menu` VALUES (44, 'Banner', 'R', 1, 'profil', 'banner2', 't', 1);
INSERT INTO `t_pos_menu` VALUES (47, 'Materi Uji', 'R', 1, 'siswa', 'soal', 't', 3);
INSERT INTO `t_pos_menu` VALUES (34, 'Info Sekolah', 'R', 2, 'profil', 'info', 't', 1);
INSERT INTO `t_pos_menu` VALUES (35, 'Agenda', 'L', 2, 'profil', 'tanggal', 't', 1);
INSERT INTO `t_pos_menu` VALUES (48, 'Banner', 'R', 2, 'siswa', 'banner2', 't', 3);
INSERT INTO `t_pos_menu` VALUES (37, 'Galeri Photo Terbaru', 'R', 2, 'depan', 'galeri', 't', 3);
INSERT INTO `t_pos_menu` VALUES (52, 'Ulang Tahun Siswa', 'R', 2, 'siswa', 'ultah', 't', 3);
INSERT INTO `t_pos_menu` VALUES (53, 'Profil Guru', 'T', 0, 'guru', 'guru', 't', 2);
INSERT INTO `t_pos_menu` VALUES (54, 'Prestasi Siswa', 'T', 0, 'siswa', 'siswa', 't', 2);
INSERT INTO `t_pos_menu` VALUES (55, 'Banner', 'T', 2, 'siswa', 'banner3', 't', 0);
INSERT INTO `t_pos_menu` VALUES (56, 'Status Member', 'R', 4, 'depan', 'status_member', 'y', 3);

-- --------------------------------------------------------

-- 
-- Table structure for table `t_prestasi`
-- 

CREATE TABLE `t_prestasi` (
  `id` int(10) NOT NULL default '0',
  `judul` varchar(200) collate latin1_general_ci NOT NULL default '',
  `ket` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `t_prestasi`
-- 

INSERT INTO `t_prestasi` VALUES (1, 'Team Futsal ', 'Team Futsal  ini terdiri dari 10 siswa yang terlatih khusus selama beberapa hari.');
INSERT INTO `t_prestasi` VALUES (2, 'Juara 1 Lomba Cerdas Cermat AIDS Tingkat Kota Bandung', 'Juara 1 Lomba Cerdas Cermat AIDS  dalam Acara AIDS Sedunia');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_profil`
-- 

CREATE TABLE `t_profil` (
  `id` int(5) NOT NULL auto_increment,
  `judul` varchar(100) collate latin1_general_ci NOT NULL default '',
  `isi` longtext collate latin1_general_ci NOT NULL,
  `urut` int(11) default NULL,
  `parent` int(5) default '0',
  `link` varchar(100) collate latin1_general_ci default '0',
  `hide` int(1) NOT NULL default '0',
  `target` varchar(10) collate latin1_general_ci default '_self',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=51 ;

-- 
-- Dumping data for table `t_profil`
-- 

INSERT INTO `t_profil` VALUES (9, 'PROFIL', '<p><img style="float: left;" src="../userfiles/ava1.jpg" alt="" width="120" height="121" /></p>\r\n<p>Era globalisasi dengan segala implikasinya menjadi salah satu pemicu cepatnya perubahan yang terjadi pada berbagai aspek kehidupan masyarakat, dan bila tidak ada upaya sungguh-sungguh untuk mengantisipasinya maka hal tersebut akan menjadi maslah yang sangat serius. Dalam hal ini dunia pendidikan mempunyai tanggung jawab yang besar, terutama dalam menyiapkan sumber daya manusia yang tangguh sehingga mampu hidup selaras didalam perubahan itu sendiri. Pendidikan merupakan investasi jangka panjang yang hasilnya tidak dapat dilihat dan dirasakan secara instan, sehingga sekolah sebagai ujung tombak dilapangan harus memiliki arah pengembangan jangka panjang dengan tahapan pencapaiannya yang jelas dan tetap mengakomodir tuntutan permasalahan faktual kekinian yang ada di masyarakat.</p>', 0, 0, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (21, 'OSIS', '<p>&nbsp;</p>\r\n<div style="text-align: center;"><strong>OSIS SMA<br /></strong></div>\r\n<div style="text-align: center;">&nbsp;</div>\r\n<div style="text-align: justify;">OSIS (kepanjangannya adalah Organisasi Siswa Intra Sekolah) adalah suatu organisasi yang berada di tingkat sekolah di Indonesia yang dimulai dari Sekolah Menengah yaitu Sekolah Menengah Pertama((SMP)) dan Sekolah Menengah Atas((SMA)). OSIS diurus dan dikelola oleh murid-murid yang terpilih untuk menjadi pengurus OSIS. Biasanya organisasi ini memiliki seorang pembimbing seorang guru yang dipilih oleh pihak sekolah.<br /> <br /> Anggota OSIS adalah seluruh siswa yang berada pada satu sekolah tempat OSIS itu berada. Seluruh anggota OSIS berhak untuk memilih calonnya untuk kemudian menjadi pengurus OSIS.</div>\r\n<div style="text-align: center;">&nbsp;</div>\r\n<div style="text-align: center;"><strong>STRUKTUR KEPENGURUSAN OSIS SMA&nbsp; MASA BHAKTI 08-09</strong></div>\r\n<p>&nbsp;</p>\r\n<p>Ketua OSIS : Gia Haryza&nbsp;</p>\r\n<p>Wakil Ketua OSIS 1 : M. Isyraqi El-hakim&nbsp;</p>\r\n<p>Wakil Ketua OSIS 2 : Yunan Ahmad Taufik</p>\r\n<p>&nbsp;</p>\r\n<p>Sekretaris Umum : Hanifah&nbsp;</p>\r\n<p>Sekretaris 1 : Ridho Agung Nugraha&nbsp;</p>\r\n<p>Sekretaris 2 : Afriani Naidza Nurdianti</p>\r\n<p>&nbsp;</p>\r\n<p>Bendahara Umum : Ginar Amalia Hidayati</p>\r\n<p>Bendahara 1 : Ria Maria Nurhayati</p>\r\n<p>Bendahara 2 : Nada Fathia Mutiara</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Sie. Ketaqwaan Terhadap Tuhan YME</strong></p>\r\n<p>Ketua : Galih Ahmad Abdullah</p>\r\n<p>Wakil : Syauqi Nur Alifan Zaelani</p>\r\n<p>Anggota : Nilam Mustikaning Nagari - Faizah Aulia Rahmah</p>\r\n<p>&nbsp;&nbsp;</p>\r\n<p><strong>Sie. Wawasan Keilmuan</strong></p>\r\n<p>Ketua : Aulia Arip Rakhman</p>\r\n<p>Wakil : Mohammad Gilang Santika</p>\r\n<p>Anggota : Arie Permana Putra- Rivan Ardyanto Sutoyo - Nursyifa Kamilia</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Sie. Wawasan Kebangsaan</strong></p>\r\n<p>Ketua : Egie Sofyan Nuddin</p>\r\n<p>Wakil : Rashidah Noor Amalia</p>\r\n<p>Anggota : Meliana Lestari - Fransiska Paulina Kaha</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Sie. Kepribadian Budi Pekerti Luhur dan Kehidupan Berbangsa</strong></p>\r\n<p>Ketua : Muhamad Lukman Rusyana</p>\r\n<p>Wakil : Denantia Puriandini Winaya</p>\r\n<p>Anggota : Ambar Ratih Sahra -&nbsp; Maulana Rizky Putra</p>\r\n<p><strong><br /> </strong></p>\r\n<p><strong>Sie. Keterampilan dan Kewirausahaan</strong></p>\r\n<p>Ketua : Iqbal Ramadhan Zahid</p>\r\n<p>Wakil : Larasitha Nunis</p>\r\n<p>Anggota : Sofie Tsaurah Islami&nbsp;&nbsp; - Fitrias Rahayu Ramdhani</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Sie. Organisasi, Kepemimpinan, dan Demokrasi</strong></p>\r\n<p>Ketua : Freysha Intan Yulitasari</p>\r\n<p>Wakil : Nugraha Yanureza R.</p>\r\n<p>Anggota : Radithya Aldi Pradhana - Citra Riansyah</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Sie. Apresiasi , Budaya , dan Daya Kreasi</strong></p>\r\n<p>Ketua : Aditya Purna Nugraha</p>\r\n<p>Wakil : Syahdini Handiani</p>\r\n<p>Anggota : Ratifika Dewi Irianto - Reynald Aditya Utomo</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Sie. Kesehatan Jasmani</strong></p>\r\n<p>Ketua : Elmus Rahma</p>\r\n<p>Wakil : Wiriadiningrat</p>\r\n<p>Anggota : Tiara Pasca Noviera Robaeni - Lutfi Ahmad&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', 4, 4, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (11, 'Visi dan Misi', '<p><strong>VISI MISI SMA CINTA INDONESIA<br /></strong></p>\r\n<p><strong><br /></strong></p>\r\n<p><strong>Visi :</strong><br /> Mewujudkan Sumber Daya Manusia yang Berakhlak Mulia yang Mampu Bersaing Secara Global</p>\r\n<p><strong>Misi :</strong></p>\r\n<ol>\r\n<li>Menciptakan suasana yang kondusif untuk mengembangkan potensi siswa melalui penekanan pada penguasaan kompetensi bidang ilmu pengetahuan dan teknologi serta Bahasa Inggris.</li>\r\n<li>Meningkatkan penguasaan Bahasa Inggris sebagai alat komunikasi dan alat untuk mempelajari pengetahuan yang lebih luas.</li>\r\n<li>Meningkatkan frekuensi dan&nbsp; kualitas kegiatan siswa yang lebih menekankan pada pengembangan ilmu pengetahuan dan teknologi serta keimanan dan ketakwaan yang menunjang proses belajar mengajar dan menumbuhkembangkan disiplin pribadi siswa.</li>\r\n<li>Menumbuhkembangkan nilai-nilai ketuhanan dan nilai-nilai kehidupan yang bersifat universal dan mengintegrasikannya dalam kehidupan</li>\r\n<li>Menerapkan manajemen partisipatif dengan melibatkan seluruh warga sekolah, Lembaga Swadaya Masyarakat, stake holders dan instansi serta institusi pendukung pendidikan lainnya.</li>\r\n</ol>\r\n<p align="center">&nbsp;</p>\r\n<p><strong>Tujuan</strong> :</p>\r\n<ul>\r\n<li>Tahun 2008 siswa memiliki kompetensi penguasaan konsep untuk seluruh mata pelajaran secara komprehensif dan benar sehingga mampu berkompetisi ditingkat nasional dan tahun 2012 mampu berkompetisi di tingkat internasional</li>\r\n<li>Tahun 2008 siswa mampu menggunakan Bahasa Inggris sebagai alat komunikasi untuk mendapatkan pengetahuan yang lebih luas</li>\r\n<li>Tahun 2008 siswa mampu membangun kebiasaan yang aktif untuk mencari informasi menggunakan teknologi informasi.</li>\r\n<li>Tahun 2008 sekolah memiliki sarana dan prasarana penunjang PBM yang lengkap.</li>\r\n<li>Tahun 2008 sekolah memiliki guru dan tenaga pendukung yang handal untuk mendukung seluruh manajemen sekolah.</li>\r\n<li>Sekolah memiliki hubungan kemitraan yang baik dengan seluruh warga sekolah, <em>stake holders</em> dan instansi serta institusi pendukung pendidikan lainnya.</li>\r\n<li>Siswa memiliki, mengaplikasikan dan meningkatkan nilai-nilai ketuhanan serta nilai-nilai kehidupan yang bersifat universal dalam kehidupannya.111</li>\r\n</ul>', 1, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (50, 'test 1', '<p>sdf s</p>', 1, 49, '', 0, '_self');
INSERT INTO `t_profil` VALUES (12, 'Sejarah Singkat', '<p><span style="font-size: medium;">SMA Cinta Indonesia Berdiri sejak tahun 1969</span></p>\r\n<p class="NoSpacing" style="text-align: justify; text-indent: 28.35pt; line-height: 150%;"><span style="font-size: small;"><span style="font-family: Verdana;"><span style="line-height: 150%;">Pimpinan sekolah dapat diurutkan sebagai berikut :</span></span></span></p>\r\n<p class="NoSpacing" style="margin-left: 0.25in; text-align: justify; text-indent: -0.25in; line-height: 150%;"><span style="font-size: small;"><span style="font-family: Verdana;"><span style="line-height: 150%;">&middot;<span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="line-height: 150%;">Tahun 1969 dipimpin oleh Bapak R.K. Supriatna </span></span></span></p>\r\n<p class="NoSpacing" style="margin-left: 0.25in; text-align: justify; text-indent: -0.25in; line-height: 150%;"><span style="font-size: small;"><span style="font-family: Verdana;"><span style="line-height: 150%;">&middot;<span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="line-height: 150%;">Tahun 1969&ndash;1972 dipimpin oleh Bapak Drs. E. Djarkasih</span></span></span></p>\r\n<p class="NoSpacing" style="margin-left: 0.25in; text-align: justify; text-indent: -0.25in; line-height: 150%;"><span style="font-size: small;"><span style="font-family: Verdana;"><span style="line-height: 150%;">&middot;<span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="line-height: 150%;">Tahun 1972 dipimpin oleh Bapak Dahlan Sumadidjaja</span></span></span></p>\r\n<p class="NoSpacing" style="margin-left: 0.25in; text-align: justify; text-indent: -0.25in; line-height: 150%;"><span style="font-size: small;"><span style="font-family: Verdana;"><span style="line-height: 150%;" lang="IT">&middot;<span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="line-height: 150%;" lang="IT">Tahun 1974 dipimpin oleh Ibu Dra. Nani Sukartini</span></span></span></p>\r\n<p class="NoSpacing" style="margin-left: 0.25in; text-align: justify; text-indent: -0.25in; line-height: 150%;"><span style="font-size: small;"><span style="font-family: Verdana;"><span style="line-height: 150%;">&middot;<span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="line-height: 150%;">Tahun 1985 dipimpin oleh Bapak Drs. Ahmad Hamid</span></span></span></p>\r\n<p class="NoSpacing" style="margin-left: 0.25in; text-align: justify; text-indent: -0.25in; line-height: 150%;"><span style="font-size: small;"><span style="font-family: Verdana;"><span style="line-height: 150%;">&middot;<span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="line-height: 150%;">Tahun 1989 dipimpin oleh Bapak Drs. Maman</span></span></span></p>\r\n<p class="NoSpacing" style="margin-left: 0.25in; text-align: justify; text-indent: -0.25in; line-height: 150%;"><span style="font-size: small;"><span style="font-family: Verdana;"><span style="line-height: 150%;">&middot;<span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="line-height: 150%;">Tahun 1994 dipimpin oleh Bapak Drs. Ihot Muslihat</span></span></span></p>\r\n<p class="NoSpacing" style="margin-left: 0.25in; text-align: justify; text-indent: -0.25in; line-height: 150%;"><span style="font-size: small;"><span style="font-family: Verdana;"><span style="line-height: 150%;">&middot;<span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="line-height: 150%;">Tahun 1997 dipimpin oleh Bapak Drs. R. Kiryodono</span></span></span></p>\r\n<p class="NoSpacing" style="margin-left: 0.25in; text-align: justify; text-indent: -0.25in; line-height: 150%;"><span style="font-size: small;"><span style="font-family: Verdana;"><span style="line-height: 150%;">&middot;<span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="line-height: 150%;">Tahun 1999 dipimpin oleh Bapak Drs. Solichin Riva&rsquo;i</span></span></span></p>\r\n<p class="NoSpacing" style="margin-left: 0.25in; text-align: justify; text-indent: -0.25in; line-height: 150%;"><span style="font-size: small;"><span style="font-family: Verdana;"><span style="line-height: 150%;">&middot;<span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="line-height: 150%;">Tahun 2000 tidak ada pimpinan yang definitive (PYMT dijabat oleh Bapak Drs.Aceng Zenal dan PLH oleh Bapak Ace Kisna)</span></span></span></p>\r\n<p class="NoSpacing" style="margin-left: 0.25in; text-align: justify; text-indent: -0.25in; line-height: 150%;"><span style="font-size: small;"><span style="font-family: Verdana;"><span style="line-height: 150%;">&middot;<span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="line-height: 150%;" lang="SV">Tahun 2002 dipimpin oleh Ibu Dra. Hj. </span><span style="line-height: 150%;">Yoyoh Komariah</span></span></span></p>\r\n<p class="NoSpacing" style="margin-left: 0.25in; text-align: justify; text-indent: -0.25in; line-height: 150%;"><span style="font-size: small;"><span style="font-family: Verdana;"><span style="line-height: 150%;">&middot;<span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="line-height: 150%;">Tanggal 1 April 2005 dipimpin oleh Bapak Drs. Uan Yuhana (PLT Kepala Sekolah)</span></span></span></p>\r\n<p class="NoSpacing" style="margin-left: 0.25in; text-align: justify; text-indent: -0.25in; line-height: 150%;"><span style="font-size: small;"><span style="font-family: Verdana;"><span style="line-height: 150%;">&middot;<span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="line-height: 150%;">Tanggal 19 April 2006 dipimpin oleh Drs. Nanang Krisnayadi.</span></span></span></p>\r\n<p class="NoSpacing" style="margin-left: 0.25in; text-align: justify; text-indent: -0.25in; line-height: 150%;"><span style="font-size: small;"><span style="font-family: Verdana;"><span style="line-height: 150%;">&middot;<span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="line-height: 150%;">Tanggal 31 Maret 2008 dipimpin oleh Bapak Drs. H. Cucu Saputra,M.M.Pd.</span></span></span></p>\r\n<p><span style="font-size: small;"><span style="font-family: Verdana;"><span style="line-height: 150%;"><span style="font-size: small;"><span style="font-family: Verdana;"><span style="line-height: 150%;">&middot;<span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="line-height: 150%;">Tanggal 22 Maret 2012 dipimpin oleh Bapak Drs. H. Akhmad Rubandi SP., M.M.Pd. Hingga Sekarang</span></span></span></span></span></span></p>', 2, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (13, 'Program Kerja', '<p><strong>Program Unggulan SMA CINTA INDONESIA<br /> </strong><br /> &nbsp;&nbsp; 1. Menjadi Sekolah Standar Nasional (SSN)<br /> &nbsp;&nbsp; 2. Mengembangkan Sikap dan Kompetensi Keagamaan<br /> &nbsp;&nbsp; 3. Mengembangkan Potensi Siswa Berbasis Multiple Intelligance<br /> &nbsp;&nbsp; 4. Mengembangkan Budaya daerah<br /> &nbsp;&nbsp; 5. Mengembangkan Kemampuan bahasa dan Teknologi Informasi<br /> &nbsp;&nbsp; 6. Meningkatkan Daya serap Ke Perguruan Tinggi Favorit<br /> <br /> <strong>Program Pengembangan Sarana Prioritas</strong><br /> <br /> &nbsp;&nbsp; 1. Membangun 5 Ruang kelas Belajar dengan konstruksi bangunan 3 tingkat<br /> &nbsp;&nbsp; 2. Membangun 1 ruang Belajar di lantai 2 gedung lama<br /> &nbsp;&nbsp; 3. Membangun Ruang Penglah Data<br /> &nbsp;&nbsp; 4. Pembangunan Kantin Siswa<br /> &nbsp;&nbsp; 5. Perbaikan dan Pengecetan Lapangan Olah Raga<br /> &nbsp;&nbsp; 6. Pengembangan Jaringan Infrastruktur LAN (Intranet dan Internet)<br /> &nbsp;&nbsp; 7. Pengembangan Sistem Informasi Sekolah (SIS)<br /> &nbsp;&nbsp; 8. Melengkapi Sarana dan Prasarana Perpustakaan dan Lab Komputer<br /> &nbsp;&nbsp; 9. Renovasi Aula<br /> &nbsp; 10. Renovasi Tampilan Depan Skolah/Gerbang Sekolah<br /> &nbsp; 11. Renovasi Koridor</p>', 8, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (14, 'Kepala Sekolah', '<h4 style="text-align: center;"><img src="../userfiles/image/Snap4.jpg" alt="" /></h4>\r\n<h4 style="text-align: left;"><span style="font-size: small;">Drs. H. Nusantara, M.M.Pd. &nbsp;adalah kepala SMA CINTA INDONESIA </span><span style="font-size: small;"> yang ke 16 sejak berdirinya sekolah ini pada tahun 1956. <span lang="IT">Lahir di</span><!--[if gte vml 1]><v:shapetype\r\nid="_x0000_t75" coordsize="21600,21600" o:spt="75" o:preferrelative="t"\r\npath="m@4@5l@4@11@9@11@9@5xe" filled="f" stroked="f">\r\n<v:stroke joinstyle="miter"  />\r\n<v:formulas>\r\n<v:f eqn="if lineDrawn pixelLineWidth 0"  />\r\n<v:f eqn="sum @0 1 0"  />\r\n<v:f eqn="sum 0 0 @1"  />\r\n<v:f eqn="prod @2 1 2"  />\r\n<v:f eqn="prod @3 21600 pixelWidth"  />\r\n<v:f eqn="prod @3 21600 pixelHeight"  />\r\n<v:f eqn="sum @0 0 1"  />\r\n<v:f eqn="prod @6 1 2"  />\r\n<v:f eqn="prod @7 21600 pixelWidth"  />\r\n<v:f eqn="sum @8 21600 0"  />\r\n<v:f eqn="prod @7 21600 pixelHeight"  />\r\n<v:f eqn="sum @10 21600 0"  />\r\n</v:formulas>\r\n<v:path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect"  />\r\n<o:lock v:ext="edit" aspectratio="t"  />\r\n</v:shapetype><v:shape id="_x0000_s1026" type="#_x0000_t75" alt=" " style=''position:absolute;\r\nmargin-left:35pt;margin-top:0;width:75pt;height:206.25pt;z-index:1;\r\nmso-wrap-distance-left:0;mso-wrap-distance-top:0;mso-wrap-distance-right:0;\r\nmso-wrap-distance-bottom:0;mso-position-horizontal:right;\r\nmso-position-horizontal-relative:text;mso-position-vertical-relative:line''\r\no:allowoverlap="f">\r\n<w:wrap type="square"  />\r\n</v:shape><![endif]--><!--[if !vml]--><!--[endif]--><span lang="IT"> Ciamis pada tahun 1964. Menghabiskan masa kecil sampai selesai tingkat SLTA di Ciamis. Jurusan Kimia IKIP Bandung membawanya menjadi seorang sarjana Kimia pada tahun 1988. Magister Manajemen Pendidikan diselesaikannya pada tahun 2003 di Universitas Islam Nusantara Bandung. </span></span></h4>\r\n<h4><span style="font-size: small;"><span class="sectiontablefooter"><span lang="IT"><br style="font-size: small;" /></span></span></span></h4>', 6, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (15, 'Struktur Organisasi', '<p align="center"><img src="../userfiles/image/Snap9.jpg" alt="" /></p>', 5, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (16, 'Prestasi', '<h3 align="center">PRESTASI SMA CINTA INDONESIA<br /> PERIODE 2002 s/d 2007</h3>\r\n<ul>\r\n<li>Juara<strong> </strong>Umum Olimpiade Sains (IMO, IPHO, IBO, ICHO, Informatika dan Astronomi) Tingkat Kabupaten Subang.</li>\r\n<li>Juara 1 Karya Ilmiah Remaja Tingkat Provinsi di ITB Bandung Tahun 2006.</li>\r\n<li>Juara III Karya Ilmiah Remaja Tingkat Nasional di UnBraw Malang tahun 2006.</li>\r\n<li>Juara I Siswa Teladan/Berprestasi Tingkat Provinsi Jawa Barat tahun 2005.</li>\r\n</ul>', 11, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (18, 'Kemitraan', '<ol>\r\n<li>Teacher Clearing House dengan SMA Negeri Jakarta. Merupakan kerjasama antar guru mata pelajaran untuk peningkatan kualitas guru dan pembelajaran. Dilaksanakan melalui media komunikasi telepon dan internet.</li>\r\n<li>Clearing House dengan The Manor CE Primary School South Gloucestershire, UK. Satu kerjasama yang diprakarsai oleh Depdiknas dan British Council untuk peningkatan kualitas pendidikan.</li>\r\n<li>Cosmopoint University Malaysia (dalam proses)</li>\r\n</ol>', 7, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (19, 'Kondisi Siswa', '<table style="width: 581px; height: 182px;" border="1" cellspacing="1" cellpadding="1">\r\n<tbody>\r\n<tr>\r\n<td style="text-align: center;"><strong>No<br /> </strong></td>\r\n<td style="text-align: center;"><strong>Kelas<br /> </strong></td>\r\n<td style="text-align: center;"><strong>L</strong></td>\r\n<td style="text-align: center;"><strong>P</strong></td>\r\n<td style="text-align: center;"><strong>Jumlah</strong></td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>1<br /> <br /> 2<br /> <br /> 3<br /> <br /> 4<br /> <br /> 5</p>\r\n</td>\r\n<td>Kelas X<br /> &nbsp; <br /> Kelas XI IPA<br /> <br /> Kelas XI IPS<br /> <br /> Kelas XII IPA<br /> <br /> Kelas XII IPS</td>\r\n<td>146<br /> <br /> 124<br /> <br /> 18<br /> <br /> 120<br /> <br /> 34</td>\r\n<td>172<br /> <br /> 162<br /> <br /> 27<br /> <br /> 172<br /> <br /> 34</td>\r\n<td>318<br /> <br /> 286<br /> <br /> 45<br /> <br /> 292<br /> <br /> 68</td>\r\n</tr>\r\n<tr>\r\n<td colspan="2"><strong>Total</strong></td>\r\n<td><strong>442</strong></td>\r\n<td><strong>567</strong></td>\r\n<td><strong>1009</strong></td>\r\n</tr>\r\n</tbody>\r\n</table>', 9, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (22, 'Komite Sekolah', '<p>Semenjak diluncurkannya konsep Manajemen Peningkatan Mutu Berbasis Sekolah dalam sistem manajemen sekolah, Komite Sekolah sebagai organisasi mitra sekolah memiliki peran yang sangat strategis dalam upaya turut serta mengembangkan pendidikan di sekolah. Kehadirannya tidak hanya sekedar sebagai stempel sekolah semata, khususnya dalam upaya memungut biaya dari orang tua siswa, namun lebih jauh Komite Sekolah harus dapat menjadi sebuah organisasi yang benar-benar dapat mewadahi dan menyalurkan aspirasi serta prakarsa dari masyarakat dalam melahirkan kebijakan operasional dan program pendidikan di sekolah serta dapat menciptakan suasana dan kondisi transparan, akuntabel, dan demokratis dalam penyelenggaraan dan pelayanan pendidikan yang bermutu di sekolah.</p>', 10, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (23, 'Prestasi Guru', '<ol>\r\n    <li>Inovasi Pembelajaran 2001 IV V Depdiknas</li>\r\n    <li>Keratifitas mengajar 2002 II V LIPI</li>\r\n    <li>Lomba Keberhasilan Guru dalam pembelajaran 2002 IV V Depdiknas</li>\r\n    <li>Lomba Keberhasilan Guru dalam pembelajaran 2003 Harapan III V Depdiknas</li>\r\n    <li>Sutarto Wasit Terbaik 2004 3 V KONI DKI</li>\r\n    <li>Sugeng S. Lomba Keberhasilan Guru dalam pembelajaran 2003 Finalis V Depdiknas</li>\r\n    <li>Sugeng S. Guru Berprestasi SMP / MTs 2004 III V Dinas P &amp; K Prop. Jawa Barat</li>\r\n    <li>Sugeng S. Guru Teladan 2004 I V Dinas P &amp; K Kabupaten Sukabumi</li>\r\n    <li>Bahar S. Lomba Keberhasilan Guru dalam pembelajaran 2005 Finalis V JSIT</li>\r\n    <li>Bahar S. Lomba Inovasi pembelajaran SMP 2006 III Balitbang Non Depdiknas</li>\r\n    <li>Bahar S. Guru Berprestasi SMP 2007 V Dinas P &amp; K Kabupaten</li>\r\n    <li>Bahar S. Lomba Keberhasilan Guru dalam pembelajaran 2007 Finalis V Depdiknas</li>\r\n    <li>Bahar S. Konferensi Guru Indonesia 2006 Pemakalah Terpilih V Sampurna Foundation Provisi Education</li>\r\n    <li>Bahar S. juara III,Lomba Guru Kreatif III se Jawa 2008,diselenggarakan di Semarang</li>\r\n</ol>', 5, 3, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (24, 'Beasiswa', '<p><span class="gen"><font class="storytitle"><b><span>1. [Belgium] Kuliah <span name="IL_SPAN"><input type="hidden" name="IL_MARKER" />Master</span> di Belgia Cuma 1 Juta</span></b></font></span></p>\r\n<p><font class="storycontent">Beberapa universitas di Belgia seperti Universiteit Ghent dan Universiteit Hasselt telah menerapkan peraturan baru untuk biaya kuliah Program Master. Bagi student yang berasal dari negara-negara berkembang termasuk Indonesia, hanya diwajibkan untuk membayar uang kuliah sebesar 80 Euro pertahun untuk program Master.<br />\r\nUntuk informasi biaya kuliah 80 euro di Universitet Ghent dapat dilihat di halaman website:<br />\r\n<a href="http://www.ugent.be/en/teaching/studentadmin/tuition/overview.htm">http://www.ugent.be/en/teaching/studentadmin/tuition/overview.htm</a><br />\r\nAtau check satu per satu tuition fee utk master course di Ghent:<br />\r\n<a href="http://www.opleidingen.ugent.be/studiekiezer/nl/int/index.htm">http://www.opleidingen.ugent.be/studiekiezer/nl/int/index.htm</a><br />\r\nUtk melihat universitas yang lain di Belgia bisa search di:<br />\r\n<a href="http://www.univ.cc">http://www.univ.cc</a> (pilih Belgium) </font></p>\r\n<p><span style="font-weight: bold;">2. </span><span class="gen"><font class="storytitle"><b><font class="storytitle">Program Beasiswa TNI Calon Perwira Prajurit Karier Untuk Mahasiswa S1</font></b></font></span></p>\r\n<p><font class="storycontent">Masih kuliah dan punya cita-cita jadi perwira TNI? Mau dapat beasiswa dan tunjangan selama menyelesaikan kuliah? Sekarang saatnya. Ayo daftar! <br />\r\n<br />\r\nTentara Nasional Indonesia memberi kesempatan kepada Mahasiswa berprestasi untuk menjadi Perwira TNI melalui Program Mahasiswa Beasiswa TNI Calon Perwira Prajurit Karier (Pa PK). <br />\r\n<br />\r\nKepada mahasiswa yang berminat, dapat mendaftarkan diri dengan syarat-syarat meliputi Warga Negara Indonesia Pria/Wanita (bukan Prajurit TNI, anggota POLRI dan PNS). Calon juga harus bertaqwa kepada Tuhan Yang Maha Esa, Setia dan taat kepada Pancasila dan UUD 1945.<br />\r\n<br />\r\nUntuk Kedokteran Umum minimal sudah Sarjana Kedokteran, sedangkan S1 lainnya minimal mencapai 110 SKS dan D3 minimal mencapai 80 SKS. <br />\r\nIPK minimal 2,40 untuk S 1 (Kedokteran Umum), S1 lainnya 2,80 dan D3 2,70. Usia maksimal pada saat menerima tunjangan beasiswa untuk Kedokteran Umum 27 tahun, sedangkan S1 lainnya 25 tahun dan D3 23 tahun. <br />\r\nCalon juga harus berkelakuan baik, sehat jasmani, rohani dan bebas narkoba. Tinggi badan minimal 163 cm bagi pria dan 155 cm bagi wanita. Sanggup tidak menikah selama mengikuti Program Mahasiswa Beasiswa. <br />\r\nTunjangan yang diberikan Rp 750.000 per bulan dan bantuan skripsi Rp 1.000.000. Waktu mendapat tunjangan untuk Dokter Umum 4 tahun, S1 lainnya 3 tahun dan D3 2 tahun. <br />\r\nSetelah menyelesaikan program studi, wajib mengikuti Dikma Pa PK TNI. <br />\r\nPendaftaran dibuka pada bulan Desember 2008 bertempat di Ajendam/Ajenrem/Makodim/Lantamal/Lanal/Lanud setempat/terdekat. <br />\r\nPenjelasan lebih rinci dapat ditanyakan di tempat pendaftaran (Panitia Daerah di tiap Provinsi) atau website <a href="http://www.tni.mil.id">www.tni.mil.id</a>, email: sperstni@yahoo.com. <br />\r\nSelama proses pendaftaran tidak dipungut biaya. Gratis! </font></p>', 5, 4, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (25, 'Ektrakurikuler', '<p>Kualitas tamatan sekolah dituntut untuk memenuhi standar kompetensi dunia kerja. Salah satunya, selain mampu menguasai materi pelajaran, siswa harus dapat berinteraksi dan aktif dalam hubungan sosial.</p>\r\n<p>Kegiatan ekstrakurikuler merupakan salah satu alat pengenalan siswa pada hubungan sosial. Di dalamnya terdapat pendidikan pengenalan diri dan pengembangan kemampuan selain pemahaman materi pelajaran.</p>\r\n<p>Berangkat dari pemikiran tersebut, di SMA Cinta Indonesia diselenggarakan berbagai kegiatan ekstrakurikuler.</p>\r\n<p>Selain OSIS sebagai induk kegiatan ektrakurikuler di sekolah, kegiatan ektrakurikuler lainnya adalah:</p>\r\n<ul>\r\n<li>Pramuka</li>\r\n<li>Paskibra</li>\r\n<li>Palang Merah Remaja (PMR)</li>\r\n<li>Patroli Keamanan Sekolah (PKS)</li>\r\n<li>Pecinta Alam (PA)</li>\r\n<li>Olahraga (Bola Voli, Bola Basket, Karate, Tenis Meja, Tenis Lapangan)</li>\r\n<li>Kerohanian / IRMA (Ikatan Remaja Mesjid Al-Forqon), dan</li>\r\n<li>Koperasi Sekolah (Kopsis)</li>\r\n</ul>', 3, 4, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (20, 'Kalender Akademik', '<center>\r\n<p><img src="../userfiles/image/kalender1.jpg" alt="" /></p>\r\n<p><img src="../userfiles/image/kalender2.jpg" alt="" /></p>\r\n<p><img src="../userfiles/image/kalender3.jpg" alt="" /></p>\r\n<p><img src="../userfiles/image/kalender4.jpg" alt="" /></p>\r\n<p><img src="../userfiles/image/kalender5.jpg" alt="" /></p>\r\n<p><img src="../userfiles/image/kalender6.jpg" alt="" /></p>\r\n</center>', 6, 3, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (17, 'Sarana & Prasarana', '<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td><a href="../images/denah24.jpg" target="_blank"><img src="../images/denah24.jpg" alt="" width="540" height="400" /></a></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><br /><br /></p>\r\n<p><strong>Keterangan </strong></p>\r\n<table style="width: 100%;" border="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top" width="120">1. Kls XII IPA 1<br /> 2. Kls XII IPA 2<br /> 3. Kls XII IPA 3<br /> 4. Kls XII IPA 4<br /> 5. Kls XII IPA 5<br /> 6. Kls XII IPS 3<br /> 7. Kls XII IPS 2<br /> 8. Kls XII IPS 1<br /> 9. Kls X-1/XI IPS 1<br /> 10. Kls X-2/XI IPS 2<br /> 11. Kls X-3/XI IPS 3<br /> 12. Kls X-4/XI IPA 1<br /> 13. Kls X-5/XI IPA 2<br /> 14. Kls X-6/XI IPA 3<br /> 15. Kls X-7/XI IPA 4</td>\r\n<td valign="top" width="120">16. Kls X-8/XI IPA 5<br /> 17. Perpustakan/ Warnet<br /> 18. Lab Komputer<br /> 19. Lab Biologi<br /> 20. Lab Bahasa<br /> 21. Lab Kimia<br /> 22. Lab Multimedia<br /> 23. Lab IPS<br /> 24. R. Kepsek<br /> 25. R. Tata Usaha<br /> 26. R. Lobi<br /> 27. R. Guru<br /> 28. R. OSIS<br /> 29. R. PMR<br /> 30. R. BK/BP</td>\r\n<td>31. R. Piket<br /> 32. R.Pramuka/Paskibra<br /> 33. R.Kapela/Bianglala<br /> 34. Gudang<br /> 35. Masjid<br /> 36. R. DKM<br /> 37. R. Satpam<br /> 38. R. UKS<br /> 39. Padepokan Seni<br /> 40. GreenHouse<br /> 41. Parkir<br /> 42. Mushala Guru<br /> 43. WC Guru<br /> 44. R. Cetak<br /> 45. R. Wakasek<br /> 46. Dapur</td>\r\n<td>47. WC Guru<br /> 48. WC Laki-laki<br /> 49. WC Perempuan<br /> 50. Koperasi<br /> 51. Kantin<br /> 52. WC Perempuan<br /> 53. WC Laki-laki<br /> 54. G. Olahraga<br /> 55. Gudang Biologi<br /> 56. Gudang Fiska<br /> 57. Gudang Kimia<br /> 58. R. EC<br /> 59. Panggung Terbuka<br /> 60. Lap. Olahraga<br /> 61. R. Server <br /> 62. R. KPMP TIK</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><br /> <br /> <strong>Arsitektur Jaringan Komputer</strong></p>\r\n<table border="1" cellspacing="0" cellpadding="0" align="left">\r\n<tbody>\r\n<tr>\r\n<td><a href="../images/lan24.jpg" target="_blank"><img src="../images/lan24.jpg" alt="" width="540" height="380" /></a></td>\r\n</tr>\r\n</tbody>\r\n</table>', 3, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (10, 'Lokasi Sekolah', '<center><a href="../images/peta1.jpg" target="_blank"><img id="gambar" src="../images/peta1.jpg" alt="" width="400" height="320" /></a></center>', 0, 0, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (26, 'Peta Situs', '<p><strong>Peta Situs Utama</strong></p>\r\n<p><strong>Profil</strong></p>\r\n<ol>\r\n    <li><a href=profil.php?id=profil&kode=4>Sejarah Singkat</a></li>\r\n    <li><a href=profil.php?id=profil&kode=3>Visi dan Misi</a></li>\r\n    <li><a href=profil.php?id=profil&kode=7>Struktur Organisasi</a></li>\r\n    <li><a href=profil.php?id=profil&kode=5>Program Kerja</a></li>\r\n    <li><a href=profil.php?id=profil&kode=11>Kemitraan</a></li>\r\n    <li><a href=profil.php?id=profil&kode=9>Sarana & Prasarana</a></li>\r\n    <li><a href=profil.php?id=profil&kode=12>Kondisi Siswa</a></li>\r\n    <li><a href=profil.php?id=profil&kode=6>Kepala Sekolah</a></li>\r\n    <li><a href=profil.php?id=profil&kode=8>Prestasi</a></li>\r\n    <li><a href=profil.php?id=profil&kode=21>Komite Sekolah</a></li>\r\n    <li><a href=profil.php?id=profil&kode=34>Kontak Sekolah</a></li>\r\n</ol>\r\n<p><strong><br />\r\nGuru</strong></p>\r\n<ol>\r\n    <li><a href=guru.php?id=dbguru>Direktori Guru</a></li>\r\n    <li><a href=guru.php?id=silabus>Silabus</a></li>\r\n    <li><a href=guru.php?id=materi>Materi Ajar</a></li>\r\n    <li><a href=guru.php?id=soal>Materi Evaluasi</a></li>\r\n    <li><a href=guru.php?id=profil&kode=14>Kalender Akademik</a></li>\r\n    <li><a href=guru.php?id=profil&kode=23>Prestasi Guru</a></li>\r\n</ol>\r\n<p><strong><br />\r\nSiswa</strong></p>\r\n<ol>\r\n    <li><a href=siswa.php?id=dbsiswa>Direktori Siswa</a></li>\r\n    <li><a href=siswa.php?id=prestasi>Prestasi Siswa</a></li>\r\n    <li><a href=siswa.php?id=profil&kode=24>Beasiswa</a></li>\r\n    <li><a href=siswa.php?id=profil&kode=24>OSIS</a></li>\r\n    <li><a href=siswa.php?id=profil&kode=25>Ektrakurikuler</a></li>\r\n</ol>\r\n<p><br />\r\n<strong>Alumni</strong></p>\r\n<ol>\r\n    <li><a href=alumni.php?id=data>Direktori Alumni</a></li>\r\n    <li><a href=alumni.php?id=info>Info Alumni</a></li>\r\n</ol>\r\n<p><strong><br />\r\nFitur</strong></p>\r\n<ol>\r\n    <li><a href=index.php?id=agenda>Agenda</a></li>\r\n    <li><a href=index.php?id=artikel>Artikel</a></li>\r\n    <li><a href=index.php?id=info>Info</a></li>\r\n    <li><a href=index.php?id=berita>Berita</a></li>\r\n    <li><a href=index.php?id=buku>Buku Tamu</a></li>\r\n    <li><a href=index.php?id=project>Opini</a></li>\r\n    <li><a href=index.php?id=dafblog>Daftar Blog</a></li>\r\n    <li><a href=index.php?id=link>Link</a></li>\r\n    <li><a href=index.php?id=galeri>Galeri Photo</a></li>\r\n</ol>\r\n<p><strong>Peta Situs Komunitas Sekolah</strong> (Member)</p>\r\n<ol>\r\n    <li><a href=../user/index.php?id=myprofil>Profil Member</a></li>\r\n    <li><a href=../user/index.php?id=conlist>Data Kontak</a></li>\r\n    <li><a href=../user/index.php?id=member>Anggota</a></li>\r\n    <li><a href=../user/index.php?id=message>Pesan</a></li>\r\n    <li><a href=../user/index.php?id=cek_login#>Chat</a></li>\r\n    <li><a href=../user/index.php?id=myproject>Opini</a></li>\r\n    <li><a href=../user/index.php?id=forum>Diskusi</a></li>\r\n    <li><a href=../user/index.php?id=infoalumni>Info Alumni</a></li>\r\n    <li><a href=../user/guru.php?id=materi>Materi Ajar</a></li>\r\n</ol>', 10, 6, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (27, 'Kontak Sekolah', '<p>&nbsp;</p>\r\n<center><a href="../images/peta1.jpg" target="_blank"><img src="../images/peta1.jpg" alt="" width="300" height="200" /></a><br />\r\n<p><strong>SMA CINTA INDONESIA<br /></strong></p>\r\n<p>Alamat: Jl. Jendral Sudirman,Senayan Jakarta Indonesia</p>\r\n<p>Telepon: +62-021-6666666</p>\r\n<p>Fax: + 62-021-6666667</p>\r\n<p>Email: info@smacintaindonesia.sch.id</p>\r\n<p>Web: www.smacintaindonesia.sch.id</p>\r\n<p>Administrator:&nbsp;admin@smacintaindonesia.sch.id</p>\r\n</center>', 11, 6, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (1, 'Home', '<p>-</p>', 1, 0, 'index.php', 0, '_self');
INSERT INTO `t_profil` VALUES (2, 'Profil', '<p>-</p>', 2, 0, 'profil.php', 0, '_self');
INSERT INTO `t_profil` VALUES (3, 'Guru', '-', 3, 0, 'guru.php', 0, '_self');
INSERT INTO `t_profil` VALUES (4, 'Siswa', '-', 4, 0, 'siswa.php', 0, '_self');
INSERT INTO `t_profil` VALUES (5, 'Alumni', '-', 5, 0, 'alumni.php', 0, '_self');
INSERT INTO `t_profil` VALUES (7, 'Blog', '-', 7, 0, '../blog/', 1, '_blank');
INSERT INTO `t_profil` VALUES (8, 'Elearning', '-', 8, 0, '../elearning/', 1, '_blank');
INSERT INTO `t_profil` VALUES (6, 'Fitur', '-', 6, 0, 'index.php', 0, '_self');
INSERT INTO `t_profil` VALUES (28, 'Direktori Guru', '<p>-</p>', 1, 3, 'guru.php?id=dbguru', 0, '_self');
INSERT INTO `t_profil` VALUES (29, 'Silabus', '-', 2, 3, 'guru.php?id=silabus', 0, '_self');
INSERT INTO `t_profil` VALUES (30, 'Materi Ajar', '-', 3, 3, 'guru.php?id=materi', 0, '_self');
INSERT INTO `t_profil` VALUES (31, 'Materi Uji', '-', 4, 3, 'guru.php?id=soal', 0, '_self');
INSERT INTO `t_profil` VALUES (32, 'Direktori Siswa', '-', 1, 4, 'siswa.php?id=dbsiswa', 0, '_self');
INSERT INTO `t_profil` VALUES (33, 'Prestasi Siswa', '-', 2, 4, 'siswa.php?id=prestasi', 0, '_self');
INSERT INTO `t_profil` VALUES (34, 'Direktori Alumni', '-', 1, 5, 'alumni.php?id=data', 0, '_self');
INSERT INTO `t_profil` VALUES (35, 'Info Alumni', '-', 2, 5, 'alumni.php?id=info', 0, '_self');
INSERT INTO `t_profil` VALUES (36, 'Agenda', '-', 1, 6, 'index.php?id=agenda', 0, '_self');
INSERT INTO `t_profil` VALUES (37, 'Artikel', '-', 2, 6, 'index.php?id=artikel', 0, '_self');
INSERT INTO `t_profil` VALUES (38, 'Info', '-', 3, 6, 'index.php?id=info', 0, '_self');
INSERT INTO `t_profil` VALUES (39, 'Berita', '-', 4, 6, 'index.php?id=berita', 0, '_self');
INSERT INTO `t_profil` VALUES (40, 'Buku Tamu', '-', 5, 6, 'index.php?id=buku', 0, '_self');
INSERT INTO `t_profil` VALUES (41, 'Opini', '-', 6, 6, 'index.php?id=project', 0, '_self');
INSERT INTO `t_profil` VALUES (42, 'Daftar Blog', '-', 7, 6, 'index.php?id=dafblog', 0, '_self');
INSERT INTO `t_profil` VALUES (43, 'Link', '-', 8, 6, 'index.php?id=link', 0, '_self');
INSERT INTO `t_profil` VALUES (44, 'Galeri Photo', '-', 9, 6, 'index.php?id=album', 0, '_self');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_programahli`
-- 

CREATE TABLE `t_programahli` (
  `idprog` int(11) NOT NULL auto_increment,
  `program` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`idprog`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=12 ;

-- 
-- Dumping data for table `t_programahli`
-- 

INSERT INTO `t_programahli` VALUES (1, '-');
INSERT INTO `t_programahli` VALUES (2, 'IPA');
INSERT INTO `t_programahli` VALUES (3, 'IPS');
INSERT INTO `t_programahli` VALUES (4, 'Bahasa');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_project`
-- 

CREATE TABLE `t_project` (
  `id` int(10) NOT NULL auto_increment,
  `judul` varchar(100) collate latin1_general_ci NOT NULL default '',
  `deskripsi` longtext collate latin1_general_ci NOT NULL,
  `userid` int(10) NOT NULL default '0',
  `tanggal` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `status` char(1) collate latin1_general_ci NOT NULL default '',
  `visit` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_project`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_project_com`
-- 

CREATE TABLE `t_project_com` (
  `id` int(10) NOT NULL auto_increment,
  `komentar` text collate latin1_general_ci NOT NULL,
  `id_project` int(10) NOT NULL default '0',
  `userid` int(10) NOT NULL default '0',
  `tanggal` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_project_com`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_semester`
-- 

CREATE TABLE `t_semester` (
  `idsem` int(11) NOT NULL auto_increment,
  `semester` int(2) default NULL,
  PRIMARY KEY  (`idsem`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=16 ;

-- 
-- Dumping data for table `t_semester`
-- 

INSERT INTO `t_semester` VALUES (1, 1);
INSERT INTO `t_semester` VALUES (2, 2);

-- --------------------------------------------------------

-- 
-- Table structure for table `t_silabus`
-- 

CREATE TABLE `t_silabus` (
  `id` int(5) NOT NULL auto_increment,
  `pelajaran` varchar(100) collate latin1_general_ci NOT NULL default '',
  `file` varchar(50) collate latin1_general_ci NOT NULL default '',
  `visit` int(10) NOT NULL default '0',
  `ket` text collate latin1_general_ci NOT NULL,
  `kelas` varchar(20) collate latin1_general_ci NOT NULL default '',
  `tanggal` varchar(20) collate latin1_general_ci NOT NULL default '',
  `semester` int(2) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `t_silabus`
-- 

INSERT INTO `t_silabus` VALUES (1, 'Fisika', '0', 12, 'Silabus ini dibuat untuk memperjelas rangkaian materi ajar yang dirancang oleh Guru-guru MGMP Kota Bandung', 'XI', '', 1);
INSERT INTO `t_silabus` VALUES (2, 'Matematika', 'sil2.rar', 24, 'Silabus ini terdiri dari beberapa ringkasan materi.', 'X', '07/05/2006 22:55:52', 2);
INSERT INTO `t_silabus` VALUES (6, 'B. Inggris', 'sil6.doc', 0, 'adasdsa', 'a', '11/01/2009 16:45:30', NULL);
INSERT INTO `t_silabus` VALUES (5, 'Biologi', 'sil5.doc', 3, 'sdas', 'X', '09/12/2008 00:13:32', 1);
INSERT INTO `t_silabus` VALUES (7, 'Akuntansi', 'sil7.zip', 0, 'asas', 'x-a', '17/04/2011 10:11:21', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `t_siswa`
-- 

CREATE TABLE `t_siswa` (
  `user_id` varchar(25) collate latin1_general_ci NOT NULL default '',
  `nama` varchar(30) collate latin1_general_ci NOT NULL default '',
  `kelas` varchar(10) collate latin1_general_ci NOT NULL default '',
  `alamat` varchar(60) collate latin1_general_ci default NULL,
  `tgl_lahir` varchar(15) collate latin1_general_ci NOT NULL default '00/00/0000',
  `telp` varchar(15) collate latin1_general_ci default NULL,
  `agama` varchar(10) collate latin1_general_ci NOT NULL default '',
  `kelamin` char(1) collate latin1_general_ci NOT NULL default '',
  `tmp_lahir` varchar(20) collate latin1_general_ci NOT NULL default '',
  `tgl_input` varchar(15) collate latin1_general_ci NOT NULL default '',
  `sttb` varchar(10) collate latin1_general_ci NOT NULL default '',
  `nem` varchar(10) collate latin1_general_ci NOT NULL default '',
  `wali` varchar(50) collate latin1_general_ci NOT NULL default '',
  PRIMARY KEY  (`user_id`),
  KEY `kelas` (`kelas`),
  KEY `kelas_2` (`kelas`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `t_siswa`
-- 

INSERT INTO `t_siswa` VALUES ('070810005', 'ANNY MAULINA', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810006', 'ASSYIFA NOERLAELY MARYAM', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810007', 'AULIA TIARA', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810008', 'BAYU INDRAJIT', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810009', 'DESTRINA ALIN SUDARSONO', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810010', 'DIAN ROSA LINA', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810011', 'DWI APRIANTO NUGROHO', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810012', 'FIKRI HUMAM MANAR AMRI', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810013', 'FLORENTIA THRISTIANTI', 'X - 1', '-', '01/01/2008', '-', 'PROTESTAN', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810014', 'GESTI SEPTIA SUWANDI PUTRI', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810015', 'GWYNUFKE BELVA GUSTHA', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810016', 'HAMZA AGUNG SEDAYU', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810017', 'HENRIAN STIAWAN', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810018', 'IMAN LUKMANUL HAKIM', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810019', 'KAMILATUSSYAFIQOH', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810020', 'LAKSITA RARASTRIA KHARIMA', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810021', 'LUKMAN NUL HAKIM', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810022', 'MUHAMMAD FULKI FAUZAN', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810023', 'MIDA RUYATI LAILA', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810024', 'MOETCHIA RIZKY  SAFARO', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810025', 'MOHAMMAD SETYA WARDHANA', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810026', 'MUHAMAD RISFAN SYARID PRATAMA', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810027', 'MUHAMMAD ABDUL IZZATUR RAHMAN', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810028', 'MUHAMMAD AFFAN SYAHRUL', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810029', 'MUHAMMAD ICHSAN ABDILLAH', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810030', 'NABILLA RHAMDANI', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810031', 'PENI NURVIANI YUNANSYAH', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810032', 'PRITANIA SAVITRI', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810033', 'RANDI PRATAMA PUTRA', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810034', 'RANGGA DWIPUTRA', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810035', 'RIFAN AHMAD FAUZI', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810036', 'RISLI DIHYAT', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810037', 'RIZKI NUGRAHA', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810038', 'SHINTA WILLIANI', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810039', 'WARDA MARISA FITHRI', 'X - 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810041', 'ABDILLAH SYAFAAT', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810042', 'ADAM PRIYADI', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810043', 'ADHITYA DARMAWAN', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810044', 'ALGI DESTIA', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810045', 'ALWIN MUHAMMAD REZA FAHMI H.', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810046', 'ANGGI NOVIA REGINA', 'X - 2', '-', '01/01/2008', '-', 'PROTESTAN', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810047', 'ARINI KURNIAWATI', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810048', 'DEA FADILLAH DAMAI', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810049', 'DEDEN YUSUP', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810050', 'EDWIN HERDIANSYAH', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810051', 'EKY SEPTIAN PRADANA', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810052', 'ENNA AGUSTINA MARDIKA', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810053', 'FAISAL AGUNG WASKITO', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810054', 'FITRI NURAENI', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810055', 'HENDRA GUNAWAN', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810056', 'INTAN MUFIDAH', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810057', 'IRINA TRIANISA NURHASNI', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810058', 'IRMA GUSRIANI', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810059', 'MEKKA FITRIA', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810060', 'MIRANDA AYU PUTRI RAMADHANTIE', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810061', 'NOVI UJIANNINGTYAS', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810062', 'NURIKA OKTAVIA', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810063', 'NURLIA RUBIYANTI', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810064', 'PUTRI HIDAYANI', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810065', 'RANI RISKA MAULIDA', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810066', 'RARA PRAWITA MUSTIKA ADYA', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810067', 'RENDY RISYANDI S.', 'X - 2', '-', '01/01/2008', '-', 'PROTESTAN', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810068', 'RIFKI RAMDHAN', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810069', 'RINNY KOMARASARI', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810070', 'RISKA PADMI DWI UTAMI', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810071', 'RIZKY FADILLAH', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810072', 'SERAMBI DAMAI DWIKA', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810073', 'TANIA YUNIARTI', 'X - 2', '-', '01/01/2008', '-', 'KRISTEN', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810074', 'UTAMI BUDIANI', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810075', 'VANI MAULIDA', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810076', 'VYANDA GRISHEILLA', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810077', 'WAHYU PURNAMA', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810078', 'WIDA WIDIYANTI', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810079', 'YENI FEBRIANTI', 'X - 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810080', 'ANDERA VERENA', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810081', 'ANISA NUR AISAH', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810082', 'ANSHA CERBIA', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810083', 'ARDHI RAHMAN FAUZI', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810084', 'BUNGSU SAPTA PERBANI', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810085', 'CICI TRI SUPARNI', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810086', 'DEDE DZURROTUN NISA', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810087', 'DIAN WIDIANA', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810088', 'EGGA GUNAWAN', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810089', 'ELFRIDA PUSPITASARI', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810090', 'ERICK RAHMAT DENIAR', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810091', 'EUNEKE WIDYANINGSIH', 'X - 3', '-', '01/01/2008', '-', 'PROTESTAN', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810092', 'FERONIKA', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810093', 'FEVI TUTIANA DEWI', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810094', 'FIRDHA CAHYA ALAM', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810095', 'FITRIANI', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810096', 'HAFSARI DEWI FILONIA', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810097', 'HENI MARDIANI', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810098', 'JEFF PRASETIA PAPAR', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810099', 'MOCHAMAD ARDIANSYAH', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810100', 'MUGI KHAIRUL MUSLIM', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810101', 'MUHAMMAD AL HASAN', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810102', 'NURISA FAZRI', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810103', 'PERMANA NUGRAHA WIRASAPUTRA', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810104', 'PRAWIRA YUDHA KOMBARA', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810105', 'RADITYO GARRY', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810106', 'RAMDHAN SEPTIANI', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810107', 'REGINA REPTIANI', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810108', 'RESI ROSANTI', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810109', 'RISKA ANGGRAENI', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810110', 'RIZA CRISTY AGUSTIN', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810111', 'RIZKI PURNAMA DEWI', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810112', 'SHALHA UBAID SALIM', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810113', 'SILMI SYAHIDAH', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810114', 'SILVINA GONISTILANI DEWI', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810115', 'TIARA MEGAWATI', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810116', 'VANIA RAKHMADHANI', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810117', 'VICKY RIANA DEVITA', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810118', 'WADA VALENTIN HARSONO', 'X - 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810119', 'ADIMAS FIQRI RAMDHANSYA', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810120', 'ANDRE ARIESMANSYAH', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810121', 'ANGGI AMANDA', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810122', 'ARINALDI TEGAR PRAKOSA', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810123', 'ARNI WILARNI', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810124', 'ASRI LASIDO ALAWIYAH WAHYU', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810125', 'BOMBI KAMANGGARA', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810126', 'DANIEL EKO SAPUTRA MANURUNG', 'X - 4', '-', '01/01/2008', '-', 'KATHOLIK', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810127', 'DIAZ SYAFITRI RISDIANI', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810128', 'DINI MALIANTI', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810129', 'DITA DISAINA', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810130', 'EKA ANDIKA PUTRI', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810131', 'ENI ROHAENI', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810132', 'FANY ADHIATI', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810133', 'FEMY NURYANTI', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810134', 'GERRY YOKA PURNAMA  PUTRA', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810135', 'GHINA LUTHFY NURUTAMI', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810136', 'GUMELAR AHMAD MUHLIS', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810137', 'HANDOKO PRAMULYO', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810138', 'HERAWATI MURTI GUSTIANI', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810139', 'HILMAN ARRASYID', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810140', 'KHOIRUL ANAM GUMILAR WINATA', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810141', 'MEGA NUR OCTAVIA', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810142', 'MILA YANUAR PERTIWI', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810143', 'NENI AMELIA', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810144', 'NINA KURNIATI', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810145', 'RINRIN RINA ESTIANA', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810146', 'RIZKY IKHWANUSHAFA', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810147', 'ROSMAYANTI', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810148', 'SELLY ANGRIANI PUTRI', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810149', 'SISKA ARLIANI', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810150', 'SUCI WULANSARI', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810151', 'SUMIATY', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810152', 'SYAMSUL MAARIF', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810153', 'TANTYO WICAKSONO', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810154', 'TINI YUNIAR', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810155', 'TITA RAHAYU', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810156', 'TRESNA FAISA SUWANJANA', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810157', 'YOGA TAUFIQ RAMDHANI', 'X - 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810158', 'ALRIEN SYAUMI UTAMI', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810159', 'ANNIS YURIANTI', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810160', 'ASTI OKTAVIANI', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810161', 'AYU WAHYUNI', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810162', 'CINDY ANGGELINA CAHYADI', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810163', 'DESI HERLIANI', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810164', 'DINI AYU LESTARI', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810165', 'DJAELANI SHIDIQ', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810166', 'DYLAN RIZKY KURNIAWAN MUNTHE', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810167', 'ELSYA FERADINA', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810168', 'ERNI NURPRATIWI', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810169', 'FEBBY ANJANI', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810170', 'FULKI BRAMANTYA', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810171', 'ILYAS GUNA WIJAYA', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810172', 'INCHAN PRATIWI', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810173', 'INTAN PERMATA INDAH', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810174', 'KAUTSAR NAJLA', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810175', 'MUHAMAD RYAN PERMANA', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810176', 'MUHAMMAD ANWAR ROSYIDIN', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810177', 'NICKEN BUDI AYU', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810178', 'NUR KUMALADEWI', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810179', 'PERMANA JAYA HIKMAT', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810180', 'PUJI ARTI RACHMAWATI', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810181', 'RACHMAT ADI SUPRAPTO', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810182', 'RINA TRI UTARI', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810183', 'RISMA HANDAYANI', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810184', 'RIZKA AULIA AFIFAH', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810185', 'SANDY AIDUL AMMARULLAH', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810186', 'SHINTA ROHMATIKA KOSMAGA', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810187', 'SOVIA DEWI MULIASARI', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810188', 'SULAIMAN', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810189', 'TIAN PRADIANI', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810190', 'VENANSIUS ANDREA RAHMOYO PUTRO', 'X - 5', '-', '01/01/2008', '-', 'KATHOLIK', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810191', 'VETTY FATIMAH', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810192', 'VIAN MULYANI', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810193', 'WAARITSU', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810194', 'YASOKA DEWI', 'X - 5', '-', '01/01/2008', '-', 'PROTESTAN', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810195', 'YUDHI DWI PERMADI', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810196', 'ZACKI ERFIYANTO', 'X - 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810197', 'ABI RIKOBI', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810198', 'ARI PRATAMA PUTRA', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810199', 'ASTRI LESTARI', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810200', 'BAGJA GUMILAR', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810201', 'BINA NGUMBARA BENJAMIN', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810202', 'BUDI SETIADY', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810203', 'DEA PRAHASTI RACHMI', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810204', 'DESTIANTY NUR ARTIANINGSIH', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810205', 'DEWI NURAISYAH', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810206', 'DINA HIRTASARI', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810207', 'DWIKA ANDJANI', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810208', 'EGGI DARMAWAN', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810209', 'ERNA YULIANA', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810210', 'EVI  PRATIWI', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810211', 'FADLI APRIANTO', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810212', 'FITRI RIZKIA GAHARI', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810213', 'GUSTIANI SAFITRI', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810214', 'HERIKA SURYA PRATAMA', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810215', 'IIH CARLA RAHMAYANTI', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810216', 'IIS MAESAROH', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810217', 'IRWAN MULYANA', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810218', 'JERIZAL YULIANTO', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810219', 'MOCHAMMAD ARIF RACHMAN HERNOMO', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810220', 'MUTAMINAH', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810221', 'NAJMIA RAHMA', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810222', 'NOVI RASMAYANTI', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810223', 'NURAMALIA MURSYIDAH', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810224', 'NURUL ULA SAYYIDATUNNISA', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810225', 'REDHA ASHADI NOVANDRA', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810226', 'REVI PEBRIAN', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810227', 'RINDI CAHYA WULANDARI', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810228', 'RUDY SULAEMAN', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810229', 'SEILEN HAFDARA NURDIN', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810230', 'SUCI HARTANTI', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810231', 'TAUFIK MAULANA ABDILLAH', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810232', 'TRIE DAMAYANTI', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810233', 'VANIA DECONE JOLANDA', 'X - 6', '-', '01/01/2008', '-', 'PROTESTAN', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810234', 'WIDIARTI', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810235', 'WULAN IKE TRISNAYANTI', 'X - 6', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810236', 'AFGHAN MUHAMMAD JIHAD', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810237', 'ANNEKE PUTRI', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810238', 'ANNISA MUTHOHAROH', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810239', 'ARIS BAHTIAR', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810240', 'AYI KULSUM ZAM ZAM', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810241', 'DEA DINAR BIMBI HARDIANTI', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810242', 'DEVI MELINDA DWI PUTRI', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810243', 'DIMAS ALPARIZI', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810244', 'DINY FEBRIANY HASANAH', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810245', 'DONA HAYUNNALITA RUSMANA', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810246', 'GEBY FERARIANA', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810247', 'IKBAL SAEFUL AZIS', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810248', 'INDRIYANTI HANDAYANI', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810249', 'KAHFI ALI PERDANA', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810250', 'KEYNE  HADRIAN', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810251', 'LEA AMELIA LESTARI', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810252', 'MOCHAMAD HILMY RAMADHAN', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810253', 'M. NUR ADNAN', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810254', 'MAYA CYTA PUSPITA', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810255', 'MUHAMAD RIDWAN FAUZI', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810256', 'MUHAMMAD FAKHRI FARGHANI', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810257', 'NADYA SALSA', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810258', 'NOVITA NURAENI', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810259', 'NURI NURMALASARI KUSUMAH', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810260', 'NURUNISA ALAWIYAH', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810261', 'OVTA REZKA AMIJAYA', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810262', 'PRASETYO WICAKSONO DARMAWAN', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810263', 'RADEN DELIQUE DIERATU KAMAN', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810264', 'REZHA WIDIATMAJA', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810265', 'RINI SUTINI', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810266', 'RIZKI DWI SYAHRIZAL', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810267', 'RUDINI HADI WIBOWO', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810268', 'SEPTIANI WAHYUNING PRATIWI', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810269', 'SONI SONJAYA', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810270', 'SYAFIRA AMELIA SUDARSYAH', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810271', 'THIO ANGGA PRAKOSO', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810272', 'TINA NUR FAIDAH', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810273', 'TRISTI LARASATI', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810274', 'WIDA KANIA KHULSUM', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810275', 'WINDA PURNAMA', 'X - 7', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810276', 'ADITHYA NUGRAHA', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810277', 'ADITYA RAHMAT GUMILAR', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810278', 'ANANTIA FIRDA ATHIANA', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810279', 'APRILLIA AYU LESTARI PERMANA', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810280', 'ASTRI ARYANI', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810281', 'AYU TRILISTIANI', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810282', 'BAYU YOGATAMA', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810283', 'CHAERUNISSA RIZKY MAULIDA', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810284', 'CHANDRAWAN SATRIA', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810285', 'CICILIA NATALIA', 'X - 8', '-', '01/01/2008', '-', 'KATHOLIK', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810286', 'CINDY PIRU DWINTASARI', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810287', 'CUCU SAEPUDIN', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810288', 'DEBBY PERMATASARI', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810289', 'DEVI MEILIA', 'X - 8', '-', '01/01/2008', '-', 'PROTESTAN', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810290', 'DIAN MEGA PRATIWI', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810291', 'DWI PAWESTRI SULISTIANI', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810292', 'ERWIN ADITYA PRAWIRANATA', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810293', 'FANY APRILLIANY S.', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810294', 'FRISDI STAMANDA', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810295', 'ILHAM JUANDA', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810296', 'INDRABAYU', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810297', 'INSAN ANUGRAH GUSTI', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810298', 'INTAN SITI NUGRAHA', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810299', 'KOMALA SRI HERYANI', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810300', 'L.A. ARIF NUGRAHA', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810301', 'MOCHAMAD DZULKIFLY AL SATRIA', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810302', 'MALINDA IRIANI', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810303', 'MISNI MABRUROH', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810304', 'NENENG HOERUNNISA', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810305', 'NINDYA DEVI MENTARI', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810306', 'NOVI NURWANTY', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810307', 'NUR RISKI KINTARTI', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810308', 'NURHADI FIRMANA', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810309', 'NURINA NURDINI', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810310', 'PRASETYO HADI NUGROHO', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810311', 'RESTI INDRIARTI', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810312', 'RISCA NUR FITRIANI', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810313', 'SEPTIAN NUR JAMAL', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810314', 'WULANDARI SUKMANING TASRIPIN', 'X - 8', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071191', 'MOCHAMAD ILHAM', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071236', 'MOHAMMAD RIZALUL FIKRI', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071275', 'MUHAMMAD IQBAL', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071276', 'MUHAMMAD RHEZA ALFIN', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071277', 'NANIK SEPTIANUR', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071240', 'NOVI GINANJAR RAHAYU', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071195', 'NOVYA NOFIYANTY NURYANTI', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071278', 'NURUL AMANAH SOLIHAT', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071282', 'PRIMA HARTIO', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071284', 'PUTRI WULANDARI', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811328', 'R. ZAKI MIFTAHUL FASA', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071197', 'RADEN LUCKY DARMAWAN', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071072', 'RISKA NURBAYA', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071287', 'RIZGIA', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071201', 'RIZKY RESTAFAUZI SUPANDI', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071162', 'SHADAM HUSSAERI HANDY PRATAMA', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071250', 'SUGIH PRATAMA', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071251', 'TAUFIK ARIANSYAH', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071330', 'THIOREDI PUTRA HERMAWAN', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071332', 'ULFAH OKTA ADITYA', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071295', 'YOSEF HERY HIDAYAT', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071335', 'YOVITA YUNIAR RAMLY', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071336', 'YULIANTI', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071337', 'YUSI NUR RAMADHAN', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811329', 'ADITYAN AGUNG S.', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811330', 'AINI NURUL IMAN', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071170', 'ALDY NOVA DYANSYAH', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811331', 'ANJAR BIMA PRAKOSO', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071215', 'ASDIT LEONITARA', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071087', 'AYU KUSUMANINGTYAS', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811332', 'BADAR TEGUH MANSIK', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071217', 'BANGKIT ERAWAN', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071011', 'DEWI SUSLIANA FAUZANI', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071049', 'DHANDY ARDIANSYAH', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071050', 'DICKY BAGJA RAMADHAN', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071091', 'DINAR YUANISA', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071093', 'EKA RAHMAWATI', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071370', 'FAKHMI FAKHRUR RAZI', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071097', 'FIKA ANDINA', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071014', 'HAEKAL WARDANA', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071016', 'IRMA TRI SAFARINA', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071017', 'JOSI MEIKA MUTMAINAH', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071018', 'KANIA WIDYATAMI', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071019', 'KATHARINA RISKA WULANDARI', 'XI IPA 1', '-', '01/01/2008', '-', 'PROTESTAN', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071020', 'LAILY HERNI KURNIAWATI', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071021', 'MARTINA ANISA DEWI', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071373', 'MOHAMMAD KEVIN ARNAS', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071022', 'MUFTI MUHTADI', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071111', 'NADIA FARHANI', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071026', 'PIA ZAKIYAH', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071066', 'PUSPASARI RESPATININGTYAS', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071027', 'RAHMI FATHONAH', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071070', 'RENI KUSTINA SANDI', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071028', 'RENNY UTAMININGSIH HARSANTO', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071029', 'RIRI AYU DERIARI', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071071', 'RISA DEWI', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071033', 'RIZKI ALIEF FAJARINI', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071160', 'RUNI RACHMALINA UTARI', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071034', 'SRI MULYANI', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071081', 'TEGUH ALAM PUTRA', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071035', 'TEGUH NUGRAHA', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071037', 'VERNIDA MUFIDAH', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071166', 'VINDA DWI OKTOVIYANDA', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071294', 'WILDAN AHMAD FIRDAUS', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071039', 'YULIANI HAJIMINAWATI', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071040', 'YURI INDRIYANI YEUYANAN', 'XI IPA 1', '-', '01/01/2008', '-', 'KATOLIK', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071168', 'YUSUF BUHORI MAULANA', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071041', 'ZAIM SIDQI ISLAMI', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071042', 'ZILKA PRIANDITYO', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071254', 'AGYS SISKA GICIA', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071211', 'AHMAD SUPRIANTO', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071300', 'ALDI RHINALDI ABDUL GANI', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071212', 'ALVIANDO RESTU PRATAMA', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071130', 'AMALIA NURPITRIYANI', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071301', 'ANDARI', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071375', 'APRILITA LESTARI RESCHO', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071385', 'DESI SUSANTI', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071096', 'FEDY FADILAH', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071311', 'FITRIA ENDAH PERMATA SARI', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071053', 'FUJA PRATAMA', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071055', 'GILAR DWIGUNA ARIEF RACHMAN', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071265', 'HANA ROVIANI', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071101', 'INDRA HERMAWAN', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071104', 'ISTI SOFIA INSANI', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071057', 'KINSYA ABDURRAHMAN', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071150', 'LASTRI RAHAYU', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071190', 'LUKMAN GALIH NUGRAHA', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071058', 'MARDIANA PURWA RIZKI', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071318', 'MEILANI NUR HASANAH', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071108', 'MITA PERMANASARI', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811315', 'MUHAMMAD DENDI A.', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071061', 'MURSYIDAH AMNIATI', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071320', 'NICKI SELVIA', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071321', 'NITA PERMATASARI', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071112', 'NOFALIA NURFITRIANI', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071194', 'NOVITA SARI', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071281', 'PRATIWI ROKHMAH', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071065', 'PURNAMA NUR RACHMAN', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071283', 'PUSPITA HANDAYANI', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071114', 'PUTRI NURFUADAH', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811316', 'PUTRI NURLIANA', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071323', 'PUTRI PERMATASARI', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071324', 'RADEN RANGGA PRATAMA PUTRA DJU', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071326', 'RATIH NURJANAH', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071380', 'RIDWAN ANGGA KUSUMA', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071159', 'RISKA YUNITA PRATAMI', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071074', 'RIZNA NOFITASARI', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071119', 'SARAH ISMI KAMILAH', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071120', 'SHEILLA FITRIAN', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071077', 'SHINTA NOVIA NURJANAH', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811317', 'SILAHUDIN NASIRI N.', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071204', 'SISCA YULIA MAHANANI', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071121', 'SURAHMAN', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071252', 'TIKA AYU BUDIARTI', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071082', 'UTARI DIANA PUTRI', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071126', 'WANDA KARROMA', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071209', 'WIDYA SUSANTI', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071128', 'ADY SYAF PUTRA', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071129', 'AFIFAH NURIYANI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071043', 'ALI MUTASHIM AULIARROHMAN', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071256', 'AMMI DAMAYANTI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071085', 'ANI SUMARNI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071134', 'AYU YUNIARTI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071218', 'BELINA ANGGIA GUSTAMI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811318', 'BIMO AULIA RAHMAN', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071137', 'CHAERUL ANWARI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071045', 'DAFIT BAGUS MAHA BEKTI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071219', 'DENY MAULANA', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071260', 'DESSY DESSYANTI NURAIDA', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071090', 'DIAN ANDRIANI SAFITRI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071092', 'DWI PUJIARTI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071051', 'ERLINA CINTIYA DEWI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071143', 'FACHRIZAL CAHYA P.', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071145', 'GANIS PANJI YAHYA', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071146', 'HANIF JALAMANAH', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071102', 'INTAN SYAPINATIN NAJA', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071148', 'ISMA RISMAWATI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071149', 'ISTIKASARI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071188', 'LENNY WIDIA MUKAROMAH', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071105', 'LIA ROSLIANA', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071189', 'LISTYA DWINA APRILIANI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071232', 'LULU PANGESTI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071106', 'M. ANJAR SHEVTIAN', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071271', 'MAYA OKTAVIA', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071107', 'MEGA FAJARWATI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811319', 'MIQYASSARA DIANDRA', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071154', 'MUTIARA SARI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071238', 'NISA NUR RAHMAH', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071113', 'NOURMA MELATI LARAS', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071155', 'NOVIYANTI KAMALELA', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071156', 'ONNY PADMANTARA', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071280', 'PERMATA SARI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071196', 'R.R ESTI SUPRIYATI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071325', 'RADEN YUNIAWATI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071202', 'RUDI PRADISETIA SUDIRDJA', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071078', 'SISKA KARLINA', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071079', 'SOFYAN RAMADHANI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071080', 'SUNDUS MIRROTIN', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071329', 'SUSANTI AMALIA', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071124', 'TIARA MULYA NINGRUM', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071207', 'TOMMY MULYANA', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071125', 'TRI BAGUS AJI PAMUNGKAS', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071208', 'TRI CHANDRA WULAN SARI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071165', 'VERA SYAPRIATI DEWI', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071210', 'WISNU ADITYA MUIZ', 'XI IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071299', 'AHMAD LUQMAN HAKIM', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071381', 'AKBAR BUDIMAN', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811320', 'ANGGARA EFFENDI', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071171', 'ANISAPUTRI SYAFARINAH HAKIM', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071213', 'ANITA MEGAMARINTI', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071132', 'ANITA NUZUL DIAH FIASIH', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071302', 'ANTONI ARIF KURNIA', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071172', 'ARI BUDIANTO', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071214', 'ARIANDHINI LESTARI HARYADI', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071258', 'ARIEF', 'XI IPA 4', '-', '01/01/2008', '-', 'PROTESTAN', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071216', 'AYUTIA PERTIWI', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071135', 'BAGUS WIDIANTO', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071136', 'BUDI DANIAR', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071089', 'DESSY RATHRY YULYANTHY', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071304', 'DESTIANA CHAIRUNNISA', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071141', 'DINI INDRIANI', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071223', 'EKKY OKTORA SANTOSO', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071052', 'FEBI LARASWATI', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071263', 'FITRI MARIMA', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071382', 'GILANG MATRIANSYAH DWI PUTRA', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071227', 'HARDI FERDIAN SABAR', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071099', 'HERLINA PUSPA DEWI', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071229', 'HILDA FARIDA', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071230', 'IWAN FATHUROKHMAN', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071231', 'JAENUDIN', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071151', 'MAYURA FIRLANDARI', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071235', 'MOCHAMAD HARIS ALAMSYAH', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811321', 'MUH. ASHARI EKASWARI', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811322', 'MUHAMMAD NIZAR F.', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071110', 'MUHAMMAD RIZKI GORBYANDI NADI', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071062', 'NIKEN DEWI NAGARANA', 'XI IPA 4', '-', '01/01/2008', '-', 'PROTESTAN', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071237', 'NISA NUR FRAZTY', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071239', 'NOLIS FAUZIAH', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071064', 'PELITA ISMAYA', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071243', 'PRIMA SIDIQ NUGRAHA', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071067', 'PUTRI KRISNA NURHAPSARI', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071244', 'RANNISA TRIASA MIFTAH', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071158', 'RIKA NURKEMALASARI', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071245', 'RIKE ANDRIKNI', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071246', 'RINA RUSDI', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071247', 'RIZKA SUCI UTAMI', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071288', 'SANTI SRI WARDHANI', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071291', 'SETIYA ARUM WULANDARI', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071167', 'YARA AYU INDRIYANI', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071338', 'YUSUF ADI NUGRAHA', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071084', 'YUYUN MIRANUR ADELIANI', 'XI IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071296', 'ADE YUYUN YULIANI', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071297', 'ADRI SYAEPUL MILAH', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071044', 'ANE KUSTIANA', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071086', 'ANISA AYU SANDI', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071174', 'BELA LIESTIAWATI', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071175', 'CAMAR REMOA', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071303', 'DADAN MOCHAMAD RAMDHANI', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071177', 'DEFIA SHOLIHATUN NISSA', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071305', 'DHANI RAMADHAN', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071178', 'DINI BUDIARTI SALAM', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071179', 'DISE AMALIA', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811323', 'DISTI FAUZIA SUKANDAR', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071142', 'EDLIN SUMARLIN', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071225', 'FAJRI FAUZAN HAQ', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071180', 'FITRI IDAYANA', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071312', 'FITRIANTA B.R GINTING', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071098', 'GHEA GRISTANNIA GRANDISTIN', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071054', 'GIAN NUR ALAMSYAH', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071056', 'HESTI RAHMAWATI ASRI', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071183', 'ILHAM IHSANANDA RASPATI', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071147', 'IMAM MUTTAQIN', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071184', 'INTANIA RIZANTY DEWI', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071269', 'IRA HIMAWATI', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071185', 'IRMA SEPTIANI', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071186', 'KRESNAWAN HUSSEIN', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071378', 'LUKI LUKMAN HAKIM', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071234', 'LYA MULYA MARTINI SUTISNA', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071059', 'MELAWATI', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071192', 'MUHAMAD ZAMZAMI MUTAQIEN', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071319', 'MUTIARA MAHARANI', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071063', 'NUR SYIFA ROSHIDA', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811324', 'RAHMAT RAMADHAN', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071198', 'RATNA YULIYANTI', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811325', 'RENDRA WIBAWA S.', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071116', 'RENDY EKA SAPUTRA', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071199', 'RIKE RACHMAYATI', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071327', 'RISA SRI UTAMI', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071200', 'RISNA KARTIKA', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071286', 'RITA SETIADI', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071075', 'ROSI SITI NURJANAH', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071203', 'SAEDI BAWANA', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071290', 'SELLY RIZKI FITRIANA', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071249', 'SOFI HUDA NURANI', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071122', 'TATIK CITRA WULANDARI', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071253', 'WILDAN PRAYOGO', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071083', 'WINA MARTIANA', 'XI IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071127', 'ADE ROCHMAT', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071298', 'AHMAD BOBBY HERNAWAN', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071002', 'AMALIA RAHMANI', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071133', 'ANITA TRI ASTUTI', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071176', 'CITRA ANGGIANI WAHYUDIN', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071010', 'DADAN FITRI AMINDANI', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071048', 'DEWI ROSDIANI', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071140', 'DINA NURUL UTAMI', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071383', 'DINDA GNATINI HERNAWATI BAGJAN', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071376', 'ELDA HAMDANI', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071012', 'EVI SEPTIANI', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071013', 'FAKHRUDIN NOOR', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071391', 'FANNY YULIAN PRIMALIA', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071310', 'FITRI AFRIAN KAMESWARA', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071144', 'FITRIANI DEWI ARYANTI', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071015', 'HENDY HADIANSYAH', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071100', 'ILHAM AZENAL SACABRATA', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071314', 'INE TRISNAWATI', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071316', 'KATON PRABOWO', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071273', 'MELINDA DEWI RAMADHIANTY', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071384', 'MOCHAMAD RYAN ANUGRAH', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071023', 'MUHAMMAD IBRAHIM RIYONO RAHARJ', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071024', 'MUHAMMAD IMAN PRATAMA', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071109', 'MUHAMMAD IQBAL MAULUDI', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071153', 'MUHAMMAD REZZA ANGGA PRADANA', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071025', 'NOVI RIANTI', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071241', 'NOVIYANTI ESTIYA', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071242', 'PANCA LUKITA ANANTO', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071068', 'RAMZI TASHA MANSOOR', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071069', 'RANGGA EKAPUTRA BANAWA', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811336', 'REX AVIANTARA N', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071030', 'RISA DWI AIDARIANI', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071031', 'RISKI ISKONJAYA', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071032', 'RISYA ANNISA KUDUS', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071073', 'RIZKI KURNIAWAN', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071328', 'RIZKIA APSARI ANDARANESWARI', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071289', 'SELINDA NOVIANTI', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071076', 'SEPTY YULIANI', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071292', 'SINTA NUR LATIFAH', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071163', 'SONIA SITI SUNDARI', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071293', 'SRI RAHAYU', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071206', 'SYIFA MAULINA', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071164', 'TIA SOFIANA', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071036', 'TITO NURFITRAH RAMDHANU', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071331', 'TRI NURSARIFAH', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071333', 'WIDIANTI NURWALIYAH', 'XI IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071255', 'AHMAD WILIANA WIBAWA', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071257', 'ANISA BELAWINI CIPTA DEWI', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071259', 'ATTY NURSANTI', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071088', 'BAYU PRAMONO', 'XI IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071371', 'BELIA RACHMANI', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811326', 'BETRIAKARI PUTRI', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071046', 'DENDEN KHULDUN MABRUR', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071047', 'DEVY MEYLIANI EFFENDI', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071261', 'DIMAS TANJUNG', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071307', 'ERNI APRIYANI', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071262', 'FANNY FEBRIANTY', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071264', 'FITRI NUR WULANDARI', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071181', 'GANIA PURNAMASARI', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071372', 'GIANA ROSANTI', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811327', 'GILANG DIMAS', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071266', 'IDA MAYASARI', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071103', 'IQBAL FAUZAN', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071377', 'JABBAR ARNASTY', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071270', 'JOKO TRIONO', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071187', 'LANI WIDIA ASTUTI', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071274', 'MITA KARLINA', 'XI IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071001', 'ABDULRACHMAN HASAN', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071131', 'AMALIANTY', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071003', 'AMALLYA FITRA APRIANTI', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071004', 'AMELINDA DYAH RAHMASARI', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071005', 'ANISA SONIA FATMAWATI ADHA', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071006', 'ARINDA PUSPITA RACHMAN', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071007', 'AYU AULIA SEPTIANI', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071008', 'BERLIAN AGUNG DIPANUSA', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071009', 'CINDY MUTIARATU', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071139', 'DEA IBRAHIM ARSYAD', 'XI IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071306', 'DIAN ENDARNO', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071220', 'DIAN MIRA WANTI', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071221', 'DWI YUNIARTI', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071094', 'EKKY ANGGRYAWAN', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071224', 'ENITRIA ASTRIANI', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071226', 'FAJRIYAH MULIAZANAH', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071095', 'FANDJI NOOR ZAKARIA', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071309', 'FAUJI LESMANA', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071228', 'HARDIANTI MAULIDA', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071182', 'HENI HESKANIA', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071313', 'HERU ROSMANTO', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071267', 'IIS NURHAYATI', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071268', 'INDRA TRI SEPTIAN', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071315', 'JUNAEDI INDRIANA', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071317', 'LINGGA SASTRAWIJAYA', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071233', 'LUSI MELLIANA SENI', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071272', 'MEGA TIARA YUNIAR', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071386', 'MOCHAMAD RIVAN ANUGRAH', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071060', 'MUHAMAD ARIF AL FAJAR', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071152', 'MUHAMMAD DAEROBI', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071374', 'MUSTIKA QODAR A.', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811333', 'NENENG KARTIKA', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071193', 'NICO SEPTIYAN', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811334', 'NITA HADIAN', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071322', 'NUNIK SRY RAHAYU', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071279', 'OVI WULANDARI', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811335', 'PREVIRA TIRANI', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071157', 'RADEN YULIA MARLINA', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071115', 'RANI PUSFITA', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071285', 'RIAN DWI CAHYO', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071117', 'RIZAL INDRA ARIFIYANTO', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071118', 'SANTI YULIANTI', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071161', 'SELA OKTORA', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071248', 'SENDI SAPUTRA SUHENDI', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071205', 'SITI NURHALIFAH', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071123', 'TIA NOVIAWATI', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071334', 'WIWIN WINARSIH', 'XI IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061043', 'ADITYA HERDIANTO SYAFII', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061001', 'ADNAN NANANG RAGIL SUSILO', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061002', 'AGUNG NURRAHMAN', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061003', 'ANDZAR MUHAMMAD FAUZI', 'XII IPA 1', '-', '01/04/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061250', 'ARIS PRATAMA PUTRA', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061171', 'ARTI BUDIARTI', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061214', 'ARTI YAN NURMALASARI', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061215', 'BAMBANG HERMANTO', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061005', 'BAYU ALI AKBAR', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061216', 'CHARLES HERBERT MANAHAN PARDOM', 'XII IPA 1', '-', '01/01/2008', '-', 'PROTESTAN', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061048', 'DESI DESTIANI GUNTARI', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061218', 'DESI SUMEGAR', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061220', 'DEWI ANGGRAENI', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061252', 'DINA CITRA KHARISMA SARI', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061052', 'DINNA DEA ANGRAINI', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061222', 'ELISABETH NATALIA SURYANI', 'XII IPA 1', '-', '01/01/2008', '-', 'KATHOLIK', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061054', 'ENING DESI SUSILAWATI', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061184', 'FAHMA FIQHIYYAH NUR AZIZAH', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061349', 'FAJAR AZHARI SALEH', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061255', 'FARIS AMARULLAH', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061185', 'FIESTY UTAMI', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061186', 'FITRI AFRIYANTI', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061060', 'GEASA SENA', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061019', 'HIKMAT HIDAYAT', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061261', 'LIA FITRIANI', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061235', 'LUTHFI MERDIANDANI', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061193', 'MAWADDI LUBBY', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061307', 'MIA FITRIA UTAMI', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061265', 'MILA KUMALASARI', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061022', 'MUHAMAD KANZU SATRIO', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061310', 'MUHAMMAD ZAKKI FUADI', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061269', 'NADYA LARASATI KARTIKA', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061023', 'NIDA MAISA ZAKIYYA', 'XII IPA 1', '-', '01/04/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061155', 'NIRA NURIKA SYAWINA', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061276', 'RAMIZIA AZHAR HERDIST', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061028', 'RATU GUSTINI NUR JANNAH', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061033', 'RIFKI RAMDAN HIDAYAT', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061346', 'RIKE ARDIANTI WULAN', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061280', 'RINA SURYANI', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061281', 'RIRIN EKA PERMATASARI', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711339', 'RISKA DWIHARDINI', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061075', 'RYNAL FERDIANSYAH', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061242', 'SEPTYANA DEWI VIERGITANINGRUM', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061205', 'SUGIH PURNAMA', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061246', 'SYAHRUL MUNAWAR ALBANA', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061077', 'TAUFIK ALI MUKTI', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061207', 'VIANADIA PUSPA DEWI', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061080', 'WINDA RAMDHANI', 'XII IPA 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061042', 'ADITA FAHMI HANIF', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061248', 'ALLAMAH YAHYA QOLBUN SALIM', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061045', 'CONSISTANIA DEMAWATI', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061175', 'DANDA IRAWAN WIBOWO', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061046', 'DANI NIRWANTO', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061217', 'DEO FERNALI ARNANDA', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061131', 'DIAN MELINA', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061181', 'DIANA MUSTIKASARI', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061053', 'EKO NUGROHO BUDIYANTO', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061011', 'FANI ABDUL HAFIZ', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061256', 'FITRIA ATMOJOWATI', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061059', 'FRISKA ELSA VALENTINA SIMANJUN', 'XII IPA 2', '-', '01/01/2008', '-', 'PROTESTAN', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061187', 'GAMMA ABDUL JABBAR', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061139', 'GINA MARIANA DEWI', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061144', 'INDATI FADILAH', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061229', 'IVAN LUKMAN', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061230', 'LAILA SRI UTAMI', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061231', 'LENI KARMILAWATI', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061234', 'LUTHFI HELMI LAZUARDY', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711340', 'MOHAMAD RESHA YUDIESTIRA', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061267', 'MOHAMMAD IQBAL', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061197', 'MUHAMMAD ABDUL AZIZ ALMUJAHID', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061309', 'MUHAMMAD HAFIDZ PRATAMA', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061068', 'MUHAMMAD LUQMAN HASAN', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061311', 'NABILA GANI', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061156', 'NOBY SATRIO DWI PURNOMO HADI', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061069', 'NURY WINARTI', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061352', 'RACHMI UTAMI RACHMATYANI', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061315', 'RADEN RYAN SEPTIAN CHANDRA PUR', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061072', 'RESKA PRASETYO', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061160', 'RINI AGUSTIN', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061074', 'RIZSCA ARTNESA FITRY', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061321', 'SAFAAH MAHMUDAH', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061076', 'SELLY NOVIA ANGGARI', 'XII IPA 2', '-', '01/01/2008', '-', 'KATHOLIK', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711341', 'SHANDY GUSTAV EKA SATRIA', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061243', 'SISKA JANUAR RACHMAN', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061204', 'SITI HASANAH', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061165', 'TONNY FAHRUROJI', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061037', 'TYAS PUTRI UTAMI', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061323', 'UZMA TAJMALA', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061287', 'VIERA DEWI PRATIWI', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061166', 'WAHYU KHOERUTTAMAM', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061082', 'WINDI SHINTIA FANDINI', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061039', 'WIWIT CATUR SUTEJO', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061247', 'YEULA HARYDA', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061327', 'YKA MEI SETYONINGRUM', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061040', 'YULLY FITRIANI', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061167', 'ZAKA ZAENUDIN', 'XII IPA 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061289', 'ABDURRACHMAN ALDILA', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061290', 'ADE LESTARI', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061347', 'AHMAD FUAD HANIF', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711342', 'ARADEA WIRADIREJA', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711343', 'ASIH PURWANDARI WAHYOE  P', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061172', 'BAGAS AJI BAWONO', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061129', 'BRANJANG TALIADJI', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061251', 'CHAIRUNNISA SAUMI ARIPIN', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061049', 'DESWITA AYUNINGTYAS', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061007', 'DEVY WULANDARI', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061180', 'DIAN RAMDHANI', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061183', 'DWI WAHYUDI', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061298', 'EGNAS SUKMA FATHUROHMAWATI', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061133', 'EKO HARDANI WIBOWO', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061134', 'ELITA LESTARI', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061254', 'EVA SITI ADIYANTI', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061300', 'FAJAR GUMILAR EKAPUTRA', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061013', 'FENI NURVITAWATI', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061016', 'GHANI HAKIM RAMDHANI', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061224', 'GHEA ARDILIA', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061137', 'GIESTHA GUSTIAWINATA SETIAWATI', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061142', 'HARRY MUHARAM', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061226', 'HEGI PRASETYO', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061062', 'IKA MEILATY', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061258', 'IRVINA LESTARI', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061146', 'ISMA DWI MAHARANI', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061147', 'ISNA MAULLA RAHMA', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061148', 'JOSEPH JEVON MART', 'XII IPA 3', '-', '01/01/2008', '-', 'KATHOLIK', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061260', 'KYAGUS ABDUL WAHID', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061262', 'LULU BRIANNI PUTERI', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061263', 'MEGA LEVIANA', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061195', 'MOHAMAD FAUZY', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061271', 'NURHASANAH', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061274', 'PRETTY SISKA BUDHIYATI', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061199', 'PRIMA NANDA FAUZIAH', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061026', 'RACHMY FITRIANI', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061278', 'RESTI RAMADHANI', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061240', 'RIDWAN FAUZY HIDAYAT', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061034', 'RISKY ERWANDA BANJARNAHOR', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061282', 'RIZAL RAHMAWAN SETIABUDI', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061319', 'ROBI SUGANDA', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711344', 'ROSI NURJANAH', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061350', 'RUNA WIRANURRACHMAN', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061320', 'RYAN ADHITIA MUSLIM', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061283', 'SANDRO FEBRINO', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711345', 'SANNY NURBHAKTI ZAKIYYAH', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061244', 'SOFIA NOVIANTI', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061285', 'TRESNA TRI DESTIANI', 'XII IPA 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061085', 'ACHMAD RIZAL FAKHRUDIN', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061086', 'ADITYA CAHYADI', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061087', 'ALWI ERLANGGA PRAKOSO', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061089', 'ANDIKA HERIYANDI', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061293', 'ANDY PRATAMA NUGRAHA', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061127', 'ANITA RAHMAYANTI', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711365', 'DEASTIKA BAYUNING SUDJASMARA', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061050', 'DEVI REGINA PURI', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061090', 'DHEA RIZKY NURHADI', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061360', 'DIANING PERTIWI', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061092', 'DWI ARIE KURNIAWAN', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061093', 'ENDAH PURNAMASARI', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061094', 'ENDRIO NUR PUTRA', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061096', 'ERMA NURUL HIDAYATI', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061057', 'EVIRA AGUSTINA', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061097', 'FARIDA RENDRAYANI', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061098', 'FATIA HANIFAH ZAHRA FIRDAUS', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061099', 'FERINA ROSIANA', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061301', 'FERMI DWI WICAKSONO', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061141', 'HANA SITI NURAINUN', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061143', 'IMAM SARTONO HADI WIJAYA', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061065', 'LATHIFAH GHOIDA AZHAR', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061150', 'MARLIANA NOVIANTY', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061104', 'MAULANA SUBHAN FUAD', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061153', 'MUHAMMAD ADAM RAMDHANI', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061106', 'MUTIA NURUL HAMIDAH', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061108', 'NENENG LULU WALUYANINGTIAS', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061154', 'NINDY METTA MAYANGSWARI', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061109', 'NISSA FADILLAH SOMANTRI', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061110', 'RACHMI GHALIFA MANSOOR', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061030', 'RD. DUNDEN GILANG MUHARAM', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061031', 'RENI ERNAWATI', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061112', 'RESTY MAYSEPTHENY HERNAWATI', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061032', 'REZKY MUKTI MUHAMMAD SAHID', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061113', 'RIA AYU PRATIWI', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061241', 'RIZAL RIZKY AKBAR', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061115', 'RONI SETIA LEKSONO', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061116', 'SATITI BUDI NURKUSUMAWANTI', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061117', 'SATRIO ADHI PRAMONO', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061118', 'SEPTIOADI ANGGARA PUTRA', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061119', 'SOFI SYAMILATUL FAHMI', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061120', 'TIFFANY CAESAREZA', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061121', 'TOMMY ADITYA KOMARA', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061122', 'TRI EDLIANI LESTARI', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711346', 'VALDIS REINALDO AGNAR', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061125', 'YULIANI ASTIKASARI', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061328', 'YUNIA NOVIANTI', 'XII IPA 4', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061168', 'A. PURNAMA YOGASWARA', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061209', 'ADITHYO DWI PUTRA', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061249', 'ANDHIKA RAMDHAN NUGRAHA', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061212', 'ANGGA AHMAD MAULANA', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061213', 'ANGGORO SUSETYO ZATI', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061004', 'ARIEFDHIANTY VIBIE HAPSARI', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061128', 'ASTRIATI', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061174', 'BOBBY RIYANDI WIDYANJAYA', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061296', 'BUDI MULIA KURNIAWAN', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711347', 'DENDY JATMIKA WIBISANA', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061178', 'DEWI QODARIAH', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061297', 'DIAN PRASETYO UTOMO', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061179', 'DIAN PUSPITA', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061221', 'DILA FATMALA', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061253', 'EMA ANALISIA ROSTIANA', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061009', 'ERIAN SUWANDI', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711348', 'ERNA RUSNIATI', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061056', 'ERWINA KOSMAWATI', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061351', 'FAHRIAN DESCA AZTIELEN', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061010', 'FAIZAL ABDUL AZIS', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061061', 'GENTA GEMA TAMZIL GEMILANG', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061015', 'GENTA JANUARY', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061303', 'HANI MAULANIA', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061225', 'HARRY LUKMAN KURNIAWAN', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061145', 'INDRA RAMADHAN BATAMA', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061191', 'IRARA ULENG', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061227', 'IRMA RAHMAWATI', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061228', 'ISNA YULITSA SARI', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061305', 'LIA AMELIA JUWITA', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061192', 'LINDUNG KRISMIN HAPSARI', 'XII IPA 5', '-', '01/01/2008', '-', 'PROTESTAN', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711349', 'LISSA ADHISTY MUCHNI', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061196', 'MUHAMAD MULIA RAMADHAN', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061308', 'MUHAMAD RANDI NUGRAHA SAPUTRA', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061237', 'MUHAMMAD ERLANGGA MAULANA YUSU', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061198', 'NIRWAN NURSABDA', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711350', 'NITA ANDRIANI', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061239', 'NOPA NOPIYANI', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061314', 'PUJI SRI BADRIYAH', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061344', 'RABBY RADHIYA JANUARIZKI GUMAY', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061275', 'RAHMAT IMADUDDIN', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711351', 'RANGGA CIPTA NUGRAHA', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061316', 'RIAN ADI PUTRA', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061318', 'RISKI RAFIKA', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061322', 'SANDY ROZAK SETIABUDI', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061036', 'SITI ROBIATUL ADHAWIYAH', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061286', 'TSAMROTUL NURUL SHOLIHAH', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061324', 'VERAYANI', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061041', 'YUSI HERLIANI', 'XII IPA 5', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061292', 'ALFAQIH NUR NUGROHO', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061345', 'ANGGA RIDWAN', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061173', 'BELAWAN JABAR', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061044', 'CHANDRA DWIPRASTIO', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711352', 'CITRA KHARISMA', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061130', 'DESTI ILMIANTI SALEH', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061348', 'DEWI SUKMAWATI SURYANA', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061132', 'DINI ASTRILIA RACHMAN', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061182', 'DWI UMAYA SARI', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061299', 'ERICK WIDARA', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061058', 'FANNY WULANDARI', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061014', 'FRISKA KHARUNIA FAUZIAH', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711353', 'GALIH PERSIANA', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061136', 'GANJAR RIZKIANA', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061302', 'GHUFRON AKMAL WIBISANA', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711354', 'GILANG NURRAKHMAT IRIANTO', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061188', 'GINA MARDIAH', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061140', 'GUMILANG RAMADHAN', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061304', 'HILMAN NUGRAHIM', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061063', 'ILHAM DWI FIRMANSYAH', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061259', 'ITA ROSITA', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061149', 'LESTARI MADYANINGATI', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711355', 'LIDIA NATALIA', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061232', 'LILIK PEBRIANTI', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061067', 'MICHAEL TAOFIQ SANYANG', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061194', 'MOCH. FAHRUR ROZI', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061268', 'MUHAMMAD NOOR HANAFIAH', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711387', 'MUHAMMAD ULUL ALBAB', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061270', 'NIA JUNIAWATI', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061024', 'NURUL APRILLIA HIDAYAH', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061025', 'OSCAR SATRYO RASPATI', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061070', 'PARYONO', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711356', 'PEPI HIDAYATTULLOH', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061313', 'PRIMA SATRIA WAHYU PUTRA SUDIO', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711357', 'RYAN NUGRAHA', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061162', 'SARI NOVI SANTOSO', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061202', 'SELVIA EFRIYANI', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061203', 'SENJA TRI HERMAWAN', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061164', 'SISKA SISMAYANTI MULYANI', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061284', 'SITI NURJANAH', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061078', 'TETEN CHOMARA', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061325', 'WIDA NINGSIH', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061083', 'YUAN FINDER TRIATMADJA', 'XII IPS 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061084', 'ABI NURCAHYO', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061291', 'AGNES PARADHYTA', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061088', 'AMELIA LISARA', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061047', 'DERA UNGGARANI', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061176', 'DESI NOVITA SARI', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061008', 'DHIKA PRAMADI', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061091', 'DITA PRATIWI', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061095', 'ERICK ANDI SYAPUTRA M', 'XII IPS 2', '-', '01/01/2008', '-', 'PROTESTAN', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061100', 'FITRA ALIMMA', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061017', 'GIANVALDO', 'XII IPS 2', '-', '01/01/2008', '-', 'KATHOLIK', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061138', 'GILANG RAMADHAN', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061101', 'GINTA JUMEIGI', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061102', 'GUNAWAN MOCHAMMAD NATSIR', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061018', 'HANDI FIRMANSYAH', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061103', 'HERFINA ROSHALINE', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061189', 'HERLIANA ANGGRAENI', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061064', 'INNE NURLIA', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061021', 'MARISA MAHLIA', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061105', 'MAULIDA CITADYANA RAHMAWATI', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061066', 'MELIA SAGITA PUTRI', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061151', 'MERISA SRI RAHAYU', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061264', 'MEUTHIA LENGGOGENI TANJUNG', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711388', 'MUHAMAD RIZKY FANDIARI', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711358', 'MUHAMMAD DICKY NURZAMAN', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061107', 'NELMA FEBRIANTY', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061272', 'NURHAYATI', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061071', 'RAEY SETEA MERDIANI', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061111', 'RAFIKA ANGLING SARI', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711390', 'RAIZA MALIK', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061277', 'REDI SETIAWAN', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061317', 'RINI WULANDARI', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061073', 'RIZKI BUDHI PRIYONO', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061114', 'RIZKY AULYA AKBAR', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061161', 'ROMI GUANDI', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061163', 'SHINTA KHARISMA', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061123', 'WIDYA OKTAVIA RAHMAWATI', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061079', 'WILMA NURBANDINI', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061081', 'WINDA SULISTIYANI', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061124', 'YENYEN PEBRIANI', 'XII IPS 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061169', 'ACEP SUTRISNO', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061126', 'ADAM JANUAR FIRMANSYAH SYARBIN', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711368', 'AHDIE AHMADI SOLEH', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061170', 'AI AISAH', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061359', 'ALMIRA DEVINA', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061210', 'ALYSSA PUTRISARI', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061211', 'ANDRI DJUANDA SUNARY', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061294', 'ANGGI RIYANTO RIDWAN', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711364', 'ARIEF RUSDIANA', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061295', 'ARYANTI', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711367', 'DESI FRASTIKA DEWI', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061177', 'DEVI SUCIATI JUHARI', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061219', 'DEVY SUKMAWATI', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061051', 'DYNA NANDYANI', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061055', 'ERNA PUSPITA SARI', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061223', 'FANI ANDRIANI', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061012', 'FANIDA FIRDAUSI FAUZIYAH', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061257', 'GILANG AGUNG PRASETIA', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061190', 'HILAL RAMADHAN MAHMUD', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061020', 'IRWIN REZKA FIRMANSYAH', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711366', 'MARISA DWI ARDANI', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061236', 'MEILIA KARLINA', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061306', 'MEITA DEWI ILMIA', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711359', 'MIRANTI SYLVIANI', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061152', 'MOHAMMAD ALI', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061266', 'MUHAMMAD AZMI KAMARULLAH', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061238', 'NENG KIKI AMALIA PRATIWI', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061312', 'PASQA MUHAMMAD', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061158', 'PIKI SUTANTO ADI SAPUTRA', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061159', 'PRIMANITA HANIFAH', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061029', 'RADEN DEWINTA DIESTARINA KAMAN', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061027', 'RAFIJRISKA RATNAKUMALADEWI', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061201', 'RIAN TAUFIK', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711360', 'RICA ARIYANTI', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061279', 'RIKA OKTAVIA', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061035', 'SARAH NUR FEBRIANA RAHMAYANTI', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061245', 'SURYANA', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061206', 'SYAIKHU NUR KAMALSYAH', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711361', 'WARTINI', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061038', 'WIDI LESTARI', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061326', 'YENYEN AGUSTIYANI SUHERMAN', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061208', 'YUDHIT ANATHA', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061288', 'YULINAR PRATIWI', 'XII IPS 3', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('234', 'JOKO', 'VII A', 'BALEN', '12/12/1994', '331675', 'ISLAM', 'L', 'BOJONEGORO', '', '', '', 'JOKO');
INSERT INTO `t_siswa` VALUES ('235', 'IKA', 'VII A', 'BALEN', '12/12/1994', '331675', 'ISLAM', 'L', 'BOJONEGORO', '', '', '', 'JULI');
INSERT INTO `t_siswa` VALUES ('236', 'SUKI', 'VII A', 'BALEN', '12/12/1994', '331675', 'ISLAM', 'L', 'BOJONEGORO', '', '', '', 'IKA');
INSERT INTO `t_siswa` VALUES ('23123', 'ssdfsdf', '111', 'dasdas', '03/12/2011', 'asdasd', 'dasd', 'L', 'asdas', '', '', '', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_soal`
-- 

CREATE TABLE `t_soal` (
  `id` int(10) NOT NULL auto_increment,
  `judul` varchar(200) collate latin1_general_ci NOT NULL default '',
  `deskripsi` text collate latin1_general_ci NOT NULL,
  `kategori` varchar(30) collate latin1_general_ci NOT NULL default '0',
  `file` varchar(50) collate latin1_general_ci NOT NULL default '',
  `visit` int(10) NOT NULL default '0',
  `ukuran` varchar(50) collate latin1_general_ci NOT NULL default '',
  `tanggal` varchar(20) collate latin1_general_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=18 ;

-- 
-- Dumping data for table `t_soal`
-- 

INSERT INTO `t_soal` VALUES (1, 'soal ulungan umum 1', 'tertert', 'T I K', 'soal1.doc', 2, '19,96 Kbytes', '16/02/2009 00:45:29');
INSERT INTO `t_soal` VALUES (2, 'soal ulungan umum 2', 'dsad', 'B. Indonesia', 'soal2.jpg', 0, '5,56 Kbytes', '22/02/2009 23:39:20');
INSERT INTO `t_soal` VALUES (3, 'soal latihan 1', 'fafsf', 'T I K', 'soal3.jpg', 0, '7,38 Kbytes', '11/07/2009 10:12:34');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_spp`
-- 

CREATE TABLE `t_spp` (
  `idspp` int(11) NOT NULL auto_increment,
  `nis` varchar(25) collate latin1_general_ci NOT NULL,
  `tgl_bayar` datetime default NULL,
  `bulan` varchar(10) collate latin1_general_ci NOT NULL,
  `tingkat` varchar(10) collate latin1_general_ci default NULL,
  `iuran` int(11) default NULL,
  `tu` varchar(30) collate latin1_general_ci default NULL,
  `ket` varchar(8) collate latin1_general_ci default '0',
  PRIMARY KEY  (`idspp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_spp`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_staf`
-- 

CREATE TABLE `t_staf` (
  `user_id` int(5) NOT NULL auto_increment,
  `nama` varchar(30) collate latin1_general_ci NOT NULL default '',
  `nip` varchar(25) collate latin1_general_ci NOT NULL default '',
  `kelamin` char(2) collate latin1_general_ci NOT NULL default '',
  `alamat` varchar(60) collate latin1_general_ci NOT NULL default '',
  `tugas` varchar(30) collate latin1_general_ci NOT NULL default '',
  `telp` varchar(15) collate latin1_general_ci default NULL,
  `hp` varchar(15) collate latin1_general_ci default NULL,
  `email` varchar(30) collate latin1_general_ci default NULL,
  `pelajaran` varchar(200) collate latin1_general_ci NOT NULL default '',
  `tgl_lahir` varchar(15) collate latin1_general_ci NOT NULL default '',
  `tmp_lahir` varchar(20) collate latin1_general_ci default NULL,
  `kode` varchar(10) collate latin1_general_ci NOT NULL default '',
  `pangkat` varchar(50) collate latin1_general_ci NOT NULL default '0',
  `kategori` char(1) collate latin1_general_ci default '0',
  `profilstaf` longtext collate latin1_general_ci,
  `nuptk` varchar(30) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=165 ;

-- 
-- Dumping data for table `t_staf`
-- 

INSERT INTO `t_staf` VALUES (1, 'Drs. H. Cucu Saputra, M.M.Pd', '131853696', 'L', '-', '-', '-', '-', '-', 'Kimia', '3/31/1964', 'Ciamis', '-', '-', '0', NULL, '');
INSERT INTO `t_staf` VALUES (2, 'Alan Ridwan M', '400001001', 'L', '-', '-', '-', '-', '-', 'Penjaskes', '4/2/1964', 'Garut', '-', '-', '0', '', '123');
INSERT INTO `t_staf` VALUES (3, 'Taufik N. Syah, S.Pd', '400001003', 'L', '-', '-', '-', '-', '-', 'B. Jerman', '2/6/1951', 'Bandung', '-', '-', '0', NULL, '');
INSERT INTO `t_staf` VALUES (4, 'Siswanto, S.Pd', '196805181995121004', 'L', '-', '-', '-', '-', '-', 'BK', '12/14/1955', 'Bandung', '-', '-', '0', NULL, '');
INSERT INTO `t_staf` VALUES (5, 'Wuryanta', '196504281989121001', 'L', '-', '-', '-', '-', '-', 'Biologi', '10/9/1961', 'Bandung', '-', '-', '0', NULL, '');
INSERT INTO `t_staf` VALUES (6, 'Drs. Choirul Anam, S.ST', '196105221984031005', 'L', '-', '-', '-', '-', '-', 'PKn', '11/5/1962', 'Malang', '-', '-', '0', NULL, '');
INSERT INTO `t_staf` VALUES (7, 'Warjana, S.Pd', '196605202006041001', 'L', '-', '-', '-', '-', '-', 'B. Indonesia', '6/9/1962', 'Jakarta', '-', '-', '0', NULL, '');
INSERT INTO `t_staf` VALUES (9, 'Yulianto Sri Utomo, S.Kom', '400001004', 'L', '-', '-', '-', '-', '-', '-', '-', '-', '-', '0', '0', NULL, '');
INSERT INTO `t_staf` VALUES (8, 'Dody Firmansyah', '400001002', 'L', '-', '-', '-', '-', '-', 'T I K', '1/1/2000', 'Bandung', '-', '-', '0', NULL, '');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_statistik`
-- 

CREATE TABLE `t_statistik` (
  `ip` varchar(20) NOT NULL default '',
  `tanggal` date NOT NULL,
  `hits` int(10) NOT NULL default '1',
  `online` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `t_statistik`
-- 

INSERT INTO `t_statistik` VALUES ('127.0.0.1', '2011-09-17', 18, '1316269188');
INSERT INTO `t_statistik` VALUES ('118.96.41.123', '2011-09-17', 7, '1316271711');
INSERT INTO `t_statistik` VALUES ('66.249.72.46', '2011-09-17', 37, '1316320710');
INSERT INTO `t_statistik` VALUES ('66.249.72.123', '2011-09-17', 113, '1316320610');
INSERT INTO `t_statistik` VALUES ('223.255.227.7', '2011-09-17', 10, '1316273008');
INSERT INTO `t_statistik` VALUES ('180.253.204.31', '2011-09-17', 1, '1316275602');
INSERT INTO `t_statistik` VALUES ('216.104.15.130', '2011-09-17', 1, '1316276481');
INSERT INTO `t_statistik` VALUES ('120.162.2.223', '2011-09-17', 4, '1316278533');
INSERT INTO `t_statistik` VALUES ('180.253.96.147', '2011-09-17', 2, '1316279326');
INSERT INTO `t_statistik` VALUES ('202.152.194.228', '2011-09-17', 2, '1316284386');
INSERT INTO `t_statistik` VALUES ('182.7.91.34', '2011-09-17', 1, '1316285543');
INSERT INTO `t_statistik` VALUES ('182.2.100.101', '2011-09-17', 1, '1316290493');
INSERT INTO `t_statistik` VALUES ('180.76.5.27', '2011-09-17', 1, '1316292056');
INSERT INTO `t_statistik` VALUES ('180.76.5.107', '2011-09-17', 1, '1316292909');
INSERT INTO `t_statistik` VALUES ('110.139.56.35', '2011-09-17', 1, '1316293879');
INSERT INTO `t_statistik` VALUES ('174.129.228.67', '2011-09-17', 9, '1316320931');
INSERT INTO `t_statistik` VALUES ('114.79.58.178', '2011-09-17', 2, '1316304086');
INSERT INTO `t_statistik` VALUES ('180.76.5.17', '2011-09-17', 1, '1316306742');
INSERT INTO `t_statistik` VALUES ('111.94.52.188', '2011-09-17', 10, '1316311177');
INSERT INTO `t_statistik` VALUES ('125.161.24.19', '2011-09-17', 1, '1316312771');
INSERT INTO `t_statistik` VALUES ('64.255.180.204', '2011-09-17', 3, '1316312965');
INSERT INTO `t_statistik` VALUES ('180.245.247.149', '2011-09-17', 2, '1316313878');
INSERT INTO `t_statistik` VALUES ('39.211.30.102', '2011-09-17', 1, '1316315241');
INSERT INTO `t_statistik` VALUES ('64.233.182.81', '2011-09-17', 1, '1316318689');
INSERT INTO `t_statistik` VALUES ('118.96.151.219', '2011-09-17', 1, '1316319450');
INSERT INTO `t_statistik` VALUES ('66.249.72.123', '2011-09-18', 290, '1316408174');
INSERT INTO `t_statistik` VALUES ('66.249.72.46', '2011-09-18', 72, '1316407805');
INSERT INTO `t_statistik` VALUES ('180.253.162.155', '2011-09-18', 2, '1316322999');
INSERT INTO `t_statistik` VALUES ('125.166.234.64', '2011-09-18', 2, '1316323859');
INSERT INTO `t_statistik` VALUES ('174.129.228.67', '2011-09-18', 11, '1316405683');
INSERT INTO `t_statistik` VALUES ('110.139.96.38', '2011-09-18', 1, '1316328042');
INSERT INTO `t_statistik` VALUES ('207.46.12.75', '2011-09-18', 1, '1316328402');
INSERT INTO `t_statistik` VALUES ('202.152.194.185', '2011-09-18', 8, '1316329428');
INSERT INTO `t_statistik` VALUES ('120.165.63.153', '2011-09-18', 1, '1316331153');
INSERT INTO `t_statistik` VALUES ('120.166.27.13', '2011-09-18', 1, '1316335267');
INSERT INTO `t_statistik` VALUES ('120.166.22.68', '2011-09-18', 1, '1316336819');
INSERT INTO `t_statistik` VALUES ('180.254.5.146', '2011-09-18', 3, '1316338019');
INSERT INTO `t_statistik` VALUES ('180.241.141.73', '2011-09-18', 13, '1316338671');
INSERT INTO `t_statistik` VALUES ('110.138.216.207', '2011-09-18', 6, '1316339024');
INSERT INTO `t_statistik` VALUES ('206.53.148.18', '2011-09-18', 1, '1316345829');
INSERT INTO `t_statistik` VALUES ('206.53.148.17', '2011-09-18', 1, '1316345928');
INSERT INTO `t_statistik` VALUES ('110.138.251.159', '2011-09-18', 1, '1316347119');
INSERT INTO `t_statistik` VALUES ('202.152.194.187', '2011-09-18', 1, '1316349240');
INSERT INTO `t_statistik` VALUES ('110.139.51.198', '2011-09-18', 1, '1316353742');
INSERT INTO `t_statistik` VALUES ('202.152.194.225', '2011-09-18', 1, '1316353825');
INSERT INTO `t_statistik` VALUES ('66.249.67.14', '2011-09-18', 1, '1316354663');
INSERT INTO `t_statistik` VALUES ('114.79.51.13', '2011-09-18', 1, '1316359821');
INSERT INTO `t_statistik` VALUES ('180.76.5.26', '2011-09-18', 1, '1316361538');
INSERT INTO `t_statistik` VALUES ('157.55.17.146', '2011-09-18', 1, '1316363592');
INSERT INTO `t_statistik` VALUES ('180.253.246.99', '2011-09-18', 1, '1316364753');
INSERT INTO `t_statistik` VALUES ('182.7.198.249', '2011-09-18', 1, '1316365709');
INSERT INTO `t_statistik` VALUES ('180.76.5.182', '2011-09-18', 1, '1316370161');
INSERT INTO `t_statistik` VALUES ('180.76.5.177', '2011-09-18', 1, '1316371009');
INSERT INTO `t_statistik` VALUES ('180.76.5.57', '2011-09-18', 1, '1316372725');
INSERT INTO `t_statistik` VALUES ('180.76.5.62', '2011-09-18', 1, '1316373588');
INSERT INTO `t_statistik` VALUES ('180.252.112.61', '2011-09-18', 1, '1316392967');
INSERT INTO `t_statistik` VALUES ('121.52.87.34', '2011-09-18', 30, '1316408283');
INSERT INTO `t_statistik` VALUES ('118.97.169.18', '2011-09-18', 1, '1316396292');
INSERT INTO `t_statistik` VALUES ('180.253.214.245', '2011-09-18', 1, '1316399684');
INSERT INTO `t_statistik` VALUES ('66.249.71.15', '2011-09-18', 1, '1316402358');
INSERT INTO `t_statistik` VALUES ('180.245.239.42', '2011-09-18', 2, '1316402595');
INSERT INTO `t_statistik` VALUES ('222.124.56.180', '2011-09-18', 1, '1316407087');
INSERT INTO `t_statistik` VALUES ('202.152.194.232', '2011-09-18', 1, '1316407193');
INSERT INTO `t_statistik` VALUES ('66.249.72.123', '2011-09-19', 227, '1316494404');
INSERT INTO `t_statistik` VALUES ('192.251.226.206', '2011-09-19', 1, '1316409630');
INSERT INTO `t_statistik` VALUES ('141.0.10.44', '2011-09-19', 5, '1316410831');
INSERT INTO `t_statistik` VALUES ('66.249.72.46', '2011-09-19', 53, '1316492615');
INSERT INTO `t_statistik` VALUES ('182.2.8.177', '2011-09-19', 1, '1316415524');
INSERT INTO `t_statistik` VALUES ('121.52.87.34', '2011-09-19', 2, '1316492914');
INSERT INTO `t_statistik` VALUES ('223.255.230.78', '2011-09-19', 10, '1316424399');
INSERT INTO `t_statistik` VALUES ('139.195.108.222', '2011-09-19', 1, '1316420397');
INSERT INTO `t_statistik` VALUES ('207.46.204.216', '2011-09-19', 1, '1316420795');
INSERT INTO `t_statistik` VALUES ('180.245.248.45', '2011-09-19', 1, '1316421352');
INSERT INTO `t_statistik` VALUES ('202.152.201.147', '2011-09-19', 1, '1316423373');
INSERT INTO `t_statistik` VALUES ('118.96.203.100', '2011-09-19', 2, '1316423461');
INSERT INTO `t_statistik` VALUES ('110.139.79.9', '2011-09-19', 1, '1316425680');
INSERT INTO `t_statistik` VALUES ('202.138.246.3', '2011-09-19', 2, '1316426884');
INSERT INTO `t_statistik` VALUES ('114.79.52.115', '2011-09-19', 3, '1316426299');
INSERT INTO `t_statistik` VALUES ('180.253.181.27', '2011-09-19', 3, '1316428391');
INSERT INTO `t_statistik` VALUES ('202.152.194.174', '2011-09-19', 1, '1316429164');
INSERT INTO `t_statistik` VALUES ('202.152.194.175', '2011-09-19', 1, '1316430205');
INSERT INTO `t_statistik` VALUES ('118.96.218.19', '2011-09-19', 2, '1316432138');
INSERT INTO `t_statistik` VALUES ('125.164.93.155', '2011-09-19', 1, '1316432985');
INSERT INTO `t_statistik` VALUES ('120.166.23.114', '2011-09-19', 1, '1316433281');
INSERT INTO `t_statistik` VALUES ('141.0.8.165', '2011-09-19', 1, '1316435084');
INSERT INTO `t_statistik` VALUES ('114.79.55.78', '2011-09-19', 1, '1316439167');
INSERT INTO `t_statistik` VALUES ('180.247.119.69', '2011-09-19', 1, '1316442471');
INSERT INTO `t_statistik` VALUES ('141.0.8.204', '2011-09-19', 1, '1316443229');
INSERT INTO `t_statistik` VALUES ('180.252.132.128', '2011-09-19', 1, '1316443481');
INSERT INTO `t_statistik` VALUES ('180.253.215.71', '2011-09-19', 4, '1316444075');
INSERT INTO `t_statistik` VALUES ('180.253.147.84', '2011-09-19', 1, '1316444839');
INSERT INTO `t_statistik` VALUES ('110.136.148.4', '2011-09-19', 1, '1316445458');
INSERT INTO `t_statistik` VALUES ('118.96.200.175', '2011-09-19', 2, '1316447169');
INSERT INTO `t_statistik` VALUES ('150.70.97.38', '2011-09-19', 2, '1316448187');
INSERT INTO `t_statistik` VALUES ('202.152.194.227', '2011-09-19', 7, '1316451477');
INSERT INTO `t_statistik` VALUES ('223.255.229.77', '2011-09-19', 1, '1316450343');
INSERT INTO `t_statistik` VALUES ('157.55.17.146', '2011-09-19', 3, '1316463040');
INSERT INTO `t_statistik` VALUES ('207.46.194.133', '2011-09-19', 1, '1316463746');
INSERT INTO `t_statistik` VALUES ('202.138.245.32', '2011-09-19', 1, '1316488171');
INSERT INTO `t_statistik` VALUES ('125.162.113.75', '2011-09-19', 1, '1316489317');
INSERT INTO `t_statistik` VALUES ('180.253.238.23', '2011-09-19', 1, '1316492850');
INSERT INTO `t_statistik` VALUES ('118.137.216.137', '2011-09-19', 1, '1316493705');
INSERT INTO `t_statistik` VALUES ('66.249.72.123', '2011-09-20', 103, '1316517802');
INSERT INTO `t_statistik` VALUES ('180.245.239.42', '2011-09-20', 2, '1316495027');
INSERT INTO `t_statistik` VALUES ('66.249.72.46', '2011-09-20', 55, '1316517787');
INSERT INTO `t_statistik` VALUES ('121.52.87.34', '2011-09-20', 8, '1316498861');
INSERT INTO `t_statistik` VALUES ('118.99.64.243', '2011-09-20', 3, '1316498814');
INSERT INTO `t_statistik` VALUES ('180.253.214.120', '2011-09-20', 1, '1316498728');
INSERT INTO `t_statistik` VALUES ('180.246.54.152', '2011-09-20', 2, '1316503435');
INSERT INTO `t_statistik` VALUES ('110.136.177.74', '2011-09-20', 3, '1316504904');
INSERT INTO `t_statistik` VALUES ('211.25.44.13', '2011-09-20', 1, '1316508385');
INSERT INTO `t_statistik` VALUES ('110.137.243.71', '2011-09-20', 1, '1316509255');
INSERT INTO `t_statistik` VALUES ('180.253.146.55', '2011-09-20', 6, '1316510269');
INSERT INTO `t_statistik` VALUES ('118.96.252.49', '2011-09-20', 1, '1316510395');
INSERT INTO `t_statistik` VALUES ('157.55.112.207', '2011-09-20', 1, '1316511587');
INSERT INTO `t_statistik` VALUES ('180.246.66.250', '2011-09-20', 3, '1316517623');
INSERT INTO `t_statistik` VALUES ('125.163.48.196', '2011-09-20', 1, '1316511900');
INSERT INTO `t_statistik` VALUES ('66.249.71.143', '2011-09-20', 98, '1316581141');
INSERT INTO `t_statistik` VALUES ('66.249.71.235', '2011-09-20', 73, '1316578399');
INSERT INTO `t_statistik` VALUES ('180.253.155.23', '2011-09-20', 7, '1316522039');
INSERT INTO `t_statistik` VALUES ('120.165.2.98', '2011-09-20', 1, '1316523243');
INSERT INTO `t_statistik` VALUES ('180.253.187.1', '2011-09-20', 18, '1316523812');
INSERT INTO `t_statistik` VALUES ('180.253.253.153', '2011-09-20', 1, '1316524672');
INSERT INTO `t_statistik` VALUES ('141.0.8.225', '2011-09-20', 1, '1316524853');
INSERT INTO `t_statistik` VALUES ('141.0.9.45', '2011-09-20', 2, '1316526513');
INSERT INTO `t_statistik` VALUES ('110.137.180.117', '2011-09-20', 1, '1316531286');
INSERT INTO `t_statistik` VALUES ('121.235.161.119', '2011-09-20', 6, '1316532293');
INSERT INTO `t_statistik` VALUES ('141.0.9.128', '2011-09-20', 1, '1316533272');
INSERT INTO `t_statistik` VALUES ('114.79.2.205', '2011-09-20', 1, '1316538564');
INSERT INTO `t_statistik` VALUES ('206.53.152.166', '2011-09-20', 1, '1316545379');
INSERT INTO `t_statistik` VALUES ('174.129.228.67', '2011-09-20', 1, '1316548609');
INSERT INTO `t_statistik` VALUES ('79.0.220.115', '2011-09-20', 2, '1316549170');
INSERT INTO `t_statistik` VALUES ('114.79.13.107', '2011-09-20', 1, '1316550001');
INSERT INTO `t_statistik` VALUES ('208.76.50.70', '2011-09-20', 1, '1316550100');
INSERT INTO `t_statistik` VALUES ('180.252.144.70', '2011-09-20', 1, '1316552595');
INSERT INTO `t_statistik` VALUES ('208.76.50.67', '2011-09-20', 1, '1316560292');
INSERT INTO `t_statistik` VALUES ('180.76.5.53', '2011-09-20', 1, '1316566895');
INSERT INTO `t_statistik` VALUES ('125.166.213.12', '2011-09-20', 1, '1316568515');
INSERT INTO `t_statistik` VALUES ('180.246.117.29', '2011-09-20', 1, '1316568925');
INSERT INTO `t_statistik` VALUES ('141.0.9.38', '2011-09-20', 2, '1316569006');
INSERT INTO `t_statistik` VALUES ('208.115.113.82', '2011-09-20', 1, '1316572263');
INSERT INTO `t_statistik` VALUES ('125.165.169.218', '2011-09-20', 4, '1316575008');
INSERT INTO `t_statistik` VALUES ('223.255.230.28', '2011-09-20', 6, '1316575312');
INSERT INTO `t_statistik` VALUES ('118.97.69.146', '2011-09-20', 1, '1316575142');
INSERT INTO `t_statistik` VALUES ('117.102.110.10', '2011-09-20', 3, '1316578169');
INSERT INTO `t_statistik` VALUES ('180.246.169.41', '2011-09-20', 1, '1316578614');
INSERT INTO `t_statistik` VALUES ('125.164.93.186', '2011-09-20', 1, '1316579876');
INSERT INTO `t_statistik` VALUES ('141.0.9.220', '2011-09-20', 1, '1316579945');
INSERT INTO `t_statistik` VALUES ('125.162.236.114', '2011-09-20', 3, '1316581073');
INSERT INTO `t_statistik` VALUES ('125.167.185.179', '2011-09-20', 1, '1316580945');
INSERT INTO `t_statistik` VALUES ('180.76.5.139', '2011-09-21', 1, '1316581219');
INSERT INTO `t_statistik` VALUES ('66.249.71.143', '2011-09-21', 96, '1316664577');
INSERT INTO `t_statistik` VALUES ('66.249.71.235', '2011-09-21', 27, '1316659011');
INSERT INTO `t_statistik` VALUES ('141.0.10.39', '2011-09-21', 1, '1316583056');
INSERT INTO `t_statistik` VALUES ('157.55.17.146', '2011-09-21', 2, '1316588947');
INSERT INTO `t_statistik` VALUES ('110.138.65.4', '2011-09-21', 2, '1316585635');
INSERT INTO `t_statistik` VALUES ('114.79.5.180', '2011-09-21', 2, '1316585696');
INSERT INTO `t_statistik` VALUES ('180.242.24.174', '2011-09-21', 1, '1316585708');
INSERT INTO `t_statistik` VALUES ('182.7.137.198', '2011-09-21', 1, '1316587555');
INSERT INTO `t_statistik` VALUES ('206.53.148.145', '2011-09-21', 1, '1316588384');
INSERT INTO `t_statistik` VALUES ('182.6.194.111', '2011-09-21', 10, '1316592240');
INSERT INTO `t_statistik` VALUES ('180.246.46.31', '2011-09-21', 1, '1316591249');
INSERT INTO `t_statistik` VALUES ('180.245.239.66', '2011-09-21', 1, '1316595151');
INSERT INTO `t_statistik` VALUES ('118.96.14.194', '2011-09-21', 1, '1316597864');
INSERT INTO `t_statistik` VALUES ('114.79.51.229', '2011-09-21', 1, '1316598241');
INSERT INTO `t_statistik` VALUES ('110.139.113.219', '2011-09-21', 4, '1316598651');
INSERT INTO `t_statistik` VALUES ('222.124.198.172', '2011-09-21', 1, '1316599211');
INSERT INTO `t_statistik` VALUES ('180.241.159.195', '2011-09-21', 1, '1316599927');
INSERT INTO `t_statistik` VALUES ('118.97.44.218', '2011-09-21', 1, '1316601123');
INSERT INTO `t_statistik` VALUES ('180.254.89.98', '2011-09-21', 1, '1316607465');
INSERT INTO `t_statistik` VALUES ('202.138.251.145', '2011-09-21', 26, '1316609419');
INSERT INTO `t_statistik` VALUES ('202.152.194.231', '2011-09-21', 1, '1316609649');
INSERT INTO `t_statistik` VALUES ('207.46.204.169', '2011-09-21', 1, '1316614145');
INSERT INTO `t_statistik` VALUES ('180.253.182.8', '2011-09-21', 2, '1316617823');
INSERT INTO `t_statistik` VALUES ('118.96.135.135', '2011-09-21', 1, '1316618603');
INSERT INTO `t_statistik` VALUES ('180.253.246.14', '2011-09-21', 17, '1316623221');
INSERT INTO `t_statistik` VALUES ('118.97.15.21', '2011-09-21', 1, '1316623407');
INSERT INTO `t_statistik` VALUES ('180.251.42.21', '2011-09-21', 15, '1316624299');
INSERT INTO `t_statistik` VALUES ('223.255.226.140', '2011-09-21', 2, '1316627134');
INSERT INTO `t_statistik` VALUES ('208.115.113.82', '2011-09-21', 2, '1316658504');
INSERT INTO `t_statistik` VALUES ('121.52.87.34', '2011-09-21', 6, '1316652507');
INSERT INTO `t_statistik` VALUES ('110.137.116.126', '2011-09-21', 1, '1316653587');
INSERT INTO `t_statistik` VALUES ('180.253.200.25', '2011-09-21', 4, '1316656809');
INSERT INTO `t_statistik` VALUES ('222.124.156.242', '2011-09-21', 1, '1316658214');
INSERT INTO `t_statistik` VALUES ('180.76.5.168', '2011-09-21', 1, '1316659673');
INSERT INTO `t_statistik` VALUES ('180.254.11.204', '2011-09-21', 1, '1316662731');
INSERT INTO `t_statistik` VALUES ('202.152.48.138', '2011-09-21', 2, '1316665109');
INSERT INTO `t_statistik` VALUES ('202.152.45.198', '2011-09-21', 4, '1316665913');
INSERT INTO `t_statistik` VALUES ('125.163.52.72', '2011-09-21', 1, '1316666142');
INSERT INTO `t_statistik` VALUES ('119.252.163.155', '2011-09-21', 3, '1316667598');
INSERT INTO `t_statistik` VALUES ('125.162.81.132', '2011-09-22', 4, '1316668952');
INSERT INTO `t_statistik` VALUES ('66.249.71.143', '2011-09-22', 260, '1316753846');
INSERT INTO `t_statistik` VALUES ('180.253.204.119', '2011-09-22', 7, '1316670952');
INSERT INTO `t_statistik` VALUES ('27.124.91.2', '2011-09-22', 1, '1316670984');
INSERT INTO `t_statistik` VALUES ('66.249.71.235', '2011-09-22', 53, '1316753678');
INSERT INTO `t_statistik` VALUES ('110.138.179.115', '2011-09-22', 1, '1316675968');
INSERT INTO `t_statistik` VALUES ('182.5.214.175', '2011-09-22', 6, '1316676934');
INSERT INTO `t_statistik` VALUES ('203.24.76.131', '2011-09-22', 3, '1316677283');
INSERT INTO `t_statistik` VALUES ('125.162.124.189', '2011-09-22', 1, '1316679307');
INSERT INTO `t_statistik` VALUES ('118.96.130.213', '2011-09-22', 1, '1316679980');
INSERT INTO `t_statistik` VALUES ('223.255.231.8', '2011-09-22', 2, '1316709306');
INSERT INTO `t_statistik` VALUES ('223.255.231.10', '2011-09-22', 1, '1316681037');
INSERT INTO `t_statistik` VALUES ('118.97.44.218', '2011-09-22', 5, '1316684796');
INSERT INTO `t_statistik` VALUES ('180.76.5.96', '2011-09-22', 1, '1316681899');
INSERT INTO `t_statistik` VALUES ('180.245.137.153', '2011-09-22', 2, '1316683195');
INSERT INTO `t_statistik` VALUES ('110.139.7.151', '2011-09-22', 2, '1316683459');
INSERT INTO `t_statistik` VALUES ('180.247.53.4', '2011-09-22', 1, '1316683409');
INSERT INTO `t_statistik` VALUES ('180.253.200.67', '2011-09-22', 2, '1316685694');
INSERT INTO `t_statistik` VALUES ('125.165.172.31', '2011-09-22', 4, '1316686299');
INSERT INTO `t_statistik` VALUES ('110.137.252.248', '2011-09-22', 3, '1316688052');
INSERT INTO `t_statistik` VALUES ('180.253.141.242', '2011-09-22', 4, '1316688188');
INSERT INTO `t_statistik` VALUES ('222.124.114.14', '2011-09-22', 1, '1316689089');
INSERT INTO `t_statistik` VALUES ('180.76.5.12', '2011-09-22', 1, '1316692664');
INSERT INTO `t_statistik` VALUES ('180.253.159.124', '2011-09-22', 4, '1316692977');
INSERT INTO `t_statistik` VALUES ('207.46.204.163', '2011-09-22', 1, '1316693052');
INSERT INTO `t_statistik` VALUES ('180.246.31.166', '2011-09-22', 2, '1316694628');
INSERT INTO `t_statistik` VALUES ('110.137.214.14', '2011-09-22', 2, '1316694481');
INSERT INTO `t_statistik` VALUES ('110.76.147.33', '2011-09-22', 1, '1316700450');
INSERT INTO `t_statistik` VALUES ('222.124.198.172', '2011-09-22', 2, '1316703619');
INSERT INTO `t_statistik` VALUES ('180.252.135.196', '2011-09-22', 1, '1316705032');
INSERT INTO `t_statistik` VALUES ('141.0.9.180', '2011-09-22', 3, '1316709502');
INSERT INTO `t_statistik` VALUES ('182.0.161.26', '2011-09-22', 1, '1316713714');
INSERT INTO `t_statistik` VALUES ('180.243.92.252', '2011-09-22', 2, '1316721558');
INSERT INTO `t_statistik` VALUES ('180.253.143.172', '2011-09-22', 1, '1316739899');
INSERT INTO `t_statistik` VALUES ('180.253.153.164', '2011-09-22', 1, '1316744167');
INSERT INTO `t_statistik` VALUES ('110.138.240.245', '2011-09-22', 4, '1316744708');
INSERT INTO `t_statistik` VALUES ('202.162.33.8', '2011-09-22', 1, '1316748287');
INSERT INTO `t_statistik` VALUES ('121.52.87.34', '2011-09-22', 2, '1316752369');
INSERT INTO `t_statistik` VALUES ('180.249.59.123', '2011-09-22', 1, '1316753066');
INSERT INTO `t_statistik` VALUES ('66.249.71.235', '2011-09-23', 65, '1316839182');
INSERT INTO `t_statistik` VALUES ('223.255.231.13', '2011-09-23', 2, '1316754930');
INSERT INTO `t_statistik` VALUES ('125.163.66.32', '2011-09-23', 1, '1316754897');
INSERT INTO `t_statistik` VALUES ('110.136.149.235', '2011-09-23', 1, '1316755109');
INSERT INTO `t_statistik` VALUES ('66.249.71.143', '2011-09-23', 59, '1316840330');
INSERT INTO `t_statistik` VALUES ('212.113.37.105', '2011-09-23', 1, '1316755265');
INSERT INTO `t_statistik` VALUES ('180.253.173.31', '2011-09-23', 1, '1316759898');
INSERT INTO `t_statistik` VALUES ('180.253.210.248', '2011-09-23', 1, '1316760477');
INSERT INTO `t_statistik` VALUES ('115.178.50.10', '2011-09-23', 1, '1316761760');
INSERT INTO `t_statistik` VALUES ('202.148.16.34', '2011-09-23', 8, '1316764115');
INSERT INTO `t_statistik` VALUES ('180.245.250.217', '2011-09-23', 1, '1316764425');
INSERT INTO `t_statistik` VALUES ('110.139.75.5', '2011-09-23', 1, '1316764516');
INSERT INTO `t_statistik` VALUES ('180.252.113.38', '2011-09-23', 1, '1316764985');
INSERT INTO `t_statistik` VALUES ('110.76.147.222', '2011-09-23', 1, '1316767278');
INSERT INTO `t_statistik` VALUES ('110.138.240.21', '2011-09-23', 2, '1316768812');
INSERT INTO `t_statistik` VALUES ('180.253.233.49', '2011-09-23', 1, '1316775073');
INSERT INTO `t_statistik` VALUES ('180.245.203.27', '2011-09-23', 1, '1316776399');
INSERT INTO `t_statistik` VALUES ('182.7.26.180', '2011-09-23', 1, '1316776662');
INSERT INTO `t_statistik` VALUES ('141.0.8.54', '2011-09-23', 1, '1316779189');
INSERT INTO `t_statistik` VALUES ('223.255.226.142', '2011-09-23', 2, '1316779731');
INSERT INTO `t_statistik` VALUES ('118.96.208.149', '2011-09-23', 2, '1316779981');
INSERT INTO `t_statistik` VALUES ('61.94.201.183', '2011-09-23', 2, '1316783759');
INSERT INTO `t_statistik` VALUES ('180.245.251.156', '2011-09-23', 1, '1316783649');
INSERT INTO `t_statistik` VALUES ('110.136.198.246', '2011-09-23', 1, '1316784297');
INSERT INTO `t_statistik` VALUES ('39.211.253.180', '2011-09-23', 6, '1316787963');
INSERT INTO `t_statistik` VALUES ('180.253.140.77', '2011-09-23', 6, '1316787652');
INSERT INTO `t_statistik` VALUES ('207.46.204.216', '2011-09-23', 1, '1316787191');
INSERT INTO `t_statistik` VALUES ('180.253.98.138', '2011-09-23', 3, '1316791669');
INSERT INTO `t_statistik` VALUES ('180.253.108.77', '2011-09-23', 5, '1316789497');
INSERT INTO `t_statistik` VALUES ('202.152.194.146', '2011-09-23', 1, '1316789566');
INSERT INTO `t_statistik` VALUES ('182.4.42.76', '2011-09-23', 1, '1316791044');
INSERT INTO `t_statistik` VALUES ('180.245.143.214', '2011-09-23', 5, '1316792916');
INSERT INTO `t_statistik` VALUES ('125.160.102.13', '2011-09-23', 1, '1316799388');
INSERT INTO `t_statistik` VALUES ('39.208.115.93', '2011-09-23', 1, '1316806256');
INSERT INTO `t_statistik` VALUES ('110.139.207.153', '2011-09-23', 2, '1316813920');
INSERT INTO `t_statistik` VALUES ('180.252.128.214', '2011-09-23', 1, '1316818223');
INSERT INTO `t_statistik` VALUES ('180.253.118.244', '2011-09-23', 2, '1316818588');
INSERT INTO `t_statistik` VALUES ('180.247.6.220', '2011-09-23', 1, '1316823846');
INSERT INTO `t_statistik` VALUES ('207.46.199.52', '2011-09-23', 1, '1316824921');
INSERT INTO `t_statistik` VALUES ('118.97.44.218', '2011-09-23', 492, '1316832901');
INSERT INTO `t_statistik` VALUES ('182.0.23.62', '2011-09-23', 2, '1316831329');
INSERT INTO `t_statistik` VALUES ('39.208.240.94', '2011-09-23', 5, '1316838811');
INSERT INTO `t_statistik` VALUES ('199.15.234.132', '2011-09-23', 4, '1316833546');
INSERT INTO `t_statistik` VALUES ('118.96.196.54', '2011-09-23', 1, '1316835587');
INSERT INTO `t_statistik` VALUES ('118.96.228.142', '2011-09-23', 2, '1316837929');
INSERT INTO `t_statistik` VALUES ('114.79.49.63', '2011-09-23', 2, '1316838440');
INSERT INTO `t_statistik` VALUES ('125.161.240.100', '2011-09-23', 1, '1316839507');
INSERT INTO `t_statistik` VALUES ('66.249.71.235', '2011-09-24', 72, '1316924656');
INSERT INTO `t_statistik` VALUES ('66.249.68.237', '2011-09-24', 1, '1316840496');
INSERT INTO `t_statistik` VALUES ('66.249.71.143', '2011-09-24', 283, '1316924734');
INSERT INTO `t_statistik` VALUES ('195.189.143.55', '2011-09-24', 2, '1316840672');
INSERT INTO `t_statistik` VALUES ('125.161.240.100', '2011-09-24', 1, '1316841416');
INSERT INTO `t_statistik` VALUES ('180.252.145.82', '2011-09-24', 2, '1316845911');
INSERT INTO `t_statistik` VALUES ('110.137.212.69', '2011-09-24', 1, '1316847515');
INSERT INTO `t_statistik` VALUES ('180.245.202.92', '2011-09-24', 8, '1316852078');
INSERT INTO `t_statistik` VALUES ('118.96.132.127', '2011-09-24', 1, '1316851377');
INSERT INTO `t_statistik` VALUES ('222.124.198.172', '2011-09-24', 5, '1316924126');
INSERT INTO `t_statistik` VALUES ('180.244.243.20', '2011-09-24', 42, '1316858939');
INSERT INTO `t_statistik` VALUES ('180.76.5.57', '2011-09-24', 1, '1316857832');
INSERT INTO `t_statistik` VALUES ('180.253.123.174', '2011-09-24', 1, '1316861609');
INSERT INTO `t_statistik` VALUES ('180.253.229.151', '2011-09-24', 1, '1316862316');
INSERT INTO `t_statistik` VALUES ('61.94.39.226', '2011-09-24', 22, '1316867179');
INSERT INTO `t_statistik` VALUES ('125.163.66.86', '2011-09-24', 6, '1316867748');
INSERT INTO `t_statistik` VALUES ('125.163.52.167', '2011-09-24', 1, '1316870277');
INSERT INTO `t_statistik` VALUES ('125.164.10.252', '2011-09-24', 1, '1316870775');
INSERT INTO `t_statistik` VALUES ('182.8.144.250', '2011-09-24', 6, '1316871964');
INSERT INTO `t_statistik` VALUES ('182.7.245.249', '2011-09-24', 4, '1316872102');
INSERT INTO `t_statistik` VALUES ('39.209.239.225', '2011-09-24', 1, '1316873236');
INSERT INTO `t_statistik` VALUES ('180.253.223.207', '2011-09-24', 2, '1316877291');
INSERT INTO `t_statistik` VALUES ('180.253.12.170', '2011-09-24', 1, '1316877731');
INSERT INTO `t_statistik` VALUES ('180.253.118.229', '2011-09-24', 1, '1316879443');
INSERT INTO `t_statistik` VALUES ('125.161.31.190', '2011-09-24', 3, '1316880003');
INSERT INTO `t_statistik` VALUES ('180.253.114.57', '2011-09-24', 1, '1316881131');
INSERT INTO `t_statistik` VALUES ('207.46.204.218', '2011-09-24', 1, '1316882768');
INSERT INTO `t_statistik` VALUES ('120.165.63.241', '2011-09-24', 1, '1316882789');
INSERT INTO `t_statistik` VALUES ('125.162.153.195', '2011-09-24', 1, '1316888735');
INSERT INTO `t_statistik` VALUES ('119.18.157.2', '2011-09-24', 9, '1316891670');
INSERT INTO `t_statistik` VALUES ('141.0.9.200', '2011-09-24', 1, '1316903855');
INSERT INTO `t_statistik` VALUES ('110.136.110.246', '2011-09-24', 3, '1316908104');
INSERT INTO `t_statistik` VALUES ('121.213.28.165', '2011-09-24', 1, '1316910651');
INSERT INTO `t_statistik` VALUES ('118.96.200.52', '2011-09-24', 1, '1316916379');
INSERT INTO `t_statistik` VALUES ('39.208.192.232', '2011-09-24', 1, '1316918123');
INSERT INTO `t_statistik` VALUES ('141.0.10.25', '2011-09-24', 2, '1316919305');
INSERT INTO `t_statistik` VALUES ('180.254.70.248', '2011-09-24', 1, '1316919883');
INSERT INTO `t_statistik` VALUES ('222.124.156.242', '2011-09-24', 1, '1316920021');
INSERT INTO `t_statistik` VALUES ('125.163.164.41', '2011-09-24', 1, '1316920386');
INSERT INTO `t_statistik` VALUES ('118.96.203.95', '2011-09-24', 1, '1316923349');
INSERT INTO `t_statistik` VALUES ('207.46.199.52', '2011-09-24', 1, '1316923383');
INSERT INTO `t_statistik` VALUES ('202.152.243.96', '2011-09-24', 1, '1316923819');
INSERT INTO `t_statistik` VALUES ('118.96.144.199', '2011-09-24', 1, '1316925224');
INSERT INTO `t_statistik` VALUES ('125.163.161.189', '2011-09-24', 1, '1316925228');
INSERT INTO `t_statistik` VALUES ('39.210.186.248', '2011-09-25', 2, '1316929405');
INSERT INTO `t_statistik` VALUES ('222.124.198.172', '2011-09-25', 1, '1316928781');
INSERT INTO `t_statistik` VALUES ('110.136.135.90', '2011-09-25', 3, '1316929805');
INSERT INTO `t_statistik` VALUES ('66.249.71.143', '2011-09-25', 332, '1317012871');
INSERT INTO `t_statistik` VALUES ('118.96.37.214', '2011-09-25', 1, '1316932775');
INSERT INTO `t_statistik` VALUES ('125.167.113.24', '2011-09-25', 2, '1316933089');
INSERT INTO `t_statistik` VALUES ('61.94.142.35', '2011-09-25', 1, '1316934231');
INSERT INTO `t_statistik` VALUES ('66.249.71.235', '2011-09-25', 51, '1317012858');
INSERT INTO `t_statistik` VALUES ('202.69.108.2', '2011-09-25', 1, '1316938376');
INSERT INTO `t_statistik` VALUES ('207.46.199.52', '2011-09-25', 3, '1316954894');
INSERT INTO `t_statistik` VALUES ('125.161.30.209', '2011-09-25', 1, '1316942366');
INSERT INTO `t_statistik` VALUES ('114.79.63.214', '2011-09-25', 1, '1316943429');
INSERT INTO `t_statistik` VALUES ('66.249.68.195', '2011-09-25', 1, '1316944236');
INSERT INTO `t_statistik` VALUES ('110.138.211.136', '2011-09-25', 1, '1316944530');
INSERT INTO `t_statistik` VALUES ('118.96.229.123', '2011-09-25', 2, '1316945466');
INSERT INTO `t_statistik` VALUES ('180.245.142.249', '2011-09-25', 2, '1316947524');
INSERT INTO `t_statistik` VALUES ('114.79.54.252', '2011-09-25', 2, '1316947606');
INSERT INTO `t_statistik` VALUES ('182.1.232.125', '2011-09-25', 1, '1316952938');
INSERT INTO `t_statistik` VALUES ('125.162.217.235', '2011-09-25', 2, '1316954475');
INSERT INTO `t_statistik` VALUES ('118.97.15.21', '2011-09-25', 1, '1316954197');
INSERT INTO `t_statistik` VALUES ('180.253.169.146', '2011-09-25', 1, '1316954744');
INSERT INTO `t_statistik` VALUES ('180.245.136.207', '2011-09-25', 23, '1316958566');
INSERT INTO `t_statistik` VALUES ('223.255.230.1', '2011-09-25', 2, '1316955355');
INSERT INTO `t_statistik` VALUES ('182.1.131.86', '2011-09-25', 15, '1316957699');
INSERT INTO `t_statistik` VALUES ('222.124.156.242', '2011-09-25', 1, '1316956288');
INSERT INTO `t_statistik` VALUES ('125.164.128.103', '2011-09-25', 1, '1316956755');
INSERT INTO `t_statistik` VALUES ('182.7.139.163', '2011-09-25', 2, '1316957288');
INSERT INTO `t_statistik` VALUES ('110.139.92.101', '2011-09-25', 1, '1316957174');
INSERT INTO `t_statistik` VALUES ('182.13.61.184', '2011-09-25', 1, '1316964346');
INSERT INTO `t_statistik` VALUES ('157.55.112.201', '2011-09-25', 1, '1316970227');
INSERT INTO `t_statistik` VALUES ('202.146.253.4', '2011-09-25', 3, '1316973149');
INSERT INTO `t_statistik` VALUES ('141.0.10.22', '2011-09-25', 3, '1316990043');
INSERT INTO `t_statistik` VALUES ('208.115.113.82', '2011-09-25', 1, '1316990075');
INSERT INTO `t_statistik` VALUES ('118.137.148.28', '2011-09-25', 1, '1316994922');
INSERT INTO `t_statistik` VALUES ('180.76.5.94', '2011-09-25', 1, '1317000114');
INSERT INTO `t_statistik` VALUES ('175.45.184.136', '2011-09-25', 2, '1317004837');
INSERT INTO `t_statistik` VALUES ('61.94.133.191', '2011-09-25', 3, '1317008769');
INSERT INTO `t_statistik` VALUES ('116.197.131.2', '2011-09-25', 6, '1317010288');
INSERT INTO `t_statistik` VALUES ('121.52.87.34', '2011-09-25', 7, '1317010718');
INSERT INTO `t_statistik` VALUES ('222.124.193.133', '2011-09-25', 1, '1317012458');
INSERT INTO `t_statistik` VALUES ('66.249.71.143', '2011-09-26', 13, '1317026168');
INSERT INTO `t_statistik` VALUES ('66.249.71.235', '2011-09-26', 3, '1317016527');
INSERT INTO `t_statistik` VALUES ('118.96.24.190', '2011-09-26', 8, '1317016196');
INSERT INTO `t_statistik` VALUES ('91.203.96.117', '2011-09-26', 1, '1317015457');
INSERT INTO `t_statistik` VALUES ('61.94.133.191', '2011-09-26', 17, '1317017578');
INSERT INTO `t_statistik` VALUES ('61.5.110.252', '2011-09-26', 1, '1317018247');
INSERT INTO `t_statistik` VALUES ('110.136.191.6', '2011-09-26', 2, '1317019738');
INSERT INTO `t_statistik` VALUES ('202.138.242.41', '2011-09-26', 490, '1317024300');
INSERT INTO `t_statistik` VALUES ('110.138.216.95', '2011-09-26', 1, '1317021716');
INSERT INTO `t_statistik` VALUES ('82.145.209.162', '2011-09-26', 1, '1317023030');
INSERT INTO `t_statistik` VALUES ('110.138.72.50', '2011-09-26', 1, '1317023759');
INSERT INTO `t_statistik` VALUES ('202.152.243.83', '2011-09-26', 2, '1317023787');
INSERT INTO `t_statistik` VALUES ('180.241.183.223', '2011-09-26', 1, '1317023913');
INSERT INTO `t_statistik` VALUES ('180.253.210.249', '2011-09-26', 1, '1317026192');
INSERT INTO `t_statistik` VALUES ('121.52.87.34', '2011-09-26', 1, '1317026342');
INSERT INTO `t_statistik` VALUES ('127.0.0.1', '2011-09-26', 1, '1317027235');
INSERT INTO `t_statistik` VALUES ('127.0.0.1', '2011-09-27', 1, '1317075819');
INSERT INTO `t_statistik` VALUES ('127.0.0.1', '2011-09-30', 2, '1317321760');
INSERT INTO `t_statistik` VALUES ('127.0.0.1', '2011-10-24', 1, '1319429154');
INSERT INTO `t_statistik` VALUES ('127.0.0.1', '2011-10-25', 6, '1319543731');
INSERT INTO `t_statistik` VALUES ('127.0.0.1', '2011-10-27', 103, '1319683248');
INSERT INTO `t_statistik` VALUES ('127.0.0.1', '2012-06-13', 56, '1339606734');
INSERT INTO `t_statistik` VALUES ('127.0.0.1', '2012-06-14', 11, '1339610915');
INSERT INTO `t_statistik` VALUES ('127.0.0.1', '2012-11-23', 2, '1353684172');
INSERT INTO `t_statistik` VALUES ('127.0.0.1', '2012-11-26', 19, '1353932633');
INSERT INTO `t_statistik` VALUES ('127.0.0.1', '2012-12-15', 16, '1355582715');
INSERT INTO `t_statistik` VALUES ('127.0.0.1', '2012-12-16', 93, '1355668614');
INSERT INTO `t_statistik` VALUES ('12.12.12.24', '2012-12-16', 2, '1355632862');
INSERT INTO `t_statistik` VALUES ('12.12.12.109', '2012-12-16', 1, '1355632883');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_temp`
-- 

CREATE TABLE `t_temp` (
  `id` int(10) NOT NULL auto_increment,
  `judul` text collate latin1_general_ci NOT NULL,
  `isi` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=51 ;

-- 
-- Dumping data for table `t_temp`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_temp_menu`
-- 

CREATE TABLE `t_temp_menu` (
  `idtemp` int(2) NOT NULL auto_increment,
  `temp_atas` mediumtext collate latin1_general_ci,
  `temp_bawah` mediumtext collate latin1_general_ci,
  `temp_tengah` mediumtext collate latin1_general_ci,
  `status` char(1) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`idtemp`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=22 ;

-- 
-- Dumping data for table `t_temp_menu`
-- 

INSERT INTO `t_temp_menu` VALUES (3, '	<div class="art-Block">\r\n                            <div class="art-Block-tl"></div>\r\n                            <div class="art-Block-tr"></div>\r\n                            <div class="art-Block-bl"></div>\r\n                            <div class="art-Block-br"></div>\r\n                            <div class="art-Block-tc"></div>\r\n                            <div class="art-Block-bc"></div>\r\n                            <div class="art-Block-cl"></div>\r\n                            <div class="art-Block-cr"></div>\r\n                            <div class="art-Block-cc"></div>\r\n                            <div class="art-Block-body">\r\n                                        <div class="art-BlockHeader">\r\n                                            <div class="l"></div>\r\n                                            <div class="r"></div>\r\n                                            <div class="art-header-tag-icon">\r\n                                                <div class="t">', '<div class="cleared"></div>\r\n                                            </div>\r\n                                        </div>\r\n                        		<div class="cleared"></div>\r\n                            </div>\r\n                        </div>', '</div>\r\n                                            </div>\r\n                                        </div><div class="art-BlockContent">\r\n					    <div class="art-BlockContent-tl"></div>\r\n                                            <div class="art-BlockContent-tr"></div>\r\n                                            <div class="art-BlockContent-bl"></div>\r\n                                            <div class="art-BlockContent-br"></div>\r\n                                            <div class="art-BlockContent-tc"></div>\r\n                                            <div class="art-BlockContent-bc"></div>\r\n                                            <div class="art-BlockContent-cl"></div>\r\n                                            <div class="art-BlockContent-cr"></div>\r\n                                            <div class="art-BlockContent-cc"></div>\r\n                                            <div class="art-BlockContent-body">', NULL);
INSERT INTO `t_temp_menu` VALUES (1, '	<div class="art-Block">\r\n                            <div class="art-Block-tl"></div>\r\n                            <div class="art-Block-tr"></div>\r\n                            <div class="art-Block-bl"></div>\r\n                            <div class="art-Block-br"></div>\r\n                            <div class="art-Block-tc"></div>\r\n                            <div class="art-Block-bc"></div>\r\n                            <div class="art-Block-cl"></div>\r\n                            <div class="art-Block-cr"></div>\r\n                            <div class="art-Block-cc"></div>\r\n                            <div class="art-Block-body">\r\n                                        <div class="art-BlockHeader">\r\n                                            <div class="l"></div>\r\n                                            <div class="r"></div>\r\n                                            <div class="art-header-tag-icon">\r\n                                                <div class="t">', '<div class="cleared"></div>\r\n                                            </div>\r\n                                        </div>\r\n                        		<div class="cleared"></div>\r\n                            </div>\r\n                        </div>', '</div>\r\n                                            </div>\r\n                                        </div><div class="art-BlockContent">\r\n					    <div class="art-BlockContent-tl"></div>\r\n                                            <div class="art-BlockContent-tr"></div>\r\n                                            <div class="art-BlockContent-bl"></div>\r\n                                            <div class="art-BlockContent-br"></div>\r\n                                            <div class="art-BlockContent-tc"></div>\r\n                                            <div class="art-BlockContent-bc"></div>\r\n                                            <div class="art-BlockContent-cl"></div>\r\n                                            <div class="art-BlockContent-cr"></div>\r\n                                            <div class="art-BlockContent-cc"></div>\r\n                                            <div class="art-BlockContent-body">', NULL);
INSERT INTO `t_temp_menu` VALUES (2, '                        <div class="art-Post">\r\n			    <div class="art-Post-tl"></div>\r\n                            <div class="art-Post-tr"></div>\r\n                            <div class="art-Post-bl"></div>\r\n                            <div class="art-Post-br"></div>\r\n                            <div class="art-Post-tc"></div>\r\n                            <div class="art-Post-bc"></div>\r\n                            <div class="art-Post-cl"></div>\r\n                            <div class="art-Post-cr"></div>\r\n                            <div class="art-Post-cc"></div>\r\n                            <div class="art-Post-body"> \r\n					<div class="art-Post-inner">\r\n<div class="art-PostMetadataHeader">\r\n<h2 class="art-PostHeader">', '</div><div class="cleared"></div>\r\n</div>                 \r\n                            </div>\r\n                        </div>', '</h2></div>\r\n                                        <div class="art-PostContent">', NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `t_thajar`
-- 

CREATE TABLE `t_thajar` (
  `idthajar` int(11) NOT NULL auto_increment,
  `thajar` varchar(10) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`idthajar`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=18 ;

-- 
-- Dumping data for table `t_thajar`
-- 

INSERT INTO `t_thajar` VALUES (1, '2010/2011');
INSERT INTO `t_thajar` VALUES (2, '2011/2012');
INSERT INTO `t_thajar` VALUES (3, '2012/2013');
INSERT INTO `t_thajar` VALUES (4, '2013/2014');
INSERT INTO `t_thajar` VALUES (5, '2014/2015');
INSERT INTO `t_thajar` VALUES (6, '2015/2016');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_tugas`
-- 

CREATE TABLE `t_tugas` (
  `idtugas` int(11) NOT NULL auto_increment,
  `tgl_kirim` datetime default NULL,
  `tgl_kumpul` datetime default NULL,
  `thajar` varchar(10) collate latin1_general_ci NOT NULL,
  `pelajaran` varchar(30) collate latin1_general_ci default NULL,
  `sem` varchar(1) collate latin1_general_ci default NULL,
  `nip` varchar(25) collate latin1_general_ci default NULL,
  `isi` longtext collate latin1_general_ci,
  `file` varchar(5) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`idtugas`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `t_tugas`
-- 

INSERT INTO `t_tugas` VALUES (1, '2012-11-26 00:00:00', '2012-11-27 00:00:00', '2012/2013', 'BK', '1', '400001001', '<p>buat surat lamaran kerja!!!</p>', '');
INSERT INTO `t_tugas` VALUES (2, '2012-11-26 00:00:00', '2012-11-29 00:00:00', '2012/2013', 'BK', '2', '400001001', '<p>buat resume tentang cms balitbang</p>', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_tugas_kelas`
-- 

CREATE TABLE `t_tugas_kelas` (
  `idkls` int(11) NOT NULL auto_increment,
  `idtugas` int(11) NOT NULL,
  `kelas` varchar(10) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`idkls`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `t_tugas_kelas`
-- 

INSERT INTO `t_tugas_kelas` VALUES (1, 1, 'X - 4');
INSERT INTO `t_tugas_kelas` VALUES (2, 2, 'X - 4');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_tugas_siswa`
-- 

CREATE TABLE `t_tugas_siswa` (
  `ids` int(11) NOT NULL auto_increment,
  `idtugas` int(11) NOT NULL,
  `nis` varchar(25) collate latin1_general_ci NOT NULL,
  `tgl` datetime default NULL,
  `status` char(1) collate latin1_general_ci default '0',
  `pesan` varchar(250) collate latin1_general_ci default NULL,
  `file` varchar(30) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`ids`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `t_tugas_siswa`
-- 

INSERT INTO `t_tugas_siswa` VALUES (1, 1, '070810119', '2012-11-26 00:00:00', '0', 'sy masih bingung bikin lamaran kerja', 'tgs070810119-1.txt');
INSERT INTO `t_tugas_siswa` VALUES (2, 2, '070810119', '2012-11-26 00:00:00', '0', 'susah bangt tugasnya', 'tgs070810119-2.jpg');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_voting_jawab`
-- 

CREATE TABLE `t_voting_jawab` (
  `id_jawab` int(255) NOT NULL auto_increment,
  `id_tanya` int(255) NOT NULL default '0',
  `jawaban` varchar(30) collate latin1_general_ci NOT NULL default '',
  PRIMARY KEY  (`id_jawab`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=16 ;

-- 
-- Dumping data for table `t_voting_jawab`
-- 

INSERT INTO `t_voting_jawab` VALUES (13, 4, 'Ragu-ragu');
INSERT INTO `t_voting_jawab` VALUES (12, 4, 'Tidak');
INSERT INTO `t_voting_jawab` VALUES (11, 4, 'Ya');
INSERT INTO `t_voting_jawab` VALUES (8, 3, 'Bagus');
INSERT INTO `t_voting_jawab` VALUES (9, 3, 'Cukup');
INSERT INTO `t_voting_jawab` VALUES (10, 3, 'Kurang');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_voting_pole`
-- 

CREATE TABLE `t_voting_pole` (
  `id` int(255) NOT NULL auto_increment,
  `id_jawab` int(255) NOT NULL default '0',
  `ip` varchar(20) collate latin1_general_ci NOT NULL default '',
  `tanggal` varchar(6) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=89 ;

-- 
-- Dumping data for table `t_voting_pole`
-- 

INSERT INTO `t_voting_pole` VALUES (63, 8, '', NULL);
INSERT INTO `t_voting_pole` VALUES (64, 9, '', NULL);
INSERT INTO `t_voting_pole` VALUES (65, 10, '', NULL);
INSERT INTO `t_voting_pole` VALUES (66, 8, '', NULL);
INSERT INTO `t_voting_pole` VALUES (67, 8, '', NULL);
INSERT INTO `t_voting_pole` VALUES (68, 8, '', NULL);
INSERT INTO `t_voting_pole` VALUES (69, 8, '', NULL);
INSERT INTO `t_voting_pole` VALUES (70, 9, '127.0.0.1', NULL);
INSERT INTO `t_voting_pole` VALUES (71, 8, '127.0.0.1', NULL);
INSERT INTO `t_voting_pole` VALUES (72, 8, '127.0.0.1', NULL);
INSERT INTO `t_voting_pole` VALUES (73, 8, '127.0.0.1', NULL);
INSERT INTO `t_voting_pole` VALUES (74, 8, '127.0.0.1', NULL);
INSERT INTO `t_voting_pole` VALUES (75, 8, '127.0.0.1', NULL);
INSERT INTO `t_voting_pole` VALUES (76, 9, '127.0.0.1', NULL);
INSERT INTO `t_voting_pole` VALUES (77, 9, '127.0.0.1', NULL);
INSERT INTO `t_voting_pole` VALUES (78, 9, '127.0.0.1', NULL);
INSERT INTO `t_voting_pole` VALUES (79, 9, '127.0.0.1', NULL);
INSERT INTO `t_voting_pole` VALUES (80, 9, '127.0.0.1', NULL);
INSERT INTO `t_voting_pole` VALUES (81, 9, '127.0.0.1', NULL);
INSERT INTO `t_voting_pole` VALUES (82, 9, '127.0.0.1', NULL);
INSERT INTO `t_voting_pole` VALUES (83, 8, '127.0.0.1', NULL);
INSERT INTO `t_voting_pole` VALUES (84, 9, '127.0.0.1', NULL);
INSERT INTO `t_voting_pole` VALUES (85, 9, '127.0.0.1', NULL);
INSERT INTO `t_voting_pole` VALUES (86, 8, '127.0.0.1', '190709');
INSERT INTO `t_voting_pole` VALUES (87, 9, '127.0.0.1', '200709');
INSERT INTO `t_voting_pole` VALUES (88, 8, '127.0.0.1', '170809');

-- --------------------------------------------------------

-- 
-- Table structure for table `t_voting_tanya`
-- 

CREATE TABLE `t_voting_tanya` (
  `id_tanya` int(255) NOT NULL auto_increment,
  `pertanyaan` varchar(80) collate latin1_general_ci NOT NULL default '',
  `tanggal` varchar(20) collate latin1_general_ci NOT NULL default '',
  `status` char(1) collate latin1_general_ci NOT NULL default '',
  PRIMARY KEY  (`id_tanya`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=6 ;

-- 
-- Dumping data for table `t_voting_tanya`
-- 

INSERT INTO `t_voting_tanya` VALUES (4, 'Bermanfaatkah Website sekolah bagi anda', '11/01/2006', '0');
INSERT INTO `t_voting_tanya` VALUES (3, 'Bagaimana menurut Anda tentang tampilan website ini ?', '23/11/2005', '1');

-- --------------------------------------------------------

-- 
-- Table structure for table `user`
-- 

CREATE TABLE `user` (
  `userid` int(11) NOT NULL auto_increment,
  `username` varchar(50) collate latin1_general_ci NOT NULL,
  `password` varchar(200) collate latin1_general_ci NOT NULL,
  `email` varchar(100) collate latin1_general_ci NOT NULL,
  `ip` varchar(15) collate latin1_general_ci default NULL,
  `waktu` varchar(20) collate latin1_general_ci default NULL,
  `kunjung` int(11) default NULL,
  `status` int(1) default '1',
  PRIMARY KEY  (`userid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=5 ;

-- 
-- Dumping data for table `user`
-- 

INSERT INTO `user` VALUES (3, 'admin', '57gc0bbbfb6b3', 'alanrm82@yahoo.com', '127.0.0.1', '08:54:35 16/12/2012', 30, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `user_level`
-- 

CREATE TABLE `user_level` (
  `idlevel` int(11) NOT NULL auto_increment,
  `userid` int(11) default NULL,
  `menu` varchar(20) collate latin1_general_ci default NULL,
  `utama` int(2) default NULL,
  PRIMARY KEY  (`idlevel`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=136 ;

-- 
-- Dumping data for table `user_level`
-- 

INSERT INTO `user_level` VALUES (129, 3, 'membersiswa', 5);
INSERT INTO `user_level` VALUES (128, 3, 'importsiswa', 5);
INSERT INTO `user_level` VALUES (127, 3, 'dtortu', 5);
INSERT INTO `user_level` VALUES (126, 3, 'dtsiswa', 5);
INSERT INTO `user_level` VALUES (125, 3, 'dtmengajar', 4);
INSERT INTO `user_level` VALUES (124, 3, 'importguru', 4);
INSERT INTO `user_level` VALUES (123, 3, 'dtguru', 4);
INSERT INTO `user_level` VALUES (121, 3, 'pelajaran', 3);
INSERT INTO `user_level` VALUES (120, 3, 'kelas', 3);
INSERT INTO `user_level` VALUES (119, 3, 'program', 3);
INSERT INTO `user_level` VALUES (118, 3, 'semester', 3);
INSERT INTO `user_level` VALUES (117, 3, 'kategori', 3);
INSERT INTO `user_level` VALUES (116, 3, 'gambar', 3);
INSERT INTO `user_level` VALUES (115, 3, 'template', 3);
INSERT INTO `user_level` VALUES (114, 3, 'posisi', 3);
INSERT INTO `user_level` VALUES (113, 3, 'profil', 3);
INSERT INTO `user_level` VALUES (112, 3, 'admin', 3);
INSERT INTO `user_level` VALUES (111, 3, 'dtlaporan', 2);
INSERT INTO `user_level` VALUES (110, 3, 'dtspp', 2);
INSERT INTO `user_level` VALUES (109, 3, 'dtabsensi', 2);
INSERT INTO `user_level` VALUES (108, 3, 'dtbpbk', 2);
INSERT INTO `user_level` VALUES (107, 3, 'dtmateri', 2);
INSERT INTO `user_level` VALUES (106, 3, 'dtnilai', 2);
INSERT INTO `user_level` VALUES (105, 3, 'banner', 1);
INSERT INTO `user_level` VALUES (104, 3, 'jajak', 1);
INSERT INTO `user_level` VALUES (103, 3, 'pesandepan', 6);
INSERT INTO `user_level` VALUES (102, 3, 'prestasi', 1);
INSERT INTO `user_level` VALUES (101, 3, 'silabus', 1);
INSERT INTO `user_level` VALUES (100, 3, 'kumpulsoal', 1);
INSERT INTO `user_level` VALUES (99, 3, 'materiajar', 1);
INSERT INTO `user_level` VALUES (98, 3, 'infosekolah', 1);
INSERT INTO `user_level` VALUES (97, 3, 'infoalumni', 1);
INSERT INTO `user_level` VALUES (96, 3, 'link', 1);
INSERT INTO `user_level` VALUES (95, 3, 'galeri', 1);
INSERT INTO `user_level` VALUES (94, 3, 'forum', 1);
INSERT INTO `user_level` VALUES (93, 3, 'bukutamu', 1);
INSERT INTO `user_level` VALUES (92, 3, 'berita', 1);
INSERT INTO `user_level` VALUES (91, 3, 'agenda', 1);
INSERT INTO `user_level` VALUES (90, 3, 'artikel', 1);
INSERT INTO `user_level` VALUES (130, 3, 'naikkelas', 5);
INSERT INTO `user_level` VALUES (131, 3, 'dtalumni', 5);
INSERT INTO `user_level` VALUES (132, 3, 'member', 6);
INSERT INTO `user_level` VALUES (133, 3, 'koordinator', 6);
INSERT INTO `user_level` VALUES (134, 3, 'opini', 6);
