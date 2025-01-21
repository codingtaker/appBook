# book_app2: Library CRUD Application

## 🎯 Description
Cette application Flutter permet de gérer une bibliothèque en offrant des fonctionnalités CRUD (Créer, Lire, Mettre à jour, Supprimer) pour les livres. Les données sont stockées localement à l'aide de la base de données SQLite et l'application est conçue avec un design intuitif et des performances optimales.

---

## ✨ Fonctionnalités principales
- **Ajout de livres** : Ajouter un nouveau livre en fournissant le titre et l'auteur.
- **Liste des livres** : Afficher tous les livres enregistrés avec leur titre et auteur.
- **Modification** : Modifier les informations d'un livre existant.
- **Suppression** : Supprimer un livre de la bibliothèque.
- **Persistance des données** : Les données sont sauvegardées localement grâce à SQLite, garantissant leur disponibilité même après la fermeture de l'application.

---

## 🛠️ Technologies utilisées
- **Framework** : Flutter
- **Base de données locale** : SQLite avec le package `sqflite`
- **Design** : Widgets Flutter avec un accent sur le Material Design

---

## 🧱 Structure du projet
```
lib/
├── models/
│   ├── book_model.dart        # Modèle de données pour les livres
├── screens/
│   ├── home_screen.dart       # Écran principal de l'application
│   ├── book_list_page.dart    # Gestion de la liste des livres
│   ├── login.dart       # Écran principal de l'application
│   ├── register.dart
├── services/
│   ├── db_helper.dart         # Gestionnaire de la base de données SQLite
├── main.dart                  # Point d'entrée de l'application
```

---

## Installation
1. Clonez ce dépôt sur votre machine locale :
   ```bash
   git clone https://github.com/codingtaker/appBook.git
   ```
2. Accédez au dossier du projet :
   ```bash
   cd book_app2
   ```
3. Installez les dépendances Flutter :
   ```bash
   flutter pub get
   ```
4. Lancez l'application :
   ```bash
   flutter run
   ```

---

## 👥 Utilisation
1. **Écran principal (HomeScreen)** : Découvrez l'interface d'accueil avec une image immersive et un bouton "Let's go!" pour accéder à la liste des livres.
2. **Liste des livres** : Visualisez les livres enregistrés. Vous pouvez ajouter, modifier ou supprimer un livre grâce aux boutons dédiés.
3. **Ajout ou modification** : Un formulaire contextuel s'ouvre pour saisir ou modifier les informations d'un livre.

---

## 📌 Exigences
- Flutter SDK (version 3.0.0 ou supérieure)
- Android Studio ou Visual Studio Code pour l'environnement de développement
- Un émulateur Android ou iOS ou un appareil physique connecté

---

## Captures d'écran
### Écran d'accueil
![HomeScreen](https://via.placeholder.com/400x300.png?text=Home+Screen+Preview)

### Liste des livres
![BookList](https://via.placeholder.com/400x300.png?text=Book+List+Preview)

---

## 💡 Contribuer
Les contributions sont les bienvenues ! Si vous souhaitez améliorer l'application ou signaler des problèmes :
1. Forkez ce dépôt.
2. Créez une branche pour vos modifications :
   ```bash
   git checkout -b feature/amélioration
   ```
3. Soumettez une Pull Request avec une description claire de vos modifications.

---

## Auteur
- **Nom** : Benicio
- **Contact** : benicioallaglo@gmail.com

---

## Licence
Ce projet est sous licence [MIT](LICENSE). Vous êtes libre de l'utiliser, le modifier et le distribuer avec attribution.

# appBook
