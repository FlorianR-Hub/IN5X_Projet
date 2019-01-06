% Apprentissage FCM 35 37
nbCluster = 6;

m = 2; %1.7
epsillon = 1e-05;
maxIter = 100;
options = [m maxIter epsillon true];

features = [];
for trancheAge = 30 : 10 : 80
    folder = fullfile('database', num2str(trancheAge));
    features = [features ; getAllFeatures(folder)];
end

Age = features(:,1);
Ratios = features(:,2);

[Centres, ~] = fcm(features,nbCluster,options);

% Calcul de l'age moyen de chaque cluster
% M stocke le nombre de donnés (ratios) aggloméres par un cluster, 
% ainsi que la somme des ages des données aggloméres, afin de calculer
% un age moyen pour chaque cluster
M = zeros(nbCluster,2);


csvwrite('apprentissage\FCM.csv', Centres);

display(strcat('Apprentissage FCM terminé !'));


