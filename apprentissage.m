% Apprentissage
close all;
clear, clc;

for trancheAge = 30 : 10 : 50
    imagefiles = dir(fullfile('database', num2str(trancheAge),'*.jpg'));
    nfiles = length(imagefiles);
    V = [];

    for i = 1 : nfiles
        currentfilename = imagefiles(i).name;
        img = imread(currentfilename);

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

            sommeRatios = sommeRatios + ratio; %#ok<*AGROW>
        end
        
        V = [V ; sommeRatios]; %#ok<*AGROW>
        
        % Affichage
        %figure, imshow(imgBoxed);
    end

    filename = strcat('apprentissage/tranche_age_', num2str(trancheAge), '.csv');
    csvwrite(filename, V);
    
    display(char(strcat('Apprentissage tranche d''âge', {' '}, num2str(trancheAge), ' terminé')));
end

display(strcat('Apprentissage terminé !'));
