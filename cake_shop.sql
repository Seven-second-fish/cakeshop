/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.49 : Database - cake_shop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cake_shop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cake_shop`;

/*Table structure for table `s_admin` */

DROP TABLE IF EXISTS `s_admin`;

CREATE TABLE `s_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `passWord` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastLoginTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `s_admin` */

insert  into `s_admin`(`id`,`userName`,`passWord`,`name`,`lastLoginTime`) values (2,'admin','123456','xzy','2021-07-05 16:55:41');

/*Table structure for table `s_cake` */

DROP TABLE IF EXISTS `s_cake`;

CREATE TABLE `s_cake` (
  `cakeID` int(11) NOT NULL AUTO_INCREMENT,
  `catalogId` int(11) NOT NULL,
  `cakeName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `price` double(10,2) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `imgId` int(11) NOT NULL,
  `addTime` datetime DEFAULT NULL,
  `introducce` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`cakeID`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `s_cake` */

insert  into `s_cake`(`cakeID`,`catalogId`,`cakeName`,`price`,`description`,`imgId`,`addTime`,`introducce`) values (1,7,'巨蟹座Canccer',238.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',1,'2020-04-12 00:00:00',NULL),(2,7,'奥利奥海盐',218.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',2,'2020-04-12 00:00:00',NULL),(3,7,'扇清湖Fan Lake',218.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',3,'2020-04-12 00:00:00',NULL),(4,7,'斑斓Pandan',228.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',4,'2020-04-12 00:00:00',NULL),(5,2,'毕业定制',268.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',5,'2020-04-13 00:00:00',NULL),(6,2,'北鼻熊',268.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',6,'2020-04-13 00:00:00',NULL),(7,2,'爱的茉莉Love',268.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',7,'2020-04-13 00:00:00',NULL),(8,2,'Deep Love红色玫瑰礼盒',268.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',9,'2020-04-13 00:00:00',NULL),(9,2,'Deep Love粉色玫瑰礼盒',268.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',10,'2020-04-13 00:00:00',NULL),(10,2,'萌熊四部曲',268.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',11,'2020-04-13 00:00:00',NULL),(11,3,'春晖',318.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',12,'2020-04-14 00:00:00',NULL),(12,3,'告白Confession',318.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',13,'2020-04-14 00:00:00',NULL),(13,3,'钻石星河',238.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',14,'2020-04-14 00:00:00',NULL),(14,3,'桃粉星海',238.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',15,'2020-04-14 00:00:00',NULL),(15,3,'极光',238.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',16,'2020-04-14 00:00:00',NULL),(16,3,'星云',238.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',17,'2020-04-14 00:00:00',NULL),(17,4,'粉红乐园',198.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',18,'2020-04-14 00:00:00',NULL),(18,4,'梦幻星球',218.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',19,'2020-04-15 00:00:00',NULL),(19,4,'独角天使',189.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',20,'2020-04-15 00:00:00',NULL),(20,4,'玫红精灵',218.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',21,'2020-04-15 00:00:00',NULL),(21,5,'至爱',999.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',22,'2020-04-16 00:00:00',NULL),(22,5,'偏爱',1099.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',23,'2020-04-16 00:00:00',NULL),(23,5,'宠爱',1099.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',24,'2020-04-16 00:00:00',NULL),(24,5,'唯爱',1099.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',25,'2020-04-16 00:00:00',NULL),(25,6,'蜜雪儿',238.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',26,'2020-04-16 00:00:00',NULL),(26,6,'糖果儿',238.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',27,'2020-04-16 00:00:00',NULL),(27,6,'甜心儿',238.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',28,'2020-04-16 00:00:00',NULL),(28,6,'糖果盒子',238.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',29,'2020-04-16 00:00:00',NULL),(29,6,'蜜糖宝贝',238.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',30,'2020-04-16 00:00:00',NULL),(30,6,'小乖乖',238.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',31,'2020-04-16 00:00:00',NULL),(31,1,'新年之歌',268.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',32,'2020-04-16 00:00:00',NULL),(32,1,'温暖的家',268.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',33,'2020-04-16 00:00:00',NULL),(33,1,'丘比特的祝福',268.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',34,'2020-04-16 00:00:00',NULL),(34,1,'旋转木马',268.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',35,'2020-04-16 00:00:00',NULL),(35,8,'真爱',238.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',36,'2020-04-16 00:00:00',NULL),(36,8,'小精灵',198.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',37,'2020-04-16 00:00:00',NULL),(37,8,'小公主',198.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',38,'2020-04-16 00:00:00',NULL),(38,8,'女神的花冠',268.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',39,'2020-04-16 00:00:00',NULL),(39,9,'桃李春风',238.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',40,'2020-04-16 00:00:00',NULL),(40,9,'生如夏花',238.00,'最佳保存温度10°C，最佳赏味期为24小时内\r\n食用前请在室温下放置20分钟，口感更佳',41,'2020-04-16 00:00:00',NULL);

/*Table structure for table `s_catalog` */

DROP TABLE IF EXISTS `s_catalog`;

CREATE TABLE `s_catalog` (
  `catalogId` int(11) NOT NULL AUTO_INCREMENT,
  `catalogName` varchar(20) NOT NULL,
  PRIMARY KEY (`catalogId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `s_catalog` */

insert  into `s_catalog`(`catalogId`,`catalogName`) values (1,'新年系列'),(2,'莫兰迪花园'),(3,'星空系列'),(4,'梦幻乐园'),(5,'甜蜜熊系列'),(6,'糖果屋系列'),(7,'草莓红颜'),(8,'生如夏花'),(9,'下午茶点');

/*Table structure for table `s_order` */

DROP TABLE IF EXISTS `s_order`;

CREATE TABLE `s_order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `userId` int(11) NOT NULL,
  `orderDate` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `money` double(10,2) NOT NULL,
  `orderStatus` int(2) NOT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `s_order` */

insert  into `s_order`(`orderId`,`orderNum`,`userId`,`orderDate`,`money`,`orderStatus`) values (23,'202004251637490511035426557',1,'2020-04-25 16:37:49',238.00,3),(24,'202004260804010521761193487',1,'2020-04-26 08:04:01',268.00,1),(25,'202004270847353362024855301',1,'2020-04-27 08:47:35',268.00,1),(26,'20200608154606826308660424',1,'2020-06-08 15:46:06',486.00,1),(27,'20200608223506325553025626',1,'2020-06-08 22:35:06',238.00,1),(28,'20200608223525230270400150',1,'2020-06-08 22:35:25',198.00,1),(29,'202006082235493061029991075',1,'2020-06-08 22:35:49',1099.00,1),(30,'20200608223605705324973357',1,'2020-06-08 22:36:05',318.00,1),(31,'202006082236335371817449023',1,'2020-06-08 22:36:33',556.00,1),(32,'202006082301268132086210119',1,'2020-06-08 23:01:26',268.00,1),(33,'202006091209043771628149911',3,'2020-06-09 12:09:04',238.00,1),(34,'20200618115712425966562914',1,'2020-06-18 11:57:12',238.00,2),(35,'202107021727228362082302847',5,'2021-07-02 17:27:22',268.00,1),(36,'20210702175421337257517605',5,'2021-07-02 17:54:21',0.00,1),(37,'202107021755463241504477431',5,'2021-07-02 17:55:46',238.00,1),(38,'202107021757441912089109970',5,'2021-07-02 17:57:44',268.00,1),(39,'20210702181716020171907270',5,'2021-07-02 18:17:16',556.00,1),(40,'202107021844579931524334889',5,'2021-07-02 18:44:57',238.00,1),(41,'202107022324580581904903142',5,'2021-07-02 23:24:58',268.00,1),(42,'202107031434290101770513256',5,'2021-07-03 14:34:29',268.00,1);

/*Table structure for table `s_orderitem` */

DROP TABLE IF EXISTS `s_orderitem`;

CREATE TABLE `s_orderitem` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT,
  `cakeId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `s_orderitem` */

insert  into `s_orderitem`(`itemId`,`cakeId`,`orderId`,`quantity`) values (2,41,23,1),(3,5,24,1),(4,32,25,1),(5,34,26,1),(6,3,26,1),(7,36,27,1),(8,37,28,1),(9,23,29,1),(10,12,30,1),(11,1,31,1),(12,12,31,1),(13,32,32,1),(14,26,33,1),(15,16,34,1),(16,39,35,1),(17,31,37,1),(18,7,38,1),(19,1,39,1),(20,13,39,1),(21,1,40,1),(22,33,41,1),(23,32,42,1);

/*Table structure for table `s_uploadimg` */

DROP TABLE IF EXISTS `s_uploadimg`;

CREATE TABLE `s_uploadimg` (
  `imgId` int(11) NOT NULL AUTO_INCREMENT,
  `imgName` varchar(50) NOT NULL,
  `imgSrc` varchar(255) NOT NULL,
  `imgType` varchar(20) NOT NULL,
  PRIMARY KEY (`imgId`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

/*Data for the table `s_uploadimg` */

insert  into `s_uploadimg`(`imgId`,`imgName`,`imgSrc`,`imgType`) values (1,'巨蟹座Canccer.jpg','images/cake/cakeimg/巨蟹座Cancer.jpg','image/jpeg'),(2,'奥利奥海盐.jpg','images/cake/cakeimg/奥利奥海盐.jpg','image/jpeg'),(3,'扇清湖Fan Lake.jpg','images/cake/cakeimg/扇清湖Fan Lake.jpg','image/jpeg'),(4,'斑斓Pandan.jpg','images/cake/cakeimg/斑斓Pandan.jpg','image/jpeg'),(5,'毕业定制.jpg','images/cake/cakeimg/毕业定制.jpg','image/jpeg'),(6,'北鼻熊.jpg','images/cake/cakeimg/北鼻熊.jpg','image/jpeg'),(7,'爱的茉莉Love From Jasmine.jpg','images/cake/cakeimg/爱的茉莉Love From Jasmine.jpg','image/jpeg'),(8,'Deep Love红色玫瑰礼盒.jpg','images/cake/cakeimg/Deep Love红色玫瑰礼盒.jpg','image/jpeg'),(9,'Deep Love粉色玫瑰礼盒.jpg','images/cake/cakeimg/Deep Love粉色玫瑰礼盒.jpg','image/jpeg'),(10,'萌熊四部曲.jpg','images/cake/cakeimg/萌熊四部曲.jpg','image/jpeg'),(11,'春晖.jpg','images/cake/cakeimg/春晖.jpg','image/jpeg'),(12,'告白Confession.jpg','images/cake/cakeimg/告白Confession.jpg','image/jpeg'),(13,'520数字蛋糕.jpg','images/cake/cakeimg/520数字蛋糕.jpg','image/jpeg'),(14,'企业定制蛋糕.jpg','images/cake/cakeimg/企业定制蛋糕.jpg','image/jpeg'),(15,'彩虹蛋糕.jpg','images/cake/cakeimg/彩虹蛋糕.jpg','image/jpeg'),(16,'钓星星的大象.jpg','images/cake/cakeimg/钓星星的大象.jpg','image/jpeg'),(17,'加油鸭.jpg','images/cake/cakeimg/加油鸭.jpg','image/jpeg'),(18,'俏皮老爸.jpg','images/cake/cakeimg/加油鸭.jpg','image/jpeg'),(19,'芒果拿破仑.jpg','images/cake/cakeimg/芒果拿破仑.jpg','image/jpeg'),(20,'焦糖饼干蛋糕.jpg','images/cake/cakeimg/焦糖饼干蛋糕.jpg','image/jpeg'),(21,'十全十美女皇蛋糕Perfect Cake.jpg','images/cake/cakeimg/十全十美女皇蛋糕Perfect Cake.jpg','image/jpeg'),(22,'碧玉榴香Durian.jpg','images/cake/cakeimg/碧玉榴香Durian.jpg','image/jpeg'),(23,'雪夜茶香.jpg','images/cake/cakeimg/雪夜茶香.jpg','image/jpeg'),(24,'狮子王.jpg','images/cake/cakeimg/狮子王.jpg','image/jpeg'),(25,'草莓童话.jpg','images/cake/cakeimg/草莓童话.jpg','image/jpeg'),(26,'致爱.jpg','images/cake/cakeimg/致爱.jpg','image/jpeg'),(27,'夕阳红.jpg','images/cake/cakeimg/夕阳红.jpg','image/jpeg'),(28,'月半弯蛋糕.jpg','images/cake/cakeimg/月半弯蛋糕.jpg','image/jpeg'),(29,'金寿鹤喜.jpg','images/cake/cakeimg/金寿鹤喜.jpg','image/jpeg'),(30,'mojito慕斯蛋糕.jpg','images/cake/cakeimg/mojito慕斯蛋糕.jpg','image/jpeg'),(31,'双子座.jpg','images/cake/cakeimg/双子座.jpg','image/jpeg'),(32,'雨后花园Plus.jpg','images/cake/cakeimg/雨后花园Plus.jpg','image/jpeg'),(33,'黎明之前.jpg','images/cake/cakeimg/黎明之前.jpg','image/jpeg'),(34,'午后时光.jpg','images/cake/cakeimg/午后时光.jpg','image/jpeg'),(35,'伯爵红茶卷.jpg','images/cake/cakeimg/伯爵红茶卷.jpg','image/jpeg'),(36,'掌心.jpg','images/cake/cakeimg/掌心.jpg','image/jpeg'),(37,'love story+.jpg','images/cake/cakeimg/love story+.jpg','image/jpeg'),(38,'镜花水月.jpg','images/cake/cakeimg/镜花水月.jpg','image/jpeg'),(39,'金牛座Taurus.jpg','images/cake/cakeimg/金牛座Taurus.jpg','image/jpeg'),(40,'草莓拿破仑.jpg','images/cake/cakeimg/草莓拿破仑.jpg','image/jpeg'),(41,'摩卡杏仁蛋糕.jpg','images/cake/cakeimg/摩卡杏仁蛋糕.jpg','image/jpeg'),(42,'e65d3fc2f0e347c68c8e1c36c2b2dca4.jpg','images/cake/cakeimg/e65d3fc2f0e347c68c8e1c36c2b2dca4.jpg','image/jpeg'),(43,'9e4fd1d28c7f44b8a6d2e390eaa9a736.jpg','images/cake/cakeimg/9e4fd1d28c7f44b8a6d2e390eaa9a736.jpg','image/jpeg');

/*Table structure for table `s_user` */

DROP TABLE IF EXISTS `s_user`;

CREATE TABLE `s_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `userPassWord` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `sex` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(5) NOT NULL,
  `tell` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `s_user` */

insert  into `s_user`(`userId`,`userName`,`userPassWord`,`name`,`sex`,`age`,`tell`,`address`,`enabled`) values (1,'user','1234','xzy','男',22,'18000000000','湖北武汉','y'),(2,'dsfsd','1234','fsdaf','男',32,'18000000000','ghsf','y'),(3,'user1234','123456','11','女',22,'15072186406','aa','y'),(4,'useraa','123456','11','女',20,'15072186406','11','y'),(5,'admin2','123456','admin','男',20,'13653764419','地球村','y'),(6,'root','123456','root','男',20,'13653764419','地球村','y');

/*Table structure for table `view_cake` */

DROP TABLE IF EXISTS `view_cake`;

/*!50001 DROP VIEW IF EXISTS `view_cake` */;
/*!50001 DROP TABLE IF EXISTS `view_cake` */;

/*!50001 CREATE TABLE  `view_cake`(
 `catalogName` varchar(20) ,
 `cakeId` int(11) ,
 `catalogId` int(11) ,
 `cakeName` varchar(20) ,
 `price` double(10,2) ,
 `description` text ,
 `imgId` int(11) ,
 `imgName` varchar(50) ,
 `imgSrc` varchar(255) ,
 `imgType` varchar(20) ,
 `addTime` datetime 
)*/;

/*Table structure for table `view_order` */

DROP TABLE IF EXISTS `view_order`;

/*!50001 DROP VIEW IF EXISTS `view_order` */;
/*!50001 DROP TABLE IF EXISTS `view_order` */;

/*!50001 CREATE TABLE  `view_order`(
 `itemId` int(11) ,
 `cakeId` int(11) ,
 `quantity` int(11) ,
 `orderId` int(11) ,
 `orderNum` varchar(50) ,
 `userId` int(11) ,
 `orderDate` varchar(20) ,
 `money` double(10,2) ,
 `orderStatus` int(2) 
)*/;

/*View structure for view view_cake */

/*!50001 DROP TABLE IF EXISTS `view_cake` */;
/*!50001 DROP VIEW IF EXISTS `view_cake` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_cake` AS select `s_catalog`.`catalogName` AS `catalogName`,`s_cake`.`cakeID` AS `cakeId`,`s_cake`.`catalogId` AS `catalogId`,`s_cake`.`cakeName` AS `cakeName`,`s_cake`.`price` AS `price`,`s_cake`.`description` AS `description`,`s_cake`.`imgId` AS `imgId`,`s_uploadimg`.`imgName` AS `imgName`,`s_uploadimg`.`imgSrc` AS `imgSrc`,`s_uploadimg`.`imgType` AS `imgType`,`s_cake`.`addTime` AS `addTime` from ((`s_cake` join `s_catalog` on((`s_cake`.`catalogId` = `s_catalog`.`catalogId`))) join `s_uploadimg` on((`s_cake`.`imgId` = `s_uploadimg`.`imgId`))) */;

/*View structure for view view_order */

/*!50001 DROP TABLE IF EXISTS `view_order` */;
/*!50001 DROP VIEW IF EXISTS `view_order` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_order` AS select `s_orderitem`.`itemId` AS `itemId`,`s_orderitem`.`cakeId` AS `cakeId`,`s_orderitem`.`quantity` AS `quantity`,`s_order`.`orderId` AS `orderId`,`s_order`.`orderNum` AS `orderNum`,`s_order`.`userId` AS `userId`,`s_order`.`orderDate` AS `orderDate`,`s_order`.`money` AS `money`,`s_order`.`orderStatus` AS `orderStatus` from (`s_order` join `s_orderitem` on((`s_orderitem`.`orderId` = `s_order`.`orderId`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
