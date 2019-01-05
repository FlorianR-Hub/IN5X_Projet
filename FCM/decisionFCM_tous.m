% Calcul du delta année moyen entre l'âge réel et l'âge détecté
function deltaAnnee = decisionFCM_tous(classifieur,folder,m)
    deltaAnnee = 0;
    imagefiles = dir(fullfile(folder,'*.jpg'));
    
    for i = 1 : size(imagefiles,1)
       A = sscanf(imagefiles(i).name,'%d_%d');
       age = A(1);
       ageDetecte = decisionFCM(classifieur,imread(fullfile(folder,imagefiles(i).name)),m);
       deltaAnnee = deltaAnnee + abs(age - ageDetecte);
       fprintf('Age réel : %d Age detecté = %.2f\n',age,ageDetecte); 
    end
    
    deltaAnnee = deltaAnnee/size(imagefiles,1);
end