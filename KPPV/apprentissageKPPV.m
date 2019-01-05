% Apprentissage KPPV
close all;
clear, clc;

% Récupère les images correspondant à chaque tranche d'âge
for trancheAge = 30 : 10 : 80
    imagefiles = dir(fullfile('database', num2str(trancheAge), '*.jpg'));
    nfiles = length(imagefiles);
    V = [];

    % Pour chaque image de la tranche d'âge
    for i = 1 : nfiles
        currentfilename = imagefiles(i).name;
        img = imread(fullfile('database',num2str(trancheAge),currentfilename));
        
        % Récupère la somme des ratios correspondant au nombre de pixels
        % blanc par rapport au nombre de pixels noirs des différentes
        % parties du visage selectionnées
        sommeRatios = getSommeRatios(img);
        
        V = [V ; sommeRatios]; %#ok<*AGROW>
    end

    % Enregistre ces ratios dans un fichier
    % (1 fichier par tranche d'âge)
    filename = strcat('apprentissage/tranche_age_', num2str(trancheAge), '.csv');
    csvwrite(filename, V);
    
    display(char(strcat('Apprentissage tranche d''âge', {' '}, num2str(trancheAge), ' terminé')));
end

display(strcat('Apprentissage KPPV terminé !'));