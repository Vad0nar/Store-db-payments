-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: magazin
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `magazin`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `magazin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `magazin`;

--
-- Table structure for table `billingadresses`
--

DROP TABLE IF EXISTS `billingadresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billingadresses` (
  `billing_adress_id` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `billing_country` varchar(25) DEFAULT NULL,
  `billing_city` varchar(22) DEFAULT NULL,
  `state_province` varchar(30) DEFAULT NULL,
  `postal_code` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`billing_adress_id`),
  KEY `indx_transaction_id` (`transaction_id`),
  CONSTRAINT `billingadresses_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billingadresses`
--

LOCK TABLES `billingadresses` WRITE;
/*!40000 ALTER TABLE `billingadresses` DISABLE KEYS */;
INSERT INTO `billingadresses` VALUES (1,7,'Germany','Hamburg','Hamburg',73629,'2024-10-17 16:53:07'),(2,2,'Ukraine','Kyiv','Kyiv Oblast',79056,'2024-10-17 16:53:16'),(3,4,'Germany','Hamburg','Hamburg',73671,'2024-10-17 16:53:26'),(4,3,'Kazakhstan','Anupa','Anupa',26379,'2024-10-17 16:53:34'),(5,5,'Ukraine','Odesa','Odesa Oblast',79256,'2024-10-17 16:53:44'),(6,6,'India','Delhi','Delhi',400001,'2024-10-17 16:54:14'),(7,1,'Canada','Toronto','Toronto',100,'2024-10-17 16:53:54'),(8,8,'Australia','Sydney','New South Wales',10001,'2024-10-17 16:54:27'),(9,9,'Poland','Krakow','Lesser Poland',0,'2024-10-17 16:54:54'),(10,10,'Spain','Barcelona','Catalonia',24123,'2024-10-17 16:55:05'),(11,11,'Canada','Rome','Rome',111,'2024-10-17 16:55:16'),(12,14,'Australia','Sydney','New South Wales',10002,'2024-10-17 16:55:28'),(13,15,'Poland','Krakow','Masovian Voivodeship',100,'2024-10-17 16:55:42'),(14,12,'Japan','Osaka','Kansai Region',5300001,'2024-10-17 16:55:52'),(15,13,'Egypt','Alexandria','Alexandria Governorate',28001,'2024-10-17 16:56:00');
/*!40000 ALTER TABLE `billingadresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcards`
--

DROP TABLE IF EXISTS `creditcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditcards` (
  `customers_id` int(11) DEFAULT NULL,
  `credit_card_num` varchar(16) DEFAULT NULL,
  `credit_card_date` date DEFAULT NULL,
  `credit_card_cvv` varchar(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  KEY `indx_customers_id` (`customers_id`),
  CONSTRAINT `creditcards_ibfk_1` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcards`
--

