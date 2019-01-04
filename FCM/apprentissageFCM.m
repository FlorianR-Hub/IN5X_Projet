%apprentissageFCM
m = 2;
nbCluster = 6;
epsillon = 0.00001;

features = feature7_tous('database\database_apprentissage\');
[AgeCluster, Cluster] = FCM(nbCluster,m,epsillon,features(:,2),features(:,1));
csvwrite('apprentissage\FCM.csv', [AgeCluster,Cluster]);

display(strcat('Apprentissage FCM terminé !'));
