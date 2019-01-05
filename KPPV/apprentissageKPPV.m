% Apprentissage KPPV
close all;
clear, clc;

% R�cup�re les images correspondant � chaque tranche d'�ge
for trancheAge = 30 : 10 : 80
    imagefiles = dir(fullfile('database', num2str(trancheAge), '*.jpg'));
    nfiles = length(imagefiles);
    V = [];

    % Pour chaque image de la tranche d'�ge
    for i = 1 : nfiles
        currentfilename = imagefiles(i).name;
        img = imread(fullfile('database',num2str(trancheAge),currentfilename));
        
        % R�cup�re la somme des ratios correspondant au nombre de pixels
        % blanc par rapport au nombre de pixels noirs des diff�rentes
        % parties du visage selectionn�es
        sommeRatios = getSommeRatios(img);
        
        V = [V ; sommeRatios]; %#ok<*AGROW>
    end

    % Enregistre ces ratios dans un fichier
    % (1 fichier par tranche d'�ge)
    filename = strcat('apprentissage/tranche_age_', num2str(trancheAge), '.csv');
    csvwrite(filename, V);
    
    display(char(strcat('Apprentissage tranche d''�ge', {' '}, num2str(trancheAge), ' termin�')));
end

display(strcat('Apprentissage KPPV termin� !'));