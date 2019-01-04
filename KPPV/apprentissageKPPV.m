% Apprentissage KPPV
close all;
clear, clc;

for trancheAge = 30 : 10 : 50
    imagefiles = dir(fullfile('database', num2str(trancheAge),'*.jpg'));
    nfiles = length(imagefiles);
    V = [];

    for i = 1 : nfiles
        currentfilename = imagefiles(i).name;
        img = imread(currentfilename);

        sommeRatios = getSommeRatios(img);
        V = [V ; sommeRatios]; %#ok<*AGROW>
        
        % Affichage
        %figure, imshow(imgBoxed);
    end

    filename = strcat('apprentissage/tranche_age_', num2str(trancheAge), '.csv');
    csvwrite(filename, V);
    
    display(char(strcat('Apprentissage tranche d''âge', {' '}, num2str(trancheAge), ' terminé')));
end

display(strcat('Apprentissage KPPV terminé !'));