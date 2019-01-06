% D�cision de l'age d'une image
% On calcule le degr� d'appartenance Pi du ratio aux clusters
% On utilise ensuite ces ratios pour d�terminer l'�ge
% L'�ge est �gal � la moyenne des �ges des cluster pond�r�
% par le degr� d'appartenance de ce ratios aux clusters.
% age = somme (Pi * age_cluster_i)

function age = decisionFCM(classifieur, img, m)
    sommeRatios = getSommeRatios(img);
    age = 0;
    exp = 1; % exp pour faire plus ou moins influer les coefficient des centres les plus proches
    
    for j = 1 : size(classifieur,1)
        if(isnan(classifieur(j,1)) == false)
            dist = sommeRatios - classifieur(j,2);
            coeff = 0;
            
            %calcul du degr� d'appartenance de img pour le centre k
            for k = 1 : size(classifieur,1)
                coeff = coeff +(dist / (sommeRatios - classifieur(k,2)))^(2 / (m-1));
            end
            
            % degr� d'appartenance Pi de l'image au cluster j
            Pi = 1 / coeff^exp;
            age = age + Pi * classifieur(j,1); 
        end
    end
end