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

[Centres, W] = fcm(features,nbCluster,options);

% Calcul de l'age moyen de chaque cluster
% M stocke le nombre de donnés (ratios) aggloméres par un cluster, 
% ainsi que la somme des ages des données aggloméres, afin de calculer
% un age moyen pour chaque cluster
M = zeros(nbCluster,2);
AgeCluster = zeros(nbCluster,1);


% une donnée appartient au cluster dont il a le plus grand degré 
% d'appartenance
for i = 1:size(Ratios,1)
    C = W(:,i);
    [~,indice] = max(C);
    M(indice,1) = M(indice,1) + 1;
    M(indice,2) = M(indice,2) + Age(i);
end

% moyenne age = somme des ages / nombre de données agglomérés 
for i = 1:size(C,1)
    AgeCluster(i) = M(i,2) / M(i,1);
end 

% Autre méthode : Age = moyenne d'age (Wij * Agej) au lieu du max
% for i = 1:size(AgeCluster,1)
%     sommeDegre = 0;
%     for j = 1:size(W,2)
%         AgeCluster(i) = AgeCluster(i) + W(i,j) * Age(j);
%         sommeDegre = sommeDegre + W(i,j);
%     end
%     AgeCluster(i) = AgeCluster(i) / sommeDegre;
% end


csvwrite('apprentissage\FCM.csv', [AgeCluster,Centres]);

display(strcat('Apprentissage FCM terminé !'));


