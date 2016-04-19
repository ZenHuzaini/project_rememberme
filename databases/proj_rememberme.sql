-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 06 Jan 2016 pada 03.26
-- Versi Server: 5.6.20-log
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `proj_rememberme`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `lihat_diary_kontak_index`(IN `usernya` INT)
    DETERMINISTIC
begin select 
	user.ID_USER,
    user.NAMA_USER,
    user.USERNAME_USER,
    user.BIO_USER,
    user.PASSWORD_USER,
    user.NAMA_USER,
    user.FOTO_USER,
    user.FB_USER,
    user.TWIT_USER,
    user.ALAMAT_USER,
    user.NOMER_USER,
    user.EMAIL_USER,
    sub_story.ID_STORY,
    sub_story.ID_USER,
    sub_story.JUDUL_STORY,
    sub_story.TANGGAL_STORY,
    sub_story.STORY_STORY,
    sub_story.MOOD_KATEGORI_STORY,
    sub_contact.ID_KONTAK,
    sub_contact.ID_USER,
    sub_contact.ID_TEMAN,
    sub_contact.KOLHELP_CONTACT,
    sub_share.ID_SHARE,
    sub_share.ID_STORY,
    sub_share.ID_USER,
    sub_share.ID_TEMAN_SHARE,
    sub_share.KOLHELP_SHARE
from
	user, sub_story, sub_contact, sub_share
where 
	user.ID_USER = usernya and sub_story.ID_USER = usernya and sub_contact.ID_USER = usernya and sub_share.ID_USER = usernya;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lihat_temansendiri1`(IN a int)
begin
select
	sub_contact.ID_TEMAN,
    user.NAMA_USER,
    user.USERNAME_USER,
    user.BIO_USER,
    
    user.FOTO_USER,
    user.NOMER_USER,
    user.ALAMAT_USER,
    
    user.FB_USER,
    user.TWIT_USER,
    user.EMAIL_USER,
    sub_contact.ID_USER
    
from
	sub_contact, user
where
	sub_contact.ID_USER = a;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sub_contact`
--

