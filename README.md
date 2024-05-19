# todo-project
### Guide d'utilisation du script "todo.sh"

Le script `todo.sh` est un outil simple en ligne de commande pour gérer vos tâches. Il permet de créer, mettre à jour, supprimer et afficher des tâches, ainsi que de lister les tâches d'un jour donné et de rechercher des tâches par titre. Voici comment utiliser ce programme.

#### Pré-requis
1. Assurez-vous d'avoir un terminal Unix/Linux ou macOS.
2. Téléchargez le script `todo.sh` et placez-le dans le répertoire souhaité.
3. Rendez le script exécutable en utilisant la commande suivante :
   ```sh
   chmod +x todo.sh
   ```

#### Commandes de base

1. **Créer une tâche**
   Pour créer une nouvelle tâche, exécutez :
   ```sh
   ./todo.sh create
   ```
   Vous serez invité à entrer les informations suivantes :
   - Titre (obligatoire)
   - Date et heure d'échéance au format `YYYY-MM-DD HH:MM` (obligatoire)
   - Description (facultatif)
   - Lieu (facultatif)

2. **Mettre à jour une tâche**
   Pour mettre à jour une tâche existante, exécutez :
   ```sh
   ./todo.sh update
   ```
   Vous serez invité à entrer l'ID de la tâche à mettre à jour, puis les nouvelles informations.

3. **Supprimer une tâche**
   Pour supprimer une tâche, exécutez :
   ```sh
   ./todo.sh delete
   ```
   Vous serez invité à entrer l'ID de la tâche à supprimer.

4. **Afficher les détails d'une tâche**
   Pour afficher les informations détaillées d'une tâche spécifique, exécutez :
   ```sh
   ./todo.sh show
   ```
   Vous serez invité à entrer l'ID de la tâche à afficher.

5. **Lister les tâches d'un jour donné**
   Pour lister toutes les tâches d'un jour donné, séparées en tâches complétées et non complétées, exécutez :
   ```sh
   ./todo.sh list
   ```
   Vous serez invité à entrer la date au format `YYYY-MM-DD`.

6. **Rechercher une tâche par titre**
   Pour rechercher des tâches par titre, exécutez :
   ```sh
   ./todo.sh search
   ```
   Vous serez invité à entrer le titre ou une partie du titre de la tâche à rechercher.

7. **Afficher les tâches du jour**
   Si vous exécutez le script sans argument, il affichera les tâches du jour courant, séparées en tâches complétées et non complétées :
   ```sh
   ./todo.sh
   ```

#### Gestion des erreurs
Le script contrôle la validité des entrées de l'utilisateur autant que possible et affiche des messages d'erreur appropriés en cas d'entrées invalides. Ces messages d'erreur sont redirigés vers la sortie standard des erreurs (stderr).

#### Exemples d'utilisation
- **Créer une tâche :**
  ```sh
  ./todo.sh create
  ```
  (Suivez les invites pour entrer le titre, la date et heure d'échéance, la description et le lieu)

- **Mettre à jour une tâche :**
  ```sh
  ./todo.sh update
  ```
  (Entrez l'ID de la tâche à mettre à jour et les nouvelles informations)

- **Supprimer une tâche :**
  ```sh
  ./todo.sh delete
  ```
  (Entrez l'ID de la tâche à supprimer)

- **Afficher les détails d'une tâche :**
  ```sh
  ./todo.sh show
  ```
  (Entrez l'ID de la tâche à afficher)

- **Lister les tâches d'un jour donné :**
  ```sh
  ./todo.sh list
  ```
  (Entrez la date au format `YYYY-MM-DD`)

- **Rechercher une tâche par titre :**
  ```sh
  ./todo.sh search
  ```
  (Entrez le titre ou une partie du titre)

- **Afficher les tâches du jour courant :**
  ```sh
  ./todo.sh
  ```

Utilisez ce guide pour gérer efficacement vos tâches avec le script `todo.sh`.
