% Décision de l'age d'une image
% On calcule le degré d'appartenance Pi du ratio aux clusters
% age = somme(Pi * age_cluster_i)

function age = decisionFCM(classifieur, img, m)
    sommeRatios = getSommeRatios(img);
    age = 0;
    exp = 1; % exp pour faire plus ou moins influer les coefficient des centres les plus proches
    
    for j = 1 : size(classifieur,1)
        if(isnan(classifieur(j,1)) == false)
            dist = sommeRatios - classifieur(j,2);
            somme = 0;
            for k = 1 : size(classifieur,1)
                somme = somme + (dist / (sommeRatios - classifieur(k,2)))^(2 / (m-1));
            end
            % degré d'appartenance Pi de l'image au cluster j
            Pi = 1 / somme^exp;
            age = age + Pi * classifieur(j,1); 
        end
    end
end