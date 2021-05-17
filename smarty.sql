-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 17 mai 2021 à 10:02
-- Version du serveur :  5.7.24
-- Version de PHP : 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `smarty`
--

-- --------------------------------------------------------

--
-- Structure de la table `annonces`
--

CREATE TABLE `annonces` (
  `id` int(11) NOT NULL,
  `descr` varchar(100) NOT NULL,
  `date` int(11) NOT NULL,
  `section` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parentId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`, `description`, `img`, `parentId`) VALUES
(1, 'Pamplemousse', 'Des Pamplemousses de toutes les couleurs.', 'plm.jpg', NULL),
(2, 'Pomélo', 'Du Pomélo ? x)', 'pml.jpg', 1),
(3, 'CMS', 'Pour faire votre beau site en Pamplemousse.', 'cms.jpg', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `date`, `userId`) VALUES
(3, '2021-05-12 14:09:10', 1),
(4, '2021-05-12 15:17:50', 1),
(5, '2021-05-12 15:20:32', 1),
(6, '2021-05-17 10:33:42', 6);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` float NOT NULL,
  `stock` int(11) NOT NULL,
  `categorieId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `nom`, `description`, `img`, `prix`, `stock`, `categorieId`) VALUES
(1, 'Pamplemousse', 'Par défaut.', 'plm.jpg', 154, 0, 1),
(2, 'Pamplemousse Sépia', 'Un pamplemousse qui a poussé dans la lave et a été séché dans le désert Egyptien.', 'plms.jpg', 42, 24, 1),
(4, 'Pomélo', 'Par défaut.', 'pml.jpg', 0, 154, 2),
(5, 'Pomélo Sépia', 'Un pomélo qui a été poussé dans le désert Egyptien et séché dans la lave.', 'pmls.jpg', 24, 42, 2),
(7, 'Pamplemousse Coréen', 'Un pamplemousse qui est né sur les terres Nord-Coréennes avant de s\'exilé vers les terres de Séoul en Corée du Sud.', 'plmc.jpg', 1945, 1991, 1),
(8, 'Pomélo Coréen', 'Un pomélo qui est né sur les terres de Séoul en Corée du sud avant de s\'exilé sur les terres Nord-Coréennes.', 'pmlc.jpg', 1991, 1945, 2),
(9, 'Pamplemousse de Tchernobyl', 'Un pamplemousse qui fut poussé dans la centrale nucléaire de Tchernobyl.', 'plmt.jpg', 2604, 1986, 1),
(10, 'Pomélo de Tchernobyl', 'Un pomélo qui fut poussé dans la ville de Tchernobyl.', 'pmlt.jpg', 1986, 2604, 2),
(11, 'PamplemousseCMS', 'C\'est gratuit et disponible en téléchargement.. et ça c\'est beau.', 'cms.jpg', 0, 10000000, 3);

-- --------------------------------------------------------

--
-- Structure de la table `produitcommande`
--

CREATE TABLE `produitcommande` (
  `id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `commandeID` int(11) NOT NULL,
  `qte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produitcommande`
--

INSERT INTO `produitcommande` (`id`, `produit_id`, `commandeID`, `qte`) VALUES
(1, 1, 3, 1),
(2, 1, 4, 1),
(3, 5, 2, 1),
(4, 13, 1, 1),
(5, 15, 2, 2),
(6, 1, 5, 1),
(7, 1, 6, 1),
(8, 9, 6, 2);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mdp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `name`, `login`, `mdp`) VALUES
(6, 'Lucas', 'lucas@pamplemoussecms.com', '$2y$10$EdX9IiFrjpWTYWTuhvp6gOlkSTiyH3lTAS8.t9.xS6Wt85MeBFkaO');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `annonces`
--
ALTER TABLE `annonces`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorie_parentId` (`parentId`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produit_categorieId` (`categorieId`);

--
-- Index pour la table `produitcommande`
--
ALTER TABLE `produitcommande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commandeID` (`commandeID`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_login` (`login`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `annonces`
--
ALTER TABLE `annonces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `produitcommande`
--
ALTER TABLE `produitcommande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `categorie_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `categorie` (`id`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`categorieId`) REFERENCES `categorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
