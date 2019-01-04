% calcul du delta année moyen entre ce qui l'age réel et l'age détecté
function deltaAnnee = decisionFCM_tous(classifieur,folder,m)
    deltaAnnee = 0;
    imagefiles = dir(fullfile(folder,'*.jpg'));
    for i = 1:size(imagefiles,1)
       A = sscanf(imagefiles(i).name,'%d_%d');
       age = A(1);
       ageDetecte = decisionFCM(classifieur,imread(fullfile(folder,imagefiles(i).name)),m);
       deltaAnnee = deltaAnnee + abs(age - ageDetecte);
    end
    deltaAnnee = deltaAnnee/size(imagefiles,1);
end