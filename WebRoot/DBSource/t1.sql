DROP TABLE IF EXISTS `t1`;
CREATE TABLE `t1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(30) NOT NULL,
  `sex` char(2) DEFAULT '男',
  `age` int(11) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=gbk;

INSERT INTO `t1` VALUES 
(1,'张三','123','男',23,'北京'),
(2,'李四','123','男',23,'北京'),
(3,'王五','123','女',23,'南京'),
(4,'赵六','123','女',22,'北京');
