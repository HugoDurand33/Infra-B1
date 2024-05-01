# Infra-B1

Ce dépôt contient le script et un guide pour pouvoir héberger des serveurs de jeux sur plusieurs ports !

PS : Ceci est un projet B1

## Fonctionnalités

- Héberger des serveurs de jeux choisi préalablement par vous !

## Prérequis

- Avoir fait l'installation d'un serveur de jeu dans le dossier ```base-servers```, ce qui vous permettra de le duppliquer !
- UFW (optionnel mais conseillé)
- Un serveur FTP (optionnel également)
- SteamCMD (conseillé pour installer des serveurs de jeux steam)

## Comment ça marche ?

Connectez vous en SSH sur la machine et installez un serveur de jeu et faites l'installation !
Dès que c'est fait vous devez mettre votre serveur de jeu dans le dossier ```base-servers```

**Ensuite changez la ligne 8 de server.sh en rajoutant le nom du dossier de votre serveur de jeu dans ```base-servers``` tel que ```if [ "$game_name" = "lenomdevotredossier" ] ||```** 

### Creation du Serveur :


Utilisez le script ```serveur.sh``` et rentrez le nom du jeu que vous souhaitez héberger sur la machine **(comme dit précédemment il faut que le serveur soit déjà installé dans ```base-servers```)**

### Lancement du serveur :

Pour lancer le serveur dirigez vous dans le dossier ```servers``` puis allez dans le dossier de votre serveur et éxecutez le script ```.sh```

Et voilà normalement vous pouvez jouez !

### Ouverture des Ports :

Pour pouvoir vous connectez depuis un réseau extérieur vous devez ouvrir vos ports spécifiés !

Utilisez donc la commande ```ufw allows votre_port```

### Lancer le serveur de manière permanente en tant que service !

Pour que votre serveur soit en permanence allumé il faut créer un nouveau service systemd:

#### Créer le fichier de service systemd:

```sudo nano /etc/systemd/system/(nomdevotreserveur).service```

Ecrivez ceci dans votre fichier (Pensez à changer le WorkingDirectory et le ExecStart) :

``` bash
[Unit]
Description=Discord Bot Service
After=network.target

[Service]
Type=simple
User=ubuntu
WorkingDirectory=/home/(votreuser)/(votreservice)
ExecStart=/bin/bash /home/(votreuser)/(votreservice)/(le-fichier-start.sh)
Restart=always

[Install]
WantedBy=multi-user.target
```


Assurez vous de reload votre config :

``` bash
sudo systemctl daemon-reload
```

``` bash
sudo systemctl enable (votreservice).service

```

``` bash
sudo systemctl start (votreservice).service
```

Et voilà !