% calcul feature 7 pour chaque image du folder, avec association de l'age
%features : matrice 2 colonnes, 1ere colonne l'age, 2eme colonne feature7
function features = feature7_tous(folder)
    imagefiles = dir(fullfile(folder,'*.jpg'));
    features = [];
    for i = 1:size(imagefiles,1)
       A = sscanf(imagefiles(i).name,'%d_%d');
       age = A(2);
       features(i,1) = age;
       features(i,2) = getSommeRatios(imread(imagefiles(i).name));
    end
end

