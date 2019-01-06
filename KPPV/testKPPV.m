% Test de la détection de la tranche d'âge avec la méthode KPPV

close all;
clear, clc;

imagefiles = dir(fullfile('database/database_test','*.jpg'));
succes = 0;
deltaTranche = 0;
for i = 1 : size(imagefiles,1)
   A = sscanf(imagefiles(i).name,'%d_%d');
   age = A(1);
   %trancheAge = detectionMinDistance(imread(imagefiles(i).name));
   trancheAge = detectionKPPV(imread(imagefiles(i).name));
   fprintf('Age réel : %d Tranche detecté = %d\n',age,trancheAge); 
   if(floor(age/10) == floor(trancheAge/10))
       succes = succes +1;
   end
   deltaTranche = deltaTranche + abs (floor(age/10) - floor(trancheAge/10));
end

fprintf('Taux de reconnaisance : %d/%d',succes,size(imagefiles,1));
fprintf('Delta tranche d age moyen = %f',deltaTranche/size(imagefiles,1));


