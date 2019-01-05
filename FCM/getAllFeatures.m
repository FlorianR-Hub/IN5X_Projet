% Calcul la feature du visage pour chaque image du folder, avec association de l'age
% features : matrice 2 colonnes, 1ere colonne l'age, 2eme colonne la somme
% des ratios
function features = getAllFeatures(folder)
    imagefiles = dir(fullfile(folder,'*.jpg'));
    features = [];
    for i = 1:size(imagefiles,1)
       A = sscanf(imagefiles(i).name,'%d_%d');
       age = A(1);
       features(i,1) = age;
       features(i,2) = getSommeRatios(imread(fullfile(folder,imagefiles(i).name)));
    end
end

