% decision de l'age d'une image
function age = decisionFCM(classifieur,img,m)
    feature = feature7(img);
    sumCoeff = 0;
    age = 0;
    for i = 1:size(classifieur,1)
            if( isnan(classifieur(i,1)) == false)
                dist = feature - classifieur(i,2);
                somme = 0;
                for j = 1:size(classifieur,1)
                    somme = somme +(dist/feature-classifieur(j,2))^(2/(m-1));
                end
                sumCoeff = sumCoeff + (1/somme);
                age = age + (1/somme) * classifieur(i,1); 
            end
    end
    age = age/ sumCoeff;
end