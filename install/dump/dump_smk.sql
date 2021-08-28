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
-- Database: `db_smk`
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

INSERT INTO `calendarevent` VALUES (1, '2009-08-07 00:00:00', '2009-08-12 00:00:00', 'pengkajian website', 'pengkajian website', '#D2D2FF', 1, 1, 1);
INSERT INTO `calendarevent` VALUES (2, '2012-12-10 00:00:00', '2012-12-15 00:00:00', 'Perbaikan UAS', 'Kesempatan memperbaiki hasil belajar bagi siswa yang belum mencapai KKM', '#33FF33', 1, 1, 1);
INSERT INTO `calendarevent` VALUES (3, '2012-11-27 00:00:00', '2012-12-08 00:00:00', 'Ujian Akhir Semester 1', 'Ujian Akhir Semester 1 Tahun Pelajaran 2012 - 2013', '#9999FF', 1, 1, 1);
INSERT INTO `calendarevent` VALUES (4, '2012-12-17 00:00:00', '2012-12-20 00:00:00', 'Klas Meeting', 'Pertandingan Olah Raga dan Seni antar kelas', '#FFCC66', 1, 1, 1);
INSERT INTO `calendarevent` VALUES (5, '2012-12-22 00:00:00', '2012-12-22 00:00:00', 'Pembagian Raport', 'Pembagian raport oleh wali kelas kepada masing-masing siswa', '#FFCCFF', 1, 1, 1);
INSERT INTO `calendarevent` VALUES (6, '2012-12-23 00:00:00', '2013-01-01 00:00:00', 'Liburan Semester 1', 'Liburan Semester 1 Tahun 2012/2013', '#FF0000', 1, 1, 1);

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

INSERT INTO `t_artikel` VALUES (25, '16-12-2012 06:08', '5 Gedung Tertinggi di Dunia ', '<p><img style="display: block; margin-left: auto; margin-right: auto;" title="Th-Makkah-Clock-Royal-Tower-2" src="../userfiles/image/1_gedung.jpg" alt="Th-Makkah-Clock-Royal-Tower-2" width="200" height="136" /></p>\r\n<p>Jika berbicara ketinggian gedung. banyak sekali perdebatan dan kebingungan dari berbagai kalangan dalam menentukan kriteria dan definisinya.<br />Karena bangunan-bangunan tinggi yang di bangun oleh manusia kebanyakan dari struktur menara broadcast radio atau televisi,yang raata-rata memiliki ketinggian sekitar 600 meter.<br />Adapun Hal-hal yang diperdebatkan adalah:<br />- Apakah struktur yang disanggah guy-wire dapat di hitung ketinggiannya?<br />- Apakah menghitung ketinggian hanya tempat yang dapat ditinggali?<br />- Apakah antena di atas-atap dapat dihitung?<br />- Apakah struktur yang berada di bawah air juga dihitung ketinggiannya?<br />Tetapi di balik perdebatan itu,di sini Khabuka hanya akan menulis daftar tertinggi dari bangunan yang berupa Gedung sesuai dengan judul di atas,dan mungkin itu termasuk dengan segala apa yang ada di atapnya.<br />Dan berikut Daftar 10 gedung tertinggi di dunia :<br /><br /><strong><span style="font-size: medium;">1. Burj Khalifa</span></strong><br />&nbsp;&nbsp;&nbsp; Lokasi : Dubai, Uni Emirat Arab<br />&nbsp;&nbsp;&nbsp; Di bangun tahun : 2004<br />&nbsp;&nbsp;&nbsp; Dibuka tahun : 4 -1-2010<br />&nbsp;&nbsp;&nbsp; Ketinggian : 828 m<br />&nbsp;&nbsp;&nbsp; Lantai teratas 6.213 m<br />&nbsp;&nbsp;&nbsp; Jumlah lantai : 160 lantai</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" title="Burj_Khalifa_building" src="../userfiles/image/2_gedung.jpg" alt="Burj_Khalifa_building" width="250" height="375" /></p>\r\n<p>&nbsp;</p>\r\n<p>Pada saat pembukaannya Burj Khalifa menjadi Gedung tertinggi dari bangunan apapun yang ada di dunia. Dan juga pada saat pembangunannya Burj Khalifa&nbsp; terus melewati bangunan-bangunan tertinggi lainnya, di antaranya :<br />Menggeser atau melewati posisi Taipei 101 sebagai Gedung tertinggi di dunia pada 21 Juli 2007. Pada waktu yang sama juga melewati ketinggian CN Tower sebagai struktur bebas (tanpa penyangga)tertinggi di dunia dan pada tanggal 7 April 2008 struktur tertinggi di dunia dari Menara KVLY-TV yang berada di Blanchard, North Dakota, Amerika Serikat berhasil dilewati. Menara Radio Warsawa 645,4 m (2.120 kaki) dibuat pada 1974 (namun runtuh pada saat renovasi pada 1991) berhasil dilewati pada 1 September 2008. Rekor lain dari Menara ini adalah mempunyai lift tercepat dengan kecepatan 60 km/jam atau 16.7 m/s. Dan bangunan dengan paling banyak lantai yaitu160 lantai.<br /><br /><strong><span style="font-size: medium;">&nbsp;2. Abraj Al-Bait</span></strong><br />&nbsp;&nbsp;&nbsp;&nbsp; Tinggi : 601 m<br />&nbsp;&nbsp;&nbsp;&nbsp; Lokasi : Mekah,Saudi Arabia<br />&nbsp;&nbsp;&nbsp;&nbsp; Jumlah lantai : 120 lantai<br />&nbsp;&nbsp;&nbsp; Tahun pembuatan : 2004-2012<br />&nbsp;&nbsp;&nbsp; Dibuka tahun : 2012</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" title="Th-Makkah-Clock-Royal-Tower-2" src="../userfiles/image/3_gedung.jpg" alt="Th-Makkah-Clock-Royal-Tower-2" width="514" height="351" /></p>\r\n<p>&nbsp;</p>\r\n<p>Abraj Al-Bait Tower atau dikenal juga dengan nama Mecca Royal Hotel Clock Tower. Hal menarik dari menara ini adalah letaknya yang berada dekat di selatan pintu masuk Masjidil Haram.<br />Terdapat tujuh menara dengan satu menara yang dinamakan Hotel Tower memiliki ketinggian di atas 6 menara lainnya(tinggi 601m) yang diperkhususkan untuk apartemen, Hotel Tower dijadikan hotel berbintang tujuh. Bangunan dibawah tujuh menara ini di isi dengan 5 lantai pusat perbelanjaan, ruang konferensi, dan fasilitas-fasilitas yang lain (termasuk ruang beribadah yang sanggup menampung hingga 10.000 orang)Konstruksi Abraj Al Bait ini dimulai pada tahun 2004 yang lalu, dan secara bertahap-tahap ketujuh menara ini diselesaikan dan yang paling terakhir selesai dari tujuh menara ini adalah menara Maqam.(Bisnis perhotelan yang semakin lama menjadi berkembang di kota ini juga tak terlepas dari banyaknya jamaah haji, oleh karena itu Menara Abraj Al Bait ini juga dirancang untuk mampu menampung sampai dengan 100.000 orang).<br /><br /><strong><span style="font-size: medium;">3. Taipei 101</span></strong><br />&nbsp;&nbsp;&nbsp; Tinggi : 509 m<br />&nbsp;&nbsp;&nbsp; Lokasi : Taipei, Taiwan<br />&nbsp;&nbsp;&nbsp; Jumlah lantai : 101<br />&nbsp;&nbsp;&nbsp; Pembukaan tahun : 31-12-2004</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" title="taipei" src="../userfiles/image/4_gedung.jpg" alt="taipei" width="660" height="487" /></p>\r\n<p>Dalam banyak aspek, gedung ini adalah salah satu pencakar langit yang paling maju yang pernah dibuat Manusia sampai sekarang. memiliki keunggulan yaitu fiber optik dan hubungan internet satelit yang dapat mencapai kecepatan 1 gigabyte per detik. Dua lift tercepat telah di sediakan oleh Toshiba yang mencapai kecepatan maksimum 1.010 m/min (63km/jam atau 39 mil/jam) berati mampu membawa pengunjung dari lantai dasar ke lantai 89 dalam waktu 39 detik. Sebuah pendulum seberat 800 ton dipasang di lantai 88,menstabilkan menara ini terhadap goyangan yang timbul dari gempa bumi,angin topan maupun gaya geser dari angin.<br /><br /><strong><span style="font-size: medium;">&nbsp;4. Shanghai World Financial Center</span></strong><br />&nbsp;&nbsp;&nbsp;&nbsp; Lokasi : Pudong , Shanghai , Cina<br />&nbsp;&nbsp;&nbsp;&nbsp; Di bangun tahun : 1997- 2008<br />&nbsp;&nbsp;&nbsp;&nbsp; Dibuka : 28 Agustus 2009<br />&nbsp;&nbsp;&nbsp; Tinggi : 494,3 m<br />&nbsp;&nbsp;&nbsp;&nbsp; Lantai teratas : 474,0 m<br />&nbsp;&nbsp;&nbsp; Jumlah lantai : 101</p>\r\n<p>&nbsp;<img style="display: block; margin-left: auto; margin-right: auto;" title="shanghai-world-financial-centre" src="../userfiles/image/5_gedung.jpg" alt="shanghai-world-financial-centre" width="512" height="361" /></p>\r\n<p>Fitur yang paling khas dari desain bangunan ini adalah aperture trapesium di puncak. Desain asli yang ditetapkan aperture yang melingkar, berdiameter 46m, untuk mengurangi tekanan dari tekanan angin, serta berfungsi sebagai subteks untuk desain, karena "mitologi Cina merupakan bumi dengan sebuah persegi dan langit dengan lingkaran ". Namun desain awal ini mulai menghadapi protes dari beberapa orang Cina, termasuk walikota Shanghai, Chen Liangyu, yang menganggap terlalu mirip dengan matahari terbit desain bendera Jepang . Pedersen kemudian mengusulkan bahwa jembatan ditempatkan di bagian bawah aperture untuk membuatnya kurang melingkar. Pada tanggal 18 Oktober 2005.dan yang lebih unik jika di perhatikan bangunan ini menyerupai raksasa pembuka botol.<br /><br /><span style="font-size: medium;"><strong>5.International Commerece Centre</strong></span><br />&nbsp;&nbsp; Tinggi :&nbsp; 484 m<br />&nbsp;&nbsp; Lokasi :&nbsp; West Kowloon , Hong Kong<br />&nbsp;&nbsp; Dibangun tahun : 2005-2010<br />&nbsp;&nbsp; Dibuka tahun : 2011<br />&nbsp;&nbsp; Jumlah lantai : 108&nbsp;</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" title="International_Commerce_Centre_201008" src="../userfiles/image/6_gedung.jpg" alt="International_Commerce_Centre_201008" width="250" height="563" />&nbsp;</p>\r\n<p>ICC Tower Ini adalah bagian dari Union Square proyek dibangun di atas Kowloon Station. Pembangunan ini dimiliki dan dikembangkan oleh MTR Corporation Limited dan Sun Hung Kai Properties. Saat ini ICC merupakan Gedung tertinggi kelima di dunia dengan tinggi badan, kedua bangunan tertinggi di dunia dengan jumlah lantai, serta menjadi bangunan tertinggi di Hong Kong .<br />Nama pembangunan formal adalah Union Square Phase 7 dan nama ICC secara resmi diumumkan pada tahun 2005.</p>\r\n<p>Sumber: http://khabuka.blogspot.com/2012/05/10-gedung-tertinggi-di-dunia.html</p>', '', 6, 3);
INSERT INTO `t_artikel` VALUES (24, '31-03-2011 23:14', 'Pendidikan Sebagai Investasi Jangka Panjang', '<p align="justify"><span style="font-family: arial; font-size: x-small;">Profesor Toshiko Kinosita mengemukakan bahwa sumber daya manusia Indonesia masih sangat lemah untuk mendukung perkembangan industri dan ekonomi. Penyebabnya karena pemerintah selama ini tidak pernah menempatkan pendidikan sebagai prioritas terpenting. Tidak ditempatkannya pendidikan sebagai prioritas terpenting karena masyarakat Indonesia, mulai dari yang awam hingga politisi dan pejabat pemerintah, hanya berorientasi mengejar uang untuk memperkaya diri sendiri dan tidak pernah berfikir panjang (Kompas, 24 Mei 2002). </span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Pendapat Guru Besar Universitas Waseda Jepang tersebut sangat menarik untuk dikaji mengingat saat ini pemerintah Indonesia mulai melirik pendidikan sebagai investasi jangka panjang, setelah selama ini pendidikan terabaikan. Salah satu indikatornya adalah telah disetujuinya oleh MPR untuk memprioritaskan anggaran pendidikan minimal 20 % dari APBN atau APBD. Langkah ini merupakan awal kesadaran pentingnya pendidikan sebagai investasi jangka pangjang. Sedikitnya terdapat tiga alasan untuk memprioritaskan pendidikan sebagai investasi jangka panjang. </span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Pertama, pendidikan adalah alat untuk perkembangan ekonomi dan bukan sekedar pertumbuhan ekonomi. Pada praksis manajemen pendidikan modern, salah satu dari lima fungsi pendidikan adalah fungsi teknis-ekonomis baik pada tataran individual hingga tataran global. Fungsi teknis-ekonomis merujuk pada kontribusi pendidikan untuk perkembangan ekonomi. Misalnya pendidikan dapat membantu siswa untuk mendapatkan pengetahuan dan keterampilan yang diperlukan untuk hidup dan berkompetisi dalam ekonomi yang kompetitif. </span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Secara umum terbukti bahwa semakin berpendidikan seseorang maka tingkat pendapatannya semakin baik. Hal ini dimungkinkan karena orang yang berpendidikan lebih produktif bila dibandingkan dengan yang tidak berpendidikan. Produktivitas seseorang tersebut dikarenakan dimilikinya keterampilan teknis yang diperoleh dari pendidikan. Oleh karena itu salah satu tujuan yang harus dicapai oleh pendidikan adalah mengembangkan keterampilan hidup. Inilah sebenarnya arah kurikulum berbasis kompetensi, pendidikan life skill dan broad based education yang dikembangkan di Indonesia akhir-akhir ini. Di Amerika Serikat (1992) seseorang yang berpendidikan doktor penghasilan rata-rata per tahun sebesar 55 juta dollar, master 40 juta dollar, dan sarjana 33 juta dollar. Sementara itu lulusan pendidikan lanjutan hanya berpanghasilan rata-rata 19 juta dollar per tahun. Pada tahun yang sama struktur ini juga terjadi di Indonesia. Misalnya rata-rata, antara pedesaan dan perkotaan, pendapatan per tahun lulusan universitas 3,5 juta rupiah, akademi 3 juta rupiah, SLTA 1,9 juta rupiah, dan SD hanya 1,1 juta rupiah.</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Para penganut teori human capital berpendapat bahwa pendidikan adalah sebagai investasi sumber daya manusia yang memberi manfaat moneter ataupun non-moneter. Manfaat non-meneter dari pendidikan adalah diperolehnya kondisi kerja yang lebih baik, kepuasan kerja, efisiensi konsumsi, kepuasan menikmati masa pensiun dan manfaat hidup yang lebih lama karena peningkatan gizi dan kesehatan. Manfaat moneter adalah manfaat ekonomis yaitu berupa tambahan pendapatan seseorang yang telah menyelesaikan tingkat pendidikan tertentu dibandingkan dengan pendapatan lulusan pendidikan dibawahnya. (Walter W. McMahon dan Terry G. Geske, Financing Education: Overcoming Inefficiency and Inequity, USA: University of Illionis, 1982, h.121).</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Sumber daya manusia yang berpendidikan akan menjadi modal utama pembangunan nasional, terutama untuk perkembangan ekonomi. Semakin banyak orang yang berpendidikan maka semakin mudah bagi suatu negara untuk membangun bangsanya. Hal ini dikarenakan telah dikuasainya keterampilan, ilmu pengetahuan dan teknologi oleh sumber daya manusianya sehingga pemerintah lebih mudah dalam menggerakkan pembangunan nasional. </span></p>\r\n<p><span style="font-family: arial; font-size: x-small;"> Nilai </span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Balik Pendidikan<br /> Kedua, investasi pendidikan memberikan nilai balik (rate of return) yang lebih tinggi dari pada investasi fisik di bidang lain. Nilai balik pendidikan adalah perbandingan antara total biaya yang dikeluarkan untuk membiayai pendidikan dengan total pendapatan yang akan diperoleh setelah seseorang lulus dan memasuki dunia kerja. Di negara-negara sedang berkembang umumnya menunjukkan nilai balik terhadap investasi pendidikan relatif lebih tinggi dari pada investasi modal fisik yaitu 20 % dibanding 15 %. Sementara itu di negara-negara maju nilai balik investasi pendidikan lebih rendah dibanding investasi modal fisik yaitu 9 % dibanding 13 %. Keadaan ini dapat dijelaskan bahwa dengan jumlah tenaga kerja terdidik yang terampil dan ahli di negara berkembang relatif lebih terbatas jumlahnya dibandingkan dengan kebutuhan sehingga tingkat upah lebih tinggi dan akan menyebabkan nilai balik terhadap pendidikan juga tinggi (Ace Suryadi, Pendidikan, Investasi SDM dan Pembangunan: Isu, Teori dan Aplikasi. Balai Pustaka: Jakarta, 1999, h.247).</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Pilihan investasi pendidikan juga harus mempertimbangkan tingkatan pendidikan. Di Asia nilai balik sosial pendidikan dasar rata-rata sebesar 27 %, pendidikan menengah 15 %, dan pendidikan tinggi 13 %. Dengan demikian dapat dikemukakan bahwa semakin tinggi tingkat pendidikan seseorang maka manfaat sosialnya semakin kecil. Jelas sekali bahwa pendidikan dasar memberikan manfaat sosial yang paling besar diantara tingkat pendidikan lainnya. Melihat kenyataan ini maka struktur alokasi pembiayaan pendidikan harus direformasi. Pada tahun 1995/1996 misalnya, alokasi biaya pendidikan dari pemerintah Indonesia untuk Sekolah Dasar Negeri per siswa paling kecil yaitu rata-rata hanya sekirat 18.000 rupiah per bulan, sementara itu biaya pendidikan per siswa di Perguruan Tinggi Negeri mendapat alokasi sebesar 66.000 rupiah per bulan. Dirjen Dikti, Satrio Sumantri Brojonegoro suatu ketika mengemukakan bahwa alokasi dana untuk pendidikan tinggi negeri 25 kali lipat dari pendidikan dasar. Hal ini menunjukkan bahwa biaya pendidikan yang lebih banyak dialokasikan pada pendidikan tinggi justru terjadi inefisiensi karena hanya menguntungkan individu dan kurang memberikan manfaat kepada masyarakat.</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Reformasi alokasi biaya pendidikan ini penting dilakukan mengingat beberapa kajian yang menunjukkan bahwa mayoritas yang menikmati pendidikan di PTN adalah berasal dari masyarakat mampu. Maka model pembiayaan pendidikan selain didasarkan pada jenjang pendidikan (dasar vs tinggi) juga didasarkan pada kekuatan ekonomi siswa (miskin vs kaya). Artinya siswa di PTN yang berasal dari keluarga kaya harus dikenakan biaya pendidikan yang lebih mahal dari pada yang berasal dari keluarga miskin. Model yang ditawarkan ini sesuai dengan kritetia equity dalam pembiayaan pendidikan seperti yang digariskan Unesco.</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Itulah sebabnya Profesor Kinosita menyarankan bahwa yang diperlukan di Indonesia adalah pendidikan dasar dan bukan pendidikan yang canggih. Proses pendidikan pada pendidikan dasar setidaknnya bertumpu pada empat pilar yaitu learning to know, learning to do, leraning to be dan learning live together yang dapat dicapai melalui delapan kompetensi dasar yaitu membaca, menulis, mendengar, menutur, menghitung, meneliti, menghafal dan menghayal. Anggaran pendidikan nasional seharusnya diprioritaskan untuk mengentaskan pendidikan dasar 9 tahun dan bila perlu diperluas menjadi 12 tahun. Selain itu pendidikan dasar seharusnya &ldquo;benar-benar&rdquo; dibebaskan dari segala beban biaya. Dikatakan &ldquo;benar-benar&rdquo; karena selama ini wajib belajar 9 tahun yang dicanangkan pemerintah tidaklah gratis. Apabila semua anak usia pendidikan dasar sudah terlayani mendapatkan pendidikan tanpa dipungut biaya, barulah anggaran pendidikan dialokasikan untuk pendidikan tingkat selanjutnya. </span></p>\r\n<p><span style="font-family: arial; font-size: x-small;"> Fungsi </span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Non Ekonomi<br /> Ketiga, investasi dalam bidang pendidikan memiliki banyak fungsi selain fungsi teknis-ekonomis yaitu fungsi sosial-kemanusiaan, fungsi politis, fungsi budaya, dan fungsi kependidikan. Fungsi sosial-kemanusiaan merujuk pada kontribusi pendidikan terhadap perkembangan manusia dan hubungan sosial pada berbagai tingkat sosial yang berbeda. Misalnya pada tingkat individual pendidikan membantu siswa untuk mengembangkan dirinya secara psikologis, sosial, fisik dan membantu siswa mengembangkan potensinya semaksimal mungkin (Yin Cheong Cheng, School Effectiveness and School-Based Management: A Mechanism for Development, Washington D.C: The Palmer Press, 1996, h.7).</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Fungsi politis merujuk pada sumbangan pendidikan terhadap perkembangan politik pada tingkatan sosial yang berbeda. Misalnya pada tingkat individual, pendidikan membantu siswa untuk mengembangkan sikap dan keterampilan kewarganegaraan yang positif untuk melatih warganegara yang benar dan bertanggung jawab. Orang yang berpendidikan diharapkan lebih mengerti hak dan kewajibannya sehingga wawasan dan perilakunya semakin demoktratis. Selain itu orang yang berpendidikan diharapkan memiliki kesadaran dan tanggung jawab terhadap bangsa dan negara lebih baik dibandingkan dengan yang kurang berpendidikan.</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Fungsi budaya merujuk pada sumbangan pendidikan pada peralihan dan perkembangan budaya pada tingkatan sosial yang berbeda. Pada tingkat individual, pendidikan membantu siswa untuk mengembangkan kreativitasnya, kesadaran estetis serta untuk bersosialisasi dengan norma-norma, nilai-nilai dan keyakinan sosial yang baik. Orang yang berpendidikan diharapkan lebih mampu menghargai atau menghormati perbedaan dan pluralitas budaya sehingga memiliki sikap yang lebih terbuka terhadap keanekaragaman budaya. Dengan demikian semakin banyak orang yang berpendidikan diharapkan akan lebih mudah terjadinya akulturasi budaya yang selanjutnya akan terjadi integrasi budaya nasional atau regional.</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Fungsi kependidikan merujuk pada sumbangan pendidikan terhadap perkembangan dan pemeliharaan pendidikan pada tingkat sosial yang berbeda. Pada tingkat individual pendidikan membantu siswa belajar cara belajar dan membantu guru cara mengajar. Orang yang berpendidikan diharapkan memiliki kesadaran untuk belajar sepanjang hayat (life long learning), selalu merasa ketinggalan informasi, ilmu pengetahuan serta teknologi sehingga terus terdorong untuk maju dan terus belajar.</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Di kalangan masyarakat luas juga berlaku pendapat umum bahwa semakin berpendidikan maka makin baik status sosial seseorang dan penghormatan masyarakat terhadap orang yang berpendidikan lebih baik dari pada yang kurang berpendidikan. Orang yang berpendidikan diharapkan bisa menggunakan pemikiran-pemikirannya yang berorientasi pada kepentingan jangka panjang. Orang yang berpendidikan diharapkan tidak memiliki kecenderungan orientasi materi/uang apalagi untuk memperkaya diri sendiri.</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Kesimpulan<br /> Jelaslah bahwa investasi dalam bidang pendidikan tidak semata-mata untuk mendongkrak pertumbuhan ekonomi tetapi lebih luas lagi yaitu perkembangan ekonomi. Selama orde baru kita selalu bangga dengan pertumbuhan ekonomi yang tinggi, namun pertumbuhan ekonomi yang tinggi itu hancur lebur karena tidak didukung oleh adanya sumber daya manusia yang berpendidikan. Orde baru banyak melahirkan orang kaya yang tidak memiliki kejujuran dan keadilan, tetapi lebih banyak lagi melahirkan orang miskin. Akhirnya pertumbuhan ekonomi hanya dinikmati sebagian orang dan dengan tingkat ketergantungan yang amat besar.</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Perkembangan ekonomi akan tercapai apabila sumber daya manusianya memiliki etika, moral, rasa tanggung jawab, rasa keadilan, jujur, serta menyadari hak dan kewajiban yang kesemuanya itu merupakan indikator hasil pendidikan yang baik. Inilah saatnya bagi negeri ini untuk merenungkan bagaimana merencanakan sebuah sistem pendidikan yang baik untuk mendukung perkembangan ekonomi. Selain itu pendidikan juga sebagai alat pemersatu bangsa yang saat ini sedang diancam perpecahan. Melalui fungsi-fungsi pendidikan di atas yaitu fungsi sosial-kemanusiaan, fungsi politis, fungsi budaya, dan fungsi kependidikan maka negeri ini dapat disatukan kembali. Dari paparan di atas tampak bahwa pendidikan adalah wahana yang amat penting dan strategis untuk perkembangan ekonomi dan integrasi bangsa. Singkatnya pendidikan adalah sebagai investasi jangka panjang yang harus menjadi pilihan utama.</span></p>\r\n<p align="justify"><span style="font-family: arial; font-size: x-small;">Bila demikian, ke arah mana pendidikan negeri ini harus dibawa? Bagaimana merencanakan sebuah sistem pendidikan yang baik? Marilah kita renungkan bersama.</span></p>\r\n<p><span style="font-family: arial; font-size: x-small;">Nurkolis, Dosen Akademi Pariwisata Nusantara Jaya di Jakarta. </span></p>\r\n<p><span style="font-size: small;"><strong>Saya Drs. Nurkolis, MM setuju jika bahan yang dikirim dapat dipasang dan digunakan di Homepage Pendidikan Network dan saya menjamin bahwa bahan ini hasil karya saya sendiri dan sah (tidak ada copyright). . </strong></span></p>', 'Drs. Nurkolis, MM', 6, 2);

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

