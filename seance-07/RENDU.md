# Rendu — Séance 7

**Nom et prénom :** Amos Kokou KOUGBLENOU
**Identifiant GitHub :** akinnoamakawg
**Date de soumission :** 07/07/2026

## Résumé de la séance

<2-4 lignes : cluster Kafka 3 brokers déployé, flotte de bus simulée en flux continu,
tolérance aux pannes observée, Spark Structured Streaming consommant et agrégeant le flux vers MinIO.>

## Étapes principales

1. Déploiement du cluster Kafka (3 brokers, mode KRaft) + Kafka UI.
2. Création du topic `anfa-positions-bus` (3 partitions, réplication 3).
3. Premier producer/consumer Python pour comprendre la mécanique.
4. Simulation de 100 bus envoyant leur position en continu.
5. Démonstration de tolérance aux pannes (arrêt d'un broker).
6. Spark Structured Streaming : lecture console, puis agrégation en fenêtre vers MinIO.

## Captures d'écran

### 3 brokers actifs dans Kafka UI
![Brokers actifs](captures/kafka-ui-brokers.png)

### Débit de messages en augmentation
![Débit messages](captures/kafka-ui-debit.png)

### Cluster avec 2 brokers sur 3 (après arrêt volontaire)
![2 brokers sur 3](captures/kafka-ui-2-brokers.png)

### Micro-batchs affichés en console par Spark
![Console Spark Streaming](captures/spark-streaming-console-1.png)
![Console Spark Streaming](captures/spark-streaming-console-2.png)

### Résultats agrégés dans MinIO
![MinIO agregats](captures/minio-agregats.png)

## Réflexion personnelle

<3-5 lignes : dans quel cas utiliseriez-vous Kafka + Spark Streaming plutôt que le pipeline batch
Airflow + Spark vu en séance 5-6 ? Qu'est-ce que la réplication à 3 brokers vous a concrètement montré ?>

- On utilise Kafka + Spark Streaming pour le vrai temps réel. On bascule sur l'architecture Kafka + Spark Streaming lorsque la latence doit se compter en secondes ou millisecondes et non en heures. Par exemple les bus envoie leur localisation en temps réel. La donnée est générée en continu (kafka) et traitée au fil de de l'eau dès son arrivée par Spark Streaming.

- On utilise le pipeline batch Airflow + Spark lorsqu'il s'agit de volumes massifs de données où la fraîcheur à la minute n'est pas requise.

- La réplication à 3 brokers favorise la survie du système en cas de crash. Lorsque l'un des 3 brokers s'éteint brusquement, le flux de données ne s'arrête pas. Les deux 2 autres brokers possèdent des copies conformes des données(les répliques) et prennent instantanément le relais.

## Réponses aux exercices d'application

<À compléter d'après les énoncés fournis avec l'assignment.>

## Difficultés rencontrées

<Aucune | Décrivez brièvement.>
