-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 23, 2020 at 01:32 AM
-- Server version: 10.2.30-MariaDB
-- PHP Version: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u147819817_goldenocean`
--

-- --------------------------------------------------------

--
-- Table structure for table `td_account_type`
--

CREATE TABLE `td_account_type` (
  `id` int(11) NOT NULL,
  `account_type` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `td_account_type`
--

INSERT INTO `td_account_type` (`id`, `account_type`) VALUES
(1, 'administrator'),
(2, 'mere user'),
(3, 'root');

-- --------------------------------------------------------

--
-- Table structure for table `td_banks`
--

CREATE TABLE `td_banks` (
  `id` int(11) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `member_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `td_banks`
--

INSERT INTO `td_banks` (`id`, `bank_name`, `account_name`, `account_number`, `member_id`) VALUES
(8, '', '', '', 22),
(9, '', '', '', 23),
(10, '', '', '', 24),
(11, '', '', '', 25),
(12, '', '', '', 26),
(13, '', '', '', 27);

-- --------------------------------------------------------

--
-- Table structure for table `td_btc`
--

CREATE TABLE `td_btc` (
  `id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `member_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `td_deposits`
--

CREATE TABLE `td_deposits` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `date_approved` datetime DEFAULT NULL,
  `amount` decimal(10,0) NOT NULL,
  `deposit_options_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `is_pending` tinyint(1) NOT NULL,
  `is_expired` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `td_deposits`
--

INSERT INTO `td_deposits` (`id`, `member_id`, `date`, `date_approved`, `amount`, `deposit_options_id`, `package_id`, `is_pending`, `is_expired`) VALUES
(3, 23, '2020-03-23 07:38:16', '2020-03-22 07:49:07', '1000', 4, 2, 1, 0),
(4, 25, '2020-03-23 08:44:30', NULL, '6000', 1, 3, 1, 0),
(5, 23, '2020-03-23 08:50:22', '2020-03-23 08:52:26', '100', 1, 1, 1, 0),
(6, 23, '2020-03-23 09:00:08', '2020-03-23 09:00:23', '100', 1, 1, 1, 0),
(7, 23, '2020-03-23 09:17:53', '2020-03-23 09:22:34', '100', 1, 1, 0, 0),
(8, 26, '2020-03-23 09:26:29', NULL, '100', 2, 1, 1, 0),
(9, 27, '2020-03-23 09:28:36', '2020-03-23 09:29:04', '100', 3, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `td_deposit_options`
--

CREATE TABLE `td_deposit_options` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `account` varchar(255) NOT NULL,
  `rule` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `td_deposit_options`
--

INSERT INTO `td_deposit_options` (`id`, `name`, `account`, `rule`) VALUES
(1, 'Bitcoin', '1HteeoXqm361M9oKpbzJwKTGyUCUgnz7mA', ''),
(2, 'Abra', '1AXzLuaCH4cnu48PPmx7xyuEWy6daYqGjh', ''),
(3, 'Neteller', 'goldenoceaninternational@gmail.com', ''),
(4, 'Mastercard', 'https://www.buybitcoin.ph/', ''),
(5, 'Paypal', 'goldenoceaninternational@gmail.com', ''),
(6, 'Skrill', 'goldenoceaninternational@gmail.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `td_gcash`
--

CREATE TABLE `td_gcash` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(200) NOT NULL,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `td_members`
--

CREATE TABLE `td_members` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `referral_code_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `password` varchar(255) NOT NULL,
  `account_type_id` int(11) NOT NULL DEFAULT 2,
  `contact_number` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `td_members`
--

INSERT INTO `td_members` (`id`, `full_name`, `username`, `email_address`, `referral_code_id`, `date`, `password`, `account_type_id`, `contact_number`) VALUES
(1, 'test', '', 'test@g.com', 1000, '2020-03-17 10:00:00', '', 3, ''),
(27, 'jon ramyun', 'jonram', 'jonram@gmail.com', 22, '2020-03-23 09:27:15', '$2y$11$ezfhDD4eaDm1I1xJG6k1T.pHK2o4B1XJ7/NaCeZtDpFf79Em5998S', 2, ''),
(24, 'Golden Ocean Administrator', 'goadmin', 'goadmin@gmail.com', 19, '2020-03-23 07:40:16', '$2y$11$z0SgxjlnONnHeSLMFLx0S.426AYgHatCqMGzb/abHScGpk3QhNYom', 1, ''),
(25, 'Rodherick Chua', 'Dheck01', 'goldenocean398@gmail.com', 20, '2020-03-23 08:41:33', '$2y$11$NunsxfwmQRk3O9BYdBee0eKCuupRzmV70P0JclOWUPsdyz5Y6kYm.', 2, ''),
(26, 'jan ramyun', 'janram', 'janram@gmail.com', 21, '2020-03-23 09:25:27', '$2y$11$1tk30t3odQlJyDBIUMJBfuD1hY58U7Hpm4a8u52HCb.ZHUox9UWay', 2, ''),
(23, 'jun ramyun', 'junram', 'junram@gmail.com', 18, '2020-03-23 07:31:23', '$2y$11$y5MGl5R48mtFMnZ5ALz/M.BhgYNnjDSX7OGy.yDI77ctnOmNvRhcS', 2, ''),
(22, 'jin ramyun', 'jinram', 'jinram@gmail.com', 17, '2020-03-23 07:10:17', '$2y$11$rZruJXF3T.z.psLCWgtjze0NSqrq7qjA3KqjG9lnVZp5QQp.KfJXq', 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `td_packages`
--

CREATE TABLE `td_packages` (
  `id` int(11) NOT NULL,
  `package_name` varchar(255) NOT NULL,
  `daily_rate` float NOT NULL,
  `minimum_amount` float NOT NULL,
  `maximum_amount` float NOT NULL,
  `duration_in_days` int(11) NOT NULL,
  `expected_profit` decimal(10,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `td_packages`
--

INSERT INTO `td_packages` (`id`, `package_name`, `daily_rate`, `minimum_amount`, `maximum_amount`, `duration_in_days`, `expected_profit`) VALUES
(1, 'Ultramax Plan', 1, 80, 799, 120, '0'),
(2, 'Panamax Plan', 1.5, 800, 3999, 90, '0'),
(3, 'Capesize Plan', 2, 4000, 8000, 60, '0');

-- --------------------------------------------------------

--
-- Table structure for table `td_referrals`
--

CREATE TABLE `td_referrals` (
  `id` int(11) NOT NULL,
  `referrer_id` int(11) NOT NULL,
  `referee_id` int(11) NOT NULL,
  `referral_bonus` decimal(10,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `td_referrals`
--

INSERT INTO `td_referrals` (`id`, `referrer_id`, `referee_id`, `referral_bonus`) VALUES
(1, 1, 15, '0'),
(2, 1, 17, '0'),
(3, 1, 18, '0'),
(4, 1, 19, '0'),
(5, 1, 20, '0'),
(6, 1, 21, '0'),
(7, 1, 8, '0'),
(8, 1, 22, '0'),
(9, 22, 23, '0'),
(10, 1, 24, '0'),
(11, 1, 25, '0'),
(12, 23, 26, '0'),
(13, 26, 27, '0');

-- --------------------------------------------------------

--
-- Table structure for table `td_referral_bonus`
--

CREATE TABLE `td_referral_bonus` (
  `id` int(11) NOT NULL,
  `deposit_id` int(11) NOT NULL,
  `referrer_id` int(11) NOT NULL,
  `amount` decimal(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `td_referral_bonus`
--

INSERT INTO `td_referral_bonus` (`id`, `deposit_id`, `referrer_id`, `amount`) VALUES
(12, 7, 22, '5.00000'),
(13, 9, 26, '5.00000'),
(14, 9, 23, '3.00000'),
(15, 9, 22, '2.00000');

-- --------------------------------------------------------

--
-- Table structure for table `td_referral_codes`
--

CREATE TABLE `td_referral_codes` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `is_taken` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `td_referral_codes`
--

INSERT INTO `td_referral_codes` (`id`, `code`, `is_taken`) VALUES
(1, 'dAnv3l', 1),
(2, 'AaHpLW', 1),
(3, 'yMUxIk', 1),
(4, 'GxheYZ', 1),
(5, 'aZGVvI', 1),
(6, '7VPuBf', 1),
(7, 'OC0RzI', 1),
(8, 'YuJXkW', 1),
(9, 'j4AIBF', 1),
(10, 'iy0ftl', 1),
(11, 'jnd7QL', 1),
(12, 'z2Awfs', 1),
(13, 'bfwm83', 1),
(14, 'ESIqiD', 1),
(15, 'NER6xJ', 1),
(16, 'kPm27V', 1),
(17, '8mEYyP', 1),
(18, 'jAI6JM', 1),
(19, 'tmioDy', 1),
(20, 'nyHGv5', 1),
(21, 'uvH5cM', 1),
(22, 'rVZvLi', 1),
(23, '7KbjMN', 0),
(24, '8PzhgV', 0),
(25, 'qoHVtK', 0),
(26, 'Pkf3Cz', 0),
(27, 'B7CSbL', 0),
(28, 'rFLCQc', 0),
(29, 'xjW6dE', 0),
(30, 'k4o9T5', 0),
(31, '9pwDHg', 0),
(32, 'LBJgk3', 0),
(33, 'caFlp5', 0),
(34, 'xUukwo', 0),
(35, 'eFiEgN', 0),
(36, 'FxwY8e', 0),
(37, 'GAjNPK', 0),
(38, 'V5xfAa', 0),
(39, 'A1bsUK', 0),
(40, 'EuzAHl', 0),
(41, '29XeKw', 0),
(42, 'iDtUxB', 0),
(43, 'h6AnaX', 0),
(44, '3flTHw', 0),
(45, '7QpBFP', 0),
(46, 'jE8LCu', 0),
(47, 'PKOEQS', 0),
(48, '6q2agc', 0),
(49, 'EdFwzr', 0),
(50, '6obIyl', 0),
(51, '4w50Xa', 0),
(52, 'i3Y568', 0),
(53, 'zpRBmK', 0),
(54, 'xD4qsp', 0),
(55, 'srkLvy', 0),
(56, 'nQc1D7', 0),
(57, 'DEFSsd', 0),
(58, 'd6w8Ka', 0),
(59, 'GdJMPY', 0),
(60, 'm9nktx', 0),
(61, 'EV7HRv', 0),
(62, 'DnHpzf', 0),
(63, 'emYHR0', 0),
(64, 'TXtlSx', 0),
(65, 'J0wnO1', 0),
(66, '2ZCGBM', 0),
(67, 'T2MRoN', 0),
(68, 'LXf3DV', 0),
(69, 'J489z2', 0),
(70, 'qbxS7s', 0),
(71, 'e0IYqC', 0),
(72, 'CalZfn', 0),
(73, 'Gn4OBc', 0),
(74, 'iXPOK1', 0),
(75, 'LjEGvH', 0),
(76, '9vXRLh', 0),
(77, 'EPUCSv', 0),
(78, 'hy2Oo3', 0),
(79, '7zSRbe', 0),
(80, 'piLfXF', 0),
(81, 'aPU0gy', 0),
(82, 'Tts8S9', 0),
(83, 'cKwviF', 0),
(84, 'yCo3Q0', 0),
(85, 'zPT3OI', 0),
(86, '0JaXjf', 0),
(87, 'igyj9f', 0),
(88, '8YI2Z1', 0),
(89, '405rsB', 0),
(90, '54jBcx', 0),
(91, 'tUroWi', 0),
(92, '2lnghs', 0),
(93, 'iqp34S', 0),
(94, 'YjsCdz', 0),
(95, 'UM3iX1', 0),
(96, 'Ofjo2W', 0),
(97, 'cRFCIL', 0),
(98, 'xTyPKI', 0),
(99, 'zZWxso', 0),
(100, 'UuK7mf', 0),
(101, 'ABykXx', 0),
(102, 'YewK8p', 0),
(103, 'TvMtw6', 0),
(104, 'OYCXJS', 0),
(105, 'RezkgA', 0),
(106, 'JUd2Yw', 0),
(107, 'AYpeZP', 0),
(108, 'nUEGWH', 0),
(109, 'hQPSYt', 0),
(110, 'WDBVet', 0),
(111, 'jFkiTc', 0),
(112, 'SP82he', 0),
(113, 'VHr0LZ', 0),
(114, '5I9bw1', 0),
(115, 'vmIsG0', 0),
(116, 'VydZ7l', 0),
(117, 'KhFX80', 0),
(118, 'wMS68z', 0),
(119, 'NeiwE7', 0),
(120, 'gvadro', 0),
(121, 'C4DyXb', 0),
(122, 'TX1F9c', 0),
(123, 'zgDpGa', 0),
(124, 'oEDMte', 0),
(125, 'ZTWXg0', 0),
(126, 'dGarZE', 0),
(127, 'nQyY75', 0),
(128, 'GWAmtX', 0),
(129, 'dVTnLS', 0),
(130, 'UVIPBz', 0),
(131, 'OHkvCT', 0),
(132, '1QwKtL', 0),
(133, 'EdkGLg', 0),
(134, '8NQDoG', 0),
(135, 'Z7o6rc', 0),
(136, 'BuWI8Z', 0),
(137, 'sNXJQ3', 0),
(138, 'wADpZB', 0),
(139, 'QkX6tr', 0),
(140, 'GENInu', 0),
(141, '4mWrCe', 0),
(142, 'vqMwU2', 0),
(143, 'dtaKGX', 0),
(144, 'LkMCSm', 0),
(145, 'PNp9Ek', 0),
(146, 'esDZlM', 0),
(147, 'pybLfS', 0),
(148, 'kngdFY', 0),
(149, 'GuAfRw', 0),
(150, 'TVEw18', 0),
(151, '07L4Tk', 0),
(152, 'oyRAbE', 0),
(153, 'xzCGER', 0),
(154, 'zoDbsj', 0),
(155, 'AlMh7u', 0),
(156, 'M82tYK', 0),
(157, 'vNMUx1', 0),
(158, 'bdxrjl', 0),
(159, '7iF9Mb', 0),
(160, 'T9V7uW', 0),
(161, 'gsVKx3', 0),
(162, 'kINA4e', 0),
(163, 'g2Qedx', 0),
(164, 'oFOyKx', 0),
(165, 'OaCnwW', 0),
(166, 'tJbO01', 0),
(167, 'jvHCD9', 0),
(168, 'tQJ1kq', 0),
(169, 'IqlJgM', 0),
(170, 'lSrJ6a', 0),
(171, 'NFkHgl', 0),
(172, 'T4jxuH', 0),
(173, 'NOCcFe', 0),
(174, 'Xym5A0', 0),
(175, 'hx1Z92', 0),
(176, 'q9P2TY', 0),
(177, 'zJqj05', 0),
(178, '7qWdkV', 0),
(179, 'oZexNO', 0),
(180, '82Wsyf', 0),
(181, 'TwSLqr', 0),
(182, 'mUB6E8', 0),
(183, 'ATE9Bq', 0),
(184, 'DTp9jW', 0),
(185, 'bpHTto', 0),
(186, 'k94XGa', 0),
(187, 'lIwRHX', 0),
(188, '2uNxSO', 0),
(189, '9qM70T', 0),
(190, 'uRKNoI', 0),
(191, '5RSosG', 0),
(192, 'M6IBvz', 0),
(193, 'ylPu1V', 0),
(194, 'J7eOlH', 0),
(195, 'dfxAyk', 0),
(196, 'vRC7Ma', 0),
(197, 'TxG1lZ', 0),
(198, 'wIG8kM', 0),
(199, '0RtLBy', 0),
(200, '1smeWI', 0),
(201, 'J9EUKB', 0),
(202, 'OhWA7x', 0),
(203, 'aTXl6o', 0),
(204, 'lpCS98', 0),
(205, '0XNLeM', 0),
(206, 'ZYocLW', 0),
(207, 'cY3v9B', 0),
(208, 'eH9LZ3', 0),
(209, 'QJsRqG', 0),
(210, 'S3vqJb', 0),
(211, 'bEZhDA', 0),
(212, 'PbvjOK', 0),
(213, '9GZHKj', 0),
(214, 'mn5jzP', 0),
(215, 'Eih2Zm', 0),
(216, 'dzWLaN', 0),
(217, 'pEwUvH', 0),
(218, 'Whwbuj', 0),
(219, 'ESpMDT', 0),
(220, 'dEvQ7x', 0),
(221, 'uAeBTl', 0),
(222, '9F065f', 0),
(223, 'tBch6d', 0),
(224, '24uS9A', 0),
(225, 'PGiIk7', 0),
(226, 'vzpfNu', 0),
(227, 'n1aGyc', 0),
(228, 'ZIFjN4', 0),
(229, '2H4YIU', 0),
(230, '5fO7eV', 0),
(231, '5q6GsP', 0),
(232, 'Gmx7Vq', 0),
(233, 'hGr2PR', 0),
(234, 'LPOtMe', 0),
(235, 'I1wA4f', 0),
(236, 'p8Prkj', 0),
(237, 'zguBpM', 0),
(238, '7PBEdi', 0),
(239, 'ENWBnj', 0),
(240, 'rF1eSK', 0),
(241, 'RG3biN', 0),
(242, 'gKwIYU', 0),
(243, '9restp', 0),
(244, '3S16oy', 0),
(245, 'UXqol8', 0),
(246, 'oqgiNM', 0),
(247, 'DSh05u', 0),
(248, 'YDXVFq', 0),
(249, 'prXAu1', 0),
(250, 'SGAbyL', 0),
(251, 'KT7ZVe', 0),
(252, 'rksmIM', 0),
(253, 'wWYFlr', 0),
(254, 'FWMJvC', 0),
(255, 'rmgWdw', 0),
(256, 'Y4wakM', 0),
(257, '5Sh7iB', 0),
(258, 'oi8CvP', 0),
(259, 'M7kAo6', 0),
(260, 'qZe1N7', 0),
(261, 'CMHE4X', 0),
(262, '8hIQWl', 0),
(263, 'JkzrK5', 0),
(264, '9RuemQ', 0),
(265, 'fXWZAG', 0),
(266, 'dmo0fI', 0),
(267, 'oOKUrg', 0),
(268, 'nIXEfC', 0),
(269, 'wTruMX', 0),
(270, 'RhZCu8', 0),
(271, 'WQNeHx', 0),
(272, 'B2PGdU', 0),
(273, 'KUaDHo', 0),
(274, 'o65Xnc', 0),
(275, 'Z8W0jP', 0),
(276, 'kJi4Tt', 0),
(277, 't7LOA5', 0),
(278, 'o4Oav1', 0),
(279, 'ORcWpJ', 0),
(280, 'eVFQSd', 0),
(281, 'fBwN4b', 0),
(282, 'FZ5tWU', 0),
(283, 'i4rdJH', 0),
(284, 'Xh4cE1', 0),
(285, 'KoG9Bz', 0),
(286, 'fsWeCn', 0),
(287, 'QrG9Jn', 0),
(288, 'zwKAbY', 0),
(289, 'OFvkzH', 0),
(290, 'tAhioG', 0),
(291, 'K397O5', 0),
(292, 'jrmd8S', 0),
(293, 'G9nlvU', 0),
(294, 'zlCnDZ', 0),
(295, 'HBGYSe', 0),
(296, 'cgpJum', 0),
(297, 'eOCDiu', 0),
(298, 'WR8B73', 0),
(299, 'QuynvV', 0),
(300, 'FH9VXT', 0),
(301, 'sE6vlD', 0),
(302, '1MijX0', 0),
(303, '3s68Zd', 0),
(304, 'H1zRcY', 0),
(305, 'QtaZ2g', 0),
(306, '0FjhmV', 0),
(307, 'lIO2du', 0),
(308, 'TdzkBI', 0),
(309, '7xaA6C', 0),
(310, '2JXw8y', 0),
(311, 'DRfrVs', 0),
(312, '8tpaDP', 0),
(313, 'z7Txjf', 0),
(314, 'G3So7O', 0),
(315, 'xveLpd', 0),
(316, 'qW2TCZ', 0),
(317, 'deBlqz', 0),
(318, 'pY6qtV', 0),
(319, 'gpEXMH', 0),
(320, '0BKzVb', 0),
(321, 's8rZxI', 0),
(322, 'M0hL3z', 0),
(323, 'wng4qJ', 0),
(324, 'xnRwZI', 0),
(325, 'cR4MJQ', 0),
(326, 'uMUloc', 0),
(327, 'ID4nZ0', 0),
(328, 'WrlZiV', 0),
(329, '6M5gab', 0),
(330, 'OMAG7x', 0),
(331, 'bJEyMN', 0),
(332, 'H9hnec', 0),
(333, 'rWTYsC', 0),
(334, '7d1hVF', 0),
(335, 'WB0xgb', 0),
(336, 'BrjJZp', 0),
(337, 'k0pRhC', 0),
(338, '4Dx0Mv', 0),
(339, 'OQEzCn', 0),
(340, 'eridEn', 0),
(341, 'OAxrzW', 0),
(342, 'GNtJ3H', 0),
(343, 'v1V7oD', 0),
(344, '8d1VYa', 0),
(345, 'BTYCaW', 0),
(346, 'AJf6H1', 0),
(347, '0IaRMg', 0),
(348, 'x4eQ2I', 0),
(349, 'd7S41t', 0),
(350, 'SytNuL', 0),
(351, 'eJcgd0', 0),
(352, 'Cl7iVI', 0),
(353, 'np17CG', 0),
(354, 'VFdNcw', 0),
(355, 'APGD89', 0),
(356, 'q1aiOy', 0),
(357, 'qsBCv6', 0),
(358, 'KMOCAQ', 0),
(359, 'NMZphr', 0),
(360, 'scuJAl', 0),
(361, 'wHlcJD', 0),
(362, 'kYHCKR', 0),
(363, 'EfKeb1', 0),
(364, 'S9VPM4', 0),
(365, 'lCW4qS', 0),
(366, 'Zcq6GD', 0),
(367, 'ol3VHT', 0),
(368, 'FHLXw2', 0),
(369, 'Nk5TBl', 0),
(370, 'gkSCtm', 0),
(371, 'xqRpTA', 0),
(372, 'CHdeX9', 0),
(373, '4wMnqp', 0),
(374, 'RflBK9', 0),
(375, 'Fu7OqB', 0),
(376, 'j8h9qg', 0),
(377, '2561JQ', 0),
(378, 'pLZ2Tz', 0),
(379, '2HaNMz', 0),
(380, '3EO5an', 0),
(381, 'TVQZ16', 0),
(382, 'Nurwd4', 0),
(383, 'wrGY9B', 0),
(384, '2SU3IW', 0),
(385, 'rYqs9Z', 0),
(386, 'nIZN83', 0),
(387, 'SXr8lO', 0),
(388, '7BpCS2', 0),
(389, 'Fp0RAQ', 0),
(390, 'y7lvjK', 0),
(391, 'Cc43ML', 0),
(392, '05oH3t', 0),
(393, 'waMipT', 0),
(394, 'fvYKNV', 0),
(395, 'tH0PQy', 0),
(396, 'X9HUmx', 0),
(397, 'Xutcv1', 0),
(398, 'okNJUf', 0),
(399, 'VQNtuv', 0),
(400, 'hamqXo', 0),
(401, 'ImuFU5', 0),
(402, 'G7ZSNx', 0),
(403, 'R1ilWX', 0),
(404, 'XibcJ9', 0),
(405, 'kbD0ir', 0),
(406, 'CsP935', 0),
(407, 'tCzL7Y', 0),
(408, '9zXgaK', 0),
(409, 'mqGUbr', 0),
(410, 'OwX4Yd', 0),
(411, '0PerxD', 0),
(412, 'Q9ku5X', 0),
(413, 'MH2Nbm', 0),
(414, 'KGeDWa', 0),
(415, 'kaHsST', 0),
(416, 'l2rhYH', 0),
(417, 'IsrBRi', 0),
(418, 'vCtLxE', 0),
(419, 'cPMykO', 0),
(420, 'rS9TPV', 0),
(421, 'nrzNXi', 0),
(422, 'USW7Qv', 0),
(423, 'gAwf9p', 0),
(424, 'doE1D8', 0),
(425, 'rJVtMd', 0),
(426, 'QtDmWe', 0),
(427, 'hgnXSP', 0),
(428, 'yesZW9', 0),
(429, 'RmcCaj', 0),
(430, 'sSOV5o', 0),
(431, 'JPXh14', 0),
(432, 'tE6bvR', 0),
(433, 'peVF5T', 0),
(434, '3ZANF0', 0),
(435, 'L7O51a', 0),
(436, 'IdqYDt', 0),
(437, 'kiLYrD', 0),
(438, 'yTDinq', 0),
(439, 'rFNjuB', 0),
(440, 'Usb0Ha', 0),
(441, 'HwmPqQ', 0),
(442, 'KtLnrQ', 0),
(443, 'hK7tEW', 0),
(444, 'lAo7j1', 0),
(445, 'IjeraE', 0),
(446, '5hxbBq', 0),
(447, '1pMr2m', 0),
(448, 'F6tleS', 0),
(449, 'S6U1Vz', 0),
(450, '6rRkOg', 0),
(451, 'ET0rZF', 0),
(452, 'M4lLAZ', 0),
(453, 's0rwqg', 0),
(454, 'iHd6Me', 0),
(455, 'hrJU67', 0),
(456, 'z6rQs1', 0),
(457, 'DRsT53', 0),
(458, 'Q6irp7', 0),
(459, 'IGlhPD', 0),
(460, 'O8ayt2', 0),
(461, 'HMe0pK', 0),
(462, 'A6khLr', 0),
(463, 'POlGzZ', 0),
(464, 'GzbUiX', 0),
(465, 'pvxob5', 0),
(466, '6k3K42', 0),
(467, 'UElsn8', 0),
(468, 'B2H7jt', 0),
(469, 'gmpJAO', 0),
(470, 'zVTLHS', 0),
(471, 'U5tAMm', 0),
(472, 'majGsM', 0),
(473, 'Za8jqM', 0),
(474, 'vG2D1h', 0),
(475, 'Xn94xd', 0),
(476, 'zTjN5O', 0),
(477, '7RybLK', 0),
(478, 'wUVuXH', 0),
(479, 'gYcOkH', 0),
(480, 'Ts85i1', 0),
(481, 'mBGxRi', 0),
(482, 'SKD28w', 0),
(483, 'wBGPWI', 0),
(484, 'XwotQy', 0),
(485, 'DCrGgJ', 0),
(486, '4VpmcH', 0),
(487, 'h7qFRa', 0),
(488, 'w7EqBP', 0),
(489, 'fcIBED', 0),
(490, 'ZstmMd', 0),
(491, 'slXbDa', 0),
(492, '2beBMm', 0),
(493, '9Ak1vI', 0),
(494, 'ze5foH', 0),
(495, 'XyhFpL', 0),
(496, 'AldxHe', 0),
(497, 'Am3sDM', 0),
(498, 'iDcXGJ', 0),
(499, 'GMoktc', 0),
(500, 'XgAyNs', 0),
(501, 'EKJmvI', 0),
(502, 'O50E2s', 0),
(503, 'oAVrvd', 0),
(504, 'iymAEF', 0),
(505, 'xRuKNr', 0),
(506, 'YRJpgd', 0),
(507, 'Qt5gCe', 0),
(508, 'd3wWZC', 0),
(509, 'Ign8CJ', 0),
(510, 'ytIrF6', 0),
(511, '3AwR5G', 0),
(512, 'EcQoSK', 0),
(513, 'hBFgUY', 0),
(514, 'qQS8hd', 0),
(515, 'M3naup', 0),
(516, 'yMhFAB', 0),
(517, 'm9nR6e', 0),
(518, 'SPIk6f', 0),
(519, 'wvMQSI', 0),
(520, 'QYnm4i', 0),
(521, 'ekGbv6', 0),
(522, '0AhS9i', 0),
(523, 'Rah1zm', 0),
(524, 'uxlJSv', 0),
(525, 'So7e8H', 0),
(526, '6yTH27', 0),
(527, 'u1cJSz', 0),
(528, '8URWxw', 0),
(529, 'jvfeNt', 0),
(530, 'b3PLkA', 0),
(531, 'iEhPmu', 0),
(532, 'u4hlpY', 0),
(533, '9rTXIx', 0),
(534, 'J94nSt', 0),
(535, 'tKWSXf', 0),
(536, 'tScpXa', 0),
(537, '58gH0k', 0),
(538, 'qgnSj1', 0),
(539, '7urQNI', 0),
(540, '0YWXui', 0),
(541, 'nQy8oR', 0),
(542, '3E0YH5', 0),
(543, 'gehO8w', 0),
(544, 'RTi3ba', 0),
(545, 'a48QF9', 0),
(546, 'VfBPpt', 0),
(547, 'a2DNig', 0),
(548, 'UoMJz9', 0),
(549, 'qYjFIJ', 0),
(550, 'ZyQsDt', 0),
(551, 't2Kdmi', 0),
(552, 'RTHfWZ', 0),
(553, 'bzET3K', 0),
(554, 'gmVzl2', 0),
(555, '9VxY2N', 0),
(556, 'HuBPis', 0),
(557, 'sNV7iD', 0),
(558, 'KkluGM', 0),
(559, 'JweFGp', 0),
(560, 'Gpqm3E', 0),
(561, 'OWRZh2', 0),
(562, '2aUoeq', 0),
(563, 'BUhn1D', 0),
(564, 'lLdhzB', 0),
(565, 'WkorCD', 0),
(566, 'qbG8Et', 0),
(567, 'cR0Nfp', 0),
(568, 'gG2kJ0', 0),
(569, 'VWnolF', 0),
(570, 'ivHpdZ', 0),
(571, 'UWtjmu', 0),
(572, 'wy4usB', 0),
(573, 'dhy34K', 0),
(574, 'VCFenP', 0),
(575, '5nKVJf', 0),
(576, 'AQ21SP', 0),
(577, '34wBD9', 0),
(578, 'IiS3FW', 0),
(579, 'lPEbOX', 0),
(580, 'OSBbQq', 0),
(581, 'iErGXF', 0),
(582, 'OEr6ym', 0),
(583, 'cpjLu1', 0),
(584, 'BDqazA', 0),
(585, 'WO2PZl', 0),
(586, 'U4L0nj', 0),
(587, 'QhxKmR', 0),
(588, 'KPtz7m', 0),
(589, 'NxULDC', 0),
(590, 'JbBcIO', 0),
(591, 'gPZbk2', 0),
(592, 'GV2NnE', 0),
(593, 'X92xoE', 0),
(594, 'dk9vpG', 0),
(595, 'tVf0r1', 0),
(596, 'RWi1ZS', 0),
(597, '9Sexwn', 0),
(598, 'MiNVLB', 0),
(599, 'LDtXcV', 0),
(600, 'b5DATl', 0),
(601, 'mNGtQa', 0),
(602, 'LzNxlr', 0),
(603, 'JLnMEz', 0),
(604, 'HL7NwV', 0),
(605, 'DKv3Ni', 0),
(606, 'ywQaXk', 0),
(607, 'jpygaU', 0),
(608, 'kQfn7T', 0),
(609, '4gXnu6', 0),
(610, 'Vao6ut', 0),
(611, 'hW6gGy', 0),
(612, 'NvQ5PI', 0),
(613, 'IGbXAt', 0),
(614, 'sWB04I', 0),
(615, 'AMrXRK', 0),
(616, 'LFg8DW', 0),
(617, '9tQZ1R', 0),
(618, 'e9SqV0', 0),
(619, 'Uyr4zB', 0),
(620, 'G7kbCi', 0),
(621, 'wX0ziF', 0),
(622, 'WtOvYS', 0),
(623, 'X9wjsT', 0),
(624, 'DJUTir', 0),
(625, 'AoDeYt', 0),
(626, 'EJyIfq', 0),
(627, 'eLPdqY', 0),
(628, 'y4qwlZ', 0),
(629, 'pUMHxc', 0),
(630, 'RaK6Vk', 0),
(631, 'g3tRds', 0),
(632, '5Hj0C9', 0),
(633, 't1zZ6S', 0),
(634, 'VSaDvU', 0),
(635, 'DF1TAv', 0),
(636, 'k0yb1e', 0),
(637, 'vahceb', 0),
(638, 'IVhKis', 0),
(639, 'tsLc59', 0),
(640, 'ODR9oi', 0),
(641, 'UmByXT', 0),
(642, 'BgablT', 0),
(643, '4z6ehR', 0),
(644, '0KSton', 0),
(645, 's5hgtp', 0),
(646, 'FazGt3', 0),
(647, 'ntkGM4', 0),
(648, 'QO3htC', 0),
(649, 'rB0gnL', 0),
(650, 'yFcmDf', 0),
(651, 'W9uUGZ', 0),
(652, 'fNCrse', 0),
(653, 'wGJ57n', 0),
(654, 'NcpMhQ', 0),
(655, 'l6E5Gf', 0),
(656, 'r0VFa5', 0),
(657, 'ujgO7x', 0),
(658, 'I3uj6G', 0),
(659, 'YE2O7J', 0),
(660, 'wMx6bQ', 0),
(661, 'NIKlRZ', 0),
(662, 'VBJfAx', 0),
(663, 'AFOZ1B', 0),
(664, 'svJiOA', 0),
(665, '17HcNB', 0),
(666, 'aybNm6', 0),
(667, 'apwS29', 0),
(668, 'nNteSV', 0),
(669, '9Dyh0W', 0),
(670, 'Ik20hU', 0),
(671, 'nu9KFU', 0),
(672, 'TE0eIL', 0),
(673, 'nyRXtG', 0),
(674, 'wNAGpB', 0),
(675, '7kcDuf', 0),
(676, 'vmKg4Y', 0),
(677, 'GeUo1F', 0),
(678, 'NngBHC', 0),
(679, 'RjebA7', 0),
(680, 'r03qXi', 0),
(681, 'a839sw', 0),
(682, 'KQAJRS', 0),
(683, 'RPibDq', 0),
(684, 'uwY2If', 0),
(685, 'K2ezoq', 0),
(686, '4ywSk0', 0),
(687, '19PsJd', 0),
(688, 'W6V8aQ', 0),
(689, 'vfEygu', 0),
(690, 'njZDuV', 0),
(691, 'VpEi9c', 0),
(692, '94bROF', 0),
(693, 'oGcAfF', 0),
(694, 'EX7JTe', 0),
(695, 'VrOqIj', 0),
(696, 'OQcaXC', 0),
(697, '4BDYrU', 0),
(698, '6wM3Ln', 0),
(699, 'e4lfBr', 0),
(700, 'f7EK0l', 0),
(701, 'pUjPiE', 0),
(702, 'AOHqCE', 0),
(703, 'zJQk7w', 0),
(704, 'gvNepx', 0),
(705, 'ngvNC8', 0),
(706, 'ALri6I', 0),
(707, '9dwBjz', 0),
(708, 'rXuGTe', 0),
(709, 'Afrx2T', 0),
(710, 'NhuJby', 0),
(711, 'oGcmEi', 0),
(712, 'HThmOy', 0),
(713, 'xkB786', 0),
(714, 'ku93EH', 0),
(715, 'yuNSOE', 0),
(716, 'wqlIZE', 0),
(717, 'wPdfH9', 0),
(718, '3Zv7Vh', 0),
(719, 'SiDka2', 0),
(720, 'nrSRNT', 0),
(721, '3Lh4Fs', 0),
(722, 'EHA1MR', 0),
(723, 'gY8oDl', 0),
(724, '9BMpfT', 0),
(725, 'nRCd56', 0),
(726, 'k3Hi7D', 0),
(727, 'MgizZU', 0),
(728, 'O7yMaW', 0),
(729, 'RNZTGW', 0),
(730, 'FyEJl5', 0),
(731, 'fIcgXh', 0),
(732, '8DB4oi', 0),
(733, 'WsjQ16', 0),
(734, '05AJWe', 0),
(735, 'IQVbK2', 0),
(736, '82wQcn', 0),
(737, 'QlizSL', 0),
(738, 'Ewrlhi', 0),
(739, 'p5zow0', 0),
(740, 'EpMSuz', 0),
(741, 'jsVt3o', 0),
(742, 'poLGvQ', 0),
(743, '5Db9Ra', 0),
(744, 'NRgOyF', 0),
(745, 'G9W4sj', 0),
(746, '5hA9RE', 0),
(747, 'oa2kXs', 0),
(748, 'LEynH8', 0),
(749, 'xTzbR4', 0),
(750, '8ViuCq', 0),
(751, 'ZFpDhe', 0),
(752, 'L9S8Oo', 0),
(753, 'Y6pBva', 0),
(754, 'e0zdoC', 0),
(755, 'TNeGBg', 0),
(756, 'jzMLy6', 0),
(757, 'dpFqHG', 0),
(758, '2vMPxp', 0),
(759, 'PxM2Ob', 0),
(760, 'cQfyF8', 0),
(761, 'Vizeo7', 0),
(762, 'Ge6Usy', 0),
(763, 'nAPjxt', 0),
(764, 'DyOda2', 0),
(765, 'QkBx2g', 0),
(766, 'NSxlMb', 0),
(767, 'e0tcFj', 0),
(768, 'Zodvy8', 0),
(769, 'Vr8omq', 0),
(770, 'UkORzW', 0),
(771, 'D3cdXG', 0),
(772, 'abL2dE', 0),
(773, 'q4eotF', 0),
(774, 'iEMZRo', 0),
(775, 'tBFXSr', 0),
(776, '4PqzdH', 0),
(777, 'm0J9RK', 0),
(778, 'ew9TdU', 0),
(779, '4LU0hq', 0),
(780, 'eAJ8TV', 0),
(781, 'xEhwe3', 0),
(782, 'SyftJq', 0),
(783, 'John7Y', 0),
(784, 'YFfdaR', 0),
(785, 'AyYEoD', 0),
(786, 'ao6TLh', 0),
(787, 'auhzZW', 0),
(788, 'nkrQ3t', 0),
(789, 'deXxjv', 0),
(790, 'BJ4vOh', 0),
(791, 'uyj27S', 0),
(792, 'odEGrm', 0),
(793, '0mxdKo', 0),
(794, 'kC0GlK', 0),
(795, 'KPGaHJ', 0),
(796, 'LMDRhT', 0),
(797, 'OCUJ5Y', 0),
(798, '0MI8BT', 0),
(799, 'jnGtHo', 0),
(800, '0Bc5aQ', 0),
(801, 'SApdbQ', 0),
(802, 'HREy10', 0),
(803, 'hDeYFy', 0),
(804, 'yF7pAD', 0),
(805, '5UVmSe', 0),
(806, 'JY3yVz', 0),
(807, 'j4W7vH', 0),
(808, 'qjSfPH', 0),
(809, '4GpMTK', 0),
(810, '63Z5tV', 0),
(811, 'etxb5i', 0),
(812, 'qG0b4P', 0),
(813, 'mQfE6n', 0),
(814, 'rntcg7', 0),
(815, 'SCghRM', 0),
(816, 'e3bCGr', 0),
(817, 'RxqZlL', 0),
(818, 'tJAH0Q', 0),
(819, 'ERNg1F', 0),
(820, 'rJOhzN', 0),
(821, 'agfei4', 0),
(822, 'tRe1XE', 0),
(823, '3CvNLy', 0),
(824, 'mnAe49', 0),
(825, 'P7v3At', 0),
(826, 'AW7Xtc', 0),
(827, '95yI3v', 0),
(828, 'jOnfes', 0),
(829, 'tWz1gC', 0),
(830, 'qEo7zb', 0),
(831, 'kXzwEU', 0),
(832, 'O83cLb', 0),
(833, 'U7SMqj', 0),
(834, 'We7LZu', 0),
(835, 'ZRucJP', 0),
(836, 'uhnMdr', 0),
(837, '6fbtVe', 0),
(838, '2nIiqW', 0),
(839, 'qwvxh6', 0),
(840, 'WldQq5', 0),
(841, 'zhyopH', 0),
(842, 'tOgxNE', 0),
(843, 'Yliwb2', 0),
(844, 'TLmsQ1', 0),
(845, 'eZ8Ro5', 0),
(846, 'X6YOc1', 0),
(847, 'ig85UY', 0),
(848, 'PLxTQZ', 0),
(849, 'CroK5n', 0),
(850, 'z7hAEe', 0),
(851, 'bTzBDO', 0),
(852, 'D2k8Gf', 0),
(853, 'zeLKrX', 0),
(854, 'l6WgKP', 0),
(855, 'QvnFmT', 0),
(856, 'P5KMOG', 0),
(857, 'oIuw4c', 0),
(858, 'RzaDEd', 0),
(859, 'UaZ1zW', 0),
(860, 'RXrdZv', 0),
(861, 'HAsdSz', 0),
(862, 'pMHeU2', 0),
(863, 'Di0ed2', 0),
(864, 'tsOWzD', 0),
(865, 'SH8uVm', 0),
(866, 'FRVmEJ', 0),
(867, 'nIOZdg', 0),
(868, 'utc9D4', 0),
(869, '1R0tjE', 0),
(870, 'X1ACQi', 0),
(871, 'f6Ysiy', 0),
(872, 'I3xs1M', 0),
(873, 'I4AkGH', 0),
(874, '2pbrj3', 0),
(875, 'WvnwJD', 0),
(876, 'cWyKsY', 0),
(877, 'TJ69kr', 0),
(878, 'LsE8R3', 0),
(879, 'LSUvIu', 0),
(880, 'HlnX6L', 0),
(881, 'qZ4IJi', 0),
(882, 'S6iG1q', 0),
(883, 'xhRoje', 0),
(884, 'nTqOxS', 0),
(885, 'f96Vuk', 0),
(886, 'Po9zb3', 0),
(887, '1hH3tm', 0),
(888, 'ytIj0Y', 0),
(889, 'aMuq4L', 0),
(890, 'iXIqDn', 0),
(891, 'PrTm9x', 0),
(892, '0XKjiF', 0),
(893, '8chZR7', 0),
(894, 'Gc6EUx', 0),
(895, 'mtf8vI', 0),
(896, 'n4frGI', 0),
(897, 'ioWgcZ', 0),
(898, 'MwtHmF', 0),
(899, 'n5eYaR', 0),
(900, '1vDukz', 0),
(901, 'CQobPh', 0),
(902, 'u2KHLT', 0),
(903, 'MHXoyb', 0),
(904, 'rlWbcA', 0),
(905, 'IWpQ9Y', 0),
(906, 'SG7tps', 0),
(907, 'g4uEeY', 0),
(908, 'nRLMfx', 0),
(909, 'lNg4oX', 0),
(910, 'rmhZv2', 0),
(911, 'yoijUP', 0),
(912, '4NELCR', 0),
(913, '3mpcK4', 0),
(914, 'F3ik9m', 0),
(915, '0iNXFW', 0),
(916, 'ZqUV7f', 0),
(917, 'lYn8Zq', 0),
(918, 'i6V07t', 0),
(919, '7rlAoE', 0),
(920, '4zBae9', 0),
(921, 'bEy2Bn', 0),
(922, '06Zdke', 0),
(923, 'tB2Pp4', 0),
(924, 'kAXr3u', 0),
(925, 'lbSpMk', 0),
(926, 'f0pyTi', 0),
(927, 'eaNMbx', 0),
(928, 'A2SGwP', 0),
(929, 'o6F5pl', 0),
(930, 'BKlSht', 0),
(931, 'VaS8Cg', 0),
(932, 'BhbIHG', 0),
(933, '61I50o', 0),
(934, '9SN4eW', 0),
(935, '7LFjEq', 0),
(936, 'ADHUNL', 0),
(937, 'iCsbdk', 0),
(938, 'WaxR5r', 0),
(939, 'Eo6K3B', 0),
(940, 'sInWSw', 0),
(941, 'rVCgeW', 0),
(942, 'zkULNA', 0),
(943, 'h7BplO', 0),
(944, 'bsy7G4', 0),
(945, 'ZWyEng', 0),
(946, 'A8EinN', 0),
(947, 'p3ulEy', 0),
(948, 'FQY2jZ', 0),
(949, 'j5LB12', 0),
(950, 'X9gFvN', 0),
(951, 'cFsyL6', 0),
(952, '8znCWg', 0),
(953, 'QIpzTv', 0),
(954, 'sbJouE', 0),
(955, 'vW4qId', 0),
(956, 'uQ9CoT', 0),
(957, 'b5xYZU', 0),
(958, 'S9Q3Ed', 0),
(959, 'dP8Ext', 0),
(960, 'VjxOgc', 0),
(961, 'pRPBYV', 0),
(962, 'f2ECZ5', 0),
(963, 'vFUZ1t', 0),
(964, '0eJP4W', 0),
(965, 'pGxlZ8', 0),
(966, 'JFBtUw', 0),
(967, 'GiPYby', 0),
(968, 'Iuv8mL', 0),
(969, '4ZfRH7', 0),
(970, 'vCxUdI', 0),
(971, 'Vf3HIU', 0),
(972, 'oHlVjx', 0),
(973, 'lXtO2Y', 0),
(974, 'hqrBQ9', 0),
(975, 'mOv0eZ', 0),
(976, 'sCTPFw', 0),
(977, '4w1PWk', 0),
(978, '06AeEC', 0),
(979, '7pEaFW', 0),
(980, '5vhGNO', 0),
(981, 'SjhtHb', 0),
(982, 'TRK56t', 0),
(983, 'TP82o6', 0),
(984, '5AZiV6', 0),
(985, 'ZzXuNM', 0),
(986, 'Zq6ApN', 0),
(987, 'sahU80', 0),
(988, 'drEAqI', 0),
(989, 'w95Gnt', 0),
(990, 'lziGLD', 0),
(991, 'sXizTD', 0),
(992, 'iHlWUc', 0),
(993, 'HMjByq', 0),
(994, 'nSGBiX', 0),
(995, '3zOXDc', 0),
(996, 'KGcPgN', 0),
(997, '4P0tr2', 0),
(998, 'POGfiM', 0),
(999, '4IqupZ', 0),
(1000, 'N6Ufqz', 0);

-- --------------------------------------------------------

--
-- Table structure for table `td_remittance`
--

CREATE TABLE `td_remittance` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` int(12) NOT NULL,
  `remittance_center` varchar(255) NOT NULL,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `td_withdrawals`
--

CREATE TABLE `td_withdrawals` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `date_approved` datetime NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `is_pending` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `td_withdrawal_mode`
--

CREATE TABLE `td_withdrawal_mode` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `bitcoin` varchar(200) NOT NULL,
  `ethereum` varchar(200) NOT NULL,
  `abra` varchar(200) NOT NULL,
  `neteller` varchar(200) NOT NULL,
  `paypal` varchar(200) NOT NULL,
  `advcash` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `td_withdrawal_mode`
--

INSERT INTO `td_withdrawal_mode` (`id`, `member_id`, `bitcoin`, `ethereum`, `abra`, `neteller`, `paypal`, `advcash`) VALUES
(1, 22, '', '', '', '', '', ''),
(2, 23, '', '', '', '', '', ''),
(3, 24, '', '', '', '', '', ''),
(4, 25, '', '', '', '', '', ''),
(5, 26, '', '', '', '', '', ''),
(6, 27, '', '', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `td_account_type`
--
ALTER TABLE `td_account_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_banks`
--
ALTER TABLE `td_banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_btc`
--
ALTER TABLE `td_btc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_deposits`
--
ALTER TABLE `td_deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_deposit_options`
--
ALTER TABLE `td_deposit_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_gcash`
--
ALTER TABLE `td_gcash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_members`
--
ALTER TABLE `td_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_packages`
--
ALTER TABLE `td_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_referrals`
--
ALTER TABLE `td_referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_referral_bonus`
--
ALTER TABLE `td_referral_bonus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_referral_codes`
--
ALTER TABLE `td_referral_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `td_remittance`
--
ALTER TABLE `td_remittance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_withdrawals`
--
ALTER TABLE `td_withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_withdrawal_mode`
--
ALTER TABLE `td_withdrawal_mode`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `td_account_type`
--
ALTER TABLE `td_account_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `td_banks`
--
ALTER TABLE `td_banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `td_btc`
--
ALTER TABLE `td_btc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `td_deposits`
--
ALTER TABLE `td_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `td_deposit_options`
--
ALTER TABLE `td_deposit_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `td_gcash`
--
ALTER TABLE `td_gcash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `td_members`
--
ALTER TABLE `td_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `td_referrals`
--
ALTER TABLE `td_referrals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `td_referral_bonus`
--
ALTER TABLE `td_referral_bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `td_withdrawal_mode`
--
ALTER TABLE `td_withdrawal_mode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
