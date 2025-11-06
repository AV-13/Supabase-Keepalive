# Supabase Keepalive (GitHub Actions)

Ce dépôt envoie périodiquement une requête HTTP vers vos endpoints publics Supabase pour éviter la mise en pause automatique des projets inactifs.

## ⚙️ Configuration rapide

1. **Cloner** ce dépôt puis l’ouvrir dans votre éditeur.
2. Choisir **une** méthode de configuration des URLs :
   - **A. Fichier** : éditer `urls.txt` et mettre une URL par ligne.
   - **B. Secret/Variable GitHub** : dans Settings → Secrets and variables → Actions, créer une variable/secret `PING_URLS` avec vos URLs (une par ligne).
3. Commit & push.

Par défaut, le workflow tourne toutes les **12h** en UTC.
