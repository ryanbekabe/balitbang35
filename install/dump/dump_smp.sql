-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Dec 16, 2012 at 09:42 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `db_smp`
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

INSERT INTO `calendarevent` VALUES (1, '2012-12-29 00:00:00', '2013-12-04 00:00:00', 'Libur Akhir Tahun sekolah', 'Liburan Sekolah Akhir Tahun 2013', '#FF0000', 1, 1, 1);

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

INSERT INTO `counter` VALUES (1, '127.0.0.1-', 1, 1);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `soal_hasil`
-- 


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `soal_jawab`
-- 


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `soal_kelas`
-- 


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `soal_opsi`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `soal_test`
-- 

CREATE TABLE `soal_test` (
  `idsoaltest` int(10) NOT NULL auto_increment,
  `idsoalutama` int(10) NOT NULL,
  `idsoal` int(10) NOT NULL,
  PRIMARY KEY  (`idsoaltest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `soal_test`
-- 


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `soal_utama`
-- 


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

INSERT INTO `t_artikel` VALUES (1, '16-12-2012 11:15', 'Guru dan Kurikulum 2013', '<div class="content">\r\n<p>Ada empat aspek yang harus diberi perhatian khusus dalam rencana implementasi dan keterlaksanaan kurikulum 2013. Apa saja? &nbsp;&nbsp;</p>\r\n<p>Pertama, kompetensi guru dalam pemahaman substansi bahan ajar (baca: kompetensi pedagogi/akademik).&nbsp; Didalamnya terkait dengan metodologi pembelajaran, yang nilainya pada pelaksanaan uji kompetensi guru (UKG) baru mencapai rata-ratanya 44,46.</p>\r\n<p>Kedua, kompetensi akademik (keilmuan), ini juga penting, karena guru sesungguhnya memiliki tugas untuk bisa mencerdaskan peserta didik dengan ilmu dan pengetahuan yang dimilikinya, jika guru hanya menguasai metode penyampaiannya tanpa kemampuan akademik yang menjadi tugas utamanya, maka peserta didik tidak akan mendapatkan ilmu pengetahuan apa-apa.</p>\r\n<p>Ketiga, kompetensi sosial. Guru harus juga bisa dipastikan memiliki kompetensi sosial, karena ia tidak hanya dituntut cerdas dan bisa menyampaikan materi keilmuannya dengan baik, tapi juga dituntut untuk secara sosial memiliki komptensi yang memadai. Apa jadinya seorang guru yang asosial, baik terhadap teman sejawat, peserta didik maupun lingkungannya.</p>\r\n<p>Keempat, kompetensi manajerial atau kepemimpinan. Pada diri gurulah sesungguhnya terdapat teladan, yang diharapkan dapat dicontoh oleh peserta didiknya.</p>\r\n<p>Guru sebagai ujung tombak penerapan kurikulum, diharapkan bisa menyiapkan dan membuka diri terhadap beberapa kemungkinan terjadinya perubahan.</p>\r\n<p>Kesiapan guru lebih penting dari pada pengembangan kurikulum 2013. Kenapa guru menjadi penting? Karena dalam kurikulum 2013, bertujuan mendorong peserta didik, mampu lebih baik dalam melakukan observasi, bertanya, bernalar, dan mengkomunikasikan (mempresentasikan), apa yang mereka peroleh atau mereka ketahui setelah menerima materi pembelajaran.</p>\r\n<p>Melalui empat tujuan itu diharapkan siswa memiliki kompetensi sikap, ketrampilan, dan pengetahuan jauh lebih baik. Mereka akan lebih kreatif, inovatif, dan lebih produktif.</p>\r\n<p>Disinilah guru berperan besar didalam mengimplementasikan tiap proses pembelajaran pada kurikulum 2013. Guru ke depan dituntut tidak hanya cerdas tapi juga adaptip terhadap perubahan. (***)</p>\r\n</div>', '', 0, 3);
INSERT INTO `t_artikel` VALUES (2, '16-12-2012 11:22', '5 Karakter Para Inovator', '<p>Menarik membaca buku yang ditulis oleh Carmine Gallo berjudul Rahasia Inovasi Steve Jobs (<em>The Innovation Secrets of Steve Jobs</em>). Yang membuat menarik adalah karena Carmine Gallo tidak hanya bercerita tentang bagaimana Steve Jobs membuat inovasi, tapi juga menguraikan bagaimana para inovator lain berdjoeang untuk menghasikan karya-karya besar yang bermanfaat untuk manusia. Gallo juga berhasil menyajikan sebuah benang merah, mengumpulkan karakter-karakter penting yang wajib dimiliki oleh seorang inovator. Dengan karakter-karakter inilah, para inovator bergerak dan berdjoeang sehingga akhirnya bisa menghasilkan karya inovasi yang legendaris di dunia ini. Pada tulisan ini saya menyajikan&nbsp;5 karakter yang wajib dimiliki oleh para inovator, yang saya rangkumkan dari tulisan&nbsp;Carmine Gallo dan beberapa ide lain dari tulisan-tulisan saya di blog ini sebelumnya. Materi ini juga pernah saya sampaikan di seminar tentang <em>technopreneurship</em>di beberapa kampus.&nbsp;</p>\r\n<p style="text-align: justify;"><strong>1. LAKUKAN YANG KITA CINTAI</strong></p>\r\n<p style="text-align: justify;">Steve Jobs adalah contoh terbaik bagaimana dia mencintai apa yang dia lakukan. Pada tahun 1976 Steve Jobs mendirikan Apple, 10 tahun kemudian dia dikeluarkan dari perusahaan yang dia dirikan sendiri. Tak menyerah, Jobs tetap berdjoeang pelan-pelan membangun perusahaan bernama Next. Langkah berikutnya mengakuisisi divisi computer grahics dari LucasFilm, yang kemudian diberi nama Pixar. Ditangannya Pixar akhirnya melaju dan sukses dengan karya animasi legendaris seperti Toy Story. Pixar akhirnya bergabung ke Disney, di mana Jobs menjadi pemilik saham terbesar di Disney. Dengan kondisi sukses seperti itu, Jobs tetap memutuskan kembali ke Apple di tahun 1996, untuk menyelamatkan perusahaan yang dia dirikan yang kondisinya sudah hampir hancur. Dalam dua tahun, Jobs berhasil mengubah Apple yang hampir bangkrut menjadi perusahaan yang memiliki profit. Salah satu ungkapan terkenal Jobs ketika ditanya, kenapa bisa bertahan dengan semua ini, &ldquo;Satu hal yang membuat saya tetap bertahan adalah bahwa saya mencintai apa yang saya lakukan&rdquo;. Ya ketika kita mencintai apa yang kita lakukan, tak ada yang sanggup membuat kita berhenti dalam berdjoeang.</p>\r\n<p style="text-align: justify;"><img class="alignright  wp-image-1569" style="margin-left: 5px;" title="jamesdyson" src="http://romisatriawahono.net/wp-content/uploads/2012/09/jamesdyson.jpg" alt="" width="128" height="130" />Cinta dan passion juga lah yang membuat James Dyson ikhlas melakukan eksperimen selama lebih dari 5 tahun, dan mengalami 5126 kegagalan dalam membuat penyedot debu <em>dual cyclone</em> tanpa kantung. Ketika akhirnya berhasil pun, Dyson masih harus kecewa karena tak ada satupun produsen penyedot debu di Inggris, negara kelahirannya, yang mau mengadopsi hasil karyanya. Hingga akhirnya terpaksa diproduksi sendiri dan dijual bukan di Inggris, tapi di negara yang jauh dari jangkauannya yaitu Jepang.</p>\r\n<p style="text-align: justify;"><img class="wp-image-1568 alignleft" style="margin-left: 5px; margin-right: 5px;" title="eliharari" src="http://romisatriawahono.net/wp-content/uploads/2012/09/eliharari.jpg" alt="" width="122" height="124" />Eli Harari, yang mendapatkan gelar PhD dari Princenton University di bidang semikonduktor, juga pernah membuat kesalahan besar dengan mencoba berinovasi membuat alat pancing. Padahal Harari sendiri tidak suka memancing dan bahkan tidak pernah pergi memancing. Inovasinya berakhir di kegagalan besar. Ketika Harari memutuskan kembali menggeluti bidang yang dia cintai, lahirlah inovasi USB flash memory yang legendaris sampai sekarang, yang menghantarkannya mendirikan perusahaan SanDisk. Harari sendiri akhirnya terkenal dan dijuluki bapak flashdisk.</p>\r\n<p style="text-align: justify;">Google adalah perusahaan yang mengerti bahwa cinta dan passion bisa membuat seseorang menjadi produktif. Perusahaan yang didirikan oleh Larry Page &amp; Sergey Brin ini membuat kebijakan <em>Innovation Time Off</em>, di mana pegawai boleh mengalokasikan 20% waktu kerjanya untuk melakukan pekerjaan yang mereka cintai dan jadi passion mereka. Dan beberapa tahun kemudian, kenyataan membuktikan bahwa <em>Innovation Time Off</em> yang sebenarnya hanya 20% dari waktu kerja formal itu, berhasil menghasilkan lebih dari 50% produk dan layanan baru google saat ini.</p>\r\n<p style="text-align: justify;"><strong>2. TINGGALKAN JEJAK DI ALAM SEMESTA</strong></p>\r\n<p style="text-align: justify;"><strong></strong>Visi hidup untuk meninggalkan jejak di alam semesta juga merupakan karakter wajib bagi para inovator. Mark Zuckerberg, founder facebook mengatakan bahwa, semua yang dia lakukan bukan soal menghasilkan uang, facebook dibuat supaya dunia menjadi terbuka bagi siapapun, dengan menghubungkan atribut sosial setiap orang yang membuat akun di sana.</p>\r\n<p style="text-align: justify;"><img class="alignright  wp-image-1571" style="margin-left: 5px; margin-right: 5px;" title="stevewozniak" src="http://romisatriawahono.net/wp-content/uploads/2012/09/stevewozniak.jpg" alt="" width="130" height="130" />Steve Wozniak ketika mendirikan Apple bersama Steve Jobs pada tahun 1976 mengatakan bahwa, visi mereka adalah mengubah dunia dengan menghadirkan komputer bagi orang biasa. Komputer bagi orang biasa, adalah visi dan mimpi yang terlalu besar di tahun 1976. Karena pada saat itu komputer tidak memungkinkan untuk digunakan orang awam, disamping tidak ada user interface yang memadai, aplikasi yang tidak banyak untuk pemakaian sehari-hari, juga ukuran fisiknya yang sangat-sangat besar.</p>\r\n<p style="text-align: justify;">Visi untuk meninggalkan jejak ini penting ketika kita mengamati bagaimana Xerox seharusnya bisa menguasai seluruh industri teknologi informasi di era tahun 1970an. Karena mereka menjadi pioner di hampir semua produk canggih dalam dunia teknologi informasi. Xerox dengan Palo Alto Research Center (PARC) nya sudah berhasil mengembangkan aplikasi berbasis <em>graphical user interface</em> (GUI) dan device mouse, yang di era itu, belum ada yang berhasil memproduksinya. Justru kunjungan Steve Jobs ke PARC yang akhirnya menjadi kunjungan paling bersejarah dalam dunia industri PC (<em>personal computer</em>), karena Steve Jobs lah yang akhirnya bisa berinovasi dengan mencontek produk Xerox PARC untuk pengembangan produk Apple yang bervisi komputer yang bisa digunakan untuk orang biasa. Steve Jobs mengungkapkan bahwa seandainya Xerox mempunyai visi untuk meninggalkan jejak di alam semesta ini, kondisi saat ini akan berbeda. Sebaliknya, Adele Goldberg, salah satu founder dan petinggi Xerox mengatakan bahwa, &ldquo;mengizinkan Steve Jobs berkunjung ke Xerox PARC adalah keputusan paling buruk dalam sejarah korporasi di dunia&rdquo;.</p>\r\n<p style="text-align: justify;"><strong>3. PERAS OTAK</strong></p>\r\n<p style="text-align: justify;"><strong></strong><img class="alignleft  wp-image-1572" style="margin-left: 5px; margin-right: 5px;" title="adamkhoo" src="http://romisatriawahono.net/wp-content/uploads/2012/09/adamkhoo.jpg" alt="" width="122" height="131" />Tidak ada manusia yang bodoh, karena otak manusia yang beratnya 1 kg, ternyata hanya dipakai kurang dari 1% oleh manusia biasa, dan hanya 4-5% oleh manusia jenius seperti Albert Einstein. Masih tersisa 95-99% dari otak kita yang menganggur alias belum kita pakai. Saya pernah menulis tentang ini dalam artikel <a href="http://romisatriawahono.net/2009/08/10/defragmentasi-otak/">defargmentasi otak</a>. Harus kita sadari bahwa kita belum maksimal menggunakan otak kita. Kebodohan bukanlah karena kita tidak ada kemampuan untuk menjadi pintar, kebodohan adalah ketidakmauan kita untuk belajar dan bekerja keras. Kisah perjalanan hidup Adam Khoo dalam bukunya &ldquo;I am gifted and so are you &hellip;&rdquo;, menyadarkan kita bahwa tak ada manusia bodoh di dunia ini. Adam Khoo yang ketika SD mendapatkan nilai selalu buruk dan dicap bodoh, kemudian pelan-pelan bangkit dan berhasil menjadi nomer 1 di SMP, SMA dan universitas, hingga akhirnya dengan usaha dan belajar kerasnya berhasil menjadi milyader termuda pada usia 25 tahun di Singapura.</p>\r\n<p style="text-align: justify;">Aaron Stern bahkan menempuh langkah gila untk membuktikan bahwa jenius itu tidak dilahirkan, tapi jenius itu bisa diciptakan. Penelitian dilakukan dengan obyek penelitian putrinya sendiri bernama Edith Stern. Edith sejak lahir dididik dalam lingkungan steril yang mendukung untuk menjadikannya cerdas. Hasilnya, Edith berhasil menyelesaikan membaca Encyclopedia Britanica pada umur 5 tahun, memiliki IQ 200, dan mendapatkan PhD di bidang matematika pada umur 15 tahun. Project Edith yang digagas Aaron Stern membuktikan bahwa kecerdasan manusia bisa dilatih untuk mencapai tingkat yang lebih tinggi. Sekali lagi tidak ada manusia di dunia ini yang bodoh, yang ada adalah manusia yang tidak mau berusaha dan bekerja keras.</p>\r\n<p style="text-align: justify;"><strong>4. BERPIKIR BERBEDA</strong></p>\r\n<p style="text-align: justify;"><strong></strong><img class="alignright  wp-image-1574" style="margin-left: 5px; margin-right: 5px;" title="alberteinstein" src="http://romisatriawahono.net/wp-content/uploads/2012/09/alberteinsteins.jpg" alt="" width="144" height="148" />oger Wolcott Sperry, salah satu pakar neurologi mengatakan bahwa otak manusia terdiri dari dua hemisfer, otak kanan dan otak kiri, yang mempunyai fungsi yang berbeda. Otak kiri cenderung mengurusi hal logis, algoritmis dan matematis, sedangkan otak kanan mengurusi intuisi dan imajinasi. Manusia cerdas adalah manusia yang bisa mengkombinasikan otak kiri dan kanan. Banyak orang menyangka bahwa harus selalu berpikir secara logis, padahal kenyataannya, keputusan bisnis sering dikeluarkan dengan menggunakan insting dan intuisi yang notabene menggunakan otak kanan. Bahkan seorang Albert Einstein yang boleh dikatakan jenius di bidang sains dan ilmu eksakta, mengatakan bahwa imajinasi lebih penting daripada pengetahuan. Dengan imajinasi dari otak kanan, Einstein bisa bebas tanpa batas memformulasikan berbagai teori yang ada di luar jangkauan logika manusia pada masa itu.</p>\r\n<p style="text-align: justify;">Steve Jobs juga mengandalkan konsep berpikir berbeda dengan menyeimbangkan otak kiri dan kanan ketika mengembangkan produk Apple. Apple meluncurkan produk iPod, sebuah alat pemutar musik, yang sebenarnya adalah produk biasa dan sudah ada sebelumnya. Perbedaan dengan produk pemutar musik lainnya adalah kemampuan Jobs menghubungkan iPod dengan layanan penjualan musik yang dia bangun bernama iTunes. Asosiasi device iPod dan iTunes adalah ide kreatif yang pada masanya belum ada yang mencoba mengembangkannya.</p>\r\n<p style="text-align: justify;"><strong>5. GUNAKAN BAHASA MANUSIA</strong></p>\r\n<p style="text-align: justify;"><strong></strong>Karakter inovator terakhir adalah kemampuan dalam menyampaikan pesan. Pakar komunikasi Gregory Berns mengatakan bahwa seseorang bisa memiliki ide hebat yang baru dan berbeda, tapi semua akan sia-sia jika tidak bisa meyakinkan banyak orang. Salah satu faktor yang membuat kita mampu meyakinkan orang lain adalah ketika kita mampu mengubah bahasa teknik yang sulit ke bahasa yang mudah dipahami oleh manusia biasa. Berbicara dengan bahasa manusia sudah sering saya uraikan di blog ini, misalnya tulisan berjudul <a href="http://romisatriawahono.net/2008/08/25/wahai-dosen-berbicaralah-dengan-bahasa-manusia/">Wahai Dosen, Berbicaralah dengan Bahasa Manusia</a>.</p>\r\n<p style="text-align: justify;"><img class="alignleft  wp-image-1575" style="margin-left: 5px; margin-right: 5px;" title="Benioff" src="http://romisatriawahono.net/wp-content/uploads/2012/09/benioff.jpg" alt="" width="115" height="116" />Marc Russell Benioff, founder SalesForce, perusahaan yang bergerak di bidang layanan aplikasi cloud menggunakan istilah menarik untuk membahasa manusiakan terminologi <em>cloud computing</em>. <em>The end of software</em>, demikian jargon SalesForce. Benioff ingin menunjukkan bahwa masa menjual software dengan cara biasa sudah selesai, dan sekarang waktunya untuk menjual software sebagai suatu layanan (<em>software as a service</em>). Dengan ini, menggunakan software itu kondisinya sama seperti kita menggunakan listrik atau telepon. Kita hanya perlu membayar sewa dari layanan (software) yang kita gunakan secara periodik, baik bulanan atau tahunan.</p>\r\n<p style="text-align: justify;">Ketika launching iPad, Steve Jobs tidak menggunakan kalimat teknik yang sulit dan canggih, dia hanya mengatakan bahwa, &ldquo;iPad adalah alat ajaib yang revolusioner dengan harga yang mencengangkan&rdquo;. Ketika memperkenalkan MacBook Air, Jobs juga hanya mengatakan &ldquo;MacBook Air adalah notebook paling tipis sedunia&rdquo;. iPod disajikan Steve Jobs dengan bahasa, &ldquo;iPod, seribu lagu di sakumu&rdquo;. Menurut penelitian yang dilakukan oleh Todd Bishop, kalimat yang digunakan oleh Steve Jobs memiliki <em>indeks fog</em> antara 5-7, sementara tokoh-tokoh IT lain seperti Bill Gates memiliki indeks fog 9-11. Indeks fog adalah jumlah tahun pendidikan yang diperlukan seorang pembaca untuk memahami sebuah perkataan. Bayangkan anak SD kelas 6 pun tidak kesulitan mengikuti pidato dari Steve Jobs!</p>\r\n<p>&nbsp;</p>\r\n<p style="text-align: center;"><img src="../userfiles/w.jpg" alt="" width="400" height="285" /></p>\r\n<p>&nbsp;</p>\r\n<p>5 karakter inovator, sudahkah kita miliki? Mudah-mudahan kita semua tetap dalam perdjoeangan untuk meraihnya.</p>', 'http://romisatriawahono.net/2012/09/27/5-karakter-para-inovator/', 2, 3);

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

INSERT INTO `t_banner` VALUES (1, 'Kajian website', 'http://www.kajianwebsite.org', 3, 13, 3, '1', 'jpg');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_belajar`
-- 


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_belajar_kls`
-- 


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

INSERT INTO `t_buku` VALUES (3, 'Nirina', 'nirina@infokita.com', 'saliandra no.4', ' Apakah  pada  hari  Jumat,  sekolah  cuti  bersama  atau  memang  masuk  seperti  biasanya.   ', '11:36:01', '16/12/2012', '127.0.0.1', NULL);
INSERT INTO `t_buku` VALUES (2, 'wiko wikacsono', 'ww@yihaa.net', 'Jl. samurasun No. 4 Bandung', ' Permisi.<br  />\r\nsaya  orang  tua  siswa  kelas  8  ingin  bertanya  apakah  pembayaran  SPP  bisa  melalui  transver?  Terimakasih.   ', '11:31:21', '16/12/2012', '127.0.0.1', 'Untuk pembayaran SPP saat ini bisa dilakukan di Bank yang telah bekerjasama dengan kami seperti BCA, MANDIRI, BJB, BRI dengan melakukan transver ke no. id. 076.8954.9987.999 a.n. SMP Cinta Indonesia. setelah pembayaran dilakukan, harap mengkonfirmasi kepada kami melalui Emai, atau Telp dengan menyertakan kode referensi transvernya. Terimakasih.');

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
INSERT INTO `t_download` VALUES (8, 'Uji Kemampuan Fisika', 'Materi berupa animasi Flash yang di design untuk dipahami sendiri.', 'Lain-lain', 'al8.swf', 6, '157,19 Kbytes', '12/07/2006 20:09:23');
INSERT INTO `t_download` VALUES (9, 'Uji Kemampuan Biologi', 'Animasi flash yang dirancang untuk memudahkan siswa dalam belajar mandiri.\r\nSumber : www.e-dukasi.net', 'B. Inggris', 'al9.swf', 3, '166,75 Kbytes', '12/07/2006 20:12:11');
INSERT INTO `t_download` VALUES (10, 'Persamaan Kuadrat', 'Animasi flash yang dirancang untuk memudahkan siswa dalam belajar mandiri.\r\nSumber : www.e-dukasi.net', 'B. Indonesia', 'al10.swf', 2, '76,90 Kbytes', '12/07/2006 20:13:17');
INSERT INTO `t_download` VALUES (11, 'ATMOSFER (Cuaca dan Iklim)', 'Animasi flash yang dirancang untuk memudahkan siswa dalam belajar mandiri.\r\nSumber : www.e-dukasi.net', 'Kimia', 'al11.pdf', 6, '504,49 Kbytes', '12/07/2006 20:15:06');
INSERT INTO `t_download` VALUES (13, 'Dinamika Partikel 1', 'Materi berupa penjelasan mengenai Dinamika Partikel bagian ke 1.\r\nSumber : www.e-dukasi.net', 'Fisika', 'al13.zip', 6, '522,53 Kbytes', '12/07/2006 20:20:29');
INSERT INTO `t_download` VALUES (14, 'Magnetik', 'Memahami konsep kemagnetan dan penerapannya dalam kehidupan sehari-hari.', 'Fisika', 'al14.pdf', 0, '462,16 Kbytes', '16/12/2012 11:58:13');

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

INSERT INTO `t_galeri` VALUES (6, 'Dibantu Instruktur', 1);
INSERT INTO `t_galeri` VALUES (7, 'Peserta begitu seriusnya dalam pelatihan', 1);
INSERT INTO `t_galeri` VALUES (8, 'Instruktur sedang membantu Peserta', 1);
INSERT INTO `t_galeri` VALUES (9, 'Kebersamaan dalam belajar bersama', 1);
INSERT INTO `t_galeri` VALUES (10, 'Saling mengajarkan kepada yang belum bisa', 1);

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

INSERT INTO `t_galerialbum` VALUES (1, 'Workshop Pembelajaran Menggunakan ICT', '07-12-2012');

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

INSERT INTO `t_gambaratas` VALUES (3, 'header_smp1', 'jpg');
INSERT INTO `t_gambaratas` VALUES (4, 'header_smp2', 'jpg');

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

INSERT INTO `t_info` VALUES (1, '<p>Pengumuman</p>\r\n<p>Kepada Seluruh Siswa yang akan mengikuti karya wisata ke Lombok</p>\r\n<p>agar melapor kepada panitia di sekolah untuk re-registrasi.</p>', 'Karya Wisata Siswa Ke Lombok 2013 ', '16/12/2012');
INSERT INTO `t_info` VALUES (2, '<p style="text-align: center;">Pengumuman</p>\r\n<p style="text-align: justify;">Pada tanggal 25 - 30 Desember 2013 akan dilaksanakan Ujian Akhir Semester Genap. Kepada seluruh siswa siswi SMP Cinta Indonesia agar dapat mendownload Jadwal secara rincinya di email masing masing atau dapat meminta ke Panitia Penyelenggara UAS Genap 2013.</p>', 'UAS Genap 2013', '16/12/2012');

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
  `kelas` varchar(10) collate latin1_general_ci NOT NULL default '',
  `nip` varchar(25) collate latin1_general_ci NOT NULL default '',
  `tingkat` varchar(1) collate latin1_general_ci default NULL,
  `program` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`kelas`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `t_kelas`
-- 

INSERT INTO `t_kelas` VALUES ('XII IPS 1', '131850412', '3', 'IPS');
INSERT INTO `t_kelas` VALUES ('XII IPA 5', '131286221', '3', 'IPA');
INSERT INTO `t_kelas` VALUES ('XII IPA 4', '131975072', '3', 'IPA');
INSERT INTO `t_kelas` VALUES ('XII IPA 3', '132105436', '3', 'IPA');
INSERT INTO `t_kelas` VALUES ('XII IPA 2', '400001003', '3', 'IPA');
INSERT INTO `t_kelas` VALUES ('XII IPA 1', '400001002', '3', 'IPA');
INSERT INTO `t_kelas` VALUES ('XI IPS 3', '131813622', '2', 'IPS');
INSERT INTO `t_kelas` VALUES ('XI IPS 2', '132122049', '2', 'IPS');
INSERT INTO `t_kelas` VALUES ('XI IPS 1', '131630516', '2', 'IPS');
INSERT INTO `t_kelas` VALUES ('XI IPA 2', '132108283', '2', 'IPA');
INSERT INTO `t_kelas` VALUES ('XI IPA 1', '132086211', '2', 'IPA');
INSERT INTO `t_kelas` VALUES ('VIII A', '19600122 197903 7777', '2', '-');
INSERT INTO `t_kelas` VALUES ('XI IPA 5', '132108298', '2', 'IPA');
INSERT INTO `t_kelas` VALUES ('XI IPA 4', '131975019', '2', 'IPA');
INSERT INTO `t_kelas` VALUES ('XI IPA 3', '132108312', '2', 'IPA');
INSERT INTO `t_kelas` VALUES ('VIII B', '19621127 198412 2 003', '2', '-');
INSERT INTO `t_kelas` VALUES ('VIII C', '19590318 198103 1 010', '2', '-');
INSERT INTO `t_kelas` VALUES ('XII IPS 2', '132122031', '3', 'IPS');
INSERT INTO `t_kelas` VALUES ('XII IPS 3', '131683538', '3', 'IPS');
INSERT INTO `t_kelas` VALUES ('VII  A', '19650711 198703 2 005', '1', '-');
INSERT INTO `t_kelas` VALUES ('VII  B', '19701118 199802 2 002', '1', '-');
INSERT INTO `t_kelas` VALUES ('VII  C', '19551104 198003 2 002', '1', '-');
INSERT INTO `t_kelas` VALUES ('VII  E', '19820102 200604 2 018', '1', '-');
INSERT INTO `t_kelas` VALUES ('VII  D', '19711115 199412 2 001', '1', '-');
INSERT INTO `t_kelas` VALUES ('VII  F', '19600122 197903 6666', '1', '-');
INSERT INTO `t_kelas` VALUES ('VII  G', '19520629 197903 2 003', '1', '-');
INSERT INTO `t_kelas` VALUES ('VII  H', '19550329 197903 1 002', '1', '-');
INSERT INTO `t_kelas` VALUES ('VII  I', '19690906 200801 1 011', '1', '-');
INSERT INTO `t_kelas` VALUES ('VII  J', '19550604 198003 1 004', '1', '-');
INSERT INTO `t_kelas` VALUES ('VIII D', '19600122 197903 5555', '2', '-');
INSERT INTO `t_kelas` VALUES ('VIII E', '19600319 198101 2 001', '2', '-');
INSERT INTO `t_kelas` VALUES ('VIII F', '19600419 198903 1 004', '2', '-');
INSERT INTO `t_kelas` VALUES ('VIII G', '19700620 199512 2 002', '2', '-');
INSERT INTO `t_kelas` VALUES ('VIII H', '19600122 197903 1 002', '2', '-');
INSERT INTO `t_kelas` VALUES ('IX  A', '19600122 197903 2222', '3', '-');
INSERT INTO `t_kelas` VALUES ('IX  C', '19600122 197903 1111', '3', '-');
INSERT INTO `t_kelas` VALUES ('IX  D', '19630119 199412 2 001', '3', '-');
INSERT INTO `t_kelas` VALUES ('IX  E', '19600122 197903 4444', '3', '-');
INSERT INTO `t_kelas` VALUES ('IX  F', '19630116 198403 2 008', '3', '-');
INSERT INTO `t_kelas` VALUES ('IX  G', '19600122 197903 3333', '3', '-');
INSERT INTO `t_kelas` VALUES ('IX  H', '19590118 198603 2 004', '3', '-');
INSERT INTO `t_kelas` VALUES ('IX  B', '19641212 198512 2 002', '3', '-');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=16 ;

-- 
-- Dumping data for table `t_member`
-- 


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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=14 ;

-- 
-- Dumping data for table `t_mengajar`
-- 

INSERT INTO `t_mengajar` VALUES (1, '400001001', 'XII IPA 1', 'Matematika', NULL);
INSERT INTO `t_mengajar` VALUES (2, '400001001', 'XII IPA 2', 'Matematika', NULL);
INSERT INTO `t_mengajar` VALUES (7, '400001002', 'X - 2', 'B. Inggris', '-');
INSERT INTO `t_mengajar` VALUES (9, '400001001', 'X - 4', 'BK', '-');
INSERT INTO `t_mengajar` VALUES (13, '400001002', 'X - 4', 'Matematika', NULL);

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

INSERT INTO `t_news` VALUES (9, '<p>Ada kekhawatiran pada masyarakat jika Kurikulum 2013 diterapkan akan ada penghapusan beberapa mata pelajaran. Kekhawatiran ini dijawab Mendikbud Mohammad Nuh, bahwa tidak ada penghapusan mata pelajaran, yang ada hanya pengintegrasian mata pelajaran.</p>\r\n<p>Mata pelajaran IPA dan IPS di sekolah dasar (SD) diintegrasikan ke dalam semua mata pelajaran. Pengintegrasian ini dilakukan karena penting, serta menyesuaikan zaman yang terus mengalami perkembangan pesat.</p>\r\n<p>Hadirnya kurikulum baru bukan berarti kurikulum lama tidak bagus. Kurikulum 2013 disiapkan untuk mencetak generasi yang siap di dalam menghadapi masa depan. Karena itu kurikulum disusun untuk mengantisipasi perkembangan masa depan. Pergeseran paradigma belajar abad 21 dan kerangka kompetensi abad 21 menjadi pijakan di dalam pengembangan kurikulum 2013.</p>\r\n<p><img src="../userfiles/1.jpg" alt="" width="536" height="383" /></p>\r\n<p><img src="../userfiles/2.jpg" alt="" width="535" height="404" /></p>', 'Uji Publik Kurikulum 2013', '3', '11:01:40', '12/16/2012', 1);
INSERT INTO `t_news` VALUES (10, '<div class="views-field-field-berita-isi-value">\r\n<div class="field-content">\r\n<p class="rtejustify">Jakarta --- Konsep pelatihan para guru dalam menghadapi kurikulum 2013 akan dilakukan dengan menggunakan metode master teacher. Guru-guru berprestasi dan memiliki skill atau kemampuan mengajar yang baik akan dilatih terlebih dahulu untuk kemudian menyampaikan ilmu yang didapat kepada guru yang lain. "Bisa guru juara lomba nasional, guru teladan nasional, guru terbaik di sekolah-sekolah swasta, negeri, sekolah internasional, ada juga sebagian dosen dan praktisi sebagai pelatih. Mereka yang akan memberikan pelatihan ke guru-guru yang akan menjadi master teacher," jelas Mendikbud Mohammad Nuh di ruangannya, pada Selasa (11/12) lalu.</p>\r\n<p>Tiga hal yang penting dalam pelatihan guru ini adalah materi pelatihan, target guru yang dilatih, dan metode pelatihan yang digunakan. Guru yang mendapat prioritas pelatihan adalah guru kelas I, IV, VII, dan X dengan materi seputar konsep kurikulum baru. "Sebenarnya, opsinya kan ada beberapa terkait teknis pelaksanaan. Tetapi, kemungkinan besar adalah diterapkan pada kelas I, IV, VII, dan X," ujar Menteri Nuh.</p>\r\n<p>Ia menjelaskan, setiap pelatihan nantinya akan selalu ada pre-test dan post test. "Dari situ kita lihat master teacher terbaik. Sehingga kita punya stok master teacher," katanya. Salah satu tujuan konsep master teacher ini adalah untuk menumbuhkan rasa percaya diri guru, dan memotivasi guru&nbsp; untuk berprestasi.</p>\r\n<p>Guru-guru yang akan dipilih untuk mengikuti pelatihan menjadi master teacher tidak hanya berasal dari kota besar, tetapi juga dari tingkat kabupaten. "Kita ingin membangun atmosfer supaya guru berlomba untuk berprestasi. Karirnya tidak hanya berupa tunjangan profesi, pangkat, tapi ada status yang lain, yaitu&nbsp;master teacher," tutur Menteri Nuh.</p>\r\n<p>Pelatihan guru akan dilakukan secara paralel dengan pelatihan master teacher, yaitu berupa angkatan. "Begitu angkatan satu master teacher selesai dan dinyatakan qualified, dia langsung terjun ke lapangan, training guru-guru di mana-mana," terang Mendikbud. Sementara angkatan master teacher yang pertama melakukan pelatihan untuk guru-guru, pelatihan angkatan kedua untuk master teacher terus dilakukan, dan seterusnya. Dalam menjalankan pelatihan guru tersebut, Kemdikbud akan terus menjamin quality control para guru yang menjadi peserta pelatihan. (DM)</p>\r\n</div>\r\n</div>', 'Master Teacher Jadi Konsep Pelatihan Guru untuk Hadapi Kurikulum 2013', '3', '11:07:07', '12/16/2012', 1);
INSERT INTO `t_news` VALUES (11, '<p>Kamis, 24 November 2011 | 13:54 WIB <br /> <br />JAKARTA, KOMPAS.com - Ketua Pengurus Besar Persatuan Guru Republik Indonesia Sulistyo mengatakan, berbagai persoalan yang terjadi di Tanah Air memiliki korelasi langsung maupun tidak langsung dengan penyelenggaraan pendidikan nasional. Menurutnya, sistem pendidikan nasional saat ini belum mampu memberikan kontribusi yang signifikan bagi pencerdasan bangsa. Padahal, katanya, hal ini akan membawa implikasi terhadap kemakmuran dan martabat mulia bangsa. <br /> <br />Desain pendidikan nasional, menurut Sulistyo, meneruskan kerangka politik etis pemerintah kolonial Belanda. Hal itu tercermin pada pendidikan yang masih diskriminatif, menghasilkan tenaga kerja murah, dan menciptakan lulusan yang berorientasi menjadi pegawai negara. <br /> <br />Kebijakan yang tidak jelas antara pusat dan daerah membuat pendidikan kita juga menjadi tidak jelas, apakah pendidikan nasional, atau pendidikan daerah, kata Sulistyo saat syukuran memperingati Hari Guru Nasional dan hari jadi PGRI ke-66, di gedung PGRI, Jakarta, Kamis (24/11/2011). <br /> <br />''Kebijakan yang tidak jelas antara pusat dan daerah membuat pendidikan kita juga menjadi tidak jelas, apakah pendidikan nasional, atau pendidikan daerah'' <br /> <br />Menurutnya, pendidikan nasional belum disusun sebagai sebuah upaya membangun mindset dan mentalitas bangsa merdeka yang bertanggungjawab terhadap diri serta lingkungannya. Ketiadaan visi dan program pendidikan yang tidak diagendakan dalam strategi pembangunan ekonomi dan kebudayaan bangsa, dinilainya sebagai salah satu pemicu utama yang membuat operasi pendidikan nasional berlangsung seperti tanpa arah................ <br /> <br />Sumber: Kompas.Com <br />Berita Lengkap: <a href="http://edukasi.kompas.com/read/2011/11/24/1354248/Guru.Kritik.Kebijakan.Pendidikan.Nasional" target="_blank">http://edukasi.kompas.com/read/2011/11/24/1354248/Guru.Kritik.Kebijakan.Pendidikan.Nasional</a></p>', 'Hari Guru Nasional : Guru Kritik Kebijakan Pendidikan Nasional', '3', '15:08:55', '12/16/2012', NULL);
INSERT INTO `t_news` VALUES (12, '<p>Minggu, 23 Oktober 2011 | 21:13 WIB <br /> <br />BOGOR, KOMPAS.com- Berbagai kebijakan pendidikan tidak berdasarkan hasil riset dan analisis yang mendalam. Riset pendidikan selama ini hanya bersifat reaktif dan hanya menjadi solusi masalah jangka pendek. Akibatnya, pemerintah tidak memiliki strategi kebijakan pendidikan jangka panjang. <br /> <br />Demikian mengemuka dalam lokakarya Penajaman Peran dan Fungsi Balitbang dalam rangka Reformasi Birokrasi yang berlangsung Sabtu hingga Minggu (23/10/2011), di Bogor. <br /> <br />Wakil Menteri Pendidikan dan Kebudayaan Bidang Pendidikan Musliar Kasim mengakui, seharusnya hasil riset isu-isu pendidikan oleh Badan Penelitian dan Pengembangan (Balitbang) Kementerian Pendidikan dan Kebudayaan bisa ditindaklanjuti menjadi kebijakan. Apapun kebijakan pemerintah seharusnya dibuat berdasarkan hasil kajian dan analisis dari balitbang. <br /> <br />Riset jangan hanya dilakukan internal dan parsial. Agar riset bisa menjadi kebijakan, pihak lain seperti daerah dan lembaga penelitian harus ikut dilibatkan. Ini yang belum dilakukan, kata Musliar. <br /> <br />Sofian Effendi, anggota tim Reformasi Birokrasi Nasional Wakil Presiden RI, mengkritik kebijakan pemerintah yang cenderung reaktif dan dirumuskan tidak untuk memecahkan masalah jangka panjang. Padahal Indonesia membutuhkan perubahan strategi pendidikan 20-30 tahun ke depan. <br /> <br />Seharusnya, tugas paling pokok balitbang membuat kajian kebijakan jangka panjang, melihat perkembangan Indonesia 25 tahun ke depan. Apa masalah yang akan dihadapi dan bagaimana SDM yang harus dicetak, kata Sofian. <br /> <br />Hasil riset dan analisis balitbang itulah yang kemudian menjadi pegangan mendikbud untuk pelaksanaannya. Bukan sebaliknya seperti yang terjadi sekarang. <br /> <br />Selama ini, kata Sofian, Balitbang hanya sibuk mencari justifikasi dari pernyataan atau kebijakan menteri. Tugas balitbang, kata Sofian, bukan melakukan penelitian murni tentang isu-isu pendidikan karena itu bisa dilakukan perguruan tinggi yang jelas memiliki lebih banyak SDM. Balitbang seharusnya melakukan manajemen riset atau kajian kebijakan. <br /> <br />Mereka harus melakukan policy research. Bukan scientific research seperti sekarang. Untuk bisa policy research, Balitbang perlu analis-analis kebijakan. Bukan peneliti, kata Sofian. <br /> <br />Kepala Balitbang Kemdikbud Khairil Anwar Notodiputro berencana mengembangkan riset kebijakan yang responsif, antisipatif, dan futuristik. Ia berharap reformasi peran dan fungsi balitbang bisa mengembangkan mutu hasil litbang sehingga bisa menjadi penunjuk jalan bagi perubahan di pendidikan dan kebudayaan. <br /> <br />Namun sebelum bisa melakukan itu, peran dan fungsi Balitbang harus diperkuat. Salah satunya dengan mengubah Peraturan Menteri Pendidikan Nasional Nomor 40 Tahun 2006 tentang fungsi dan peran Balitbang, yakni mengadakan penelitian dan pengembangan. <br /> <br />Anggota Komisi X DPR RI Hetifah Sjaifudian mendesak pemerintah mengubah permendiknas itu sehingga Balitbang bisa menjadi motor reformasi internal. Melalui riset dan analisis kebijakan yang melibatkan pemerintah daerah, perguruan tinggi, dan LSM maka potensi penyimpangan bisa diperkecil. <br /> <br />Penggunaan anggaran pendidikan hanya 40 persen saja yang efektif. Sisanya tidak efektif karena tidak tepat sasaran dan tidak tepat waktu. Kenapa? Karena tidak ada analisis kebijakan...................... <br /> <br />Sumber: Kompas.Com <br />Berita Lengkap: <a href="http://edukasi.kompas.com/read/2011/10/23/21134710/Kebijakan.Pendidikan.Tak.Berdasar.Riset" target="_blank">http://edukasi.kompas.com/read/2011/10/23/21134710/Kebijakan.Pendidikan.Tak.Berdasar.Riset</a></p>', 'Kebijakan Pendidikan Tak Berdasar Riset', '3', '15:10:28', '12/16/2012', 2);
INSERT INTO `t_news` VALUES (13, '<p>Senin, 6 Desember 2010 | 17:17 WIB <br /> <br />JAKARTA, KOMPAS.com - Kebijakan dana BOS (Bantuan Operasional Sekolah) terbukti kurang mampu menekan penyelewengan dalam pengelolaannya. Temuan hasil pemeriksaan BPK Perwakilan Jakarta atas 6 SMPN dan SDN di Jakarta tentang kerugian negara/daerah sebesar Rp 5,7 miliar merupakan bukti adanya penyelewengan pengelolaan dana BOS di tingkat sekolah. <br /> <br />''Pengelolaannya selama ini cenderung tertutup dan tidak mengikuti panduan pengelolaan dana BOS sebagaimana yang telah dibuat oleh Kemdiknas.'' <br />-- Febri Hendri <br /> <br />Sebelumnya, pada 2007 BPK RI juga telah menemukan adanya penyelewengan dana BOS 2.054 sekolah dari 3.237 sampel sekolah yang diperiksa dengan dengan nilai penyimpangan kurang lebih Rp 28,1 miliar. Artinya, terdapat enam dari sepuluh sekolah melakukan penyimpangan pengelolaan dana BOS pada tahun 2007 dengan rata-rata penyimpangan sebesar Rp 13,6 juta. <br /> <br />Peneliti senior Indonesia Corruption Watch (ICW) Febri Hendri kepad Kompas.com, Senin (6/12/2010), mengungkapkan, penyimpangan dana BOS di tingkat sekolah kini telah menjadi fenomena umum. Salah satu faktor penyebabnya adalah rendahnya transparansi, akuntabilitas dan partisipasi warga atas pengelolaannya............................ <br /> <br />Sumber: Kompas.Com <br />Berita Lengkap: <a href="http://edukasi.kompas.com/read/2010/12/06/17175963/" target="_blank">http://edukasi.kompas.com/read/2010/12/06/17175963/</a> <br />Sulitnya.Tekan.Penyelewengan.Dana.BOS</p>', 'Sulitnya Tekan Penyelewengan Dana BOS ', '3', '15:11:42', '12/16/2012', NULL);
INSERT INTO `t_news` VALUES (14, '<p>Senin, 6 Desember 2010 | 17:00 WIB <br /> <br />JAKARTA, KOMPAS.com - Indonesia Corruption Watch (ICW) menyampaikan poin penting yang harus diperbaiki Kementrian Pendidikan Nasional terkait kebijakan dan mekanisme pengelolaan dana BOS (Biaya Operasional Sekolah). Hal itu terutama menyangkut kasus hasil audit BPK (Badan Pemeriksa Keuangan) dan putusan KIP (Komisi Informasi Pusat). <br /> <br />''Kemdiknas perlu memperbaiki kebijakan dan mekanisme pengelolaan dana BOS terkait aspek transparansi, akuntabilitas dan partisipasi warga dan orangtua murid dalam pengelolaannya.'' <br />-- Febri Hendri <br /> <br />Kami menyampaikan kepada pihak Kemdiknas untuk memperbaiki kebijakan dan mekanisme pengelolaan dana BOS terkait aspek transparansi, akuntabilitas dan partisipasi warga dan orangtua murid dalam pengelolaan dana BOS, kata peneliti senior ICW, Febri Hendri, saat berdialog dengan Didik Suhardi, Direktur SMP Dirjen Mendikdasmen di kantor Kementrian Pendidikan Nasional, Jalan Sudirman, Senin (6/12/2010). <br /> <br />Febri menyampaikan, Kemdiknas harus memasukkan putusan KIP terutama Bab VIII tentang Pengawasan, Pemeriksaan, dan Saksi terutama pada bagian A poin 5 tentang pengawasan masyarakat. Poin ini perlu diperbaiki yakni dengan memasukkan bahwa publik dan orang tua murid dapat mengakses seluruh dokumen sekolah, terutama terkait pengelolaan dana BOS, papar Febri..................... <br /> <br />Sumber: Kompas.Com <br />Berita Lengkap: <a href="http://edukasi.kompas.com/read/2010/12/06/17003069/" target="_blank">http://edukasi.kompas.com/read/2010/12/06/17003069/</a> <br />ICW:.Kemdiknas.Harus.Ubah.Kebijakan.BOS</p>', 'ICW: Kemdiknas Harus Ubah Kebijakan BOS ', '3', '15:13:02', '12/16/2012', NULL);
INSERT INTO `t_news` VALUES (15, '<p>Rabu, 28 Desember 2011 | 09:47 WIB <br /> <br />JAKARTA, KOMPAS.com &mdash; Semboyan kita ke depan adalah jangan boleh ada anak yang tidak sekolah. Semua harus sekolah, sekolah, sekolah. <br /> <br />Itu yang dikatakan Menteri Pendidikan dan Kebudayaan Mohammad Nuh dalam wawancara khusus dengan Kompas.com, Senin (19/12/2011) di ruang kerjanya, Gedung Kementerian Pendidikan dan Kebudayaan, Jakarta. <br /> <br /> <br />Semboyan kita ke depan adalah jangan boleh ada anak yang tidak sekolah. Semua harus sekolah, sekolah, sekolah. <br />-- M Nuh <br />Nuh mengatakan hal itu saat ditanya apa harapan Kemdikbud menyongsong Tahun Baru 2012. Tahun 2011 ini, kinerja Kemdikbud tak lepas dari berbagai sorotan. Utamanya, mengenai biaya pendidikan yang semakin tinggi dan pungutan-pungutan liar yang masih terjadi di sekolah-sekolah negeri. <br /> <br />Saya punya tiga harapan. Pertama, sekolah. Dorong setiap anak untuk sekolah, meski ada kesulitan, tapi jangan putus sekolah. Dari segi pembiayaan, kini kita sudah semakin terbuka. Tidak hanya SD-SMP, tapi sampai perguruan tinggi, kata Nuh. <br /> <br />Kedua, ia menekankan perlunya mengedepankan nilai kejujuran. Sekolah, menurut dia, berperan untuk membentuk karakter dan kepribadian serta mengembangkan kecerdasan dan meningkatkan keterampilan. <br /> <br />Oleh karena itu, sekolah enggak sekedar sekolah, tetapi sekolah yang benar. Salah satu nilainya adalah kejujuran, ujarnya. <br /> <br />Ketiga, pemerintah mengharapkan partisipasi masyarakat. Nuh mengungkapkan, urusan sekolah tidak hanya menjadi urusan pemerintah, tetapi semua pihak. <br /> <br />Karena dampaknya bisa menyentuh kita semua. Pendidikan bukan investasi pemerintah, tetapi investasi bangsa. Oleh karena itu, partisipasi dari masyarakat diperlukan sesuai dengan bidangnya masing-masing, kata Nuh. <br /> <br />Apa yang bisa diharapkan? <br /> <br />Pada tahun 2012 mendatang, Kemdikbud menjanjikan akan memulai rintisan bantuan operasional sekolah (BOS) bagi siswa SMA/SMK. Hal ini dilakukan sebagai salah satu upaya untuk mewujudkan wajib belajar 12 tahun. <br /> <br />Kita siapkan rintisan wajib belajar 12 tahun di 2012 untuk jenjang SMAN. Ini juga untuk persiapan melubernya lulusan SMP. Kalau enggak disiapkan, tidak ada BOS, percuma mereka lulus SMP, tetapi tidak melanjutkan lagi. Oleh karena itu, kita siapkan rintisan BOS SMA. Mudah-mudahan tahun 2013 kita sudah bisa wajar 12 tahun, papar Nuh. <br /> <br />Selain itu, dana BOS bagi siswa SD dan SMP juga akan mengalami kenaikan unit cost. <br /> <br />Siapa yang bisa menjamin kelancaran penyaluran dananya dan sampai tepat sasaran? Seperti diketahui, pada tahun 2011 ini, keterlambatan dan penyelewengan dana BOS menjadi salah satu hal yang disoroti. Pemerintah pun mengambil kebijakan mengubah mekanisme penyaluran, yang semula dari kabupaten/kota ke sekolah menjadi dari provinsi ke sekolah. <br /> <br />Saya merasa optimistis mekanisme 2012 akan lancar karena telah terbukti. Prinsip dalam BOS itu ada empat ketepatan, yaitu tepat dari sisi waktu, tepat dari sisi jumlah, tepat dari sisi sasaran, dan tepat dari sisi penggunaan, ujar Nuh. <br /> <br />Mengenai sanksi terhadap sekolah yang melakukan penyelewengan penyaluran dana BOS, dikatakan Nuh, sudah ada ketentuan yang mengaturnya. Akan tetapi, ia meminta agar masyarakat yang mengeneralisasi semua sekolah melakukan penyelewengan. <br /> <br />Jangan dibayangkan semua sekolah itu korup. Memang ada yg kurang transparan, tapi enggak semuanya. Maka, dalam juknis kita pandu bahwa setiap sekolah diharapken membuat laporan penerimaan dan pengeluaran serta pampangkan di papan pengumuman sekolah sehingga orang bisa tahu. BOS juga bisa dipakai untuk media pembelajaran transparan dan akuntabel. Kalau ada penyimpangan, ya, dibenerin, papar Nuh. <br /> <br />Sementara itu, untuk pendidikan tinggi, tahun depan, pemerintah akan menaikkan alokasi jumlah mahasiswa miskin.................. <br /> <br />Sumber: Kompas.Com <br />Berita Lengkap: <a href="http://edukasi.kompas.com/read/2011/12/28/09473127/2012.Sekolah.Sekolah.Sekolah" target="_blank">http://edukasi.kompas.com/read/2011/12/28/09473127/2012.Sekolah.Sekolah.Sekolah</a></p>', 'Catatan Akhir Tahun : 2012: Sekolah, Sekolah, Sekolah!', '3', '15:14:45', '12/16/2012', NULL);
INSERT INTO `t_news` VALUES (16, '<p>JAKARTA, KOMPAS.com - Ketersediaan buku mata pelajaran harus terpenuhi di tahun 2012. Anggarannya bisa menggunakan dana Bantuan Operasional Sekolah (BOS). <br /> <br />Hal itu diungkapkan anggota Komisi X Dewan Perwakilan Rakyat (DPR), Rohmani, di Jakarta, Selasa (27/12/2012). <br /> <br />Ia mengatakan, tahun 2011 ini persoalan buku ini hampir terjadi di setiap daerah. BOS yang dikeluarkan pemerintah belum bisa menjawab ketersediaan buku mata pelajaran secara merata. <br /> <br />Persoalan keterjangkauan buku, hampir merata terjadi di setiap daerah. Wajar, terjadi keresahan di masyarakat karena pemerintah sudah menjanjikan sekolah gratis. Sementara kenyataannya persoalan ketersediaan buku belum teratasi. <br /> <br />Di lapangan, Rohmani mengaku menemui persoalan tersebut. Yakni, masih banyak siswa yang kesulitan memperoleh buku mata pelajaran atau buku lembar kerja siswa (LKS). <br /> <br />Keluhan persoalan mahalnya buku masih sering saya dengar ketika reses ke daerah. Para orang tua masih mengeluhkan betapa harga buku masih mahal, kata Rohmani. <br /> <br />Seharusnya hal tersebut tidak terjadi lagi, jika pemerintah tegas menerapkan peraturan yakni terutama pada tata kelola penggunaan BOS. <br /> <br />Misalnya, buku mata pelajaran tidak harus dibeli setiap tahun. Pihak sekolah cukup melengkapi kolesi buku-buku di perpustakaan. Untuk buku-buku tertentu, jenisnya tidak harus diganti setiap tahun. <br /> <br />Sekolah juga harus memperbaiki manajemennya. Terutama sistem pengelolaan perpustakaan sekolah. Untuk buku-buku ilmu pasti, tidak harus diganti setiap tahun...................... <br /> <br />Sumber: Kompas.Com <br />Berita Lengkap: <a href="http://edukasi.kompas.com/read/2011/12/27/14220267/Kebutuhan.Buku.Mata.Pelajaran.Siswa.Harus.Terpenuhi" target="_blank">http://edukasi.kompas.com/read/2011/12/27/14220267/Kebutuhan.Buku.Mata.Pelajaran.Siswa.Harus.Terpenuhi</a></p>', 'BOS 2012 : Kebutuhan Buku Mata Pelajaran Siswa Harus Terpenuhi', '3', '15:20:57', '12/16/2012', NULL);

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
INSERT INTO `t_pelajaran` VALUES ('FIS', 11, 'Fisika', 'Fisika', '-');
INSERT INTO `t_pelajaran` VALUES ('BIO', 13, 'Biologi', 'Biologi', '-');
INSERT INTO `t_pelajaran` VALUES ('TIK', 14, 'Tek. Informasi & Komunikasi', 'T I K', '-');
INSERT INTO `t_pelajaran` VALUES ('BK', 16, 'Bimbingan dan Konseling', 'BK', '-');
INSERT INTO `t_pelajaran` VALUES ('SMUSIK', 17, 'Pend. Seni Musik', 'Pendidikan Seni', '-');
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

INSERT INTO `t_pos_menu` VALUES (1, 'Jajak Pendapat', 'L', 3, 'depan', 'jajak', 't', 1);
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
INSERT INTO `t_pos_menu` VALUES (38, 'Pencarian', 'R', 1, 'depan', 'cari', 't', 1);
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
INSERT INTO `t_prestasi` VALUES (2, 'Juara 1 Lomba Cerdas Cermat AIDS Tingkat Kota Bandung', 'Juara 1 Lomba Cerdas Cermat AIDS Tingkat Kota Bandung dalam Acara AIDS Sedunia');

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

INSERT INTO `t_profil` VALUES (9, 'PROFIL', '<table border="0" align="left">\r\n<tbody>\r\n<tr>\r\n<td><img style="float: left; margin: 3px 2px; border: 1px solid black;" src="../userfiles/ava1.jpg" alt="" width="120" height="121" /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>Di era global dan pesatnya Teknologi Informasi ini, tidak dipungkiri bahwa keberadaan sebuah website untuk suatu organisasi. Sarana website ini dapat digunakan sebagai media penyebarluasan informasi-informasi dari sekolah, yang memang harus diketahui oleh stake holder secara luas. Disamping itu, website juga dapat menjadi sarana promosi sekolah yang cukup efektif. Berbagai kegiatan positip sekolah dapat diunggah, disertai gambar-gambar yang relevan, sehingga masyarakat dapat mengetahui prestasi-prestasi yang telah berhasil diraih.</p>\r\n<p>Sebagai media pembelajaran, website sekolah dapat memuat blog-blog yang dibuat oleh guru-guru. Di dalam blog tersebut guru dapat menuliskan berbagai artikel tentang pembelajaran atau materi penting pelajaran yang bersangkutan. Bahkan guru dapat memberikan tugas-tugas Mandiri kepada peserta didik melalui blog yang disiapkan, sehingga akan menunjang kegiatan pembelajaran berbasis Teknologi Informasi.</p>\r\n<p>Website juga dapat dijadikan sarana komunikasi antara sekolah dengan para alumni. Bahkan alumni dapat memanfaatkan website sekolah untuk konsolidasi, sehingga terbentuk ikatan alumni yang makin besar dan kuat. Sekolah menyadari bahwa alumni merupakan salah satu potensi yang apabila digali dan dikelola dengan baik dan benar akan mampu memberikan kontribusi yang sangat positif kepada sekolah.</p>', 0, 0, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (21, 'OSIS', '<p><style type="text/css"> P { margin: 0px; }Â </style></p>\r\n<div style="text-align: center;"><strong>OSIS SMA NEGERI 4 BANDUNG</strong></div>\r\n<div style="text-align: center;">&nbsp;</div>\r\n<div style="text-align: justify;">OSIS (kepanjangannya adalah Organisasi Siswa Intra Sekolah) adalah suatu organisasi yang berada di tingkat sekolah di Indonesia yang dimulai dari Sekolah Menengah yaitu Sekolah Menengah Pertama((SMP)) dan Sekolah Menengah Atas((SMA)). OSIS diurus dan dikelola oleh murid-murid yang terpilih untuk menjadi pengurus OSIS. Biasanya organisasi ini memiliki seorang pembimbing seorang guru yang dipilih oleh pihak sekolah.<br />\r\n<br />\r\nAnggota OSIS adalah seluruh siswa yang berada pada satu sekolah tempat OSIS itu berada. Seluruh anggota OSIS berhak untuk memilih calonnya untuk kemudian menjadi pengurus OSIS.</div>\r\n<div style="text-align: center;">&nbsp;</div>\r\n<div style="text-align: center;"><strong>STRUKTUR KEPENGURUSAN OSIS SMA NEGERI 4 BANDUNG MASA BHAKTI 08-09</strong></div>\r\n<p>&nbsp;</p>\r\n<p>Ketua OSIS : Gia Haryza&nbsp;</p>\r\n<p>Wakil Ketua OSIS 1 : M. Isyraqi El-hakim&nbsp;</p>\r\n<p>Wakil Ketua OSIS 2 : Yunan Ahmad Taufik</p>\r\n<p>&nbsp;</p>\r\n<p>Sekretaris Umum : Hanifah&nbsp;</p>\r\n<p>Sekretaris 1 : Ridho Agung Nugraha&nbsp;</p>\r\n<p>Sekretaris 2 : Afriani Naidza Nurdianti</p>\r\n<p>&nbsp;</p>\r\n<p>Bendahara Umum : Ginar Amalia Hidayati</p>\r\n<p>Bendahara 1 : Ria Maria Nurhayati</p>\r\n<p>Bendahara 2 : Nada Fathia Mutiara</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Sie. Ketaqwaan Terhadap Tuhan YME</strong></p>\r\n<p>Ketua : Galih Ahmad Abdullah</p>\r\n<p>Wakil : Syauqi Nur Alifan Zaelani</p>\r\n<p>Anggota : Nilam Mustikaning Nagari - Faizah Aulia Rahmah</p>\r\n<p>&nbsp;&nbsp;</p>\r\n<p><strong>Sie. Wawasan Keilmuan</strong></p>\r\n<p>Ketua : Aulia Arip Rakhman</p>\r\n<p>Wakil : Mohammad Gilang Santika</p>\r\n<p>Anggota : Arie Permana Putra- Rivan Ardyanto Sutoyo - Nursyifa Kamilia</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Sie. Wawasan Kebangsaan</strong></p>\r\n<p>Ketua : Egie Sofyan Nuddin</p>\r\n<p>Wakil : Rashidah Noor Amalia</p>\r\n<p>Anggota : Meliana Lestari - Fransiska Paulina Kaha</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Sie. Kepribadian Budi Pekerti Luhur dan Kehidupan Berbangsa</strong></p>\r\n<p>Ketua : Muhamad Lukman Rusyana</p>\r\n<p>Wakil : Denantia Puriandini Winaya</p>\r\n<p>Anggota : Ambar Ratih Sahra -&nbsp; Maulana Rizky Putra</p>\r\n<p><strong><br />\r\n</strong></p>\r\n<p><strong>Sie. Keterampilan dan Kewirausahaan</strong></p>\r\n<p>Ketua : Iqbal Ramadhan Zahid</p>\r\n<p>Wakil : Larasitha Nunis</p>\r\n<p>Anggota : Sofie Tsaurah Islami&nbsp;&nbsp; - Fitrias Rahayu Ramdhani</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Sie. Organisasi, Kepemimpinan, dan Demokrasi</strong></p>\r\n<p>Ketua : Freysha Intan Yulitasari</p>\r\n<p>Wakil : Nugraha Yanureza R.</p>\r\n<p>Anggota : Radithya Aldi Pradhana - Citra Riansyah</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Sie. Apresiasi , Budaya , dan Daya Kreasi</strong></p>\r\n<p>Ketua : Aditya Purna Nugraha</p>\r\n<p>Wakil : Syahdini Handiani</p>\r\n<p>Anggota : Ratifika Dewi Irianto - Reynald Aditya Utomo</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Sie. Kesehatan Jasmani</strong></p>\r\n<p>Ketua : Elmus Rahma</p>\r\n<p>Wakil : Wiriadiningrat</p>\r\n<p>Anggota : Tiara Pasca Noviera Robaeni - Lutfi Ahmad&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Lebih lanjut:<br />\r\n<a href="http://profiles.friendster.com/osis4bdg" style="font-weight: normal;">http://profiles.friendster.com/osis4bdg</a></p>', 4, 4, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (11, 'Visi dan Misi', '<p style="text-align: center;"><strong>VISI SMP CINTA INDONESIA<br /></strong></p>\r\n<p style="text-align: center;">&rdquo;<strong> Menjadi sekolah terunggul dalam prestasi akademis, non akademis, religi dan budaya &rdquo;</strong></p>\r\n<p style="text-align: center;"><strong><br /></strong></p>\r\n<p>Indikator visinya adalah :</p>\r\n<p>1. Unggul dalam prestasi akademis, dengan rata-rata UN diatas 8,5.</p>\r\n<p>2. Unggul dalam prestasi non akademis, menjadi juara dalam lomba-lomba tingkat kota dan provinsi.</p>\r\n<p>3. Unggul dalam prestasi budaya dan seni.</p>\r\n<p>4. Unggul dalam prestasi religi.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p style="text-align: center;"><strong>MISI SMP CINTA INDONESIA</strong></p>\r\n<p>Untuk mencapai visi tersebut perlu adanya tindakan strategis sebagai berikut :</p>\r\n<p>1. Melaksanakan pembelajaran yang inovatif dan menyenangkan.</p>\r\n<p>2. Memfasilitasi siswa dalam mengembangkan potensi dari bidang Seni, Olahraga sesuai dengan minat dan bakat</p>\r\n<p>3. Mengembangkan dan mencintai budaya Sunda sehingga dapat mengimplementasikannya dalam kehidupan sehari-hari.</p>\r\n<p>4. Membentuk pribadi yang berakhlaqulkarimah</p>\r\n<p>5. Membuka jaringan kerja sama dengan klub Olahraga dan sanggar seni</p>\r\n<p>6. Menyediakan fasilitas layanan jaringan informasi bagi orang tua dan siswa</p>', 1, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (50, 'test 1', '<p>sdf s</p>', 1, 49, '', 0, '_self');
INSERT INTO `t_profil` VALUES (12, 'Sejarah Singkat', '<p style="text-align: justify;">SMP Cinta Indoonesia berlokasi di Jalan Cerdas No.1 Hebat didirikan pada tahun 2002 sebagai Model Website sekolah</p>\r\n<p style="text-align: justify;">Mula-mula dibangun empat lokasi untu ruang kelas dan sebuah ruangan untuk kantor. Pada tahun 2003 menempati wilayah strategis di pusat kota Bandung. dan setiap tahunnya SMP Cinta Indonesia berusaha meningkatkan kualitas dan meningkatkan pelayanan kepada para siswanya</p>\r\n<p>Beikut ini adalah Bapak-bapak yang berjasa dan beramal sholeh untuk memimpin SMP Web Sekolah Indonesia.</p>\r\n<ol>\r\n<li>Bapak HAPID,&nbsp;&nbsp;Tahun 1955, .</li>\r\n<li>Bapak SUKARDJA DJALAKSANA,&nbsp;&nbsp;Tahun 1969.</li>\r\n<li>Bapak R. GUNAWAN, &nbsp;Tahun 1968,</li>\r\n<li>Bapak GAOS SUSASTRA dan Bapak KURNADI,&nbsp;</li>\r\n<li>Bapak DIDI DARMAWAN, BA.&nbsp;&nbsp;Tahun 1970,</li>\r\n<li>Bapak DANA SETIA, &nbsp;Tahun 1975,</li>\r\n<li>Bapak SOEWIGYA dan Bapak AKIS SUSILA,</li>\r\n<li>Bapak APANDI PRAWIRASUPENA,</li>\r\n<li>Bapak Drs. SACHLI, MS, &nbsp;Tahun 1983 - 1986,</li>\r\n<li>Bapak H. UKAR SUWARNADIRIA, &nbsp;Tahun 1986 - 1989,</li>\r\n<li>Bapak H. ANWAR Ch.B.Ch, BA. &nbsp;Tahun 1989 - 1994,</li>\r\n<li>Bapak Drs EMED MASGUN, &nbsp;Tahun 1994 - 1998,</li>\r\n<li>Bapak Drs. SUBARKAH HARTONO, &nbsp;Tahun 1998 - 2003,</li>\r\n<li>Bapak H. DEDI SOPANDI, &nbsp;Tahun 2003 - 2005,</li>\r\n<li>Bapak Drs. H. SYAMSUDIN, M.Pd . &nbsp;Tahun 2005 - 2006,</li>\r\n<li>Bapak Drs. H. DWI MARKONIANDI SUTISNA, M.Pd.&nbsp; Tahun 2006&nbsp; - sekarang</li>\r\n</ol>\r\n<p>&nbsp;</p>', 2, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (13, 'Program Kerja', '<p><strong>Program Unggulan<br /> </strong><br /> &nbsp;&nbsp; 1. Menjadi Sekolah Standar Nasional (SSN)<br /> &nbsp;&nbsp; 2. Mengembangkan Sikap dan Kompetensi Keagamaan<br /> &nbsp;&nbsp; 3. Mengembangkan Potensi Siswa Berbasis Multiple Intelligance<br /> &nbsp;&nbsp; 4. Mengembangkan Budaya daerah<br /> &nbsp;&nbsp; 5. Mengembangkan Kemampuan bahasa dan Teknologi Informasi<br /> &nbsp;&nbsp; 6. Meningkatkan Daya serap Ke Perguruan Tinggi Favorit<br /> <br /> <strong>Program Pengembangan Sarana Prioritas</strong><br /> <br /> &nbsp;&nbsp; 1. Membangun 5 Ruang kelas Belajar dengan konstruksi bangunan 3 tingkat<br /> &nbsp;&nbsp; 2. Membangun 1 ruang Belajar di lantai 2 gedung lama<br /> &nbsp;&nbsp; 3. Membangun Ruang Penglah Data<br /> &nbsp;&nbsp; 4. Pembangunan Kantin Siswa<br /> &nbsp;&nbsp; 5. Perbaikan dan Pengecetan Lapangan Olah Raga<br /> &nbsp;&nbsp; 6. Pengembangan Jaringan Infrastruktur LAN (Intranet dan Internet)<br /> &nbsp;&nbsp; 7. Pengembangan Sistem Informasi Sekolah (SIS)<br /> &nbsp;&nbsp; 8. Melengkapi Sarana dan Prasarana Perpustakaan dan Lab Komputer<br /> &nbsp;&nbsp; 9. Renovasi Aula<br /> &nbsp; 10. Renovasi Tampilan Depan Skolah/Gerbang Sekolah<br /> &nbsp; 11. Renovasi Koridor</p>', 8, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (14, 'Kepala Sekolah', '<p style="text-align: justify;"><img style="float: left;" src="../userfiles/User-icon.png" alt="" width="145" height="145" />Pendidikan adalah produk kreatifitas yang sangat luar biasa, aktifitas pendidikan pada hakikatnya adalah sebuah usaha untuk membangun sebuah peradaban yang memerlukan kerja keras dan kesabaran tingkat tinggi. Dari hasil proses pendidikan inilah diharapkan lahir generasi-generasi unggulan sebagai khalifah Allah</p>\r\n<p style="text-align: justify;">Sekolah harus dapat menyajikan proses pembelajaran yang menyenangkan dan sesuai dengan karakter siswanya. Paradigma mengajar dan belajar antara guru dengan siswa harus disamakan supaya proses pembelajaran menjadi lebih bermakna dan menyenangkan. Dalam memahami suatu konsep materi siswa diusahakan dapat mempelajarinya dari akar dan sumbernya, kemudian siswa mengembangkan pemahaman tersebut sesuai dengan imajinasi dan daya nalarnya. Siswa dilatih untuk bersikap kritis, analitis dan berpikir sistematis sehingga setiap gagasan yang dikemukakannya berdasarkan pada dalil dan konsep ilmu yang benar</p>\r\n<p style="text-align: justify;">Sebagaimana kita ketahui bersama, pendidikan tidak hanya merupakan tugas sekolah, tetapi juga merupakan usaha bersama yang berkesinambungan dan terpadu antara siswa, orang tua siswa, dan guru. Oleh sebab itu, kerja sama yang sudah terjalin dengan baik selama ini harus dipertahankan dan terus ditingkatkan.</p>\r\n<p style="text-align: justify;">&nbsp;</p>', 6, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (15, 'Struktur Organisasi', '<p align="center"><img src="../userfiles/image/Snap9.jpg" alt="" /></p>', 5, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (16, 'Prestasi', '<table class="tabel" border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td bgcolor="#e38600" width="37">\r\n<p align="center"><strong>No</strong></p>\r\n</td>\r\n<td bgcolor="#e38600" width="204">\r\n<p align="center"><strong>Nama</strong></p>\r\n</td>\r\n<td bgcolor="#e38600" width="130">\r\n<p align="center"><strong>Jenis Lomba</strong></p>\r\n</td>\r\n<td bgcolor="#e38600" width="80">\r\n<p align="center"><strong>Juara</strong></p>\r\n</td>\r\n<td bgcolor="#e38600" width="108">\r\n<p align="center"><strong>Tingkat</strong></p>\r\n</td>\r\n<td bgcolor="#e38600" width="79">\r\n<p align="center"><strong>Tahun</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">1</td>\r\n<td valign="top" width="204">&nbsp;</td>\r\n<td valign="top" width="130">Sepak Takraw Porsenijar</td>\r\n<td valign="top" width="80">\r\n<p align="center">II</p>\r\n</td>\r\n<td valign="top" width="108">Provinsi</td>\r\n<td valign="top" width="79">\r\n<p align="center">2000</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">2</td>\r\n<td valign="top" width="204">&nbsp;</td>\r\n<td valign="top" width="130">Lomba Karya Ilmiah Remaja</td>\r\n<td valign="top" width="80">\r\n<p align="center">I</p>\r\n</td>\r\n<td valign="top" width="108">Provinsi</td>\r\n<td valign="top" width="79">\r\n<p align="center">2004</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">3</td>\r\n<td valign="top" width="204">&nbsp;</td>\r\n<td valign="top" width="130">Lomba Wiyata Mandala</td>\r\n<td valign="top" width="80">\r\n<p align="center">I</p>\r\n</td>\r\n<td valign="top" width="108">Provinsi</td>\r\n<td valign="top" width="79">\r\n<p align="center">2005</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">4</td>\r\n<td valign="top" width="204">&nbsp;</td>\r\n<td valign="top" width="130">Wawasan Wiyata Mandala</td>\r\n<td valign="top" width="80">\r\n<p align="center">II</p>\r\n</td>\r\n<td valign="top" width="108">&nbsp;</td>\r\n<td valign="top" width="79">\r\n<p align="center">2005</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">5</td>\r\n<td valign="top" width="204">&nbsp;</td>\r\n<td valign="top" width="130">UKS</td>\r\n<td valign="top" width="80">\r\n<p align="center">I</p>\r\n</td>\r\n<td valign="top" width="108">Kabupaten</td>\r\n<td valign="top" width="79">\r\n<p align="center">2005</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">6</td>\r\n<td valign="top" width="204">Drs. I Nyoman Tingkat</td>\r\n<td valign="top" width="130">Guru Berprestasi</td>\r\n<td valign="top" width="80">\r\n<p align="center">II</p>\r\n</td>\r\n<td valign="top" width="108">Nasional</td>\r\n<td valign="top" width="79">\r\n<p align="center">2005</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">7</td>\r\n<td valign="top" width="204">&nbsp;</td>\r\n<td valign="top" width="130">Lomba Mengarang</td>\r\n<td valign="top" width="80">\r\n<p align="center">III</p>\r\n</td>\r\n<td valign="top" width="108">Nasional</td>\r\n<td valign="top" width="79">\r\n<p align="center">2006</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">8</td>\r\n<td valign="top" width="204">&nbsp;</td>\r\n<td valign="top" width="130">Juara Debat Bahasa Inggris</td>\r\n<td valign="top" width="80">\r\n<p align="center">III</p>\r\n</td>\r\n<td valign="top" width="108">Kabupaten</td>\r\n<td valign="top" width="79">\r\n<p align="center">2006</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">9</td>\r\n<td valign="top" width="204">&nbsp;</td>\r\n<td valign="top" width="130">Lomba Karya Ilmiah Remaja</td>\r\n<td valign="top" width="80">\r\n<p align="center">I</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Kabupaten</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2006</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">10</td>\r\n<td valign="top" width="204">&nbsp;</td>\r\n<td valign="top" width="130">Lomba Karya Ilmiah Remaja (MIC)</td>\r\n<td valign="top" width="80">\r\n<p align="center">I dan III</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Provinsi</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2006</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">11</td>\r\n<td valign="top" width="204">&nbsp;</td>\r\n<td valign="top" width="130">Lomba Kording</td>\r\n<td valign="top" width="80">\r\n<p align="center">I</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Kabupaten</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2006</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">12</td>\r\n<td valign="top" width="204">&nbsp;</td>\r\n<td valign="top" width="130">Lomba Kording</td>\r\n<td valign="top" width="80">\r\n<p align="center">III</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Provinsi</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2006</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">13</td>\r\n<td valign="top" width="204">Wida Sari Dewi</td>\r\n<td valign="top" width="130">Peserta Paskibraka</td>\r\n<td valign="top" width="80">&nbsp;</td>\r\n<td valign="top" width="108">&nbsp;</td>\r\n<td valign="top" width="79">\r\n<p align="center">2006</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">14</td>\r\n<td valign="top" width="204">&nbsp;</td>\r\n<td valign="top" width="130">Lomba Olympiade Fisika</td>\r\n<td valign="top" width="80">\r\n<p align="center">III</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Provinsi</p>\r\n</td>\r\n<td valign="top" width="79">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">15</td>\r\n<td valign="top" width="204">&nbsp;</td>\r\n<td valign="top" width="130">Lomba Olympiade Fisika</td>\r\n<td valign="top" width="80">\r\n<p align="center">II dan IV</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Kabupaten</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2006</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">16</td>\r\n<td valign="top" width="204">&nbsp;</td>\r\n<td valign="top" width="130">Lomba Olympiade Astronomi</td>\r\n<td valign="top" width="80">\r\n<p align="center">V</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Kabupaten</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2006</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">17</td>\r\n<td valign="top" width="204">A.A Mia Intentilia</td>\r\n<td valign="top" width="130">English Speech C.</td>\r\n<td valign="top" width="80">\r\n<p align="center">I</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Provinsi</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2010</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">&nbsp;</td>\r\n<td valign="top" width="204">&nbsp;</td>\r\n<td valign="top" width="130">Olimpiade Agama Hindu</td>\r\n<td valign="top" width="80">\r\n<p align="center">I</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Provinsi</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2010</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">&nbsp;</td>\r\n<td valign="top" width="204">&nbsp;</td>\r\n<td valign="top" width="130">Pidato Bahasa Bali</td>\r\n<td valign="top" width="80">\r\n<p align="center">III</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Provinsi</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2011</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">&nbsp;</td>\r\n<td valign="top" width="204">&nbsp;</td>\r\n<td valign="top" width="130">Olimpiade Humaniora III (Debat)</td>\r\n<td valign="top" width="80">\r\n<p align="center">I</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Provinsi</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2011</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">18</td>\r\n<td valign="top" width="204">Tem Debat SMA N 1 Kutsel</td>\r\n<td valign="top" width="130">DebatWoril AIDS (Indonesia)</td>\r\n<td valign="top" width="80">\r\n<p align="center">III</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Provinsi</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2010</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">19</td>\r\n<td valign="top" width="204">Seira Tamara Herlambang</td>\r\n<td valign="top" width="130">Debat Bahasa Indonesia</td>\r\n<td valign="top" width="80">\r\n<p align="center">I</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Provinsi</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2011</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">20</td>\r\n<td valign="top" width="204">Luh Putu Yeyen Karista Putri</td>\r\n<td valign="top" width="130">Putri Ajeg Bali</td>\r\n<td valign="top" width="80">\r\n<p align="center">I</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Kabupaten</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2010</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">21</td>\r\n<td valign="top" width="204">Ni Made Ticheyani</td>\r\n<td valign="top" width="130">Olimpiade Fisika</td>\r\n<td valign="top" width="80">\r\n<p align="center">I</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Kabupaten</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2011</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">22</td>\r\n<td valign="top" width="204">Ni Kadek Risa Astria</td>\r\n<td valign="top" width="130">Olimpiade Fisika</td>\r\n<td valign="top" width="80">\r\n<p align="center">II</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Kabupaten</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2011</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">23</td>\r\n<td valign="top" width="204">Ida Ayu Kd Suci Amaniari</td>\r\n<td valign="top" width="130">Olimpiade Fisika</td>\r\n<td valign="top" width="80">\r\n<p align="center">III</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Kabupaten</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2011</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">24</td>\r\n<td valign="top" width="204">Parangkan Nurtanto Q.</td>\r\n<td valign="top" width="130">Olimpiade Komputer</td>\r\n<td valign="top" width="80">\r\n<p align="center">II</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Kabupaten</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2011</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">25</td>\r\n<td valign="top" width="204">Ni Made Sutraeni</td>\r\n<td valign="top" width="130">Olimpiade Komputer</td>\r\n<td valign="top" width="80">\r\n<p align="center">I</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Kabupaten</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2011</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">26</td>\r\n<td valign="top" width="204">Ni Nengah Ayu Petra S.</td>\r\n<td valign="top" width="130">Olimpiade Biologi</td>\r\n<td valign="top" width="80">\r\n<p align="center">II</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Kabupaten</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2011</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">27</td>\r\n<td valign="top" width="204">I Wayan Widyarta Suryawan</td>\r\n<td valign="top" width="130">Mengarang</td>\r\n<td valign="top" width="80">\r\n<p align="center">I</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Kabupaten</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2011</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">28</td>\r\n<td valign="top" width="204">I Putu Alit Sudrastawa</td>\r\n<td valign="top" width="130">Mengarang Bebas</td>\r\n<td valign="top" width="80">\r\n<p align="center">II</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Kabupaten</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2011</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">29</td>\r\n<td valign="top" width="204">I Gede Gunadi Wirawan</td>\r\n<td valign="top" width="130">Mengarang Bebas</td>\r\n<td valign="top" width="80">\r\n<p align="center">III</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Kabupaten</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2011</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">30</td>\r\n<td valign="top" width="204">Team Sepak Takraw Putri</td>\r\n<td valign="top" width="130">Sepak Takraw</td>\r\n<td valign="top" width="80">\r\n<p align="center">III</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Kabupaten</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2011</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">31</td>\r\n<td valign="top" width="204">Team Sepak Takraw Putra</td>\r\n<td valign="top" width="130">Sepak Takraw</td>\r\n<td valign="top" width="80">\r\n<p align="center">III</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Kabupaten</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2011</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="38">32</td>\r\n<td valign="top" width="204">Team Marching Band Suara Mahardika</td>\r\n<td valign="top" width="130">Marching Band</td>\r\n<td valign="top" width="80">\r\n<p align="center">III</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">Kabupaten</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">2011</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top" width="37">32</td>\r\n<td valign="top" width="204">&nbsp;</td>\r\n<td valign="top" width="130">&nbsp;</td>\r\n<td valign="top" width="80">\r\n<p align="center">&nbsp;</p>\r\n</td>\r\n<td valign="top" width="108">\r\n<p align="center">&nbsp;</p>\r\n</td>\r\n<td valign="top" width="79">\r\n<p align="center">&nbsp;</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>', 11, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (18, 'Kemitraan', '<ol>\r\n<li>Teacher Clearing House merupakan kerjasama antar guru mata pelajaran untuk peningkatan kualitas guru dan pembelajaran. Dilaksanakan melalui media komunikasi telepon dan internet.</li>\r\n<li>Clearing House dengan The Manor CE Primary School South Gloucestershire, UK. Satu kerjasama yang diprakarsai oleh Depdiknas dan British Council untuk peningkatan kualitas pendidikan.</li>\r\n<li>Cosmopoint University Malaysia (dalam proses)</li>\r\n</ol>', 7, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (19, 'Kondisi Siswa', '<table border="1" cellspacing="1" cellpadding="1">\r\n<tbody>\r\n<tr>\r\n<td style="text-align: center;"><strong>No<br /> </strong></td>\r\n<td style="text-align: center;"><strong>Kelas<br /> </strong></td>\r\n<td style="text-align: center;"><strong>L</strong></td>\r\n<td style="text-align: center;"><strong>P</strong></td>\r\n<td style="text-align: center;"><strong>Juml</strong></td>\r\n</tr>\r\n<tr>\r\n<td>1<br /><br />2<br /><br />3</td>\r\n<td>Kelas VII<br /> &nbsp; <br /> Kelas VIII<br /> <br /> Kelas IX</td>\r\n<td>146<br /> <br /> 124<br /> <br /> 150</td>\r\n<td>172<br /> <br /> 162<br /> <br /> 175</td>\r\n<td>318<br /> <br /> 286<br /> <br /> 325</td>\r\n</tr>\r\n<tr>\r\n<td colspan="2"><strong>Total</strong></td>\r\n<td><strong>420</strong></td>\r\n<td><strong>409<br /></strong></td>\r\n<td><strong>829</strong></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>', 9, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (22, 'Komite Sekolah', '<p style="text-align: justify;"><img style="float: left;" src="../userfiles/committee-icon.jpg" alt="" width="170" height="113" />Pembentukan komite sekolah ditujukan untuk mewadahi, meyalurkan aspirasi dan prakarsa masyarakat dalam melahirkan kebijakan operasional dan program pendidikan di satuan pendidikan, meningkatkan tanggung jawab dan peran serta aktif dari seluruh lapisan masyarakat dalam penyelenggaraan pendidikan, serta menciptakan suasana dan kondisi transparan, akuntabel, dan demokratis dalam penyelenggaraan serta pelayanan pendidikan yang berkualitas di satuan pendidikan. Kenyataan yang sering dan umum terjadi di lapangan adalah komite sekolah yang terbentuk menemui berbagai kendala dan permasalahan antara lain kehadiran komite sekolah seolah dianggap formalitas semata, dianggap memiliki peran sebagaimana BP3 di masa lampau, tidak/belum mampu menjalankan fungsinya dengan baik. Kondisi ini muncul sebagai dampak dari kelemahan internal dari komite sekolah itu sendiri, dan dari faktor ekternal masyarakat belum mengetahui peran dan fungsi komite sekolah secara baik.</p>', 10, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (23, 'Prestasi Guru', '<ol>\r\n    <li>Inovasi Pembelajaran 2001 IV V Depdiknas</li>\r\n    <li>Keratifitas mengajar 2002 II V LIPI</li>\r\n    <li>Lomba Keberhasilan Guru dalam pembelajaran 2002 IV V Depdiknas</li>\r\n    <li>Lomba Keberhasilan Guru dalam pembelajaran 2003 Harapan III V Depdiknas</li>\r\n    <li>Sutarto Wasit Terbaik 2004 3 V KONI DKI</li>\r\n    <li>Sugeng S. Lomba Keberhasilan Guru dalam pembelajaran 2003 Finalis V Depdiknas</li>\r\n    <li>Sugeng S. Guru Berprestasi SMP / MTs 2004 III V Dinas P &amp; K Prop. Jawa Barat</li>\r\n    <li>Sugeng S. Guru Teladan 2004 I V Dinas P &amp; K Kabupaten Sukabumi</li>\r\n    <li>Bahar S. Lomba Keberhasilan Guru dalam pembelajaran 2005 Finalis V JSIT</li>\r\n    <li>Bahar S. Lomba Inovasi pembelajaran SMP 2006 III Balitbang Non Depdiknas</li>\r\n    <li>Bahar S. Guru Berprestasi SMP 2007 V Dinas P &amp; K Kabupaten</li>\r\n    <li>Bahar S. Lomba Keberhasilan Guru dalam pembelajaran 2007 Finalis V Depdiknas</li>\r\n    <li>Bahar S. Konferensi Guru Indonesia 2006 Pemakalah Terpilih V Sampurna Foundation Provisi Education</li>\r\n    <li>Bahar S. juara III,Lomba Guru Kreatif III se Jawa 2008,diselenggarakan di Semarang</li>\r\n</ol>', 5, 3, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (24, 'Beasiswa', '<p><span class="gen"><font class="storytitle"><b><span>1. [Belgium] Kuliah <span name="IL_SPAN"><input type="hidden" name="IL_MARKER" />Master</span> di Belgia Cuma 1 Juta</span></b></font></span></p>\r\n<p><font class="storycontent">Beberapa universitas di Belgia seperti Universiteit Ghent dan Universiteit Hasselt telah menerapkan peraturan baru untuk biaya kuliah Program Master. Bagi student yang berasal dari negara-negara berkembang termasuk Indonesia, hanya diwajibkan untuk membayar uang kuliah sebesar 80 Euro pertahun untuk program Master.<br />\r\nUntuk informasi biaya kuliah 80 euro di Universitet Ghent dapat dilihat di halaman website:<br />\r\n<a href="http://www.ugent.be/en/teaching/studentadmin/tuition/overview.htm">http://www.ugent.be/en/teaching/studentadmin/tuition/overview.htm</a><br />\r\nAtau check satu per satu tuition fee utk master course di Ghent:<br />\r\n<a href="http://www.opleidingen.ugent.be/studiekiezer/nl/int/index.htm">http://www.opleidingen.ugent.be/studiekiezer/nl/int/index.htm</a><br />\r\nUtk melihat universitas yang lain di Belgia bisa search di:<br />\r\n<a href="http://www.univ.cc">http://www.univ.cc</a> (pilih Belgium) </font></p>\r\n<p><span style="font-weight: bold;">2. </span><span class="gen"><font class="storytitle"><b><font class="storytitle">Program Beasiswa TNI Calon Perwira Prajurit Karier Untuk Mahasiswa S1</font></b></font></span></p>\r\n<p><font class="storycontent">Masih kuliah dan punya cita-cita jadi perwira TNI? Mau dapat beasiswa dan tunjangan selama menyelesaikan kuliah? Sekarang saatnya. Ayo daftar! <br />\r\n<br />\r\nTentara Nasional Indonesia memberi kesempatan kepada Mahasiswa berprestasi untuk menjadi Perwira TNI melalui Program Mahasiswa Beasiswa TNI Calon Perwira Prajurit Karier (Pa PK). <br />\r\n<br />\r\nKepada mahasiswa yang berminat, dapat mendaftarkan diri dengan syarat-syarat meliputi Warga Negara Indonesia Pria/Wanita (bukan Prajurit TNI, anggota POLRI dan PNS). Calon juga harus bertaqwa kepada Tuhan Yang Maha Esa, Setia dan taat kepada Pancasila dan UUD 1945.<br />\r\n<br />\r\nUntuk Kedokteran Umum minimal sudah Sarjana Kedokteran, sedangkan S1 lainnya minimal mencapai 110 SKS dan D3 minimal mencapai 80 SKS. <br />\r\nIPK minimal 2,40 untuk S 1 (Kedokteran Umum), S1 lainnya 2,80 dan D3 2,70. Usia maksimal pada saat menerima tunjangan beasiswa untuk Kedokteran Umum 27 tahun, sedangkan S1 lainnya 25 tahun dan D3 23 tahun. <br />\r\nCalon juga harus berkelakuan baik, sehat jasmani, rohani dan bebas narkoba. Tinggi badan minimal 163 cm bagi pria dan 155 cm bagi wanita. Sanggup tidak menikah selama mengikuti Program Mahasiswa Beasiswa. <br />\r\nTunjangan yang diberikan Rp 750.000 per bulan dan bantuan skripsi Rp 1.000.000. Waktu mendapat tunjangan untuk Dokter Umum 4 tahun, S1 lainnya 3 tahun dan D3 2 tahun. <br />\r\nSetelah menyelesaikan program studi, wajib mengikuti Dikma Pa PK TNI. <br />\r\nPendaftaran dibuka pada bulan Desember 2008 bertempat di Ajendam/Ajenrem/Makodim/Lantamal/Lanal/Lanud setempat/terdekat. <br />\r\nPenjelasan lebih rinci dapat ditanyakan di tempat pendaftaran (Panitia Daerah di tiap Provinsi) atau website <a href="http://www.tni.mil.id">www.tni.mil.id</a>, email: sperstni@yahoo.com. <br />\r\nSelama proses pendaftaran tidak dipungut biaya. Gratis! </font></p>', 5, 4, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (25, 'Ektrakurikuler', '<p>Kualitas tamatan sekolah kejuruan dituntut untuk memenuhi standar kompetensi dunia kerja. Salah satunya, selain mampu menguasai materi pelajaran, siswa harus dapat berinteraksi dan aktif dalam hubungan sosial.</p>\r\n<p>Kegiatan ekstrakurikuler merupakan salah satu alat pengenalan siswa pada hubungan sosial. Di dalamnya terdapat pendidikan pengenalan diri dan pengembangan kemampuan selain pemahaman materi pelajaran.</p>\r\n<p>Berangkat dari pemikiran tersebut, di SMK Negeri 1 Ciamis diselenggarakan berbagai kegiatan ekstrakurikuler.</p>\r\n<p>Selain OSIS sebagai induk kegiatan ektrakurikuler di sekolah, kegiatan ektrakurikuler lainnya adalah:</p>\r\n<ul>\r\n    <li>Pramuka</li>\r\n    <li>Paskibra</li>\r\n    <li>Palang Merah Remaja (PMR)</li>\r\n    <li>Patroli Keamanan Sekolah (PKS)</li>\r\n    <li>Pecinta Alam (PA)</li>\r\n    <li>Olahraga (Bola Voli, Bola Basket, Karate, Tenis Meja, Tenis Lapangan)</li>\r\n    <li>Kerohanian / IRMA (Ikatan Remaja Mesjid Al-Forqon), dan</li>\r\n    <li>Koperasi Sekolah (Kopsis)</li>\r\n</ul>', 3, 4, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (20, 'Kalender Akademik', '<center>\r\n<p><img alt="" src="../userfiles/image/kalender1.jpg" /></p>\r\n<p><img alt="" src="../userfiles/image/kalender2.jpg" /></p>\r\n<p><img alt="" src="../userfiles/image/kalender3.jpg" /></p>\r\n<p><img alt="" src="../userfiles/image/kalender4.jpg" /></p>\r\n<p><img alt="" src="../userfiles/image/kalender5.jpg" /></p>\r\n<p><img alt="" src="../userfiles/image/kalender6.jpg" /></p>\r\n</center>', 6, 3, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (17, 'Sarana & Prasarana', '<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td><a href="../images/denah24.jpg" target="_blank"><img src="../images/denah24.jpg" alt="" width="540" height="400" /></a></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><br /><br /></p>\r\n<p><strong>Keterangan </strong></p>\r\n<table style="width: 100%;" border="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top" width="120">1. Kls XII IPA 1<br /> 2. Kls XII IPA 2<br /> 3. Kls XII IPA 3<br /> 4. Kls XII IPA 4<br /> 5. Kls XII IPA 5<br /> 6. Kls XII IPS 3<br /> 7. Kls XII IPS 2<br /> 8. Kls XII IPS 1<br /> 9. Kls X-1/XI IPS 1<br /> 10. Kls X-2/XI IPS 2<br /> 11. Kls X-3/XI IPS 3<br /> 12. Kls X-4/XI IPA 1<br /> 13. Kls X-5/XI IPA 2<br /> 14. Kls X-6/XI IPA 3<br /> 15. Kls X-7/XI IPA 4</td>\r\n<td valign="top" width="120">16. Kls X-8/XI IPA 5<br /> 17. Perpustakan/ Warnet<br /> 18. Lab Komputer<br /> 19. Lab Biologi<br /> 20. Lab Bahasa<br /> 21. Lab Kimia<br /> 22. Lab Multimedia<br /> 23. Lab IPS<br /> 24. R. Kepsek<br /> 25. R. Tata Usaha<br /> 26. R. Lobi<br /> 27. R. Guru<br /> 28. R. OSIS<br /> 29. R. PMR<br /> 30. R. BK/BP</td>\r\n<td>31. R. Piket<br /> 32. R.Pramuka/Paskibra<br /> 33. R.Kapela/Bianglala<br /> 34. Gudang<br /> 35. Masjid<br /> 36. R. DKM<br /> 37. R. Satpam<br /> 38. R. UKS<br /> 39. Padepokan Seni<br /> 40. GreenHouse<br /> 41. Parkir<br /> 42. Mushala Guru<br /> 43. WC Guru<br /> 44. R. Cetak<br /> 45. R. Wakasek<br /> 46. Dapur</td>\r\n<td>47. WC Guru<br /> 48. WC Laki-laki<br /> 49. WC Perempuan<br /> 50. Koperasi<br /> 51. Kantin<br /> 52. WC Perempuan<br /> 53. WC Laki-laki<br /> 54. G. Olahraga<br /> 55. Gudang Biologi<br /> 56. Gudang Fiska<br /> 57. Gudang Kimia<br /> 58. R. EC<br /> 59. Panggung Terbuka<br /> 60. Lap. Olahraga<br /> 61. R. Server <br /> 62. R. KPMP TIK</td>\r\n</tr>\r\n</tbody>\r\n</table>', 3, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (10, 'Lokasi Sekolah', '<center><a href="../images/peta1.jpg" target="_blank"><img src="../images/peta1.jpg" width="400" height="320" id=gambar ></a></center>\r\n<br>', 0, 0, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (26, 'Peta Situs', '<p><strong>Peta Situs Utama</strong></p>\r\n<p><strong>Profil</strong></p>\r\n<ol>\r\n    <li><a href=profil.php?id=profil&kode=4>Sejarah Singkat</a></li>\r\n    <li><a href=profil.php?id=profil&kode=3>Visi dan Misi</a></li>\r\n    <li><a href=profil.php?id=profil&kode=7>Struktur Organisasi</a></li>\r\n    <li><a href=profil.php?id=profil&kode=5>Program Kerja</a></li>\r\n    <li><a href=profil.php?id=profil&kode=11>Kemitraan</a></li>\r\n    <li><a href=profil.php?id=profil&kode=9>Sarana & Prasarana</a></li>\r\n    <li><a href=profil.php?id=profil&kode=12>Kondisi Siswa</a></li>\r\n    <li><a href=profil.php?id=profil&kode=6>Kepala Sekolah</a></li>\r\n    <li><a href=profil.php?id=profil&kode=8>Prestasi</a></li>\r\n    <li><a href=profil.php?id=profil&kode=21>Komite Sekolah</a></li>\r\n    <li><a href=profil.php?id=profil&kode=34>Kontak Sekolah</a></li>\r\n</ol>\r\n<p><strong><br />\r\nGuru</strong></p>\r\n<ol>\r\n    <li><a href=guru.php?id=dbguru>Direktori Guru</a></li>\r\n    <li><a href=guru.php?id=silabus>Silabus</a></li>\r\n    <li><a href=guru.php?id=materi>Materi Ajar</a></li>\r\n    <li><a href=guru.php?id=soal>Materi Evaluasi</a></li>\r\n    <li><a href=guru.php?id=profil&kode=14>Kalender Akademik</a></li>\r\n    <li><a href=guru.php?id=profil&kode=23>Prestasi Guru</a></li>\r\n</ol>\r\n<p><strong><br />\r\nSiswa</strong></p>\r\n<ol>\r\n    <li><a href=siswa.php?id=dbsiswa>Direktori Siswa</a></li>\r\n    <li><a href=siswa.php?id=prestasi>Prestasi Siswa</a></li>\r\n    <li><a href=siswa.php?id=profil&kode=24>Beasiswa</a></li>\r\n    <li><a href=siswa.php?id=profil&kode=24>OSIS</a></li>\r\n    <li><a href=siswa.php?id=profil&kode=25>Ektrakurikuler</a></li>\r\n</ol>\r\n<p><br />\r\n<strong>Alumni</strong></p>\r\n<ol>\r\n    <li><a href=alumni.php?id=data>Direktori Alumni</a></li>\r\n    <li><a href=alumni.php?id=info>Info Alumni</a></li>\r\n</ol>\r\n<p><strong><br />\r\nFitur</strong></p>\r\n<ol>\r\n    <li><a href=index.php?id=agenda>Agenda</a></li>\r\n    <li><a href=index.php?id=artikel>Artikel</a></li>\r\n    <li><a href=index.php?id=info>Info</a></li>\r\n    <li><a href=index.php?id=berita>Berita</a></li>\r\n    <li><a href=index.php?id=buku>Buku Tamu</a></li>\r\n    <li><a href=index.php?id=project>Opini</a></li>\r\n    <li><a href=index.php?id=dafblog>Daftar Blog</a></li>\r\n    <li><a href=index.php?id=link>Link</a></li>\r\n    <li><a href=index.php?id=galeri>Galeri Photo</a></li>\r\n</ol>\r\n<p><strong>Peta Situs Komunitas Sekolah</strong> (Member)</p>\r\n<ol>\r\n    <li><a href=../user/index.php?id=myprofil>Profil Member</a></li>\r\n    <li><a href=../user/index.php?id=conlist>Data Kontak</a></li>\r\n    <li><a href=../user/index.php?id=member>Anggota</a></li>\r\n    <li><a href=../user/index.php?id=message>Pesan</a></li>\r\n    <li><a href=../user/index.php?id=cek_login#>Chat</a></li>\r\n    <li><a href=../user/index.php?id=myproject>Opini</a></li>\r\n    <li><a href=../user/index.php?id=forum>Diskusi</a></li>\r\n    <li><a href=../user/index.php?id=infoalumni>Info Alumni</a></li>\r\n    <li><a href=../user/guru.php?id=materi>Materi Ajar</a></li>\r\n</ol>', 10, 6, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (27, 'Kontak Sekolah', '<br><center><a href="../images/peta1.jpg" target="_blank"><img src="../images/peta1.jpg" width="300" height="200"></a><br>\r\n<p><strong>SD/SMP/SMA/SMK Indonesia</strong></p>\r\n<p>Alamat: Jl. Senayan, Sudirman, Jakarta, 12000, Indonesia</p>\r\n<p>Telepon: +62-021-6666666</p>\r\n<p>Fax: + 62-021-6666667</p>\r\n<p>Email: info@namasekolah.sch.id</p>\r\n<p>Web: www.namasekolah.sch.id</p>\r\n<p>Administrator: admin@namasekolah.sch.id</p>', 11, 6, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (1, 'Home', '-', 1, 0, 'index.php', 0, '_self');
INSERT INTO `t_profil` VALUES (2, 'Profil', '-', 2, 0, 'profil.php', 0, '_self');
INSERT INTO `t_profil` VALUES (3, 'Guru', '-', 3, 0, 'guru.php', 0, '_self');
INSERT INTO `t_profil` VALUES (4, 'Siswa', '-', 4, 0, 'siswa.php', 0, '_self');
INSERT INTO `t_profil` VALUES (5, 'Alumni', '-', 5, 0, 'alumni.php', 0, '_self');
INSERT INTO `t_profil` VALUES (7, 'Blog', '-', 7, 0, '../blog/', 0, '_blank');
INSERT INTO `t_profil` VALUES (8, 'Elearning', '-', 8, 0, '../elearning/', 0, '_blank');
INSERT INTO `t_profil` VALUES (6, 'Fitur', '-', 6, 0, 'index.php', 0, '_self');
INSERT INTO `t_profil` VALUES (28, 'Direktori Guru', '-', 1, 3, 'guru.php?id=dbguru', 0, '_self');
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

INSERT INTO `t_siswa` VALUES ('9107078', 'AFIFAH AROFANY     ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107161', 'AIMAN RIDHA ABULKHAIR', 'IX  B', '-', '0-//19', '-', 'Islam', 'L', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107247', 'ANNISA AYU SIWI ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107166', 'AZALIA PUTRI ALIF   ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107083', 'DEANNISA ANABELLA   ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107168', 'DEVI HASANAH ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107170', 'DINA MELLISYA  PUTRI     ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107039', 'EKA NURLITA DESTARI      ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('101108312', 'ENRICO TANGKAS GHABE', 'IX  B', '-', '0-//19', '-', 'Islam', 'L', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107255', 'FAISAL FADZILAH     ', 'IX  B', '-', '0-//19', '-', 'Islam', 'L', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107256', 'FARHAN REFFIANTO     ', 'IX  B', '-', '0-//19', '-', 'Islam', 'L', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107040', 'FERDI FIRMANSYAH      ', 'IX  B', '-', '0-//19', '-', 'Islam', 'L', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107173', 'FIRDA SAGITA  FERDIANA    ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107174', 'FIRMANSYAH   ', 'IX  B', '-', '0-//19', '-', 'Islam', 'L', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107043', 'HANA NURULLITA      ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107137', 'HANIFAH FAIRUZELIA    ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107138', 'HANNAN SUGIHARTO    ', 'IX  B', '-', '0-//19', '-', 'Islam', 'L', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107141', 'JOSUA PANJAITAN      ', 'IX  B', '-', '0-//19', '-', 'Islam', 'L', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107265', 'KAMILA ABRIANA     ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('101108297', 'LIQAHANNA AVIENA PUTRI', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107046', 'LOLA NADYA LARASATI ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107048', 'MUHAMAD ALI HUSEIN ', 'IX  B', '-', '0-//19', '-', 'Islam', 'L', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107181', 'MUHAMMAD PANDRY RAMADHAN   ', 'IX  B', '-', '0-//19', '-', 'Islam', 'L', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107269', 'MUHAMMAD TAUFIK HIDAYATULLAH  ', 'IX  B', '-', '0-//19', '-', 'Islam', 'L', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107185', 'MUHAMAD RAIS WIDI SANTOSA     ', 'IX  B', '-', '0-//19', '-', 'Islam', 'L', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107223', 'MUHAMAD REZA ', 'IX  B', '-', '0-//19', '-', 'Islam', 'L', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107186', 'MURSALATI URFA  ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107147', 'OPIT IHZANTINI       ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107232', 'REZA PUTRA FAJAR ', 'IX  B', '-', '0-//19', '-', 'Islam', 'L', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107151', 'RINIA PUJI AGUSTIANI ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('101108290', 'RIZA LAZUARDI MUTTAQIN', 'IX  B', '-', '0-//19', '-', 'Islam', 'L', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107279', 'RIZKIA ADELLA', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107154', 'SALMA ASTRIA ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107281', 'SELPI OKTAVIANI      ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107238', 'SILVA RAUDHOTUL  ALIA    ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107202', 'WHINDA ROFIKA AROFAH  ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107069', 'WIKI LESTARI ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107243', 'YUNI LESTARI ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('9107074', 'ZATIRA AVRIYANTI     ', 'IX  B', '-', '0-//19', '-', 'Islam', 'P', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.035', 'ADELIA NOVIANTI     ', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.120', 'ADNAFATNINGSIH RAHMAWATI     ', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.080', 'AHMAD CHANDRA MAULANA', 'IX  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.162', 'ALSA GUNADI  ', 'IX  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.08.288', 'ANDI FADHILA ARVIN', 'IX  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.246', 'ANDINA NUROKTA', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.248', 'ARMELITA AMANDA   ', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.130', 'DIAN RISDIYANTO       ', 'IX  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.210', 'DINDA LUPITA ', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.131', 'DITA AYU SEPTIANI   ', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.087', 'FAISHAL ARKHANUDDIN', 'IX  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.041', 'FIKRIYANI ISTIQOMAH', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.096', 'INDAH LINDA NURAINI', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.140', 'IZMYA FADHILA AMINI    ', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.220', 'MIA ANNISA FAWZIAH ', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.271', 'MOCHAMMAD ARIEF HIDAYAH ', 'IX  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('&#49&#49&#49&#50&#46&#57&', 'NADYA ARGA AMALIA', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.054', 'NITA SAPITRI ', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.104', 'NOVIA ALINDA  FADHILAH    ', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.227', 'NURUL ROSMAYANTI', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.275', 'R. ARJUNA SETHO NOERCAHYO', 'IX  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.148', 'RAKA MAHARDIKA       ', 'IX  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.149', 'REZA SULISTIYANTO      ', 'IX  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.233', 'RIA OKTAVIA  ', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.150', 'RIANA        ', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.278', 'RISTIANI LESTARI IRAWAN ', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.196', 'RIZKI SAEFUL FAHMI     ', 'IX  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.08.303', 'RIZKY RAKHMATULLAH', 'IX  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.08.307', 'RIZKY YOHANA PUTRI', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.236', 'SALMA MUNA FAUZIAH ', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.063', 'SATHYA YOGI', 'IX  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.282', 'SEPTI PRATIWI      ', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.111', 'SEPTIANI MELIANA   ', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.155', 'SESILIA NOVI ARYANTI', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.198', 'SUSILOWATI   ', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.08.295', 'TASSHA RAUDHATUL FITRI', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.200', 'TOMMI SINABUTAR      ', 'IX  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.157', 'TSANIYA MAULINA    ', 'IX  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.160', 'YUNUS ARIF FRAYOGA ', 'IX  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.001', 'ADITIA BENYAMIN', 'VII  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.002', 'AFINA FIRDAUS SYUAIB', 'VII  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.003', 'AGUNG NUGRAHA', 'VII  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.004', 'ALIYA NUR MEIDITA', 'VII  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.005', 'ANDHIKA MUHAMMAD AKBAR', 'VII  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.006', 'ANDIKA RIYANTO AMRI', 'VII  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.007', 'AUZAN AMANATULLAH AGNAR', 'VII  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.008', 'AZIS TIO NUGROHO', 'VII  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.009', 'BELINDA NADIRA RAHMADINA', 'VII  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.010', 'BENITA NADIRA RAHMADINA', 'VII  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.011', 'CIKAL BHUMIWICANA QALNAR', 'VII  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.012', 'DAVID JOSUA', 'VII  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.013', 'DIVA KALYANA H', 'VII  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.014', 'DRAJAT AKBAR DILAGA', 'VII  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.015', 'FAHMI WINDIA RAHAYU', 'VII  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.016', 'FAJRIANI RAMADHANIAH D', 'VII  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.017', 'FATHIYA MUFIDAH', 'VII  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.018', 'FELISYA ALAUDINA', 'VII  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.019', 'HAIFA AUDREY AZZAHRA', 'VII  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.020', 'HAIFA MAZIYYAH', 'VII  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.021', 'HARIADI EKA PRIATMOJO', 'VII  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.022', 'JESICA ESTERLITA SETYAWATI NUG', 'VII  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.023', 'KHANSA UFAIRA S', 'VII  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.024', 'MUHAMMAD RADDAN AGIMULAR', 'VII  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.025', 'MUHAMMAD REZKA RANDYTIA RAHARJ', 'VII  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.026', 'PAULUS TUPADO', 'VII  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.027', 'QINTARA NAFI', 'VII  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.028', 'RAFI MUHAMMAD HAFIDZ ATHUFA', 'VII  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.029', 'RAMADIUTA PRATAMA NUGRAHA', 'VII  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.030', 'REFI AMIRUL RASYIID', 'VII  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.031', 'SEPTIAN NUR PRATAMA PUTRA', 'VII  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.032', 'TASYA CYNTIA FITRIYANTI', 'VII  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.033', 'YASMIN AZZAHRA NOOR', 'VII  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.034', 'ZEFANYA ABBE ANDARA', 'VII  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.035', 'ZIAN NUR FAUZI', 'VII  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127036', 'ANA BELLA', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127037', 'ANGGIE BAKTI PERTIWI', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127038', 'ANJALY GITA ASMARA  SUTEDJA', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127039', 'ARNIDA KENIA RESWARI', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127040', 'ASEP KURNIAWAN', 'VII  B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127041', 'AVINA RAHMANI', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127042', 'CATRINE WANDASARI MALAU', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127043', 'DELA AYU', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127044', 'DESKI ADELIA', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127045', 'DIAR CAHYO WICAKSONO', 'VII  B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127046', 'DIKA DWI PRAMONO', 'VII  B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127047', 'DINI JIHANDIANI', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127048', 'DIVYA RIZKY KIRANA', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127049', 'ERIKE SALSA MARSHITA', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127050', 'FARID ABDUR RAZAQ', 'VII  B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127051', 'FATHYA HANA NURUL RAHIIM', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127052', 'FAUZIYYAH NUR H', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127053', 'GEA FITRI PURWANTI', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127054', 'IVAN AKBAR PRATAMA', 'VII  B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127055', 'JIHAN MIN TAUFIQ NUR FADHILAH', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127056', 'JUNI JUAN AIDIN JUNIOR', 'VII  B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127057', 'MUHAMAD EKA PRATAMA', 'VII  B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127058', 'MUHAMMAD  JIBRIL  HANDOYO', 'VII  B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127059', 'MUHAMMAD IQBAL HADAD', 'VII  B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127060', 'NADYA PUTERI VERANTY', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127061', 'NIDA NURAFIFAH YASMINE', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127062', 'NISA TAMIRA', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127063', 'NONI NURAMELIANI', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127064', 'PUTRI ALVIANTI', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127065', 'RESKA RAHMAWATI SUDIA', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127066', 'RESTI RIZKI AGUSTIYANI', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127067', 'REZKY MOHAMMAD RIZQULLAH', 'VII  B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127068', 'SANTI FITRIA', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127069', 'SEPTIANI', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127070', 'SHOLIHUDDIN TAUFIQ AULIA', 'VII  B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127071', 'SINDI MARYANI WIJAYA', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127072', 'STEFANUS JANUAR CHRISTIANTO', 'VII  B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127073', 'SUCI HARYANI THERIK', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127074', 'TASANA GHAISANI', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127075', 'TUBAGUS ADIMULYA', 'VII  B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127076', 'TYA ALMIRA', 'VII  B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127077', 'ZADINE ZIDANE', 'VII  B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.078', 'ABDILLAH FARIS', 'VII  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.079', 'ADELIA MUTIA FRIDAYANTI', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.080', 'ADITYA PRAWIRA', 'VII  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.081', 'ADRI ABDURRAHMAN GHANI', 'VII  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.082', 'AGAM RAMADHAN', 'VII  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.083', 'ALICIA AMANDA', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.084', 'ANDHIKA RACHMANSYAH HIDAYAT', 'VII  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.085', 'ANDY RINALDY', 'VII  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.086', 'ASSYIFA KANIA', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.087', 'CITRA NUR CAHYANTI', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.088', 'CUT AINI CAHYANINGTYAS', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.089', 'DEA CIKAL RAHAYU', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.090', 'DELLA FRISCA DAMAYANTI', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.091', 'ELANG FARIZKA WIRAKUSUMAH', 'VII  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.092', 'ERIKA ELVANY', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.093', 'FADHIL AGHNIA RAHMAN', 'VII  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.094', 'FAUZAN  RIZKY FIRDAUS', 'VII  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.095', 'FAYIZ AMANIYATU SYAHID', 'VII  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.096', 'FERHAN TUNGGAL DWI', 'VII  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.097', 'FITHRI LISA ARIYANTI', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.098', 'HASNA AFIFAH YUDANTIKA', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.099', 'JOHANSYAH TRIANDI', 'VII  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.100', 'KHAERANI ARUM KANTI', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.101', 'KHARELINA NURUL ANNISA', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.102', 'LITA DWI KUSUMAWATI WAHYONO PU', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.103', 'M. FIKRI EKA', 'VII  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.104', 'MICHELLE MERDEKA PUTRI FERDIAN', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.105', 'MOCHAMAD ALGIFARI IQBAL', 'VII  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.106', 'MOCHAMMAD FASYA ALFARIDZI', 'VII  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.107', 'MUTIARA ANISSA PUTRI VINOVA', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.108', 'NADIRA HASNA PUTRI GUNAWAN', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.109', 'PINAKESTI KINTAN', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.110', 'QISTHI ARYANI', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.111', 'RAHMA SYIFA SYAHIDA', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.112', 'RAHMAWAN ELDI', 'VII  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.113', 'REVI KRISTIONI', 'VII  C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.114', 'SHOFURO SHOLIHAH', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.115', 'SITI RAHMA AYUNDANISA', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.116', 'SONIA NUR FAUZIA', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.117', 'SRI NURSIDA', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.118', 'SYAFIRA DIRGA WINDIANI', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.119', 'SYIFA NUR AZIZAH ASSAHIDAH', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.120', 'SYLVIA TRESNAWATI', 'VII  C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.121', 'AFIFAH DWI WULANDARI', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.122', 'AGI ABDULLAH AL-GHIFARI', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.123', 'AISYAH SARTIKA DEWI KAMALUDIN', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.124', 'ALWAN ASSYAUQI', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.125', 'ASRI AINUN SYARIFAH', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.126', 'BILAL JANUAR KAWARU', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.127', 'DEWI FORTUNA SOLINA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.128', 'DWI LESTARI DAMAYANTI', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.129', 'FARAH TIFA AGHNIA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.130', 'FAUZI RAMADAN', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.131', 'FERRY MUHAMAD FIRMANSYAH', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.132', 'GALANG ADI KUNCORO', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.133', 'ISMI HAKIM', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.134', 'JEREMY JOSEPH JONATHAN RIESTAR', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.135', 'JUNIAR SISMONIEKA KOSWARARA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.136', 'LUTHFI RIZKI PAMUNGKAS', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.137', 'LUTHFIA AZZAHRA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.138', 'M.DHIKA', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.139', 'M.ALDI ARDIANSYAH', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.140', 'MUHAMMAD AINUR ROFIQ', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.141', 'MUHAMMAD FARHAN SETIAWAN', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.142', 'MUHAMMAD GHADANPHAR', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.143', 'NAMIRA AGUSTIN', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.144', 'NISA BELAGAMA BALIRAHAJENG', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.145', 'NOVILIANONI', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.146', 'PUTRI RIZKY AMALIA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.147', 'RAYHAN ILHAM SANIY', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.148', 'REFI SYABANI', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.149', 'REIVALIA NIRWANA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.150', 'RIBEL DANA KRISDIANTI', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.151', 'RITA NUR AMALIA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.152', 'RIZAL FATHUR RAHMAN', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.153', 'SALMA MEIGA PRATISTA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.154', 'SHAFIRA AULIA ZACHRA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.155', 'SHIFA AMELIA QINTHARA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.156', 'SRI WAHYUNI', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.157', 'SYAFIRA SALSABILA RAHAYU', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.158', 'SYAFIRA DWI ', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.159', 'TEGAR ALIF MUHARRAM', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.160', 'VERA RAHMA FADILLA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.161', 'YOSSY DEJANTI', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.162', 'YUSUF ROSARIO PASARIBU', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.163', 'ZAIDHIYA RIZQI RAIHANI', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.206', 'ADELLA RISTYANA', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.207', 'ADI SUBHAN PURWANDI', 'VII  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.208', 'ADIKA FAUZIE AKBAR IMRAN', 'VII  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.209', 'ADINDA SHAHRANI', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.210', 'AJI DEWANTONO', 'VII  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.211', 'ALDHEA PRISTA RAYNATIFA', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.212', 'ALMA ATHIRA', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.213', 'ANANDA EGA MAHARANI', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.214', 'ANNISA ALIFIA AKSANI', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.215', 'ARDHEO PHASSA GIOVEDI', 'VII  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.216', 'ASWIN SIDI FEBRIYANTI', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.217', 'CANDRA KARTIKA', 'VII  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.218', 'CHINTIA AISYAH ASTUTI', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.219', 'CHRISTINE PUJI LESTARI', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.220', 'DWI TYAS UTAMI', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.221', 'EVIRA MELINDA', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.222', 'FAJAR WAHYU SETIAWAN', 'VII  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.223', 'FEBBI AYU NURIANI VIRGIANTI', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.224', 'FIKRI M FIRMANSYAH', 'VII  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.225', 'GEMA ALIF DWI TAMA', 'VII  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.226', 'ILHAM HABIB DAVYANTO IRAWAN', 'VII  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.227', 'KENNY CHAIRUNNISA', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.228', 'LINTANG SAKTI SWASTYARDHI', 'VII  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.229', 'MELVI ROSANIA WAGIAR', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.230', 'MONICA MARSHELLA CALISTA PUTRI', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.231', 'MUBINA BORISTA', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.232', 'MUDY ATALIE MEDINA', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.233', 'MUHAMAD DAFA YUSYADI', 'VII  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.234', 'NADYA SHAFIRA', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.235', 'NY RD MAUDINA PUTRI   P', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.236', 'R. VICKY MARDITYA  W', 'VII  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.237', 'RADEN AJITIRA SALEH', 'VII  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.238', 'RIZKIA RAHMAN', 'VII  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.239', 'SAFRIZAL ARIQ AL AZIZ', 'VII  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.240', 'SALSABILA AZZAHRA', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.241', 'SARAH SAMIRA NADA', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.242', 'SITI NURUL MUDRIKA', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.243', 'TIWI YULIANTINI', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.244', 'VILDY ZULHIZ MARETHA DEWI', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.245', 'VIRLIZA MARAYA', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.246', 'WASI WASNIYAH', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.247', 'WULAN NOVITASARI', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.248', 'ZALVA HASNA AFIFAH', 'VII  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1112.7.249', 'AJENG HENDRANI', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.250', 'ALFIAN RIVALDI NUGRAHA', 'VII  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.251', 'ALIF YUDHISTIRA', 'VII  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.252', 'ALIFFA AZWADINA', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.253', 'AMELIA', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.254', 'AMIRAH HANGGORO AROEM', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.255', 'ANDINI NUGRAHATI', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.256', 'ANGGRAENI RAHMAWATI', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.257', 'ARIF RIZKY GILANG PURNAMA', 'VII  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.258', 'ARSITA MEIDA NURJANAH', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.259', 'CHANDRA ARTEDI', 'VII  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.260', 'DAFFA FAUZANANDAR', 'VII  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.261', 'DEWI HANDAYANI', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.262', 'DHELLA PRICILLA?ZILDJIAN', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.263', 'FARADILA AZAHRA NURHERYANI', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.264', 'HAIFA NUR FADHILAH', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.265', 'INTAN MAYASA', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.266', 'MAISYA AFIFA', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.267', 'MIRAJIYAH PURNAMA DEWI', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.268', 'MIRZA ADITYA DELIANTAMA', 'VII  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.269', 'MUHAMAD ZIDANUL IKHSAN', 'VII  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.270', 'MUHAMMAD ARFI TAFTANZANI', 'VII  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.271', 'MUHAMMAD ASKAR KAMIL', 'VII  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.272', 'NISRINA RAFIFA HANIF', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.273', 'PURNAMA  MUNTAHARRIDWAN', 'VII  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.274', 'RADEN AJENG CALIYA PI', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.275', 'RADEN GUSTILO REMON ATHALLAH', 'VII  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.276', 'RAYI HANA MELINDA', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.277', 'REFKIFADILLAH UTAMA', 'VII  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.278', 'RETNO AYU WULANDARI', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.279', 'RIFKY SAEPUL RACHMAN', 'VII  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.280', 'RISKA NUR WULANDANI', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.281', 'RISTIANI', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.282', 'SINTHIA SAFIRA AGUSTINE', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.283', 'SUCIATI INDAHSARI', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.284', 'SYAFIRA  SALSABILA  SETIAWAN', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.285', 'THALIA AGUSTINA', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.286', 'THALIA SALSABILA', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.287', 'TIARA DHEYADI', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.288', 'VIDA SARI PUSPITA', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.289', 'YUNIARTI AZIZAH', 'VII  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.290', 'ZULFAIKAR FACHREZA', 'VII  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.7.291', 'MUHAMMAD RIZALDY YUSUF', 'VII  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127378', 'ALDA MARLINA', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127379', 'ALIFFIA FITRIFAJRIYAH SAHRIDIY', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127380', 'ANANG MA RUF', 'VII  J', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127381', 'ANELKA LAZUARDI S', 'VII  J', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127382', 'ASTRI NUR RAHMAWATI', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127383', 'ATSMARA TSANIYA FAZA HERMATANI', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127384', 'AULIA DEVINA ANNISAFITRI', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127385', 'AULIA ULFIE RINDIANTIKA', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127386', 'BEBEN YOBANDRIYAN', 'VII  J', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127387', 'DENIA NOVIANTI', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127388', 'DESY LESGIA SUKMARA', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127389', 'DESY NURLATHIFAH', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127390', 'ERDITA AULIA SYAHARANI', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127391', 'ERIKA MAYA SARI', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127392', 'FAHMI SUBHAN MAHENDRA', 'VII  J', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127393', 'FAJAR REFALDY', 'VII  J', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127394', 'FHANNY SHALMAN', 'VII  J', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127395', 'FIRDA SEPTIANNY', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127396', 'GABRIEL VENDI MAHENDRA KUSUMA', 'VII  J', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127397', 'HENDI HARYADI', 'VII  J', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127398', 'IDA AYU SOMYA IP', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127399', 'IDRIS MURSYID KHAIRI', 'VII  J', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127400', 'INDAH MULYAWATI', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127401', 'IRVAN FAUZAN PRANADETHA', 'VII  J', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127402', 'ISMI RAMADHANI SUKMA', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127403', 'JESSICA KEZIA SHEKINAH', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127404', 'KARIZA RAI SHAFIRA', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127405', 'MIRDAD FADHIL MUHAMMAD', 'VII  J', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127406', 'MOHAMAD IMRAN', 'VII  J', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127407', 'MUHAMAD AQIL ATTAMI', 'VII  J', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127408', 'MUHAMMAD VIKRI ARDIYANSYAH', 'VII  J', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127409', 'MUHAMMAD YOGI EKASAPUTRA', 'VII  J', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127410', 'NADA FEBIA', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127411', 'NARENDRA NABIL MUMPUNI', 'VII  J', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127412', 'OMAR HAFIZ SHIRAZI', 'VII  J', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127413', 'ORYZA SAFIRA PUTERI', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127414', 'PEGGY TSANIYA SEPTIANI', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127415', 'PUTRI LESTARI IRIANI', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127416', 'SABIAN SALSABILA RACHMAT', 'VII  J', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127417', 'SANCHIA AZARIA SULAEMAN', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127418', 'SITI ARYATI', 'VII  J', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127419', 'TEGUH SISWANTO', 'VII  J', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127334', 'ADELA SAYUDI', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127335', 'AJENG SRI WAHYU UTAMI', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127336', 'AJI SATRIA PRATAMA', 'VII  I', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127337', 'ALDY DWI RAMADHAN', 'VII  I', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127338', 'ALFANNY PUTRI FADHLILAH', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127339', 'ANNISA DWI FEBRIANTY?', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127340', 'ANNISAA LUTHFIYYATUL LAILIYYAH', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127341', 'BELLA AMADHEA FEBRIANTY', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127342', 'CANTIKA GERALDINE', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127343', 'CINDY ANISA SUCIANTY', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127344', 'DAMADIKA ADHI PRATAMA SUSANTO', 'VII  I', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127345', 'DHEA RIZKY SUKMA', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127346', 'ENRICO AL FARIZKY BASUKI', 'VII  I', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127347', 'FAHMI NIZAR FARIZKY', 'VII  I', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127348', 'FAUZAN IKHSAN', 'VII  I', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127349', 'FINKA LAILI NUR .A', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127350', 'GHINA SALSABILA TUSSADIYAH', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127351', 'IRFAN NURALAMSYAH EDHYPUTRA', 'VII  I', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127352', 'KHALISHAH SALSABILA', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127353', 'LARASATI AYUNING SEKAR', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127354', 'LUTFI KEMAL AZIZ ZAKIYYANA', 'VII  I', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127355', 'M.FAUZI AL ARIF', 'VII  I', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127356', 'MEGAH AMALIAH', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127357', 'MUHAMMAD  ALTHOOF R H', 'VII  I', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127358', 'MUHAMMAD HAIDAR AL-BADAR', 'VII  I', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127359', 'MUHAMMAD JIHAD FISABILILLAH CA', 'VII  I', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127360', 'NANDA ILYASA', 'VII  I', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127361', 'NOVA INDRIANI', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127362', 'NUR ALMAS HURIYAH MAHIBAH HASA', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127363', 'PEBRIANTY WARDANI', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127364', 'R GHIFARI RAMADHANA AGUENI', 'VII  I', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127365', 'RAJNA HABIBAH ANGSOKA', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127366', 'RATU DIKA KARTIKA', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127367', 'RIFKY RAMADHAN', 'VII  I', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127368', 'RIFQI AHMAD FARHAN', 'VII  I', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127369', 'RIZKA  AMELIA PUTDAYANI', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127370', 'RR. DWI WASKITA NINGSIH', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127371', 'SABILA NURUL LATIFAH', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127372', 'SAFITRI PUJI LESTARI', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127373', 'SHEILA SALSABILA', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127374', 'SITI NURZIHAN NABILLA', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127375', 'STELLA DHIA ATHALIA', 'VII  I', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127376', 'SYAMS AKBAR HADITAMA', 'VII  I', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127377', 'ZULHAM DAFAA RUDIANTO', 'VII  I', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127292', 'ALIFIA BINTANG AZAHRA', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127293', 'ANDRI DWI PUTRA', 'VII  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127294', 'ARDITA PUTRI ANDINI', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127295', 'AYU SUSANTI', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127296', 'BRYAN WIRA TRIATMAJA', 'VII  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127297', 'CINTA LESTARI PUTRI', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127298', 'DEBI FEBIANTY', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127299', 'DIMAS MAULANA IRSAN', 'VII  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127300', 'GILANG JULIASTIANA FADLAH', 'VII  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127301', 'GINGGI NUGRAH RAMADHAN', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127302', 'HILYATUL JANNAH', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127303', 'HUSNA NURFITRA MUSTAHAB', 'VII  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127304', 'INDAH SULISTYO RINI', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127305', 'ISAH BELA MULYAWATI', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127306', 'JUAN DEFAN', 'VII  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127307', 'LULU LAIL FAUZAN', 'VII  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127308', 'LUSI TRI OCTAVIANI', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127309', 'MAUDINY SALMA YULANDA', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127310', 'MAUDY FATMA YOANITA', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127311', 'MAULIDINA RIHADATUL AISYI', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127312', 'MELINDA ELHAQ', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127313', 'MILENA FEBRI DIWANTI', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127314', 'MUHAMAD NASIRUDIN ZAHID', 'VII  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127315', 'MUHAMMAD ADITYA MUNAJAT', 'VII  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127316', 'MUHAMMAD FAUZAN PRIKATAMA', 'VII  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127317', 'MUHAMMAD RAIHAN PRASETYA', 'VII  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127318', 'NADYA PRISILIA MAHARANI', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127319', 'PRIESTA GHEA AUDWIYANTY', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127320', 'RATU MOJA', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127321', 'REFIANDA YUSUF ALFARESSA', 'VII  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127322', 'REYHAN REIYANA ANDISA', 'VII  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127323', 'RHESTYKA ZAHRA K', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127324', 'RIDHA NUR ADINDA PUTRI', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127325', 'RIFA AULIARAHMI', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127326', 'RIZKY MUHAMMAD FAUZAN', 'VII  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127327', 'SHAFA SALSABILA', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127328', 'SHOFURA AGISDA FATUNNISA', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127329', 'SIMARMATA, LUKAS MARCELINO', 'VII  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127330', 'SRI AYU NURAINI', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127331', 'TETRA BAYUASMARA KAMAJAYA', 'VII  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127332', 'VANIA DWI LISTIARINI', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127333', 'ZULFAHANA AMATULLOH', 'VII  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('11127164', 'ADISTINA SANIA .P', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127165', 'AINUN HAYATI', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127166', 'AMALIA DEWI SUKMAJI', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127167', 'ANDI NUR FAADIYAH UTARI', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127168', 'AUDREY ANANDA FIRDAUS', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127169', 'BAYU RAKA PRATAMA', 'VII  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127170', 'BIYAN MUHAMMAD SYAFIQ', 'VII  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127171', 'DEBBY PUTRI LESTARI', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127172', 'FATHIA CHAIRUNISA RIANTI', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127173', 'HILDA AGNESYA RAHAYU', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127174', 'HILLARYANA', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127175', 'JEVAN FAUZAN BAARIZKY', 'VII  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127176', 'JIHAN PUTRI ANANDA', 'VII  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127177', 'KANIA NISSA AMALINA', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127178', 'KHAERUNISSA DWITA L', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127179', 'M RAFI ASTRA  BAIHAQI', 'VII  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127180', 'M. DESTIAN', 'VII  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127181', 'MEIRANY KHATRINE VERONIKHA', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127182', 'MIA OKTAFIANI MULIA UTAMI', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127183', 'MUHAMMAD ALFATHAN ADRIANSYAH', 'VII  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127184', 'MUHAMMAD FARHAN SETIAMAN', 'VII  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127185', 'MUHAMMAD FAUZIE ALYANI. A', 'VII  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127186', 'MUHAMMAD JUANG', 'VII  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127187', 'MUHAMMAD TSABITUL AZMI', 'VII  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127188', 'NAIL HAIKAL SYAFIQ', 'VII  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127189', 'NURUL IMANIAR', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127190', 'PUTRI LEONI VIRCESA SOEDJATMO', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127191', 'QORRY NURAISYAH SEKAWAN PAMUNG', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127192', 'RAIGA OKTABENA TIMOER', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127193', 'RIFA HANIFAH RAHMALIA RIDWAN', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127194', 'RIZKI FADLILAH', 'VII  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127195', 'SARAH FAULIA AZHARA', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127196', 'SELSA SHADILA', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127197', 'SHI SHI SHERLY KEMALA', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127198', 'SILVI APRILLIA DEVI', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127199', 'SINTIA MEILINDA', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127200', 'SITI NOOR BILQIS R', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127201', 'SYIFA AYU ARIYANTI', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127202', 'TAUFIK HIDAYAT', 'VII  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127203', 'TAZKIA RUSDIANA', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127204', 'TELLA FAHIRA', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127205', 'WAFIYYAH SALSABILA', 'VII  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127121', 'AFIFAH DWI WULANDARI', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127122', 'AGI ABDULLAH AL-GHIFARI', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127123', 'AISYAH SARTIKA DEWI KAMALUDIN', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127124', 'ALWAN ASSYAUQI', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127125', 'ASRI AINUN SYARIFAH', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127126', 'BILAL JANUAR KAWARU', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127127', 'DEWI FORTUNA SOLINA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127128', 'DWI LESTARI DAMAYANTI', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127129', 'FARAH TIFA AGHNIA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127130', 'FAUZI RAMADAN', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127131', 'FERRY MUHAMAD FIRMANSYAH', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127132', 'GALANG ADI KUNCORO', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127133', 'ISMI HAKIM', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127134', 'JEREMY JOSEPH JONATHAN RIESTAR', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127135', 'JUNIAR SISMONIEKA KOSWARARA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127136', 'LUTHFI RIZKI PAMUNGKAS', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127137', 'LUTHFIA AZZAHRA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127138', 'M.DHIKA', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127139', 'M.ALDI ARDIANSYAH', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127140', 'MUHAMMAD AINUR ROFIQ', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127141', 'MUHAMMAD FARHAN SETIAWAN', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127142', 'MUHAMMAD GHADANPHAR', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127143', 'NAMIRA AGUSTIN', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127144', 'NISA BELAGAMA BALIRAHAJENG', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127145', 'NOVILIANONI', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127146', 'PUTRI RIZKY AMALIA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127147', 'RAYHAN ILHAM SANIY', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127148', 'REFI SYABANI', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127149', 'REIVALIA NIRWANA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127150', 'RIBEL DANA KRISDIANTI', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127151', 'RITA NUR AMALIA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127152', 'RIZAL FATHUR RAHMAN', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127153', 'SALMA MEIGA PRATISTA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127154', 'SHAFIRA AULIA ZACHRA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127155', 'SHIFA AMELIA QINTHARA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127156', 'SRI WAHYUNI', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127157', 'SYAFIRA SALSABILA RAHAYU', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127158', 'SYAFIRA DWI ', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127159', 'TEGAR ALIF MUHARRAM', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127160', 'VERA RAHMA FADILLA', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127161', 'YOSSY DEJANTI', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127162', 'YUSUF ROSARIO PASARIBU', 'VII  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('11127163', 'ZAIDHIYA RIZQI RAIHANI', 'VII  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '');
INSERT INTO `t_siswa` VALUES ('1011.7.001', 'ABDURRAHMAN QANITURRAZAN', 'VIII A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.002', 'AHMAD NURMAULANA FIRLI', 'VIII A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.003', 'ALPHA RHESA JANITRA', 'VIII A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.004', 'ALWI YUSRAN', 'VIII A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.005', 'ALYA SHAFIRA HEWIZ', 'VIII A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.006', 'AMIRUL SIDDIQ MIRZA', 'VIII A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.007', 'ASTRI AMALIA IRMAN', 'VIII A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.008', 'AUFAR MUHAMMAD RIZKI', 'VIII A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.009', 'DEANDRA SHIFAYANTI A', 'VIII A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.010', 'DEIKA ZHILLAN FATHARANI', 'VIII A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.011', 'FAIRUZIAH HETIZTA MAHARANI', 'VIII A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.012', 'FARAH KHANSA AQILA PUTRI', 'VIII A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.013', 'FAUZI INSAN ESTIKO', 'VIII A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.014', 'HAPITA SABILA PERMATA TOHIR', 'VIII A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.015', 'IHSAN MAULANA RIYADI', 'VIII A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.016', 'ISMAIL NAUFAL AZKIARIZQI', 'VIII A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.017', 'JULIAN DWI S', 'VIII A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.018', 'KADEK NETI ANGGRAENI W', 'VIII A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.019', 'KARINA YASINTA', 'VIII A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.020', 'MAULANA SYIFA NAHLA A', 'VIII A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.021', 'MOCHAMMAD ANDHIKA A.P', 'VIII A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.022', 'MUHAMMAD HIZKY BAIHAKKY', 'VIII A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.023', 'MUHAMMAD RIZQI RAMADHAN', 'VIII A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.024', 'MUTHIA RACHMI ANISTYA PUTRI', 'VIII A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.025', 'NURUL AGHNIA RAMDHANI', 'VIII A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.026', 'OKKY DWIARTONO PUTRO', 'VIII A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.027', 'QUIN ADILA', 'VIII A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.028', 'REFIA MEIDI EMIRA', 'VIII A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.029', 'RIZKY AULYA KHOIRUNNISA', 'VIII A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.030', 'SHABRINA RAHMA FAUZIA', 'VIII A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.031', 'TASYA SYAFIRA', 'VIII A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.032', 'THAREQ MUHAMMAD YUSUF H.A', 'VIII A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.033', 'TIAS ADIWIGUNA', 'VIII A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.034', 'YASMIN ZAHRA KHAIRUNNISA', 'VIII A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.035', 'YEREMIA KRISTIANTO ADI', 'VIII A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.036', 'YOCIA MEIKO OKE', 'VIII A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.246', 'AGIT PRASETYA', 'VIII B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.040', 'ANISA', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.085', 'ANNISA NURSALSABILLAH', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.248', 'ARRINI AMARWATI SUGITA', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.088', 'AURILIA AYUANDA MULYADI', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.214', 'DANDI MUHAMMAD RIZKATAMA', 'VIII B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.217', 'DIKANIA RIDA INDRAWATI', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.048', 'DINA  INDRI RESTIANI', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.169', 'FADILLAH LUTHFIANI B', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.258', 'FAUZIYYAH KHOIRUNNISA F.R', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.259', 'FEBRIL DES SAPUTRA DINI', 'VIII B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.261', 'FIRAS ADHILIA', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.222', 'IKA KARTIKA', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.058', 'IKHSAN AHMAD KUMARA HADI', 'VIII B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.173', 'IRMA NOVRIYANI', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.174', 'KAMILA GITA ISMIRANI', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.175', 'KUKUH BUDIANTO', 'VIII B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.176', 'LINGGA FATHUL HAKIM', 'VIII B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.060', 'LULU SHARA DHIYA TAMMA', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.137', 'MARGARETHA DEBORA LALA', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.287', 'MOCH.FACHRY ZULHAM', 'VIII B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.179', 'MUCHAMMAD INDRA', 'VIII B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.227', 'MUHAMAD LUTFI GAISANI', 'VIII B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.103', 'MUHAMAD TABAH PERKASA HP', 'VIII B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.104', 'MUHAMMAD REZA PUTRA', 'VIII B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.067', 'MUHAMMAD RIZKI ATHARI N', 'VIII B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.146', 'NADYA RIZKIANA M', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.231', 'RETNO PURBONINGRUM', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.151', 'RISTI MEGA PRAMADITA', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.278', 'SAFRINA NUR JANNAH', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.114', 'SARAH PERTIWI', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.073', 'SARAH PUTRI MAULANI', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.155', 'SYAHIDIYAH', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.156', 'TAUFAN AKBAR KILANA', 'VIII B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.238', 'VISAL SATRIA', 'VIII B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.244', 'ZULLIKA HANIFAH MARDIAN', 'VIII B', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('&#49&#49&#49&#50&#46&#56&', 'M. IRFAN AGUNG LAKSANA', 'VIII B', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.203', 'AGI AHMAD FAUZI', 'VIII C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.080', 'ALYA ROSITA ESTUDIANTI', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.041', 'ANNISA AZZAHRA', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.127', 'BAGEA BAGJA GUMELAR', 'VIII C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.212', 'BELLA YULIANTI', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.215', 'DETIA ISLAMIATI', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.091', 'FAIRUZ ARIFAH GHASSANI', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.219', 'FEBRIAN DIAZ MAULANA', 'VIII C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.171', 'GABRIEL JABBAR NOOR', 'VIII C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.095', 'GELAR MAHENDRA', 'VIII C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.055', 'GINA REVA SANDIRA', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.059', 'LIANA DAVINIA JOLENE', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.270', 'M. LUTHFI HAFFIYYAN', 'VIII C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.178', 'MOHAMMAD SULTHAN RAVIE', 'VIII C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.142', 'MUHAMAD ARI ALPIANDI', 'VIII C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.184', 'NADA ZAHRA SARIBANON', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.187', 'NURUL IZZA ANNISA A', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.229', 'PANDHIT SATRIO AJI ', 'VIII C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.273', 'REGINA RAHMADELLA', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.111', 'RIFKI BAGUS MUHAMAD', 'VIII C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.070', 'RISYA FAUZIYYAH', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.112', 'RIZKY NUGRAHA ALAM', 'VIII C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.233', 'RIZKYTA DELLA AURELIA', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.071', 'RIZQI AJENG', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.113', 'ROSSY ROSDIANA', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.115', 'SHAFA SHOFIANI', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.281', 'SHAFIRA OCTAVIANI', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.153', 'SITI AR RIDHA NUR S.', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.282', 'TASYA YATULAH RACHMADANTY', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.197', 'VANDAN ALFI', 'VIII C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.198', 'VANI DWI NURANI', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.158', 'VENNY DESTARI NURLITA', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.283', 'VINNY ASRULIANA', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.239', 'WANDA DESTI UNTARI', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.159', 'YOLANDA RAINTINA', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.286', 'YOSUA BARNABAS', 'VIII C', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.8118', 'RIFKA NURSAFIRA', 'VIII C', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.120', 'AFNITA CAHYANI', 'VIII D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.122', 'AGUNG LAKSONO', 'VIII D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.083', 'ANDJAR RASMITA ADJI', 'VIII D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.207', 'ANNAFI FIOLA LESTARI', 'VIII D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.162', 'ASIA LUTHFIAH', 'VIII D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.250', 'AYU NOVRINA', 'VIII D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.252', 'CATHLEN REZEKY PUTRI ', 'VIII D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.216', 'DEWI PITALOKA', 'VIII D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.218', 'DINAR', 'VIII D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.050', 'DWI CERRY PUJI MARGIYANTI', 'VIII D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.167', 'ERFAN MUHAMAD RAHMAWAN', 'VIII D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.052', 'ESA SYARIFUL BANAT', 'VIII D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.054', 'FAKHRI RIZQULLAH', 'VIII D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.132', 'FIQRI GILANG R', 'VIII D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.267', 'KENNY PRARIZKI PUTRI', 'VIII D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.099', 'LORIS AKBAR', 'VIII D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.269', 'LUTHFI ABDURRAHMAN', 'VIII D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.136', 'M. MITHAHUL FALLAH', 'VIII D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.063', 'MIA DWI OKTAVIANI', 'VIII D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.140', 'MOCHAMAD FACHRY PRAYOGA', 'VIII D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.065', 'MUHAMMAD DANNI R', 'VIII D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.181', 'MUTIARA ANNANDARA', 'VIII D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.182', 'NABILA SHAFA ATHHARANI', 'VIII D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.108', 'NURAULIA ASSYIFA ZAHRA', 'VIII D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.150', 'QANITA HUSTINI', 'VIII D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.230', 'QUADRANT BAROKATUS SALAM', 'VIII D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.274', 'RESA HANI DAMAYANTI', 'VIII D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.189', 'REZTA PANDU TIFANI', 'VIII D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.275', 'RHEVI ADITYA SALINDA', 'VIII D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.234', 'ROHMAN FIRMANSYAH', 'VIII D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.154', 'SITI WAHIDATUN CHASANAH', 'VIII D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.117', 'TSANIYA NURINA R', 'VIII D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.157', 'URIYA RAHMADINA', 'VIII D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.200', 'YANFA AFUZA', 'VIII D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.8117', 'M.ILMAN SEJATI', 'VIII D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.121', 'AGI MOCHAMAD NUGRAHA ', 'VIII E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.038', 'ALDI AFINZA', 'VIII E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.161', 'ALMIRA KIYASSATHINA', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.205', 'ALVIN SYAHRUL FAUZAN', 'VIII E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.086', 'ARDHIKA HERTIJANSYAH', 'VIII E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.125', 'ASRUL RIZKI MEIDIANSYAH', 'VIII E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.211', 'BELLA NURHALIZAH', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.213', 'DAFFA LEONDRA RAMANTIKA', 'VIII E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.045', 'DEBORA EIRENE HARIYATI', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.166', 'EKA PUTRI JULIANTI', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.260', 'FEBRIYANTI BAHAR', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.093', 'FIKRI NAUFAL ASSHIDIQ', 'VIII E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.172', 'HANDY HUSNIYASSAR', 'VIII E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.096', 'HARITS MUHAMMAD SETYAMAN', 'VIII E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.056', 'HASHINAH SALMA ROHMAH', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.264', 'HERNING GALIH GANTINI', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.098', 'KHINTAN LARASATY BAY', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.101', 'LUTHFI ROMIZ HUSAINI', 'VIII E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.225', 'LUTHFIA AZZAHRA', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.177', 'MANGARAJA KEMAL ACHMAD', 'VIII E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.062', 'MAYANG NUR SAGITA F', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.272', 'MUHAMAD AKSHAY KUMAR', 'VIII E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.145', 'MUTIARA AULIA DEWI', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.148', 'NURDYATI KARTINI M.P', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.232', 'REZTI PANDU TAFINA', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.279', 'SALIMAH HAUNA FIRDAUSI', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.235', 'SALSABILLA DINITA PUTRI', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.074', 'SATRIA SETIA PERMANA', 'VIII E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.077', 'TENI FIBRIANTI', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.116', 'TIRA TIFANI', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.284', 'VIOLITTA PUTRI PRATIWI', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.199', 'WIDYA GITHA LESTARI', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.202', 'YUNE ANDINI PUTRI', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.160', 'ZALFA FAKHIRAH AMIR NUR', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.8116', 'NAHRA KEMALAHAYATI', 'VIII E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.8105234375', 'ANGGA MARUSAKA', 'VIII E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.037', 'ADITYA PRASETIYO', 'VIII F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.039', 'AMBAR PURNAMA SARI', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.082', 'ANDIKATAMA ARDIKRISNA', 'VIII F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.208', 'ARIANI MEGA PUSPA ASMARA', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.249', 'ASLAM KOSAMAN JAYA', 'VIII F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.210', 'ASTI OKTAVIANTI', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.042', 'AYU OCTRINA', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.163', 'CHANDRA RAMDHAN PURNAMA', 'VIII F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.089', 'CINDYA DHAMARANTI', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.044', 'CIPTO TRI KUNCORO', 'VIII F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.164', 'CITRA MAULANI', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.165', 'DINDA JINAN  FAIRUZ', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.253', 'DIZA SITI FHATIMA AZ ZAHRA', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.262', 'GEFRI ALANS', 'VIII F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.133', 'HANI NUR HIDAYAH', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.221', 'HANNY YUNITA', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.265', 'ILMA AULIA NABILA', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.134', 'IRENE IRAWATY SIMANJUNTAK', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.266', 'JULIUS SIREGAR', 'VIII F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.268', 'KEUKEU MEGA SYLVIA', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.100', 'LUTHFI NAUFAL ABID', 'VIII F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.068', 'MAYLANI NURUL RIZQIAH', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.143', 'MUHAMAD IBNU TRI YUONO', 'VIII F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.107', 'NITYA SALSABILA SUPRIJATNA', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.186', 'NURAINI PUTRI RIWADI', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.149', 'PUTRI ELIZABET', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.069', 'RAFAELLA ANASTASIA', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.110', 'RESTU AYU LESTARI', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.191', 'RISCKY EKO PRASETYO', 'VIII F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.152', 'SANDYKA GUNNISYAH ', 'VIII F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.280', 'SATRIA BUDHI DHARMA', 'VIII F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.196', 'TOFIQ ABDUR ROZAK', 'VIII F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.236', 'VIDA NOVITA WULANDARI', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.241', 'YULIA SARI DEWI', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.243', 'ZINNIRAH LAILA NUR HUDA', 'VIII F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.8104234375', 'INDIARTO MOELYONO', 'VIII F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.245', 'ADNAN JATI HURIF', 'VIII H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.049', 'DINDA DESIANA DEWI', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.051', 'ELSA GHINASTA MAGHRIANI', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.057', 'IRFAN KRISWANTO', 'VIII H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.064', 'MUHAMAD RIDWAN SOFYAN', 'VIII H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.072', 'SARAH FARHATAINI JAZULI', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.075', 'SHALMA AYU SHAFIRA', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.079', 'ALIFAH CAHYANI', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.084', 'ANNISA IZMI AMALIA', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.087', 'ARINI SHAFITRI NURHAYANTI', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.094', 'FIORENT RIZKY MAULANA', 'VIII H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.097', 'KINTAN ANINDITA PUTRI', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.102', 'M. FAHMI HERLAMBANG', 'VIII H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.124', 'ARIF LUDYO', 'VIII H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.130', 'FADIL BAGASKARA', 'VIII H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.135', 'LARASATI LINTANG LITUHAYU', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.138', 'MAUDYA SAFITRI', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.144', 'MUHAMMAD FADHLABBAS', 'VIII H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.147', 'NIRA ANDARI', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.170', 'FARIHATUN NIDA', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.180', 'MUTIA SAHARA', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.183', 'NABILA ULFAH', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.185', 'NUR KHAFSOH RAHAYU', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.188', 'RAY VIERA LAXMANA', 'VIII H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.193', 'ROYAN MUHITH NURFAUZI', 'VIII H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.201', 'YOSEFIN INDRASWARI L', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.204', 'ALHANDES', 'VIII H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.206', 'ANISA EKA DESTIYANA ', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.220', 'GHAUTSI HADAINA', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.224', 'INDRAJID SATRIO UTOMO', 'VIII H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.242', 'ZILDJIAN MAURELIANANDA K', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.251', 'AYU SAADATUN NISA ', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.254', 'ELZANIA PRIMA DEWI', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.277', 'SAFIRA YUSRINA ZATA YUMNI', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.7.285', 'YOGI KUSUMA SANTIKA', 'VIII H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.811', 'INDRI FITRIANI', 'VIII H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.8109', 'FAISAL RAMADHAN', 'VIII H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.8108', 'RIVALDI ARIRAHVI', 'VIII H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.001', 'ABDULLATIEF ZUHDY', 'IX  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.002', 'ANRIA NIARTI  SETYAWAN', 'IX  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.003', 'BURHANSYAH AZHAR ', 'IX  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.004', 'CITRA AYU W  IDIANTARI', 'IX  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.005', 'DILLY DWI MUHARAM PUTRA  ', 'IX  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.006', 'DIMAS MUSA FATURRAHWAN ', 'IX  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.007', 'FAJRIAN SAPRI', 'IX  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.008', 'FAUZAN AUFARRAHMAN     ', 'IX  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.009', 'GEMA AKBAR MOHAMMAD ARIF ', 'IX  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.010', 'GHINA RAFIDAH', 'IX  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.011', 'HANIN NURAINI', 'IX  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.012', 'HASNA FITRI NURAINI', 'IX  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.013', 'HASNA MAWADDAH      ', 'IX  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.014', 'HASNA ZAHRATUL HASANAH    ', 'IX  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.015', 'ILMA DINAR LATIFFA', 'IX  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.016', 'LUQMAN ILMAN  MUHAMMAD', 'IX  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.017', 'LUTFI LUQMAN KHARY  ', 'IX  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.018', 'LUTHFI HAMDANI  ARIF  ', 'IX  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.019', 'M RIFQI MULYADI    ', 'IX  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.020', 'NABILA BILQISTI ROFIATUNNAJAH ', 'IX  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.021', 'R ALIYA TRESNA  MAHARANI D.', 'IX  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.022', 'RAFIKA SALMA RUSYDINA ', 'IX  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.023', 'RAYU FADIL NUR RIZKI', 'IX  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.024', 'RIFQI RAMADANSYAH      ', 'IX  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.025', 'RINGGIT AJI PAMUNGKAS', 'IX  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.026', 'RISYAD RIYADI', 'IX  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.027', 'RUBY ZULFIANSYAH       ', 'IX  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.028', 'SALMA AZHAR GUNARA', 'IX  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.029', 'SOPHIA PERENNIA    ', 'IX  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.030', 'TABAH JULIANSYAH', 'IX  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.031', 'THOMAS AGUNG SANTOSO', 'IX  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.032', 'TITO WIRA PRAMUDITA', 'IX  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.033', 'WIDHYKA FAKHRI YAKANSA', 'IX  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.8.314', '   MUHAMMAD RAKA DWI PRASETYO', 'IX  A', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.8.315', '  TAMARA FEBRIANI', 'IX  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.8.316', '  HANA GITA', 'IX  A', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.034', 'ACHMAD FADHITYA MUHARRAM ', 'IX  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.244', 'ALI GUSTIANA ', 'IX  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.08.300', 'AMI RAHMI MULIANI', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.123', 'ANNISA NUR FITRIANI ', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.038', 'AZIZAH NUR HANIFAH ', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.8.317', 'DINDA AYU NURINDAH SARI', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.8 313', 'DINE DWI', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.254', 'EVAN HAKEEM P.', 'IX  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.088', 'FAJAR DWI PANGESTU  ', 'IX  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.08.305', 'FATHIYA AINUL M', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.212', 'FENY RAHAYU RACHMAWATI', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.08.211', 'FIRMANTO RAIS PRAYITNO', 'IX  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.042', 'FITRI FEBRINA SARASWATI   ', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.259', 'FITRI HUSNI MARDIYAH', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.135', 'FITRIANA TRI ARIANI ', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.139', 'HASAN ABDUROSYID      ', 'IX  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.215', 'I MADE ASTU DWI CANDRA', 'IX  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.262', 'INEZ SALYTANIA       ', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.178', 'INTALIALLITA ', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.9103', 'IQBAL AFDEL AZIZ', 'IX  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.142', 'KANIA LOSIANA', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.08.306', 'KARINA BESTARI', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.180', 'KRESNA SEPTYANA E.   ', 'IX  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.218', 'M. ADZKA  ANSHORY   ', 'IX  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.101', 'MIRA MELIANI ', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.050', 'MIRANI RACHMATIKA B.     ', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.051', 'MOHAMMAD LUTHFI', 'IX  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.224', 'MUHAMMAD AL GHIFARI AWALI', 'IX  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.188', 'MYANA YASMIN   GHASSANI P  ', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.190', 'NABILA NISA MUKAROM', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.106', 'RACHMAT BANGKIT PRATAMA', 'IX  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.107', 'RIDWAN WAHYUDI', 'IX  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.234', 'RIZKA YUSTICHIA      ', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.237', 'SARASWATI N  ', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.197', 'SHARA RHAMDAYANTI      ', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.064', 'SIFA NADIYYA HASANAH', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.283', 'SUFIKA ANGGRAENI APRILLIA   ', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.066', 'SUHESTI GUSNIAR N M    ', 'IX  D', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.076', 'ZULIANDE ZIDAN', 'IX  D', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.077', 'ADITYA FEBRIANTO     ', 'IX  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.036', 'AGHNI SALSABILA      ', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.079', 'AGUNG PUTRO SADEWO', 'IX  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.204', 'AKBAR FIRMANSYAH      ', 'IX  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.245', 'AMANI FADHILAH      ', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.206', 'ANGGUN ANGGREKAWATI    ', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.082', 'ARINA CAHYANI PUTRI     ', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.167', 'BAGUS FIRMAN  SABAR PRAKOSO', 'IX  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.125', 'BAGUS NUR MISBAHUDIN PRASETIA', 'IX  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.126', 'DESFIANA ELVA LARISSA', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.08.302', 'ELSA DWI KUSWULANSARI', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.257', 'FEBI FEBRIANTO       ', 'IX  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.258', 'FINA PURNAMASARI ', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.091', 'GHEA AZZAHRA ', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.176', 'GITA TRI NURHAYATIN  ', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.093', 'HANNA FADHILAH      ', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.08.296', 'HERMAWAN', 'IX  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.261', 'IBRAHIM HAMINATA    ', 'IX  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.097', 'JEFREY ADIATAMA', 'IX  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.216', 'KHOERUNNISA  NIDA AFIFAH', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.217', 'LIA LISNAWATI', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.047', 'MUHAMMAD ADI KHOIRUL UMAM', 'IX  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.182', 'MUHAMMAD RIFQI MULYANA   ', 'IX  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.052', 'MONICA       ', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.222', 'MUHAMAD NURUL', 'IX  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.08.293', 'MUHAMMAD FAUZAN', 'IX  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.273', 'NAZHIFA RIFDA ANNISA', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.103', 'NIDYANTHY ADILLIA PRATIWI', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.266', 'NURUL FADILAH', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.228', 'RADEN GHINA NOVIANTI', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.276', 'RAHMATIA INDRIANI ', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.195', 'RIA FUJI FAUZIAH   ', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.08.298', 'RIANTI ASTARI RISYAD', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.110', 'SANIA NUR ANJANI  ', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.242', 'WAHID AHYARUDDIN      ', 'IX  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.070', 'WINA SEPTIANI', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.159', 'YASYIFA NUR HANIFAH   ', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.9091234375', 'YOSUA ANDRIOUNUS', 'IX  E', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.118', 'ZULFA ASYIFA ', 'IX  E', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.119', 'ACHMAD RIZKY NURRAMDANI  ', 'IX  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.037', 'AJENG ARDHIA ARYA KUSUMA PUTRI', 'IX  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.08.301', 'ANNISA RUSYDA RAHMAH SHOLIHAT ', 'IX  F', '-', '0p//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.081', 'APRILA PRANA  TRESNARITA  ', 'IX  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.250', 'DEA TRIANA PUTRI ', 'IX  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.084', 'DEDEN MUHAMMAD  RIZAL   ', 'IX  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.251', 'DELA MIRAWATI', 'IX  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.252', 'DEVI RASENDA ', 'IX  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.9100234375', 'DIVA PERMATA', 'IX  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.132', 'DONI BUDIMAN ', 'IX  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.133', 'ELFIRA ROSALITA     ', 'IX  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.171', 'ERLIANKA PRATIWI   ', 'IX  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.134', 'FADILAT SUTIO NUGROHO  ', 'IX  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.172', 'FAZHA MAULANA RAZAK', 'IX  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.179', 'ISMATUL KHASANAH   ', 'IX  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.049', 'MUHAMMAD PASHA NUR FAUZAN', 'IX  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.268', 'MUHAMMAD RAMDHAN    ', 'IX  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.183', 'MAHARANI ANASTASYA ', 'IX  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.146', 'MASAGUS RIFQI RASYADI RINANDIT', 'IX  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.219', 'MEYGAN ALGHIFAR', 'IX  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.8.318', 'NABILA AUVA ATHIYYA BARI', 'IX  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.9109234375', 'NATASYA SAVITA', 'IX  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.055', 'OCTAVIANUS LAZARI ', 'IX  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.274', 'PANI TRIOKTAPIANI       ', 'IX  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.8.319', 'PRADIPTA PRIYA ADIYATMIKA', 'IX  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.105', 'QUEENSY VISIA  SUWANDI  ', 'IX  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.058', 'RAKHA FADLHUR ROHMAN    ', 'IX  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.059', 'RANI HERLINA ', 'IX  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.193', 'REZA ACHMAD FAZA NOVAL', 'IX  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.109', 'RINI PUSPITA BELA  ', 'IX  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.112', 'SHIFA NURUL INDAH PERTIWI', 'IX  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.065', 'SIFA SILVIANA', 'IX  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.199', 'SYAFARINA NURMAH RIALITA  ', 'IX  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.239', 'SYIFA NURRAHMAH      ', 'IX  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.240', 'TANTI RESTU PAMILI', 'IX  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.067', 'TAUFIQURRAHMAN', 'IX  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.071', 'YASMINE SOPHI DAMAYANTI ', 'IX  F', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.08.118', 'YUDHA BAKTI NUGRAHA', 'IX  F', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.121', 'AFIFAH INDAH NURLITA', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.207', 'ASHA ANNISA NUR AZWARINI   ', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.165', 'ATRIE GHINA ALALIYYA', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.208', 'DEVI NURLAILY RIZQA PUTRI.   ', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.129', 'DEWI LENTANG JOHOR SRI BANU', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.253', 'DIANA PERMATASARI      ', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.086', 'ELLENI DEBORA PRATAMA', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.089', 'FATWA FADHILAH  AQIMUDDIN    ', 'IX  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.175', 'GIANI FATMA SINTYA', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.092', 'GIVANI MAGHFIRAH PUTRI   ', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.136', 'HALINDA MULIA ARTI  ', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.214', 'HASNA NABILA  KHANSA', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.260', 'HENDRI YANGAR S R  ', 'IX  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.264', 'JAENAB MARDINI     ', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.267', 'LANI OCTAVIA NUR ALIFAH ', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.099', 'MUHAMMAD DIMAS ZULRI', 'IX  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.221', 'MUHAMMAD MUFID HAIDAR  ', 'IX  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.270', 'MARDIANSYAH NUR C.G.', 'IX  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.08.304', 'MUHAMMAD FAJAR IRFAN', 'IX  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.189', 'NABILA GHINA  ATHAYA   ', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.102', 'NADIA DEWI NUR  ANNISA  ', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.056', 'PRANANDA JOVANI V.  ', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.9114', 'R.MOCHAMMAD.REYHAN K', 'IX  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.229', 'RAFI BUDIMAN', 'IX  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.057', 'RAKA SATRYA PRIBADI', 'IX  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.9113', 'RESTI WEDY YENI ', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.277', 'REZA  OCTAVIANI ADRIAN       ', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.194', 'REZA AKMAL AMIRULLOH ', 'IX  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.08.294', 'REZA HERDIANA', 'IX  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.153', 'RIZKA ADHISWARA      ', 'IX  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.08.299', 'RIZKY IRIANDI SYAHPUTRA', 'IX  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.235', 'RM FATHIAREZA', 'IX  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.156', 'SRI WARDANI  ', 'IX  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.241', 'TIARA FEBRILIA      ', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.284', 'WINDA NOPITA ', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.158', 'WINDY DINDA KAMILASARI', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.072', 'YUDISTHIRA AGUNG DIBRATA', 'IX  G', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.075', 'ZULFIA KAMILA  MUTIA   ', 'IX  G', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1011.08.287', 'ADAM PRAGUSTI YOGASTIAN', 'IX  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.122', 'AGHNIA RUSYDAH     ', 'IX  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.203', 'ALFONSUS BAGUS CH.', 'IX  H', '-', 'L //19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.205', 'ALIFA NURAINI PUTRI    ', 'IX  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.163', 'AMANDA ALVITA', 'IX  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.164', 'ARIS ADRI PRASETIA', 'IX  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.249', 'CHAIRUNISA AULIA RAHMAN', 'IX  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.9112', 'DANDY ARIAWAN SANSOSIE', 'IX  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.085', 'DERAL SULAEMAN BAHRI    ', 'IX  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.127', 'DESI NURUL PRATIWI ', 'IX  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.128', 'DEVA HERLAMBANG SYAHPUTRA', 'IX  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.209', 'DEWI AYU KIRANA   ', 'IX  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.169', 'DIANA RACHMATUNNISSA      ', 'IX  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('1112.9101234375', 'ERLANGGA POENOES', 'IX  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.211', 'FADHEL HARIZ DZ.  ', 'IX  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.090', 'FAUZIAH YASMIN  K  ', 'IX  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.213', 'GOVINDA AKHMAD NUGRAHA   ', 'IX  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.095', 'IFA ROSTIANI ', 'IX  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.044', 'INDAH DWI RACHMAWATI  ', 'IX  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.177', 'INGGA FADITYA PUTRA', 'IX  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.263', 'IQBAL MOHAMMAD AZHARI', 'IX  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.045', 'IRMAWATI', 'IX  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.143', 'KARMILAH NUR SYAHADAH', 'IX  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.098', 'LAURENTIUS SETYO ', 'IX  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.145', 'M GHANI HIDAYATULLAH   ', 'IX  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.053', 'MUHAMMAD MUKHSIN  ', 'IX  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.187', 'MUTIA AURORA ', 'IX  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.225', 'NABILA FIANTI RACHMA PUTRI    ', 'IX  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.230', 'RAFLY RENALDY', 'IX  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.108', 'RANGGA DWI KURNIA    ', 'IX  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.192', 'REIZA  EKASYAHPUTRA', 'IX  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.060', 'RESTIANA FEBIANTI   ', 'IX  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.061', 'RIDHA RIZQIA ZAHRA   ', 'IX  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.062', 'RISA ARETHA PUTRIANA', 'IX  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.113', 'SHITA JULIANA DWI A.', 'IX  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.115', 'SYIFA NURULSABILA      ', 'IX  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.068', 'UMAR IBRAHIM MANAF', 'IX  H', '-', '0L//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');
INSERT INTO `t_siswa` VALUES ('0910.7.201', 'VERONICA DIAH MEGA PRATAMA', 'IX  H', '-', '0P//19', '-', 'Islam', '-', 'Bandung', '', '', '', '-');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=215 ;

-- 
-- Dumping data for table `t_staf`
-- 

INSERT INTO `t_staf` VALUES (213, 'Siti Kulsum, SPd', '19600122 197903 6666', 'L', '', '', '', '', '', '', '', '', '', '', '0', '', '');
INSERT INTO `t_staf` VALUES (214, 'Yuyuk Winangsih, SPd', '19600122 197903 7777', 'L', '', '', '', '', '', '', '', '', '', '', '0', '', '');
INSERT INTO `t_staf` VALUES (209, 'Agnes barlian, SPd', '19600122 197903 3333', 'P', '', '', '', '', '', '', '', '', '', '', '0', '', '');
INSERT INTO `t_staf` VALUES (210, 'Dra. Evina Rochayani', '19600122 197903 4444', 'P', '', '', '', '', '', '', '', '', '', '', '0', '', '');
INSERT INTO `t_staf` VALUES (211, 'Rina Tresnawati, SPd', '19600122 1979 5555', 'L', '', '', '', '', '', '', '', '', '', '', '0', '', '');
INSERT INTO `t_staf` VALUES (212, 'Dra. Maya Erica', '19600122 197903 5555', 'L', '', '', '', '', '', '', '', '', '', '', '0', '', '');
INSERT INTO `t_staf` VALUES (208, 'Rd. Dewi Irnawiyati, SPd', '19600122 197903 2222', 'L', '', '', '', '', '', '', '', '', '', '', '0', '', '');
INSERT INTO `t_staf` VALUES (165, 'Drs. H.Dwi M Sutisna,M.Pd', '19610319 198503 1 005', 'L', 'Muararajeun Baru V No. 11 RT.03/10', '', '', '', 'dmarkoniandi@gmail.com', 'IPA Fisika', '//19', '3191961', '-', 'Pemina  TK.I    IV/b', '0', '', '');
INSERT INTO `t_staf` VALUES (166, 'Komara Ruchyati,S.Pd', '19520805 197501 2 003', 'P', 'Perum RT.02/02 Rancaekek Kencana', '', '7790261', '81394467878', '', 'Matematika', '//19', '8051952', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (167, 'Rumaisyah,S.Pd', '19520629 197903 2 003', 'P', 'Perumnas Cijerah Blok 22, No. 109. Cijerah', '', '6000807', '93082388', '', 'IPA Biologi', '//19', '6291952', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (168, 'Yustina,S.Pd', '19551104 198003 2 002', 'P', 'Jln. Mekar Sari No.12 RT.01/17 Kiaracondong', '', '7212171', '81320570550', 'yustinesmpn14@gmail.com', 'Ilmu Pengetahuan Sosial', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (169, 'Drs. Cep Sudedi', '19600122 197903 1 002', 'L', 'Jln. Taman Merkuri Timur VII, No.7  RT.04/04 Marghayuraya', '', '7530746', '8122070300', 'cepsudedi60@yahoo.com', 'TIK', '//19', 'Bandung', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (170, 'Hj. Eni Zaetuniah,SPd.M.MPd', '19580822 197803 2 006', 'P', 'Komplek Sukup Baru No.46 Ujung Berung', '', '', '8156218415', 'enizaetuniah@yahoo.com', 'IPA Fisika', '//19', '', '-', 'Pemina  TK.I    IV/b', '0', '', '');
INSERT INTO `t_staf` VALUES (171, 'Hj. Eti Rohaeti, S.Pd', '19611009 198403 2 006', 'P', 'Gg. Binong Utara XIII, No.271/127 B Kiaracondong', '', '7305222', '8132147178', 'erohaeti2011@gmail.com', 'Matematika', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (172, 'Rahadi Sumarsono, S.Pd', '19571009 197903 1 001', 'L', '', '', '', '', '', 'Matematika', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (173, 'Rukman Tarasaputra,S.Pd', '19550329 197903 1 002', 'L', '', '', '', '', '', 'Pendidikan Jasmani', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (174, 'Dra. Ira Ruchyati, MMPd', '19600122 197903 1111', 'P', '', '', '', '', 'iraruch@gmail.com', 'Bahasa Sunda', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (175, 'Wita Suherwati,S.Pd', '19600319 198101 2 001', 'P', '', '', '', '', 'witasuherwati@gmail.com', 'Matematika', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (176, 'Sumiati Sutia,S.Pd', '19590118 198603 2 004', 'P', '', '', '', '', '', 'Matematika', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (177, 'Harlina,S.Pd', '19620606 198403 2 012', 'P', '', '', '', '', '', 'Matematika', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (178, 'Drs. Jamaludin, MMPd', '19620615 198303 1 011', 'L', '', '', '', '', '', 'IPA Fisika', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (179, 'Ade Yuliawati, S.Pd', '19650711 198703 2 005', 'P', '', '', '', '', 'theyulia65@gmail.com', 'Seni dan Budaya', '//19', '', '-', 'Pemina             IV/a', '0', NULL, '');
INSERT INTO `t_staf` VALUES (180, 'Cucu Suryana, S.Pd', '19590318 198103 1 010', 'L', '', '', '', '', '', 'Seni dan Budaya', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (181, 'Dana Suherman,S.Pd', '19610307 198103 1 004', 'L', '', '', '', '', '', 'Pendidikan Jasmani', '//19', '', '-', 'Pemina             IV/a', '0', NULL, '');
INSERT INTO `t_staf` VALUES (182, 'Dedi Sunardi, S.Pd', '19621109 198703 1 007', 'L', '', '', '', '', '', 'Pendidikan Jasmani', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (183, 'Drs. Edy Suroso', '19550604 198003 1 004', 'L', '', '', '', '', '', 'Ilmu Pengetahuan Sosial', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (184, 'Hj. Yuli Nurhayati,S.Pd, MPd', '19660707 198903 2 007', 'P', '', '', '', '', 'ylnurhayati@yahoo.com', 'Pendidikan ', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (185, 'Hj. Martini', '19630116 198403 2 008', 'P', '', '', '', '', 'martiniruchimat@gmail.com', 'Bahasa Indonesia', '//19', '', '-', 'Pemina             IV/a', '0', NULL, '');
INSERT INTO `t_staf` VALUES (186, 'Winarniati,S.Pd', '19641212 198512 2 002', 'P', '', '', '', '', 'winarniatiwin14@gmail.com', 'IPA Fisika', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (187, 'Ani Rochayati K, S.Pd', '19621127 198412 2 003', 'P', '', '', '', '', '', 'Ilmu Pengetahuan Sosial', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (188, 'Dra. Zuhriah', '19611014 198903 2 003', 'P', '', '', '', '', 'zuhriah_ali@gmail.com', 'Bimbingan Karir', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (189, 'Agnes Suswantina,S.Pd', '19650412 199103 2 006', 'P', '', '', '', '', '', 'Bimbingan Karir', '//19', '', '-', 'Pemina             IV/a', '0', NULL, '');
INSERT INTO `t_staf` VALUES (190, 'Eka Tresnasih,S.Pd', '19700620 199512 2 002', 'P', '', '', '', '', 'tresnasiheka@gmail.com', 'IPA Biologi', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (194, 'Endah Mayasari,S.Pd, MPd', '19720112 199702 2 002', 'P', '', '', '', '', '', 'Matematika', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (191, 'Drs. H. Suhendar', '19610713 198302 1 005', 'L', '', '', '', '', 'suhendarsmpn14@gmail.com', 'Bahasa Indonesia', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (192, 'Anna Sadewi,S.Pd', '196304 199412 2 001', 'P', '', '', '', '', '', 'Bahasa Inggris', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (193, 'Heni Herlina, S.Pd', '19711115 199412 2 001', 'P', '', '', '', '', 'heniherlina1971@yahoo.com', 'Bahasa Indonesia', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (195, 'Drs. Asep Sutarya', '19600419 198903 1 004', 'L', '', '', '', '', '', 'Ilmu Pengetahuan Sosial', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (196, 'Dra. Yuhanah', '19630119 199412 2 001', 'P', '', '', '', '', '', 'Pendidikan Agama', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (197, 'Dra. Nurma Sianturi', '19590929 198603 2 002', 'P', 'Jln. Pratista VI, No. 10 Antapani', '', '', '', '', 'Seni dan Budaya', '//19', '', '-', 'Pemina  TK.I    IV/b', '0', NULL, '');
INSERT INTO `t_staf` VALUES (198, 'Devi Herawati,S.Pd', '19820102 200604 2 018', 'P', '', '', '', '', 'vie_021@yahoo.com', 'Bahasa Inggris', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (199, 'Widaningsih,S.Pd', '19690927 199702 2 003', 'P', '', '', '', '', 'widaniningsih.hilman827@gmail.', 'Bahasa Indonesia', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (200, 'Rika Karmila,S.Pd', '19701118 199802 2 002', 'P', '', '', '', '', 'rikakarmila2011@gmail.com', 'IPA Biologi', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (201, 'Budi Hartono,S.Pd', '19690906 200801 1 011', 'L', '', '', '', '', '', 'Ilmu Pengetahuan Sosial', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (202, 'Fajar kusumajaya, ST', '1653748650200020', 'L', '', '', '', '', '', 'TIK', '//19', '', '-', 'Pemina             IV/a', '0', NULL, '');
INSERT INTO `t_staf` VALUES (203, 'Ani Kurniani, SPd', '3656756657300050', 'P', '', '', '', '', 'anikurniani@yahoo.com', 'Bahasa Sunda', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (204, 'Desy Herawaty, SPd', '3546754656300040', 'P', '', '', '', '', 'desyherawaty@yahoo.com', 'Seni dan Budaya', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (205, 'Nandang Sihabudin, S Ag', '2139750653200020', 'L', '', '', '', '', 'nandangsmpn14@gmail.com', 'Pendidikan Agama', '//19', '', '-', 'Pemina             IV/a', '0', '', '');
INSERT INTO `t_staf` VALUES (206, 'Yani Royani, SE', '9542745065365438', 'P', '', '', '', '', '', 'Pendidikan lingkungan ', '//19', '', '-', 'Pemina             IV/a', '0', NULL, '');
INSERT INTO `t_staf` VALUES (207, 'Irman Nurhakim, ST', '9353755657200010', 'L', '', '', '', '', '', 'Teknologi Informasi ', '//19', '', '-', 'Pemina             IV/a', '0', NULL, '');

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

INSERT INTO `t_statistik` VALUES ('127.0.0.1', '2012-12-16', 40, '1355668421');
INSERT INTO `t_statistik` VALUES ('203.19.4.164', '2012-12-16', 3, '1355649034');

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_tugas`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `t_tugas_kelas`
-- 

CREATE TABLE `t_tugas_kelas` (
  `idkls` int(11) NOT NULL auto_increment,
  `idtugas` int(11) NOT NULL,
  `kelas` varchar(10) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`idkls`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_tugas_kelas`
-- 


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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `t_tugas_siswa`
-- 


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

INSERT INTO `user` VALUES (3, 'admin', '57gc0bbbfb6b3', 'alanrm82@yahoo.com', '127.0.0.1', '21:30:16 16/12/2012', 23, 1);

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
