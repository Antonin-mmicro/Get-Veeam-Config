# Script de Gestion de Veeam Agent for Microsoft Windows
## Introduction
Ce script est conçu pour réunir les informations de configurations pour Veeam Agent for Microsoft Windows. Il vérifie la politique d'exécution de PowerShell, vérifie la présence de Veeam Agent, affiche la version de Veeam, vérifie si une solution de sauvegarde est active et propose des options pour afficher ou exporter la configuration.

## Prérequis
* PowerShell doit être installé sur le système.
* La politique d'exécution de PowerShell doit être définie sur "Unrestricted".
* Veeam Agent for Microsoft Windows doit être installé sur le système.

## Utilisation
1. Assurez-vous que la politique d'exécution de PowerShell est définie sur "Unrestricted". Si ce n'est pas le cas, vous pouvez voir comment avec `ActiverScriptPS1` disponible à Nextcloud\TECHNIQUE\Micro\Script.
2. Exécutez le script en double-cliquant dessus ou en l'exécutant via la ligne de commande (VeeamInfo.bat)
3. Suivez les instructions à l'écran pour afficher ou exporter la configuration de Veeam Agent.

## Fonctionnalités
* Vérification de la politique d'exécution de PowerShell
* Vérification de la présence de Veeam Agent for Microsoft Windows
* Affichage de la version de Veeam
* Vérification si une solution de sauvegarde est active
* Options pour afficher ou exporter la configuration

## Commandes
* `[1] Afficher la configuration` : Affiche la configuration de Veeam Agent.
* `[2] Exporter la configuration au format texte` : Exporte la configuration de Veeam Agent au format texte.

## Notes
* Ce script est destiné à être utilisé avec Veeam Agent for Microsoft Windows.
* Assurez-vous de lire attentivement les instructions à l'écran et de suivre les étapes pour éviter toute erreur.