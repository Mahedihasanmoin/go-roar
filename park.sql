-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 25, 2019 at 01:01 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.19-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `park`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `AdminID` int(11) NOT NULL,
  `dtCreation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dtModification` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `strFirstName` varchar(100) NOT NULL DEFAULT '',
  `strLastName` varchar(100) NOT NULL DEFAULT '',
  `strLoginID` varchar(10) NOT NULL DEFAULT '',
  `strPassword` varchar(100) NOT NULL DEFAULT '',
  `intAccess` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`AdminID`, `dtCreation`, `dtModification`, `strFirstName`, `strLastName`, `strLoginID`, `strPassword`, `intAccess`) VALUES
(2, '2004-09-19 15:46:45', '0000-00-00 00:00:00', 'Firesnacks', 'Firesnacks', '100', '8d183e85d1429359f56e798e623f782a', 1),
(3, '2004-09-19 15:46:45', '0000-00-00 00:00:00', 'Firesnacks', 'Firesnacks', '199', 'e7e2ade685751044da02a7cd83ed46d1', 1),
(4, '2009-05-25 05:01:31', '0000-00-00 00:00:00', 'ParkSmart', 'ParkSmart', 'PSadmin', '8d183e85d1429359f56e798e623f782a', 1),
(5, '2009-07-31 05:56:57', '0000-00-00 00:00:00', 'ParkSmart', 'Operator', 'psop', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cardtypes`
--

CREATE TABLE `cardtypes` (
  `CardTypeID` int(11) NOT NULL,
  `dtCreation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dtModification` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `strName` varchar(100) NOT NULL DEFAULT '',
  `strAbrev` varchar(20) NOT NULL DEFAULT '',
  `strBCEName` varchar(20) NOT NULL DEFAULT '',
  `intBCEID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cardtypes`
--

INSERT INTO `cardtypes` (`CardTypeID`, `dtCreation`, `dtModification`, `strName`, `strAbrev`, `strBCEName`, `intBCEID`) VALUES
(1, '2004-05-30 08:11:47', '0000-00-00 00:00:00', 'Visa', 'VISA', 'VS', 0),
(2, '2004-06-19 19:46:57', '0000-00-00 00:00:00', 'MasterCard', 'MC', 'MC', 0),
(3, '2004-05-30 08:12:25', '0000-00-00 00:00:00', 'American Express', 'AMEX', 'AM', 0);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `ClientID` int(11) NOT NULL DEFAULT '0',
  `dtCreation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dtModification` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `strName` varchar(255) NOT NULL DEFAULT '',
  `strAbbrev` varchar(255) NOT NULL DEFAULT '',
  `blnOnOff` tinyint(4) NOT NULL DEFAULT '0',
  `strOfflineHTML` text NOT NULL,
  `intLanguage` int(11) NOT NULL DEFAULT '1',
  `blndefaultSkin` tinyint(4) NOT NULL DEFAULT '1',
  `strBasePath` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`ClientID`, `dtCreation`, `dtModification`, `strName`, `strAbbrev`, `blnOnOff`, `strOfflineHTML`, `intLanguage`, `blndefaultSkin`, `strBasePath`) VALUES
(110, '2009-10-13 10:33:19', '0000-00-00 00:00:00', 'Milton', 'Milton', 1, '', 1, 0, 'skin1'),
(200, '2010-01-04 11:39:43', '0000-00-00 00:00:00', 'Mississauga', 'Mississauga', 1, '', 1, 1, ''),
(210, '2009-10-13 10:32:55', '0000-00-00 00:00:00', 'Guelph', 'Guelph', 1, '', 1, 0, 'skin1'),
(310, '2009-10-13 10:33:38', '0000-00-00 00:00:00', 'Markham', 'Markham', 1, '', 1, 0, 'skin1'),
(410, '2009-12-22 08:21:27', '0000-00-00 00:00:00', 'Mississauga/Toronto/Oakville/London/Niagara Falls/Calgary/Edmonton/Vancouver/Richmond/Montreal', 'ParkSmart', 1, '', 1, 1, ''),
(510, '2009-10-13 10:34:03', '0000-00-00 00:00:00', 'GO Transit', 'GO Transit', 1, '', 1, 0, 'skin1'),
(610, '2009-10-13 10:34:23', '0000-00-00 00:00:00', 'Cornwall', 'Cornwall', 1, '', 1, 0, 'skin1'),
(710, '2009-12-23 03:41:10', '0000-00-00 00:00:00', 'Wellington', 'Wellington', 1, '', 1, 0, 'skin1'),
(810, '2010-01-13 10:29:20', '0000-00-00 00:00:00', 'Clarington', 'Clarington', 1, '', 1, 0, 'skin1');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `eventID` bigint(20) NOT NULL,
  `clientID` int(11) NOT NULL DEFAULT '0',
  `strProductType` text NOT NULL,
  `transactionID` bigint(20) NOT NULL DEFAULT '0',
  `dtCreation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `intType` int(11) NOT NULL DEFAULT '0',
  `intLevel` tinyint(4) NOT NULL DEFAULT '1',
  `intStatus` tinyint(4) NOT NULL DEFAULT '0',
  `txtDesc1` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`eventID`, `clientID`, `strProductType`, `transactionID`, `dtCreation`, `intType`, `intLevel`, `intStatus`, `txtDesc1`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 310, 'Parking ticket search', 0, '2019-05-27 14:15:46', 1, 0, 0, '0', '2019-05-27 14:15:46', '2019-05-27 14:15:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `eventtypes`
--

CREATE TABLE `eventtypes` (
  `eventTypeID` int(11) NOT NULL,
  `dtCreation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dtModification` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `strName` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eventtypes`
--

INSERT INTO `eventtypes` (`eventTypeID`, `dtCreation`, `dtModification`, `strName`) VALUES
(1, '2004-06-14 17:51:06', '0000-00-00 00:00:00', 'Lookup Ticket Number'),
(2, '2004-06-08 14:05:27', '0000-00-00 00:00:00', 'Ticket Payment Attempted'),
(3, '2004-06-08 14:46:02', '0000-00-00 00:00:00', 'Ticket Payment'),
(4, '2009-12-22 08:16:25', '0000-00-00 00:00:00', 'Payment Gateway error'),
(5, '2004-06-19 19:24:35', '0000-00-00 00:00:00', 'Oracle Error'),
(6, '2004-07-03 17:19:54', '0000-00-00 00:00:00', 'Ticket Check'),
(7, '2004-09-04 09:04:26', '0000-00-00 00:00:00', 'Batch Ticket Payment'),
(8, '2004-09-06 07:45:38', '0000-00-00 00:00:00', 'Batch Mail Sent');

-- --------------------------------------------------------

--
-- Table structure for table `global_settings`
--

CREATE TABLE `global_settings` (
  `id` int(11) NOT NULL,
  `dtCreation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dtModification` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `blnOnOff` tinyint(4) NOT NULL DEFAULT '0',
  `ImagePath` varchar(100) NOT NULL,
  `txtOfflineMsg` text NOT NULL,
  `intLogVerbosity` tinyint(4) NOT NULL DEFAULT '1',
  `intDebugFlag` tinyint(4) NOT NULL DEFAULT '0',
  `strSmtp` varchar(255) NOT NULL DEFAULT '',
  `strTerminalIDDevelopment` varchar(255) NOT NULL DEFAULT '',
  `txtJumpTitle_en` text NOT NULL,
  `txtJumpTitle_fr` text NOT NULL,
  `strPurgeLog` char(3) NOT NULL DEFAULT '',
  `txtCookiesMsg` text NOT NULL,
  `strFromEmailName` varchar(100) NOT NULL DEFAULT 'ParkSmart Admin',
  `strFromEmail` varchar(100) NOT NULL DEFAULT 'admin@online.parksmart.ca',
  `strFromSubject` varchar(255) NOT NULL DEFAULT 'Internet Payments',
  `txtFromBody` text NOT NULL,
  `txtCookiesMsg_fr` text NOT NULL,
  `txtOfflineMsg_fr` text NOT NULL,
  `txtJavascriptError` text NOT NULL,
  `txtJavascriptError_fr` text NOT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `global_settings`
--

INSERT INTO `global_settings` (`id`, `dtCreation`, `dtModification`, `blnOnOff`, `ImagePath`, `txtOfflineMsg`, `intLogVerbosity`, `intDebugFlag`, `strSmtp`, `strTerminalIDDevelopment`, `txtJumpTitle_en`, `txtJumpTitle_fr`, `strPurgeLog`, `txtCookiesMsg`, `strFromEmailName`, `strFromEmail`, `strFromSubject`, `txtFromBody`, `txtCookiesMsg_fr`, `txtOfflineMsg_fr`, `txtJavascriptError`, `txtJavascriptError_fr`, `deleted_at`) VALUES
(1, '2019-05-17 09:44:22', '0000-00-00 00:00:00', 1, './assets/images/', 'We are sorry. The system is currently offline. Please try again later.', 1, 0, 'localhost', 'CIG00001', 'Welcome to ParkSmart\\\'s Secure Online Parking Ticket Payment System', 'Bienvenue au Système ParkSmart de paiement en ligne sécurisé des contraventions.', '90', 'Please enable cookies in your browser.', 'ParkSmart Admin', 'admin@online.parksmart.ca', 'Internet Payments', 'Batch Report From ParkSmart', 'Veuillez permettre l\\\'accès de témoins dans votre navigateur.', 'Désolé, le système est présentement hors ligne pour maintenance périodique. Réessayez plus tard.', 'You must have javascript enabled in order to use this application.', 'S\\\'il-vous-plaît, adapter l\\\'application JavaScript dans votre navigateur.', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `merchantcards`
--

CREATE TABLE `merchantcards` (
  `CardID` int(11) NOT NULL,
  `dtCreation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dtModification` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `intCardType` int(11) NOT NULL DEFAULT '0',
  `intProductID` int(11) NOT NULL DEFAULT '0',
  `intDispOrder` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merchantcards`
--

INSERT INTO `merchantcards` (`CardID`, `dtCreation`, `dtModification`, `intCardType`, `intProductID`, `intDispOrder`) VALUES
(1, '2004-06-12 18:31:46', '0000-00-00 00:00:00', 1, 100, 1),
(2, '2004-06-12 18:31:51', '0000-00-00 00:00:00', 2, 100, 2),
(3, '2004-06-12 18:31:55', '0000-00-00 00:00:00', 3, 100, 3);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL DEFAULT '0',
  `ClientID` int(11) NOT NULL DEFAULT '0',
  `header_img` varchar(100) NOT NULL,
  `dtCreation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dtModification` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `intProductType` int(11) NOT NULL DEFAULT '0',
  `blnOnOff` tinyint(4) NOT NULL DEFAULT '0',
  `strAbbrev` varchar(255) NOT NULL DEFAULT '',
  `fltProcessingFee` float NOT NULL DEFAULT '0',
  `intModality` int(11) NOT NULL DEFAULT '1',
  `term_en` text NOT NULL,
  `term_fr` text NOT NULL,
  `intInlineReturn` int(11) NOT NULL DEFAULT '1',
  `strInlineReturn` varchar(255) DEFAULT NULL,
  `intDirectBatch` int(11) NOT NULL DEFAULT '1',
  `intProcessing` tinyint(4) NOT NULL DEFAULT '2',
  `strDBName` varchar(255) NOT NULL DEFAULT '',
  `strDBUsername` varchar(50) NOT NULL DEFAULT '',
  `strDBPassword` varchar(100) NOT NULL DEFAULT '',
  `strParksmartAgency` varchar(5) NOT NULL DEFAULT '',
  `strVendorID` varchar(30) NOT NULL DEFAULT '',
  `blnSearch2` tinyint(4) NOT NULL DEFAULT '0',
  `blnUnknownTicket` tinyint(4) NOT NULL DEFAULT '0',
  `txtErrorMsg1` text NOT NULL,
  `txtErrorMsg2` text NOT NULL,
  `txtErrorMsg3` text NOT NULL,
  `txtErrorMsg4` text NOT NULL,
  `txtErrorMsg5` text NOT NULL,
  `txtErrorMsg6` text NOT NULL,
  `txtErrorMsg7` text NOT NULL,
  `txtErrorMsg8` text NOT NULL,
  `txtErrorMsg9` text NOT NULL,
  `strTerminalIDProduction` varchar(100) NOT NULL DEFAULT '',
  `strGlobalPayUser` varchar(50) NOT NULL DEFAULT '',
  `strGlobalPayPass` varchar(50) NOT NULL DEFAULT '',
  `txtDefaultTitle_en` text NOT NULL,
  `txtDefaultTitle_fr` text NOT NULL,
  `strCardTypes` varchar(10) NOT NULL DEFAULT '',
  `intSplash` int(11) NOT NULL DEFAULT '0',
  `strSplashDir` varchar(255) NOT NULL DEFAULT '',
  `intProvince` int(11) NOT NULL DEFAULT '1',
  `strToEmailName1` varchar(255) NOT NULL DEFAULT '',
  `strToEmail1` varchar(255) NOT NULL DEFAULT '',
  `strToEmailName2` varchar(255) NOT NULL DEFAULT '',
  `strToEmail2` varchar(255) NOT NULL DEFAULT '',
  `strToEmailName3` varchar(255) NOT NULL DEFAULT '',
  `strToEmail3` varchar(255) NOT NULL DEFAULT '',
  `intBatchTime` varchar(4) NOT NULL DEFAULT '0',
  `strInlineReturn_fr` varchar(255) DEFAULT NULL,
  `txtErrorMsg10` text NOT NULL,
  `txtErrorMsg11` text NOT NULL,
  `txtErrorMsg1_fr` text NOT NULL,
  `txtErrorMsg2_fr` text NOT NULL,
  `txtErrorMsg3_fr` text NOT NULL,
  `txtErrorMsg4_fr` text NOT NULL,
  `txtErrorMsg5_fr` text NOT NULL,
  `txtErrorMsg6_fr` text NOT NULL,
  `txtErrorMsg7_fr` text NOT NULL,
  `txtErrorMsg8_fr` text NOT NULL,
  `txtErrorMsg9_fr` text NOT NULL,
  `txtErrorMsg10_fr` text NOT NULL,
  `txtErrorMsg11_fr` text NOT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `ProductID`, `ClientID`, `header_img`, `dtCreation`, `dtModification`, `intProductType`, `blnOnOff`, `strAbbrev`, `fltProcessingFee`, `intModality`, `term_en`, `term_fr`, `intInlineReturn`, `strInlineReturn`, `intDirectBatch`, `intProcessing`, `strDBName`, `strDBUsername`, `strDBPassword`, `strParksmartAgency`, `strVendorID`, `blnSearch2`, `blnUnknownTicket`, `txtErrorMsg1`, `txtErrorMsg2`, `txtErrorMsg3`, `txtErrorMsg4`, `txtErrorMsg5`, `txtErrorMsg6`, `txtErrorMsg7`, `txtErrorMsg8`, `txtErrorMsg9`, `strTerminalIDProduction`, `strGlobalPayUser`, `strGlobalPayPass`, `txtDefaultTitle_en`, `txtDefaultTitle_fr`, `strCardTypes`, `intSplash`, `strSplashDir`, `intProvince`, `strToEmailName1`, `strToEmail1`, `strToEmailName2`, `strToEmail2`, `strToEmailName3`, `strToEmail3`, `intBatchTime`, `strInlineReturn_fr`, `txtErrorMsg10`, `txtErrorMsg11`, `txtErrorMsg1_fr`, `txtErrorMsg2_fr`, `txtErrorMsg3_fr`, `txtErrorMsg4_fr`, `txtErrorMsg5_fr`, `txtErrorMsg6_fr`, `txtErrorMsg7_fr`, `txtErrorMsg8_fr`, `txtErrorMsg9_fr`, `txtErrorMsg10_fr`, `txtErrorMsg11_fr`, `deleted_at`) VALUES
(1, 100, 200, 'PS_Header.jpg', '2019-05-18 21:41:06', '0000-00-00 00:00:00', 1, 1, 'Parking Ticket', 2.5, 1, '<p>                       Thank you for using the City of Guelph\'s online                       parking ticket payment service.                     </p>                     <p>To pay your parking ticket online, you will need a Visa or MasterCard.</p>                     <p class=\"splashemphasis\">                       A convenience fee                       of $2.50 is                       applied to every transaction.                     </p>                     <p id=\"plng\">                       Please note that if your ticket                       has been filed with the Ministry of                       Transportation (MTO)                        <br>                       for collection, it is                       no longer payable using this                       service. You can pay your parking                       <br>                       ticket and applicable administration                       fee at the MTO office where they                       accept payments for license plate                       renewal.                     </p>                     <p>                       If you have any questions,                       please, contact                     </p>                     <p class=\"splashAddress\">                       the City of Guelph, Parking and Downtown Operations at:                       <br>1 Carden Street                       <br>Guelph, Ontario, N1H 3A1                       <br>519-822-1260 x2888                       <br>or send a message to                       <a href=\"mailto:parking@guelph.ca\">                         parking@guelph.ca                         <br>                       </a>                     </p>                      <p>                       <a href=\"http://www.coinamatic.com/parksmart/legal.html\">                         ParkSmart Legal Terms / Privacy                         Policy                       </a>                     </p>                      <p>                       <a href=\"http://laws.justice.gc.ca/en/P-8.6/\">                         Personal                         Information Protection and                         Electronic Documents Act (PIPEDA)                       </a>                     </p>                      <p>                       <a href=\"http://www.mto.gov.on.ca/english/dandv/vehicle/\">                         Ministry of Transportation of                         Ontario (MTO)                       </a>                     </p>                      <p>                       Smart Process by ParkSmart (A                       Coinamatic Inc. Company).                       <br>©Copyright                       2004, All Rights Reserved.                     </p>', 'Term data need to add in DB for FR language', -1, '', 2, 1, '', '', '', '', 'PARKSMART', 0, 0, 'Sorry, this system is currently unavailable. Please, try again later.', 'This ticket is filed with the Ministry of Transportation of Ontario and can not be paid online. For more information, please contact ...', 'Ticket not processed.<br>\r\nThis ticket has just been updated.  Please review before preceeding with payment.\r\n', 'The ticket could not be paid.<br>\r\nSomeone is currently attempting to pay this ticket in another browser window.', 'Sorry, this credit card has been declined. Please, make sure that credit card number is correct.', 'Sorry, your payment can not be processed at this time. Please, try again later.', 'The ticket number you have entered was not found in the system. Please, make sure that the ticket number is correct. If your ticket was issued within the last couple of days, it may not be in the system yet. ', 'This ticket is currently Closed.', 'This ticket is currently Closed.', '', 'Park5573', '5573Park', 'ParkSmart -- Secure Parking Ticket Payment System', 'ParkSmart -- Secure Parking Ticket Payment System', '1,2,,', 1, 'splash1', 0, 'Oxana Erokhovets', 'oerokhovets@coinamatic.com', 'oxer', 'oxer@sympatico.ca', 'Keith Testing', 'ksmith@firesnacks.com', '0000', '', 'No unpaid tickets were found.', 'The ticket number you have entered was not found in the system. Please, make sure that the ticket number is correct.<br> \r\nIf your ticket was issued within the last couple of days, it may not be in the system yet. If this ticket number is correct, you may continue with this payment, however additional information will be required.', 'Désolé, ce système n\\\'est pas disponible pour l\\\'instant. Réessayez plus tard.', 'Cette contravention a été transmise au ministère des Transports de l\\\'Ontario et ne peut être payée en ligne. Pour tout renseignement, communiquez avec...', 'Contravention non traitée. <br> Contravention mise ?our récemment. Veuillez l\\\'examiner avant de faire votre paiement.', 'La contravention ne pouvait être payée. <br> Quelqu\\\'un tente de payer cette contravention dans une autre fenêtre du navigateur.', 'Désolé, cette carte de crédit a été refusée. Assurez-vous que le numéro de la carte est exact.', 'Désolé, nous ne pouvons traiter votre paiement pour l\\\'instant. Réessayez plus tard.', 'Le numéro de contravention que vous avez entré n\\\'est pas dans le système. Vérifiez s\\\'il est exact. Il se peut que votre contravention ne soit pas encore dans le système si elle a été émise récemment.', 'Le dossier de cette contravention est présentement fermé.', 'Le dossier de cette contravention est présentement fermé.', 'Il n\\\'y a aucune contravention impayée.', 'Le numéro de contravention que vous avez entré n\\\'est pas dans le système. Vérifiez s\\\'il est exact. <br> Il se peut que votre contravention ne soit pas encore dans le système si elle a été émise récemment. Si le numéro est exact, poursuivre le processus de paiement. ', '0000-00-00 00:00:00'),
(2, 1110, 110, 'PS_Header.jpg', '2019-05-18 21:41:10', '0000-00-00 00:00:00', 1, 1, 'Parking Ticket', 2.5, 1, '<p>                       Thank you for using the City of Guelph\'s online                       parking ticket payment service.                     </p>                     <p>To pay your parking ticket online, you will need a Visa or MasterCard.</p>                     <p class=\"splashemphasis\">                       A convenience fee                       of $2.50 is                       applied to every transaction.                     </p>                     <p id=\"plng\">                       Please note that if your ticket                       has been filed with the Ministry of                       Transportation (MTO)                        <br>                       for collection, it is                       no longer payable using this                       service. You can pay your parking                       <br>                       ticket and applicable administration                       fee at the MTO office where they                       accept payments for license plate                       renewal.                     </p>                     <p>                       If you have any questions,                       please, contact                     </p>                     <p class=\"splashAddress\">                       the City of Guelph, Parking and Downtown Operations at:                       <br>1 Carden Street                       <br>Guelph, Ontario, N1H 3A1                       <br>519-822-1260 x2888                       <br>or send a message to                       <a href=\"mailto:parking@guelph.ca\">                         parking@guelph.ca                         <br>                       </a>                     </p>                      <p>                       <a href=\"http://www.coinamatic.com/parksmart/legal.html\">                         ParkSmart Legal Terms / Privacy                         Policy                       </a>                     </p>                      <p>                       <a href=\"http://laws.justice.gc.ca/en/P-8.6/\">                         Personal                         Information Protection and                         Electronic Documents Act (PIPEDA)                       </a>                     </p>                      <p>                       <a href=\"http://www.mto.gov.on.ca/english/dandv/vehicle/\">                         Ministry of Transportation of                         Ontario (MTO)                       </a>                     </p>                      <p>                       Smart Process by ParkSmart (A                       Coinamatic Inc. Company).                       <br>©Copyright                       2004, All Rights Reserved.                     </p>', 'Term data need to add in DB for FR language', -1, '', 1, 1, 'ticket_oracle', 'ivruser', 'ivrpwd', 'MLTCI', 'PARKSMART', 0, 0, 'Sorry, this system is currently unavailable. Please, try again later.', 'This ticket is filed with the Ministry of Transportation of Ontario and can not be paid online. For more information, please contact Town of Milton (905) 878-7252 ext.2530.', 'Ticket not processed.<br>\r\nThis ticket has just been updated.  Please review before preceeding with payment.', 'The ticket could not be paid.<br>\r\nSomeone is currently attempting to pay this ticket in another browser window.', 'Sorry, this credit card has been declined. Please, make sure that credit card number is correct.', 'Sorry, your payment can not be processed at this time. Please, try again later.', 'The ticket number you have entered was not found in the system. Please, make sure that the ticket number is correct. If your ticket was issued within the last couple of days, it may not be in the system yet. ', 'This ticket is currently Closed.', 'This ticket is currently Closed.', '21100099', 'Town6011', '6011Town', 'The Corporation of the Town of Milton - Secure Parking Ticket Payment System', 'La corporation de la ville de Milton - Système sécurisé de paiement des contraventions', '1,2,,', 1, 'splash1', 0, '', '', '', '', '', '', '', '', 'No unpaid tickets were found.', 'The ticket number you have entered was not found in the system. Please, make sure that the ticket number is correct.<br> \r\nIf your ticket was issued within the last couple of days, it may not be in the system yet. If this ticket number is correct, you may continue with this payment, however additional information will be required.', 'Désolé, ce système n\\\'est pas disponible pour l\\\'instant. Réessayez plus tard.', 'Cette contravention a été transmise au ministère des Transports de l\\\'Ontario et ne peut être payée en ligne. Pour tout renseignement, communiquez avec la ville de Milton au 905.878.7252, poste 2530.', 'Contravention non traitée. <br> Contravention mise ?our récemment. Veuillez l\\\'examiner avant de faire votre paiement.', 'La contravention ne pouvait être payée. <br> Quelqu\\\'un tente de payer cette contravention dans une autre fenêtre du navigateur.', 'Désolé, cette carte de crédit a été refusée. Assurez-vous que le numéro de la carte est exact.', 'Désolé, nous ne pouvons traiter votre paiement pour l\\\'instant. Réessayez plus tard.', 'Le numéro de contravention que vous avez entré n\\\'est pas dans le système. Vérifiez s\\\'il est exact. Il se peut que votre contravention ne soit pas encore dans le système si elle a été émise récemment.', 'Le dossier de cette contravention est présentement fermé.', 'Le dossier de cette contravention est présentement fermé.', 'Il n\\\'y a aucune contravention impayée.', 'Le numéro de contravention que vous avez entré n\\\'est pas dans le système. Vérifiez s\\\'il est exact. <br> Il se peut que votre contravention ne soit pas encore dans le système si elle a été émise récemment. Si le numéro est exact, vous pouvez poursuivre le paiement, mais d\\\'autres renseignements seront nécessaires.', '0000-00-00 00:00:00'),
(3, 1210, 210, 'guelph.jpg', '2019-05-18 21:41:11', '0000-00-00 00:00:00', 1, 1, 'Parking Ticket', 2.5, 1, '<p>                       Thank you for using the City of Guelph\'s online                       parking ticket payment service.                     </p>                     <p>To pay your parking ticket online, you will need a Visa or MasterCard.</p>                     <p class=\"splashemphasis\">                       A convenience fee                       of $2.50 is                       applied to every transaction.                     </p>                     <p id=\"plng\">                       Please note that if your ticket                       has been filed with the Ministry of                       Transportation (MTO)                        <br>                       for collection, it is                       no longer payable using this                       service. You can pay your parking                       <br>                       ticket and applicable administration                       fee at the MTO office where they                       accept payments for license plate                       renewal.                     </p>                     <p>                       If you have any questions,                       please, contact                     </p>                     <p class=\"splashAddress\">                       the City of Guelph, Parking and Downtown Operations at:                       <br>1 Carden Street                       <br>Guelph, Ontario, N1H 3A1                       <br>519-822-1260 x2888                       <br>or send a message to                       <a href=\"mailto:parking@guelph.ca\">                         parking@guelph.ca                         <br>                       </a>                     </p>                      <p>                       <a href=\"http://www.coinamatic.com/parksmart/legal.html\">                         ParkSmart Legal Terms / Privacy                         Policy                       </a>                     </p>                      <p>                       <a href=\"http://laws.justice.gc.ca/en/P-8.6/\">                         Personal                         Information Protection and                         Electronic Documents Act (PIPEDA)                       </a>                     </p>                      <p>                       <a href=\"http://www.mto.gov.on.ca/english/dandv/vehicle/\">                         Ministry of Transportation of                         Ontario (MTO)                       </a>                     </p>                      <p>                       Smart Process by ParkSmart (A                       Coinamatic Inc. Company).                       <br>©Copyright                       2004, All Rights Reserved.                     </p>', 'Term data need to add in DB for FR language', -1, '', 1, 1, 'ticket_oracle', 'ivruser', 'ivrpwd', 'GLPCI', 'PARKSMART', 0, 0, 'Sorry, this system is currently unavailable. Please, try again later.', 'This ticket is filed with the Ministry of Transportation of Ontario and can not be paid online. For more information, please contact City of Guelph at (519) 837-5612.', 'Ticket not processed.<br>\r\nThis ticket has just been updated.  Please review before preceeding with payment.', 'The ticket could not be paid.<br>\r\nSomeone is currently attempting to pay this ticket in another browser window.', 'Sorry, this credit card has been declined. Please, make sure that credit card number is correct.', 'Sorry, your payment can not be processed at this time. Please, try again later.', 'The ticket number you have entered was not found in the system. Please, make sure that the ticket number is correct. If your ticket was issued within the last couple of days, it may not be in the system yet. ', 'This ticket is currently Closed.', 'This ticket is currently Closed.', '', 'City3005', '3005City', 'City of Guelph - Secure Parking Ticket Payment System', 'Ville de Guelph - Système sécurisé de paiement des contraventions', '1,2,,', 1, 'splash1', 0, '', '', '', '', '', '', '', '', 'No unpaid tickets were found.', 'The ticket number you have entered was not found in the system. Please, make sure that the ticket number is correct.<br> \r\nIf your ticket was issued within the last couple of days, it may not be in the system yet. If this ticket number is correct, you may continue with this payment, however additional information will be required.', 'Désolé, ce système n\\\'est pas disponible pour l\\\'instant. Réessayez plus tard.', 'Cette contravention a été transmise au ministère des Transports de l\\\'Ontario et ne peut être payée en ligne. Pour tout renseignement, communiquez avec la ville de Guelph au 519.837.5612.', 'Contravention non traitée. <br> Contravention mise ?our récemment. Veuillez l\\\'examiner avant de faire votre paiement.', 'La contravention ne pouvait être payée. <br> Quelqu\\\'un tente de payer cette contravention dans une autre fenêtre du navigateur.', 'Désolé, cette carte de crédit a été refusée. Assurez-vous que le numéro de la carte est exact.', 'Désolé, nous ne pouvons traiter votre paiement pour l\\\'instant. Réessayez plus tard.', 'Le numéro de contravention que vous avez entré n\\\'est pas dans le système. Vérifiez s\\\'il est exact. Il se peut que votre contravention ne soit pas encore dans le système si elle a été émise récemment.', 'Le dossier de cette contravention est présentement fermé.', 'Le dossier de cette contravention est présentement fermé.', 'Il n\\\'y a aucune contravention impayée.', 'Le numéro de contravention que vous avez entré n\\\'est pas dans le système. Vérifiez s\\\'il est exact. <br> Il se peut que votre contravention ne soit pas encore dans le système si elle a été émise récemment. Si le numéro est exact, vous pouvez poursuivre le paiement, mais d\\\'autres renseignements seront nécessaires.', '0000-00-00 00:00:00'),
(4, 1310, 310, 'PS_Header.jpg', '2019-05-18 21:41:13', '0000-00-00 00:00:00', 1, 1, 'Parking Ticket', 2.5, 1, '<p>                       Thank you for using the City of Guelph\'s online                       parking ticket payment service.                     </p>                     <p>To pay your parking ticket online, you will need a Visa or MasterCard.</p>                     <p class=\"splashemphasis\">                       A convenience fee                       of $2.50 is                       applied to every transaction.                     </p>                     <p id=\"plng\">                       Please note that if your ticket                       has been filed with the Ministry of                       Transportation (MTO)                        <br>                       for collection, it is                       no longer payable using this                       service. You can pay your parking                       <br>                       ticket and applicable administration                       fee at the MTO office where they                       accept payments for license plate                       renewal.                     </p>                     <p>                       If you have any questions,                       please, contact                     </p>                     <p class=\"splashAddress\">                       the City of Guelph, Parking and Downtown Operations at:                       <br>1 Carden Street                       <br>Guelph, Ontario, N1H 3A1                       <br>519-822-1260 x2888                       <br>or send a message to                       <a href=\"mailto:parking@guelph.ca\">                         parking@guelph.ca                         <br>                       </a>                     </p>                      <p>                       <a href=\"http://www.coinamatic.com/parksmart/legal.html\">                         ParkSmart Legal Terms / Privacy                         Policy                       </a>                     </p>                      <p>                       <a href=\"http://laws.justice.gc.ca/en/P-8.6/\">                         Personal                         Information Protection and                         Electronic Documents Act (PIPEDA)                       </a>                     </p>                      <p>                       <a href=\"http://www.mto.gov.on.ca/english/dandv/vehicle/\">                         Ministry of Transportation of                         Ontario (MTO)                       </a>                     </p>                      <p>                       Smart Process by ParkSmart (A                       Coinamatic Inc. Company).                       <br>©Copyright                       2004, All Rights Reserved.                     </p>', 'Term data need to add in DB for FR language', -1, '', 1, 1, 'markham', 'ivruser', 'ivrpwd', 'MRKHM', 'PARKSMART', 0, 0, 'Sorry, this system is currently unavailable. Please, try again later.', 'This ticket is filed with the Ministry of Transportation of Ontario and can not be paid online. For more information, please contact Town of Markham (905) 477-7000 ext.2050.', 'Ticket not processed.<br>\r\nThis ticket has just been updated.  Please review before preceeding with payment.', 'The ticket could not be paid.<br>\r\nSomeone is currently attempting to pay this ticket in another browser window.', 'Sorry, this credit card has been declined. Please, make sure that credit card number is correct.', 'Sorry, your payment can not be processed at this time. Please, try again later.', 'The ticket number you have entered was not found in the system. Please, make sure that the ticket number is correct. If your ticket was issued within the last couple of days, it may not be in the system yet. ', 'This ticket is currently Closed.', 'This ticket is currently Closed.', '21101219', 'Town8500', '8500Town', 'The Corporation of the Town of Markham - Secure Parking Ticket Payment System', 'La corporation de la ville de Markham - Système sécurisé de paiement des contraventions', '1,2,3,', 1, 'splash1', 0, '', '', '', '', '', '', '', '', 'No unpaid tickets were found.', 'The ticket number you have entered was not found in the system. Please, make sure that the ticket number is correct.<br> \r\nIf your ticket was issued within the last couple of days, it may not be in the system yet. If this ticket number is correct, you may continue with this payment, however additional information will be required.', 'Désolé, ce système n\\\'est pas disponible pour l\\\'instant. Réessayez plus tard.', 'Cette contravention a été transmise au ministère des Transports de l\\\'Ontario et ne peut être payée en ligne. Pour tout renseignement, communiquez avec la ville de Markam au 905.477.7000, poste 2050.', 'Contravention non traitée. <br> Contravention mise ?our récemment. Veuillez l\\\'examiner avant de faire votre paiement.', 'La contravention ne pouvait être payée. <br> Quelqu\\\'un tente de payer cette contravention dans une autre fenêtre du navigateur.', 'Désolé, cette carte de crédit a été refusée. Assurez-vous que le numéro de la carte est exact.', 'Désolé, nous ne pouvons traiter votre paiement pour l\\\'instant. Réessayez plus tard.', 'Le numéro de contravention que vous avez entré n\\\'est pas dans le système. Vérifiez s\\\'il est exact. Il se peut que votre contravention ne soit pas encore dans le système si elle a été émise récemment.', 'Le dossier de cette contravention est présentement fermé.', 'Le dossier de cette contravention est présentement fermé.', 'Il n\\\'y a aucune contravention impayée.', 'Le numéro de contravention que vous avez entré n\\\'est pas dans le système. Vérifiez s\\\'il est exact. <br> Il se peut que votre contravention ne soit pas encore dans le système si elle a été émise récemment. Si le numéro est exact, vous pouvez poursuivre le paiement, mais d\\\'autres renseignements seront nécessaires.', '0000-00-00 00:00:00'),
(5, 1410, 410, 'PS_Header.jpg', '2019-05-18 21:41:15', '0000-00-00 00:00:00', 1, 1, 'Parking Ticket', 2.5, 1, '<p>                       Thank you for using the City of Guelph\'s online                       parking ticket payment service.                     </p>                     <p>To pay your parking ticket online, you will need a Visa or MasterCard.</p>                     <p class=\"splashemphasis\">                       A convenience fee                       of $2.50 is                       applied to every transaction.                     </p>                     <p id=\"plng\">                       Please note that if your ticket                       has been filed with the Ministry of                       Transportation (MTO)                        <br>                       for collection, it is                       no longer payable using this                       service. You can pay your parking                       <br>                       ticket and applicable administration                       fee at the MTO office where they                       accept payments for license plate                       renewal.                     </p>                     <p>                       If you have any questions,                       please, contact                     </p>                     <p class=\"splashAddress\">                       the City of Guelph, Parking and Downtown Operations at:                       <br>1 Carden Street                       <br>Guelph, Ontario, N1H 3A1                       <br>519-822-1260 x2888                       <br>or send a message to                       <a href=\"mailto:parking@guelph.ca\">                         parking@guelph.ca                         <br>                       </a>                     </p>                      <p>                       <a href=\"http://www.coinamatic.com/parksmart/legal.html\">                         ParkSmart Legal Terms / Privacy                         Policy                       </a>                     </p>                      <p>                       <a href=\"http://laws.justice.gc.ca/en/P-8.6/\">                         Personal                         Information Protection and                         Electronic Documents Act (PIPEDA)                       </a>                     </p>                      <p>                       <a href=\"http://www.mto.gov.on.ca/english/dandv/vehicle/\">                         Ministry of Transportation of                         Ontario (MTO)                       </a>                     </p>                      <p>                       Smart Process by ParkSmart (A                       Coinamatic Inc. Company).                       <br>©Copyright                       2004, All Rights Reserved.                     </p>', 'Term data need to add in DB for FR language', -1, '', 1, 1, 'ticket_oracle', 'ivruser', 'ivrpwd', 'PRKSM', 'PARKSMART', 1, 1, 'Sorry, this system is currently unavailable. Please, try again later.', '', 'Ticket not processed.<br>\r\nThis ticket has just been updated.  Please review before preceeding with payment.', 'The ticket could not be paid.<br>\r\nSomeone is currently attempting to pay this ticket in another browser window.', 'Sorry, this credit card has been declined. Please, make sure that credit card number is correct.', 'Sorry, your payment can not be processed at this time. Please, try again later.', 'The ticket number you have entered was not found in the system. Please, make sure that the ticket number is correct. If your ticket was issued within the last couple of days, it may not be in the system yet. ', 'This ticket is currently Closed.', 'This ticket is currently Closed.', '21100096', 'Park5573', '5573Park', 'ParkSmart - Secure Parking Ticket Payment System', 'ParkSmart - Système sécurisé de paiement des contraventions', '1,2,,', 1, '', 0, '', '', '', '', '', '', '', '', 'No unpaid tickets were found.', 'The ticket number you have entered was not found in the system. Please, make sure that the ticket number is correct.<br> \r\nIf your ticket was issued within the last couple of days, it may not be in the system yet. If this ticket number is correct, please continue with this payment.', 'Désolé, ce système n\\\'est pas disponible pour l\\\'instant. Réessayez plus tard.', 'Cette contravention a été transmise au ministère des Transports de l\\\'Ontario et ne peut être payée en ligne. Pour tout renseignement, communiquez avec...', 'Contravention non traitée. <br> Contravention mise ?our récemment. Veuillez l\\\'examiner avant de faire votre paiement.', 'La contravention ne pouvait être payée. <br> Quelqu\\\'un tente de payer cette contravention dans une autre fenêtre du navigateur.', 'Désolé, cette carte de crédit a été refusée. Assurez-vous que le numéro de la carte est exact.', 'Désolé, nous ne pouvons traiter votre paiement pour l\\\'instant. Réessayez plus tard.', 'Le numéro de contravention que vous avez entré n\\\'est pas dans le système. Vérifiez s\\\'il est exact. Il se peut que votre contravention ne soit pas encore dans le système si elle a été émise récemment.', 'Le dossier de cette contravention est présentement fermé.', 'Le dossier de cette contravention est présentement fermé.', 'Il n\\\'y a aucune contravention impayée.', 'Le numéro de contravention que vous avez entré n\\\'est pas dans le système. Vérifiez s\\\'il est exact. <br> Il se peut que votre contravention ne soit pas encore dans le système si elle a été émise récemment. Si le numéro est exact, poursuivre le processus de paiement. ', '0000-00-00 00:00:00'),
(6, 1510, 510, 'PS_Header.jpg', '2019-05-18 21:41:16', '0000-00-00 00:00:00', 1, 1, 'Parking Ticket', 2.5, 1, '<p>                       Thank you for using the City of Guelph\'s online                       parking ticket payment service.                     </p>                     <p>To pay your parking ticket online, you will need a Visa or MasterCard.</p>                     <p class=\"splashemphasis\">                       A convenience fee                       of $2.50 is                       applied to every transaction.                     </p>                     <p id=\"plng\">                       Please note that if your ticket                       has been filed with the Ministry of                       Transportation (MTO)                        <br>                       for collection, it is                       no longer payable using this                       service. You can pay your parking                       <br>                       ticket and applicable administration                       fee at the MTO office where they                       accept payments for license plate                       renewal.                     </p>                     <p>                       If you have any questions,                       please, contact                     </p>                     <p class=\"splashAddress\">                       the City of Guelph, Parking and Downtown Operations at:                       <br>1 Carden Street                       <br>Guelph, Ontario, N1H 3A1                       <br>519-822-1260 x2888                       <br>or send a message to                       <a href=\"mailto:parking@guelph.ca\">                         parking@guelph.ca                         <br>                       </a>                     </p>                      <p>                       <a href=\"http://www.coinamatic.com/parksmart/legal.html\">                         ParkSmart Legal Terms / Privacy                         Policy                       </a>                     </p>                      <p>                       <a href=\"http://laws.justice.gc.ca/en/P-8.6/\">                         Personal                         Information Protection and                         Electronic Documents Act (PIPEDA)                       </a>                     </p>                      <p>                       <a href=\"http://www.mto.gov.on.ca/english/dandv/vehicle/\">                         Ministry of Transportation of                         Ontario (MTO)                       </a>                     </p>                      <p>                       Smart Process by ParkSmart (A                       Coinamatic Inc. Company).                       <br>©Copyright                       2004, All Rights Reserved.                     </p>', 'Term data need to add in DB for FR language', -1, '', 1, 1, 'ticket_oracle', 'ivruser', 'ivrpwd', 'GOTRN', 'PARKSMART', 0, 0, 'Sorry, this system is currently unavailable. Please, try again later.', 'This ticket can not be paid online. For more information, please contact GO Transit at 416-869-3600.', 'Ticket not processed.<br>\r\nThis ticket has just been updated.  Please review before preceeding with payment.', 'The ticket could not be paid.<br>\r\nSomeone is currently attempting to pay this ticket in another browser window.', 'Sorry, this credit card has been declined. Please, make sure that credit card number is correct.\r\n', 'Sorry, your payment can not be processed at this time. Please, try again later.', 'The ticket number you have entered was not found in the system. Please, make sure that the ticket number is correct. If your ticket was issued within the last couple of days, it may not be in the system yet. \r\n\r\n', 'This ticket is currently Closed.', 'This ticket is currently Closed.', '21100097', 'Park4985', '4985Park', 'ParkSmart - Secure Parking Ticket Payment System', 'ParkSmart - Système sécurisé de paiement des contraventions', '1,2,,', 1, 'splash1', 0, '', '', '', '', '', '', '', '', 'No unpaid tickets were found.', 'The ticket number you have entered was not found in the system. Please, make sure that the ticket number is correct.<br> \r\n', 'Désolé, ce système n\\\'est pas disponible pour l\\\'instant. Réessayez plus tard.\r\n', 'Cette contravention ne peut être payée en ligne. Pour tout renseignement, communiquez avec GO Transit au 416-869-3600.', 'Contravention non traitée. <br> Contravention mise ?our récemment. Veuillez l\\\'examiner avant de faire votre paiement.\r\n', 'La contravention ne pouvait être payée. <br> Quelqu\\\'un tente de payer cette contravention dans une autre fenêtre du navigateur.\r\n', 'Désolé, cette carte de crédit a été refusée. Assurez-vous que le numéro de la carte est exact.\r\n\r\n', 'Désolé, nous ne pouvons traiter votre paiement pour l\\\'instant. Réessayez plus tard.\r\n', 'Le numéro de contravention que vous avez entré n\\\'est pas dans le système. Vérifiez s\\\'il est exact. Il se peut que votre contravention ne soit pas encore dans le système si elle a été émise récemment.\r\n', 'Le dossier de cette contravention est présentement fermé.\r\n', 'Le dossier de cette contravention est présentement fermé.\r\n', 'Il n\\\'y a aucune contravention impayée.\r\n', 'Le numéro de contravention que vous avez entré n\\\'est pas dans le système. Vérifiez s\\\'il est exact. <br> Il se peut que votre contravention ne soit pas encore dans le système si elle a été émise récemment. Si le numéro est exact, vous pouvez poursuivre le paiement, mais d\\\'autres renseignements seront nécessaires.', '0000-00-00 00:00:00'),
(7, 1610, 610, 'PS_Header.jpg', '2019-05-18 21:41:17', '0000-00-00 00:00:00', 1, 1, 'Parking Ticket', 2, 1, '<p>                       Thank you for using the City of Guelph\'s online                       parking ticket payment service.                     </p>                     <p>To pay your parking ticket online, you will need a Visa or MasterCard.</p>                     <p class=\"splashemphasis\">                       A convenience fee                       of $2.50 is                       applied to every transaction.                     </p>                     <p id=\"plng\">                       Please note that if your ticket                       has been filed with the Ministry of                       Transportation (MTO)                        <br>                       for collection, it is                       no longer payable using this                       service. You can pay your parking                       <br>                       ticket and applicable administration                       fee at the MTO office where they                       accept payments for license plate                       renewal.                     </p>                     <p>                       If you have any questions,                       please, contact                     </p>                     <p class=\"splashAddress\">                       the City of Guelph, Parking and Downtown Operations at:                       <br>1 Carden Street                       <br>Guelph, Ontario, N1H 3A1                       <br>519-822-1260 x2888                       <br>or send a message to                       <a href=\"mailto:parking@guelph.ca\">                         parking@guelph.ca                         <br>                       </a>                     </p>                      <p>                       <a href=\"http://www.coinamatic.com/parksmart/legal.html\">                         ParkSmart Legal Terms / Privacy                         Policy                       </a>                     </p>                      <p>                       <a href=\"http://laws.justice.gc.ca/en/P-8.6/\">                         Personal                         Information Protection and                         Electronic Documents Act (PIPEDA)                       </a>                     </p>                      <p>                       <a href=\"http://www.mto.gov.on.ca/english/dandv/vehicle/\">                         Ministry of Transportation of                         Ontario (MTO)                       </a>                     </p>                      <p>                       Smart Process by ParkSmart (A                       Coinamatic Inc. Company).                       <br>©Copyright                       2004, All Rights Reserved.                     </p>', 'Term data need to add in DB for FR language', -1, '', 1, 1, 'cornwall', 'ivruser', 'ivrpwd', 'CRNCI', 'PARKSMART', 0, 0, 'Sorry, this system is currently unavailable. Please, try again later.', 'This ticket is filed with the Ministry of Transportation of Ontario and can not be paid online. For more information, please contact City of Cornwall (613) 930-2787 ext.2225.', 'Ticket not processed.<br>\r\nThis ticket has just been updated.  Please review before preceeding with payment.', 'The ticket could not be paid.<br>\r\nSomeone is currently attempting to pay this ticket in another browser window.', 'Sorry, this credit card has been declined. Please, make sure that credit card number is correct.', 'Sorry, your payment can not be processed at this time. Please, try again later.', 'The ticket number you have entered was not found in the system. Please, make sure that the ticket number is correct. If your ticket was issued within the last couple of days, it may not be in the system yet. ', 'This ticket is currently Closed.', 'This ticket is currently Closed.', '21101441', 'City6361', '6361City', 'City of Cornwall - Secure Parking Ticket Payment System', 'Ville de Cornwall - Système sécurisé de paiement des contraventions', '1,2,,', 1, 'splash1', 0, '', '', '', '', '', '', '', '', 'No unpaid tickets were found.', 'The ticket number you have entered was not found in the system. Please, make sure that the ticket number is correct.<br> ', 'Désolé, ce système n\\\'est pas disponible pour l\\\'instant. Réessayez plus tard.', 'Cette contravention a été transmise au ministère des Transports de l\\\'Ontario et ne peut être payée en ligne. Pour tout renseignement, communiquez avec la ville de Cornwall au 613.930.2787, poste 2225.', 'Contravention non traitée. <br> Contravention mise ?our récemment. Veuillez l\\\'examiner avant de faire votre paiement.', 'La contravention ne pouvait être payée. <br> Quelqu\\\'un tente de payer cette contravention dans une autre fenêtre du navigateur.', 'Désolé, cette carte de crédit a été refusée. Assurez-vous que le numéro de la carte est exact.', 'Désolé, nous ne pouvons traiter votre paiement pour l\\\'instant. Réessayez plus tard.', 'Le numéro de contravention que vous avez entré n\\\'est pas dans le système. Vérifiez s\\\'il est exact. Il se peut que votre contravention ne soit pas encore dans le système si elle a été émise récemment.', 'Le dossier de cette contravention est présentement fermé.', 'Le dossier de cette contravention est présentement fermé.', 'Il n\\\'y a aucune contravention impayée.', 'Le numéro de contravention que vous avez entré n\\\'est pas dans le système. Vérifiez s\\\'il est exact. <br> Il se peut que votre contravention ne soit pas encore dans le système si elle a été émise récemment. Si le numéro est exact, vous pouvez poursuivre le paiement, mais d\\\'autres renseignements seront nécessaires.', '0000-00-00 00:00:00'),
(8, 1710, 710, 'PS_Header.jpg', '2019-05-18 21:41:19', '0000-00-00 00:00:00', 1, 1, 'Parking Ticket', 2.5, 1, '<p>                       Thank you for using the City of Guelph\'s online                       parking ticket payment service.                     </p>                     <p>To pay your parking ticket online, you will need a Visa or MasterCard.</p>                     <p class=\"splashemphasis\">                       A convenience fee                       of $2.50 is                       applied to every transaction.                     </p>                     <p id=\"plng\">                       Please note that if your ticket                       has been filed with the Ministry of                       Transportation (MTO)                        <br>                       for collection, it is                       no longer payable using this                       service. You can pay your parking                       <br>                       ticket and applicable administration                       fee at the MTO office where they                       accept payments for license plate                       renewal.                     </p>                     <p>                       If you have any questions,                       please, contact                     </p>                     <p class=\"splashAddress\">                       the City of Guelph, Parking and Downtown Operations at:                       <br>1 Carden Street                       <br>Guelph, Ontario, N1H 3A1                       <br>519-822-1260 x2888                       <br>or send a message to                       <a href=\"mailto:parking@guelph.ca\">                         parking@guelph.ca                         <br>                       </a>                     </p>                      <p>                       <a href=\"http://www.coinamatic.com/parksmart/legal.html\">                         ParkSmart Legal Terms / Privacy                         Policy                       </a>                     </p>                      <p>                       <a href=\"http://laws.justice.gc.ca/en/P-8.6/\">                         Personal                         Information Protection and                         Electronic Documents Act (PIPEDA)                       </a>                     </p>                      <p>                       <a href=\"http://www.mto.gov.on.ca/english/dandv/vehicle/\">                         Ministry of Transportation of                         Ontario (MTO)                       </a>                     </p>                      <p>                       Smart Process by ParkSmart (A                       Coinamatic Inc. Company).                       <br>©Copyright                       2004, All Rights Reserved.                     </p>', 'Term data need to add in DB for FR language', -1, '', 1, 1, 'ticket_oracle', 'ivruser', 'ivrpwd', 'WLGTN', 'PARKSMART', 0, 0, 'Sorry, this system is currently unavailable. Please, try again later.', 'This ticket is filed with the Ministry of Transportation of Ontario and can not be paid online. For more information, please contact ...', 'Ticket not processed.<br>\r\nThis ticket has just been updated.  Please review before preceeding with payment.', 'The ticket could not be paid.<br>\r\nSomeone is currently attempting to pay this ticket in another browser window.', 'Sorry, this credit card has been declined. Please, make sure that credit card number is correct.', 'Sorry, your payment can not be processed at this time. Please, try again later.', 'The ticket number you have entered was not found in the system. Please, make sure that the ticket number is correct. If your ticket was issued within the last couple of days, it may not be in the system yet. ', 'This ticket is currently Closed.', 'This ticket is currently Closed.', '', 'Coun7403', '7403Coun', 'The County of Wellington - Secure Parking Ticket Payment System', 'The County of Wellington - Système sécurisé de paiement des contraventions', '1,2,,', 1, 'splash1', 0, '', '', '', '', '', '', '', '', 'No unpaid tickets were found.', 'The ticket number you have entered was not found in the system. Please, make sure that the ticket number is correct.<br> \r\nIf your ticket was issued within the last couple of days, it may not be in the system yet. If this ticket number is correct, you may continue with this payment, however additional information will be required.', 'Désolé, ce système n\\\'est pas disponible pour l\\\'instant. Réessayez plus tard.', 'Cette contravention a été transmise au ministère des Transports de l\\\'Ontario et ne peut être payée en ligne. Pour tout renseignement, communiquez avec...', 'Contravention non traitée. <br> Contravention mise ?our récemment. Veuillez l\\\'examiner avant de faire votre paiement.', 'La contravention ne pouvait être payée. <br> Quelqu\\\'un tente de payer cette contravention dans une autre fenêtre du navigateur.', 'Désolé, cette carte de crédit a été refusée. Assurez-vous que le numéro de la carte est exact.', 'Désolé, nous ne pouvons traiter votre paiement pour l\\\'instant. Réessayez plus tard.', 'Le numéro de contravention que vous avez entré n\\\'est pas dans le système. Vérifiez s\\\'il est exact. Il se peut que votre contravention ne soit pas encore dans le système si elle a été émise récemment.', 'Le dossier de cette contravention est présentement fermé.', 'Le dossier de cette contravention est présentement fermé.', 'Il n\\\'y a aucune contravention impayée.', 'Le numéro de contravention que vous avez entré n\\\'est pas dans le système. Vérifiez s\\\'il est exact. <br> Il se peut que votre contravention ne soit pas encore dans le système si elle a été émise récemment. Si le numéro est exact, poursuivre le processus de paiement. ', '0000-00-00 00:00:00');
INSERT INTO `products` (`id`, `ProductID`, `ClientID`, `header_img`, `dtCreation`, `dtModification`, `intProductType`, `blnOnOff`, `strAbbrev`, `fltProcessingFee`, `intModality`, `term_en`, `term_fr`, `intInlineReturn`, `strInlineReturn`, `intDirectBatch`, `intProcessing`, `strDBName`, `strDBUsername`, `strDBPassword`, `strParksmartAgency`, `strVendorID`, `blnSearch2`, `blnUnknownTicket`, `txtErrorMsg1`, `txtErrorMsg2`, `txtErrorMsg3`, `txtErrorMsg4`, `txtErrorMsg5`, `txtErrorMsg6`, `txtErrorMsg7`, `txtErrorMsg8`, `txtErrorMsg9`, `strTerminalIDProduction`, `strGlobalPayUser`, `strGlobalPayPass`, `txtDefaultTitle_en`, `txtDefaultTitle_fr`, `strCardTypes`, `intSplash`, `strSplashDir`, `intProvince`, `strToEmailName1`, `strToEmail1`, `strToEmailName2`, `strToEmail2`, `strToEmailName3`, `strToEmail3`, `intBatchTime`, `strInlineReturn_fr`, `txtErrorMsg10`, `txtErrorMsg11`, `txtErrorMsg1_fr`, `txtErrorMsg2_fr`, `txtErrorMsg3_fr`, `txtErrorMsg4_fr`, `txtErrorMsg5_fr`, `txtErrorMsg6_fr`, `txtErrorMsg7_fr`, `txtErrorMsg8_fr`, `txtErrorMsg9_fr`, `txtErrorMsg10_fr`, `txtErrorMsg11_fr`, `deleted_at`) VALUES
(9, 1810, 810, 'PS_Header.jpg', '2019-05-18 21:41:21', '0000-00-00 00:00:00', 1, 1, 'Parking Ticket', 2.5, 1, '<p>                       Thank you for using the City of Guelph\'s online                       parking ticket payment service.                     </p>                     <p>To pay your parking ticket online, you will need a Visa or MasterCard.</p>                     <p class=\"splashemphasis\">                       A convenience fee                       of $2.50 is                       applied to every transaction.                     </p>                     <p id=\"plng\">                       Please note that if your ticket                       has been filed with the Ministry of                       Transportation (MTO)                        <br>                       for collection, it is                       no longer payable using this                       service. You can pay your parking                       <br>                       ticket and applicable administration                       fee at the MTO office where they                       accept payments for license plate                       renewal.                     </p>                     <p>                       If you have any questions,                       please, contact                     </p>                     <p class=\"splashAddress\">                       the City of Guelph, Parking and Downtown Operations at:                       <br>1 Carden Street                       <br>Guelph, Ontario, N1H 3A1                       <br>519-822-1260 x2888                       <br>or send a message to                       <a href=\"mailto:parking@guelph.ca\">                         parking@guelph.ca                         <br>                       </a>                     </p>                      <p>                       <a href=\"http://www.coinamatic.com/parksmart/legal.html\">                         ParkSmart Legal Terms / Privacy                         Policy                       </a>                     </p>                      <p>                       <a href=\"http://laws.justice.gc.ca/en/P-8.6/\">                         Personal                         Information Protection and                         Electronic Documents Act (PIPEDA)                       </a>                     </p>                      <p>                       <a href=\"http://www.mto.gov.on.ca/english/dandv/vehicle/\">                         Ministry of Transportation of                         Ontario (MTO)                       </a>                     </p>                      <p>                       Smart Process by ParkSmart (A                       Coinamatic Inc. Company).                       <br>©Copyright                       2004, All Rights Reserved.                     </p>', 'Term data need to add in DB for FR language', -1, '', 2, 1, '', '', '', '', 'PARKSMART', 0, 0, 'Sorry, this system is currently unavailable. Please, try again later.', 'This ticket is filed with the Ministry of Transportation of Ontario and can not be paid online. For more information, please contact ...', 'Ticket not processed.<br>\r\nThis ticket has just been updated.  Please review before preceeding with payment.\r\n', 'The ticket could not be paid.<br>\r\nSomeone is currently attempting to pay this ticket in another browser window.', 'Sorry, this credit card has been declined. Please, make sure that credit card number is correct.', 'Sorry, your payment can not be processed at this time. Please, try again later.', 'The ticket number you have entered was not found in the system. Please, make sure that the ticket number is correct. If your ticket was issued within the last couple of days, it may not be in the system yet. ', 'This ticket is currently Closed.', 'This ticket is currently Closed.', '', '', '', 'Municipality of Clarington -- Secure Parking Ticket Payment System', 'Ville de Clarington - Système sécurisé de paiement des contraventions', '1,2,,', 1, 'splash1', 0, '', '', '', '', '', '', '0000', '', 'No unpaid tickets were found.', 'The ticket number you have entered was not found in the system. Please, make sure that the ticket number is correct.<br> \r\nIf your ticket was issued within the last couple of days, it may not be in the system yet. If this ticket number is correct, you may continue with this payment, however additional information will be required.', 'Désolé, ce système n\\\'est pas disponible pour l\\\'instant. Réessayez plus tard.', 'Cette contravention a été transmise au ministère des Transports de l\\\'Ontario et ne peut être payée en ligne. Pour tout renseignement, communiquez avec...', 'Contravention non traitée. <br> Contravention mise ?our récemment. Veuillez l\\\'examiner avant de faire votre paiement.', 'La contravention ne pouvait être payée. <br> Quelqu\\\'un tente de payer cette contravention dans une autre fenêtre du navigateur.', 'Désolé, cette carte de crédit a été refusée. Assurez-vous que le numéro de la carte est exact.', 'Désolé, nous ne pouvons traiter votre paiement pour l\\\'instant. Réessayez plus tard.', 'Le numéro de contravention que vous avez entré n\\\'est pas dans le système. Vérifiez s\\\'il est exact. Il se peut que votre contravention ne soit pas encore dans le système si elle a été émise récemment.', 'Le dossier de cette contravention est présentement fermé.', 'Le dossier de cette contravention est présentement fermé.', 'Il n\\\'y a aucune contravention impayée.', 'Le numéro de contravention que vous avez entré n\\\'est pas dans le système. Vérifiez s\\\'il est exact. <br> Il se peut que votre contravention ne soit pas encore dans le système si elle a été émise récemment. Si le numéro est exact, poursuivre le processus de paiement. ', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `producttypes`
--

CREATE TABLE `producttypes` (
  `productTypeID` int(11) NOT NULL,
  `dtCreation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dtModification` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `strName` varchar(255) NOT NULL DEFAULT '',
  `strAbbrev` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `producttypes`
--

INSERT INTO `producttypes` (`productTypeID`, `dtCreation`, `dtModification`, `strName`, `strAbbrev`) VALUES
(1, '2004-09-23 14:59:20', '0000-00-00 00:00:00', 'Parking Ticket', 'Parking Ticket');

-- --------------------------------------------------------

--
-- Table structure for table `provstates`
--

CREATE TABLE `provstates` (
  `ProvStateID` int(11) NOT NULL,
  `dtModification` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `strName` varchar(100) NOT NULL DEFAULT '',
  `strName_fr` varchar(100) NOT NULL DEFAULT '',
  `strAbrev` varchar(10) NOT NULL DEFAULT '',
  `strAbrev_alt` char(2) NOT NULL DEFAULT '',
  `intDispOrder` int(11) NOT NULL DEFAULT '0',
  `intCountry` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provstates`
--

INSERT INTO `provstates` (`ProvStateID`, `dtModification`, `strName`, `strName_fr`, `strAbrev`, `strAbrev_alt`, `intDispOrder`, `intCountry`) VALUES
(1, '0000-00-00 00:00:00', 'Ontario', 'Ontario', 'ON', '', 1, 1),
(2, '0000-00-00 00:00:00', 'Quebec', 'Qu&eacute;bec', 'QC', 'PQ', 2, 1),
(3, '0000-00-00 00:00:00', 'Alberta', 'Alberta', 'AB', '', 3, 1),
(4, '0000-00-00 00:00:00', 'British Columbia', 'Colombie-Britannique', 'BC', '', 4, 1),
(5, '0000-00-00 00:00:00', 'Manitoba', 'Manitoba', 'MB', '', 5, 1),
(6, '0000-00-00 00:00:00', 'New Brunswick', 'Nouveau-Brunswick', 'NB', '', 6, 1),
(7, '0000-00-00 00:00:00', 'Newfoundland and Labrador', 'Terre-Neuve-et-Labrador', 'NL', 'NF', 7, 1),
(8, '0000-00-00 00:00:00', 'Northwest Territories', 'Territoires du Nord-Ouest', 'NT', 'NW', 8, 1),
(9, '0000-00-00 00:00:00', 'Nova Scotia', 'Nouvelle-&Eacute;cosse', 'NS', '', 9, 1),
(10, '0000-00-00 00:00:00', 'Prince Edward Island', '&Icirc;le-du-Prince-&Eacute;douard', 'PE', '', 10, 1),
(11, '0000-00-00 00:00:00', 'Saskatchewan', 'Saskatchewan', 'SK', '', 11, 1),
(12, '0000-00-00 00:00:00', 'Yukon Territory', 'Territoire du Yukon', 'YT', '', 12, 1),
(13, '0000-00-00 00:00:00', 'Nunavut', 'Nunavut', 'NU', '', 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `racecheck`
--

CREATE TABLE `racecheck` (
  `timecheck` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `issueNum` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `racecheck`
--

INSERT INTO `racecheck` (`timecheck`, `issueNum`) VALUES
('2004-12-14 09:33:03', '10012424'),
('2004-11-29 09:42:55', '10014095'),
('2004-11-29 13:56:07', '60759'),
('2005-05-18 16:20:23', '10027518'),
('2004-12-02 10:03:06', '10016203'),
('2005-05-25 10:16:18', '10029617'),
('2004-12-31 05:03:45', '10003852'),
('2004-12-28 06:53:25', '10012163'),
('2005-02-28 06:25:41', '10025368'),
('2005-01-14 07:34:35', '10009223'),
('2005-01-11 07:27:31', '10019325'),
('2005-01-17 08:23:10', '10020647'),
('2005-02-16 04:47:32', '10013735'),
('2005-04-27 12:34:44', '10034430'),
('2005-05-28 04:08:50', '10041204'),
('2005-07-07 11:24:29', '10032730'),
('2005-06-02 07:45:22', '70434'),
('2005-07-13 05:41:57', '10034875'),
('2007-04-27 03:10:50', '10202140'),
('2007-04-23 05:37:44', '10200745'),
('2007-04-23 05:45:16', '10200746'),
('2007-09-16 14:01:24', '10221332'),
('2007-04-23 06:21:14', 'M0048218'),
('2007-04-23 06:01:28', '10147017'),
('2007-04-23 06:07:22', '10146043'),
('2007-09-16 10:29:59', '10220621'),
('2007-04-23 18:28:47', 'M0051068'),
('2007-04-23 06:17:29', '00013966'),
('2007-09-16 06:19:10', '00018307'),
('2007-09-16 02:42:10', '10218426'),
('2007-04-23 08:10:55', '10147334'),
('2007-09-16 09:27:04', '10216379'),
('2007-04-23 16:03:01', '10203246'),
('2007-04-23 09:42:13', '10146940'),
('2007-04-23 08:33:39', '10148607'),
('2008-03-01 15:17:12', '10241429'),
('2007-04-24 03:36:58', '10146757'),
('2007-04-23 09:03:28', '00013312'),
('2007-04-23 09:06:35', '10201588'),
('2007-09-16 10:05:38', '10221432'),
('2009-09-02 07:21:54', '00036894'),
('2007-04-23 09:42:58', 'M0051612'),
('2007-04-23 10:06:15', '10145259'),
('2007-09-17 02:38:11', 'M0064353'),
('2007-04-23 12:37:43', '00012897'),
('2007-04-23 12:45:37', '10144250'),
('2007-04-23 15:12:37', '00014320'),
('2007-04-24 02:25:24', '10145831'),
('2007-04-23 14:36:29', 'M0053239'),
('2007-09-16 14:16:45', '10218750'),
('2007-09-16 10:04:42', '72700'),
('2007-04-23 15:00:45', '10136085'),
('2008-03-01 19:11:32', '4005802'),
('2007-04-23 17:34:06', 'M0051863'),
('2008-02-15 11:10:25', 'M0084157'),
('2007-04-23 16:38:54', 'M0047735'),
('2007-04-23 16:50:02', 'M0051976'),
('2008-03-02 04:57:55', '10234479'),
('2007-04-23 18:12:05', '10201543'),
('2007-09-16 13:13:04', '10216315'),
('2008-03-01 15:09:25', '10242141'),
('2007-04-24 02:58:53', '10201044'),
('2008-03-01 14:05:21', 'M0087398'),
('2007-04-24 03:12:01', 'M0047248'),
('2007-04-24 03:24:56', '10200094'),
('2008-03-02 02:38:36', 'M0083387'),
('2007-04-24 05:01:33', '10145960'),
('2007-09-17 03:14:18', 'M0062213'),
('2007-09-17 03:05:55', '10214026'),
('2007-09-17 02:44:51', '10219676'),
('2007-09-17 02:37:45', 'M0061507'),
('2009-02-16 04:10:44', 'M0126938'),
('2007-09-17 04:22:22', '00017248'),
('2007-09-17 05:44:49', 'M0065964'),
('2007-09-17 04:55:25', '10223344'),
('2007-09-17 05:30:58', '10217598'),
('2007-09-17 05:15:04', '10211930'),
('2009-09-01 09:42:12', '00038036'),
('2007-09-17 06:24:15', '10220424'),
('2007-09-17 05:37:58', 'M0069594'),
('2007-09-17 07:41:52', 'M0065999'),
('2007-09-17 06:17:50', '10212557'),
('2008-03-02 02:56:41', 'M0086035'),
('2007-09-17 07:12:59', 'M0063180'),
('2007-09-17 07:23:08', '10222423'),
('2007-12-02 17:24:23', 'M0076311'),
('2007-09-17 08:05:27', 'M0064512'),
('2008-03-02 05:25:24', '10241416'),
('2007-09-17 08:24:05', '10220892'),
('2008-03-02 04:57:31', '10238395'),
('2008-03-02 15:24:59', '00023682'),
('2007-10-04 09:19:37', 'M0071118'),
('2009-09-01 13:18:20', '9068305'),
('2008-03-02 05:47:47', 'M0079150'),
('2008-03-02 06:01:12', '00022909'),
('2009-09-01 13:06:17', '00037023'),
('2009-09-01 07:58:56', 'M0156583'),
('2008-03-02 07:04:19', '10243410'),
('2008-03-02 07:20:16', '10240321'),
('2008-03-02 08:16:38', 'M0087174'),
('2009-03-23 03:08:50', 'G57453'),
('2008-03-02 10:18:49', 'M0086519'),
('2008-03-02 09:16:26', '10239869'),
('2009-09-02 07:02:48', 'M0155468'),
('2008-03-02 10:31:31', 'M0081033'),
('2009-11-17 07:29:10', '10291240'),
('2009-09-05 12:10:27', '10267999'),
('2008-03-02 11:46:02', '10239947'),
('2008-03-02 11:47:38', '10241191'),
('2009-02-10 03:17:29', 'M0130470'),
('2008-03-02 11:59:15', '00023488'),
('2008-03-02 12:46:54', '10242841'),
('2008-03-23 14:51:42', 'M0089405'),
('2008-03-02 13:14:24', 'M0087353'),
('2008-03-02 14:01:40', 'G27632'),
('2009-09-01 08:58:43', '00037994'),
('2008-03-02 15:36:58', '10235442'),
('2008-03-02 16:10:16', '10238750'),
('2008-03-02 16:26:04', 'M0086084'),
('2008-04-16 17:58:16', 'M0093109'),
('2009-11-30 04:07:09', 'M0156740'),
('2009-11-17 07:00:56', '10297554'),
('2009-09-01 15:24:45', '00036335'),
('2009-09-01 15:57:51', '10288125'),
('2009-09-02 02:10:25', 'M0151234'),
('2009-09-02 02:25:15', 'M0155237'),
('2009-09-05 00:58:29', '00036996'),
('2009-09-02 03:10:59', 'G55850'),
('2009-10-13 06:19:04', '10291551'),
('2009-10-29 09:50:31', '10294538'),
('2009-10-13 08:28:31', 'M0159178'),
('2009-09-02 05:33:06', 'G72947'),
('2009-09-02 05:56:11', '10290892'),
('2009-09-02 06:10:15', 'M0153458'),
('2009-09-02 06:22:10', '00038274'),
('2009-12-16 05:27:06', 'M0164188'),
('2009-09-02 07:17:06', '10291010'),
('2009-09-02 08:21:30', '10288053'),
('2009-09-02 08:53:00', 'M0145871'),
('2009-09-02 09:19:11', '00038200'),
('2009-09-02 10:01:46', 'GO600965'),
('2009-09-02 10:02:43', '00034252'),
('2009-11-17 06:55:45', '10296816'),
('2009-10-22 09:37:54', 'M0159045'),
('2009-09-05 02:10:01', '00036792'),
('2009-09-04 23:59:40', '10290122'),
('2009-09-02 11:21:04', 'M0155776'),
('2009-09-02 11:40:40', 'M0157743'),
('2009-09-02 11:42:33', '00036689'),
('2009-09-04 20:35:03', 'G70097'),
('2009-10-26 10:12:58', 'GO675581'),
('2009-09-05 02:15:47', 'M0149914'),
('2009-09-05 06:16:00', 'M0156241'),
('2009-09-05 03:49:01', 'M0152156'),
('2009-09-05 04:06:45', '00037897'),
('2009-09-05 04:07:46', '9068182'),
('2009-09-05 05:01:20', '10291052'),
('2009-09-29 03:11:05', 'M0158565'),
('2009-09-29 02:56:22', '00039246'),
('2009-09-05 12:03:02', 'M0155062'),
('2009-10-29 09:17:25', 'M0159062'),
('2009-10-13 02:43:02', 'M0158905'),
('2009-09-05 10:23:52', '00037872'),
('2009-09-05 10:41:02', 'M0157613'),
('2009-09-29 03:46:50', 'M0155486'),
('2009-09-05 12:10:43', '10289266'),
('2009-09-05 12:21:10', '10288290'),
('2009-09-05 13:43:56', 'M0157801'),
('2009-09-05 14:57:31', 'GO676217'),
('2010-01-10 15:21:41', '9067415'),
('2010-01-14 04:24:22', 'M0170356');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `ticket_number` varchar(30) NOT NULL,
  `license_plate` varchar(30) NOT NULL,
  `province` int(11) NOT NULL,
  `ticket_issue_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ticket_issue_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ammount_due` float NOT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `client_id`, `ticket_number`, `license_plate`, `province`, `ticket_issue_date`, `ticket_issue_time`, `ammount_due`, `deleted_at`) VALUES
(1, 310, '11', '75842', 3, '2019-05-19 07:18:09', '2019-05-19 07:18:09', 10.5, '2019-05-19 20:31:44'),
(2, 310, 'T54264', '85842', 5, '2019-05-19 07:18:52', '2019-05-19 07:18:52', 5.5, '2019-05-19 20:31:44'),
(3, 310, 'T55554', '59632', 2, '2019-05-19 07:19:27', '2019-05-19 07:19:27', 9.5, '2019-05-19 20:31:44');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `TransactionID` bigint(20) NOT NULL,
  `ProductID` int(11) NOT NULL DEFAULT '0',
  `ORDER_ID` varchar(100) NOT NULL,
  `FollowTransID` bigint(20) NOT NULL DEFAULT '0',
  `dtCreation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dtModification` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `strTicketNum` varchar(20) DEFAULT NULL,
  `strProv` varchar(7) DEFAULT NULL,
  `strPlate` varchar(20) DEFAULT NULL,
  `fltProcessingFee` float DEFAULT NULL,
  `fltTicketAmount` float DEFAULT NULL,
  `dtDate` datetime DEFAULT '0000-00-00 00:00:00',
  `txtDesc` text NOT NULL,
  `intType` int(11) NOT NULL DEFAULT '0',
  `intProcessType` int(11) NOT NULL DEFAULT '1',
  `dtBatch` datetime DEFAULT '0000-00-00 00:00:00',
  `fltPayment` float DEFAULT NULL,
  `fltRefund` float DEFAULT NULL,
  `fltVoid` float DEFAULT NULL,
  `intStatus` int(11) NOT NULL DEFAULT '1',
  `dtProcess` datetime DEFAULT '0000-00-00 00:00:00',
  `strCCName` varchar(100) NOT NULL DEFAULT '',
  `intCCType` int(11) NOT NULL DEFAULT '0',
  `strCCNum` varchar(16) NOT NULL DEFAULT '',
  `strCCExpiryMonth` char(2) NOT NULL DEFAULT '',
  `strCCExpiryYear` char(2) NOT NULL DEFAULT '',
  `strTerminalID` varchar(8) DEFAULT NULL,
  `strRefNum` varchar(7) DEFAULT NULL,
  `strAmount` varchar(7) DEFAULT NULL,
  `strAmountProcessed` varchar(7) NOT NULL DEFAULT '',
  `strResponseCode` char(3) DEFAULT NULL,
  `strPrimaryDisplay` varchar(20) DEFAULT NULL,
  `strResultCode` varchar(4) DEFAULT NULL,
  `strAuthNum` varchar(6) DEFAULT NULL,
  `strProductType` text NOT NULL,
  `strVendorID` varchar(30) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`TransactionID`, `ProductID`, `ORDER_ID`, `FollowTransID`, `dtCreation`, `dtModification`, `strTicketNum`, `strProv`, `strPlate`, `fltProcessingFee`, `fltTicketAmount`, `dtDate`, `txtDesc`, `intType`, `intProcessType`, `dtBatch`, `fltPayment`, `fltRefund`, `fltVoid`, `intStatus`, `dtProcess`, `strCCName`, `intCCType`, `strCCNum`, `strCCExpiryMonth`, `strCCExpiryYear`, `strTerminalID`, `strRefNum`, `strAmount`, `strAmountProcessed`, `strResponseCode`, `strPrimaryDisplay`, `strResultCode`, `strAuthNum`, `strProductType`, `strVendorID`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1310, '', 0, '2019-05-26 16:22:18', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-26 22:22:18', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"Tk9UX0VYRUNVVEVE\",\"AMOUNT\":\"MTAwMQ==\",\"ACCOUNT\":\"aW50ZXJuZXQ=\",\"CVNRESULT\":\"TQ==\",\"MESSAGE\":\"WyB0ZXN0IHN5c3RlbSBdIEFVVEhPUklTRUQ=\",\"ORDER_ID\":\"T3JkZXJJZC0yMDE5MDUyNjIyMjE0Mg==\",\"RESULT\":\"MDA=\",\"PASREF\":\"MTU1ODg4NzczNjY1ODgzMjc=\",\"SHA1HASH\":\"YzkwMjRmMjZiYjIxZmFjY2M5YjczYWNiMjJjMWRiNWZhZmQwNTZiMg==\",\"TIMESTAMP\":\"MjAxOTA1MjYyMjIxNDI=\",\"MERCHANT_ID\":\"cGFya3NtYXJ0\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-26 22:22:18', NULL, NULL, NULL, 0, '2019-05-26 22:22:18', '', 0, '', '', '', NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '0', '', '2019-05-26 16:22:18', '2019-05-26 16:22:18', '2019-05-26 16:22:17'),
(2, 1310, '', 0, '2019-05-26 16:48:37', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-26 22:48:37', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"Tk9UX0VYRUNVVEVE\",\"AMOUNT\":\"MTAwMQ==\",\"ACCOUNT\":\"aW50ZXJuZXQ=\",\"CVNRESULT\":\"TQ==\",\"MESSAGE\":\"WyB0ZXN0IHN5c3RlbSBdIEFVVEhPUklTRUQ=\",\"ORDER_ID\":\"T3JkZXJJZC0yMDE5MDUyNjIyNDgwNg==\",\"RESULT\":\"MDA=\",\"PASREF\":\"MTU1ODg4OTMxNjUwMjExMjI=\",\"SHA1HASH\":\"YjAxMzgxZTEzYzJlNzQyZDBhODRiOTE4N2Q5NzY2NjQyODllZTNjZA==\",\"TIMESTAMP\":\"MjAxOTA1MjYyMjQ4MDY=\",\"MERCHANT_ID\":\"cGFya3NtYXJ0\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-26 22:48:37', NULL, NULL, NULL, 0, '2019-05-26 22:48:37', '', 0, '', '', '', NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '0', '', '2019-05-26 16:48:37', '2019-05-26 16:48:37', '2019-05-26 16:48:37'),
(3, 1310, '', 0, '2019-05-26 16:48:37', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-26 22:48:37', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"Tk9UX0VYRUNVVEVE\",\"AMOUNT\":\"MTAwMQ==\",\"ACCOUNT\":\"aW50ZXJuZXQ=\",\"CVNRESULT\":\"TQ==\",\"MESSAGE\":\"WyB0ZXN0IHN5c3RlbSBdIEFVVEhPUklTRUQ=\",\"ORDER_ID\":\"T3JkZXJJZC0yMDE5MDUyNjIyNDgwNg==\",\"RESULT\":\"MDA=\",\"PASREF\":\"MTU1ODg4OTMxNjUwMjExMjI=\",\"SHA1HASH\":\"YjAxMzgxZTEzYzJlNzQyZDBhODRiOTE4N2Q5NzY2NjQyODllZTNjZA==\",\"TIMESTAMP\":\"MjAxOTA1MjYyMjQ4MDY=\",\"MERCHANT_ID\":\"cGFya3NtYXJ0\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-26 22:48:37', NULL, NULL, NULL, 0, '2019-05-26 22:48:37', '', 0, '', '', '', NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '0', '', '2019-05-26 16:48:37', '2019-05-26 16:48:37', '2019-05-26 16:48:37'),
(4, 1310, '', 0, '2019-05-26 17:08:50', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-26 23:08:50', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"Tk9UX0VYRUNVVEVE\",\"AMOUNT\":\"MTAwMQ==\",\"ACCOUNT\":\"aW50ZXJuZXQ=\",\"CVNRESULT\":\"TQ==\",\"MESSAGE\":\"WyB0ZXN0IHN5c3RlbSBdIEFVVEhPUklTRUQ=\",\"ORDER_ID\":\"T3JkZXJJZC0yMDE5MDUyNjIzMDgxOQ==\",\"RESULT\":\"MDA=\",\"PASREF\":\"MTU1ODg5MDUyOTA2NTc3ODg=\",\"SHA1HASH\":\"MjZkNWQxMWEwMWFmNTc2NDY5MDcwNmU2NzcwY2U0MjJhM2NjMTUzNg==\",\"TIMESTAMP\":\"MjAxOTA1MjYyMzA4MTk=\",\"MERCHANT_ID\":\"cGFya3NtYXJ0\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-26 23:08:50', NULL, NULL, NULL, 0, '2019-05-26 23:08:50', '', 0, '', '', '', NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '0', '', '2019-05-26 17:08:50', '2019-05-26 17:08:50', '2019-05-26 17:08:49'),
(5, 1310, '', 0, '2019-05-26 17:08:50', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-26 23:08:50', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"Tk9UX0VYRUNVVEVE\",\"AMOUNT\":\"MTAwMQ==\",\"ACCOUNT\":\"aW50ZXJuZXQ=\",\"CVNRESULT\":\"TQ==\",\"MESSAGE\":\"WyB0ZXN0IHN5c3RlbSBdIEFVVEhPUklTRUQ=\",\"ORDER_ID\":\"T3JkZXJJZC0yMDE5MDUyNjIzMDgxOQ==\",\"RESULT\":\"MDA=\",\"PASREF\":\"MTU1ODg5MDUyOTA2NTc3ODg=\",\"SHA1HASH\":\"MjZkNWQxMWEwMWFmNTc2NDY5MDcwNmU2NzcwY2U0MjJhM2NjMTUzNg==\",\"TIMESTAMP\":\"MjAxOTA1MjYyMzA4MTk=\",\"MERCHANT_ID\":\"cGFya3NtYXJ0\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-26 23:08:50', NULL, NULL, NULL, 0, '2019-05-26 23:08:50', '', 0, '', '', '', NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '0', '', '2019-05-26 17:08:50', '2019-05-26 17:08:50', '2019-05-26 17:08:49'),
(6, 1310, '', 0, '2019-05-26 17:10:52', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-26 23:10:52', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"Tk9UX0VYRUNVVEVE\",\"AMOUNT\":\"MTAwMQ==\",\"ACCOUNT\":\"aW50ZXJuZXQ=\",\"CVNRESULT\":\"TQ==\",\"MESSAGE\":\"WyB0ZXN0IHN5c3RlbSBdIEFVVEhPUklTRUQ=\",\"ORDER_ID\":\"T3JkZXJJZC0yMDE5MDUyNjIzMTAyNg==\",\"RESULT\":\"MDA=\",\"PASREF\":\"MTU1ODg5MDY1MTI1NTc1NDE=\",\"SHA1HASH\":\"MzdhZjZjNTIwMjZlYTA5MGQwNTVmNjE1ZWE4NzAzYjI3YmQ2YWJmNg==\",\"TIMESTAMP\":\"MjAxOTA1MjYyMzEwMjY=\",\"MERCHANT_ID\":\"cGFya3NtYXJ0\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-26 23:10:52', NULL, NULL, NULL, 0, '2019-05-26 23:10:52', '', 0, '', '', '', NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '0', '', '2019-05-26 17:10:52', '2019-05-26 17:10:52', '2019-05-26 17:10:52'),
(7, 1310, '', 0, '2019-05-26 17:10:52', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-26 23:10:52', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"Tk9UX0VYRUNVVEVE\",\"AMOUNT\":\"MTAwMQ==\",\"ACCOUNT\":\"aW50ZXJuZXQ=\",\"CVNRESULT\":\"TQ==\",\"MESSAGE\":\"WyB0ZXN0IHN5c3RlbSBdIEFVVEhPUklTRUQ=\",\"ORDER_ID\":\"T3JkZXJJZC0yMDE5MDUyNjIzMTAyNg==\",\"RESULT\":\"MDA=\",\"PASREF\":\"MTU1ODg5MDY1MTI1NTc1NDE=\",\"SHA1HASH\":\"MzdhZjZjNTIwMjZlYTA5MGQwNTVmNjE1ZWE4NzAzYjI3YmQ2YWJmNg==\",\"TIMESTAMP\":\"MjAxOTA1MjYyMzEwMjY=\",\"MERCHANT_ID\":\"cGFya3NtYXJ0\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-26 23:10:52', NULL, NULL, NULL, 0, '2019-05-26 23:10:52', '', 0, '', '', '', NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '0', '', '2019-05-26 17:10:52', '2019-05-26 17:10:52', '2019-05-26 17:10:52'),
(8, 1310, '', 0, '2019-05-26 17:10:52', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-26 23:10:52', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"Tk9UX0VYRUNVVEVE\",\"AMOUNT\":\"MTAwMQ==\",\"ACCOUNT\":\"aW50ZXJuZXQ=\",\"CVNRESULT\":\"TQ==\",\"MESSAGE\":\"WyB0ZXN0IHN5c3RlbSBdIEFVVEhPUklTRUQ=\",\"ORDER_ID\":\"T3JkZXJJZC0yMDE5MDUyNjIzMTAyNg==\",\"RESULT\":\"MDA=\",\"PASREF\":\"MTU1ODg5MDY1MTI1NTc1NDE=\",\"SHA1HASH\":\"MzdhZjZjNTIwMjZlYTA5MGQwNTVmNjE1ZWE4NzAzYjI3YmQ2YWJmNg==\",\"TIMESTAMP\":\"MjAxOTA1MjYyMzEwMjY=\",\"MERCHANT_ID\":\"cGFya3NtYXJ0\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-26 23:10:52', NULL, NULL, NULL, 0, '2019-05-26 23:10:52', '', 0, '', '', '', NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '0', '', '2019-05-26 17:10:52', '2019-05-26 17:10:52', '2019-05-26 17:10:52'),
(9, 1310, '', 0, '2019-05-26 18:46:46', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-27 00:46:46', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"NOT_EXECUTED\",\"AMOUNT\":1001,\"ACCOUNT\":\"internet\",\"CVNRESULT\":\"M\",\"MESSAGE\":\"[ test system ] AUTHORISED\",\"RESULT\":\"00\",\"PASREF\":\"15588962020258309\",\"SHA1HASH\":\"e3f469d6c6b9a2f410b23fa0a22ee3df96de96a7\",\"TIMESTAMP\":\"20190527004308\",\"MERCHANT_ID\":\"parksmart\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-27 00:46:46', NULL, NULL, NULL, 0, '2019-05-27 00:46:46', '', 0, '', '', '', NULL, NULL, NULL, '1001', NULL, NULL, '0', NULL, '0', '', '2019-05-26 18:46:46', '2019-05-26 18:46:46', '2019-05-26 18:46:45'),
(10, 1310, '', 0, '2019-05-26 18:47:13', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-27 00:47:13', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"NOT_EXECUTED\",\"AMOUNT\":1001,\"ACCOUNT\":\"internet\",\"CVNRESULT\":\"M\",\"MESSAGE\":\"[ test system ] AUTHORISED\",\"RESULT\":\"00\",\"PASREF\":\"15588962020258309\",\"SHA1HASH\":\"e3f469d6c6b9a2f410b23fa0a22ee3df96de96a7\",\"TIMESTAMP\":\"20190527004308\",\"MERCHANT_ID\":\"parksmart\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-27 00:47:13', NULL, NULL, NULL, 0, '2019-05-27 00:47:13', '', 0, '', '', '', NULL, NULL, NULL, '1001', NULL, NULL, '0', NULL, '0', '', '2019-05-26 18:47:13', '2019-05-26 18:47:13', '2019-05-26 18:47:13'),
(11, 1310, '', 0, '2019-05-26 18:55:12', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-27 00:55:12', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"NOT_EXECUTED\",\"AMOUNT\":1001,\"ACCOUNT\":\"internet\",\"CVNRESULT\":\"M\",\"MESSAGE\":\"[ test system ] AUTHORISED\",\"RESULT\":\"00\",\"PASREF\":\"15588962020258309\",\"SHA1HASH\":\"e3f469d6c6b9a2f410b23fa0a22ee3df96de96a7\",\"TIMESTAMP\":\"20190527004308\",\"MERCHANT_ID\":\"parksmart\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-27 00:55:12', NULL, NULL, NULL, 0, '2019-05-27 00:55:12', '', 0, '', '', '', NULL, NULL, NULL, '1001', NULL, NULL, '0', NULL, '0', '', '2019-05-26 18:55:12', '2019-05-26 18:55:12', '2019-05-26 18:55:11'),
(12, 1310, '', 0, '2019-05-26 19:00:02', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-27 01:00:02', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"NOT_EXECUTED\",\"AMOUNT\":1001,\"ACCOUNT\":\"internet\",\"CVNRESULT\":\"M\",\"MESSAGE\":\"[ test system ] AUTHORISED\",\"RESULT\":\"00\",\"PASREF\":\"15588972006055827\",\"SHA1HASH\":\"ae15563b0e2b90fe2e1f124423fd5e93c4a0f65e\",\"TIMESTAMP\":\"20190527005359\",\"MERCHANT_ID\":\"parksmart\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-27 01:00:02', NULL, NULL, NULL, 0, '2019-05-27 01:00:02', '', 0, '', '', '', NULL, NULL, NULL, '1001', NULL, NULL, '0', NULL, '0', '', '2019-05-26 19:00:02', '2019-05-26 19:00:02', '2019-05-26 19:00:01'),
(13, 1310, '', 0, '2019-05-26 19:00:02', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-27 01:00:02', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"NOT_EXECUTED\",\"AMOUNT\":1001,\"ACCOUNT\":\"internet\",\"CVNRESULT\":\"M\",\"MESSAGE\":\"[ test system ] AUTHORISED\",\"RESULT\":\"00\",\"PASREF\":\"15588972006055827\",\"SHA1HASH\":\"ae15563b0e2b90fe2e1f124423fd5e93c4a0f65e\",\"TIMESTAMP\":\"20190527005359\",\"MERCHANT_ID\":\"parksmart\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-27 01:00:02', NULL, NULL, NULL, 0, '2019-05-27 01:00:02', '', 0, '', '', '', NULL, NULL, NULL, '1001', NULL, NULL, '0', NULL, '0', '', '2019-05-26 19:00:02', '2019-05-26 19:00:02', '2019-05-26 19:00:01'),
(14, 1310, '', 0, '2019-05-26 19:00:02', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-27 01:00:02', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"NOT_EXECUTED\",\"AMOUNT\":1001,\"ACCOUNT\":\"internet\",\"CVNRESULT\":\"M\",\"MESSAGE\":\"[ test system ] AUTHORISED\",\"RESULT\":\"00\",\"PASREF\":\"15588972006055827\",\"SHA1HASH\":\"ae15563b0e2b90fe2e1f124423fd5e93c4a0f65e\",\"TIMESTAMP\":\"20190527005359\",\"MERCHANT_ID\":\"parksmart\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-27 01:00:02', NULL, NULL, NULL, 0, '2019-05-27 01:00:02', '', 0, '', '', '', NULL, NULL, NULL, '1001', NULL, NULL, '0', NULL, '0', '', '2019-05-26 19:00:02', '2019-05-26 19:00:02', '2019-05-26 19:00:01'),
(15, 1310, '', 0, '2019-05-26 19:00:02', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-27 01:00:02', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"NOT_EXECUTED\",\"AMOUNT\":1001,\"ACCOUNT\":\"internet\",\"CVNRESULT\":\"M\",\"MESSAGE\":\"[ test system ] AUTHORISED\",\"RESULT\":\"00\",\"PASREF\":\"15588972006055827\",\"SHA1HASH\":\"ae15563b0e2b90fe2e1f124423fd5e93c4a0f65e\",\"TIMESTAMP\":\"20190527005359\",\"MERCHANT_ID\":\"parksmart\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-27 01:00:02', NULL, NULL, NULL, 0, '2019-05-27 01:00:02', '', 0, '', '', '', NULL, NULL, NULL, '1001', NULL, NULL, '0', NULL, '0', '', '2019-05-26 19:00:02', '2019-05-26 19:00:02', '2019-05-26 19:00:01'),
(16, 1310, '', 0, '2019-05-26 19:00:02', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-27 01:00:02', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"NOT_EXECUTED\",\"AMOUNT\":1001,\"ACCOUNT\":\"internet\",\"CVNRESULT\":\"M\",\"MESSAGE\":\"[ test system ] AUTHORISED\",\"RESULT\":\"00\",\"PASREF\":\"15588972006055827\",\"SHA1HASH\":\"ae15563b0e2b90fe2e1f124423fd5e93c4a0f65e\",\"TIMESTAMP\":\"20190527005359\",\"MERCHANT_ID\":\"parksmart\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-27 01:00:02', NULL, NULL, NULL, 0, '2019-05-27 01:00:02', '', 0, '', '', '', NULL, NULL, NULL, '1001', NULL, NULL, '0', NULL, '0', '', '2019-05-26 19:00:02', '2019-05-26 19:00:02', '2019-05-26 19:00:01'),
(17, 1310, '', 0, '2019-05-27 01:36:17', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-27 07:36:17', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"NOT_EXECUTED\",\"AMOUNT\":1001,\"ACCOUNT\":\"internet\",\"CVNRESULT\":\"M\",\"MESSAGE\":\"[ test system ] AUTHORISED\",\"RESULT\":\"00\",\"PASREF\":\"1558920975775162\",\"SHA1HASH\":\"74463b8c80cf16674c1b3ac70dd8a93b2a3f1dee\",\"TIMESTAMP\":\"20190527073600\",\"MERCHANT_ID\":\"parksmart\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-27 07:36:17', NULL, NULL, NULL, 0, '2019-05-27 07:36:17', '', 0, '', '', '', NULL, NULL, NULL, '1001', NULL, NULL, '0', NULL, '0', '', '2019-05-27 01:36:17', '2019-05-27 01:36:17', '2019-05-27 01:36:16'),
(20, 1310, '', 0, '2019-05-27 01:36:17', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-27 07:36:17', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"NOT_EXECUTED\",\"AMOUNT\":1001,\"ACCOUNT\":\"internet\",\"CVNRESULT\":\"M\",\"MESSAGE\":\"[ test system ] AUTHORISED\",\"RESULT\":\"00\",\"PASREF\":\"1558920975775162\",\"SHA1HASH\":\"74463b8c80cf16674c1b3ac70dd8a93b2a3f1dee\",\"TIMESTAMP\":\"20190527073600\",\"MERCHANT_ID\":\"parksmart\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-27 07:36:17', NULL, NULL, NULL, 0, '2019-05-27 07:36:17', '', 0, '', '', '', NULL, NULL, NULL, '1001', NULL, NULL, '0', NULL, '0', '', '2019-05-27 01:36:17', '2019-05-27 01:36:17', '2019-05-27 01:36:16'),
(21, 1310, '', 0, '2019-05-27 01:36:17', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-27 07:36:17', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"NOT_EXECUTED\",\"AMOUNT\":1001,\"ACCOUNT\":\"internet\",\"CVNRESULT\":\"M\",\"MESSAGE\":\"[ test system ] AUTHORISED\",\"RESULT\":\"00\",\"PASREF\":\"1558920975775162\",\"SHA1HASH\":\"74463b8c80cf16674c1b3ac70dd8a93b2a3f1dee\",\"TIMESTAMP\":\"20190527073600\",\"MERCHANT_ID\":\"parksmart\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-27 07:36:17', NULL, NULL, NULL, 0, '2019-05-27 07:36:17', '', 0, '', '', '', NULL, NULL, NULL, '1001', NULL, NULL, '0', NULL, '0', '', '2019-05-27 01:36:17', '2019-05-27 01:36:17', '2019-05-27 01:36:16'),
(19, 1310, '', 0, '2019-05-27 01:36:17', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-27 07:36:17', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"NOT_EXECUTED\",\"AMOUNT\":1001,\"ACCOUNT\":\"internet\",\"CVNRESULT\":\"M\",\"MESSAGE\":\"[ test system ] AUTHORISED\",\"RESULT\":\"00\",\"PASREF\":\"1558920975775162\",\"SHA1HASH\":\"74463b8c80cf16674c1b3ac70dd8a93b2a3f1dee\",\"TIMESTAMP\":\"20190527073600\",\"MERCHANT_ID\":\"parksmart\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-27 07:36:17', NULL, NULL, NULL, 0, '2019-05-27 07:36:17', '', 0, '', '', '', NULL, NULL, NULL, '1001', NULL, NULL, '0', NULL, '0', '', '2019-05-27 01:36:17', '2019-05-27 01:36:17', '2019-05-27 01:36:16'),
(18, 1310, '', 0, '2019-05-27 01:36:17', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-27 07:36:17', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"NOT_EXECUTED\",\"AMOUNT\":1001,\"ACCOUNT\":\"internet\",\"CVNRESULT\":\"M\",\"MESSAGE\":\"[ test system ] AUTHORISED\",\"RESULT\":\"00\",\"PASREF\":\"1558920975775162\",\"SHA1HASH\":\"74463b8c80cf16674c1b3ac70dd8a93b2a3f1dee\",\"TIMESTAMP\":\"20190527073600\",\"MERCHANT_ID\":\"parksmart\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-27 07:36:17', NULL, NULL, NULL, 0, '2019-05-27 07:36:17', '', 0, '', '', '', NULL, NULL, NULL, '1001', NULL, NULL, '0', NULL, '0', '', '2019-05-27 01:36:17', '2019-05-27 01:36:17', '2019-05-27 01:36:16'),
(22, 1310, '', 0, '2019-05-27 01:36:17', '0000-00-00 00:00:00', 'T23264', '', '', 0, NULL, '2019-05-27 07:36:17', '{\"HPP_FRAUDFILTER_RULE_cf609cf9-9e5a-4700-ac69-8aa09c119305\":\"\",\"HPP_FRAUDFILTER_RULE_NAME\":\"\",\"HPP_FRAUDFILTER_RESULT\":\"NOT_EXECUTED\",\"AMOUNT\":1001,\"ACCOUNT\":\"internet\",\"CVNRESULT\":\"M\",\"MESSAGE\":\"[ test system ] AUTHORISED\",\"RESULT\":\"00\",\"PASREF\":\"1558920975775162\",\"SHA1HASH\":\"74463b8c80cf16674c1b3ac70dd8a93b2a3f1dee\",\"TIMESTAMP\":\"20190527073600\",\"MERCHANT_ID\":\"parksmart\",\"ProductID\":1310,\"dtCreation\":\"0001-01-01T00:00:00Z\",\"strTicketNum\":\"T23264\",\"strProv\":\"\",\"strPlate\":\"\",\"fltProcessingFee\":0,\"intStatus\":0,\"strAmountProcessed\":0,\"strResultCode\":0,\"strProductType\":0}', 0, 1, '2019-05-27 07:36:17', NULL, NULL, NULL, 0, '2019-05-27 07:36:17', '', 0, '', '', '', NULL, NULL, NULL, '1001', NULL, NULL, '0', NULL, '0', '', '2019-05-27 01:36:17', '2019-05-27 01:36:17', '2019-05-27 01:36:16');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `email` varchar(250) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `fax` varchar(250) DEFAULT NULL,
  `password` varchar(250) NOT NULL,
  `status` varchar(50) NOT NULL,
  `user_level` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `phone`, `dob`, `city`, `country`, `fax`, `password`, `status`, `user_level`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`) VALUES
(1, 'mahedi', 'df', 'm@gmail.com', '+812154', '2019-05-02', 'dhaka', 'ban', 'fax', 'pass123', '1', 1, '2019-06-25 10:57:08', 2, '2019-06-25 12:51:32', 0, NULL),
(2, 'mahedi', 'df', 'm@gmail.com', '+812154', '2019-05-02', 'dhaka', 'ban', 'fax', 'pass123', '1', 1, '2019-06-25 11:06:42', 2, '2019-06-25 12:55:38', 0, NULL),
(3, 'mahedi', 'df', 'm@gmail.com', '+812154', '2019-05-02', 'dhaka', 'ban', 'fax', 'pass123', '1', 1, '2019-06-25 11:56:15', 2, '2019-06-25 12:55:48', 0, NULL),
(4, 'name', 'df', 'm@gmail.com', '+812154', '2019-05-02', 'dhaka', 'ban', 'fax', 'pass', '1', 1, '2019-06-25 11:56:16', 1, '2019-06-25 11:56:16', 0, NULL),
(5, 'name', 'df', 'm@gmail.com', '+812154', '2019-05-02', 'dhaka', 'ban', 'fax', 'pass', '1', 1, '2019-06-25 11:56:18', 1, '2019-06-25 11:56:18', 0, NULL),
(6, 'name', 'df', 'm@gmail.com', '+812154', '2019-05-02', 'dhaka', 'ban', 'fax', 'pass', '1', 1, '2019-06-25 11:56:18', 1, '2019-06-25 11:56:18', 0, NULL),
(7, 'name', 'df', 'm@gmail.com', '+812154', '2019-05-02', 'dhaka', 'ban', 'fax', 'pass', '1', 1, '2019-06-25 11:56:19', 1, '2019-06-25 11:56:19', 0, NULL),
(8, 'name', 'df', 'm@gmail.com', '+812154', '2019-05-02', 'dhaka', 'ban', 'fax', 'pass', '1', 1, '2019-06-25 11:56:34', 1, '2019-06-25 11:56:34', 0, NULL),
(9, 'name', 'df', 'm@gmail.com', '+812154', '2019-05-02', 'dhaka', 'ban', 'fax', 'pass', '1', 1, '2019-06-25 11:56:36', 1, '2019-06-25 11:56:36', 0, NULL),
(10, 'name', 'df', 'm@gmail.com', '+812154', '2019-05-02', 'dhaka', 'ban', 'fax', 'pass', '1', 1, '2019-06-25 11:56:37', 1, '2019-06-25 11:56:37', 0, NULL),
(11, 'name', 'df', 'm@gmail.com', '+812154', '2019-05-02', 'dhaka', 'ban', 'fax', 'pass', '1', 1, '2019-06-25 11:56:38', 1, '2019-06-25 11:56:38', 0, NULL),
(12, 'name', 'df', 'm@gmail.com', '+812154', '2019-05-02', 'dhaka', 'ban', 'fax', 'pass', '1', 1, '2019-06-25 11:56:39', 1, '2019-06-25 11:56:39', 0, NULL),
(13, 'name', 'df', 'm@gmail.com', '+812154', '2019-05-02', 'dhaka', 'ban', 'fax', 'pass', '1', 1, '2019-06-25 11:56:40', 1, '2019-06-25 11:56:40', 0, NULL),
(14, 'name', 'df', 'm@gmail.com', '+812154', '2019-05-02', 'dhaka', 'ban', 'fax', 'pass', '1', 1, '2019-06-25 11:56:40', 1, '2019-06-25 11:56:40', 0, NULL),
(15, 'name', 'df', 'm@gmail.com', '+812154', '2019-05-02', 'dhaka', 'ban', 'fax', 'pass', '1', 1, '2019-06-25 11:56:41', 1, '2019-06-25 11:56:41', 0, NULL),
(16, 'name', 'df', 'm@gmail.com', '+812154', '2019-05-02', 'dhaka', 'ban', 'fax', 'pass', '1', 1, '2019-06-25 11:56:41', 1, '2019-06-25 11:56:41', 0, NULL),
(18, 'name', 'df', 'mm@gmail.com', '+812154', '2019-05-02', 'dhaka', 'ban', 'fax', 'pass', '1', 1, '2019-06-25 12:57:57', 1, '2019-06-25 12:57:57', 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD UNIQUE KEY `strLoginID` (`strLoginID`),
  ADD KEY `AdminID` (`AdminID`);

--
-- Indexes for table `cardtypes`
--
ALTER TABLE `cardtypes`
  ADD KEY `CardTypeID` (`CardTypeID`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD UNIQUE KEY `ClientID_2` (`ClientID`),
  ADD KEY `ClientID` (`ClientID`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD KEY `eventID` (`eventID`),
  ADD KEY `intType` (`intType`);

--
-- Indexes for table `eventtypes`
--
ALTER TABLE `eventtypes`
  ADD PRIMARY KEY (`eventTypeID`),
  ADD KEY `eventTypeID` (`eventTypeID`);

--
-- Indexes for table `global_settings`
--
ALTER TABLE `global_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merchantcards`
--
ALTER TABLE `merchantcards`
  ADD KEY `CardID` (`CardID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ProductID_2` (`ProductID`),
  ADD UNIQUE KEY `ProductID_3` (`ProductID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `ClientID` (`ClientID`);

--
-- Indexes for table `producttypes`
--
ALTER TABLE `producttypes`
  ADD KEY `eventTypeID` (`productTypeID`);

--
-- Indexes for table `provstates`
--
ALTER TABLE `provstates`
  ADD PRIMARY KEY (`ProvStateID`),
  ADD KEY `ProvStateID` (`ProvStateID`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `province` (`province`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD KEY `TransactionID` (`TransactionID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `cardtypes`
--
ALTER TABLE `cardtypes`
  MODIFY `CardTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `eventID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `eventtypes`
--
ALTER TABLE `eventtypes`
  MODIFY `eventTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `global_settings`
--
ALTER TABLE `global_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `merchantcards`
--
ALTER TABLE `merchantcards`
  MODIFY `CardID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `producttypes`
--
ALTER TABLE `producttypes`
  MODIFY `productTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `provstates`
--
ALTER TABLE `provstates`
  MODIFY `ProvStateID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `TransactionID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`intType`) REFERENCES `eventtypes` (`eventTypeID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`province`) REFERENCES `provstates` (`ProvStateID`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
