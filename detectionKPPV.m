function trancheAge = detectionKPPV(img)
imgCropped = decoupage(img);
imgContours = contours(imgCropped);
partiesVisage = traitement(imgCropped);

imgBoxed = uint8(imgContours * 255);
sommeRatios = 0;

for j = 1 : size(partiesVisage, 1)
    box = partiesVisage(j, :);
    imgBoxed = insertObjectAnnotation(imgBoxed, 'rectangle', box, '');
    partieVisage = imcrop(imgContours, box(1, :));

    whitePixels = sum(sum(partieVisage == 1));
    totalPixels = sum(sum(partieVisage == 0)) + whitePixels;
    ratio = whitePixels / totalPixels;

    sommeRatios = sommeRatios + ratio;
end

% Read csv
csvFiles = dir(fullfile('apprentissage','tranche*.csv'));
classifieur = [];
for i = 1 : size(csvFiles,1)
    M = csvread(csvFiles(i).name);
    classifieur = [classifieur, M];
end

%Methode KPPV

classifieur = abs(classifieur - sommeRatios);
nbVoisin = zeros(size(classifieur,2),1);
K = 5;
INF = 999999;

for i = 1:K
    [vectorMin,indiceL] = min(classifieur);
    [~,indiceC] = min(vectorMin);
    indice = indiceL(indiceC);
    nbVoisin(indiceC) = nbVoisin(indiceC) + 1;
    classifieur(indice,indiceC) = INF;
end

[~,indice] = max(nbVoisin);
trancheAge = sscanf(csvFiles(indice).name,'tranche_age_%d.csv');

end