LOCK TABLES `creditcards` WRITE;
/*!40000 ALTER TABLE `creditcards` DISABLE KEYS */;
INSERT INTO `creditcards` VALUES (1,'4790223619179625','0000-00-00','7689','2024-10-17 16:48:35'),(1,'4790022371029382','0000-00-00','2948','2024-10-17 16:48:45'),(5,'4790624892362947','0000-00-00','4578','2024-10-17 16:48:58'),(3,'4790241284290141','0000-00-00','1111','2024-10-17 16:49:08'),(5,'5168745362179240','0000-00-00','2962','2024-10-17 16:49:17'),(4,'7249124814924719','0000-00-00','6821','2024-10-17 16:49:26'),(11,'729492139249233','0000-00-00','8451','2024-10-17 16:49:34'),(2,'5168745123674123','0000-00-00','4153','2024-10-17 16:49:43'),(14,'3056930902590412','0000-00-00','5764','2024-10-17 16:49:51'),(15,'5267423465123456','0000-00-00','7864','2024-10-17 16:50:00'),(14,'3056930902581238','0000-00-00','1126','2024-10-17 16:50:08'),(2,'5168745184219323','0000-00-00','1719','2024-10-17 16:50:16'),(10,'6011556448578946','0000-00-00','2744','2024-10-17 16:50:27'),(7,'4012888888881881','0000-00-00','2136','2024-10-17 16:50:36'),(8,'3530111333300000','0000-00-00','9874','2024-10-17 16:50:46');
/*!40000 ALTER TABLE `creditcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customers_id` int(11) NOT NULL,
  `customers_name` varchar(15) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `postal_code` int(11) DEFAULT NULL,
  `adress` varchar(25) DEFAULT NULL,
  `customer_ip` varchar(20) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Volodya','Germany','Hamburg',73629,'Green 1','192.182.68.10',2147483647,'VolodyaStr123@gmail.com','2024-10-17 16:41:03'),(2,'Jack','Ukraine','Kyiv',79056,'Sadova 1','192.168.72.16',664821921,'JacksonSon456@gmail.com','2024-10-17 16:41:12'),(3,'Michele','Germany','Hamburg',73671,'New York 12','192.182.74.10',2147483647,'Msuper234ab@gmail.com','2024-10-17 16:41:22'),(4,'Arnai','Kazakhstan','Anupa',26379,'Tataieva 16','168.98.74.10',792031678,'Khabib99@mail.ru','2024-10-17 16:41:38'),(5,'Stanislav','Ukraine','Odesa',79256,'Zavodska 12','168.72.16.10',66712899,'StasVasylyovych123@gmail.','2024-10-17 16:41:49'),(6,'Sofia','Canada','Toronto',100,'Via Roma 10','193.182.68.15',2147483647,'sofiaA12@gmail.com','2024-10-17 16:42:01'),(7,'Liam','Australia','Sydney',10001,'5th Avenue 20','192.168.0.2',2147483647,'liamX23@gmail.com','2024-10-17 16:42:10'),(9,'Naoki','Japan','Osaka',1000001,'Shinjuku 1-2-3','192.168.1.8',2147483647,'naokiZ89@gmail.com','2024-10-17 16:42:34'),(10,'Elena','Egypt','Alexandria',28001,'Calle Gran Via 15','192.168.10.10',2147483647,'elenaM34@gmail.com','2024-10-17 16:42:50'),(11,'Hassan','Mexico','Cairo',11511,'Tahrir Square 5','196.168.12.1',2147483647,'hassanN78@gmail.com','2024-10-17 16:43:03'),(12,'Raj','India','Delhi',400001,'Marine Drive 101','203.168.0.15',2147483647,'rajB56@gmail.com','2024-10-17 16:43:13'),(13,'Maria','Brazil','Sao Paulo',1000000,'Avenida Paulista 200','201.168.1.12',2147483647,'mariaJ90@gmail.com','2024-10-17 16:43:25'),(14,'Zhang','China','Beijing',100000,'Tiananmen Square 1','203.172.68.10',2147483647,'zhangK67@gmail.com','2024-10-17 16:43:37'),(15,'Kofi','South Korea','Accra',233,'Oxford Street 7','197.168.0.3',2147483647,'kofiL12@gmail.com','2024-10-17 16:43:48'),(16,'Zuya','Spain','Barcelona',24123,'University 2','192.168.23.19',2147483647,'zuyachka23@gmail.com','2024-10-17 16:43:58');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_date` date DEFAULT NULL,
  `shopping_cost` decimal(9,3) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `total` decimal(9,3) DEFAULT NULL,
  `tax` decimal(9,3) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`order_id`),
  KEY `indx_store_id` (`store_id`),
  KEY `indx_product_id` (`product_id`),
  CONSTRAINT `fk_store_id` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2024-10-01',1.630,'Completed',1.830,0.200,1,1,'2024-10-17 16:13:01'),(2,'2024-10-02',120.500,'Completed',134.500,14.000,20,4,'2024-10-17 16:13:14'),(3,'2024-10-03',126.980,'Pending',126.980,175.980,12,3,'2024-10-17 16:13:25'),(4,'2024-10-04',2.080,'Completed',2.280,0.200,2,1,'2024-10-17 16:13:41'),(5,'2024-10-05',1.880,'Completed',2.280,0.400,45,9,'2024-10-17 16:13:51'),(6,'2024-10-06',42.000,'Completed',50.000,8.000,30,6,'2024-10-17 16:14:06'),(7,'2024-10-07',198.410,'Rejected',247.410,49.000,11,3,'2024-10-17 16:14:15'),(8,'2024-10-08',45.000,'Completed',59.000,14.000,18,4,'2024-10-17 16:14:26'),(10,'2024-10-10',0.300,'Completed',0.700,0.400,44,9,'2024-10-17 16:14:45'),(11,'2024-10-11',12.500,'Completed',15.000,2.500,58,12,'2024-10-17 16:14:54'),(12,'2024-10-11',112.500,'Completed',145.000,32.500,72,15,'2024-10-17 16:15:05'),(13,'2024-10-10',12.000,'Pending',18.000,6.000,62,13,'2024-10-17 16:15:14'),(14,'2024-10-10',0.490,'Completed',0.790,0.300,53,11,'2024-10-17 16:15:30'),(15,'2024-10-01',571.430,'Rejected',620.430,49.000,13,3,'2024-10-17 16:15:39'),(16,'2024-10-13',0.170,'Completed',0.570,0.400,47,10,'2024-10-17 16:15:49');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `store_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `visible` tinyint(1) DEFAULT 1,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `price` decimal(9,3) DEFAULT NULL,
  `product_name` varchar(25) DEFAULT NULL,
  `sold` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`product_id`),
  KEY `indx_store_id` (`store_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,1,20,500,'PLN',1.630,'Bread',250,'https://www.jabko.pa/image/bread.jpg','The promotion is valid until 15.10.2024',300,'2024-10-17 15:45:43'),(1,2,1,15,300,'PLN',2.080,'Milk',150,'https://www.jabko.pa/image/milk.jpg','Fresh product',250,'2024-10-17 15:45:57'),(1,3,1,10,1000,'PLN',8.330,'Flour',75,'https://www.jabko.pa/image/flour.jpg','Suitable for baking',400,'2024-10-17 15:46:10'),(1,4,1,30,200,'PLN',1.030,'Butter',180,'https://www.jabko.pa/image/butter.jpg','Best before 20.10.2024',320,'2024-10-17 15:46:24'),(1,5,1,5,50,'PLN',0.650,'Eggs',500,'https://www.jabko.pa/image/eggs.jpg','Pack of 10',290,'2024-10-17 15:46:52'),(2,6,1,25,100,'JPY',131.480,'Cheese',100,'https://www.qawai.com/image/cheese.jpg','Aged 3 months',350,'2024-10-17 15:47:04'),(2,7,1,18,700,'JPY',222.220,'Chicken',60,'https://www.qawai.com/image/chicken.jpg','Organic meat',280,'2024-10-17 15:48:01'),(2,8,1,12,900,'JPY',166.670,'Rice',40,'https://www.qawai.com/image/rice.jpg','Long grain variety',270,'2024-10-17 15:48:13'),(2,9,1,8,400,'JPY',109.260,'Apples',220,'https://www.qawai.com/image/apples.jpg','Golden variety',310,'2024-10-17 15:48:27'),(2,10,1,7,250,'JPY',51.850,'Tomatoes',100,'https://www.qawai.com/image/tomatoes.jpg','Greenhouse grown',260,'2024-10-17 15:48:46'),(3,11,1,15,100,'KZT',198.410,'Notebook',300,'https://www.cherryshop.kz/image/notebook.jpg','80 sheets, A5 size',350,'2024-10-17 15:49:02'),(3,12,1,20,50,'KZT',126.980,'Pen',500,'https://www.cherryshop.kz/image/pen.jpg','Blue ink, ballpoint',320,'2024-10-17 15:49:14'),(3,13,1,25,500,'KZT',571.430,'Backpack',100,'https://www.cherryshop.kz/image/backpack.jpg','Waterproof material',400,'2024-10-17 15:49:29'),(3,14,1,5,10,'KZT',39.680,'Eraser',800,'https://www.cherryshop.kz/image/eraser.jpg','Soft rubber',290,'2024-10-17 15:49:47'),(3,15,1,3,5,'KZT',59.520,'Pencil',600,'https://www.cherryshop.kz/image/pencil.jpg','HB graphite',300,'2024-10-17 15:49:59'),(4,16,1,8,30,'UAH',15.200,'Ruler',200,'https://www.aurrora.com.ua/image/ruler.jpg','30 cm plastic ruler',330,'2024-10-17 15:50:11'),(4,17,1,12,1000,'UAH',99.990,'Office Chair',50,'https://www.aurrora.com.ua/image/officechair.jpg','Ergonomic design',450,'2024-10-17 15:50:25'),(4,18,1,10,200,'UAH',45.000,'Stapler',150,'https://www.aurrora.com.ua/image/stapler.jpg','Includes 1000 staples',380,'2024-10-17 15:50:45'),(4,19,1,6,15,'UAH',7.000,'Glue Stick',400,'https://www.aurrora.com.ua/image/gluestick.jpg','Non-toxic, 20g',310,'2024-10-17 15:51:01'),(4,20,1,4,300,'UAH',120.500,'Whiteboard',30,'https://www.aurrora.com.ua/image/whiteboard.jpg','Magnetic surface, 90x60cm',470,'2024-10-17 15:51:19'),(5,21,1,10,500,'EUR',0.760,'Apples',400,'https://www.senyora_shop.com/image/apples.jpg','Fresh red apples',360,'2024-10-17 15:51:32'),(5,22,1,20,1000,'EUR',1.250,'Oranges',350,'https://www.senyora_shop.com/image/oranges.jpg','Imported from Spain',370,'2024-10-17 15:51:44'),(5,23,1,5,500,'EUR',0.300,'Bananas',600,'https://www.senyora_shop.com/image/bananas.jpg','Rich in potassium',320,'2024-10-17 15:51:59'),(5,24,1,15,200,'EUR',0.650,'Cherries',150,'https://www.senyora_shop.com/image/cherries.jpg','Organic cherries',410,'2024-10-17 15:52:16'),(5,25,1,2,50,'EUR',0.210,'Lettuce',200,'https://www.senyora_shop.com/image/lettuce.jpg','Crispy and fresh',300,'2024-10-17 15:52:35'),(6,26,1,4,100,'JPY',15.300,'Tomatoes',500,'https://www.tokyogoods.jp/image/tomatoes.jpg','Locally grown',340,'2024-10-17 15:52:54'),(6,27,1,6,250,'JPY',22.400,'Carrots',300,'https://www.tokyogoods.jp/image/carrots.jpg','Rich in vitamin A',350,'2024-10-17 15:53:08'),(6,28,1,8,200,'JPY',28.700,'Potatoes',450,'https://www.tokyogoods.jp/image/potatoes.jpg','Good for baking',320,'2024-10-17 15:53:27'),(6,29,1,3,100,'JPY',9.900,'Onions',700,'https://www.tokyogoods.jp/image/onions.jpg','Perfect for cooking',310,'2024-10-17 15:53:44'),(6,30,1,12,300,'JPY',42.000,'Grapes',250,'https://www.tokyogoods.jp/image/grapes.jpg','Seedless green grapes',380,'2024-10-17 15:54:03'),(7,31,1,20,500,'AUD',1.020,'Bread',250,'https://www.koalashop.au/image/bread.jpg','The promotion is valid until 15.10.2024',300,'2024-10-17 15:54:22'),(7,32,1,15,300,'AUD',1.200,'Milk',150,'https://www.koalashop.au/image/milk.jpg','Fresh product',250,'2024-10-17 15:54:37'),(7,33,1,10,1000,'AUD',4.400,'Flour',75,'https://www.koalashop.au/image/flour.jpg','Suitable for baking',400,'2024-10-17 15:54:51'),(7,34,1,30,200,'AUD',0.690,'Butter',180,'https://www.koalashop.au/image/butter.jpg','Best before 20.10.2024',320,'2024-10-17 15:55:17'),(7,35,1,5,50,'AUD',0.390,'Eggs',500,'https://www.koalashop.au/image/eggs.jpg','Pack of 10',290,'2024-10-17 15:55:31'),(8,36,1,25,100,'CAD',1.420,'Cheese',100,'https://www.maplemart.ca/image/cheese.jpg','Aged 3 months',350,'2024-10-17 15:55:45'),(8,37,1,18,700,'CAD',2.500,'Chicken',60,'https://www.maplemart.ca/image/chicken.jpg','Organic meat',280,'2024-10-17 15:56:01'),(8,38,1,12,900,'CAD',1.830,'Rice',40,'https://www.maplemart.ca/image/rice.jpg','Long grain variety',270,'2024-10-17 15:56:12'),(8,39,1,8,400,'CAD',1.180,'Apples',220,'https://www.maplemart.ca/image/apples.jpg','Golden variety',310,'2024-10-17 15:56:27'),(8,40,1,7,250,'CAD',0.600,'Tomatoes',100,'https://www.maplemart.ca/image/tomatoes.jpg','Greenhouse grown',260,'2024-10-17 15:56:43'),(9,41,1,25,700,'EUR',1.400,'Pineapple',120,'https://www.barcelonabazaar.es/image/pineapple.jpg','Sweet and juicy',300,'2024-10-17 15:57:51'),(9,42,1,15,400,'EUR',0.300,'Lemon',250,'https://www.barcelonabazaar.es/image/lemon.jpg','Perfect for lemonade',320,'2024-10-17 15:58:05'),(9,43,1,10,300,'EUR',0.210,'Cucumber',180,'https://www.barcelonabazaar.es/image/cucumber.jpg','Fresh and crunchy',290,'2024-10-17 15:58:17'),(9,44,1,18,800,'EUR',1.000,'Peach',90,'https://www.barcelonabazaar.es/image/peach.jpg','Imported from Italy',280,'2024-10-17 15:58:29'),(9,45,1,20,1200,'EUR',1.880,'Mango',60,'https://www.barcelonabazaar.es/image/mango.jpg','Tropical flavor',350,'2024-10-17 15:58:48'),(10,46,1,5,50,'EUR',0.050,'Garlic',500,'https://www.bavarianstore.de/image/garlic.jpg','Strong aroma',310,'2024-10-17 15:59:02'),(10,47,1,8,100,'EUR',0.170,'Bell Pepper',400,'https://www.bavarianstore.de/image/pepper.jpg','Red variety',320,'2024-10-17 15:59:16'),(10,48,1,4,200,'EUR',0.090,'Beetroot',300,'https://www.bavarianstore.de/image/beetroot.jpg','Rich in antioxidants',290,'2024-10-17 15:59:31'),(10,49,1,12,200,'EUR',0.200,'Zucchini',250,'https://www.bavarianstore.de/image/zucchini.jpg','Perfect for grilling',380,'2024-10-17 15:59:43'),(10,50,1,10,1200,'EUR',1.500,'Blueberry',100,'https://www.bavarianstore.de/image/blueberry.jpg','Freshly picked',320,'2024-10-17 16:00:05'),(11,51,1,10,500,'BRL',0.910,'Mint',300,'https://www.brazilmarket.com/image/mint.jpg','Freshly harvested',360,'2024-10-17 16:00:19'),(11,52,1,15,300,'BRL',1.310,'Salad',150,'https://www.brazilmarket.com/image/salad.jpg','Rich in nutrients',370,'2024-10-17 16:00:31'),(11,53,1,12,200,'BRL',0.490,'Cabbage',100,'https://www.brazilmarket.com/image/cabbage.jpg','Crunchy and fresh',320,'2024-10-17 16:00:49'),(11,54,1,7,50,'BRL',0.310,'Parsley',200,'https://www.brazilmarket.com/image/parsley.jpg','For seasoning',310,'2024-10-17 16:01:02'),(11,55,1,9,250,'BRL',1.250,'Carrot',450,'https://www.brazilmarket.com/image/carrot.jpg','Sweet and crunchy',380,'2024-10-17 16:01:14'),(12,56,1,60,400,'MXN',30.000,'Pumpkin',300,'https://www.mexicanmarket.com/image/pumpkin.jpg','Ideal for soup',350,'2024-10-17 16:01:29'),(12,57,1,99,300,'MXN',49.990,'Pomegranate',400,'https://www.mexicanmarket.com/image/pomegranate.jpg','Rich in antioxidants',370,'2024-10-17 16:01:47'),(12,58,1,25,100,'MXN',12.500,'Cucumber',500,'https://www.mexicanmarket.com/image/cucumber.jpg','Freshly picked',320,'2024-10-17 16:02:07'),(12,59,1,3,50,'MXN',1.500,'Onion',600,'https://www.mexicanmarket.com/image/onion.jpg','For salads',310,'2024-10-17 16:02:26'),(12,60,1,7,250,'MXN',3.750,'Avocado',100,'https://www.mexicanmarket.com/image/avocado.jpg','Rich in healthy fats',380,'2024-10-17 16:02:43'),(13,61,1,35,100,'CNY',7.120,'Cheese',100,'https://www.chinagrocery.com/image/cheese.jpg','Delicious cheese',350,'2024-10-17 16:03:07'),(13,62,1,60,500,'CNY',12.000,'Chicken',60,'https://www.chinagrocery.com/image/chicken.jpg','Fresh and organic',280,'2024-10-17 16:03:25'),(13,63,1,45,900,'CNY',9.000,'Rice',40,'https://www.chinagrocery.com/image/rice.jpg','Healthy whole grain',270,'2024-10-17 16:03:39'),(13,64,1,29,400,'CNY',5.900,'Apples',220,'https://www.chinagrocery.com/image/apples.jpg','Sweet and crunchy',310,'2024-10-17 16:03:50'),(13,65,1,14,250,'CNY',2.800,'Tomatoes',100,'https://www.chinagrocery.com/image/tomatoes.jpg','Fresh and ripe',260,'2024-10-17 16:04:03'),(14,66,1,9,50,'KRW',359.600,'Cilantro',300,'https://www.koreanmarket.com/image/cilantro.jpg','Fresh and fragrant',350,'2024-10-17 16:04:19'),(14,67,1,25,100,'KRW',1180.000,'Kale',150,'https://www.koreanmarket.com/image/kale.jpg','Superfood',280,'2024-10-17 16:04:32'),(14,68,1,15,200,'KRW',600.000,'Garlic',100,'https://www.koreanmarket.com/image/garlic.jpg','Strong flavor',270,'2024-10-17 16:04:46'),(14,69,1,6,15,'KRW',240.000,'Ginger',800,'https://www.koreanmarket.com/image/ginger.jpg','Spicy and aromatic',290,'2024-10-17 16:05:03'),(14,70,1,5,50,'KRW',200.000,'Chili',600,'https://www.koreanmarket.com/image/chili.jpg','Hot and flavorful',300,'2024-10-17 16:05:16'),(15,71,1,12,50,'INR',31.250,'Papaya',300,'https://www.indiamarket.com/image/papaya.jpg','Sweet and ripe',350,'2024-10-17 16:05:29'),(15,72,1,45,100,'INR',112.500,'Guava',150,'https://www.indiamarket.com/image/guava.jpg','Tropical delight',370,'2024-10-17 16:05:47'),(15,73,1,7,80,'INR',19.500,'Coconut',100,'https://www.indiamarket.com/image/coconut.jpg','Delicious and refreshing',320,'2024-10-17 16:05:58'),(15,74,1,5,50,'INR',12.500,'Chili',600,'https://www.indiamarket.com/image/chili.jpg','Spicy and hot',260,'2024-10-17 16:06:08'),(15,75,1,10,250,'INR',25.000,'Tamarind',100,'https://www.indiamarket.com/image/tamarind.jpg','Unique flavor',380,'2024-10-17 16:06:19');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `store_id` int(11) NOT NULL,
  `store_country` varchar(40) DEFAULT NULL,
  `store_name` varchar(30) DEFAULT NULL,
  `store_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'Poland','Jabko','https://www.jabko.pa','2024-10-17 15:39:05'),(2,'Japan','Qawai','https://www.qawai.com','2024-10-17 15:40:10'),(3,'Kazakhstan','Cherry','https://www.cherryshop.kz','2024-10-17 15:40:20'),(4,'Ukraine','Aurrora','https://www.aurrora.com.ua','2024-10-17 15:40:31'),(5,'Spanish','Senyora','https://www.senyorashop.com','2024-10-17 15:40:44'),(6,'Japan','TokyoGoods','https://www.tokyogoods.jp','2024-10-17 15:40:55'),(7,'Australia','KoalaShop','https://www.koalashop.au','2024-10-17 15:41:09'),(8,'Canada','MapleMart','https://www.maplemart.ca','2024-10-17 15:41:19'),(9,'Egypt','BarcelonaBazaar','https://www.barcelonashop.es','2024-10-17 15:41:29'),(10,'Germany','BavarianStore','https://www.bavarianst.de','2024-10-17 15:41:39'),(11,'Brazil','RioMart','https://www.riomart.br','2024-10-17 15:41:52'),(12,'Mexico','CasaMarket','https://www.casamarket.mx','2024-10-17 15:42:05'),(13,'China','PandaMall','https://www.pandamall.cn','2024-10-17 15:42:17'),(14,'South Korea','SeoulStyle','https://www.seoulstyle.kr','2024-10-17 15:42:27'),(15,'India','DelhiBazaar','https://www.delhibazaar.in','2024-10-17 15:42:37');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `order_id` int(11) DEFAULT NULL,
  `transaction_id` int(11) NOT NULL,
  `transaction_type` enum('refaund','cash','epay') DEFAULT NULL,
  `amount` decimal(9,3) DEFAULT NULL,
  `error_code` varchar(255) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`transaction_id`),
  KEY `indx_order_id` (`order_id`),
  KEY `indx_store_id` (`store_id`),
  CONSTRAINT `store_id` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,'epay',1.830,'Order Completed',1,'2024-10-17 16:18:44'),(2,2,'epay',134.500,'Order Completed',4,'2024-10-17 16:19:18'),(7,3,'epay',247.410,'error:dont payed',3,'2024-10-17 16:20:20'),(4,4,'cash',2.280,'Order Completed',1,'2024-10-17 16:20:30'),(5,5,'epay',44.200,'Order Completed',9,'2024-10-17 16:20:40'),(13,6,'epay',18.000,'Order Completed',13,'2024-10-17 16:20:49'),(6,7,'cash',50.000,'Order Completed',6,'2024-10-17 16:21:54'),(15,8,'epay',620.430,'error:dont payed',3,'2024-10-17 17:01:55'),(12,9,'epay',145.000,'Order Completed',15,'2024-10-17 16:22:26'),(10,11,'epay',0.700,'Order Completed',9,'2024-10-17 16:22:38'),(8,12,'cash',59.000,'Order Completed',4,'2024-10-17 17:03:35'),(9,13,'epay',3.200,'Order Completed',8,'2024-10-17 16:25:38'),(14,14,'epay',0.790,'Order Completed',11,'2024-10-17 16:26:01'),(3,15,'epay',175.980,'Order Completed',3,'2024-10-17 16:26:11'),(16,16,'epay',0.570,'Order Completed',10,'2024-10-17 16:26:22');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-17 22:28:44
