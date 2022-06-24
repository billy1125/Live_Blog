-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-06-24 15:09:08
-- 伺服器版本： 10.4.24-MariaDB
-- PHP 版本： 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `blog`
--

-- --------------------------------------------------------

--
-- 資料表結構 `posts`
--

CREATE TABLE `posts` (
  `id` int(10) NOT NULL,
  `user_id` int(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `post` text NOT NULL,
  `isPin` int(1) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `post`, `isPin`, `datetime`) VALUES
(1, 1, '有誰可以推薦一支不錯的智慧型手錶？', '其實自己也有一段時間沒帶錶了，只是想說因為有登山需求，想說弄一隻\r\n有導航、量測一下身體狀況、紀錄一下路徑數據。\r\n\r\n先不考慮中國品牌。\r\n\r\n目前看\r\nFossil GEN 6\r\n台灣這邊沒賣但AMAZON折合台幣大概7XXX元。\r\n外觀算是最討我喜，WEAR OS與高通4100\r\n唯一比較擔心的是續航力，前一代連撐一天都難，這一代不知道有沒有好些。\r\n我怕他開GOOGLE MAP連10小時都稱不到...\r\n\r\nGARMIN\r\n型號太多了，我不確定萬元左右型號是否能夠導航，\r\n網站上簡介導航大概都要到FENIX系列才有，一隻大概兩萬5起..\r\n當然價格也反應在規格上，續航力、潛水能力都在水準上...\r\n\r\nSAMSUNG GALAXY WATCH4\r\n目前規格相對好，WEAR OS應該可以跟我的PIXEL連動.\r\n\r\n\r\n目前還有其他推薦的嗎? ', 1, '2022-06-23 12:35:02'),
(2, 6, 'AMD 新驅動程式提升最多17%效能', '<p>I am ready for the road less traveled. Already <a href=\"#\">brushing off the dust</a>. Yeah,\r\n                        you\'re lucky if you\'re on her plane. I used to bite my tongue and hold my breath. Uh, She’s a\r\n                        beast. I call her Karma (come back). Black ray-bans, you know she\'s with the band. I can\'t sleep\r\n                        let\'s run away and don\'t ever look back, don\'t ever look back.</p>\r\n                    <blockquote>\r\n                        <p>Growing fast into a <strong>bolt of lightning</strong>. Be careful Try not to lead her on</p>\r\n                    </blockquote>\r\n                    <p>I\'m intrigued, for a peek, heard it\'s fascinating. Oh oh! Wanna be a victim ready for abduction.\r\n                        She\'s got that international smile, oh yeah, she\'s got that one international smile. Do you ever\r\n                        feel, feel so paper thin. I’m gon’ put her in a coma. Sun-kissed skin so hot we\'ll melt your\r\n                        popsicle.</p>\r\n                    <p>This is transcendental, on another level, boy, you\'re my lucky star.</p>', 0, '2022-06-22 13:48:17'),
(3, 1, '憑什麼說30系卡全是礦？礦主直接實例分析給你聽！', '<p>From Tokyo to Mexico, to Rio. Yeah, you take me to utopia. I\'m walking on air. We\'d make out in\r\n                        your Mustang to Radiohead. I mean the ones, I mean like she\'s the one. Sun-kissed skin so hot\r\n                        we\'ll melt your popsicle. Slow cooking pancakes for my boy, still up, still fresh as a Daisy.\r\n                    </p>\r\n                    <ul>\r\n                        <li>I hope you got a healthy appetite.</li>\r\n                        <li>You\'re never gonna be unsatisfied.</li>\r\n                        <li>Got a motel and built a fort out of sheets.</li>\r\n                    </ul>\r\n                    <p>Don\'t need apologies. Boy, you\'re an alien your touch so foreign, it\'s <em>supernatural</em>,\r\n                        extraterrestrial. Talk about our future like we had a clue. I can feel a phoenix inside of me.\r\n                    </p>', 1, '2022-06-23 12:52:57');

-- --------------------------------------------------------

--
-- 資料表結構 `post_detail`
--

CREATE TABLE `post_detail` (
  `id` int(10) NOT NULL,
  `post_id` int(10) NOT NULL,
  `user_id` int(5) NOT NULL,
  `message` text DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `post_detail`
--

INSERT INTO `post_detail` (`id`, `post_id`, `user_id`, `message`, `datetime`) VALUES
(1, 1, 1, '其實自己也有一段時間沒帶錶了，只是想說因為有登山需求，想說弄一隻\r\n有導航、量測一下身體狀況、紀錄一下路徑數據。\r\n\r\n先不考慮中國品牌。\r\n\r\n目前看\r\nFossil GEN 6\r\n台灣這邊沒賣但AMAZON折合台幣大概7XXX元。\r\n外觀算是最討我喜，WEAR OS與高通4100\r\n唯一比較擔心的是續航力，前一代連撐一天都難，這一代不知道有沒有好些。\r\n我怕他開GOOGLE MAP連10小時都稱不到...\r\n\r\nGARMIN\r\n型號太多了，我不確定萬元左右型號是否能夠導航，\r\n網站上簡介導航大概都要到FENIX系列才有，一隻大概兩萬5起..\r\n當然價格也反應在規格上，續航力、潛水能力都在水準上...\r\n\r\nSAMSUNG GALAXY WATCH4\r\n目前規格相對好，WEAR OS應該可以跟我的PIXEL連動.\r\n\r\n\r\n目前還有其他推薦的嗎? ', '2022-04-29 01:28:09'),
(2, 1, 6, '如果ios系統就用apple watch\r\nandroid就選samsung watch\r\n去年跟前年幾乎每天游泳時有survey過想買一隻來記泳程，\r\n結果，apple watch辨識力最猛，完全沒對手，連泳式都能精準辨識，三爽的就評價比較有好有壞(我是看amazon的評價)。\r\n原本也有考慮其它品牌，但看完評價就都放生了..', '2022-04-29 01:31:41'),
(3, 1, 1, '沒仔細看，原來 garmin 手錶已經上看好幾萬元了……\r\n至少 fenix 5x, 5plus 以上可以裝魯地圖？\r\n（不過中文我不確定是否包在多國語言支援？請自己下載原廠說明書 pdf ）\r\n\r\nhttps://www.amazon.com/s?k=garmin+f...ss_ts-doa-p_4_9\r\n\r\n6 pro solar 650鎂有找免運，momo 29000有找可能有贈品？\r\n只便宜近一萬。\r\n\r\n沒有solar 的5、6各型號有一萬左右。太多款不知道那個折扣 c/p 值高？\r\nhttps://www.markchoo.com.tw/doc/222\r\nhttps://m.facebook.com/groups/taiwa...27675824054697/\r\nhttps://m.facebook.com/FMOMdoctor/p...048020475429005\r\n\r\nPtt outdoorgear\r\nhttps://pttweb.tw/s/1vsXWe\r\n[問題] garmin 錶國外買的缺點\r\n\r\nhttps://pttweb.tw/outdoorgear/s/garmin.html\r\n搜尋 garmin\r\n\r\nhttps://pttweb.tw/s/2LKwfW\r\n[技巧] garmin美版導航機中文化方法\r\n\r\nhttps://pttweb.tw/s/35dYdQ\r\n請問在國外買的garmin手錶可以安裝台灣的圖資嗎', '2022-04-29 01:32:20'),
(4, 2, 1, '新的驅動程式對5000系列和6000系列的顯卡，在DirectX11的遊戲上，可以提升17%的效能。尤其是0.1%的效能，使遊戲更順暢。\r\n\r\n加上6950xt 等新卡的發售，N家的優勢可能只剩下光追和AI的部分了⋯⋯', '2022-05-12 11:56:53'),
(5, 2, 6, '在遊戲上我不太會開光追功能 在其他領域也許有用處吧 大概', '2022-05-12 11:59:17'),
(6, 3, 1, '首先說這裡純粹指大陸市場，不是其他地方的情況\r\n而這也是我最近直接看到一個礦主的自述才搞明白\r\n就分享給大家一起參詳吧！微笑\r\n\r\n首先你如果看到一個礦主在算什麼回本日啊、電費啊什麼的\r\n這個人擁有的絕不是有一定體量的虛擬貨幣農場\r\n那現在大礦主是什麼人呢？\r\n說穿了就是賊喊抓賊\r\n就是顯示卡廠商自己(自己公司或旗下經銷商，視不同廠商規模而定)\r\n目前\"最有良心\"的流程大概是這樣的\r\n每個批次顯卡最終FQC過完直接送農場\r\n每3個月一輪\r\n簡單說假設這一批顯卡到農場後\r\n農場員工會換下3個月前到的那一批替換上機\r\n然後開始將換下這一批的顯卡清理乾淨\r\n比較勤快的會拆散熱器去水洗再烘乾或晾乾\r\n比較摸魚的就吸塵器和刷子清一清就好\r\n然後貼出廠標籤的各式貼紙、包裝、封條後才會上公司出貨系統登錄\r\n所以消費者拿到的卡況看起來都很新\r\n貼紙上出廠日都很接近購買日\r\n甚至連上公司自己系統查出廠日都沒有破綻\r\n而且由於挖礦的時間很短只有3個月\r\n(目前聽說大廠最多也就半年、不會挖太久，他們也怕把自己的卡挖壞)\r\n大部分顯示卡的狀況都還是很好\r\n如果只是正常使用如看片、玩game或影像工作處理\r\n頂個3年不是問題(再之後反正也過保固期了)\r\n萬一有消費者倒楣碰上體質特爛的剛好7日內要RMA\r\n那就換另一張給他或退費絕不囉嗦\r\n為什麼這麼大方？\r\n因為他們已經白賺了3個月的虛擬幣收入了(注意！這收入幾乎是純利)\r\n所以只要虛擬幣價格沒跌個7~80%\r\n電費沒漲個3~5倍\r\n他們就會一直挖礦不可能停！\r\n這也是為什麼很多農場都建在一些4、5線的城市\r\n地便宜、電更便宜，當地政府為了招商會盡力幫你搞租金和電費補貼\r\n因為過去長期官員們的KPI就看GDP和用電量這2個指標', '2022-05-12 11:59:33'),
(11, 1, 1, '只有一個USB port有這種問題，那應該就是壞了。拿膠帶貼起來不要用了。\r\n\r\nUSB port不夠用，主機板上還有未使用的USB pin腳，去買個19pin轉接器轉接出來用。', '2022-05-13 04:12:53');

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `account` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `admin` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`id`, `account`, `password`, `name`, `admin`) VALUES
(1, 'abc', '123', '車太炫', 'Y'),
(6, 'def', '456', '陳時鐘1', '');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `post_detail`
--
ALTER TABLE `post_detail`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `post_detail`
--
ALTER TABLE `post_detail`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
