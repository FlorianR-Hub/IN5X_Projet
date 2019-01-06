% Test de la d�tection de la tranche d'�ge avec la m�thode FCM

%% Calcul du delta ann�e � partir d'un dossier
classifieur = csvread('apprentissage\FCM.csv');
delta = decisionFCM_tous(classifieur,'database\database_test\', 2);
fprintf('Moyenne �cart age = %.2f\n', delta); 


%% Age d�tect� pour une image
classifieur = csvread('apprentissage\FCM.csv');
imgName = '51_1960_2011_ 2931.jpg';
A = sscanf(imgName,'%d_%d');
ageDetecte = decisionFCM(classifieur, imread(imgName), 2);
fprintf('Age r�el = %d / Age detect� = %.2f\n', A(1), ageDetecte); 
