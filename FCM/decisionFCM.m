% Décision de l'age d'une image
% On calcule le degré d'appartenance Pi du ratio aux clusters
% On utilise ensuite ces ratios pour déterminer l'âge
% L'âge est égal à la moyenne des âges des cluster pondéré
% par le degré d'appartenance de ce ratios aux clusters.
% age = somme (Pi * age_cluster_i)

function age = decisionFCM(classifieur, img, m)
    sommeRatios = getSommeRatios(img);
    age = 0;
    exp = 1; % exp pour faire plus ou moins influer les coefficient des centres les plus proches
    
    for j = 1 : size(classifieur,1)
        if(isnan(classifieur(j,1)) == false)
            dist = sommeRatios - classifieur(j,2);
            coeff = 0;
            
            %calcul du degré d'appartenance de img pour le centre k
            for k = 1 : size(classifieur,1)
                coeff = coeff +(dist / (sommeRatios - classifieur(k,2)))^(2 / (m-1));
            end
            
            % degré d'appartenance Pi de l'image au cluster j
            Pi = 1 / coeff^exp;
            age = age + Pi * classifieur(j,1); 
        end
    end
end