% Decision de l'age d'une image
% On calcule le degr� d'appartenance Pi du ratio aux clusters
% age = somme (Pi * age_cluster_i) / somme (Pi)

function age = decisionFCM(classifieur, img, m)
    feature = getSommeRatios(img);
    sumCoeff = 0;
    age = 0;
    exp = 1; % exp pour faire plus ou moins influer les coefficient des centres les plus proches
    for i = 1 : size(classifieur,1)
            if( isnan(classifieur(i,1)) == false)
                dist = feature - classifieur(i,2);
                somme = 0;
                for j = 1 : size(classifieur,1)
                    somme = somme +(dist / (feature - classifieur(j,2)))^(2 / (m-1));
                end
                % 1/somme = degr� d'appartenance de l'image au cluster i
                sumCoeff = sumCoeff + (1 / somme^exp);
                age = age + (1 / somme^exp) * classifieur(i,1); 
            end
    end
    age = age / (sumCoeff);
end