% Tranche detecté = tranche qui minimise 
% la somme des (ratio à tester - ratios de tranche i) par tranche
function trancheAge = detectionKPPV(img)

sommeRatios = getSommeRatios(img);

% Read csv
csvFiles = dir(fullfile('apprentissage','tranche*.csv'));

classifieur = [];
for i = 1 : size(csvFiles,1)
    M = csvread(csvFiles(i).name);
    classifieur = [classifieur, M];
end

% détection tranche ayant la distance minimum
classifieur = abs(classifieur - sommeRatios);
[~,indice] =  min(sum(classifieur));
trancheAge = sscanf(csvFiles(indice).name,'tranche_age_%d.csv');

end

