-- phpMyAdmin SQL Dump
-- version 4.4.6.1
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: 2015-05-28 11:03:08
-- 服务器版本： 5.6.23
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `web1`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `ano` char(7) NOT NULL,
  `apwd` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`ano`, `apwd`) VALUES
('admin_A', 'abc123');

-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `comment` char(23) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `comtime` date DEFAULT NULL,
  `somscore` char(3) CHARACTER SET utf8 DEFAULT NULL,
  `comremark` text CHARACTER SET utf8
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `cno` char(10) CHARACTER SET utf8 NOT NULL,
  `cname` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `ctimes` int(11) DEFAULT NULL,
  `csummary` tinytext CHARACTER SET utf8,
  `cimage` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `course`
--

INSERT INTO `course` (`cno`, `cname`, `ctimes`, `csummary`, `cimage`) VALUES
('10001', 'JAVA', 10, '本书通过对Java编程语言的全面介绍，引导读者快速地掌握Java编程语言的核心内容并学会灵活运用所学的语言知识及面向对象的编程思想。', 'java.jpg'),
('10002', '计算机图形学', 10, '计算机图形学(Computer Graphics，简称CG)是一种使用数学算法将二维或三维图形转化为计算机显示器的栅格形式的科学。', 'Graphics.jpg'),
('10003', '面向对象程序设计', 10, '面向对象编程（Object Oriented Programming，OOP，面向对象程序设计）是一种计算机编程架构。OOP 的一条基本原则是计算机程序是由单个能够起到子程序作用的单元或对象组合而成。', 'oop.jpg'),
('10004', 'web', 10, 'web的本意是蜘蛛网和网的意思，在网页设计中我们称为网页的意思。现广泛译作网络、互联网等技术领域。表现为三种形式，即超文本、超媒体）、超文本传输协议等。', 'web.jpg'),
('10005', '计算机程序设计与实践', 10, '面向对象程序设计（缩写：OOP）是一种程序设计范型，同时也是一种程序开发的方法。对象指的是类的实例。', 'oop-p.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `coursedata`
--

CREATE TABLE IF NOT EXISTS `coursedata` (
  `cno` char(10) NOT NULL,
  `dname` varchar(20) NOT NULL,
  `dfile` varchar(20) NOT NULL,
  `dsummary` varchar(200) NOT NULL,
  `dtime` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `sc`
--

CREATE TABLE IF NOT EXISTS `sc` (
  `sno` char(10) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `cno` char(10) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `sctimes` int(11) NOT NULL DEFAULT '0',
  `scfile` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `sctime` datetime DEFAULT NULL,
  `allowlook` char(7) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `settask`
--

CREATE TABLE IF NOT EXISTS `settask` (
  `cno` char(10) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `sctimes` int(11) NOT NULL DEFAULT '0',
  `stoptime` date DEFAULT NULL,
  `stitle` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `stcontent` varchar(200) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `settask`
--

INSERT INTO `settask` (`cno`, `sctimes`, `stoptime`, `stitle`, `stcontent`) VALUES
('10001', 1, '2015-10-11', '内部类', '见课本112页第四题		        	'),
('10001', 2, '2015-04-17', '泛型与接口', '在课本23页第三题'),
('10002', 1, '2015-04-16', '认识图形学', '课本43页第三题');

-- --------------------------------------------------------

--
-- 表的结构 `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `sno` char(10) CHARACTER SET utf8 NOT NULL,
  `spwd` char(10) CHARACTER SET utf8 DEFAULT '000000',
  `sname` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  `smajor` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `sgrade` char(6) CHARACTER SET utf8 DEFAULT NULL,
  `sclass` char(6) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `student`
--

INSERT INTO `student` (`sno`, `spwd`, `sname`, `smajor`, `sgrade`, `sclass`) VALUES
('120406324', '000000', '张三', '计算机科学与技术', '2012级', '1203'),
('120406325', '000000', '李四', '计算机科学与技术', '2012级', '1203'),
('120406326', '000000', '王刘', '计算机科学与技术', '2012级', '1202');

-- --------------------------------------------------------

--
-- 表的结构 `teacher`
--

CREATE TABLE IF NOT EXISTS `teacher` (
  `tno` char(10) CHARACTER SET utf8 NOT NULL,
  `tpwd` char(10) CHARACTER SET utf8 NOT NULL DEFAULT '000000',
  `tname` varchar(8) CHARACTER SET utf8 NOT NULL,
  `timage` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT 'sign.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `teacher`
--

INSERT INTO `teacher` (`tno`, `tpwd`, `tname`, `timage`) VALUES
('16001', '000000', '王老师', '111.jpg'),
('16002', '000000', '李老师', 'sign.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ano`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`cno`);

--
-- Indexes for table `coursedata`
--
ALTER TABLE `coursedata`
  ADD PRIMARY KEY (`cno`,`dname`);

--
-- Indexes for table `sc`
--
ALTER TABLE `sc`
  ADD PRIMARY KEY (`sno`,`cno`,`sctimes`),
  ADD KEY `cno` (`cno`);

--
-- Indexes for table `settask`
--
ALTER TABLE `settask`
  ADD PRIMARY KEY (`cno`,`sctimes`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`sno`),
  ADD FULLTEXT KEY `sgrade` (`sgrade`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`tno`,`tpwd`,`tname`);

--
-- 限制导出的表
--

--
-- 限制表 `sc`
--
ALTER TABLE `sc`
  ADD CONSTRAINT `sc_ibfk_1` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`),
  ADD CONSTRAINT `sc_ibfk_2` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
