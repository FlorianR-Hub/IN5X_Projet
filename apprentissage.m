% Apprentissage
close all;
clear, clc;

V = [];
for trancheAge = 30 : 10 : 50
    imagefiles = dir(fullfile('database', num2str(trancheAge),'*.jpg'));
    nfiles = length(imagefiles);

    for i = 1 : nfiles
        currentfilename = imagefiles(i).name;
        img = imread(currentfilename);

        imgCropped = decoupage(img);
        imgContours = contours(imgCropped);

        rect1 = [0 0 10 10];
        rect2 = [100 100 50 50];
        rects = [rect1 ; rect2];
        %rects = traitement(img);

        imgBoxed = uint8(imgContours*255);
        features = [];

        for j = 1 : size(rects, 1)
            box = rects(j, :);
            imgBoxed = insertObjectAnnotation(imgBoxed, 'rectangle', box, strcat('rect', num2str(j)));
            imgCropped = imcrop(imgContours, box(1, :));

            whitePixels = sum(sum(imgCropped == 1));
            totalPixels = sum(sum(imgCropped == 0)) + whitePixels;

            ratio = whitePixels / totalPixels;

            features = [features ratio]; %#ok<*AGROW>
        end

        V = [V ; features]; %#ok<*AGROW>
        
        % Affichage
        %figure, imshow(imgBoxed);
    end
    
    filename = strcat('apprentissage/tranche_age_', num2str(trancheAge), '.csv');
    csvwrite(filename, V);
    
    display(char(strcat('Apprentissage tranche d''âge', {' '}, num2str(trancheAge), ' terminé')));
end

display(strcat('Apprentissage terminé !'));