CREATE TABLE IF NOT EXISTS `sub_contact` (
`ID_KONTAK` int(11) NOT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `ID_TEMAN` int(11) DEFAULT NULL,
  `KOLHELP_CONTACT` varchar(50) DEFAULT NULL,
  `KOLHELP_NAMAUSER` varchar(100) NOT NULL,
  `KOLHELP_ALAMAT` varchar(100) NOT NULL,
  `KOLHELP_BIO` varchar(100) NOT NULL,
  `KOLHELP_EMAIL` varchar(100) NOT NULL,
  `KOLHELP_FB` varchar(100) NOT NULL,
  `KOLHELP_TWIT` varchar(100) NOT NULL,
  `KOLHELP_TELP` varchar(100) NOT NULL,
  `KOLHELP_FOTO` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=123048 ;

--
-- Dumping data untuk tabel `sub_contact`
--

INSERT INTO `sub_contact` (`ID_KONTAK`, `ID_USER`, `ID_TEMAN`, `KOLHELP_CONTACT`, `KOLHELP_NAMAUSER`, `KOLHELP_ALAMAT`, `KOLHELP_BIO`, `KOLHELP_EMAIL`, `KOLHELP_FB`, `KOLHELP_TWIT`, `KOLHELP_TELP`, `KOLHELP_FOTO`) VALUES
(123012, 13001, 13002, 'novkur', 'Nova Kurniati', 'Bojong kenyot keluharahan sariasem', 'baik hati, pemaaf, imut seperti marmut dan suka sama anas', 'nova@kur.com', 'fb.com/novkur', 'fb.com/novkur', '0978685849697', '1450127_696134873744431_682222518_n.jpg'),
(123020, 13020, 13002, 'novkur', 'Nova Kurniati', 'Bojong kenyot keluharahan sariasem', 'baik hati, pemaaf, imut seperti marmut dan suka sama anas', 'nova@kur.com', 'fb.com/novkur', 'fb.com/novkur', '0978685849697', ''),
(123024, 13021, 13001, 'zenhuzaini', 'Zen', 'Tanah Merah', 'I''m the boy on fire, Because if the world knocks me down I will get back up!', 'zen96ev@gmail.com', 'http://facebook.com/zenhuzainii', 'http://twitter.com/@zenhuzaini', '087849900196', ''),
(123026, 13002, 13001, 'zenhuzaini', 'Zen', 'Tanah Merah', 'I''m the boy on fire, Because if the world knocks me down I will get back up!', 'zen96ev@gmail.com', 'http://facebook.com/zenhuzainii', 'http://twitter.com/@zenhuzaini', '087849900196', '13001.jpg'),
(123028, 13024, 13001, 'zenhuzaini', 'Zen', 'Tanah Merah', 'I''m the boy on fire, Because if the world knocks me down I will get back up!', 'zen96ev@gmail.com', 'http://facebook.com/zenhuzainii', 'http://twitter.com/@zenhuzaini', '087849900196', ''),
(123033, 13002, 13004, 'ivanis', 'Ivan Iswahyudi', 'Sumengngep paling timur', 'Bijaksana, pandai dan jomblo', 'ivan@ivans.com', 'http://www.fb.com/ivanis', 'http://www.twitter.com/ivanis', '0879593869386', '10931146_929149877110136_3450371240117784868_n.jpg'),
(123037, NULL, 13015, 'indra', 'Indra', 'Telang', 'Friendship is the hardest thing in the world to explain. It''s not something you learn in school. But', 'in@dra.com', 'fb.com/indra', 'twitter.com/indra', '1234567957', ''),
(123039, 13002, 13005, 'firman', 'Fiman Kurniawan', 'Pamekkasan bagian paling utara, kutub', 'Ganteng, imut seperti marmut dan baik hatinya... aku juga sering menolong nenek di rumah :)', 'fir@man.com', 'http://www.fb.com/firmanz', 'http://www.twitter.com/firmanz', '0878594928596', '10177479_845839602099942_4640140483196719306_n.jpg'),
(123041, 13001, 13004, 'ivanis', 'Ivan Iswahyudi', 'Sumengngep paling timur', 'Bijaksana, pandai dan jomblo', 'ivan@ivans.com', 'http://www.fb.com/ivanis', 'http://www.twitter.com/ivanis', '0879593869386', '10931146_929149877110136_3450371240117784868_n.jpg'),
(123042, 13001, 13005, 'firman', 'Fiman Kurniawan', 'Pamekkasan bagian paling utara, kutub', 'Ganteng, imut seperti marmut dan baik hatinya... aku juga sering menolong nenek di rumah :)', 'fir@man.com', 'http://www.fb.com/firmanz', 'http://www.twitter.com/firmanz', '0878594928596', '10177479_845839602099942_4640140483196719306_n.jpg'),
(123043, 13025, 13001, 'zenhuzaini', 'Zen', 'Tanah Merah', 'I''m the boy on fire, Because if the world knocks me down I will get back up!', 'zen96ev@gmail.com', 'http://facebook.com/zenhuzainii', 'http://twitter.com/@zenhuzaini', '087849900196', '13001.jpg'),
(123044, 13025, 13002, 'novkur', 'Nova Kurniati', 'Bojong kenyot keluharahan sariasem', 'baik hati, pemaaf, imut seperti marmut dan suka sama anas', 'nova@kur.com', 'fb.com/novkur', 'fb.com/novkur', '0978685849697', '1450127_696134873744431_682222518_n.jpg'),
(123045, 13025, 13004, 'ivanis', 'Ivan Iswahyudi', 'Sumengngep paling timur', 'Bijaksana, pandai dan jomblo', 'ivan@ivans.com', 'http://www.fb.com/ivanis', 'http://www.twitter.com/ivanis', '0879593869386', '10931146_929149877110136_3450371240117784868_n.jpg'),
(123046, 13026, 13001, 'zenhuzaini', 'Zen', 'Tanah Merah', 'I''m the boy on fire, Because if the world knocks me down I will get back up!', 'zen96ev@gmail.com', 'http://facebook.com/zenhuzainii', 'http://twitter.com/@zenhuzaini', '087849900196', '13001.jpg'),
(123047, 13028, 13025, 'zennnnn', 'zen', 'bangkalan', 'zen', 'zenhuzainii@gmail.com', 'fb.com/sokifin', 'twit/idrus', '0987654321', '13001.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sub_share`
--

CREATE TABLE IF NOT EXISTS `sub_share` (
`ID_SHARE` int(11) NOT NULL,
  `ID_STORY` int(11) DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `ID_TEMAN_SHARE` int(11) DEFAULT NULL,
  `USERNAME_TEMAN_SHARE` varchar(50) DEFAULT NULL,
  `KOLHELP_SHARE` varchar(100) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data untuk tabel `sub_share`
--

INSERT INTO `sub_share` (`ID_SHARE`, `ID_STORY`, `ID_USER`, `ID_TEMAN_SHARE`, `USERNAME_TEMAN_SHARE`, `KOLHELP_SHARE`) VALUES
(21, 1038, 13001, NULL, 'novkur', 'apa kt dunia'),
(22, 1009, 13002, NULL, 'zenhuzaini', 'Alur'),
(23, 1035, 13001, NULL, 'firman', 'String is not escaped'),
(24, 1009, 13002, NULL, 'firman', 'Alur'),
(25, 1044, 13025, NULL, 'zenhuzaini', 'suka-suka'),
(26, 1044, 13025, NULL, 'novkur', 'suka-suka'),
(27, 1044, 13025, NULL, 'ivanis', 'suka-suka'),
(28, 1046, 13026, NULL, 'zenhuzaini', 'bahagianya....'),
(29, 1049, 13028, NULL, 'zennnnn', 'I code it myself and create the report');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sub_story`
--

CREATE TABLE IF NOT EXISTS `sub_story` (
`ID_STORY` int(11) NOT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `STORY_STORY` text,
  `TANGGAL_STORY` datetime DEFAULT NULL,
  `MOOD_KATEGORI_STORY` varchar(100) DEFAULT NULL,
  `JUDUL_STORY` varchar(100) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1051 ;

--
-- Dumping data untuk tabel `sub_story`
--

INSERT INTO `sub_story` (`ID_STORY`, `ID_USER`, `STORY_STORY`, `TANGGAL_STORY`, `MOOD_KATEGORI_STORY`, `JUDUL_STORY`) VALUES
(1002, 13001, '<p>Yang dimaksud dengan Google Hacking disini menurut Efvy Zam Kerinci adalah melakukan aktifitas hacking menggunakan Google sebagai sarananya. Sehingga Anda gak boleh salah faham mengartikan kita akan meng-hack situs Google yaa&hellip; Dalam workshop Google Hacking kali ini, kita akan mencoba mendapatkan informasi-informasi berharga mengenai target hacking kita menggunakan search engine Google.</p>\r\n', '2015-12-27 00:00:00', 'Senang', 'Pengertian  Google Hacking yeah huyy'),
(1004, 13001, 'Sebelum kita melangkah lebih jauh, Anda perlu memahami operator apa saja yang dapat digunakan\r\nuntuk Google, operator-operator ini nantinya dapat mempersempit pencarian dan penggunaan\r\noperator yang tepat akan dapat memperoleh hasil yang maksimal. ', '2015-12-15 07:16:21', 'Sedih', 'Yang Perlu Anda Tahu'),
(1005, 13001, 'Teknik Membuat Presentasi yang Baik dan Benar \r\n \r\nSebuah slide yang baik akan mampu menjelaskan ide dan gagasan yang ingin disampaikan\r\nseorang presenter. Dengan demikian, audiens akan terbantu ketika melihat slide yang\r\nditampilkan dan presenter pun lebih mudah menjelaskan apa makna yang dikandung oleh slide\r\ntersebut. \r\nLantas, apakah ciri khas dari slide yang mampu menggambarkan pesan dengan lebih baik? \r\nCoba perhatikan pasangan slide berikut ini. Mana menurut Anda slide yang lebih baik? ', '2015-12-09 02:00:19', 'Bahagia', 'Teknik Membuat Presentasi yang Baik dan Benar '),
(1006, 13002, 'Mengubah Cara Penyajian Lebih Menarik \r\n   \r\nSlide di kiri tampil menarik dengan menggunakan kotak berwarna warni berisi penjelasan apa manfaat dari\r\nketerampilan membaca cepat. \r\nSlide di kanan tampil lebih menarik lagi dengan menempatkan judul membaca cepat di tengah\r\ndan dibuat bergaya mind map dengan membuat empat cabang yang berisi ringkasan dari\r\nmanfaat membaca cepat menggunakan hanya kata kunci saja ditambah gambar yang mewakili\r\nkata kunci tersebut. ', '2015-12-05 07:42:59', 'Marah', 'Mengubah Cara Penyajian Lebih Menarik'),
(1007, 13004, 'Sederhana \r\nSederhana itu indah. Hal yang sama berlaku untuk slide. Slide sederhana mudah dipahami\r\naudiens dalam beberapa detik pertama. Lakukan hal ini dan pastikan pesan yang ingin\r\ndisampaikan jelas. \r\nJangan gunakan slide yang rumit sehingga audiens kesulitan memahami maksudnya. Ini\r\nmengganggu proses komunikasi visual yang sedang Anda lakukan dalam presentasi. Alih-alih\r\nmembantu komunikasi, slide tersebut malah menghambat komunikasi. Bahkan tak jarang\r\npresenter justru menjadi kesulitan menjelaskan maksud dari slide-nya sendiri. ', '2015-12-01 10:14:43', 'Bingung', 'Sederhana '),
(1008, 13005, 'Kuat secara visual \r\nSlide yang baik memiliki kesan visual yang kuat. Artinya, slide tersebut mampu menumbuhkan\r\nsemangat, mengundang pertanyaan, menciptakan rasa ingin tahu, atau menggugah emosi\r\naudiens. \r\nJika Anda menggunakan gambar, pilih yang paling tepat untuk menggambarkan situasi yang\r\nAnda jelaskan. Jika Anda menggunakan diagram, pastikan mudah dipahami, dan fokuskan\r\nperhatian pada bagian penting dari data yang ditampilkan. Jika Anda menggunakan teks, pilih\r\nkata kunci yang mewakili gagasan yang ingin disampaikan. Jika Anda menampilkan video,\r\npilih segmen yang mampu menjelaskan pesan dengan menarik. ', '2015-12-16 09:13:08', 'Bahagia', 'Kuat secara visual '),
(1009, 13002, '<p>Slide-slide yang baik memiliki alur teratur, dari pembukaan, penjelasan, sampai penutup. Audiens akan melihatnya sebagai satu kesatuan yang harmonis dan sinergis. Slide yang isinya melompat-lompat dari satu topik ke topik yang lain tanpa alur yang jelas akan menyulitkan audiens untuk memahaminya. Jika Anda sudah mengetahui ciri-ciri slide yang baik, maka mulailah menerapkannya setiap kali membuat slide presentasi. Mungkin tidak selalu mudah pada awalnya, karena Anda belum terbiasa. Tapi lama kelamaan Anda akan menjadi seorang komunikator visual yang handal.</p>\r\n', '2015-12-10 00:00:00', 'Senang', 'Alur'),
(1011, 13001, '<p>- USER<br />\r\n&nbsp;&nbsp; &nbsp;- Write diary<br />\r\n&nbsp;&nbsp; &nbsp;- edit diary<br />\r\n&nbsp;&nbsp; &nbsp;- erase diary<br />\r\n&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;- share the diary (only for added user)<br />\r\n&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;- add personal info of other user<br />\r\n&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;- search the diaries<br />\r\n&nbsp;&nbsp; &nbsp;- serach the people (for added user or not) &nbsp;&nbsp; &nbsp;</p>\r\n\r\n<p>- SHARED DIARY FORM OTHER USER<br />\r\n&nbsp;&nbsp; &nbsp;- can&#39;t delete nor edit the diary</p>\r\n\r\n<p><br />\r\nNOT YET IMPLEMENTED<br />\r\n&nbsp;&nbsp; &nbsp;LOGIN<br />\r\n&nbsp;&nbsp; &nbsp;CREATE A VIEW OR PROCEDURE for implementing some of features above<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;- VIEW for Sub Contact<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;- VIEW for index between friend contact and diary</p>\r\n', '2015-12-25 00:00:00', 'Bahagia', 'Ruwet'),
(1012, 13002, '<p>Dude, awesome snippet, but can you please put a comment in your JS stating you should remove that last part..? That will save JS nitwits like me a lot of time and frustration from trying to figure out why (all of!!) their forms aren&#39;t submitting anymore... :D</p>\r\n', '2015-12-28 00:00:00', 'Senang', 'Full Screen Search'),
(1019, 13002, '<p>Teknologi Informasi dan Komunikasi merupakan elemen penting dalam kehidupan berbangsa dan bernegara. Peranan teknologi informasi pada aktivitas manusia pada saat ini begitu besar dan telah menjadi fasilitas utama bagi kegiatan berbagai sektor kehidupan mulai dari trasportasi, kesehatan hingga pendidikan.</p>\r\n\r\n<p>Secara umum, Penggunaan teknologi dalam pembelajaran (e-learning) dapat didefinisikan sebagai metode pembelajaran yang disampaikan melalui semua media elektronik termasuk, internet, intranet, extranet, satelit, audio/video tape, TV interaktif dan komputer yang berguna untuk meningkatkankan kualitas pembelajaran dan sebagai sumber pengetahuan .</p>\r\n', '2015-12-23 00:00:00', 'Hancur', 'PEMBAJAKAN KARYA'),
(1020, 13012, 'Sia, salah satu musisi di balik kesuksesan hits 2012 Rihanna Diamonds, sebenarnya menawarkan lagu ini kepada penyanyi asal Barbados tersebut untuk mengisi koleksi lagu dari album terbarunya, Anti. Namun, Rihanna menolaknya.\r\n\r\n"Saya menyadari dan segera membatalkannya karena lagu ini terdengar sedikit terlalu Brit-pop untuknya," kata Sia, seperti dilansir dari Aceshowbiz.\r\n\r\nThis Is Acting berisi lagu-lagu yang sebenarnya Sia tulis untuk penyanyi-penyanyi lain, seperti Adele, Rihanna dan Beyonce Knowles. Album ini dijadwalkan akan rilis resmi pada tanggal 29 Januari 2016.', '2015-12-28 07:17:39', 'SENANG', 'Sia Furler Kembali Rilis Lagu Baru'),
(1021, 13013, 'Selamat Datang di Rememberme :) . terimakasih untuk menggunakan aplikasi ini, semoga aplikasi ini dapat membantu anda dalam menjalanai kehidupan anda dan mengingat masa lalu juga teman anda... ', '0000-00-00 00:00:00', 'Bahagia', 'Selamat Datang!'),
(1022, 13013, '<p>Why did you do all this for me?&#39; he asked. &#39;I don&#39;t deserve it. I&#39;ve never done anything for you.&#39; &#39;You have been my friend,&#39; replied Charlotte. &#39;That in itself is a tremendous thing</p>\r\n', '2015-12-30 00:00:00', 'Galau', 'Someone Like You'),
(1023, 13014, 'Selamat Datang di Rememberme :) . terimakasih untuk menggunakan aplikasi ini, semoga aplikasi ini dapat membantu anda dalam menjalanai kehidupan anda dan mengingat masa lalu juga teman anda... ', '0000-00-00 00:00:00', 'Bahagia', 'Selamat Datang!'),
(1024, 13015, 'Selamat Datang di Rememberme :) . terimakasih untuk menggunakan aplikasi ini, semoga aplikasi ini dapat membantu anda dalam menjalanai kehidupan anda dan mengingat masa lalu juga teman anda... ', '0000-00-00 00:00:00', 'Bahagia', 'Selamat Datang!'),
(1029, 13020, 'Selamat Datang di Rememberme :) . terimakasih untuk menggunakan aplikasi ini, semoga aplikasi ini dapat membantu anda dalam menjalanai kehidupan anda dan mengingat masa lalu juga teman anda... ', '0000-00-00 00:00:00', 'Bahagia', 'Selamat Datang!'),
(1030, 13021, 'Selamat Datang di Rememberme :) . terimakasih untuk menggunakan aplikasi ini, semoga aplikasi ini dapat membantu anda dalam menjalanai kehidupan anda dan mengingat masa lalu juga teman anda... ', '0000-00-00 00:00:00', 'Bahagia', 'Selamat Datang!'),
(1031, 13021, '<p>adalah Tahun Monyet Api dan akan dimulai di tanggal 8 Februari nanti. Api juga sebagai elemen dominan di tahun itu yang dapat kasih daya besar buat menguatkan kemauan untuk mereka yang Shio-nya Monyet. Mereka berusaha buat jadi pemenang dan berkeinginan agar prestasinya selalu diakuin. Pengakuan atas ini dapat kasih mereka kepuasan bekerja yang lebih besar dari uang.</p>\r\n', '2016-01-21 00:00:00', 'Senang', 'Berita Hari Ini: 2016 Shio Apa?, Ini Dia Ramalan Shio 2016'),
(1033, 13023, 'Selamat Datang di Rememberme :) . terimakasih untuk menggunakan aplikasi ini, semoga aplikasi ini dapat membantu anda dalam menjalanai kehidupan anda dan mengingat masa lalu juga teman anda... ', '0000-00-00 00:00:00', 'Bahagia', 'Selamat Datang!'),
(1034, 13001, '<p>How do I live? How do I breathe?<br />\r\nWhen you&#39;re not here I&#39;m suffocating<br />\r\nI want to feel love, run through my blood<br />\r\nTell me is this where I give it all up?<br />\r\nFor you I have to risk it all<br />\r\nCause the writing&#39;s on the wall<br />\r\n<br />\r\nA million shards of glass<br />\r\nThat haunt me from my past<br />\r\nAs the stars begin to gather<br />\r\nAnd the light begins to fade<br />\r\nWhen all hope begins to shatter<br />\r\nKnow that I won&#39;t be afraid</p>\r\n', '2016-01-12 00:00:00', 'Senang', 'Writing''s On The Wall'),
(1035, 13001, '<p><img alt="" src="G:\\Teknik Informatika\\Xampp\\htdocs\\project_rememberme\\public\\images" /><a href="G:\\Teknik Informatika\\Xampp\\htdocs\\project_rememberme\\public\\images" target="_parent"><img alt="" src="/../images/1450337961_male.png" style="float:left; height:256px; width:256px" /></a>&nbsp;aku akan sellau mencoba menjadi yang terbaik dai antara teman temanku :)</p>\r\n\r\n<p>Just a question however:<br />\r\nthe string is a message that is meant to be displayed in a browser or in an email.<br />\r\nBecause the string is not escaped anymore <strong><em>(with &lt;%- %&gt;)</em></strong> does it may cause some security issues?</p>\r\n', '2016-01-04 00:00:00', 'Bahagia', 'String is not escaped'),
(1036, 13024, 'Selamat Datang di Rememberme :) . terimakasih untuk menggunakan aplikasi ini, semoga aplikasi ini dapat membantu anda dalam menjalanai kehidupan anda dan mengingat masa lalu juga teman anda... ', '0000-00-00 00:00:00', 'Bahagia', 'Selamat Datang!'),
(1037, 13024, '<blockquote>\r\n<p>aku sekarang belajar nodejs&nbsp;<img alt="" src="/../images/1450338113_female.png" style="height:100px; width:100px" />&nbsp;</p>\r\n\r\n<p>asik....</p>\r\n</blockquote>\r\n', '2016-01-04 00:00:00', 'Bahagia', 'Aku bahagia'),
(1038, 13001, '<p><img alt="heart" src="http://localhost:1996/stylesheets/ckeditor_full/plugins/smiley/images/heart.png" style="height:23px; width:23px" title="heart" /></p>\r\n', '2016-01-21 00:00:00', 'Sedih', 'apa kta aadunia'),
(1043, 13025, 'Selamat Datang di Rememberme :) . terimakasih untuk menggunakan aplikasi ini, semoga aplikasi ini dapat membantu anda dalam menjalanai kehidupan anda dan mengingat masa lalu juga teman anda... ', '0000-00-00 00:00:00', 'Bahagia', 'Selamat Datang!'),
(1044, 13025, '<p><img alt="smiley" src="http://localhost:1996/stylesheets/ckeditor_full/plugins/smiley/images/regular_smile.png" style="height:23px; width:23px" title="smiley" />gfhgfhgfghf</p>\r\n', '2016-01-27 00:00:00', 'Senang', 'suka-suka'),
(1045, 13026, 'Selamat Datang di Rememberme :) . terimakasih untuk menggunakan aplikasi ini, semoga aplikasi ini dapat membantu anda dalam menjalanai kehidupan anda dan mengingat masa lalu juga teman anda... ', '0000-00-00 00:00:00', 'Bahagia', 'Selamat Datang!'),
(1046, 13026, '<p>senangnya....<img alt="laugh" src="http://localhost:1996/stylesheets/ckeditor_full/plugins/smiley/images/teeth_smile.png" style="height:23px; width:23px" title="laugh" /></p>\r\n', '2016-01-05 00:00:00', 'Senang', 'bahagianya....'),
(1047, 13027, 'Selamat Datang di Rememberme :) . terimakasih untuk menggunakan aplikasi ini, semoga aplikasi ini dapat membantu anda dalam menjalanai kehidupan anda dan mengingat masa lalu juga teman anda... ', '0000-00-00 00:00:00', 'Bahagia', 'Selamat Datang!'),
(1049, 13028, '<p><img alt="wink" src="http://localhost:1996/stylesheets/ckeditor_full/plugins/smiley/images/wink_smile.png" style="height:23px; width:23px" title="wink" />Alhamdulillah i can code and finish it at the time....&nbsp;</p>\r\n\r\n<p>even when none of my team came just to help ...&nbsp;</p>\r\n', '0000-00-00 00:00:00', 'Senang', 'I code it myself and create the report'),
(1050, 13028, '', '0000-00-00 00:00:00', 'Pilih Moodmu', 'another');

--
-- Trigger `sub_story`
--
DELIMITER //
CREATE TRIGGER `updatesetelah_didelete` BEFORE DELETE ON `sub_story`
 FOR EACH ROW begin
  delete from sub_share where ID_STORY = old.ID_STORY;
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`ID_USER` int(11) NOT NULL,
  `NAMA_USER` varchar(30) DEFAULT NULL,
  `USERNAME_USER` varchar(30) DEFAULT NULL,
  `PASSWORD_USER` varchar(6) DEFAULT NULL,
  `FOTO_USER` varchar(1000) DEFAULT NULL,
  `FB_USER` varchar(100) DEFAULT NULL,
  `TWIT_USER` varchar(100) DEFAULT NULL,
  `BIO_USER` varchar(100) DEFAULT NULL,
  `ALAMAT_USER` varchar(100) DEFAULT NULL,
  `NOMER_USER` varchar(100) DEFAULT NULL,
  `EMAIL_USER` varchar(100) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13029 ;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`ID_USER`, `NAMA_USER`, `USERNAME_USER`, `PASSWORD_USER`, `FOTO_USER`, `FB_USER`, `TWIT_USER`, `BIO_USER`, `ALAMAT_USER`, `NOMER_USER`, `EMAIL_USER`) VALUES
(13001, 'Zen', 'zenhuzaini', 'zenhuz', '13001.jpg', 'http://facebook.com/zenhuzainii', 'http://twitter.com/@zenhuzaini', 'I''m the boy on fire, Because if the world knocks me down I will get back up!', 'Tanah Merah', '087849900196', 'zen96ev@gmail.com'),
(13002, 'Nova Kurniati', 'novkur', 'novkur', '1450127_696134873744431_682222518_n.jpg', 'fb.com/novkur', 'fb.com/novkur', 'baik hati, pemaaf, imut seperti marmut dan suka sama anas', 'Bojong kenyot keluharahan sariasem', '0978685849697', 'nova@kur.com'),
(13004, 'Ivan Iswahyudi', 'ivanis', 'ivan', '10931146_929149877110136_3450371240117784868_n.jpg', 'http://www.fb.com/ivanis', 'http://www.twitter.com/ivanis', 'Bijaksana, pandai dan jomblo', 'Sumengngep paling timur', '0879593869386', 'ivan@ivans.com'),
(13005, 'Fiman Kurniawan', 'firman', 'firman', '10177479_845839602099942_4640140483196719306_n.jpg', 'http://www.fb.com/firmanz', 'http://www.twitter.com/firmanz', 'Ganteng, imut seperti marmut dan baik hatinya... aku juga sering menolong nenek di rumah :)', 'Pamekkasan bagian paling utara, kutub', '0878594928596', 'fir@man.com'),
(13006, 'Saipul', 'say', 'say', '10177479_845839602099942_4640140483196719306_n.jpg', 'http://www.fb.com/say', 'http://www.twitter.com/say', 'aku imut , manja, dan sangat senang sekali makan tikus :v ', 'Grezik, di bawah tambak', '08765436273', 'say@pul.com'),
(13007, 'Agus', 'ads', 'ads', '', 'http://www.fb.com/sayasdiansaputra', 'http://www.twitter.com/sayasdiansaputra', 'cintaku hanya untuknya ... aku mencintainya sangat mencintainya... bagiku dia segalanya...', 'jember kota dodol garut', '0817865543', 'ads@a.com'),
(13008, 'Dandy Nurhamdina', 'dandi', 'dandi', '', 'http://www.fb.com/dandy', 'http://www.twitter.com/dandy', 'Aku ini oangnya tampan dan pinter namun aku sering nangis jika cering dicakiti T_T', 'Surabaya utara, dekat kenjeran ', '09876563745', 'dan@di.com'),
(13011, 'masdarwiyono', 'yon', 'yon', '', 'htp://fb.com/yon', 'htp://twitter.com/yon', 'aku sih yes', 'sumenep', '098765432', 'mada@wiyono.com'),
(13012, 'Kholiq', 'kholiq', 'kholiq', '', 'http://www.fb.com/holiq', 'http://www.twitter.com/holiq', 'aku suka makan nasi', 'lab cc', '0987544i987', 'kho@liq.com'),
(13013, 'Dimas A P', 'dimas', 'dimas', '', 'http://www.fb.com/dimas', 'http://www.twitter.com/dimas', 'When someone loves you, the way they talk about you is different. You feel safe and comfortable.', 'Bangkalan', '09475638261', 'di@mas.com'),
(13014, 'Saheer Rodden', 'saher', 'saher', '', 'fb.com/saher', 'twitter.com/saher', 'Out beyond ideas of wrongdoing  and rightdoing there is a field. I''ll meet you there.  When the soul', 'sumenep', '0987654321', 'saher@ruddin.com'),
(13015, 'Indra', 'indra', 'indra', '', 'fb.com/indra', 'twitter.com/indra', 'Friendship is the hardest thing in the world to explain. It''s not something you learn in school. But', 'Telang', '1234567957', 'in@dra.com'),
(13020, 'Dewi Yuli', 'dewyul', 'dewyul', '', 'fb.com/dewyul', 'twitter.com/dewyul', 'No person is your friend who demands your silence, or denies your right to grow', 'Bangkalan', '970684635585', 'dew@yul.com'),
(13021, 'Sokidin M', 'sokidin', '123456', '', 'fb.com/sokifin', 'fb.com/sokifin', 'aku adalah anak gembala yang selalu riang serta gembira', 'Blitar', '098765432', 'so@kidin.com'),
(13023, 'bjskv', 'b', 'b', '1512475_762711600411686_1857668243_n.jpg', 'bb', 'b', '', '', '', ''),
(13024, 'Idruszzz', 'idruz', 'idruz', '10325655_236778096512314_313990904480674528_n.jpg', 'fb/idrus', 'twit/idrus', 'aku cantik ', 'lab cc', '0987654', 'id@rus.com'),
(13025, 'zen', 'zennnnn', 'zen', '13001.jpg', 'fb.com/sokifin', 'twit/idrus', 'zen', 'bangkalan', '0987654321', 'zenhuzainii@gmail.com'),
(13026, 'lala', 'lala', 'lala', '1450337961_male.png', 'fb.com/lala', 'twit/lala', 'lala', 'bangkalan', '0976543221', 'lala@gmail.com'),
(13027, 'rijal', 'rijal', 'rijal', '10325655_236778096512314_313990904480674528_n.jpg', '', '', '', '', '', ''),
(13028, 'Zen Huzaini', 'theboyonfire', 'zen', 'DSC_0389.jpg', 'zen', 'zen', 'I am handsome', '', '', '');

--
-- Trigger `user`
--
DELIMITER //
CREATE TRIGGER `buat_diary_baru_langsung` AFTER INSERT ON `user`
 FOR EACH ROW begin

	insert into sub_story values ('',new.ID_USER,  'Selamat Datang di Rememberme :) . terimakasih untuk menggunakan aplikasi ini, semoga aplikasi ini dapat membantu anda dalam menjalanai kehidupan anda dan mengingat masa lalu juga teman anda... ' ,'','Bahagia','Selamat Datang!' );
end
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_korhelp_contact` AFTER UPDATE ON `user`
 FOR EACH ROW begin
  update sub_contact set KOLHELP_BIO = new.BIO_USER , 
  KOLHELP_ALAMAT = new.ALAMAT_USER,
  KOLHELP_NAMAUSER = new.NAMA_USER,
  KOLHELP_EMAIL = new.EMAIL_USER,
  KOLHELP_FB = new.FB_USER,
  KOLHELP_TWIT = new.TWIT_USER,
  KOLHELP_TELP = new.NOMER_USER
  
    where ID_TEMAN = new.ID_USER;
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_baca_share`
--
CREATE TABLE IF NOT EXISTS `view_baca_share` (
`ID_USER` int(11)
,`NAMA_USER` varchar(30)
,`USERNAME_USER` varchar(30)
,`BIO_USER` varchar(100)
,`FOTO_USER` varchar(1000)
,`FB_USER` varchar(100)
,`ID_STORY` int(11)
,`MOOD_KATEGORI_STORY` varchar(100)
,`JUDUL_STORY` varchar(100)
,`TANGGAL_STORY` datetime
,`STORY_STORY` text
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_index`
--
CREATE TABLE IF NOT EXISTS `view_index` (
`ID_USER` int(11)
,`NAMA_USER` varchar(30)
,`USERNAME_USER` varchar(30)
,`BIO_USER` varchar(100)
,`FOTO_USER` varchar(1000)
,`ALAMAT_USER` varchar(100)
,`EMAIL_USER` varchar(100)
,`FB_USER` varchar(100)
,`ID_STORY` int(11)
,`JUDUL_STORY` varchar(100)
,`TANGGAL_STORY` datetime
,`STORY_STORY` text
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_index1`
--
CREATE TABLE IF NOT EXISTS `view_index1` (
`ID_USER` int(11)
,`NAMA_USER` varchar(30)
,`USERNAME_USER` varchar(30)
,`BIO_USER` varchar(100)
,`FOTO_USER` varchar(1000)
,`ALAMAT_USER` varchar(100)
,`EMAIL_USER` varchar(100)
,`FB_USER` varchar(100)
,`ID_STORY` int(11)
,`JUDUL_STORY` varchar(100)
,`TANGGAL_STORY` datetime
,`STORY_STORY` text
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_index_baca`
--
CREATE TABLE IF NOT EXISTS `view_index_baca` (
`ID_USER` int(11)
,`NAMA_USER` varchar(30)
,`USERNAME_USER` varchar(30)
,`BIO_USER` varchar(100)
,`FOTO_USER` varchar(1000)
,`ALAMAT_USER` varchar(100)
,`EMAIL_USER` varchar(100)
,`FB_USER` varchar(100)
,`MOOD_KATEGORI_STORY` varchar(100)
,`ID_STORY` int(11)
,`JUDUL_STORY` varchar(100)
,`TANGGAL_STORY` datetime
,`STORY_STORY` text
);
-- --------------------------------------------------------

--
-- Struktur untuk view `view_baca_share`
--
DROP TABLE IF EXISTS `view_baca_share`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_baca_share` AS select `user`.`ID_USER` AS `ID_USER`,`user`.`NAMA_USER` AS `NAMA_USER`,`user`.`USERNAME_USER` AS `USERNAME_USER`,`user`.`BIO_USER` AS `BIO_USER`,`user`.`FOTO_USER` AS `FOTO_USER`,`user`.`FB_USER` AS `FB_USER`,`sub_story`.`ID_STORY` AS `ID_STORY`,`sub_story`.`MOOD_KATEGORI_STORY` AS `MOOD_KATEGORI_STORY`,`sub_story`.`JUDUL_STORY` AS `JUDUL_STORY`,`sub_story`.`TANGGAL_STORY` AS `TANGGAL_STORY`,`sub_story`.`STORY_STORY` AS `STORY_STORY` from (`user` join `sub_story`) where (`user`.`ID_USER` = `sub_story`.`ID_USER`);

-- --------------------------------------------------------

--
-- Struktur untuk view `view_index`
--
DROP TABLE IF EXISTS `view_index`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_index` AS select `user`.`ID_USER` AS `ID_USER`,`user`.`NAMA_USER` AS `NAMA_USER`,`user`.`USERNAME_USER` AS `USERNAME_USER`,`user`.`BIO_USER` AS `BIO_USER`,`user`.`FOTO_USER` AS `FOTO_USER`,`user`.`ALAMAT_USER` AS `ALAMAT_USER`,`user`.`EMAIL_USER` AS `EMAIL_USER`,`user`.`FB_USER` AS `FB_USER`,`sub_story`.`ID_STORY` AS `ID_STORY`,`sub_story`.`JUDUL_STORY` AS `JUDUL_STORY`,`sub_story`.`TANGGAL_STORY` AS `TANGGAL_STORY`,`sub_story`.`STORY_STORY` AS `STORY_STORY` from (`user` join `sub_story`) where (`user`.`ID_USER` = `sub_story`.`ID_USER`);

-- --------------------------------------------------------

--
-- Struktur untuk view `view_index1`
--
DROP TABLE IF EXISTS `view_index1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_index1` AS select `user`.`ID_USER` AS `ID_USER`,`user`.`NAMA_USER` AS `NAMA_USER`,`user`.`USERNAME_USER` AS `USERNAME_USER`,`user`.`BIO_USER` AS `BIO_USER`,`user`.`FOTO_USER` AS `FOTO_USER`,`user`.`ALAMAT_USER` AS `ALAMAT_USER`,`user`.`EMAIL_USER` AS `EMAIL_USER`,`user`.`FB_USER` AS `FB_USER`,`sub_story`.`ID_STORY` AS `ID_STORY`,`sub_story`.`JUDUL_STORY` AS `JUDUL_STORY`,`sub_story`.`TANGGAL_STORY` AS `TANGGAL_STORY`,`sub_story`.`STORY_STORY` AS `STORY_STORY` from (`user` join `sub_story`);

-- --------------------------------------------------------

--
-- Struktur untuk view `view_index_baca`
--
DROP TABLE IF EXISTS `view_index_baca`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_index_baca` AS select `user`.`ID_USER` AS `ID_USER`,`user`.`NAMA_USER` AS `NAMA_USER`,`user`.`USERNAME_USER` AS `USERNAME_USER`,`user`.`BIO_USER` AS `BIO_USER`,`user`.`FOTO_USER` AS `FOTO_USER`,`user`.`ALAMAT_USER` AS `ALAMAT_USER`,`user`.`EMAIL_USER` AS `EMAIL_USER`,`user`.`FB_USER` AS `FB_USER`,`sub_story`.`MOOD_KATEGORI_STORY` AS `MOOD_KATEGORI_STORY`,`sub_story`.`ID_STORY` AS `ID_STORY`,`sub_story`.`JUDUL_STORY` AS `JUDUL_STORY`,`sub_story`.`TANGGAL_STORY` AS `TANGGAL_STORY`,`sub_story`.`STORY_STORY` AS `STORY_STORY` from (`user` join `sub_story`) where (`user`.`ID_USER` = `sub_story`.`ID_USER`);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sub_contact`
--
ALTER TABLE `sub_contact`
 ADD PRIMARY KEY (`ID_KONTAK`), ADD KEY `FK_MEMILIKI` (`ID_USER`);

--
-- Indexes for table `sub_share`
--
ALTER TABLE `sub_share`
 ADD PRIMARY KEY (`ID_SHARE`), ADD KEY `FK_RELATIONSHIP_3` (`ID_USER`), ADD KEY `FK_RELATIONSHIP_4` (`ID_STORY`);

--
-- Indexes for table `sub_story`
--
ALTER TABLE `sub_story`
 ADD PRIMARY KEY (`ID_STORY`), ADD KEY `FK_MEMPUNYAI` (`ID_USER`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`ID_USER`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sub_contact`
--
ALTER TABLE `sub_contact`
MODIFY `ID_KONTAK` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=123048;
--
-- AUTO_INCREMENT for table `sub_share`
--
ALTER TABLE `sub_share`
MODIFY `ID_SHARE` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `sub_story`
--
ALTER TABLE `sub_story`
MODIFY `ID_STORY` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1051;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `ID_USER` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13029;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `sub_contact`
--
ALTER TABLE `sub_contact`
ADD CONSTRAINT `FK_MEMILIKI` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`);

--
-- Ketidakleluasaan untuk tabel `sub_share`
--
ALTER TABLE `sub_share`
ADD CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`),
ADD CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`ID_STORY`) REFERENCES `sub_story` (`ID_STORY`);

--
-- Ketidakleluasaan untuk tabel `sub_story`
--
ALTER TABLE `sub_story`
ADD CONSTRAINT `FK_MEMPUNYAI` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
