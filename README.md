# Homebrew Tap - Nozarno

[![Update DaVinci Versions](https://github.com/Nozarno/homebrew-tap/actions/workflows/update-davinci-versions.yml/badge.svg)](https://github.com/Nozarno/homebrew-tap/actions/workflows/update-davinci-versions.yml)
[![Test DaVinci Resolve (Free)](https://github.com/Nozarno/homebrew-tap/actions/workflows/davinci-free.yml/badge.svg)](https://github.com/Nozarno/homebrew-tap/actions/workflows/davinci-free.yml)
[![Test DaVinci Resolve Studio](https://github.com/Nozarno/homebrew-tap/actions/workflows/davinci-studio.yml/badge.svg)](https://github.com/Nozarno/homebrew-tap/actions/workflows/davinci-studio.yml)

Dépôt personnel de paquets Homebrew pour macOS, incluant des installateurs automatisés pour DaVinci Resolve.

## 🚀 1. Ajouter le Tap (À faire une seule fois)

Avant de pouvoir installer quoi que ce soit, vous devez ajouter ce dépôt à votre configuration Homebrew :

```bash
brew tap Nozarno/homebrew-tap
```

## 📥 2. Installation (Choisissez UNE SEULE version)

⚠️ **Important :** N'installez qu'une seule des deux versions sur votre système pour éviter les conflits.

### Option A : DaVinci Resolve (Version Gratuite)
```bash
brew install davinci-resolve
```

### Option B : DaVinci Resolve Studio (Version Payante)
*(Nécessite une clé d'activation ou un dongle fourni par Blackmagic Design pour fonctionner après l'installation)*
```bash
brew install davinci-resolve-studio
```

## 🔄 3. Mettre à jour (Quand une nouvelle version est disponible)

Ce dépôt vérifie les mises à jour tous les jours. Si une nouvelle version est disponible, Homebrew vous le signalera. Voici les commandes pour appliquer la mise à jour selon la version que vous possédez :

### Pour mettre à jour la version Gratuite :
```bash
brew update
brew upgrade davinci-resolve
```

### Pour mettre à jour la version Studio :
```bash
brew update
brew upgrade davinci-resolve-studio
```

---

## ⚠️ Avertissement et Licence

**Ce projet est fourni "tel quel" (As Is).** Veuillez consulter le fichier `LICENSE.txt` pour les termes juridiques complets.

* **Non officiel :** Il s'agit d'une automatisation personnelle. Ce script n'est **en aucun cas une méthode d'installation officielle** approuvée, fournie ou supportée par Blackmagic Design.
* **Aucune garantie :** Ce système de téléchargement s'appuie sur une API web tierce. **Il peut se casser à tout moment** si Blackmagic modifie son site ou son système de distribution. J'essaierai de maintenir ce dépôt à jour, mais je n'en donne aucune garantie temporelle ou technique.
* **Décharge de responsabilité :** Je ne suis en aucun cas responsable des éventuels bugs, instabilités du système, pertes de données ou tout autre problème pouvant survenir suite à l'utilisation de ces scripts sur votre machine. Vous les utilisez à vos propres risques.
* **Usage et Modifications (Forks) :** Ce dépôt est principalement créé et maintenu pour mon usage personnel. Si vous souhaitez faire des modifications, réparer un lien cassé ou adapter le script à d'autres besoins, **je vous recommande de "Forker" (dupliquer)** ce dépôt sur votre propre compte GitHub.

*Les marques DaVinci Resolve et Blackmagic Design appartiennent à leurs propriétaires respectifs.*
