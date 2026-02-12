# Gestion de Veeam Agent for Microsoft Windows

## 📝 Introduction
Ce projet contient un ensemble de scripts permettant de **collecter et gérer les informations de configuration** pour **Veeam Agent for Microsoft Windows**.  

Le système est composé de :

- `VeeamInfo.bat` : script batch principal, vérifie l’environnement et affiche un menu interactif.
- `configsearch.ps1` : script PowerShell pour **afficher la configuration de Veeam**.
- `configsearchtxt.ps1` : script PowerShell pour **exporter la configuration dans un fichier texte**.

Le but est de faciliter l’audit des configurations de Veeam Agent et de vérifier l’état des jobs de sauvegarde sur la machine.

---

## ⚙️ Prérequis
Avant d’exécuter les scripts, assurez-vous que :

1. **PowerShell** est installé sur le système.
2. La **politique d’exécution PowerShell** est définie sur `Unrestricted`.  
   > Si ce n’est pas le cas, utilisez la documentation `ActiverScriptPS1` disponible dans :  
   > `Nextcloud\TECHNIQUE\Mmicro\Script\ActiverScriptPS1.md`
3. **Veeam Agent for Microsoft Windows** est installé sur la machine.

---

## 🚀 Utilisation

### 1️⃣ Lancement
Exécutez le script batch principal :

```cmd
VeeamInfo.bat
```

Le script fait automatiquement :

- Vérification de la politique d’exécution PowerShell
- Vérification de la présence de Veeam Agent
- Affichage de la version de Veeam Agent
- Vérification si une solution de sauvegarde est active sur le poste

Si tout est correct, un **menu interactif** s’affiche.

---

### 2️⃣ Menu interactif
Le menu propose deux options :

```
[1] Afficher la configuration
[2] Exporter la configuration au format texte
```

- **Option 1 : Afficher la configuration**  
  Lance `configsearch.ps1`, qui lit le fichier de log du job de sauvegarde et affiche la configuration directement dans la console.

- **Option 2 : Exporter la configuration**  
  Lance `configsearchtxt.ps1`, qui lit le fichier de log du job et exporte la configuration dans un fichier texte nommé `<Nom_Ordinateur>.txt` dans le répertoire courant.

---

## 🔧 Fonctionnement des scripts PowerShell

### `configsearch.ps1`
- Lit le fichier de log du job de sauvegarde :  
  `C:\ProgramData\Veeam\Endpoint\Job_<Nom_Ordinateur>\Job.Job_<Nom_Ordinateur>.Backup.log`
- Récupère uniquement la section entre :  
  ```
  ================= Job Settings begin =================
  ================= Job Settings end =================
  ```
- Ajoute la **version de Veeam Agent** au début.
- Affiche le résultat dans la console.

### `configsearchtxt.ps1`
- Même fonctionnement que `configsearch.ps1`
- Au lieu d’afficher la configuration, **la sauvegarde dans un fichier texte** `<Nom_Ordinateur>.txt` pour archivage ou audit.

---

## 📂 Structure recommandée

```
.
├── VeeamInfo.bat         # Script batch principal
├── configsearch.ps1      # Affiche la configuration dans la console
├── configsearchtxt.ps1   # Export de la configuration dans un fichier texte
├── content\mainmenu.txt  # Contenu du menu affiché par VeeamInfo.bat
└── README.md             # Documentation

```

---

## ⚠️ Notes importantes
- Ces scripts **fonctionnent uniquement pour Veeam Agent for Microsoft Windows**.
- L’exécution nécessite des **droits administrateur**.
- Si aucune solution de sauvegarde n’est détectée, le script s’arrête automatiquement.
- L’export de configuration peut être utilisé pour **audit ou dépannage**.

---

## 🖥️ Compatibilité
- Windows 10
- Windows 11

---

## ✅ Résumé
- **VeeamInfo.bat** : vérifie l’environnement et lance un menu interactif.  
- **configsearch.ps1** : affiche la configuration d’un job de sauvegarde.  
- **configsearchtxt.ps1** : exporte la configuration dans un fichier texte.  
- **ActiverScriptPS1** : permet d’activer la politique d’exécution PowerShell si nécessaire.
