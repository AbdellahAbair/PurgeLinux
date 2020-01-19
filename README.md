# PurgeLinux
Le but  :Libérer l'espace disque des serveurs de prod ou dev à partir un script sous format .sh

Sujet:

Imaginons que vous ayez activé la fonctionnalité de corbeille sur votre serveur X.

Les fichiers contenus dans un repértoire que vous avez enregister des fichiers qui prend la grande place dans votre machine, s’amasseront et prendront de la place , puisque le principe est de pouvoir les récupérer en cas de suppression par erreur.
Mais votre serveur n’a pas d’espace de stockage illimité.
Donc en fonction de votre stratégie de sauvegarde, il convient de « archiver » vers un autre repertoire nommé /opt/logs et cette fois-ci de supprimer définitivement les fichiers par un bon vieux « rm ».
Aprés une anné ce repertoire /opt/logs doit étre purger en fonction de votre stratégie.

Deuxiément,tous le deplacments des fichiers vers le logs doit etre enregister dans un fichier csv sous format (.csv).

Troisiement,chaque fin de mois un mail sera generé est envoyé à vous que il informe que tous les fichiers de mois précedent à été bien purger vers le deplacement que vous avez verfier au ficher csv attaché au mail envoyé.
Donc la commande ci -dessus est à planifier dans votre crontab:

0 1 1 * * ./purge

Remarques:
– et on les supprime à chaque fois que la condition est remplie
-Format du fichier doit étre comme ça :X_YearMMDay_numfac_numcentre.gz  exemple :(AVC_20191201_8876_1122.gz)
