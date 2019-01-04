function trancheAge = detectionKPPV(img)

sommeRatios = feature7(img);

% Read csv
csvFiles = dir(fullfile('apprentissage','tranche*.csv'));

classifieur = [];
for i = 1 : size(csvFiles,1)
    M = csvread(csvFiles(i).name);
    classifieur = [classifieur, M];
end

% Methode KPPV
% calcul de distance entre le classifieur et notre ratio
classifieur = abs(classifieur - sommeRatios);
nbVoisin = zeros(size(classifieur,2),1);
K = 5;
INF = 999999;
% recherche des k plus proches voisins
for i = 1:K
    [vectorMin,indiceL] = min(classifieur);
    [~,indiceC] = min(vectorMin);
    indice = indiceL(indiceC);
    nbVoisin(indiceC) = nbVoisin(indiceC) + 1;
    classifieur(indice,indiceC) = INF;
end
% classe retenue = classe avec le maximum de voisin
[~,indice] = max(nbVoisin);
trancheAge = sscanf(csvFiles(indice).name,'tranche_age_%d.csv');

end

