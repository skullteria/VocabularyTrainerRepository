-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 06. Mrz 2015 um 00:20
-- Server Version: 5.6.21
-- PHP-Version: 5.6.3

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `vocabularytrainer`
--
CREATE DATABASE IF NOT EXISTS `vocabularytrainer` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `vocabularytrainer`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `joinlisttag`
--

CREATE TABLE IF NOT EXISTS `joinlisttag` (
  `ListID` int(11) NOT NULL DEFAULT '0',
  `TagID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONEN DER TABELLE `joinlisttag`:
--   `ListID`
--       `list` -> `ID`
--   `TagID`
--       `tag` -> `ID`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `joinword`
--

CREATE TABLE IF NOT EXISTS `joinword` (
  `wordID_1` int(9) NOT NULL,
  `wordID_2` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONEN DER TABELLE `joinword`:
--   `wordID_1`
--       `word` -> `ID`
--   `wordID_2`
--       `word` -> `ID`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `list`
--

CREATE TABLE IF NOT EXISTS `list` (
`ID` int(9) NOT NULL,
  `title` int(11) NOT NULL,
  `description` int(11) NOT NULL,
  `isPublic` tinyint(1) NOT NULL,
  `authorID` int(9) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONEN DER TABELLE `list`:
--   `authorID`
--       `user` -> `ID`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `quearycycle`
--

CREATE TABLE IF NOT EXISTS `quearycycle` (
`ID` int(9) NOT NULL,
  `competitorID` int(9) NOT NULL,
  `listID` int(9) NOT NULL,
  `startingTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `endingTimestamp` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONEN DER TABELLE `quearycycle`:
--   `competitorID`
--       `user` -> `ID`
--   `listID`
--       `list` -> `ID`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
`ID` int(9) NOT NULL,
  `title` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`ID` int(9) NOT NULL,
  `username` varchar(32) COLLATE utf8_bin NOT NULL,
  `password` varchar(32) COLLATE utf8_bin NOT NULL,
  `email` varchar(64) COLLATE utf8_bin NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '1',
  `joiningDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `word`
--

CREATE TABLE IF NOT EXISTS `word` (
`ID` int(9) NOT NULL,
  `word` varchar(512) COLLATE utf8_bin NOT NULL,
  `listID` int(9) NOT NULL,
  `categoryID` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONEN DER TABELLE `word`:
--   `categoryID`
--       `wordcategory` -> `ID`
--   `listID`
--       `list` -> `ID`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wordcategory`
--

CREATE TABLE IF NOT EXISTS `wordcategory` (
`ID` int(9) NOT NULL,
  `authorID` int(9) NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONEN DER TABELLE `wordcategory`:
--   `authorID`
--       `user` -> `ID`
--

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `joinlisttag`
--
ALTER TABLE `joinlisttag`
 ADD PRIMARY KEY (`ListID`,`TagID`);

--
-- Indizes für die Tabelle `joinword`
--
ALTER TABLE `joinword`
 ADD PRIMARY KEY (`wordID_1`,`wordID_2`);

--
-- Indizes für die Tabelle `list`
--
ALTER TABLE `list`
 ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `quearycycle`
--
ALTER TABLE `quearycycle`
 ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `tag`
--
ALTER TABLE `tag`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `title` (`title`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `word`
--
ALTER TABLE `word`
 ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `wordcategory`
--
ALTER TABLE `wordcategory`
 ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `list`
--
ALTER TABLE `list`
MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `quearycycle`
--
ALTER TABLE `quearycycle`
MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `tag`
--
ALTER TABLE `tag`
MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `word`
--
ALTER TABLE `word`
MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `wordcategory`
--
ALTER TABLE `wordcategory`
MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT;

SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