INSERT INTO `t_buku` VALUES (1, 'asep', 'asep@yahoo.com', 'bandung', 'Selamat atas launchingnya web site SMA Negeri xxx Bandung, ditunggu info nya, khususnya untuk kemajuan pendidikan di kota Bandung.<br />\r\nCongratulation untuk Pak Cucu yang senantiasa mendukung program-program pendidikan yang sejalan dengan kemajuan ilmu pengetahuan dan teknologi', '20:20:18', '11/11/2008', '127.0.0.1', 'terima kasih atas ucapannya 123456 fgdg');

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
INSERT INTO `t_download` VALUES (14, 'Kenali Tuturanmu', 'Materi tentang: Lafal Baku; Tekanan, Intonasi, dan Jeda; Jeda Mengubah Makna', 'Bahasa Indonesia', 'al14.pdf', 0, '574,51 Kbytes', '16/12/2012 16:41:36');
INSERT INTO `t_download` VALUES (2, 'Prakondisi Terbentuknya Identitas Kebangsaan', 'Usaha-usaha Prakondisi agar dapat  Terbentuk Identitas Kebangsaan', 'PKn', 'al15.pdf', 0, '364,08 Kbytes', '16/12/2012 15:45:37');
INSERT INTO `t_download` VALUES (3, 'Tool Dasar Photoshop 7', 'Adobe Photoshop 7.0 menyediakan tool-tool yang terintegrasi dan tertata secara praktis untuk menciptakan dan menghasilkan karya dalam bentuk vektor dan teks yang sempurna. Bentuk grafik yang berdasarkan vektor dan teks bisa ditransfer menjadi image yang berdasarkan pixel untuk mendapatkan efek desain yang lebih sempurna. Pada tulisan ini akan diulas secara mendetail bagaimana cara menguasai adobe photoshop7.0. Disertai dengan banyak gambar dan contoh, sehingga mudah dimengerti.\r\nPenulis: Eko Purwanto\r\nPublisher: IlmuKomputer.Com', 'T I K', 'al7.zip', 1, '594,35 Kbytes', '12/07/2006 20:00:32');
INSERT INTO `t_download` VALUES (4, 'Wawasan Kebangsaan', 'Meteri tentang wawasan yang dikembangkan untuk menjaga keutuhan Negara Kesatuan Republik Indonesia', 'PKn', 'al14.pdf', 0, '186,13 Kbytes', '16/12/2012 15:37:51');
INSERT INTO `t_download` VALUES (15, 'Membaca Cepat Untuk Permulaan', 'Materi tentang : Teknik Pemindaian (Scanning); Teknik Pelayapan (Skimming); Manfaat Membaca Cepat', 'Bahasa Indonesia', 'al15.pdf', 0, '361,66 Kbytes', '16/12/2012 16:44:22');
INSERT INTO `t_download` VALUES (17, 'Expressing Possibility', 'Modul ini berisikan ungkapan tentang kemungkinan dalam bahasa Inggris.', 'Bahasa Inggris', 'al17.doc', 0, '101,37 Kbytes', '16/12/2012 16:47:55');
INSERT INTO `t_download` VALUES (16, 'Asking for and Giving Permission', 'Materi tentang berbagai macam ungkapan cara meminta dan memberi ijin.', 'Bahasa Inggris', 'al16.doc', 0, '122,88 Kbytes', '16/12/2012 16:46:39');
INSERT INTO `t_download` VALUES (19, 'Pembacaan Masalah Mekanik', 'Materi tentang tujuh besaran pokok berikut satuannya', 'Fisika', 'al19.pdf', 0, '460,13 Kbytes', '16/12/2012 16:56:09');
INSERT INTO `t_download` VALUES (18, 'Sistem Satuan dan Pengukuran', 'Materi tentang pengukuran suatu\r\nbesaran beserta satuannya.', 'Fisika', 'al18.pdf', 0, '715,23 Kbytes', '16/12/2012 16:52:24');

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

INSERT INTO `t_galeri` VALUES (16, 'Praktek Kompetensi Keahlian Teknik Audio Video', 4);
INSERT INTO `t_galeri` VALUES (17, 'Praktek Kompetensi Keahlian Permesinan', 4);
INSERT INTO `t_galeri` VALUES (18, 'Praktek Kompetensi Keahlian Permesinan', 4);
INSERT INTO `t_galeri` VALUES (19, 'Praktek Kompetensi Keahlian Teknik Gambar Bangunan', 4);
INSERT INTO `t_galeri` VALUES (20, 'Praktek Kompetensi Keahlian Teknik Audio Video', 4);
INSERT INTO `t_galeri` VALUES (21, 'Praktek Kompetensi Keahlian Teknik Gambar Bangunan', 4);
INSERT INTO `t_galeri` VALUES (22, 'Praktek Kompetensi Keahlian Teknik Komputer & Jaringan', 4);
INSERT INTO `t_galeri` VALUES (23, 'Praktek Kompetensi Keahlian Teknik Komputer & Jaringan', 4);

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

INSERT INTO `t_galerialbum` VALUES (4, 'Pembelajaran Produktif di SMK', '15-12-2012');

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

INSERT INTO `t_gambaratas` VALUES (7, 'gambar1', 'jpg');
INSERT INTO `t_gambaratas` VALUES (8, 'gambar2', 'jpg');

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

INSERT INTO `t_info` VALUES (5, '<p style="text-align: center;"><strong><span class="berita"><img src="../userfiles/image/Snap1.jpg" alt="" /><br /> </span></strong></p>\r\n<p style="text-align: center;"><strong><span class="berita"><img src="../userfiles/image/Snap2.jpg" alt="" /></span></strong></p>\r\n<p>&nbsp;</p>', 'Ujian Akhir Semester 1 Tahun 2012-2013', '16/12/2012');
INSERT INTO `t_info` VALUES (6, '<p>Penerimaan raport (Laporan Hasil Belajar) Semester 1 Tahun Pelajaran 2012-2013 dijadwalkan pada hari Sabtu tanggal 22 Desember 2012. Raport langsung diterimakan kepada siswa oleh wali kelas di ruang kelasnya masing-masing pada jam 09.00 WIB.</p>\r\n<p>Liburan semester 1 ini mulai tanggal 23 Desember 2012 sampai dengan 1 Januari 2013. Sekolah berharap siswa dapat menggunakan hari libur untuk diisi dengan kegiatan-kegiatan yang bermanfaat.</p>', 'Penerimaan Raport Semester 1 Tahun 2012-2013', '16/12/2012');

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
  `tingkat` varchar(3) collate latin1_general_ci default NULL,
  `program` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`kelas`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `t_kelas`
-- 

INSERT INTO `t_kelas` VALUES ('X O 1', '400001001', '1', 'Otomotif');
INSERT INTO `t_kelas` VALUES ('X O 2', '131805943', '1', 'Otomotif');
INSERT INTO `t_kelas` VALUES ('XI O 1', '130896744', '2', 'Otomotif');
INSERT INTO `t_kelas` VALUES ('XI O 2', '400001001', '2', 'Otomotif');
INSERT INTO `t_kelas` VALUES ('XII O 1', '132126005', '3', 'Otomotif');
INSERT INTO `t_kelas` VALUES ('XII O 2', '130889465', '3', 'Otomotif');
INSERT INTO `t_kelas` VALUES ('X L 1', '132068645', '1', 'Listrik');
INSERT INTO `t_kelas` VALUES ('X L 2', '132122047', '1', 'Listrik');
INSERT INTO `t_kelas` VALUES ('XI L 1', '132086211', '2', 'Listrik');
INSERT INTO `t_kelas` VALUES ('XI L 2', '132108283', '2', 'Listrik');
INSERT INTO `t_kelas` VALUES ('XII L 1', '132108312', '3', 'Listrik');
INSERT INTO `t_kelas` VALUES ('XII L 2', '131975019', '3', 'Listrik');
INSERT INTO `t_kelas` VALUES ('X BSN 1', '132108298', '1', 'Busana');
INSERT INTO `t_kelas` VALUES ('X BSN 2', '131630516', '1', 'Busana');
INSERT INTO `t_kelas` VALUES ('XI BSN 1', '132122049', '2', 'Busana');
INSERT INTO `t_kelas` VALUES ('XI BSN 2', '131813622', '2', 'Busana');
INSERT INTO `t_kelas` VALUES ('XII BSN 1', '400001002', '3', 'Busana');
INSERT INTO `t_kelas` VALUES ('XII BSN 2', '400001003', '3', 'Busana');
INSERT INTO `t_kelas` VALUES ('X TKJ 1', '132105436', '1', 'TKJ');
INSERT INTO `t_kelas` VALUES ('X TKJ 2', '131975072', '1', 'TKJ');
INSERT INTO `t_kelas` VALUES ('XI TKJ 1', '131286221', '2', 'TKJ');
INSERT INTO `t_kelas` VALUES ('XI TKJ 2', '131850412', '2', 'TKJ');
INSERT INTO `t_kelas` VALUES ('XII TKJ 1', '132122031', '3', 'TKJ');
INSERT INTO `t_kelas` VALUES ('XII TKJ 2', '131683538', '3', 'TKJ');
INSERT INTO `t_kelas` VALUES ('X MM 1', '12345677', '1', 'MM');
INSERT INTO `t_kelas` VALUES ('X MM 2', '12345678', '1', 'MM');
INSERT INTO `t_kelas` VALUES ('XI MM 1', '12345679', '2', 'MM');
INSERT INTO `t_kelas` VALUES ('XI MM 2', '12345680', '2', 'MM');
INSERT INTO `t_kelas` VALUES ('XII MM 1', '12345680', '3', 'MM');
INSERT INTO `t_kelas` VALUES ('XII MM 2', '12345681', '3', 'MM');

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

