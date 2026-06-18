# Rendu Séance 1
**Nom et prénom :** Amos Kokou KOUGBLENOU
## Résumé de la séance
## Étapes principales
## Capture d'écran
## Difficultés rencontrées

Aucours des travaux pratiques j'ai rencontré le problème de push de la branche seance-01 sur github faute de connexion. Pour résoudre cela, j'ai généré un token classic pour valider la connexion github et réussir le push

## Exercices d'application

**Exercice 1**

1.1 D n'est pas une caractéristique essentielle du cloud computing car selon le NIST seul ces 5 caractéristiques le sont:
    - Elasticité rapide
    - service mesuré (pay-as-you-go)
    - Mutualisation des ressources
    - Libre-service à la demande
    - Accès au réseau large
    

1.2 C est le service auquel appartient Gmail

1.3 D est le modèle de service le plus adapté car il consiste à l'exécution d'une fonction de code sur une durée donnée.

1.4 C est le modèle de déploiement le plus adapté car lemodèle hybride consiste à mettre les données sensibles sur le cloud privé et les analyses non sensibles sur le public.

1.5 B

1.6 C

**Exercice 2**


Google Compute Engine (machine virtuelle) **IaaS**         Machine virtuelle
AWS Lambda                                **FaaS**         Fonction
Snowflake (entrepôt de données)           **SaaS**          Application complète
Heroku                                    **PaaS**          Plateforme
Microsoft 365 (Word, Excel en ligne)      **SaaS**          Application complète
Databricks (Spark managé)                 **PaaS**
Microsoft Azure Functions                 **FaaS**              Fonction
Tableau Online                            **SaaS**          Application complète


**Exercice 3**

3.1 La commande *docker run* permet de créer et lancer un nouveau contenaire d'une image.

-d :                                    lance le conteneur en arrière plan
--name analyse-anfa :                   nomme le conteneur (analyse-anfa dans cette commande)
-p 8888:8888 :                          accessible via http://localhost:8888
-v /home/koffi/notebooks:/notebooks :   partage le dossier notebooks de la machine physique vers le contenaire
-e JUPYTER_TOKEN=anfa-token :           crée un environnement jupyter pour sécuriserl'accès via un jeton JUPYTER_TOKEN
jupyter/pyspark-notebook :              le nom de l'image Docker


3.2 La lecture du fichier docker-compose.yml

    a. le service est accessible sur http://localhost:9000/
    
    b. Après une suppression du conteneur anfa-minio le service ne sera plus disponible. Mais lorsqu'on relance *docker compose up -d* les données dans MinIO seront toujours disponibles car les données sont stockées dans le même volume.
    
    c. Le problème de sécurité dans ce fichier est l'exposition en claire des identifiants admin.
    
**Exercice 4**

a. Selon ce message (InvalidAccessKeyId), la cause précise de l'erreur est que le mot de passe dans le fichier docker-compose.yml est différent de celui-ci aws_secret_access_key="anfa-password-2026" dans le bloc de code python s3.

b. Pour corriger le code il faut mettre un même mot de passe dans le fichier et le bout de code

c. MinIO refuse les identifiants car 


**Exercice 5**








