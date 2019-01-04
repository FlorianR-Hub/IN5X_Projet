%apprentissageFCM
nbCluster = 6;

m = 2;
epsillon = 0.00001;
maxIter = 10000;
options = [m maxIter epsillon true];

features = feature7_tous('database\database_apprentissage\');
Age = features(:,1);
Ratios = features(:,2);

[Centres, W] = fcm(Ratios,nbCluster,options);

% Calcul de l'age moyen de chaque cluster
% M stocke le nombre de donnés (ratios) aggloméres par un cluster, 
% ainsi que la somme des ages des données aggloméres, afin de calculer
% un age moyen pour chaque cluster
M = zeros(nbCluster,2);
AgeCluster = zeros(nbCluster,1);

for i = 1:size(Ratios,1)
    C = W(:,i);
    [~,indice] = max(C);
    M(indice,1) = M(indice,1) + 1;
    M(indice,2) = M(indice,2) + Age(i);
end

% moyenne age = somme des ages / nombre de donnée agglomérés 
for i = 1:size(C,1)
    AgeCluster(i) = M(i,2) / M(i,1);
end 

csvwrite('apprentissage\FCM.csv', [AgeCluster,Centres]);

display(strcat('Apprentissage FCM terminé !'));


