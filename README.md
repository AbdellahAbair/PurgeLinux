# PurgeLinux
Libérer l'espace disque des serveurs de prod ou dev à partir un script sous format .sh

imaginons que vous ayez activé la fonctionnalité de corbeille sur votre serveur X.

Les fichiers contenus dans la corbeille s’amasseront et prendront de la place , puisque le principe est de pouvoir les récupérer en cas de suppression par erreur.
Mais votre serveur n’a pas d’espace de stockage illimité.
Donc en fonction de votre stratégie de sauvegarde, il convient de « vider » la corbeille et cette fois-ci de supprimer définitivement les fichiers par un bon vieux « rm ».


Donc la commande ci -dessus est à planifier dans votre crontab:
10 23 * * 1-5 ./purge

-Du lundi au vendredi à 23h10
– et on les supprime à chaque fois que la condition est remplie
-Format du fichier doit étre comme ça :X_YearMMDay_numfac_numcentre.gz  exemple :(AVC_20191201_8876_1122.gz)
