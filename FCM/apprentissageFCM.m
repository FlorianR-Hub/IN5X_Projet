% Apprentissage FCM
nbCluster = 6;

m = 2;
epsillon = 1e-05;
maxIter = 100;
options = [m maxIter epsillon true];

features = [];
for trancheAge = 30 : 10 : 70
    folder = fullfile('database', num2str(trancheAge));
    features = [features ; getAllFeatures(folder)]; %#ok<*AGROW>
end
%csvwrite('apprentissage\all_tranches_age.csv', features);

Age = features(:,1);
Ratios = features(:,2);

[Centres, ~] = fcm(features,nbCluster,options);
csvwrite('apprentissage\FCM.csv', Centres);

display(strcat('Apprentissage FCM terminé !'));


