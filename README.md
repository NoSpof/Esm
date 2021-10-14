# Esm

Ce docker permet de builder une image distroless de l'outil ESM. Esm permet de prendre un index situé sur un serveur source et de l'envoyer sur un serveur distant.

## Usage : 

L'image docker est buildé et envoyé sur la registry depuis le dockerfile situé à la racine du projet.

Cette image est alors déployé via le charts helm situé dans le dossier charts avec les paramétres suivant : 

```yaml
image: ""                                                                       # Nom de l'image avec le tag situé à la fin. Doit être entre quote double
name: ""                                                                        # Nom du déploiement. Lors du déploiement il est suffixé par un index
resources:
  limits:
    cpu: 1
    memory: "512Mi"
  requests:
    cpu: 0.5
    memory: "256Mi"
esm:
  source:
    srv: ""                                                                     # FQDN préfixé d'un https du serveur source
    auth: ""                                                                    # Login Mot de passe pour l'authentification au serveur source. SOus la forme user:mdp
  destination:
    srv: ""                                                                     # FQDN préfixé d'un https du serveur destination 
    auth: ""                                                                    # Login Mot de passe pour l'authentification au serveur destination. SOus la forme user:mdp
batch:                                                                          # Liste des indexs devant être migré. ATTENTION cela lance un déploiement à chaque fois. 
  - "index1"
  - "index2"
```
