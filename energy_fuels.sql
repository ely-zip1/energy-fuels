-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2020 at 08:46 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `energy_fuels`
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
(1, '', '', '', 178),
(2, '', '', '', 179),
(3, '', '', '', 180),
(4, '', '', '', 181);

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
(1, 178, '2020-05-16 03:34:47', NULL, '3000', 1, 2, 1, 0);

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
(1, 'Bitcoin', '1P8aoysyVtXhspEzrM9r8TN2UJP6ZsjvPE', ''),
(2, 'Abra', '1GK58Ky4rbjhSVynsA9R72ixWWR3LAxZb5\r\n', ''),
(3, 'Neteller', 'energyfuelsmainoffice@gail.com\r\n', ''),
(5, 'Mastercard', 'https://btcxe.com', ''),
(4, 'Paypal', 'energyfuelsmainoffice@gail.com', ''),
(6, 'Skrill', 'energyfuelsmainoffice@gail.com', ''),
(11, 'Reinvestment', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `td_fund_transfer`
--

CREATE TABLE `td_fund_transfer` (
  `id` int(11) NOT NULL,
  `sender_member_id` int(11) NOT NULL,
  `receiver_member_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `contact_number` varchar(11) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `image_orientation` varchar(255) NOT NULL,
  `birthdate` date NOT NULL DEFAULT current_timestamp(),
  `country` varchar(200) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `verification_code` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `td_members`
--

INSERT INTO `td_members` (`id`, `full_name`, `username`, `email_address`, `referral_code_id`, `date`, `password`, `account_type_id`, `contact_number`, `image_name`, `image_orientation`, `birthdate`, `country`, `verified`, `verification_code`) VALUES
(1, 'test', '', 'test@g.com', 1, '2020-03-17 10:00:00', '', 3, '', '', '', '2020-05-16', '', 1, ''),
(179, 'foo', 'foo', 'elisha.lapiz@gmail.com', 4, '2020-05-16 04:47:52', '$2y$11$oSEeMozrvbNQCi.Yb292Lu2V0so0XPOnxBzuIPNeb86qT3.j19/iW', 2, '', '', '', '2020-05-16', '', 1, ''),
(178, 'Ef Admin', 'admin', 'energyfuelsmainoffice@gmail.com', 3, '2020-05-16 03:29:41', '$2y$11$0wubF9e8mwyTYSNMaXox0OS1uosTmzE8USeny.sLMyoy5LDEDWiv2', 2, '', '', '', '2020-05-16', '', 1, ''),
(181, 'alo', 'alo', 'elizip.3991@gmail.com', 10, '2020-05-17 14:40:22', '$2y$11$l5EDF/cOJT1x01NbWolhXunjfpR3CClbNigfqUYSLE8wTdxQ7Ej1G', 2, '', '', '', '1999-12-12', 'Phillipines', 1, 'no70ie9');

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
(1, 'Copper Plan', 1.2, 60, 999, 100, '0'),
(2, 'Vanadium Plan', 2, 1000, 5999, 100, '0'),
(3, 'Uranium Plan', 2.5, 6000, 9999, 100, '0');

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
(1, 1, 178, '0'),
(2, 178, 179, '0'),
(3, 178, 180, '0'),
(4, 178, 181, '0');

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
(1, 'gKIWZQ', 1),
(2, 'A457aZ', 1),
(3, 'u0iqDz', 1),
(4, 'SNWxQv', 1),
(5, 'pmRDJW', 1),
(6, 'dhJt2v', 1),
(7, 'FbDsIq', 1),
(8, 'OLw3bV', 1),
(9, 'FBcSO4', 1),
(10, 'q7Hehr', 1),
(11, 'oMAWbN', 0),
(12, 'jLFc7O', 0),
(13, 'E0otNZ', 0),
(14, '0sFlK5', 0),
(15, 'k7reuf', 0),
(16, 'syMJQl', 0),
(17, '5gsWfd', 0),
(18, 'Siw3O6', 0),
(19, 'rUftgP', 0),
(20, 'LTZWUm', 0),
(21, 'GN184A', 0),
(22, 'ti5f7m', 0),
(23, 'W37j5H', 0),
(24, 'uUa2ym', 0),
(25, 'WEu2Bm', 0),
(26, 'cLn091', 0),
(27, '9NHeYc', 0),
(28, '6yaXqx', 0),
(29, 'eP7fur', 0),
(30, 'abrviH', 0),
(31, '6bD4eK', 0),
(32, 'NgJ40x', 0),
(33, 'hzAylK', 0),
(34, 'xwz2rv', 0),
(35, '8A10y3', 0),
(36, 'euMIPo', 0),
(37, 'q0se42', 0),
(38, '09yjZp', 0),
(39, 'Inpt58', 0),
(40, 'NvW1qK', 0),
(41, '6YOx1D', 0),
(42, 'UOrMd0', 0),
(43, 'ANHKqa', 0),
(44, 'VhKzJ0', 0),
(45, 'xHBY8P', 0),
(46, 'dtiq0z', 0),
(47, 'oa9FhO', 0),
(48, 'eliG9h', 0),
(49, 'wO7go2', 0),
(50, 'Wt5wkS', 0),
(51, 'yA4o85', 0),
(52, '4p3LJB', 0),
(53, 'WxjASo', 0),
(54, '9YUAzt', 0),
(55, '6ZToAy', 0),
(56, 'BAMenE', 0),
(57, 'XGEoZ0', 0),
(58, 'LqO4ys', 0),
(59, 'plhD54', 0),
(60, 'xuXyiG', 0),
(61, 'Jf5ul3', 0),
(62, 'XNovn6', 0),
(63, 'n8L2Vs', 0),
(64, 'F13uLo', 0),
(65, 'BKlQ2i', 0),
(66, 'yu6Btd', 0),
(67, 'Ntc4gY', 0),
(68, 'iVaHxM', 0),
(69, 'bxF7Yu', 0),
(70, 'NJCMA9', 0),
(71, 'XbLVne', 0),
(72, '3AmtPl', 0),
(73, 'r1aOUP', 0),
(74, 'RxOkaq', 0),
(75, 'ayJfTF', 0),
(76, 'wIvRWh', 0),
(77, 'HODCmn', 0),
(78, '6QSLCF', 0),
(79, 'j2t4kP', 0),
(80, 'tqCG0y', 0),
(81, 'sBuQ9S', 0),
(82, 'lXvxUQ', 0),
(83, 'HrbE9h', 0),
(84, 'kuM94v', 0),
(85, 'hmj38G', 0),
(86, 'bHOUg8', 0),
(87, '1feRi2', 0),
(88, 'yjFxmN', 0),
(89, 'tZVARm', 0),
(90, 'goa62s', 0),
(91, 'hjnbkE', 0),
(92, 'Mhce2G', 0),
(93, 'aGASwu', 0),
(94, 'g13Ecd', 0),
(95, 'ceydVC', 0),
(96, '4bjwMo', 0),
(97, 'nNvWBV', 0),
(98, 'PsqkAc', 0),
(99, '7xKibZ', 0),
(100, 'ADpLTH', 0),
(101, 'C3PI12', 0),
(102, 'jHAf9s', 0),
(103, 'c4uv3W', 0),
(104, 'kDuOd4', 0),
(105, 'Ul74qy', 0),
(106, 'XmxGrU', 0),
(107, 'nCaf3q', 0),
(108, 'mzpkhP', 0),
(109, 'QML6pn', 0),
(110, 'mpaxbW', 0),
(111, 'XMsQSE', 0),
(112, 'hZVGLb', 0),
(113, 'yt7FXM', 0),
(114, '9CotmP', 0),
(115, 'cQmlf7', 0),
(116, 'IHXhsR', 0),
(117, 'WF9BIV', 0),
(118, 'uv5INA', 0),
(119, 'cIz3Zq', 0),
(120, 'pZurLd', 0),
(121, 'pYWzLr', 0),
(122, 'JzEcK7', 0),
(123, 'IeCaAc', 0),
(124, 'a4OAcY', 0),
(125, 'roKjbG', 0),
(126, 'qlgYH4', 0),
(127, 'S6f4ma', 0),
(128, 'WDXpAz', 0),
(129, '4XJlRM', 0),
(130, 'EmPN0F', 0),
(131, '1unRXI', 0),
(132, 'Wm8Quo', 0),
(133, 'gDyT2a', 0),
(134, 'nEp7Ff', 0),
(135, 'K1kmdl', 0),
(136, '3MAYpx', 0),
(137, 'vhudfF', 0),
(138, 'yfRQLP', 0),
(139, 'EvLAQc', 0),
(140, 'mFevDC', 0),
(141, 'cOtzXu', 0),
(142, 'iBYmMa', 0),
(143, 'yXdV7w', 0),
(144, 'ewQhqB', 0),
(145, 'i5FM3n', 0),
(146, '3QSOJi', 0),
(147, '9XcEUg', 0),
(148, 'SaxiZY', 0),
(149, 'zL4DZw', 0),
(150, 'IhXSxe', 0),
(151, 'lcVskv', 0),
(152, 'BjHgtp', 0),
(153, 'XNQRHB', 0),
(154, 'Qoq7I5', 0),
(155, 'JfY7Fn', 0),
(156, 'me0Tgv', 0),
(157, 'ROYdWN', 0),
(158, 'M8jw3v', 0),
(159, '26TQHl', 0),
(160, '8wfAKj', 0),
(161, 'coOl1D', 0),
(162, 'DwqN27', 0),
(163, 'mdRsK5', 0),
(164, 'yONP7o', 0),
(165, 'FcbK24', 0),
(166, 'hJ3gls', 0),
(167, 'TsbvIG', 0),
(168, 'YZqW9f', 0),
(169, 'G37Cr8', 0),
(170, 'QWSyP5', 0),
(171, 'UvEMoZ', 0),
(172, '2JkO89', 0),
(173, 'ebpk9m', 0),
(174, 'YH1jy3', 0),
(175, 'fVaQKW', 0),
(176, 'VLgO9s', 0),
(177, 'iA1qys', 0),
(178, 'MW6B1t', 0),
(179, 'L8YlSK', 0),
(180, 'BhE6NC', 0),
(181, 'NI0jYv', 0),
(182, '2fK7Hs', 0),
(183, 'ybPMB3', 0),
(184, 'CqrbS3', 0),
(185, '7GLFi9', 0),
(186, 'i5DUhP', 0),
(187, 'Wizfeh', 0),
(188, 'EUg2yT', 0),
(189, 'eMRFta', 0),
(190, 'Wp5H0V', 0),
(191, 'UpYwTF', 0),
(192, 'OGBP0w', 0),
(193, '6NQICo', 0),
(194, 'bJxwAo', 0),
(195, 'POypE2', 0),
(196, '3sJFpB', 0),
(197, 'nLyq3p', 0),
(198, '6xz2U5', 0),
(199, 'ZquLXz', 0),
(200, 'AiJWfG', 0),
(201, 'o0QKj1', 0),
(202, 'Lp689w', 0),
(203, 'Ojkwgt', 0),
(204, 'kRxsPB', 0),
(205, 'lhGxUu', 0),
(206, 'QbpaDS', 0),
(207, '9EGwIt', 0),
(208, 'pPLJMh', 0),
(209, 'meOK2b', 0),
(210, 'dK2kPr', 0),
(211, 'FsyGLJ', 0),
(212, 'n9iVvG', 0),
(213, 'iqrym3', 0),
(214, 'j1cvsg', 0),
(215, 'jmzpFu', 0),
(216, 'GCcQBE', 0),
(217, '3dHrTm', 0),
(218, 'lo8RHw', 0),
(219, 'R3TrD6', 0),
(220, 'D5hJyr', 0),
(221, 'BZJqnI', 0),
(222, 'BHM5bf', 0),
(223, 'YvQhk2', 0),
(224, 'GsSIAb', 0),
(225, 'IVZK2u', 0),
(226, '7DVcId', 0),
(227, 'xiBnYc', 0),
(228, 'Xz6NVf', 0),
(229, 'JSbqOn', 0),
(230, 'OqM8e3', 0),
(231, 'dX2b5v', 0),
(232, 'fj4unr', 0),
(233, 'uo40hC', 0),
(234, 'nmItVq', 0),
(235, 'kumWBn', 0),
(236, 'cDvIp2', 0),
(237, '3CFVR4', 0),
(238, 'Gp6S5L', 0),
(239, '017qLx', 0),
(240, 'QsISWb', 0),
(241, '3VaGxm', 0),
(242, 'suZpGH', 0),
(243, 'huvOfR', 0),
(244, 'L4WQsg', 0),
(245, '10lZxj', 0),
(246, '8LNP2b', 0),
(247, 'GHaMYt', 0),
(248, 'vE5eSf', 0),
(249, 'onrP6d', 0),
(250, '2dU97q', 0),
(251, '6KTyFs', 0),
(252, 'UxSJi3', 0),
(253, 'ZyjRW2', 0),
(254, 'aeowdR', 0),
(255, 'OqCd7g', 0),
(256, 'xyoOP0', 0),
(257, 'hBR5re', 0),
(258, '12u4bl', 0),
(259, 'PIEvgl', 0),
(260, 'tEk8wH', 0),
(261, 'EQ7k4e', 0),
(262, 'MFehof', 0),
(263, 'IwipyM', 0),
(264, 'iOFPgq', 0),
(265, 'pJroDM', 0),
(266, 'NHBoP9', 0),
(267, 'WqtGRj', 0),
(268, 'C9wzYW', 0),
(269, 'x5CfPs', 0),
(270, '6aEgfH', 0),
(271, 'Wz8oFr', 0),
(272, 'E1N5ab', 0),
(273, '3CVOkD', 0),
(274, 'J5RIaz', 0),
(275, 'JNFZOr', 0),
(276, 'GKZr9f', 0),
(277, 'qoZR3N', 0),
(278, 'vcTtOo', 0),
(279, 've4bpM', 0),
(280, 'c9nHRV', 0),
(281, '0bVBDU', 0),
(282, 'xwiDPS', 0),
(283, 'uLOzBx', 0),
(284, '4sZjl6', 0),
(285, 'RWnXoB', 0),
(286, 'vdobG7', 0),
(287, 'JL8pQX', 0),
(288, 'qfSuDs', 0),
(289, 'EJG0Cs', 0),
(290, 'BfY4qJ', 0),
(291, 'ZIDvWG', 0),
(292, '8Ye5aO', 0),
(293, 'BDlmHM', 0),
(294, 'JWu2ye', 0),
(295, '0NyLle', 0),
(296, 'omOvar', 0),
(297, 'Iv2aAw', 0),
(298, 'Yxm4yn', 0),
(299, 'AQr2fp', 0),
(300, 'evYEC1', 0),
(301, 'w35kYJ', 0),
(302, 'brICpl', 0),
(303, 'IVPUQc', 0),
(304, '3jia7o', 0),
(305, 'irTynG', 0),
(306, 'C7WqLH', 0),
(307, 'aJMZgT', 0),
(308, 'HL1yC8', 0),
(309, 'ymGoTS', 0),
(310, 'olhfem', 0),
(311, 'twSqhX', 0),
(312, 'pvjaH7', 0),
(313, '2hegpH', 0),
(314, 'g0GfXp', 0),
(315, 'JGxFD2', 0),
(316, 'VIbaW8', 0),
(317, 'Rdz1Mr', 0),
(318, 'Fjqv3l', 0),
(319, 'dLjQTx', 0),
(320, 'akCcD5', 0),
(321, 'DHrUZc', 0),
(322, 'OU9qxA', 0),
(323, '1CxFpX', 0),
(324, 'Z3WhAz', 0),
(325, 'oZmhzq', 0),
(326, 'EUW7Og', 0),
(327, 'uReX3U', 0),
(328, 'ae0Zfw', 0),
(329, 'UtJvuB', 0),
(330, 'BuP5QY', 0),
(331, '7xOQg1', 0),
(332, 'ARdaSe', 0),
(333, 'a39sCj', 0),
(334, '2CYhof', 0),
(335, 'ErtZsX', 0),
(336, 'EwSGcp', 0),
(337, 'JaAr0L', 0),
(338, 'Mbx6ca', 0),
(339, 'M3BXZ6', 0),
(340, 'LJHGPY', 0),
(341, 'tRZb71', 0),
(342, 'pKQFkn', 0),
(343, 'iCFJvL', 0),
(344, 'NmY970', 0),
(345, 'dU3ZbH', 0),
(346, '4sLUnp', 0),
(347, 'M57Fwn', 0),
(348, 'ytZC8s', 0),
(349, 'RBzrcE', 0),
(350, 'HpPV4u', 0),
(351, 'P27rKL', 0),
(352, 'BWsmRk', 0),
(353, '4YkNoR', 0),
(354, 'IFCyvS', 0),
(355, 'kjrq1M', 0),
(356, 'jhQYcb', 0),
(357, '8UwC7H', 0),
(358, 'lUGD1X', 0),
(359, 'WYapE2', 0),
(360, 'kGIrB2', 0),
(361, '14UWhQ', 0),
(362, 'IYlp4k', 0),
(363, '4e5y1E', 0),
(364, 'hX2TN9', 0),
(365, 'eLVKyu', 0),
(366, 'uXHCdb', 0),
(367, 'lc7MkL', 0),
(368, 'kglQT5', 0),
(369, 'iHcl5n', 0),
(370, 'VBYaqT', 0),
(371, 'MN1cBg', 0),
(372, 'e8xmbZ', 0),
(373, 'WMKtUo', 0),
(374, 'RvHnd2', 0),
(375, 'oaqbhS', 0),
(376, 'g6kSez', 0),
(377, 'JW76bP', 0),
(378, 'zrxEJg', 0),
(379, '6e5xOA', 0),
(380, '1suXGE', 0),
(381, '4ecHoa', 0),
(382, 'k3JVr8', 0),
(383, 'bSehTB', 0),
(384, 'B1oziN', 0),
(385, 'fwLYvc', 0),
(386, 'yp0Zqc', 0),
(387, 'lfxim8', 0),
(388, 'v9neAL', 0),
(389, 'dLmYi9', 0),
(390, 'r5jX6p', 0),
(391, 'RGvlxF', 0),
(392, 'SKgPv4', 0),
(393, 's28Mif', 0),
(394, 'WFwbGk', 0),
(395, 't4sh0f', 0),
(396, 'koc2Kt', 0),
(397, 'G4LOQR', 0),
(398, 'SaWg4F', 0),
(399, 'vUbwju', 0),
(400, '0BAUtw', 0),
(401, 'x56Ws9', 0),
(402, 'VY6vfx', 0),
(403, 'ZRyz1j', 0),
(404, 'twc2hS', 0),
(405, 'xd1GXw', 0),
(406, 'fuoled', 0),
(407, 'bizdnH', 0),
(408, 'ulyprQ', 0),
(409, 'upfQMI', 0),
(410, 'MeVqE6', 0),
(411, 'zs6FXT', 0),
(412, 'qz3D0j', 0),
(413, 'AkpLqH', 0),
(414, 'rDYvkL', 0),
(415, 'HvypGw', 0),
(416, 'm4RIcM', 0),
(417, 'GQSrxt', 0),
(418, 'lP2fo7', 0),
(419, 'nRX1vl', 0),
(420, 'bKFeOP', 0),
(421, 'DKyE8t', 0),
(422, 'vY5dh4', 0),
(423, 'jYHCeQ', 0),
(424, 'IDrR1n', 0),
(425, 'ETxueR', 0),
(426, 'xqabHz', 0),
(427, 'eK8HaP', 0),
(428, 'ore6KW', 0),
(429, 'gzhmdv', 0),
(430, 'cpifYn', 0),
(431, 'eZSxCw', 0),
(432, 'kqoI3j', 0),
(433, 'lnH9ZR', 0),
(434, 'tGhUQb', 0),
(435, 'A5ZGLp', 0),
(436, '3lXTts', 0),
(437, 'F0Ge9B', 0),
(438, 'tbw3rk', 0),
(439, 'b6WTOY', 0),
(440, 'E5fBuw', 0),
(441, 'FtRI1q', 0),
(442, 'aLUMr0', 0),
(443, 'hI7UAs', 0),
(444, '6efGSm', 0),
(445, 'dBrE2F', 0),
(446, 'lKp3Bc', 0),
(447, 's3RDjT', 0),
(448, 'a2kUdF', 0),
(449, '7vYkc5', 0),
(450, 'QTF5hI', 0),
(451, 'WtQrnf', 0),
(452, '7Isdci', 0),
(453, 'iELxMH', 0),
(454, 'wKsfmy', 0),
(455, 'HQaDWJ', 0),
(456, 'nJFhKQ', 0),
(457, 'n9Lh7W', 0),
(458, 'P9KLTF', 0),
(459, 'vWquJo', 0),
(460, 'EHXyem', 0),
(461, '0DrTU2', 0),
(462, 'CLRxK5', 0),
(463, 'kwham7', 0),
(464, 'jFnGdI', 0),
(465, 'IMOgd0', 0),
(466, 'BzCQrN', 0),
(467, 'oQ4Ti7', 0),
(468, 'ws7yBz', 0),
(469, 'EhlLJn', 0),
(470, 'kizKuM', 0),
(471, 'Q0mMF4', 0),
(472, 'Fx5W3X', 0),
(473, 'IV7bs8', 0),
(474, 'qxrmBQ', 0),
(475, 'eBj5sF', 0),
(476, 'BQtxXd', 0),
(477, 'l5S4cO', 0),
(478, 'WCKOi8', 0),
(479, 'NuxXh9', 0),
(480, '8spe6P', 0),
(481, 'vdUryS', 0),
(482, '4Hvz7j', 0),
(483, '7ltIs6', 0),
(484, 'YJwqhP', 0),
(485, 'jKApSv', 0),
(486, 'aMRUFK', 0),
(487, 'LTdXb5', 0),
(488, 'WLXQsA', 0),
(489, 'Zs2tDl', 0),
(490, '9UcdvN', 0),
(491, 'slTw83', 0),
(492, 'fU38nQ', 0),
(493, 'nBlmfw', 0),
(494, 'mHwMaf', 0),
(495, 'Z7KU3x', 0),
(496, 'Dt9BEC', 0),
(497, 'pE0s7X', 0),
(498, 'GWKc1E', 0),
(499, 'z8DFje', 0),
(500, 'tzPbST', 0),
(501, 'LS9G6T', 0),
(502, 'mua4ZX', 0),
(503, 'iMXujV', 0),
(504, '9tVdwp', 0),
(505, 'DbdKLW', 0),
(506, 'vEodfh', 0),
(507, 'ma8BMQ', 0),
(508, 'Pk8o2J', 0),
(509, 'bS1Qqs', 0),
(510, '2NPG6v', 0),
(511, '4mkUQp', 0),
(512, 'GlR35H', 0),
(513, 'eu03aG', 0),
(514, '9RWlqD', 0),
(515, 'CibB0g', 0),
(516, 'cOxTIl', 0),
(517, 'k1K27Y', 0),
(518, 'uNsdIR', 0),
(519, 'oEZVdA', 0),
(520, '94usBW', 0),
(521, 'B3nljb', 0),
(522, 'a2ftX5', 0),
(523, 'YH6gTC', 0),
(524, 'JeQ2a8', 0),
(525, 'SH5cu0', 0),
(526, 'yhME0R', 0),
(527, '2oIYbn', 0),
(528, 'saHj32', 0),
(529, 'AlI3Nu', 0),
(530, '6hFnxr', 0),
(531, 'tR9Iz4', 0),
(532, 'VJ7DNj', 0),
(533, 'A6RLq3', 0),
(534, 'HZf2E4', 0),
(535, 'Rpwy7h', 0),
(536, 'ZFmIHW', 0),
(537, 'rx5Imi', 0),
(538, 'ENQphY', 0),
(539, '8svluk', 0),
(540, 'DS7fxP', 0),
(541, 'BG2QtO', 0),
(542, 'FsMKSW', 0),
(543, 'Y5gUIb', 0),
(544, '7dhIvm', 0),
(545, 'RBLGZA', 0),
(546, 'GorLQ9', 0),
(547, 'nqROYH', 0),
(548, 'X02srb', 0),
(549, '2eNWCF', 0),
(550, 'yt0TLA', 0),
(551, 'EXl397', 0),
(552, 'Cbm7ua', 0),
(553, 'AGDSOe', 0),
(554, '3DxrlR', 0),
(555, 'gqNrxi', 0),
(556, 'rsCtHx', 0),
(557, 'lWNQxj', 0),
(558, '5mOsLX', 0),
(559, 'S16T4i', 0),
(560, '8KliRd', 0),
(561, 'TNEMpb', 0),
(562, 'mwa8De', 0),
(563, 'xE0qjh', 0),
(564, '4B68Pk', 0),
(565, 'amrbe8', 0),
(566, 'yoKvWB', 0),
(567, 'C8I64X', 0),
(568, 'bZFLig', 0),
(569, 'ixQGLg', 0),
(570, 'FlHizZ', 0),
(571, 'q5tA6E', 0),
(572, 'loazsS', 0),
(573, 'kwhpjs', 0),
(574, '4qEMjv', 0),
(575, 'rTpSnw', 0),
(576, 'FnrGcd', 0),
(577, '04dbFT', 0),
(578, 'oZhHAi', 0),
(579, 'ADi8Hb', 0),
(580, 'sAiobC', 0),
(581, 'PjyNiM', 0),
(582, 'fRHDwm', 0),
(583, '48hDIr', 0),
(584, 'zP5edg', 0),
(585, 'K2ihBC', 0),
(586, 'zMSFQA', 0),
(587, 'E6yJOj', 0),
(588, 'QSbOjA', 0),
(589, 't1BUuR', 0),
(590, 'bFe6CD', 0),
(591, 'mDWjRT', 0),
(592, 'aIv9h1', 0),
(593, 'G5IVet', 0),
(594, 'Mmwsk5', 0),
(595, 'C9FHoR', 0),
(596, '25Qnop', 0),
(597, 'sBvi9W', 0),
(598, 'txqy9P', 0),
(599, 'ExZa86', 0),
(600, 'ZaWUVr', 0),
(601, 'inaOzj', 0),
(602, 'YkRHnB', 0),
(603, 'NCBvHT', 0),
(604, 'wLdSj0', 0),
(605, 'yWHsnt', 0),
(606, 'DZnKFQ', 0),
(607, 'lXCxfn', 0),
(608, 'wQjXJn', 0),
(609, 'GVIY0m', 0),
(610, 'ZNXsFA', 0),
(611, 'SM2cwA', 0),
(612, '2kK13J', 0),
(613, 'lWGrFp', 0),
(614, 'lOgY6U', 0),
(615, 'YGJZWU', 0),
(616, 'pDZxJd', 0),
(617, 'e7EIiC', 0),
(618, '4p1muB', 0),
(619, '1vU5jX', 0),
(620, 'sTn5kS', 0),
(621, '1hFcAq', 0),
(622, 'qyvHd1', 0),
(623, 'HuZVYq', 0),
(624, 'lhLHco', 0),
(625, '4y0cOU', 0),
(626, 'OCn4WI', 0),
(627, 'kpnOjH', 0),
(628, '8hBK7O', 0),
(629, 'tLlSaW', 0),
(630, 'z6tyiH', 0),
(631, 'K5nxNY', 0),
(632, 'ecPRlE', 0),
(633, 'fJ7GWX', 0),
(634, 'ERQNtu', 0),
(635, 'DzKLYB', 0),
(636, 'F1PXUV', 0),
(637, 'YOkeMr', 0),
(638, 'Y8kvz3', 0),
(639, 'RM5Tjx', 0),
(640, 'Ng3YFR', 0),
(641, 'r2QyFR', 0),
(642, 'Suw2UA', 0),
(643, 'ufV2S8', 0),
(644, 'ltKfWe', 0),
(645, 'yluPxq', 0),
(646, 'xbLiDG', 0),
(647, 'PgVrRL', 0),
(648, 'Cq0Q4R', 0),
(649, 'vDEFAH', 0),
(650, 'D3kEju', 0),
(651, 'mGELk9', 0),
(652, 'uUNS7c', 0),
(653, 'fhcXsN', 0),
(654, 'Tj95Yf', 0),
(655, 'pZP62g', 0),
(656, 'defBPN', 0),
(657, 'yMKGof', 0),
(658, 'MKB6SX', 0),
(659, 'uRWEcl', 0),
(660, 'qICXnk', 0),
(661, 'ty8PAE', 0),
(662, 'y3ULaR', 0),
(663, 'ao3MYq', 0),
(664, '0UXp7S', 0),
(665, 'L8rHq6', 0),
(666, 'eIiwmF', 0),
(667, '8kYR1L', 0),
(668, '2zP4JE', 0),
(669, 'u0qlHG', 0),
(670, 'cwqYia', 0),
(671, 'AMBzEx', 0),
(672, 'uLVwEB', 0),
(673, '18tT0P', 0),
(674, 'E7dqTt', 0),
(675, 'hjN12E', 0),
(676, 'rtIiQw', 0),
(677, 'lWTIKL', 0),
(678, '0i97hl', 0),
(679, 'TrGFtQ', 0),
(680, 'EpNyQa', 0),
(681, 'GozCrM', 0),
(682, 'YbLBh7', 0),
(683, 'Q2Z8Rv', 0),
(684, 'uCZi0I', 0),
(685, 's5ZFLO', 0),
(686, 'ntiP6Q', 0),
(687, 'JlbTYf', 0),
(688, 'DAndq9', 0),
(689, 'zdDevu', 0),
(690, '1ERzm5', 0),
(691, 'yK1fX8', 0),
(692, 'Iv9VMG', 0),
(693, 'Bd6Uf0', 0),
(694, 'eEq5UB', 0),
(695, 'bZn8cT', 0),
(696, '39VlAd', 0),
(697, 'Vjn4qM', 0),
(698, '0ehblL', 0),
(699, 'upJz57', 0),
(700, 'E9y5CD', 0),
(701, 'bQYF7U', 0),
(702, 'T2PYzn', 0),
(703, '0flCpP', 0),
(704, '6yCGnY', 0),
(705, '3P41wd', 0),
(706, 'njFOqB', 0),
(707, 'IWyH7v', 0),
(708, 'QZWSPd', 0),
(709, 'e0c9RB', 0),
(710, 'zI1p78', 0),
(711, 'weEJUu', 0),
(712, 'Ee4jmW', 0),
(713, 'AthmNU', 0),
(714, 'EU3kTp', 0),
(715, 'RqGW2l', 0),
(716, 'FV8Hwa', 0),
(717, 'iDWr83', 0),
(718, 'Z6qzJp', 0),
(719, '1TYWzq', 0),
(720, '8tup6F', 0),
(721, 'sBpybN', 0),
(722, '4xi86s', 0),
(723, 'qdCrU5', 0),
(724, 'LZTJ5B', 0),
(725, 'dfbW3h', 0),
(726, 'G5cYsf', 0),
(727, 'uHORpd', 0),
(728, 'eq1UhB', 0),
(729, '9DOeQV', 0),
(730, 'APTGBh', 0),
(731, 'yMrD2c', 0),
(732, 'nzA6iJ', 0),
(733, 'FTBQJc', 0),
(734, 'PWJ1Vz', 0),
(735, 'T6wHp4', 0),
(736, 'oWSay7', 0),
(737, 'DqrfgT', 0),
(738, 'ONrLqT', 0),
(739, 'MwWspI', 0),
(740, 'csSkzh', 0),
(741, 'ikwHcu', 0),
(742, 'e4fHp5', 0),
(743, 'C1xh0j', 0),
(744, 'AFOYnf', 0),
(745, 'IXaksZ', 0),
(746, 'gfkBnA', 0),
(747, '1TJ9lA', 0),
(748, 'UuSd3j', 0),
(749, '9zHg8S', 0),
(750, 'F3nX9e', 0),
(751, 'jfbOuX', 0),
(752, 'BuQTcW', 0),
(753, 'shqjwf', 0),
(754, 'kvmu9B', 0),
(755, 'c3Phes', 0),
(756, 'HL0T4o', 0),
(757, 'JRXEyQ', 0),
(758, 'xVaopE', 0),
(759, 'ZNRjAI', 0),
(760, '6ikGc2', 0),
(761, 'CpTrOL', 0),
(762, 'eyT73g', 0),
(763, 'B5xpnQ', 0),
(764, 'f3F1Ze', 0),
(765, 'YasfqZ', 0),
(766, 'J5UARr', 0),
(767, 'Ao3i24', 0),
(768, 'mTWdyC', 0),
(769, 'JbzuQ8', 0),
(770, 'TRblG7', 0),
(771, '3ltaSQ', 0),
(772, '5zLWvZ', 0),
(773, 'Yq2rfl', 0),
(774, 'HeRf0q', 0),
(775, 'noFszd', 0),
(776, 'GkLqNx', 0),
(777, 'jOlyv9', 0),
(778, 'xSUOBi', 0),
(779, 'tx5H6b', 0),
(780, 'SqGpiZ', 0),
(781, 'knTbst', 0),
(782, 'fDduNM', 0),
(783, '4L06Pe', 0),
(784, 'b1XeMG', 0),
(785, '8obxu1', 0),
(786, 'zaB3C2', 0),
(787, 'QJzuoI', 0),
(788, 'JVbguM', 0),
(789, 'ihNLCQ', 0),
(790, 'QqoeHt', 0),
(791, 'JvQ41H', 0),
(792, 'r0ZEGm', 0),
(793, 'YySqX8', 0),
(794, 'sUDEWV', 0),
(795, 'x3qSy9', 0),
(796, 'jENFif', 0),
(797, 'TncFyq', 0),
(798, 'ZP38lQ', 0),
(799, 'xgKbhU', 0),
(800, 'Tbq2Bc', 0),
(801, 'f5Op2L', 0),
(802, 'o7UjkA', 0),
(803, 'PeNMwZ', 0),
(804, '8wGFJ4', 0),
(805, 'u8jhCc', 0),
(806, 'aBK4nr', 0),
(807, 'EcQ8nS', 0),
(808, 'lm2AZT', 0),
(809, 't7vUN6', 0),
(810, 'jNWmeM', 0),
(811, 'v3qJmn', 0),
(812, 'QOk7PJ', 0),
(813, '0WdODv', 0),
(814, 'weE8xd', 0),
(815, 'xrT9c6', 0),
(816, 'jlt9xw', 0),
(817, 'JDZOEi', 0),
(818, 'Ruly8z', 0),
(819, '4VvtEh', 0),
(820, '5HRfau', 0),
(821, 'tGy7zS', 0),
(822, 'mEHNok', 0),
(823, 'bKM2xq', 0),
(824, '7wnmtO', 0),
(825, 'KeB43Q', 0),
(826, 'V7vSQl', 0),
(827, 'wIg8S5', 0),
(828, 'EnyVui', 0),
(829, '5YktW3', 0),
(830, 'Iz2M4x', 0),
(831, 'B8KyTS', 0),
(832, '2yaLJq', 0),
(833, 'IGly8f', 0),
(834, 'JPWjzB', 0),
(835, 'u1Y3eI', 0),
(836, '6s5KrV', 0),
(837, 'y8lxkK', 0),
(838, 'ZRhNQi', 0),
(839, '2NvcDi', 0),
(840, 'h2ZWlX', 0),
(841, 'ih0JYm', 0),
(842, 'X8R6To', 0),
(843, 'd764I9', 0),
(844, 'C0DRNX', 0),
(845, 'X8nTvW', 0),
(846, 'J6ZS34', 0),
(847, 'rgQEzY', 0),
(848, '49RpuG', 0),
(849, 'MXFkU2', 0),
(850, 'UeRO1B', 0),
(851, 'WJmgV0', 0),
(852, 'p6X1VP', 0),
(853, 'Q4nEVb', 0),
(854, 'p5e906', 0),
(855, 'YU3mD4', 0),
(856, 'BS5A81', 0),
(857, '01sVlE', 0),
(858, 'GMxAvw', 0),
(859, 'HXDGyx', 0),
(860, 'QWnRyq', 0),
(861, '0a5O2h', 0),
(862, '9pX2Tu', 0),
(863, 'KbM58l', 0),
(864, 'YndDwQ', 0),
(865, 'cTkG8u', 0),
(866, 'c9ZBzW', 0),
(867, 'ZGt8oz', 0),
(868, 'GmUJtn', 0),
(869, 'AnGkb1', 0),
(870, 'HKZwAr', 0),
(871, 'Wlstwb', 0),
(872, 'cZ1ELI', 0),
(873, 'Jc8P9B', 0),
(874, 'm0cKL9', 0),
(875, '2rGKcX', 0),
(876, 'A1Pqfx', 0),
(877, '2nWAtM', 0),
(878, 'f8TMay', 0),
(879, 'ytbOHs', 0),
(880, 'go1qj3', 0),
(881, 'EKT0XW', 0),
(882, 'SZvMgb', 0),
(883, 'gpAiWZ', 0),
(884, 'i7nQHP', 0),
(885, 'hDB9LU', 0),
(886, 'BXpiFW', 0),
(887, 'rG6kWX', 0),
(888, 'LDwXdu', 0),
(889, 'h2P7lw', 0),
(890, 'EptPAN', 0),
(891, 'AojYfU', 0),
(892, 'UW1QEq', 0),
(893, 'eF4g7N', 0),
(894, 'a6QxGK', 0),
(895, 'khT4Yb', 0),
(896, 'IrNMp1', 0),
(897, 'uPedUy', 0),
(898, 'fZIj86', 0),
(899, 'Kp69Jz', 0),
(900, 'kAde0c', 0),
(901, '8P62Q4', 0),
(902, 'cQn13I', 0),
(903, 'a7Xvks', 0),
(904, 'WY5vHq', 0),
(905, 'CUvMbi', 0),
(906, 'X34bum', 0),
(907, 'aVjtUD', 0),
(908, '5XV9RP', 0),
(909, '8fJr3g', 0),
(910, '7ix0Ll', 0),
(911, 'l25u8j', 0),
(912, 'cp8oGV', 0),
(913, 'MxamKg', 0),
(914, 'O26N3k', 0),
(915, 'gXq827', 0),
(916, 'UjtQJC', 0),
(917, 'sbZ3E6', 0),
(918, 'hjEKmN', 0),
(919, 'CtsWah', 0),
(920, 'HY8sIc', 0),
(921, 'owdNHO', 0),
(922, 'ndZlEC', 0),
(923, 'rUQExt', 0),
(924, 'S1uXH5', 0),
(925, 'tZAk3g', 0),
(926, 'xbmf3U', 0),
(927, 'C0hcRu', 0),
(928, 'Nx4AWw', 0),
(929, 'Y7yGHa', 0),
(930, '59DY7n', 0),
(931, 'I6fWpm', 0),
(932, 'lV1mHb', 0),
(933, 'Uik4Qm', 0),
(934, 'PxgAJd', 0),
(935, 'YjOdD8', 0),
(936, 'IuMRce', 0),
(937, 'Ly62t5', 0),
(938, '4GFtv0', 0),
(939, 'MfyDFT', 0),
(940, 'Q3dC8B', 0),
(941, '3XCdgG', 0),
(942, 'r47biX', 0),
(943, 'LAOMBy', 0),
(944, '1bDkBi', 0),
(945, 'WrVe6A', 0),
(946, '2iabHe', 0),
(947, 'ZSphNr', 0),
(948, 'pzfTGD', 0),
(949, 'TWJm71', 0),
(950, 'lCu8wP', 0),
(951, 'eQ9S7g', 0),
(952, 'uvLHQN', 0),
(953, 'VZauMm', 0),
(954, 'QUSAXF', 0),
(955, '4gyrVR', 0),
(956, '2ftIqS', 0),
(957, 'jMS8zR', 0),
(958, 'L8fVNv', 0),
(959, '0spwEH', 0),
(960, 'gci9yb', 0),
(961, 'bL5NDt', 0),
(962, 'SdplyU', 0),
(963, 'n6q0LN', 0),
(964, 'LCWpsv', 0),
(965, 'wHbuzq', 0),
(966, 'wCb1vc', 0),
(967, 'svjgQW', 0),
(968, 'l4JQwG', 0),
(969, 'xfeS92', 0),
(970, 'Forcqj', 0),
(971, '5iPlVJ', 0),
(972, 'jqfFsZ', 0),
(973, 'dXC2Sr', 0),
(974, 'zdojaZ', 0),
(975, 'u97xmn', 0),
(976, 'dDSXTE', 0),
(977, 'h1oPlg', 0),
(978, 'Vp3NdE', 0),
(979, '5CqzXx', 0),
(980, '0iDqgx', 0),
(981, 't8MkBy', 0),
(982, 'HcMSCs', 0),
(983, 'ju2YsR', 0),
(984, 'moQRjT', 0),
(985, 't1URHs', 0),
(986, 'dZGSrq', 0),
(987, 'Qs93fe', 0),
(988, '0ESg4c', 0),
(989, 'reomib', 0),
(990, 'TmyXgY', 0),
(991, 'fzH3Mv', 0),
(992, '5OyLlU', 0),
(993, 'SP69e7', 0),
(994, 'VysgUC', 0),
(995, 'AjUr05', 0),
(996, 'If2Car', 0),
(997, 'pa158S', 0),
(998, 'jI4LUf', 0),
(999, 'jHUwyK', 0),
(1000, 'UpoB0l', 0);

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
  `payment_method` varchar(255) NOT NULL,
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
(1, 178, 'dfsdfsdfsdfsdfsdf', '', '', '', '', ''),
(2, 179, '', '', '', '', '', ''),
(3, 180, '', '', '', '', '', ''),
(4, 181, '', '', '', '', '', '');

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
-- Indexes for table `td_fund_transfer`
--
ALTER TABLE `td_fund_transfer`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `td_btc`
--
ALTER TABLE `td_btc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `td_deposits`
--
ALTER TABLE `td_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `td_deposit_options`
--
ALTER TABLE `td_deposit_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `td_fund_transfer`
--
ALTER TABLE `td_fund_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_gcash`
--
ALTER TABLE `td_gcash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `td_members`
--
ALTER TABLE `td_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `td_referrals`
--
ALTER TABLE `td_referrals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `td_referral_bonus`
--
ALTER TABLE `td_referral_bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_referral_codes`
--
ALTER TABLE `td_referral_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT for table `td_withdrawals`
--
ALTER TABLE `td_withdrawals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_withdrawal_mode`
--
ALTER TABLE `td_withdrawal_mode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
