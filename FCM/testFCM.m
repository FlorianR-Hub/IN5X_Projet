% Test de la détection de la tranche d'âge avec la méthode FCM

%% Calcul du delta année à partir d'un dossier
classifieur = csvread('apprentissage\FCM.csv');
delta = decisionFCM_tous(classifieur,'database\database_test\', 2);
fprintf('Moyenne écart age = %.2f\n', delta); 


%% Age détecté pour une image
classifieur = csvread('apprentissage\FCM.csv');
imgName = '51_1960_2011_ 2931.jpg';
A = sscanf(imgName,'%d_%d');
ageDetecte = decisionFCM(classifieur, imread(imgName), 2);
fprintf('Age réel = %d / Age detecté = %.2f\n', A(1), ageDetecte); 
