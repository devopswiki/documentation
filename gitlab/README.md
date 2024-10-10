## Table of contents

- [Table of contents](#table-of-contents)
- [Faire un Backup de GitLab](#faire-un-backup-de-gitlab)
  - [a. Utiliser l'outil de backup intégré](#a-utiliser-loutil-de-backup-intégré)
  - [2. Tester la Suppression d'un Repository](#2-tester-la-suppression-dun-repository)
  - [3. Restaurer à partir du Backup](#3-restaurer-à-partir-du-backup)
  - [4. Vérifications Finales](#4-vérifications-finales)
  - [Notes](#notes)


Pour faire un backup de GitLab, tester une suppression de repository et restaurer à partir du backup, voici les étapes à suivre :

## Faire un Backup de GitLab

### a. Utiliser l'outil de backup intégré

GitLab fournit un outil de backup pour sauvegarder les données. Voici comment faire :

1. **Accéder au serveur GitLab** :
   Connectez-vous au serveur où GitLab est installé.

2. **Exécuter la commande de backup** :
   ```bash
   sudo gitlab-backup create
   ```

3. **Vérifier le backup** :
   Les fichiers de backup sont généralement stockés dans le répertoire `/var/opt/gitlab/backups`. Vous pouvez lister les fichiers pour vous assurer que le backup a été créé :
   ```bash
   ls /var/opt/gitlab/backups
   ```

4. **(Optionnel)** Si vous souhaitez inclure les fichiers de configuration et les secrets, vous pouvez également faire une copie de ces fichiers :
   ```bash
   sudo cp /etc/gitlab/gitlab.rb /path/to/backup/gitlab.rb.bak
   sudo cp /etc/gitlab/gitlab-secrets.json /path/to/backup/gitlab-secrets.json.bak
   ```

### 2. Tester la Suppression d'un Repository

1. **Accéder à l'interface GitLab** :
   Connectez-vous à l'interface web de GitLab.

2. **Supprimer un repository** :
   - Accédez au projet que vous souhaitez supprimer.
   - Allez dans **Settings** > **General**.
   - Faites défiler jusqu'à la section **Advanced** et cliquez sur **Remove project**.
   - Confirmez la suppression.

### 3. Restaurer à partir du Backup

1. **Arrêter GitLab** :
   Avant de restaurer, vous devez arrêter GitLab pour éviter des problèmes de cohérence :
   ```bash
   sudo gitlab-ctl stop
   ```

2. **Restaurer le Backup** :
   Exécutez la commande suivante pour restaurer le backup :
   ```bash
   sudo gitlab-backup restore BACKUP=<timestamp>
   ```
   Remplacez `<timestamp>` par le nom du fichier de backup (par exemple, `1631180321_2021_09_09_13.0.5_gitlab_backup.tar`).

3. **Redémarrer GitLab** :
   Une fois la restauration terminée, redémarrez GitLab :
   ```bash
   sudo gitlab-ctl start
   ```

4. **Vérifier la restauration** :
   Accédez à l'interface web de GitLab pour vérifier que le repository a bien été restauré.

### 4. Vérifications Finales

- Vérifiez les logs pour tout problème potentiel :
  ```bash
  sudo gitlab-ctl tail
  ```

- Testez les fonctionnalités du repository restauré pour vous assurer que tout fonctionne correctement.

### Notes

- **Fréquence des backups** : Assurez-vous de planifier des backups réguliers.
- **Environnement de test** : Si possible, effectuez ces tests dans un environnement de test pour éviter toute perte de données en production.
- **Documentation** : Consultez la [documentation officielle de GitLab](https://docs.gitlab.com/ee/raketasks/backup_restore.html) pour des détails supplémentaires et des options avancées.