INSERT INTO `t_member` VALUES (2, 'Dody Firmansyah', '01-01-1983', 'm', 'Guru', 'Jl. Kol Enjo Martadisastra No.15 Bogor', 'Ind', '081317579751', 'SMK Negeri 1 Bogor', 'www.kickdody.com', 'Web Programming, 3 Dimensi dan Visual Efek', 'kickdody', 'e10adc3949ba59abbe56e057f20f883e', 'kickdody@yahoo.com', '1', 'aa', '2', '1', '2009-10-29 22:22:47', '400001002', '-', 'Guru', '0', 1, 103, '0', 41, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (1, 'BAYU ALI AKBAR', '03-02-1993', 'm', 'Siswa', 'Jl. Bojongkokosan No.24 Antapani Bandung2', 'Ind', '32423423', 'SMA NEGERI 4 BANDUNG', 'bayu.wordpress.com', 'saya adalah .....', '070810120', 'e10adc3949ba59abbe56e057f20f883e', 'alan@alanrm.net', '2', '123456', '1', '1', '2011-04-28 21:01:26', '070810120', 'X - 4', 'Siswa', '1', 7, 823, '0', 174, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (3, 'Alan Ridwan M', '01-01-1995', 'm', 'Guru', 'Jl. Bojongkokosan No.24 Antapani Bandung', 'Ind', '085624070482', 'SMA NEGERI 4 BANDUNG', 'www.alanrm.com', 'Web Programming', 'alan', '894a9b94bcc5969b60bd18e8ea9c0ddc', 'alanrm82@yahoo.com', '1', 'a', '3', '1', '2012-06-14 01:05:01', '400001001', 'undefined', 'Guru', '1', 7, 256, '0', 115, '127.0.0.1', 'open', '');
INSERT INTO `t_member` VALUES (7, 'Drs. Choirul Anam, S.ST', '01-01-1995', 'm', 'Guru', 'Jl. Tenggiri X/1 Minomartani, Sleman Yogyakarta.', 'ID', '08121563213', 'SMK YAPPI Wonosari', 'www.choirulyogya.wordpress.com', '-', 'choirulyogya', 'e10adc3949ba59abbe56e057f20f883e', 'choirulyogya@yahoo.com', '1', '1', '3', '1', '2009-10-29 22:25:25', '196105221984031005', '-', 'Guru', '0', 1, 4, '0', 3, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (8, 'Warjana, S.Pd', '01-01-1995', 'm', 'Guru', 'Jl. Perum Taman Sedayu Blok B 12 A Bantul Yogyakarta', 'ID', '08157915641', 'SMK Negeri 2 Yogyakarta', 'www.warjana.wordpress.com', '-', 'wardjana', 'e10adc3949ba59abbe56e057f20f883e', 'wardjana@yahoo.com', '1', '1', '1', '1', '2009-10-29 22:26:15', '196605202006041001', '-', 'Guru', '0', 1, 2, '0', 1, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (10, 'Yulianto Sri Utomo, S.Kom', '01-01-1995', 'm', '', 'Jl. Bimo martani ngemplak Yogyakarta', 'ID', '085697111588', '', '', '', 'tomi', 'e10adc3949ba59abbe56e057f20f883e', 'yulianto_sri_utomo@yahoo.com', '1', '1', '0', '1', '2009-10-29 22:28:14', '400001004', '-', 'Guru', '0', 1, 3, '0', 2, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (4, 'Taufik N. Syah, S.Pd', '01-01-1995', 'm', 'Guru', 'Komplek Timah Jl. Margasatwa, Pondok Labu Jakarta Selatan ', 'ID', '08881869114', 'SMKN 41 Jakarta', '-', 'SMKN 41 Jakarta', 'taufik', 'e10adc3949ba59abbe56e057f20f883e', 'taufikns@cbn.net.id', '1', '1', '3', '1', '2009-10-29 22:21:37', '400001003', '-', 'Guru', '0', 1, 4, '0', 3, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (12, 'Agung Purnomo', '01-01-1995', 'm', 'Guru', 'Bandung', 'ID', '-', '-', '-', '-', 'alumni', 'e10adc3949ba59abbe56e057f20f883e', 'root23it@yahoo.co.id', '1', '1', '1', '1', '2009-10-29 22:40:20', '', '2008', 'Alumni', '0', 1, 3, '0', 2, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (5, 'Siswanto, S.Pd', '01-01-1995', 'm', 'Guru', 'Jl. Kapi anala 4 Malang', 'ID', '081233081768', 'SMA Negeri 10 Malang', 'www.tesdigital.com', 'siswanto-mlg@telkom.net', 'siswanto', 'e10adc3949ba59abbe56e057f20f883e', 'siswanto-mlg@telkom.net', '1', '1', '0', '1', '2009-10-29 22:21:11', '196805181995121004', '-', 'Guru', '0', 1, 3, '0', 2, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (9, 'Drs.Sutarno, M.Pd', '01-01-1995', 'm', 'Guru', '-', 'Ind', '-', 'SMA NEGERI 4 JAKARTA', '-', '-', 'kepsek', '5d2c2cee8ab0b9a36bd1ed7196bd6c4a', 'cs_muasa@yahoo.com', '1', '1', '4', '1', '2009-10-29 22:40:03', '131853696', '2007', 'Alumni', '0', 1, 9, '0', 8, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (6, 'Wuryanta', '01-01-1995', 'm', 'Guru', 'Jl. Saluyu Indah XVII No 140 Riung Bandung', 'ID', '081320454229', 'SMA Negeri 4 Bandung', '-', '-', 'masjava', 'e10adc3949ba59abbe56e057f20f883e', 'mas_java2@yahoo.com', '1', '1', '3', '1', '2009-10-29 22:20:46', '196504281989121001', '-', 'Guru', '0', 1, 5, '0', 4, '127.0.0.1', 'open', NULL);
INSERT INTO `t_member` VALUES (11, 'Hafidz Muksin', '01-01-1995', 'm', '-', '-', 'ID', '-', '-', '-', '-', 'hafidz', 'e10adc3949ba59abbe56e057f20f883e', 'aa@aa.com', '1', '1', '1', '1', '2009-10-29 22:34:07', '05061005', '2009', 'Alumni', '0', 1, 3, '0', 2, '127.0.0.1', 'open', NULL);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=34 ;

-- 
-- Dumping data for table `t_news`
-- 

INSERT INTO `t_news` VALUES (26, '<p>TEMPO.CO, Solo - Mobil Esemka laris manis selama pameran Esemka di Solo Techno Park, Surakarta. Sudah ratusan orang mengisi formulir pesanan mobil jenis Sport Utility Vehicle (SUV) dan pick up itu. "Selama pameran Esemka di Solo Techno Park, ada 500-an formulir pemesanan yang diisi," kata Humas PT Solo Manufaktur Kreasi, Dwi Budi Martono, di sela pameran, Senin, 12 November 2012.<br /><br />Ada sebagian calon pembeli yang langsung menghubungi Direktur PT SMK Sulistyo Rabono atau penanggung jawab produksi Joko Sutrisno untuk memesan Esemka Rajawali atau Bima. Menurut Sulistyo, total ada sekitar 2.000 unit Esemka yang sudah dipesan. "Pemesan sudah komitmen untuk menyerahkan uang tanda jadi Rp 2 juta," ujarnya.<br /><br />Selain tanda jadi, pemesan harus menyerahkan uang muka minimal 30 persen dari harga mobil. Sulistyo mengatakan harga jual Esemka Rajawali Rp 130-140 juta, sedangkan Esemka Bima tidak lebih dari Rp 80 juta. Dia menjanjikan inden mobil Esemka paling lama 6 bulan. "Kuartal pertama 2013, assembling line sudah selesai. Kemudian pada bulan ke-6, mobil sudah bisa diterima konsumen," katanya.<br /><br />Rencananya produksi dilakukan di Solo Techno Park dan di tempat rekanan PT SMK di Cikarang, Bekasi. Untuk tahap awal, kapasitas produksi diperkirakan 10-20 unit per bulan. Nantinya kapasitas produksi akan ditingkatkan hingga menjadi minimal 200 unit per bulan. <br /><br />Selain itu, ada rencana membangun pabrik perakitan di sekitar Solo. Saat PT SMK tengah mengincar lahan seluas 10 hektare di Boyolali. Jika lancar, ditargetkan pabrik perakitan di Boyolali bisa dibangun awal 2013 untuk membantu meningkatkan kapasitas produksi Esemka secara keseluruhan.<br /><br />Sulistyo mengatakan, sebagian pemesan adalah kalangan pengusaha kecil menengah dan koperasi. Harga Esemka yang relatif terjangkau memungkinkan pengusaha kalangan ini mendapatkan mobil operasional untuk usaha.<br /><br />UKKY PRIMARTANTYO&nbsp;</p>', 'Mobil Esemka Sudah Dipesan 2.000 Unit ', '3', '21:42:24', '12/15/2012', NULL);
INSERT INTO `t_news` VALUES (27, '<p>Intel, sebuah perusahaan yang berpusat di negeri Paman Sam, Amerika Serikat merupakan sebuah perusahaan multinasional yang bergerak dibidang rancangan dan produksi mikroprosesor. Perusahaan yang didirikan pada tahun 1968 ini juga membuat chipset, komponen, kartu jaringan, serta produk-produk lainnya. Mungkin sobat sudah sering melihat logo Intel pada laptop maupun notebook sobat dengan seri prosesornya. Pada tahun 2011, Intel telah merilis beberapa prosesor terbaru mereka untuk generasi terbaru dari prosesor Core 2 Duo, Dual Core, Core i3, Core i5, dll. Dan kali ini, pada tahun 2012 nanti, Intel berencana merilis beberapa model prosesor yang menggunakan teknologi fabrikasi 22nm dari varian Ivy Bridge pada bulan April tahun 2012.<br /><br />Beberapa model prosesor yang akan diluncurkan meliputi prosesor untuk komputer desktop atau PC, notebook, laptop, serta ultrabook. Kabar perilisan model prosesor terbaru ini datang dari bocoran informasi dari salah seorang sumber yang bekerja di perusahaan perakit personal computer (PC) asal Taiwan. Selain prosesor, Intel juga akan merilis sebuah cip untuk komputer desktop, seperti Z77, H77, Z75, dan B75. Untuk cip seri Q77 dan Q75, kabarnya Intel baru akan merilisnya pada bulan Mei tahun depan. Sedangkan cip yang dkhususkan untuk notebook yang kabarnya akan dirilis pada bulan April tahun depan yaitu HM77, UM77, HM76, HM75, serta QS77 dan QM77 yang rencananya akan diluncurkan pada bulan Mei.</p>', 'Prosesor Terbaru Intel di Tahun 2012 ', '3', '21:53:39', '12/15/2012', NULL);
INSERT INTO `t_news` VALUES (28, '<p>Indonesia diprediksi akan memiliki gedung tertinggi kelima dunia setinggi 600 meter yang rampung 2017. Gedung ini akan dibangun di Sudirman Central Business District (SCBD), Jakarta.<br /><br />Proyek pembangunan gedung tertinggi masih terus dirancang. Gedung yang berada di kawasan bisnis terpadu SCBD Jakarta itu nantinya akan diberi nama Signature Tower direncanakan akan selesai dan beroperasi pada 2017. Demikian keterangan PT Danayasa Arthatama Tbk., dalam laporan keuangan 2011 di Jakarta (6/5).<br /><br />Signature Tower rencananya akan dibangun pada Lot 6 dan 7 di SCBD, Jakarta. Gedung ini dirancang setinggi 600 meter lebih dengan jumlah 111 lantai. Signature Tower akan merebut rekor menara tertinggi Indonesia yang saat ini dipegang Wisma 46 setinggi 262 meter.<br /><br />Arpin Wiradisastra, Direktur Utama PT Danayasa Arthatama, Tbk., mengungkapkan pada saat ini perusahaan masih dalam tahap perencanaan pengembangan konsep desain awal gedung Signature Tower. &ldquo;Nantinya Signature Tower memiliki 111 lantai,&rdquo; jelasnya.<br /><br />Lokasi Signature Tower berada di Lot 6 yang kini masih berdiri bangunan Automall. Automall merupakan tempat penjualan mobil dan motor mewah. Namun kini gedung ini telah kosong, dan nampak tidak ada aktivitas.<br /><br />Rencananya&nbsp; Signature Tower ini akan dijadikan kawasan&nbsp; mixed-use yang terdiri dari perkantoran dan hotel. Diatasnya akan ada observatory untuk para pengunjung sama halnya seperti gedung-gedung 100 lantai lainnya di dunia.<br /><br />Signature Tower berada di urutan kelima gedung tertinggi di 2020 versi The Council on Tall Buildings and Urban Habitat yang dirilis belum lama ini. Dalam daftar mereka, gedung tertinggi di tanah air diapit oleh Seoul Light DMC Tower dengan tinggi 640 meter di posisi ketiga, dan Shanghai Tower dengan tinggi 632 meter di posisi keempat.<br /><br />Haryanto</p>', 'Gedung Tertinggi di Indonesia Rampung 2017', '3', '22:07:51', '12/15/2012', 1);
INSERT INTO `t_news` VALUES (29, '<p>Metrotvnews.com, Surabaya: PT Jasa Marga akan menambah jalan tol baru rte Gempol-Pasuruan-Grati, Jawa Timur. Hal tersebut dikatakan Direktur Utama PT Transmarga Jatim, Hengki Herwanto, di sela-sela acara penandatanganan kontrak pembangunan jalan dengan tiga perusahaan.<br /><br />Pembangunannya dibagi dalam tiga sesi. PT Transmarga Jatim, anak perusahaan Jasa Marga, membangun sesi pertama dari Gempol-Rembang sepanjang 13,3 Km mulai awal Januari 2013. Dana investasinya sebesar Rp547 miliar.<br /><br />Selanjutnya PT Adhi Karya melanjutkan pembangunan fisik dan konsultan supervisi dengan nilai kontrak Rp299 miliar, PT Waskita sebesar Rp234 miliar, dan PT Multi Phi Beta Jo senilai Rp13 miliar.<br /><br />Menurut Hengki, pembangunan jalan memasuki proses pembebasan tanah yang baru mencapai 80 persen. Bila tak ada hambatan, katanya, jalan tol dapat segera dioperasikan.<br /><br />Jalan tol Gempol-Pasuruan seksi 1 merupakan bagian dari rangkaian jalur sepanjang 34,15 Km yang membentang dari Gempol ke Pasuruan. Seluruh pengerjaannya diperkirakan memakan waktu hingga tiga tahun.<br /><br />Seksi 2 dimulai dari titik rembang industri dan berakhir di Pasuruan. Sedangkan seksi 3 dari Kota Pasuruan menuju Kecamatan Grati, Kabupaten Pasuruan.<br /><br />Total dana pembangunan jalan tol itu sekitar Rp2,7 triliun dengan komposisi 30 persen modal Jasa Marga. Sisa modal berasal dari sindikasi Bank Jatim. Bank Mandiri, BNI, dan BRI.<br /><br />Sementara itu, Direktur PT Jasa Marga Adityawarman mengatakan akan menambah sembilan ruas jalan tol baru di Indonesia. Sehingga, Jasa Marga mengelola seribu kilometer jalan tol di Indonesia.<br /><br />Selain itu, katanya, Jasa Marga tertarik dengan proyek jalan tol tengah Surabaya menuju Tanjung Perak. Namun, Jasa Marga masih melakukan proses akuisisi.(Itong Suyanto/RRN)</p>', 'Pembangunan Tol Gempol-Pasuruan-Grati Dimulai Januari 2013', '3', '22:17:29', '12/15/2012', NULL);
INSERT INTO `t_news` VALUES (30, '<p>TRIBUNJOGJA.COM, SOLO - PT Kereta Api Indonesia (KAI) Daops VI Yogyakarta memberi sinyal positif mengenai pengoperasian kembali Sepur Kluthuk Jaladara di Kota Solo. Wakil Kepala PT KAI Daops VI Yogyakarta, Sri Astuti memungkinkan pengoperasian kereta api uap kuno tersebut pada awal tahun 2013 mendatang. "Diharapkan tahun 2013 bisa dijalankan," katanya akhir pekan ini di Solo.<br /><br />Pengadaan kereta wisata di Kota Solo tersebut atas kerjasama Pemerintah Kota (Pemkot) Solo dengan PT KAI. Pengoperasian kereta uap tersebut dihentikan sejak Oktober 2012 lalu seiring selesainya masa perjanjian kerjasama antara kedua belah pihak. Pemkot Solo telah mengajukan perpanjangan kerjasama sejak Juli 2012, namun sampai saat ini belum mendapat jawaban dari PT KAI.<br /><br />Astuti menjelaskan, sedianya kereta tersebut telah direncanakan kembali dioperasikan pada bulan Januari 2013. Namun, karena terjadi kerusakan pada lokomotif kereta, pihaknya memutuskan untuk menunda pengoperasian untuk memperbaiki kerusakan sekaligus melakukan pengecekan kondisi kereta api secara keseluruhan. "Sekarang perbaikan dan pengecekan sedang digarap. Diharapkan Februari 2013 sudah bisa beroperasi," katanya.<br /><br />Selain itu, pihaknya juga akan membahas ulang kontrak kerjasama PT KAI dengan Pemkot Solo, di antaranya yakni membahas biaya sewa kereta tersebut. Tarif ideal sewa kereta uap tersebut dalam satu kali perjalanan yakni Rp 5 juta. "Tidak bisa semuanya dibebankan kepada konsumen. Nanti akan kita bahas selisih dari biaya ini siapa yang menanggung," jelasnya.(*)</p>', 'Sepur Jaladara Beroperasi Lagi di Awal Tahun 2013', '3', '22:24:01', '12/15/2012', NULL);
INSERT INTO `t_news` VALUES (31, '<p>TRIBUN-MEDAN.com, Pendidikan menengah kejuruan berbasis seni atau kerajinan berpotensi mengembangkan industri kreatif di daerah. SMKN 5 Mataram membuktikannya dengan menciptakan tren batik di Nusa Tenggara Barat, yang dikenal dengan nama batik Sasambo. Ester Lince Napitupulu<br /><br />Batik Sasambo menggali desain dari seni, budaya, tradisi, kuliner, hingga alam dari tiga suku di Nusa Tenggara Barat (NTB), yakni Sasak, Samawa (Sumbawa), dan Mbojo (Bima). Batik yang didesain dan diproduksi guru serta siswa SMKN 5 Mataram sejak tahun 2008 ini dikenal dengan nama batik Sasambo.<br /><br />Motif batik Sasambo yang pertama adalah kangkung, sayuran yang menjadi makanan khas NTB. Motif lain yang diminati adalah lumbung, rumah adat Lombok, bebele (tanaman Ginkgo biloba), dan biota laut.<br /><br />Keseriusan SMKN 5 Mataram memproduksi batik Sasambo tampak dari galeri di sekolah yang diresmikan Gubernur NTB pada April 2010. Galeri buka selama Senin-Sabtu dan tak pernah sepi pengunjung, baik penduduk lokal maupun wisatawan.<br /><br />Di ruang galeri berukuran 13 meter x 23 meter itu terpajang beragam motif, bentuk, dan ukuran kain batik Sasambo, baik batik tulis, cap, maupun printing. Harga batik Sasambo bervariasi, dari Rp 60.000 per meter untuk batik printing hingga Rp 300.000 per helai ukuran 2 meter x 1,15 meter untuk batik tulis.<br /><br />&rdquo;Dulu, pendidikan SMK seni dan kriya hanya berkutat di tataran akademik sehingga pamornya turun dibandingkan otomotif ataupun teknik informatika dan komunikasi,&rdquo; kata Tri Budi Ananto, Kepala SMKN 5 Mataram. Sekolah lantas berupaya mengembangkan industri kreatif lewat batik Sasambo.<br /><br />Perkembangan bisnis dan produksi batik Sasambo SMKN 5 Mataram meningkat, termasuk pemesanannya. Batik itu jadi suvenir yang sering direkomendasikan kepada wisatawan.<br /><br />Para pejabat di NTB, mulai dari gubernur, wali kota, hingga pimpinan dinas, menghadiahi tamu mereka dengan batik Sasambo. Batik Sasambo SMKN 5 Mataram pernah dipakai Presiden Susilo Bambang Yudhoyono, Wakil Presiden Boediono, serta Menteri Pendidikan dan Kebudayaan saat kunjungan kerja ke wilayah NTB.<br /><br />Asyar Suharno, Wakil Kepala SMKN 5 Mataram Bidang Hubungan Industri dan Masyarakat, memaparkan, dukungan untuk mengembangkan batik Sasambo karya SMKN 5 Mataram datang dari Wali Kota Mataram. Ada surat edaran kepada semua dinas di Mataram agar pegawai menggunakan seragam batik Sasambo.<br /><br />Ajakan berpameran di tingkat kota, provinsi, hingga nasional menjadi ajang memamerkan batik Sasambo. Promosi lewat pameran dan dari mulut ke mulut membuat batik Sasambo makin dikenal luas.<br /><br />Salmah, Ketua Kompetensi Keahlian Kriya Tekstil SMKN 5 Mataram, menyebutkan, ada 300 motif yang diproduksi.<br /><br />Pengembangan desain menjadi tanggung jawab guru. Namun, para siswa dirangsang untuk mengembangkan motif batik yang menarik masyarakat.<br /><br />Wiwi Endang Sridwiyatmi, Wakil Kepala SMKN 5 Mataram Bidang Kurikulum, mengatakan, dalam mengembangkan produksi batik Sasambo, sekolah tidak melupakan pembelajaran bagi siswa. Sekolah melibatkan siswa untuk mengasah jiwa kewirausahaannya.<br /><br />Pendapatan dari bisnis batik Sasambo lebih dari Rp 200 juta per tahun digunakan untuk tambahan anggaran pendapatan dan belanja sekolah. Dengan suntikan dana itu, sekolah membantu 62 persen siswa tidak mampu. &rdquo;Dana rutin dari pemerintah daerah hanya sekitar Rp 95 juta per tahun. Biaya operasional sekolah, termasuk membeli bahan praktik, membayar guru honor, dan pengeluaran lain, lebih dari itu. Pendapatan dari batik Sasambo sangat membantu,&rdquo; ujar Tri.<br /><br />Ajak alumni<br /><br />Peningkatan permintaan batik Sasambo membuat sekolah kewalahan. Sekolah tidak bisa hanya mengandalkan siswa.<br /><br />Sekolah mempekerjakan 26 alumnus yang dinilai memenuhi syarat. Mereka bekerja di bengkel tekstil enam hari per minggu. Jika Minggu diminta masuk, dihitung lembur. Para alumnus diperlakukan sebagai pekerja profesional dengan gaji dari ratusan ribu rupiah hingga Rp 2 juta per bulan.<br /><br />&rdquo;Dengan menggandeng alumni, kami tidak perlu lama melatih. Mereka memproduksi batik secara rutin supaya ada stok batik di galeri,&rdquo; kata Salmah.<br /><br />Bagi alumni, lapangan kerja di sekolah membuat mereka lega. &rdquo;Senang, begitu lulus bisa kerja meski kerjanya di sekolah. Ini menambah pengalaman kerja. Saya berharap pesanan meningkat supaya kami bisa terus bekerja,&rdquo; ujar Yuliana (19), alumnus tahun 2012.<br /><br />Selain mempekerjakan alumni, kadang-kadang sekolah menggandeng sejumlah perempuan di sekitar sekolah yang membutuhkan pekerjaan. Pengerjaan batik bisa dilakukan para ibu rumah tangga di rumah.<br /><br />Sekolah berencana meningkatkan fasilitas ruangan produksi agar dapat meningkatkan jumlah produksi. Selain itu, mereka juga akan mengembangkan pemasaran ke luar NTB.<br /><br />Kemampuan SMKN 5 Mataram menjadikan sekolah sebagai sentra batik Sasambo membuat sekolah ini digandeng banyak pihak untuk pelatihan batik. Para guru diminta melatih perajin dan anak-anak putus sekolah. Sebaliknya, untuk meningkatkan kemampuan, pemerintah setempat membiayai enam siswa mengikuti pelatihan tekstil batik di Yogyakarta.<br /><br />Kerajinan lain<br /><br />Di antara ratusan batik Sasambo siap pakai, pengunjung galeri bisa menikmati hasil kerajinan lain karya siswa. Sesuai dengan program keahlian di SMKN 5 Mataram, siswa mengembangkan kriya kulit, kayu, keramik, dan logam.<br /><br />Siswa program kriya kayu sering mendapat permintaan untuk membuat furnitur, plakat kayu dengan sentuhan motif tradisional, atau membuat akar kayu menjadi karya seni yang menarik, seperti meja atau benda seni lain. Kerajinan kayu cukil serta ornamen kulit kerang mutiara di furnitur kayu yang dikerjakan siswa juga diminati.<br /><br />Program keahlian kriya keramik mampu mengembangkan kreativitas siswa. Sekolah ini pernah digandeng perusahaan keramik yang memasok kebutuhan hotel-hotel di sekitar Lombok.<br /><br />Permintaan pelatihan keramik juga dilayani sekolah. Pemerintah daerah menggandeng sekolah untuk membantu perajin gerabah mengembangkan desain dan motif baru hingga mengenalkan teknologi pengolahan dan pembakaran keramik yang lebih efektif.<br /><br />Permintaan tenaga untuk mendesain dan membuat perhiasan juga cukup potensial karena ada pusat-pusat perhiasan mutiara, seperti di Sekarbela, Mataram, Lombok.<br /><br />Dalam hal kriya kulit, para siswa mampu mendesain beragam kerajinan, seperti sepatu, tas, ikat pinggang, dompet, dan barang-barang lain dari kulit.<br /><br />Sekolah memanfaatkan potensi kriya yang dipelajari di sekolah untuk menunjukkan kepada masyarakat bahwa industri kreatif layak dilirik. Dengan demikian, NTB yang memiliki potensi wisata mendapat dukungan sumber daya manusia dan kreativitas, yang siap meraih kemajuan dan kesejahteraan dari keunikan di daerah terkait.<br /><br />Editor : Raden Armand Firdaus<br />Sumber : Kompas.com</p>', 'SMK Mengembangkan Industri Kreatif Batik', '3', '22:32:15', '12/15/2012', NULL);
INSERT INTO `t_news` VALUES (32, '<p>SURABAYA -Peringatan 100 Tahun ormas Islam Muhammadiyah diwarnai dengan peluncuran Mobil Tenaga Surya hasil karya Siswa-siswa SMK Muhammadiyah 7 Gondanglegi, Malang. Mobil tersebut diberi nama ''Smart Education Hybrid Solar Car''.<br /><br />Kepala Sekolah SMKM 7 Malang, Pahri&nbsp; mengatakan, mobil tenaga Surya ini memang sengaja dibuat yang dipersembahkan untuk Muhammadiyah. Total biaya yang dikeluarkan dari awal penelitian hingga selesai produksi mencapai Rp246 Juta.<br /><br />"Karena ini masih pertama sehingga sering salah dan kami terus melakukan perbaikan dan pembenahan membuat mobil tenaga Surya ini, meski hasilnya belum sempurana," ujar Pahri saat peluncuran Mobil Tenaga Surya ini di SD Muhammadiyah 4 Surabaya, Jum''at (2/11/2012) bersama Ketua Umum PP Muhammadiyah Din Syamsudin.<br /><br />Ia menjelaskan, awal pembuatan mobil ini dilakukan pada 12 Februari 2011 lalu. Sehingga untuk unit ini membutuhkan waktu sekitar 20 bulan. Mobil ini memiliki panjang 3,5 Meter dengan lebar 1,7 meter dan tinggi 1,6 Meter. Dan memiliki berat kosong 600 kilogram.<br /><br />Ia juga mengatakan, mobil ini murni menggunakan tenaga matahari. Cara kerjanya, panas dari matahari diserap dan tersimpan oleh kondensator yang disalurkan ke aki. Sehingga jika dalam kondisi mendung, tetap mampu jalan karena masih ada cadangan tenaga di dalam aki.<br /><br />Mobil dengan kapasistas dua penumpang ini memiliki Photovoltaic sebanyak 4 unit dengan tegangan 48 volt, arus peak power 3,5 ampere dan daya peak power 168 Watt.<br /><br />Perlu diketahui, sel photovoltaic, adalah sebuah alat semikonduktor mampu menciptakan cahaya matahari menjadi&nbsp; energi listrik yang berguna. Pengubahan ini disebut efek photovoltaic.<br /><br />"Kekuatannya mampu mencapai 12 jam perjalanan, atau untuk Surabaya ke Malang pulang pergi masih cukup kalau memiliki cadangan tenaga penuh," jelasnya.<br /><br />Pahri berharap, mobil ini mampu diproduksi secara massal dan menjadi perhatian khusus bagi pemerintah pusat dan sekaligus dapat dijadikan sebagai mobil nasional. Tentunya juga siap melalui sejumlah tahapan sertifikasi layak.<br /><br />"Ini buah karya anak bangsa yang sangat luar biasa dan semoga mendapat apresiasi," tuntasnya. (ian)</p>\r\n<p>Nurul Arifin - Okezone</p>', 'SMK Muhammadiyah 7 Malang, Luncurkan Mobil Tenaga Surya', '3', '22:38:00', '12/15/2012', NULL);
INSERT INTO `t_news` VALUES (25, '<p>TEMPO.CO, Jakarta - Pengembangan Kurikulum 2013 dilakukan empat tahap. Pertama, penyusunan kurikulum di internal Kementerian Pendidikan dan Kebudayaan (Kemdikbud), melibatkan pakar dan praktisi pendidikan. Kedua, pemaparan desain Kurikulum 2013 kepada Wakil Presiden selaku Ketua Komite Pendidikan, Selasa (13/11) dan Komisi X DPR RI Kamis (22/11). Ketiga, uji publik guna menyerap&nbsp; tanggapan masyarakat, lewat kurikulum2013. kemdikbud.go.id dan media massa cetak. Keempat, penyempurnaan untuk menjadi Kurikulum 2013. Orientasi Kurikulum 2013 adalah peningkatan dan keseimbangan antara kompetensi sikap, keterampilan dan pengetahuan, sesuai standar nasional yang disepakati. Alasan pengembangan Kurikulum 2013 adalah pembelajaran dari siswa diberi tahu menjadi pencari tahu; penilaian dari berbasis output menjadi berbasis proses dan output yang butuh tambahan jam pelajaran; banyak negara menambah jam pelajaran; dan jam pelajaran di Indonesia relatif lebih singkat.&nbsp; Inti pengembangan Kurikulum 2013, penyederhanaan, dan tematik-integratif. Siswa didorong lebih baik dalam observasi, bertanya, bernalar dan mengkomunikasikan materi pembelajaran. Diharapkan siswa memiliki kompetensi sikap, keterampilan, dan pengetahuan yang jauh lebih baik untuk menghadapi tantangan zaman.</p>', 'Pengembangan Kurikulum 2013', '3', '21:30:55', '12/15/2012', 1);

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

INSERT INTO `t_pelajaran` VALUES ('AGAMA', 1, 'Pend. Agama', 'Pend. Agama', 'Otomotif');
INSERT INTO `t_pelajaran` VALUES ('PKN', 2, 'Pend. Kewarganegaraan', 'PKn', 'Otomotif');
INSERT INTO `t_pelajaran` VALUES ('IPA', 3, 'IPA', 'IPA', 'Otomotif');
INSERT INTO `t_pelajaran` VALUES ('BHSING', 4, 'Bahasa Inggris', 'Bahasa Inggris', 'Otomotif');
INSERT INTO `t_pelajaran` VALUES ('MTKOTO', 5, 'Matematika', 'Matematika', 'Otomotif');
INSERT INTO `t_pelajaran` VALUES ('PENJAS', 6, 'Pend. Jasmani', 'Penjaskes', 'Otomotif');
INSERT INTO `t_pelajaran` VALUES ('PRODMM', 7, 'Produktif MM', 'Produktif MM', 'MM');
INSERT INTO `t_pelajaran` VALUES ('BHSINDO', 8, 'Bahasa Indonesia', 'Bahasa Indonesia', 'Otomotif');
INSERT INTO `t_pelajaran` VALUES ('SENI', 9, 'Seni Budaya', 'Seni Budaya', 'Otomotif');
INSERT INTO `t_pelajaran` VALUES ('BHSJAWA', 10, 'Bahasa Jawa', 'Bahasa Jawa', 'Otomotif');
INSERT INTO `t_pelajaran` VALUES ('FISOTO', 11, 'Fisika', 'Fisika', 'Otomotif');
INSERT INTO `t_pelajaran` VALUES ('KIM', 12, 'Kimia', 'Kimia', 'Otomotif');
INSERT INTO `t_pelajaran` VALUES ('IPS', 13, 'IPS', 'IPS', 'Otomotif');
INSERT INTO `t_pelajaran` VALUES ('TIK', 14, 'Tek. Informasi & Komunikasi', 'T I K', '-');
INSERT INTO `t_pelajaran` VALUES ('PRODOTO1', 15, 'Produktif otomotif', 'Produktif Otomotif', 'Otomotif');
INSERT INTO `t_pelajaran` VALUES ('PRODTKJ', 16, 'Produktif TKJ', 'Produktif TKJ', 'TKJ');
INSERT INTO `t_pelajaran` VALUES ('PRODBUS', 17, 'Produktif Busana', 'Produktif Busana', 'Busana');
INSERT INTO `t_pelajaran` VALUES ('KEWI', 18, 'Kewirausahaan', 'Kewirausahaan', 'Otomotif');
INSERT INTO `t_pelajaran` VALUES ('KKPI', 19, 'KKPI', 'KKPI', 'Otomotif');
INSERT INTO `t_pelajaran` VALUES ('PRODLIST', 20, 'Produktif Listrik', 'Produktif Listrik', 'Listrik');

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
INSERT INTO `t_pesan_alum` VALUES (16, 'alan', 'Control Panel atau Web Manager merupakan tool yang paling popular untuk mengelola website Anda. Dengan adanya Control Panel, Anda tidak perlu menggunakan metode manual lagi untuk mengelola website Anda. Anda juga tidak perlu lagi menghubungi staff kami untuk pembuatan alamat email baru, subdomain, backup, pembuatan database baru, pergantian password FTP/Control Panel dan sebagainya. Semuanya dapat Anda lakukan sendiri dengan login ke Control Panel kami. ', '2009-07-21 22:40:35');
INSERT INTO `t_pesan_alum` VALUES (17, 'Alan Ridwan M', '<p>\r\n	coba</p>\r\n', '2009-10-19 00:02:08');
INSERT INTO `t_pesan_alum` VALUES (18, 'Alan Ridwan M', '<p>\r\n	drfg sd fsdf</p>\r\n', '2009-10-19 00:02:29');
INSERT INTO `t_pesan_alum` VALUES (19, 'Alan Ridwan M', '<p>dssd sf sdf</p>', '2011-03-25 21:04:43');

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

INSERT INTO `t_prestasi` VALUES (1, 'Juara Futsal ', 'Team Futsal  SMK Cinta Indonesia meraih Juara II Lomba Futsal tingkat Sekolah Menegah Tingkat Provinsi');
INSERT INTO `t_prestasi` VALUES (2, 'Juara 1 Lomba Cerdas Cermat', 'Juara 1 Lomba Cerdas Cermat AIDS Tingkat Kota dalam Acara AIDS Sedunia');

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

INSERT INTO `t_profil` VALUES (9, 'PROFIL', '<table border="0" align="left">\r\n<tbody>\r\n<tr>\r\n<td><img style="float: left; margin: 3px 2px; border: 1px solid black;" src="../userfiles/image/kepsek.jpg" alt="" width="129" height="152" /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>Era globalisasi dengan segala implikasinya menjadi salah satu pemicu cepatnya perubahan yang terjadi pada berbagai aspek kehidupan masyarakat, termasuk dalam penyediaan tenaga kerja trampil pada dunia kerja. Dalam hal ini dunia pendidikan, khususnya SMK CINTA INDONESIA mempunyai tanggung jawab yang besar dalam menyiapkan sumber daya manusia yang tangguh sehingga mampu hidup selaras didalam perubahan teknologi. Dalam masa kepemimpinan Drs. Sutrisna, SMK CINTA INDONESIA bertekad memberikan pelayanan pendidikan yang terbaik bagi siswa-siswanya. Semua perkembangan teknologi dicoba untuk diikuti dan diberikan kepada siswa sehingga lulusannya diharapkan mampu beradaptasi dengan dunia kerja sesuai dengan jurusannya.</p>', 0, 0, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (21, 'OSIS', '<p>&nbsp;</p>\r\n<div style="text-align: center;"><strong>OSIS SMK CINTA INDONESIA<br /></strong></div>\r\n<div style="text-align: center;">&nbsp;</div>\r\n<div style="text-align: justify;">OSIS (Organisasi Siswa Intra Sekolah) adalah suatu organisasi yang berada di tingkat sekolah di Indonesia yang dimulai dari&nbsp; SMP, SMA, dan SMK. OSIS diurus dan dikelola oleh siswa yang terpilih untuk menjadi pengurus OSIS. Biasanya organisasi ini memiliki seorang pembimbing seorang guru yang dipilih oleh pihak sekolah.<br /> <br /> Anggota OSIS adalah seluruh siswa yang berada pada satu sekolah tempat OSIS itu berada. Seluruh anggota OSIS berhak untuk memilih calonnya untuk kemudian menjadi pengurus OSIS.</div>\r\n<div style="text-align: center;">&nbsp;</div>\r\n<div style="text-align: center;"><strong>STRUKTUR KEPENGURUSAN OSIS SMK CINTA INDONESIA MASA BHAKTI 2012/2013 adalah:<br /></strong></div>\r\n<p>&nbsp;</p>\r\n<p>Ketua OSIS : Gia Haryza&nbsp;</p>\r\n<p>Wakil Ketua OSIS 1 : M. Isyraqi El-hakim&nbsp;</p>\r\n<p>Wakil Ketua OSIS 2 : Yunan Ahmad Taufik</p>\r\n<p>&nbsp;</p>\r\n<p>Sekretaris Umum : Hanifah&nbsp;</p>\r\n<p>Sekretaris 1 : Ridho Agung Nugraha&nbsp;</p>\r\n<p>Sekretaris 2 : Afriani Naidza Nurdianti</p>\r\n<p>&nbsp;</p>\r\n<p>Bendahara Umum : Ginar Amalia Hidayati</p>\r\n<p>Bendahara 1 : Ria Maria Nurhayati</p>\r\n<p>Bendahara 2 : Nada Fathia Mutiara</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Sie. Ketaqwaan Terhadap Tuhan YME</strong></p>\r\n<p>Ketua : Galih Ahmad Abdullah</p>\r\n<p>Wakil : Syauqi Nur Alifan Zaelani</p>\r\n<p>Anggota : Nilam Mustikaning Nagari - Faizah Aulia Rahmah</p>\r\n<p>&nbsp;&nbsp;</p>\r\n<p><strong>Sie. Wawasan Keilmuan</strong></p>\r\n<p>Ketua : Aulia Arip Rakhman</p>\r\n<p>Wakil : Mohammad Gilang Santika</p>\r\n<p>Anggota : Arie Permana Putra- Rivan Ardyanto Sutoyo - Nursyifa Kamilia</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Sie. Wawasan Kebangsaan</strong></p>\r\n<p>Ketua : Egie Sofyan Nuddin</p>\r\n<p>Wakil : Rashidah Noor Amalia</p>\r\n<p>Anggota : Meliana Lestari - Fransiska Paulina Kaha</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Sie. Kepribadian Budi Pekerti Luhur dan Kehidupan Berbangsa</strong></p>\r\n<p>Ketua : Muhamad Lukman Rusyana</p>\r\n<p>Wakil : Denantia Puriandini Winaya</p>\r\n<p>Anggota : Ambar Ratih Sahra -&nbsp; Maulana Rizky Putra</p>\r\n<p><strong><br /> </strong></p>\r\n<p><strong>Sie. Keterampilan dan Kewirausahaan</strong></p>\r\n<p>Ketua : Iqbal Ramadhan Zahid</p>\r\n<p>Wakil : Larasitha Nunis</p>\r\n<p>Anggota : Sofie Tsaurah Islami&nbsp;&nbsp; - Fitrias Rahayu Ramdhani</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Sie. Organisasi, Kepemimpinan, dan Demokrasi</strong></p>\r\n<p>Ketua : Freysha Intan Yulitasari</p>\r\n<p>Wakil : Nugraha Yanureza R.</p>\r\n<p>Anggota : Radithya Aldi Pradhana - Citra Riansyah</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Sie. Apresiasi , Budaya , dan Daya Kreasi</strong></p>\r\n<p>Ketua : Aditya Purna Nugraha</p>\r\n<p>Wakil : Syahdini Handiani</p>\r\n<p>Anggota : Ratifika Dewi Irianto - Reynald Aditya Utomo</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Sie. Kesehatan Jasmani</strong></p>\r\n<p>Ketua : Elmus Rahma</p>\r\n<p>Wakil : Wiriadiningrat</p>\r\n<p>Anggota : Tiara Pasca Noviera Robaeni - Lutfi Ahmad&nbsp;</p>\r\n<p>&nbsp;</p>', 4, 4, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (11, 'Visi dan Misi', '<p><strong>Visi :</strong><br /> Mewujudkan Sumber Daya Manusia yang Berakhlak Mulia yang Mampu Bersaing Dalam Dunia Kerja Secara Global</p>\r\n<p><strong>Misi :</strong></p>\r\n<ol>\r\n<li>Menciptakan suasana yang kondusif untuk mengembangkan potensi siswa melalui penekanan pada penguasaan kompetensi bidang ilmu pengetahuan dan teknologi serta Bahasa Inggris.</li>\r\n<li>Meningkatkan penguasaan Bahasa Inggris sebagai alat komunikasi dan alat untuk mempelajari pengetahuan yang lebih luas.</li>\r\n<li>Meningkatkan frekuensi dan&nbsp; kualitas kegiatan siswa yang lebih menekankan pada pengembangan ilmu pengetahuan dan teknologi serta keimanan dan ketakwaan yang menunjang proses belajar mengajar dan menumbuhkembangkan disiplin pribadi siswa.</li>\r\n<li>Menumbuhkembangkan nilai-nilai ketuhanan dan nilai-nilai kehidupan yang bersifat universal dan mengintegrasikannya dalam kehidupan</li>\r\n<li>Menerapkan manajemen partisipatif dengan melibatkan seluruh warga sekolah, Lembaga Swadaya Masyarakat, stake holders dan instansi serta institusi pendukung pendidikan lainnya.</li>\r\n</ol>\r\n<p align="center">&nbsp;</p>\r\n<p><strong>Tujuan</strong> :</p>\r\n<ul>\r\n<li>Tahun 2014 siswa memiliki kompetensi penguasaan konsep untuk seluruh mata pelajaran secara komprehensif dan benar sehingga mampu berkompetisi ditingkat nasional dan tahun 2012 mampu berkompetisi di tingkat internasional</li>\r\n<li>Tahun 2014 siswa mampu menggunakan Bahasa Inggris sebagai alat komunikasi untuk mendapatkan pengetahuan yang lebih luas</li>\r\n<li>Tahun 2014 siswa mampu membangun kebiasaan yang aktif untuk mencari informasi menggunakan teknologi informasi.</li>\r\n<li>Tahun 2014 sekolah memiliki sarana dan prasarana penunjang PBM yang lengkap.</li>\r\n<li>Tahun 2014 sekolah memiliki guru dan tenaga pendukung yang handal untuk mendukung seluruh manajemen sekolah.</li>\r\n<li>Sekolah memiliki hubungan kemitraan yang baik dengan seluruh warga sekolah, <em>stake holders</em> dan instansi serta institusi pendukung pendidikan lainnya.</li>\r\n<li>Siswa memiliki, mengaplikasikan dan meningkatkan nilai-nilai ketuhanan serta nilai-nilai kehidupan yang bersifat universal dalam kehidupannya.</li>\r\n</ul>', 1, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (50, 'test 1', '<p>sdf s</p>', 1, 49, '', 0, '_self');
INSERT INTO `t_profil` VALUES (12, 'Sejarah Singkat', '<p>Pada awal berdirinya, sekolah ini bernama Sekolah Teknologi Menengah Parki yang berbantuan sebagai sekolah&nbsp; swasta yang beralamat di Jalan Senayan. Pada tanggal 1 Agustus 1950, Pemerintah melalui Dinas Pendidikan dan Kebudayaan mengubah nama dan status STM Parki menjadi STM Senayan.<br /> <br /> Pada tahun pelajaran 1966/1967 sekolah tersebut berganti nama. STM Senayan menjadi STM Cinta Indonesia.<br /> <br /> Sejak saat itu pergantian pimpinan sekolah dapat diurutkan sebagai berikut :</p>\r\n<ol>\r\n<li>Tahun 1969 dipimpin oleh Bapak R.K. Supriatna</li>\r\n<li>Tahun 1974 dipimpin oleh Ibu Dra. Sukartini</li>\r\n<li>Tahun 1985 dipimpin oleh Bapak Drs. Hamid</li>\r\n<li>Tahun 1994 dipimpin oleh Bapak Drs. Muslihat</li>\r\n<li>Tahun 1999 dipimpin oleh Bapak Drs. Solichini</li>\r\n<li>Tahun 2002 dipimpin oleh Ibu Dra. Komariah</li>\r\n<li>Tanggal 31 Maret 2008 dipimpin oleh Bapak Drs. Sutrisna, M.Pd. hingga sekarang.</li>\r\n</ol>', 2, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (13, 'Program Kerja', '<p><strong>Program Unggulan<br />\r\n</strong><br />\r\n&nbsp;&nbsp; 1. Menjadi Sekolah Standar Nasional (SSN)<br />\r\n&nbsp;&nbsp; 2. Mengembangkan Sikap dan Kompetensi Keagamaan<br />\r\n&nbsp;&nbsp; 3. Mengembangkan Potensi Siswa Berbasis Multiple Intelligance<br />\r\n&nbsp;&nbsp; 4. Mengembangkan Budaya daerah<br />\r\n&nbsp;&nbsp; 5. Mengembangkan Kemampuan bahasa dan Teknologi Informasi<br />\r\n&nbsp;&nbsp; 6. Meningkatkan Daya serap Ke Dunia Kerja<br />\r\n<br />\r\n<strong>Program Pengembangan Sarana Prioritas</strong><br />\r\n<br />\r\n&nbsp;&nbsp; 1. Membangun 5 Ruang kelas Belajar dengan konstruksi bangunan 3 tingkat<br />\r\n&nbsp;&nbsp; 2. Membangun 1 ruang Belajar di lantai 2 gedung lama<br />\r\n&nbsp;&nbsp; 3. Membangun Ruang Lab Praktek 3 buah<br />\r\n&nbsp;&nbsp; 4. Pembangunan Kantin Siswa<br />\r\n&nbsp;&nbsp; 5. Perbaikan dan Pengecetan Lapangan Olah Raga<br />\r\n&nbsp;&nbsp; 6. Pengembangan Jaringan Infrastruktur LAN (Intranet dan Internet)<br />\r\n&nbsp;&nbsp; 7. Pengembangan Sistem Informasi Sekolah (SIS)<br />\r\n&nbsp;&nbsp; 8. Melengkapi Sarana dan Prasarana Perpustakaan dan Lab Komputer<br />\r\n&nbsp;&nbsp; 9. Renovasi Aula<br />\r\n&nbsp; 10. Renovasi Tampilan Depan Skolah/Gerbang Sekolah<br />\r\n&nbsp; 11. Melengkapi alat praktek</p>', 8, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (14, 'Kepala Sekolah', '<h4 style="text-align: center;"><img title="Drs. Sutrisna" src="../userfiles/image/kepsek.jpg" alt="Drs. Sutrisna" width="255" height="300" /></h4>\r\n<p><strong>Drs. Sutrisna, M.Pd.</strong> &nbsp;adalah kepala SMK Cinta Indonesia yang ke 16 sejak berdirinya sekolah ini pada tahun 1956. Lahir di Ciamis pada tahun 1964. Menghabiskan masa kecil sampai selesai tingkat SLTA di Ciamis. Jurusan Kimia IKIP membawanya menjadi seorang sarjana Kimia pada tahun 1988. Magister Manajemen Pendidikan diselesaikannya pada tahun 2003 di Universitas Islam Nusantara.</p>\r\n<p><strong>Drs. Sutrisna, M.Pd.</strong> mengawali karirnya di dunia pendidikan pada tahun 1989&nbsp;menjadi Guru Kimia. Dan pada tahun 2002 diangkat menjadi Kepala SMA Negeri hingga tahun 2005, selanjutnya menjadi Kepala SMK Negeri 13 sampai tahun 2008. dan pada tahun itu pula diangkat menjadi Kepala SMK Cinta Indonesia yang kita cintai ini, tepatnya pada tanggal 17 Maret 2008 melalui SK Walikota nomor xx/1126.7 BKD/2008</p>', 6, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (15, 'Struktur Organisasi', '<p align="center"><img alt="" src="../userfiles/image/Snap9.jpg" /></p>', 5, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (16, 'Prestasi', '<h3 align="center">PRESTASI SMK Cinta Indonesia<br />\r\nPERIODE 2007 s/d 2012</h3>\r\n<ul>\r\n    <li>Juara Umum Olimpiade Sains (IMO, IPHO, IBO, ICHO, Informatika dan Astronomi) Tingkat Kabupaten Tahun 2007</li>\r\n    <li>Juara 1 Karya Ilmiah Remaja Tingkat Provinsi Tahun 2007.</li>\r\n    <li>Juara III Karya Ilmiah Remaja Tingkat Nasional tahun 2008.</li>\r\n    <li>Juara I Siswa Teladan/Berprestasi Tingkat Provinsi tahun 2008.</li>\r\n    <li>Juara I LKS Bidang Otomotif Tingkat Provinsi tahun 2009.</li>\r\n    <li>Juara III LKS Bidang Otomotif Tingkat Nasional tahun 2009.</li>\r\n    <li>Juara II Lomba Paskribaka Tingkat Provinsi tahun 2011.</li>\r\n    <li>Juara I Lomba Sekolah Sehat Tingkat Provinsi tahun 2012.</li>\r\n</ul>', 11, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (18, 'Kemitraan', '<ol>\r\n    <li>Teacher Clearing House dengan SMA Negeri 5.  Merupakan kerjasama antar guru mata pelajaran untuk peningkatan kualitas guru  dan pembelajaran. Dilaksanakan melalui media komunikasi telepon dan internet.</li>\r\n    <li>Clearing House dengan The Manor CE Primary School  South Gloucestershire, UK. Satu kerjasama yang diprakarsai oleh Depdiknas dan  British Council untuk peningkatan kualitas pendidikan.</li>\r\n    <li>PT Astra Motor Jakarta, dalam bidang pelaksanaan Praktek Industri dan penyaluran lulusan</li>\r\n    <li>PT Krakatau Stell Cilegon, dalam bidang pelaksanaan Praktek Industri dan penyaluran lulusan</li>\r\n    <li>PT Kramayuda, dalam bidang pelaksanaan Praktek Industri dan penyaluran lulusan</li>\r\n    <li>PT Busana Indah Garment, dalam bidang pelaksanaan Praktek Industri dan penyaluran lulusan</li>\r\n</ol>', 7, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (19, 'Kondisi Siswa', '<table border="1" width="61%" align=center>\r\n	<tr>\r\n		<td width="46" align="center">No</td>\r\n		<td width="179" align="center">Kelas</td>\r\n		<td width="108" align="center">Laki-laki</td>\r\n		<td width="111" align="center">Perempuan</td>\r\n		<td align="center">Jumlah</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="46" align="center">1.</td>\r\n		<td width="179">&nbsp;X Otomotif</td>\r\n		<td width="108" align="center">70</td>\r\n		<td width="111" align="center">2</td>\r\n		<td align="center">72</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="46" align="center">2.</td>\r\n		<td width="179">&nbsp;X Listrik</td>\r\n		<td width="108" align="center">65</td>\r\n		<td width="111" align="center">3</td>\r\n		<td align="center">68</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="46" align="center">3.</td>\r\n		<td width="179">&nbsp;X Busana</td>\r\n		<td width="108" align="center">5</td>\r\n		<td width="111" align="center">60</td>\r\n		<td align="center">65</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="46" align="center">4.</td>\r\n		<td width="179">&nbsp;X T K J</td>\r\n		<td width="108" align="center">35</td>\r\n		<td width="111" align="center">30</td>\r\n		<td align="center">65</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="46" align="center">5.</td>\r\n		<td width="179">&nbsp;X M M</td>\r\n		<td width="108" align="center">32</td>\r\n		<td width="111" align="center">32</td>\r\n		<td align="center">64</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="46" align="center">6.</td>\r\n		<td width="179">&nbsp;XI Otomotif</td>\r\n		<td width="108" align="center">65</td>\r\n		<td width="111" align="center">5</td>\r\n		<td align="center">70</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="46" align="center">7.</td>\r\n		<td width="179">&nbsp;XI Listrik</td>\r\n		<td width="108" align="center">60</td>\r\n		<td width="111" align="center">2</td>\r\n		<td align="center">62</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="46" align="center">8.</td>\r\n		<td width="179">&nbsp;XI Busana</td>\r\n		<td width="108" align="center">5</td>\r\n		<td width="111" align="center">65</td>\r\n		<td align="center">70</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="46" align="center">9.</td>\r\n		<td width="179">&nbsp;XI T K J</td>\r\n		<td width="108" align="center">32</td>\r\n		<td width="111" align="center">30</td>\r\n		<td align="center">62</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="46" align="center">10.</td>\r\n		<td width="179">&nbsp;XI M M</td>\r\n		<td width="108" align="center">30</td>\r\n		<td width="111" align="center">29</td>\r\n		<td align="center">59</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="46" align="center">11.</td>\r\n		<td width="179">&nbsp;XII Otomotif</td>\r\n		<td width="108" align="center">65</td>\r\n		<td width="111" align="center">1</td>\r\n		<td align="center">66</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="46" align="center">12.</td>\r\n		<td width="179">&nbsp;XII Listrik</td>\r\n		<td width="108" align="center">58</td>\r\n		<td width="111" align="center">2</td>\r\n		<td align="center">60</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="46" align="center">13.</td>\r\n		<td width="179">&nbsp;XII Busana</td>\r\n		<td width="108" align="center">2</td>\r\n		<td width="111" align="center">64</td>\r\n		<td align="center">66</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="46" align="center">14.</td>\r\n		<td width="179">&nbsp;XII T K J</td>\r\n		<td width="108" align="center">32</td>\r\n		<td width="111" align="center">28</td>\r\n		<td align="center">60</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="46" align="center">15</td>\r\n		<td width="179">&nbsp;XII M M</td>\r\n		<td width="108" align="center">34</td>\r\n		<td width="111" align="center">28</td>\r\n		<td align="center">62</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="225" colspan="2">\r\n		<p align="center">Jumlah</td>\r\n		<td width="108" align="center">585</td>\r\n		<td width="111" align="center">386</td>\r\n		<td align="center">971</td>\r\n	</tr>\r\n</table>', 9, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (22, 'Komite Sekolah', '<p>Semenjak diluncurkannya konsep Manajemen Peningkatan Mutu Berbasis Sekolah dalam sistem manajemen sekolah, Komite Sekolah sebagai organisasi mitra sekolah memiliki peran yang sangat strategis dalam upaya turut serta mengembangkan pendidikan di sekolah. Kehadirannya tidak hanya sekedar sebagai stempel sekolah semata, khususnya dalam upaya memungut biaya dari orang tua siswa, namun lebih jauh Komite Sekolah harus dapat menjadi sebuah organisasi yang benar-benar dapat mewadahi dan menyalurkan aspirasi serta prakarsa dari masyarakat dalam melahirkan kebijakan operasional dan program pendidikan di sekolah serta dapat menciptakan suasana dan kondisi transparan, akuntabel, dan demokratis dalam penyelenggaraan dan pelayanan pendidikan yang bermutu di sekolah.</p>\r\n<p style="text-align: justify;">Agar Komite Sekolah dapat berdaya, maka dalam pembentukan pengurus pun harus dapat memenuhi beberapa prinsip/kaidah dan mekanisme yang benar, serta dapat dikelola secara benar pula. Susunan pengurus Komite Sekolah adalah sebagai berikut:<br></p>\r\n<table border="0 " width="378" align=center>\r\n	<tr>\r\n		<td width="103">Ketua 1</td>\r\n		<td width="7">:</td>\r\n		<td>Drs. H. Suparlan, M.Pd</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="103">Ketua 2</td>\r\n		<td width="7">:</td>\r\n		<td>Ir. Sukoco</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="103">Sekretaris 1</td>\r\n		<td width="7">:</td>\r\n		<td>Dra. Susiyanti</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="103">Sekretaris 2</td>\r\n		<td width="7">:</td>\r\n		<td>Sukamto, SH</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="103">Bendahara 1</td>\r\n		<td width="7">:</td>\r\n		<td>Kartini, SE</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="103">Bendahara 2</td>\r\n		<td width="7">:</td>\r\n		<td>Hamid Awaludin</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="103" height="26">Anggota 1</td>\r\n		<td width="7" height="26">:</td>\r\n		<td height="26">Sukamdani, SE</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="103">Anggota 2</td>\r\n		<td width="7">:</td>\r\n		<td>H. Parto </td>\r\n	</tr>\r\n	<tr>\r\n		<td width="103">Anggota 3</td>\r\n		<td width="7">:</td>\r\n		<td>Hj. Sukartilah</td>\r\n	</tr>\r\n	<tr>\r\n		<td width="103">Anggota 4</td>\r\n		<td width="7">:</td>\r\n		<td>Sunardi</td>\r\n	</tr>\r\n	</table>\r\n', 10, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (23, 'Prestasi Guru', '<ol>\r\n<li>Inovasi Pembelajaran 2007 IV V Depdiknas</li>\r\n<li>Keratifitas mengajar 2007 II V LIPI</li>\r\n<li>Lomba Keberhasilan Guru dalam pembelajaran 2008 IV V Depdiknas</li>\r\n<li>Lomba Keberhasilan Guru dalam pembelajaran 2008 Harapan III V Depdiknas</li>\r\n<li>Sutarto Wasit Terbaik 2009 3 V KONI DKI</li>\r\n<li>Sugeng, S.Pd Lomba Keberhasilan Guru dalam pembelajaran 2009 Finalis V Depdiknas</li>\r\n<li>Mahfud Ali, S.Pd Guru Berprestasi SMK 2009 III V Dinas P &amp; K Provinsi</li>\r\n<li>Bahar S. Lomba Keberhasilan Guru dalam pembelajaran 2010 Finalis V JSIT</li>\r\n</ol>', 5, 3, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (24, 'Beasiswa', '<p><span class="gen"><span class="storytitle"><strong><span>Beasiswa yang ada di SMK CINTA INDONESIA adalah:<br /></span></strong></span></span></p>\r\n<p><strong>1. Beasiswa Program Peningkatan Akademik (PPA)&nbsp;</strong> <br />Beasiswa Program Peningkatan Akademik (PPA) ini diberikan kepada siswa/siswi SMK CINTA INDONESIA yang memiliki peringkat terbaik di masing masing program keahlian/jurusan. Beasiswa PPA ini diberikan setiap 1 semester sekali, dengan nominal Rp. 325.000 - Rp. 225.000 / siswa.<br /><br /><strong>2. Beasiswa Bantuan Khusus Murid (BKM) </strong><br />Beasiswa ini berasal dari Pemerintah yang diberikan kepada siswa / siswi yang berada pada keluarga yang kurang mampu secara ekonomi. <br /><br /><strong>3. Beasiswa Bantuan Walikota</strong> <br />Beasiswa ini diberikan sebagai wujud komitmen Walikota terhadap kelangsungan pendidikan masyarakat Kota.</p>', 5, 4, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (25, 'Ektrakurikuler', '<p>Kualitas tamatan sekolah kejuruan dituntut untuk memenuhi standar kompetensi dunia kerja. Salah satunya, selain mampu menguasai materi pelajaran, siswa harus dapat berinteraksi dan aktif dalam hubungan sosial.</p>\r\n<p>Kegiatan ekstrakurikuler merupakan salah satu alat pengenalan siswa pada hubungan sosial. Di dalamnya terdapat pendidikan pengenalan diri dan pengembangan kemampuan selain pemahaman materi pelajaran.</p>\r\n<p>Berangkat dari pemikiran tersebut, di SMK Cinta Indonesia diselenggarakan berbagai kegiatan ekstrakurikuler.</p>\r\n<p>Selain OSIS sebagai induk kegiatan ektrakurikuler di sekolah, kegiatan ektrakurikuler lainnya adalah:</p>\r\n<ul>\r\n<li>Pramuka</li>\r\n<li>Paskibra</li>\r\n<li>Palang Merah Remaja (PMR)</li>\r\n<li>Patroli Keamanan Sekolah (PKS)</li>\r\n<li>Pecinta Alam (PA)</li>\r\n<li>Olahraga (Bola Voli, Bola Basket, Karate, Tenis Meja, Tenis Lapangan)</li>\r\n<li>Kerohanian / IRMA (Ikatan Remaja Mesjid Al-Forqon), dan</li>\r\n<li>Koperasi Sekolah (Kopsis)</li>\r\n</ul>', 3, 4, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (20, 'Kalender Akademik', '<center>\r\n<p><img title="-" src="../userfiles/image/kalender%20pendidikan%201%202012-2013.jpg" alt="-" width="566" height="371" /></p>\r\n<p><img title="-" src="../userfiles/image/kalender%20pendidikan%202%202012-2013.jpg" alt="-" width="566" height="371" /></p>\r\n<p><img src="../userfiles/image/kalender%20pendidikan%203%202012-2013.jpg" alt="" width="574" height="424" /></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;<img src="../userfiles/image/kalender%20pendidikan%204%202012-2013.jpg" alt="" width="655" height="101" /></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n</center>', 6, 3, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (17, 'Sarana & Prasarana', '<table border="1" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td><a href="../images/denah24.jpg" target="_blank"><img src="../images/denah24.jpg" alt="" width="540" height="400" /></a></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><br /><br /></p>\r\n<p><strong>Keterangan </strong></p>\r\n<table style="width: 100%;" border="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top" width="120">1. Kls X O<br /> 2. Kls X L<br /> 3. Kls X BSN<br /> 4. Kls X TKJ<br /> 5. Kls X MM<br /> 6. Kls XI O<br /> 7. Kls XI L<br /> 8. Kls XI BSN<br /> 9. Kls XI TKJ<br /> 10. Kls XI MM<br /> 11. Kls XII O<br /> 12. Kls XII L<br /> 13. Kls XII BSN<br /> 14. Kls XII TKJ<br /> 15. Kls XII MM</td>\r\n<td valign="top" width="120">16. Lab Komp 1<br /> 17. Perpustakan/ Warnet<br /> 18. Lab Komp 2<br /> 19. Lab Otomotif<br /> 20. Lab Listrik<br /> 21. Lab Busana<br /> 22. Lab Multimedia<br /> 23. Lab TKJ<br /> 24. R. Kepsek<br /> 25. R. Tata Usaha<br /> 26. R. Lobi<br /> 27. R. Guru<br /> 28. R. OSIS<br /> 29. R. PMR<br /> 30. R. BK/BP</td>\r\n<td>31. R. Piket<br /> 32. R.Pramuka/Paskibra<br /> 33. R.Kapela/Bianglala<br /> 34. Gudang<br /> 35. Masjid<br /> 36. R. DKM<br /> 37. R. Satpam<br /> 38. R. UKS<br /> 39. Padepokan Seni<br /> 40. GreenHouse<br /> 41. Parkir<br /> 42. Mushala Guru<br /> 43. WC Guru<br /> 44. R. Cetak<br /> 45. R. Wakasek<br /> 46. Dapur</td>\r\n<td>47. WC Guru<br /> 48. WC Laki-laki<br /> 49. WC Perempuan<br /> 50. Koperasi<br /> 51. Kantin<br /> 52. WC Perempuan<br /> 53. WC Laki-laki<br /> 54. G. Olahraga<br /> 55. Gudang Listrik<br /> 56. Gudang Otomotif<br /> 57. Gudang TIK<br /> 58. R. EC<br /> 59. Panggung Terbuka<br /> 60. Lap. Olahraga<br /> 61. R. Server <br /> 62. R. KPMP TIK</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><br /> <br /> <strong>Arsitektur Jaringan Komputer</strong></p>\r\n<table border="1" cellspacing="0" cellpadding="0" align="left">\r\n<tbody>\r\n<tr>\r\n<td><a href="../images/lan24.jpg" target="_blank"><img src="../images/lan24.jpg" alt="" width="540" height="380" /></a></td>\r\n</tr>\r\n</tbody>\r\n</table>', 3, 2, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (10, 'Lokasi Sekolah', '<center><a href="../images/peta1.jpg" target="_blank"><img src="../images/peta1.jpg" width="400" height="320" id=gambar ></a></center>\r\n<br>', 0, 0, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (26, 'Peta Situs', '<p><strong>Peta Situs Utama</strong></p>\r\n<p><strong>Profil</strong></p>\r\n<ol>\r\n    <li><a href=profil.php?id=profil&kode=4>Sejarah Singkat</a></li>\r\n    <li><a href=profil.php?id=profil&kode=3>Visi dan Misi</a></li>\r\n    <li><a href=profil.php?id=profil&kode=7>Struktur Organisasi</a></li>\r\n    <li><a href=profil.php?id=profil&kode=5>Program Kerja</a></li>\r\n    <li><a href=profil.php?id=profil&kode=11>Kemitraan</a></li>\r\n    <li><a href=profil.php?id=profil&kode=9>Sarana & Prasarana</a></li>\r\n    <li><a href=profil.php?id=profil&kode=12>Kondisi Siswa</a></li>\r\n    <li><a href=profil.php?id=profil&kode=6>Kepala Sekolah</a></li>\r\n    <li><a href=profil.php?id=profil&kode=8>Prestasi</a></li>\r\n    <li><a href=profil.php?id=profil&kode=21>Komite Sekolah</a></li>\r\n    <li><a href=profil.php?id=profil&kode=34>Kontak Sekolah</a></li>\r\n</ol>\r\n<p><strong><br />\r\nGuru</strong></p>\r\n<ol>\r\n    <li><a href=guru.php?id=dbguru>Direktori Guru</a></li>\r\n    <li><a href=guru.php?id=silabus>Silabus</a></li>\r\n    <li><a href=guru.php?id=materi>Materi Ajar</a></li>\r\n    <li><a href=guru.php?id=soal>Materi Evaluasi</a></li>\r\n    <li><a href=guru.php?id=profil&kode=14>Kalender Akademik</a></li>\r\n    <li><a href=guru.php?id=profil&kode=23>Prestasi Guru</a></li>\r\n</ol>\r\n<p><strong><br />\r\nSiswa</strong></p>\r\n<ol>\r\n    <li><a href=siswa.php?id=dbsiswa>Direktori Siswa</a></li>\r\n    <li><a href=siswa.php?id=prestasi>Prestasi Siswa</a></li>\r\n    <li><a href=siswa.php?id=profil&kode=24>Beasiswa</a></li>\r\n    <li><a href=siswa.php?id=profil&kode=24>OSIS</a></li>\r\n    <li><a href=siswa.php?id=profil&kode=25>Ektrakurikuler</a></li>\r\n</ol>\r\n<p><br />\r\n<strong>Alumni</strong></p>\r\n<ol>\r\n    <li><a href=alumni.php?id=data>Direktori Alumni</a></li>\r\n    <li><a href=alumni.php?id=info>Info Alumni</a></li>\r\n</ol>\r\n<p><strong><br />\r\nFitur</strong></p>\r\n<ol>\r\n    <li><a href=index.php?id=agenda>Agenda</a></li>\r\n    <li><a href=index.php?id=artikel>Artikel</a></li>\r\n    <li><a href=index.php?id=info>Info</a></li>\r\n    <li><a href=index.php?id=berita>Berita</a></li>\r\n    <li><a href=index.php?id=buku>Buku Tamu</a></li>\r\n    <li><a href=index.php?id=project>Opini</a></li>\r\n    <li><a href=index.php?id=dafblog>Daftar Blog</a></li>\r\n    <li><a href=index.php?id=link>Link</a></li>\r\n    <li><a href=index.php?id=galeri>Galeri Photo</a></li>\r\n</ol>\r\n<p><strong>Peta Situs Komunitas Sekolah</strong> (Member)</p>\r\n<ol>\r\n    <li><a href=../user/index.php?id=myprofil>Profil Member</a></li>\r\n    <li><a href=../user/index.php?id=conlist>Data Kontak</a></li>\r\n    <li><a href=../user/index.php?id=member>Anggota</a></li>\r\n    <li><a href=../user/index.php?id=message>Pesan</a></li>\r\n    <li><a href=../user/index.php?id=cek_login#>Chat</a></li>\r\n    <li><a href=../user/index.php?id=myproject>Opini</a></li>\r\n    <li><a href=../user/index.php?id=forum>Diskusi</a></li>\r\n    <li><a href=../user/index.php?id=infoalumni>Info Alumni</a></li>\r\n    <li><a href=../user/guru.php?id=materi>Materi Ajar</a></li>\r\n</ol>', 10, 6, '0', 0, '_self');
INSERT INTO `t_profil` VALUES (27, 'Kontak Sekolah', '<p>&nbsp;</p>\r\n<center><a href="../images/peta1.jpg" target="_blank"><img src="../images/peta1.jpg" alt="" width="300" height="200" /></a><br />\r\n<p><strong>SMK CINTA INDONESIA</strong></p>\r\n<p>Alamat: Jl. Senayan, Sudirman, Jakarta, 12000, Indonesia</p>\r\n<p>Telepon: +62-021-6666666</p>\r\n<p>Fax: + 62-021-6666667</p>\r\n<p>Email: info@smkcintaindonesia.sch.id</p>\r\n<p>Web: www.smkcintaindonesia.sch.id</p>\r\n<p>Administrator:&nbsp;admin@smkcintaindonesia.sch.id</p>\r\n</center>', 11, 6, '0', 0, '_self');
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

INSERT INTO `t_programahli` VALUES (1, 'Otomotif');
INSERT INTO `t_programahli` VALUES (2, 'Listrik');
INSERT INTO `t_programahli` VALUES (3, 'Busana');
INSERT INTO `t_programahli` VALUES (4, 'TKJ');
INSERT INTO `t_programahli` VALUES (5, 'MM');

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
INSERT INTO `t_semester` VALUES (3, 3);

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

INSERT INTO `t_silabus` VALUES (1, 'IPA', 'sil1.doc', 14, 'Kelengkapan pembelajaran IPA SMK Kelas XII', 'XII', '16/12/2012 17:27:35', 1);
INSERT INTO `t_silabus` VALUES (2, 'IPA', 'sil2.doc', 29, 'Kelengkapan pembelajaran IPA SMK Kelas XI', 'XI', '16/12/2012 17:26:18', 1);
INSERT INTO `t_silabus` VALUES (6, 'Penjaskes', 'sil6.doc', 4, 'Silabus Penjaskes SMK Kelas X', 'XI', '16/12/2012 17:34:02', 1);
INSERT INTO `t_silabus` VALUES (5, 'IPA', 'sil5.doc', 7, 'Kelengkapan Pembelajaran IPA SMK Kelas X', 'X', '16/12/2012 17:25:08', 1);
INSERT INTO `t_silabus` VALUES (7, 'Pend. Agama', 'sil7.doc', 3, 'Untuk Kelas X, XI, dan XII', 'X, XI, XII', '16/12/2012 17:21:23', 1);

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

INSERT INTO `t_siswa` VALUES ('070810005', 'ANNY MAULINA', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810006', 'ASSYIFA NOERLAELY MARYAM', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810007', 'AULIA TIARA', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810008', 'BAYU INDRAJIT', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810009', 'DESTRINA ALIN SUDARSONO', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810010', 'DIAN ROSA LINA', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810011', 'DWI APRIANTO NUGROHO', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810012', 'FIKRI HUMAM MANAR AMRI', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810013', 'FLORENTIA THRISTIANTI', 'X O 1', '-', '01/01/2008', '-', 'PROTESTAN', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810014', 'GESTI SEPTIA SUWANDI PUTRI', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810015', 'GWYNUFKE BELVA GUSTHA', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810016', 'HAMZA AGUNG SEDAYU', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810017', 'HENRIAN STIAWAN', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810018', 'IMAN LUKMANUL HAKIM', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810019', 'KAMILATUSSYAFIQOH', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810020', 'LAKSITA RARASTRIA KHARIMA', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810021', 'LUKMAN NUL HAKIM', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810022', 'MUHAMMAD FULKI FAUZAN', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810023', 'MIDA RUYATI LAILA', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810024', 'MOETCHIA RIZKY  SAFARO', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810025', 'MOHAMMAD SETYA WARDHANA', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810026', 'MUHAMAD RISFAN SYARID PRATAMA', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810027', 'MUHAMMAD ABDUL IZZATUR RAHMAN', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810028', 'MUHAMMAD AFFAN SYAHRUL', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810029', 'MUHAMMAD ICHSAN ABDILLAH', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810030', 'NABILLA RHAMDANI', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810031', 'PENI NURVIANI YUNANSYAH', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810032', 'PRITANIA SAVITRI', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810033', 'RANDI PRATAMA PUTRA', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810034', 'RANGGA DWIPUTRA', 'X O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810035', 'RIFAN AHMAD FAUZI', 'X MM 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810036', 'RISLI DIHYAT', 'X MM 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810037', 'RIZKI NUGRAHA', 'X MM 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810038', 'SHINTA WILLIANI', 'X MM 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810039', 'WARDA MARISA FITHRI', 'X MM 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810041', 'ABDILLAH SYAFAAT', 'X MM 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810042', 'ADAM PRIYADI', 'X MM 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810043', 'ADHITYA DARMAWAN', 'X MM 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810044', 'ALGI DESTIA', 'X MM 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810045', 'ALWIN MUHAMMAD REZA FAHMI H.', 'X MM 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810046', 'ANGGI NOVIA REGINA', 'X O 2', '-', '01/01/2008', '-', 'PROTESTAN', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810047', 'ARINI KURNIAWATI', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810048', 'DEA FADILLAH DAMAI', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810049', 'DEDEN YUSUP', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810050', 'EDWIN HERDIANSYAH', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810051', 'EKY SEPTIAN PRADANA', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810052', 'ENNA AGUSTINA MARDIKA', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810053', 'FAISAL AGUNG WASKITO', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810054', 'FITRI NURAENI', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810055', 'HENDRA GUNAWAN', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810056', 'INTAN MUFIDAH', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810057', 'IRINA TRIANISA NURHASNI', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810058', 'IRMA GUSRIANI', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810059', 'MEKKA FITRIA', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810060', 'MIRANDA AYU PUTRI RAMADHANTIE', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810061', 'NOVI UJIANNINGTYAS', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810062', 'NURIKA OKTAVIA', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810063', 'NURLIA RUBIYANTI', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810064', 'PUTRI HIDAYANI', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810065', 'RANI RISKA MAULIDA', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810066', 'RARA PRAWITA MUSTIKA ADYA', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810067', 'RENDY RISYANDI S.', 'X O 2', '-', '01/01/2008', '-', 'PROTESTAN', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810068', 'RIFKI RAMDHAN', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810069', 'RINNY KOMARASARI', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810070', 'RISKA PADMI DWI UTAMI', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810071', 'RIZKY FADILLAH', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810072', 'SERAMBI DAMAI DWIKA', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810073', 'TANIA YUNIARTI', 'X O 2', '-', '01/01/2008', '-', 'KRISTEN', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810074', 'UTAMI BUDIANI', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810075', 'VANI MAULIDA', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810076', 'VYANDA GRISHEILLA', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810077', 'WAHYU PURNAMA', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810078', 'WIDA WIDIYANTI', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810079', 'YENI FEBRIANTI', 'X O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810080', 'ANDERA VERENA', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810081', 'ANISA NUR AISAH', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810082', 'ANSHA CERBIA', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810083', 'ARDHI RAHMAN FAUZI', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810084', 'BUNGSU SAPTA PERBANI', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810085', 'CICI TRI SUPARNI', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810086', 'DEDE DZURROTUN NISA', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810087', 'DIAN WIDIANA', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810088', 'EGGA GUNAWAN', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810089', 'ELFRIDA PUSPITASARI', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810090', 'ERICK RAHMAT DENIAR', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810091', 'EUNEKE WIDYANINGSIH', 'XI O 1', '-', '01/01/2008', '-', 'PROTESTAN', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810092', 'FERONIKA', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810093', 'FEVI TUTIANA DEWI', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810094', 'FIRDHA CAHYA ALAM', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810095', 'FITRIANI', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810096', 'HAFSARI DEWI FILONIA', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810097', 'HENI MARDIANI', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810098', 'JEFF PRASETIA PAPAR', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810099', 'MOCHAMAD ARDIANSYAH', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810100', 'MUGI KHAIRUL MUSLIM', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810101', 'MUHAMMAD AL HASAN', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810102', 'NURISA FAZRI', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810103', 'PERMANA NUGRAHA WIRASAPUTRA', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810104', 'PRAWIRA YUDHA KOMBARA', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810105', 'RADITYO GARRY', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810106', 'RAMDHAN SEPTIANI', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810107', 'REGINA REPTIANI', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810108', 'RESI ROSANTI', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810109', 'RISKA ANGGRAENI', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810110', 'RIZA CRISTY AGUSTIN', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810111', 'RIZKI PURNAMA DEWI', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810112', 'SHALHA UBAID SALIM', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810113', 'SILMI SYAHIDAH', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810114', 'SILVINA GONISTILANI DEWI', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810115', 'TIARA MEGAWATI', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810116', 'VANIA RAKHMADHANI', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810117', 'VICKY RIANA DEVITA', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810118', 'WADA VALENTIN HARSONO', 'XI O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810119', 'ADIMAS FIQRI RAMDHANSYA', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810120', 'ANDRE ARIESMANSYAH', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810121', 'ANGGI AMANDA', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810122', 'ARINALDI TEGAR PRAKOSA', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810123', 'ARNI WILARNI', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810124', 'ASRI LASIDO ALAWIYAH WAHYU', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810125', 'BOMBI KAMANGGARA', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810126', 'DANIEL EKO SAPUTRA MANURUNG', 'XI O 2', '-', '01/01/2008', '-', 'KATHOLIK', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810127', 'DIAZ SYAFITRI RISDIANI', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810128', 'DINI MALIANTI', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810129', 'DITA DISAINA', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810130', 'EKA ANDIKA PUTRI', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810131', 'ENI ROHAENI', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810132', 'FANY ADHIATI', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810133', 'FEMY NURYANTI', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810134', 'GERRY YOKA PURNAMA  PUTRA', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810135', 'GHINA LUTHFY NURUTAMI', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810136', 'GUMELAR AHMAD MUHLIS', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810137', 'HANDOKO PRAMULYO', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810138', 'HERAWATI MURTI GUSTIANI', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810139', 'HILMAN ARRASYID', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810140', 'KHOIRUL ANAM GUMILAR WINATA', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810141', 'MEGA NUR OCTAVIA', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810142', 'MILA YANUAR PERTIWI', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810143', 'NENI AMELIA', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810144', 'NINA KURNIATI', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810145', 'RINRIN RINA ESTIANA', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810146', 'RIZKY IKHWANUSHAFA', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810147', 'ROSMAYANTI', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810148', 'SELLY ANGRIANI PUTRI', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810149', 'SISKA ARLIANI', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810150', 'SUCI WULANSARI', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810151', 'SUMIATY', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810152', 'SYAMSUL MAARIF', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810153', 'TANTYO WICAKSONO', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810154', 'TINI YUNIAR', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810155', 'TITA RAHAYU', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810156', 'TRESNA FAISA SUWANJANA', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810157', 'YOGA TAUFIQ RAMDHANI', 'XI O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810158', 'ALRIEN SYAUMI UTAMI', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810159', 'ANNIS YURIANTI', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810160', 'ASTI OKTAVIANI', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810161', 'AYU WAHYUNI', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810162', 'CINDY ANGGELINA CAHYADI', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810163', 'DESI HERLIANI', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810164', 'DINI AYU LESTARI', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810165', 'DJAELANI SHIDIQ', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810166', 'DYLAN RIZKY KURNIAWAN MUNTHE', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810167', 'ELSYA FERADINA', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810168', 'ERNI NURPRATIWI', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810169', 'FEBBY ANJANI', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810170', 'FULKI BRAMANTYA', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810171', 'ILYAS GUNA WIJAYA', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810172', 'INCHAN PRATIWI', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810173', 'INTAN PERMATA INDAH', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810174', 'KAUTSAR NAJLA', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810175', 'MUHAMAD RYAN PERMANA', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810176', 'MUHAMMAD ANWAR ROSYIDIN', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810177', 'NICKEN BUDI AYU', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810178', 'NUR KUMALADEWI', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810179', 'PERMANA JAYA HIKMAT', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810180', 'PUJI ARTI RACHMAWATI', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810181', 'RACHMAT ADI SUPRAPTO', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810182', 'RINA TRI UTARI', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810183', 'RISMA HANDAYANI', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810184', 'RIZKA AULIA AFIFAH', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810185', 'SANDY AIDUL AMMARULLAH', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810186', 'SHINTA ROHMATIKA KOSMAGA', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810187', 'SOVIA DEWI MULIASARI', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810188', 'SULAIMAN', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810189', 'TIAN PRADIANI', 'XII O 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810190', 'VENANSIUS ANDREA RAHMOYO PUTRO', 'XI MM 1', '-', '01/01/2008', '-', 'KATHOLIK', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810191', 'VETTY FATIMAH', 'XI MM 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810192', 'VIAN MULYANI', 'XI MM 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810193', 'WAARITSU', 'XI MM 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810194', 'YASOKA DEWI', 'XI MM 1', '-', '01/01/2008', '-', 'PROTESTAN', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810195', 'YUDHI DWI PERMADI', 'XI MM 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810196', 'ZACKI ERFIYANTO', 'XI MM 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810197', 'ABI RIKOBI', 'XI MM 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810198', 'ARI PRATAMA PUTRA', 'XI MM 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810199', 'ASTRI LESTARI', 'XI MM 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810200', 'BAGJA GUMILAR', 'XI MM 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810201', 'BINA NGUMBARA BENJAMIN', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810202', 'BUDI SETIADY', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810203', 'DEA PRAHASTI RACHMI', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810204', 'DESTIANTY NUR ARTIANINGSIH', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810205', 'DEWI NURAISYAH', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810206', 'DINA HIRTASARI', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810207', 'DWIKA ANDJANI', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810208', 'EGGI DARMAWAN', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810209', 'ERNA YULIANA', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810210', 'EVI  PRATIWI', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810211', 'FADLI APRIANTO', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810212', 'FITRI RIZKIA GAHARI', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810213', 'GUSTIANI SAFITRI', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810214', 'HERIKA SURYA PRATAMA', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810215', 'IIH CARLA RAHMAYANTI', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810216', 'IIS MAESAROH', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810217', 'IRWAN MULYANA', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810218', 'JERIZAL YULIANTO', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810219', 'MOCHAMMAD ARIF RACHMAN HERNOMO', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810220', 'MUTAMINAH', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810221', 'NAJMIA RAHMA', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810222', 'NOVI RASMAYANTI', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810223', 'NURAMALIA MURSYIDAH', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810224', 'NURUL ULA SAYYIDATUNNISA', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810225', 'REDHA ASHADI NOVANDRA', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810226', 'REVI PEBRIAN', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810227', 'RINDI CAHYA WULANDARI', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810228', 'RUDY SULAEMAN', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810229', 'SEILEN HAFDARA NURDIN', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810230', 'SUCI HARTANTI', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810231', 'TAUFIK MAULANA ABDILLAH', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810232', 'TRIE DAMAYANTI', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810233', 'VANIA DECONE JOLANDA', 'XII O 2', '-', '01/01/2008', '-', 'PROTESTAN', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810234', 'WIDIARTI', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810235', 'WULAN IKE TRISNAYANTI', 'XII O 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810236', 'AFGHAN MUHAMMAD JIHAD', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810237', 'ANNEKE PUTRI', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810238', 'ANNISA MUTHOHAROH', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810239', 'ARIS BAHTIAR', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810240', 'AYI KULSUM ZAM ZAM', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810241', 'DEA DINAR BIMBI HARDIANTI', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810242', 'DEVI MELINDA DWI PUTRI', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810243', 'DIMAS ALPARIZI', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810244', 'DINY FEBRIANY HASANAH', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810245', 'DONA HAYUNNALITA RUSMANA', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810246', 'GEBY FERARIANA', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810247', 'IKBAL SAEFUL AZIS', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810248', 'INDRIYANTI HANDAYANI', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810249', 'KAHFI ALI PERDANA', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810250', 'KEYNE  HADRIAN', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810251', 'LEA AMELIA LESTARI', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810252', 'MOCHAMAD HILMY RAMADHAN', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810253', 'M. NUR ADNAN', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810254', 'MAYA CYTA PUSPITA', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810255', 'MUHAMAD RIDWAN FAUZI', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810256', 'MUHAMMAD FAKHRI FARGHANI', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810257', 'NADYA SALSA', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810258', 'NOVITA NURAENI', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810259', 'NURI NURMALASARI KUSUMAH', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810260', 'NURUNISA ALAWIYAH', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810261', 'OVTA REZKA AMIJAYA', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810262', 'PRASETYO WICAKSONO DARMAWAN', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810263', 'RADEN DELIQUE DIERATU KAMAN', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810264', 'REZHA WIDIATMAJA', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810265', 'RINI SUTINI', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810266', 'RIZKI DWI SYAHRIZAL', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810267', 'RUDINI HADI WIBOWO', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810268', 'SEPTIANI WAHYUNING PRATIWI', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810269', 'SONI SONJAYA', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810270', 'SYAFIRA AMELIA SUDARSYAH', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810271', 'THIO ANGGA PRAKOSO', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810272', 'TINA NUR FAIDAH', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810273', 'TRISTI LARASATI', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810274', 'WIDA KANIA KHULSUM', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810275', 'WINDA PURNAMA', 'X L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810276', 'ADITHYA NUGRAHA', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810277', 'ADITYA RAHMAT GUMILAR', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810278', 'ANANTIA FIRDA ATHIANA', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810279', 'APRILLIA AYU LESTARI PERMANA', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810280', 'ASTRI ARYANI', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810281', 'AYU TRILISTIANI', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810282', 'BAYU YOGATAMA', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810283', 'CHAERUNISSA RIZKY MAULIDA', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810284', 'CHANDRAWAN SATRIA', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810285', 'CICILIA NATALIA', 'X L 2', '-', '01/01/2008', '-', 'KATHOLIK', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810286', 'CINDY PIRU DWINTASARI', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810287', 'CUCU SAEPUDIN', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810288', 'DEBBY PERMATASARI', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810289', 'DEVI MEILIA', 'X L 2', '-', '01/01/2008', '-', 'PROTESTAN', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810290', 'DIAN MEGA PRATIWI', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810291', 'DWI PAWESTRI SULISTIANI', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810292', 'ERWIN ADITYA PRAWIRANATA', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810293', 'FANY APRILLIANY S.', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810294', 'FRISDI STAMANDA', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810295', 'ILHAM JUANDA', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810296', 'INDRABAYU', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810297', 'INSAN ANUGRAH GUSTI', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810298', 'INTAN SITI NUGRAHA', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810299', 'KOMALA SRI HERYANI', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810300', 'L.A. ARIF NUGRAHA', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810301', 'MOCHAMAD DZULKIFLY AL SATRIA', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810302', 'MALINDA IRIANI', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810303', 'MISNI MABRUROH', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810304', 'NENENG HOERUNNISA', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810305', 'NINDYA DEVI MENTARI', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810306', 'NOVI NURWANTY', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810307', 'NUR RISKI KINTARTI', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810308', 'NURHADI FIRMANA', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810309', 'NURINA NURDINI', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810310', 'PRASETYO HADI NUGROHO', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810311', 'RESTI INDRIARTI', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810312', 'RISCA NUR FITRIANI', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810313', 'SEPTIAN NUR JAMAL', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070810314', 'WULANDARI SUKMANING TASRIPIN', 'X L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071191', 'MOCHAMAD ILHAM', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071236', 'MOHAMMAD RIZALUL FIKRI', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071275', 'MUHAMMAD IQBAL', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071276', 'MUHAMMAD RHEZA ALFIN', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071277', 'NANIK SEPTIANUR', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071240', 'NOVI GINANJAR RAHAYU', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071195', 'NOVYA NOFIYANTY NURYANTI', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071278', 'NURUL AMANAH SOLIHAT', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071282', 'PRIMA HARTIO', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071284', 'PUTRI WULANDARI', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811328', 'R. ZAKI MIFTAHUL FASA', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071197', 'RADEN LUCKY DARMAWAN', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071072', 'RISKA NURBAYA', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071287', 'RIZGIA', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071201', 'RIZKY RESTAFAUZI SUPANDI', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071162', 'SHADAM HUSSAERI HANDY PRATAMA', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071250', 'SUGIH PRATAMA', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071251', 'TAUFIK ARIANSYAH', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071330', 'THIOREDI PUTRA HERMAWAN', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071332', 'ULFAH OKTA ADITYA', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071295', 'YOSEF HERY HIDAYAT', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071335', 'YOVITA YUNIAR RAMLY', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071336', 'YULIANTI', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071337', 'YUSI NUR RAMADHAN', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811329', 'ADITYAN AGUNG S.', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811330', 'AINI NURUL IMAN', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071170', 'ALDY NOVA DYANSYAH', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811331', 'ANJAR BIMA PRAKOSO', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071215', 'ASDIT LEONITARA', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071087', 'AYU KUSUMANINGTYAS', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811332', 'BADAR TEGUH MANSIK', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071217', 'BANGKIT ERAWAN', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071011', 'DEWI SUSLIANA FAUZANI', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071049', 'DHANDY ARDIANSYAH', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071050', 'DICKY BAGJA RAMADHAN', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071091', 'DINAR YUANISA', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071093', 'EKA RAHMAWATI', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071370', 'FAKHMI FAKHRUR RAZI', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071097', 'FIKA ANDINA', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071014', 'HAEKAL WARDANA', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071016', 'IRMA TRI SAFARINA', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071017', 'JOSI MEIKA MUTMAINAH', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071018', 'KANIA WIDYATAMI', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071019', 'KATHARINA RISKA WULANDARI', 'XII L 1', '-', '01/01/2008', '-', 'PROTESTAN', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071020', 'LAILY HERNI KURNIAWATI', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071021', 'MARTINA ANISA DEWI', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071373', 'MOHAMMAD KEVIN ARNAS', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071022', 'MUFTI MUHTADI', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071111', 'NADIA FARHANI', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071026', 'PIA ZAKIYAH', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071066', 'PUSPASARI RESPATININGTYAS', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071027', 'RAHMI FATHONAH', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071070', 'RENI KUSTINA SANDI', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071028', 'RENNY UTAMININGSIH HARSANTO', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071029', 'RIRI AYU DERIARI', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071071', 'RISA DEWI', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071033', 'RIZKI ALIEF FAJARINI', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071160', 'RUNI RACHMALINA UTARI', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071034', 'SRI MULYANI', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071081', 'TEGUH ALAM PUTRA', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071035', 'TEGUH NUGRAHA', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071037', 'VERNIDA MUFIDAH', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071166', 'VINDA DWI OKTOVIYANDA', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071294', 'WILDAN AHMAD FIRDAUS', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071039', 'YULIANI HAJIMINAWATI', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071040', 'YURI INDRIYANI YEUYANAN', 'XII L 1', '-', '01/01/2008', '-', 'KATOLIK', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071168', 'YUSUF BUHORI MAULANA', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071041', 'ZAIM SIDQI ISLAMI', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071042', 'ZILKA PRIANDITYO', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071254', 'AGYS SISKA GICIA', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071211', 'AHMAD SUPRIANTO', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071300', 'ALDI RHINALDI ABDUL GANI', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071212', 'ALVIANDO RESTU PRATAMA', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071130', 'AMALIA NURPITRIYANI', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071301', 'ANDARI', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071375', 'APRILITA LESTARI RESCHO', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071385', 'DESI SUSANTI', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071096', 'FEDY FADILAH', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071311', 'FITRIA ENDAH PERMATA SARI', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071053', 'FUJA PRATAMA', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071055', 'GILAR DWIGUNA ARIEF RACHMAN', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071265', 'HANA ROVIANI', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071101', 'INDRA HERMAWAN', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071104', 'ISTI SOFIA INSANI', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071057', 'KINSYA ABDURRAHMAN', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071150', 'LASTRI RAHAYU', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071190', 'LUKMAN GALIH NUGRAHA', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071058', 'MARDIANA PURWA RIZKI', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071318', 'MEILANI NUR HASANAH', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071108', 'MITA PERMANASARI', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811315', 'MUHAMMAD DENDI A.', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071061', 'MURSYIDAH AMNIATI', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071320', 'NICKI SELVIA', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071321', 'NITA PERMATASARI', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071112', 'NOFALIA NURFITRIANI', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071194', 'NOVITA SARI', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071281', 'PRATIWI ROKHMAH', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071065', 'PURNAMA NUR RACHMAN', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071283', 'PUSPITA HANDAYANI', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071114', 'PUTRI NURFUADAH', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811316', 'PUTRI NURLIANA', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071323', 'PUTRI PERMATASARI', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071324', 'RADEN RANGGA PRATAMA PUTRA DJU', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071326', 'RATIH NURJANAH', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071380', 'RIDWAN ANGGA KUSUMA', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071159', 'RISKA YUNITA PRATAMI', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071074', 'RIZNA NOFITASARI', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071119', 'SARAH ISMI KAMILAH', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071120', 'SHEILLA FITRIAN', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071077', 'SHINTA NOVIA NURJANAH', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811317', 'SILAHUDIN NASIRI N.', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071204', 'SISCA YULIA MAHANANI', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071121', 'SURAHMAN', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071252', 'TIKA AYU BUDIARTI', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071082', 'UTARI DIANA PUTRI', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071126', 'WANDA KARROMA', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071209', 'WIDYA SUSANTI', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071128', 'ADY SYAF PUTRA', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071129', 'AFIFAH NURIYANI', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071043', 'ALI MUTASHIM AULIARROHMAN', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071256', 'AMMI DAMAYANTI', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071085', 'ANI SUMARNI', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071134', 'AYU YUNIARTI', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071218', 'BELINA ANGGIA GUSTAMI', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811318', 'BIMO AULIA RAHMAN', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071137', 'CHAERUL ANWARI', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071045', 'DAFIT BAGUS MAHA BEKTI', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071219', 'DENY MAULANA', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071260', 'DESSY DESSYANTI NURAIDA', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071090', 'DIAN ANDRIANI SAFITRI', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071092', 'DWI PUJIARTI', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071051', 'ERLINA CINTIYA DEWI', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071143', 'FACHRIZAL CAHYA P.', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071145', 'GANIS PANJI YAHYA', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071146', 'HANIF JALAMANAH', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071102', 'INTAN SYAPINATIN NAJA', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071148', 'ISMA RISMAWATI', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071149', 'ISTIKASARI', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071188', 'LENNY WIDIA MUKAROMAH', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071105', 'LIA ROSLIANA', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071189', 'LISTYA DWINA APRILIANI', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071232', 'LULU PANGESTI', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071106', 'M. ANJAR SHEVTIAN', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071271', 'MAYA OKTAVIA', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071107', 'MEGA FAJARWATI', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811319', 'MIQYASSARA DIANDRA', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071154', 'MUTIARA SARI', 'XI MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071238', 'NISA NUR RAHMAH', 'XII MM 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071113', 'NOURMA MELATI LARAS', 'XII MM 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071155', 'NOVIYANTI KAMALELA', 'XII MM 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071156', 'ONNY PADMANTARA', 'XII MM 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071280', 'PERMATA SARI', 'XII MM 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071196', 'R.R ESTI SUPRIYATI', 'XII MM 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071325', 'RADEN YUNIAWATI', 'XII MM 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071202', 'RUDI PRADISETIA SUDIRDJA', 'XII MM 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071078', 'SISKA KARLINA', 'XII MM 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071079', 'SOFYAN RAMADHANI', 'XII MM 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071080', 'SUNDUS MIRROTIN', 'XII MM 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071329', 'SUSANTI AMALIA', 'XII MM 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071124', 'TIARA MULYA NINGRUM', 'XII MM 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071207', 'TOMMY MULYANA', 'XII MM 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071125', 'TRI BAGUS AJI PAMUNGKAS', 'XII MM 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071208', 'TRI CHANDRA WULAN SARI', 'XII MM 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071165', 'VERA SYAPRIATI DEWI', 'XII MM 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071210', 'WISNU ADITYA MUIZ', 'XII MM 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071299', 'AHMAD LUQMAN HAKIM', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071381', 'AKBAR BUDIMAN', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811320', 'ANGGARA EFFENDI', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071171', 'ANISAPUTRI SYAFARINAH HAKIM', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071213', 'ANITA MEGAMARINTI', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071132', 'ANITA NUZUL DIAH FIASIH', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071302', 'ANTONI ARIF KURNIA', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071172', 'ARI BUDIANTO', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071214', 'ARIANDHINI LESTARI HARYADI', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071258', 'ARIEF', 'X BSN 2', '-', '01/01/2008', '-', 'PROTESTAN', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071216', 'AYUTIA PERTIWI', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071135', 'BAGUS WIDIANTO', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071136', 'BUDI DANIAR', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071089', 'DESSY RATHRY YULYANTHY', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071304', 'DESTIANA CHAIRUNNISA', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071141', 'DINI INDRIANI', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071223', 'EKKY OKTORA SANTOSO', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071052', 'FEBI LARASWATI', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071263', 'FITRI MARIMA', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071382', 'GILANG MATRIANSYAH DWI PUTRA', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071227', 'HARDI FERDIAN SABAR', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071099', 'HERLINA PUSPA DEWI', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071229', 'HILDA FARIDA', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071230', 'IWAN FATHUROKHMAN', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071231', 'JAENUDIN', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071151', 'MAYURA FIRLANDARI', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071235', 'MOCHAMAD HARIS ALAMSYAH', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811321', 'MUH. ASHARI EKASWARI', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811322', 'MUHAMMAD NIZAR F.', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071110', 'MUHAMMAD RIZKI GORBYANDI NADI', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071062', 'NIKEN DEWI NAGARANA', 'X BSN 2', '-', '01/01/2008', '-', 'PROTESTAN', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071237', 'NISA NUR FRAZTY', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071239', 'NOLIS FAUZIAH', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071064', 'PELITA ISMAYA', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071243', 'PRIMA SIDIQ NUGRAHA', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071067', 'PUTRI KRISNA NURHAPSARI', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071244', 'RANNISA TRIASA MIFTAH', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071158', 'RIKA NURKEMALASARI', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071245', 'RIKE ANDRIKNI', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071246', 'RINA RUSDI', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071247', 'RIZKA SUCI UTAMI', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071288', 'SANTI SRI WARDHANI', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071291', 'SETIYA ARUM WULANDARI', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071167', 'YARA AYU INDRIYANI', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071338', 'YUSUF ADI NUGRAHA', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071084', 'YUYUN MIRANUR ADELIANI', 'X BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071296', 'ADE YUYUN YULIANI', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071297', 'ADRI SYAEPUL MILAH', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071044', 'ANE KUSTIANA', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071086', 'ANISA AYU SANDI', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071174', 'BELA LIESTIAWATI', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071175', 'CAMAR REMOA', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071303', 'DADAN MOCHAMAD RAMDHANI', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071177', 'DEFIA SHOLIHATUN NISSA', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071305', 'DHANI RAMADHAN', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071178', 'DINI BUDIARTI SALAM', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071179', 'DISE AMALIA', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811323', 'DISTI FAUZIA SUKANDAR', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071142', 'EDLIN SUMARLIN', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071225', 'FAJRI FAUZAN HAQ', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071180', 'FITRI IDAYANA', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071312', 'FITRIANTA B.R GINTING', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071098', 'GHEA GRISTANNIA GRANDISTIN', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071054', 'GIAN NUR ALAMSYAH', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071056', 'HESTI RAHMAWATI ASRI', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071183', 'ILHAM IHSANANDA RASPATI', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071147', 'IMAM MUTTAQIN', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071184', 'INTANIA RIZANTY DEWI', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071269', 'IRA HIMAWATI', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071185', 'IRMA SEPTIANI', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071186', 'KRESNAWAN HUSSEIN', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071378', 'LUKI LUKMAN HAKIM', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071234', 'LYA MULYA MARTINI SUTISNA', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071059', 'MELAWATI', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071192', 'MUHAMAD ZAMZAMI MUTAQIEN', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071319', 'MUTIARA MAHARANI', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071063', 'NUR SYIFA ROSHIDA', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811324', 'RAHMAT RAMADHAN', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071198', 'RATNA YULIYANTI', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811325', 'RENDRA WIBAWA S.', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071116', 'RENDY EKA SAPUTRA', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071199', 'RIKE RACHMAYATI', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071327', 'RISA SRI UTAMI', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071200', 'RISNA KARTIKA', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071286', 'RITA SETIADI', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071075', 'ROSI SITI NURJANAH', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071203', 'SAEDI BAWANA', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071290', 'SELLY RIZKI FITRIANA', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071249', 'SOFI HUDA NURANI', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071122', 'TATIK CITRA WULANDARI', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071253', 'WILDAN PRAYOGO', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071083', 'WINA MARTIANA', 'XI BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071127', 'ADE ROCHMAT', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071298', 'AHMAD BOBBY HERNAWAN', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071002', 'AMALIA RAHMANI', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071133', 'ANITA TRI ASTUTI', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071176', 'CITRA ANGGIANI WAHYUDIN', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071010', 'DADAN FITRI AMINDANI', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071048', 'DEWI ROSDIANI', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071140', 'DINA NURUL UTAMI', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071383', 'DINDA GNATINI HERNAWATI BAGJAN', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071376', 'ELDA HAMDANI', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071012', 'EVI SEPTIANI', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071013', 'FAKHRUDIN NOOR', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071391', 'FANNY YULIAN PRIMALIA', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071310', 'FITRI AFRIAN KAMESWARA', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071144', 'FITRIANI DEWI ARYANTI', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071015', 'HENDY HADIANSYAH', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071100', 'ILHAM AZENAL SACABRATA', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071314', 'INE TRISNAWATI', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071316', 'KATON PRABOWO', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071273', 'MELINDA DEWI RAMADHIANTY', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071384', 'MOCHAMAD RYAN ANUGRAH', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071023', 'MUHAMMAD IBRAHIM RIYONO RAHARJ', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071024', 'MUHAMMAD IMAN PRATAMA', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071109', 'MUHAMMAD IQBAL MAULUDI', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071153', 'MUHAMMAD REZZA ANGGA PRADANA', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071025', 'NOVI RIANTI', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071241', 'NOVIYANTI ESTIYA', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071242', 'PANCA LUKITA ANANTO', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071068', 'RAMZI TASHA MANSOOR', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071069', 'RANGGA EKAPUTRA BANAWA', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811336', 'REX AVIANTARA N', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071030', 'RISA DWI AIDARIANI', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071031', 'RISKI ISKONJAYA', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071032', 'RISYA ANNISA KUDUS', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071073', 'RIZKI KURNIAWAN', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071328', 'RIZKIA APSARI ANDARANESWARI', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071289', 'SELINDA NOVIANTI', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071076', 'SEPTY YULIANI', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071292', 'SINTA NUR LATIFAH', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071163', 'SONIA SITI SUNDARI', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071293', 'SRI RAHAYU', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071206', 'SYIFA MAULINA', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071164', 'TIA SOFIANA', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071036', 'TITO NURFITRAH RAMDHANU', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071331', 'TRI NURSARIFAH', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071333', 'WIDIANTI NURWALIYAH', 'XI BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071255', 'AHMAD WILIANA WIBAWA', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071257', 'ANISA BELAWINI CIPTA DEWI', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071259', 'ATTY NURSANTI', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071088', 'BAYU PRAMONO', 'XII L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071371', 'BELIA RACHMANI', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811326', 'BETRIAKARI PUTRI', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071046', 'DENDEN KHULDUN MABRUR', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071047', 'DEVY MEYLIANI EFFENDI', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071261', 'DIMAS TANJUNG', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071307', 'ERNI APRIYANI', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071262', 'FANNY FEBRIANTY', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071264', 'FITRI NUR WULANDARI', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071181', 'GANIA PURNAMASARI', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071372', 'GIANA ROSANTI', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811327', 'GILANG DIMAS', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071266', 'IDA MAYASARI', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071103', 'IQBAL FAUZAN', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071377', 'JABBAR ARNASTY', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071270', 'JOKO TRIONO', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071187', 'LANI WIDIA ASTUTI', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071274', 'MITA KARLINA', 'XI L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071001', 'ABDULRACHMAN HASAN', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071131', 'AMALIANTY', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071003', 'AMALLYA FITRA APRIANTI', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071004', 'AMELINDA DYAH RAHMASARI', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071005', 'ANISA SONIA FATMAWATI ADHA', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071006', 'ARINDA PUSPITA RACHMAN', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071007', 'AYU AULIA SEPTIANI', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071008', 'BERLIAN AGUNG DIPANUSA', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071009', 'CINDY MUTIARATU', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071139', 'DEA IBRAHIM ARSYAD', 'XII L 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071306', 'DIAN ENDARNO', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071220', 'DIAN MIRA WANTI', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071221', 'DWI YUNIARTI', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071094', 'EKKY ANGGRYAWAN', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071224', 'ENITRIA ASTRIANI', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071226', 'FAJRIYAH MULIAZANAH', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071095', 'FANDJI NOOR ZAKARIA', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071309', 'FAUJI LESMANA', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071228', 'HARDIANTI MAULIDA', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071182', 'HENI HESKANIA', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071313', 'HERU ROSMANTO', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071267', 'IIS NURHAYATI', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071268', 'INDRA TRI SEPTIAN', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071315', 'JUNAEDI INDRIANA', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071317', 'LINGGA SASTRAWIJAYA', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071233', 'LUSI MELLIANA SENI', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071272', 'MEGA TIARA YUNIAR', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071386', 'MOCHAMAD RIVAN ANUGRAH', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071060', 'MUHAMAD ARIF AL FAJAR', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071152', 'MUHAMMAD DAEROBI', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071374', 'MUSTIKA QODAR A.', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811333', 'NENENG KARTIKA', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071193', 'NICO SEPTIYAN', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811334', 'NITA HADIAN', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071322', 'NUNIK SRY RAHAYU', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071279', 'OVI WULANDARI', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('070811335', 'PREVIRA TIRANI', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071157', 'RADEN YULIA MARLINA', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071115', 'RANI PUSFITA', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071285', 'RIAN DWI CAHYO', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071117', 'RIZAL INDRA ARIFIYANTO', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071118', 'SANTI YULIANTI', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071161', 'SELA OKTORA', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071248', 'SENDI SAPUTRA SUHENDI', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071205', 'SITI NURHALIFAH', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071123', 'TIA NOVIAWATI', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('06071334', 'WIWIN WINARSIH', 'XI L 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '-', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061043', 'ADITYA HERDIANTO SYAFII', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061001', 'ADNAN NANANG RAGIL SUSILO', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061002', 'AGUNG NURRAHMAN', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061003', 'ANDZAR MUHAMMAD FAUZI', 'XII BSN 1', '-', '01/04/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061250', 'ARIS PRATAMA PUTRA', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061171', 'ARTI BUDIARTI', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061214', 'ARTI YAN NURMALASARI', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061215', 'BAMBANG HERMANTO', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061005', 'BAYU ALI AKBAR', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061216', 'CHARLES HERBERT MANAHAN PARDOM', 'XII BSN 1', '-', '01/01/2008', '-', 'PROTESTAN', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061048', 'DESI DESTIANI GUNTARI', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061218', 'DESI SUMEGAR', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061220', 'DEWI ANGGRAENI', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061252', 'DINA CITRA KHARISMA SARI', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061052', 'DINNA DEA ANGRAINI', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061222', 'ELISABETH NATALIA SURYANI', 'XII BSN 1', '-', '01/01/2008', '-', 'KATHOLIK', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061054', 'ENING DESI SUSILAWATI', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061184', 'FAHMA FIQHIYYAH NUR AZIZAH', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061349', 'FAJAR AZHARI SALEH', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061255', 'FARIS AMARULLAH', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061185', 'FIESTY UTAMI', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061186', 'FITRI AFRIYANTI', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061060', 'GEASA SENA', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061019', 'HIKMAT HIDAYAT', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061261', 'LIA FITRIANI', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061235', 'LUTHFI MERDIANDANI', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061193', 'MAWADDI LUBBY', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061307', 'MIA FITRIA UTAMI', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061265', 'MILA KUMALASARI', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061022', 'MUHAMAD KANZU SATRIO', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061310', 'MUHAMMAD ZAKKI FUADI', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061269', 'NADYA LARASATI KARTIKA', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061023', 'NIDA MAISA ZAKIYYA', 'XII BSN 1', '-', '01/04/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061155', 'NIRA NURIKA SYAWINA', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061276', 'RAMIZIA AZHAR HERDIST', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061028', 'RATU GUSTINI NUR JANNAH', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061033', 'RIFKI RAMDAN HIDAYAT', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061346', 'RIKE ARDIANTI WULAN', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061280', 'RINA SURYANI', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061281', 'RIRIN EKA PERMATASARI', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711339', 'RISKA DWIHARDINI', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061075', 'RYNAL FERDIANSYAH', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061242', 'SEPTYANA DEWI VIERGITANINGRUM', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061205', 'SUGIH PURNAMA', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061246', 'SYAHRUL MUNAWAR ALBANA', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061077', 'TAUFIK ALI MUKTI', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061207', 'VIANADIA PUSPA DEWI', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061080', 'WINDA RAMDHANI', 'XII BSN 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061042', 'ADITA FAHMI HANIF', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061248', 'ALLAMAH YAHYA QOLBUN SALIM', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061045', 'CONSISTANIA DEMAWATI', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061175', 'DANDA IRAWAN WIBOWO', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061046', 'DANI NIRWANTO', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061217', 'DEO FERNALI ARNANDA', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061131', 'DIAN MELINA', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061181', 'DIANA MUSTIKASARI', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061053', 'EKO NUGROHO BUDIYANTO', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061011', 'FANI ABDUL HAFIZ', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061256', 'FITRIA ATMOJOWATI', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061059', 'FRISKA ELSA VALENTINA SIMANJUN', 'XII BSN 2', '-', '01/01/2008', '-', 'PROTESTAN', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061187', 'GAMMA ABDUL JABBAR', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061139', 'GINA MARIANA DEWI', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061144', 'INDATI FADILAH', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061229', 'IVAN LUKMAN', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061230', 'LAILA SRI UTAMI', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061231', 'LENI KARMILAWATI', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061234', 'LUTHFI HELMI LAZUARDY', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711340', 'MOHAMAD RESHA YUDIESTIRA', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061267', 'MOHAMMAD IQBAL', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061197', 'MUHAMMAD ABDUL AZIZ ALMUJAHID', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061309', 'MUHAMMAD HAFIDZ PRATAMA', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061068', 'MUHAMMAD LUQMAN HASAN', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061311', 'NABILA GANI', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061156', 'NOBY SATRIO DWI PURNOMO HADI', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061069', 'NURY WINARTI', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061352', 'RACHMI UTAMI RACHMATYANI', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061315', 'RADEN RYAN SEPTIAN CHANDRA PUR', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061072', 'RESKA PRASETYO', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061160', 'RINI AGUSTIN', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061074', 'RIZSCA ARTNESA FITRY', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061321', 'SAFAAH MAHMUDAH', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061076', 'SELLY NOVIA ANGGARI', 'XII BSN 2', '-', '01/01/2008', '-', 'KATHOLIK', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711341', 'SHANDY GUSTAV EKA SATRIA', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061243', 'SISKA JANUAR RACHMAN', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061204', 'SITI HASANAH', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061165', 'TONNY FAHRUROJI', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061037', 'TYAS PUTRI UTAMI', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061323', 'UZMA TAJMALA', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061287', 'VIERA DEWI PRATIWI', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061166', 'WAHYU KHOERUTTAMAM', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061082', 'WINDI SHINTIA FANDINI', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061039', 'WIWIT CATUR SUTEJO', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061247', 'YEULA HARYDA', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061327', 'YKA MEI SETYONINGRUM', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061040', 'YULLY FITRIANI', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061167', 'ZAKA ZAENUDIN', 'XII BSN 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061289', 'ABDURRACHMAN ALDILA', 'XII MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061290', 'ADE LESTARI', 'XII MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061347', 'AHMAD FUAD HANIF', 'XII MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711342', 'ARADEA WIRADIREJA', 'XII MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711343', 'ASIH PURWANDARI WAHYOE  P', 'XII MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061172', 'BAGAS AJI BAWONO', 'XII MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061129', 'BRANJANG TALIADJI', 'XII MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061251', 'CHAIRUNNISA SAUMI ARIPIN', 'XII MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061049', 'DESWITA AYUNINGTYAS', 'XII MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061007', 'DEVY WULANDARI', 'XII MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061180', 'DIAN RAMDHANI', 'XII MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061183', 'DWI WAHYUDI', 'XII MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061298', 'EGNAS SUKMA FATHUROHMAWATI', 'XII MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061133', 'EKO HARDANI WIBOWO', 'XII MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061134', 'ELITA LESTARI', 'XII MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061254', 'EVA SITI ADIYANTI', 'XII MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061300', 'FAJAR GUMILAR EKAPUTRA', 'XII MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061013', 'FENI NURVITAWATI', 'XII MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061016', 'GHANI HAKIM RAMDHANI', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061224', 'GHEA ARDILIA', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061137', 'GIESTHA GUSTIAWINATA SETIAWATI', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061142', 'HARRY MUHARAM', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061226', 'HEGI PRASETYO', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061062', 'IKA MEILATY', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061258', 'IRVINA LESTARI', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061146', 'ISMA DWI MAHARANI', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061147', 'ISNA MAULLA RAHMA', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061148', 'JOSEPH JEVON MART', 'X TKJ 1', '-', '01/01/2008', '-', 'KATHOLIK', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061260', 'KYAGUS ABDUL WAHID', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061262', 'LULU BRIANNI PUTERI', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061263', 'MEGA LEVIANA', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061195', 'MOHAMAD FAUZY', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061271', 'NURHASANAH', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061274', 'PRETTY SISKA BUDHIYATI', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061199', 'PRIMA NANDA FAUZIAH', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061026', 'RACHMY FITRIANI', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061278', 'RESTI RAMADHANI', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061240', 'RIDWAN FAUZY HIDAYAT', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061034', 'RISKY ERWANDA BANJARNAHOR', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061282', 'RIZAL RAHMAWAN SETIABUDI', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061319', 'ROBI SUGANDA', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711344', 'ROSI NURJANAH', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061350', 'RUNA WIRANURRACHMAN', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061320', 'RYAN ADHITIA MUSLIM', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061283', 'SANDRO FEBRINO', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711345', 'SANNY NURBHAKTI ZAKIYYAH', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061244', 'SOFIA NOVIANTI', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061285', 'TRESNA TRI DESTIANI', 'X TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061085', 'ACHMAD RIZAL FAKHRUDIN', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061086', 'ADITYA CAHYADI', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061087', 'ALWI ERLANGGA PRAKOSO', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061089', 'ANDIKA HERIYANDI', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061293', 'ANDY PRATAMA NUGRAHA', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061127', 'ANITA RAHMAYANTI', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711365', 'DEASTIKA BAYUNING SUDJASMARA', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061050', 'DEVI REGINA PURI', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061090', 'DHEA RIZKY NURHADI', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061360', 'DIANING PERTIWI', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061092', 'DWI ARIE KURNIAWAN', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061093', 'ENDAH PURNAMASARI', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061094', 'ENDRIO NUR PUTRA', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061096', 'ERMA NURUL HIDAYATI', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061057', 'EVIRA AGUSTINA', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061097', 'FARIDA RENDRAYANI', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061098', 'FATIA HANIFAH ZAHRA FIRDAUS', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061099', 'FERINA ROSIANA', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061301', 'FERMI DWI WICAKSONO', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061141', 'HANA SITI NURAINUN', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061143', 'IMAM SARTONO HADI WIJAYA', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061065', 'LATHIFAH GHOIDA AZHAR', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061150', 'MARLIANA NOVIANTY', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061104', 'MAULANA SUBHAN FUAD', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061153', 'MUHAMMAD ADAM RAMDHANI', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061106', 'MUTIA NURUL HAMIDAH', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061108', 'NENENG LULU WALUYANINGTIAS', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061154', 'NINDY METTA MAYANGSWARI', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061109', 'NISSA FADILLAH SOMANTRI', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061110', 'RACHMI GHALIFA MANSOOR', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061030', 'RD. DUNDEN GILANG MUHARAM', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061031', 'RENI ERNAWATI', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061112', 'RESTY MAYSEPTHENY HERNAWATI', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061032', 'REZKY MUKTI MUHAMMAD SAHID', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061113', 'RIA AYU PRATIWI', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061241', 'RIZAL RIZKY AKBAR', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061115', 'RONI SETIA LEKSONO', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061116', 'SATITI BUDI NURKUSUMAWANTI', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061117', 'SATRIO ADHI PRAMONO', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061118', 'SEPTIOADI ANGGARA PUTRA', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061119', 'SOFI SYAMILATUL FAHMI', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061120', 'TIFFANY CAESAREZA', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061121', 'TOMMY ADITYA KOMARA', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061122', 'TRI EDLIANI LESTARI', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711346', 'VALDIS REINALDO AGNAR', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061125', 'YULIANI ASTIKASARI', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061328', 'YUNIA NOVIANTI', 'X TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061168', 'A. PURNAMA YOGASWARA', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061209', 'ADITHYO DWI PUTRA', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061249', 'ANDHIKA RAMDHAN NUGRAHA', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061212', 'ANGGA AHMAD MAULANA', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061213', 'ANGGORO SUSETYO ZATI', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061004', 'ARIEFDHIANTY VIBIE HAPSARI', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061128', 'ASTRIATI', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061174', 'BOBBY RIYANDI WIDYANJAYA', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061296', 'BUDI MULIA KURNIAWAN', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711347', 'DENDY JATMIKA WIBISANA', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061178', 'DEWI QODARIAH', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061297', 'DIAN PRASETYO UTOMO', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061179', 'DIAN PUSPITA', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061221', 'DILA FATMALA', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061253', 'EMA ANALISIA ROSTIANA', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061009', 'ERIAN SUWANDI', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711348', 'ERNA RUSNIATI', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061056', 'ERWINA KOSMAWATI', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061351', 'FAHRIAN DESCA AZTIELEN', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061010', 'FAIZAL ABDUL AZIS', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061061', 'GENTA GEMA TAMZIL GEMILANG', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061015', 'GENTA JANUARY', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061303', 'HANI MAULANIA', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061225', 'HARRY LUKMAN KURNIAWAN', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061145', 'INDRA RAMADHAN BATAMA', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061191', 'IRARA ULENG', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061227', 'IRMA RAHMAWATI', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061228', 'ISNA YULITSA SARI', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061305', 'LIA AMELIA JUWITA', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061192', 'LINDUNG KRISMIN HAPSARI', 'XI TKJ 1', '-', '01/01/2008', '-', 'PROTESTAN', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711349', 'LISSA ADHISTY MUCHNI', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061196', 'MUHAMAD MULIA RAMADHAN', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061308', 'MUHAMAD RANDI NUGRAHA SAPUTRA', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061237', 'MUHAMMAD ERLANGGA MAULANA YUSU', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061198', 'NIRWAN NURSABDA', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711350', 'NITA ANDRIANI', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061239', 'NOPA NOPIYANI', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061314', 'PUJI SRI BADRIYAH', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061344', 'RABBY RADHIYA JANUARIZKI GUMAY', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061275', 'RAHMAT IMADUDDIN', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711351', 'RANGGA CIPTA NUGRAHA', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061316', 'RIAN ADI PUTRA', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061318', 'RISKI RAFIKA', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061322', 'SANDY ROZAK SETIABUDI', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061036', 'SITI ROBIATUL ADHAWIYAH', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061286', 'TSAMROTUL NURUL SHOLIHAH', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061324', 'VERAYANI', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061041', 'YUSI HERLIANI', 'XI TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061292', 'ALFAQIH NUR NUGROHO', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061345', 'ANGGA RIDWAN', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061173', 'BELAWAN JABAR', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061044', 'CHANDRA DWIPRASTIO', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711352', 'CITRA KHARISMA', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061130', 'DESTI ILMIANTI SALEH', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061348', 'DEWI SUKMAWATI SURYANA', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061132', 'DINI ASTRILIA RACHMAN', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061182', 'DWI UMAYA SARI', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061299', 'ERICK WIDARA', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061058', 'FANNY WULANDARI', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061014', 'FRISKA KHARUNIA FAUZIAH', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711353', 'GALIH PERSIANA', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061136', 'GANJAR RIZKIANA', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061302', 'GHUFRON AKMAL WIBISANA', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711354', 'GILANG NURRAKHMAT IRIANTO', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061188', 'GINA MARDIAH', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061140', 'GUMILANG RAMADHAN', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061304', 'HILMAN NUGRAHIM', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061063', 'ILHAM DWI FIRMANSYAH', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061259', 'ITA ROSITA', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061149', 'LESTARI MADYANINGATI', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711355', 'LIDIA NATALIA', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061232', 'LILIK PEBRIANTI', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061067', 'MICHAEL TAOFIQ SANYANG', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061194', 'MOCH. FAHRUR ROZI', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061268', 'MUHAMMAD NOOR HANAFIAH', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711387', 'MUHAMMAD ULUL ALBAB', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061270', 'NIA JUNIAWATI', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061024', 'NURUL APRILLIA HIDAYAH', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061025', 'OSCAR SATRYO RASPATI', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061070', 'PARYONO', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711356', 'PEPI HIDAYATTULLOH', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061313', 'PRIMA SATRIA WAHYU PUTRA SUDIO', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711357', 'RYAN NUGRAHA', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061162', 'SARI NOVI SANTOSO', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061202', 'SELVIA EFRIYANI', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061203', 'SENJA TRI HERMAWAN', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061164', 'SISKA SISMAYANTI MULYANI', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061284', 'SITI NURJANAH', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061078', 'TETEN CHOMARA', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061325', 'WIDA NINGSIH', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061083', 'YUAN FINDER TRIATMADJA', 'XI TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061084', 'ABI NURCAHYO', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061291', 'AGNES PARADHYTA', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061088', 'AMELIA LISARA', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061047', 'DERA UNGGARANI', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061176', 'DESI NOVITA SARI', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061008', 'DHIKA PRAMADI', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061091', 'DITA PRATIWI', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061095', 'ERICK ANDI SYAPUTRA M', 'XII TKJ 1', '-', '01/01/2008', '-', 'PROTESTAN', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061100', 'FITRA ALIMMA', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061017', 'GIANVALDO', 'XII TKJ 1', '-', '01/01/2008', '-', 'KATHOLIK', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061138', 'GILANG RAMADHAN', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061101', 'GINTA JUMEIGI', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061102', 'GUNAWAN MOCHAMMAD NATSIR', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061018', 'HANDI FIRMANSYAH', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061103', 'HERFINA ROSHALINE', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061189', 'HERLIANA ANGGRAENI', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061064', 'INNE NURLIA', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061021', 'MARISA MAHLIA', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061105', 'MAULIDA CITADYANA RAHMAWATI', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061066', 'MELIA SAGITA PUTRI', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061151', 'MERISA SRI RAHAYU', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061264', 'MEUTHIA LENGGOGENI TANJUNG', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711388', 'MUHAMAD RIZKY FANDIARI', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711358', 'MUHAMMAD DICKY NURZAMAN', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061107', 'NELMA FEBRIANTY', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061272', 'NURHAYATI', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061071', 'RAEY SETEA MERDIANI', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061111', 'RAFIKA ANGLING SARI', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711390', 'RAIZA MALIK', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061277', 'REDI SETIAWAN', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061317', 'RINI WULANDARI', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061073', 'RIZKI BUDHI PRIYONO', 'XII TKJ 1', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061114', 'RIZKY AULYA AKBAR', 'X MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061161', 'ROMI GUANDI', 'X MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061163', 'SHINTA KHARISMA', 'X MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061123', 'WIDYA OKTAVIA RAHMAWATI', 'X MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061079', 'WILMA NURBANDINI', 'X MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061081', 'WINDA SULISTIYANI', 'X MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061124', 'YENYEN PEBRIANI', 'X MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061169', 'ACEP SUTRISNO', 'X MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061126', 'ADAM JANUAR FIRMANSYAH SYARBIN', 'X MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711368', 'AHDIE AHMADI SOLEH', 'X MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061170', 'AI AISAH', 'X MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061359', 'ALMIRA DEVINA', 'X MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061210', 'ALYSSA PUTRISARI', 'X MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061211', 'ANDRI DJUANDA SUNARY', 'X MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061294', 'ANGGI RIYANTO RIDWAN', 'X MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711364', 'ARIEF RUSDIANA', 'X MM 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061295', 'ARYANTI', 'X MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711367', 'DESI FRASTIKA DEWI', 'X MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061177', 'DEVI SUCIATI JUHARI', 'X MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061219', 'DEVY SUKMAWATI', 'X MM 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061051', 'DYNA NANDYANI', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061055', 'ERNA PUSPITA SARI', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061223', 'FANI ANDRIANI', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061012', 'FANIDA FIRDAUSI FAUZIYAH', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061257', 'GILANG AGUNG PRASETIA', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061190', 'HILAL RAMADHAN MAHMUD', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061020', 'IRWIN REZKA FIRMANSYAH', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711366', 'MARISA DWI ARDANI', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061236', 'MEILIA KARLINA', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061306', 'MEITA DEWI ILMIA', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711359', 'MIRANTI SYLVIANI', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061152', 'MOHAMMAD ALI', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061266', 'MUHAMMAD AZMI KAMARULLAH', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061238', 'NENG KIKI AMALIA PRATIWI', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061312', 'PASQA MUHAMMAD', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061158', 'PIKI SUTANTO ADI SAPUTRA', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061159', 'PRIMANITA HANIFAH', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061029', 'RADEN DEWINTA DIESTARINA KAMAN', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061027', 'RAFIJRISKA RATNAKUMALADEWI', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061201', 'RIAN TAUFIK', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711360', 'RICA ARIYANTI', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061279', 'RIKA OKTAVIA', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061035', 'SARAH NUR FEBRIANA RAHMAYANTI', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061245', 'SURYANA', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061206', 'SYAIKHU NUR KAMALSYAH', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'L', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('060711361', 'WARTINI', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061038', 'WIDI LESTARI', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061326', 'YENYEN AGUSTIYANI SUHERMAN', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061208', 'YUDHIT ANATHA', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');
INSERT INTO `t_siswa` VALUES ('05061288', 'YULINAR PRATIWI', 'XII TKJ 2', '-', '01/01/2008', '-', 'ISLAM', 'P', '-', '', '-', '-', '-');

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
INSERT INTO `t_staf` VALUES (2, 'Alan Ridwan M', '400001001', 'L', '-', '-', '-', '-', '-', 'Penjaskes', '4/2/1964', 'Garut', '-', '-', '0', NULL, '');
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
INSERT INTO `t_statistik` VALUES ('127.0.0.1', '2012-12-15', 20, '1355587317');
INSERT INTO `t_statistik` VALUES ('127.0.0.1', '2012-12-16', 155, '1355668711');
INSERT INTO `t_statistik` VALUES ('12.12.12.2', '2012-12-16', 25, '1355653316');
INSERT INTO `t_statistik` VALUES ('12.12.12.112', '2012-12-16', 4, '1355633206');
INSERT INTO `t_statistik` VALUES ('12.12.12.109', '2012-12-16', 2, '1355634200');
INSERT INTO `t_statistik` VALUES ('12.12.12.24', '2012-12-16', 1, '1355633110');
INSERT INTO `t_statistik` VALUES ('12.12.12.53', '2012-12-16', 4, '1355633567');

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

INSERT INTO `user` VALUES (2, 'alan', '57g8786858483', 'alan@aa.com', '127.0.0.1', '21:41:53 19/04/2011', 241, 1);
INSERT INTO `user` VALUES (3, 'admin', '57gc0bbbfb6b3', 'alanrm82@yahoo.com', '127.0.0.1', '13:29:21 16/12/2012', 24, 1);

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

INSERT INTO `user_level` VALUES (32, 2, 'pelajaran', 3);
INSERT INTO `user_level` VALUES (129, 3, 'membersiswa', 5);
INSERT INTO `user_level` VALUES (31, 2, 'kelas', 3);
INSERT INTO `user_level` VALUES (30, 2, 'program', 3);
INSERT INTO `user_level` VALUES (29, 2, 'semester', 3);
INSERT INTO `user_level` VALUES (28, 2, 'kategori', 3);
INSERT INTO `user_level` VALUES (27, 2, 'gambar', 3);
INSERT INTO `user_level` VALUES (26, 2, 'template', 3);
INSERT INTO `user_level` VALUES (128, 3, 'importsiswa', 5);
INSERT INTO `user_level` VALUES (127, 3, 'dtortu', 5);
INSERT INTO `user_level` VALUES (126, 3, 'dtsiswa', 5);
INSERT INTO `user_level` VALUES (125, 3, 'dtmengajar', 4);
INSERT INTO `user_level` VALUES (124, 3, 'importguru', 4);
INSERT INTO `user_level` VALUES (25, 2, 'posisi', 3);
INSERT INTO `user_level` VALUES (24, 2, 'profil', 3);
INSERT INTO `user_level` VALUES (23, 2, 'admin', 3);
INSERT INTO `user_level` VALUES (22, 2, 'dtlaporan', 2);
INSERT INTO `user_level` VALUES (21, 2, 'dtspp', 2);
INSERT INTO `user_level` VALUES (20, 2, 'dtabsensi', 2);
INSERT INTO `user_level` VALUES (19, 2, 'dtbpbk', 2);
INSERT INTO `user_level` VALUES (18, 2, 'dtmateri', 2);
INSERT INTO `user_level` VALUES (17, 2, 'dtnilai', 2);
INSERT INTO `user_level` VALUES (16, 2, 'banner', 1);
INSERT INTO `user_level` VALUES (15, 2, 'jajak', 1);
INSERT INTO `user_level` VALUES (14, 2, 'pesandepan', 6);
INSERT INTO `user_level` VALUES (13, 2, 'prestasi', 1);
INSERT INTO `user_level` VALUES (12, 2, 'silabus', 1);
INSERT INTO `user_level` VALUES (11, 2, 'kumpulsoal', 1);
INSERT INTO `user_level` VALUES (10, 2, 'materiajar', 1);
INSERT INTO `user_level` VALUES (9, 2, 'infosekolah', 1);
INSERT INTO `user_level` VALUES (8, 2, 'infoalumni', 1);
INSERT INTO `user_level` VALUES (7, 2, 'link', 1);
INSERT INTO `user_level` VALUES (6, 2, 'galeri', 1);
INSERT INTO `user_level` VALUES (5, 2, 'forum', 1);
INSERT INTO `user_level` VALUES (4, 2, 'bukutamu', 1);
INSERT INTO `user_level` VALUES (3, 2, 'berita', 1);
INSERT INTO `user_level` VALUES (2, 2, 'agenda', 1);
INSERT INTO `user_level` VALUES (1, 2, 'artikel', 1);
INSERT INTO `user_level` VALUES (123, 3, 'dtguru', 4);
INSERT INTO `user_level` VALUES (33, 2, 'dtguru', 4);
INSERT INTO `user_level` VALUES (34, 2, 'importguru', 4);
INSERT INTO `user_level` VALUES (35, 2, 'dtmengajar', 4);
INSERT INTO `user_level` VALUES (36, 2, 'dtsiswa', 5);
INSERT INTO `user_level` VALUES (37, 2, 'dtortu', 5);
INSERT INTO `user_level` VALUES (38, 2, 'importsiswa', 5);
INSERT INTO `user_level` VALUES (39, 2, 'membersiswa', 5);
INSERT INTO `user_level` VALUES (40, 2, 'naikkelas', 5);
INSERT INTO `user_level` VALUES (41, 2, 'dtalumni', 5);
INSERT INTO `user_level` VALUES (42, 2, 'member', 6);
INSERT INTO `user_level` VALUES (43, 2, 'koordinator', 6);
INSERT INTO `user_level` VALUES (44, 2, 'opini', 6);
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
INSERT INTO `user_level` VALUES (135, 2, 'pelatihan', 1);
