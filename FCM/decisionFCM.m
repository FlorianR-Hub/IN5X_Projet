% Decision de l'age d'une image
% On calcule le degré d'appartenance Pi du ratio aux clusters
% On utilise ensuite ces ratios pour déterminer l'age
% L'age est égal à la moyenne des âges des cluster pondéré
% par le degré d'appartenance de ce ratios aux clusters.
% age = somme (Pi * age_cluster_i) / somme (Pi)

function age = decisionFCM(classifieur, img, m)
    feature = getSommeRatios(img);
    sumCoeff = 0;
    age = 0;
    exp = 1; % exp pour faire plus ou moins influer les coefficient des centres les plus proches
    for i = 1 : size(classifieur,1)
            if( isnan(classifieur(i,1)) == false)
                dist = feature - classifieur(i,2);
                coeff = 0;
				%calcul du degré d'appartenance de img pour le centre i
                for j = 1 : size(classifieur,1)
                    coeff = coeff +(dist / (feature - classifieur(j,2)))^(2 / (m-1));
                end
                % 1/coeff = degré d'appartenance de l'image au cluster i
                sumCoeff = sumCoeff + (1 / coeff^exp);
                age = age + (1 / coeff^exp) * classifieur(i,1); 
            end
    end
    age = age / (sumCoeff);
end