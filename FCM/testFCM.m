% Test de la détection de la tranche d'âge avec la méthode FCM

%% Calcul du delta année à partir d'un dossier
classifieur = csvread('apprentissage\FCM.csv');
delta = decisionFCM_tous(classifieur,'database\database_test\', 2);
fprintf('Moyenne écart age = %.2f\n', delta); 


%% Age detecté pour une image
% classifieur = csvread('apprentissage\FCM.csv');
% img = imread('37_1974_2011_ 12133.jpg');
% age = decisionFCM(classifieur, img, 2);
% fprintf('Age détecté = %.2f\n', age);
