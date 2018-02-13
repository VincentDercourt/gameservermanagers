# GAMESERVERMANAGER

--------------------------------------------------

Cette image est réalisé a partir de l'image "gameservermanagers/linuxgsm-docker:latest"
Elle a pour objectif de faciliter l'installation de serveur de jeu sur docker.

- Depo gameservermanagers https://hub.docker.com/r/gameservermanagers/linuxgsm-docker/
- Site gameserver manager https://gameservermanagers.com/
- liste des serveurs disponible https://gameservermanagers.com/servers

## UTILISATION DE BASE

Dans les exxemples ci-dessous remplacer rustserver par le serveur souhaité.
Vous retrouvez la liste des serveurs ici : https://gameservermanagers.com/servers
Vouc cliquez sur le serveur souhaité puis vous regardez l'url et récupérez la derniere partie
Ex: https://gameservermanagers.com/lgsm/arma3server/ la vous prenez arma3server.

### Pour télécharger l'image :

>docker pull sirpixel/gameservermanager

### pour exécuter l'image :

>docker run --restart always -p 28015-28016:28015-28016 -p 8080:8080 -p 28015-28016:28015-28016/udp -v /home/docker/rust:/home/lgsm -e serverName=rustserver -itd --name rust sirpixel/gameservermanager

Cette exemple est pour l'installation d'un serveur rust.
J'ai ouvert les port 28015 et 28016 mais il vous faut adapter selon le serveur de jeu.
Aussi j'ai ajouté l'option IT pour garder un conteneur interactif. Cela vous permettra d'entrer dans le conteneur et de manipuler le serveur selon vos besoins.

### Si vous souhaiter réaliser des modifications ou vérifier la console vous pouvez exécuter la commande

>docker attach rust
    
## LISTE DES COMMANDES POSSIBLES

Une fois dans le conteneur vous pouvez utiliser les commandes

| Commande  | explication           |
|:-------------:|:----------------:|
| /home/lgsm/rustserver start | Pour démarrer le serveur |
| /home/lgsm/rustserver stop | Pour stoper le serveur |
| /home/lgsm/rustserver restart | Pour redémarrer le server |
| /home/lgsm/rustserver update | Pour mettre a jour le serveur |
| /home/lgsm/rustserver install | Pour installer le serveur |
| /home/lgsm/rustserver console | Pour afficher le serveur |
| /home/lgsm/rustserver mods-install rustoxide | Pour installer un mod exemple oxide. remplacer rustoxide par le nom du mod. Si l'on indique pas le mod une invite nous donnera la liste des mods possible et nous permettra de le saisir. |
| /home/lgsm/rustserver mods-update | Pour afficher le serveur |
| /home/lgsm/rustserver mods-remove | Pour afficher le serveur |

Ou directement en dehors du conteneur
| Commande  | explication           |
|:-------------:|:----------------:|
| docker exec rust /home/lgsm/rustserver start | Pour démarrer le serveur |
| docker exec rust /home/lgsm/rustserver stop | Pour stoper le serveur |
| docker exec rust /home/lgsm/rustserver restart | Pour redémarrer le server |
| docker exec rust /home/lgsm/rustserver update | Pour mettre a jour le serveur |
| docker exec rust /home/lgsm/rustserver install | Pour installer le serveur |
| docker exec rust /home/lgsm/rustserver console | Pour afficher le serveur |
| docker exec rust /home/lgsm/rustserver mods-install rustoxide | Pour installer un mod exemple oxide. remplacer rustoxide par le nom du mod. Si l'on indique pas le mod une invite nous donnera la liste des mods possible et nous permettra de le saisir. |
| docker exec rust /home/lgsm/rustserver mods-update | Pour afficher le serveur |
| docker exec rust /home/lgsm/rustserver mods-remove | Pour afficher le serveur |

Vous pouvez retrouver la liste complète des commandes et de leur utilité ici
[https://gameservermanagers.com/lgsm/rustserver/](https://gameservermanagers.com/lgsm/rustserver/)
Ou dans le conteneur tapez la commande /home/lgsm/rustserver

## Configuration du serveur

Vous pouvez modifier les informations sur le "port, ip, map etc.." ici 

>/home/lgsm/rustserver
ou
>/home/lgsm/lgsm/config-default/config-lgsm/rustserver
ou
>/home/lgsm/lgsm/config-lgsm/rustserver
ou
>/home/lgsm/serverfiles

l'emplacement change en fonction du serveur de jeu et de la version de gameservermanager.
La plus par ddu temps la config est dans le dossier lgsm ou directement dans les fichiers du serveur pour minecraft ou 
7 Days to Die et peut etre d'autre serveur.

## Liste des variables possibles


| Variable | valeur Default |explication |
|:-------------:|:----------------:|:----------------:|
| serverName | rustserver | Contient le nom du serveur que l'on souhaite installer. La liste ici https://gameservermanagers.com/servers|
| steamuser | anonymous | Contient le pseudo d'un compte steam - Certain serveur ont besoin d'un login valide |
| steampass |  | Contient le password d'un compte steam - Certain serveur ont besoin d'un login valide |

## Compte steam

Attention si votre serveur réclame un login steam valide.
Vous pouvez essayer de créer un compte spécialement pour lancer votre serveur mais certain réclame aussi qu'il y ai un jeu de plus de 5€ acheté sur le ccompte.
Aussi si vous avez activer steamGuard vous devrais effectuer l'installation manuellement pour pouvoir taper votre steamGuard ou alors vous pouvez desactiver steamGuard le temps de l'installation de votre serveur.
Les identifiants steam sont sauvegardé dans le fichier 
>/home/docker/lgsm/lgsm/config-lgsm/rustserver/rustserver.cfg

## Installation manuel

Si vous souhaitez effectuer l'installation manuellement voici la marche a suivre.
entré dans le conteneur avec 
>docker attach nomDuConteneur

puis saisissez la commande
> /home/lgsm/rustserveur install

Si vous rester a l'exterieur du conteneur vous pouvez utiliser la commande suivante
> docker exec rust /home/lgsm/rustserver install

### INFORMATION DE CONTACT

- discord : SirPixel#8679
- email : contact@vincentdercourt.fr

### Attention !!!!
Les ip failover peuvent rendre difficile la visibilité de votre serveur sur les listes steams et les listes de serveurs dans le jeu ou tout autre listes.
il est préférable de de garder l'ip 0.0.0.0 lorsque vous configurer vos serveurs et de préciser votre ip failover au moment de la création de votre conteneur.
