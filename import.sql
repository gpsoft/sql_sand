USE scott;

SET time_zone = '+09:00';
SET NAMES utf8mb4;

CREATE TABLE `dept` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `loc` varchar(3) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `dept` (`id`, `name`, `loc`) VALUES
(10,	'経理',	'A01'),
(20,	'研究',	'A02'),
(30,	'営業',	'B01'),
(40,	'製造',	'C01'),
(50,	'総務',	'C02'),
(60,	'秘書室',	'A03');

CREATE TABLE `emp` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `hiredate` date NOT NULL,
  `salary` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `manager_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `emp` (`id`, `name`, `hiredate`, `salary`, `dept_id`, `manager_id`) VALUES
(6001,	'Ford',	'2001-09-12',	550000,	10,	NULL),
(6002,	'Miller',	'1999-10-25',	750000,	20,	NULL),
(6003,	'Henry',	'1999-09-14',	650000,	30,	NULL),
(6004,	'Tyler',	'2000-06-20',	650000,	40,	NULL),
(6005,	'Hayes',	'2001-03-01',	680000,	50,	NULL),
(7001,	'Wilson',	'2002-04-01',	600000,	60,	NULL),
(7002,	'Hoover',	'2002-04-01',	500000,	20,	6002),
(7003,	'Kennedy',	'2002-04-01',	600000,	40,	6004),
(7004,	'Carter',	'2002-04-01',	650000,	40,	NULL),
(8001,	'Smith',	'2010-04-01',	650000,	10,	6001),
(8002,	'Allen',	'2010-04-01',	350000,	20,	6002),
(8003,	'Ward',	'2010-04-01',	300000,	30,	6003),
(8004,	'Jones',	'2010-04-01',	320000,	40,	6004),
(8005,	'Martin',	'2010-04-01',	400000,	50,	6005),
(9001,	'Blake',	'2011-04-01',	200000,	10,	6001),
(9002,	'Clark',	'2011-04-01',	220000,	20,	6002),
(9003,	'King',	'2011-04-01',	190000,	30,	6003),
(9004,	'Turner',	'2011-04-01',	300000,	40,	6004),
(9005,	'James',	'2011-04-01',	350000,	50,	6005);

