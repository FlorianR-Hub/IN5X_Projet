% algorithme Fuzzy C Mean
% retourne les clusters + age respectif

% Input
% c : nombre de clusters à choisir
% m : nombre réel > 1 à choisir
% e : critère d'arrêt, réel entre 0 et 1 à choisir
% X : vecteur, valeurs de la base d'apprentissage (ratios)
% XA : vecteur, age associé aux valeurs dans X

% Output
% C : vecteur, valeurs des clusters
% CA : vecteur, âge moyen representé par le cluster

%Initialisation random des coefficient
function [CA, C] = FCM (c,m,e,X,XA)

C = zeros(c,1);
CA = zeros(c,1);

% W : matrice NxC , coefficient d'appartenance de l'image i au cluster j
W = rand(size(X,1),c);

while true
    %update centres
    for j = 1:size(C,1)
        numerateur = 0;
        denominateur = 0;
        for i = 1:size(X,1)
            numerateur = numerateur + W(i,j)^m * X(i);
            denominateur = denominateur + W(i,j)^m;
        end
        C(j) = numerateur/denominateur;
    end

    %update coefficient
    Wprevious = W;
    for i = 1:size(X,1)
        for j = 1:size(C,1)
            dist = X(i) - C(j);
            somme = 0;
            for k = 1:size(C,1)
                somme = somme + (dist/(X(i)-C(k)))^(2/(m-1));
            end 
            W(i,j) = 1/somme;
        end
    end

    Wprevious = W-Wprevious;
    maximumDiff = max(max(Wprevious));
    if(maximumDiff < e)
        break;
    end
end

%age moyen de chaque cluster
M = zeros(c,2);

for i = 1:size(X,1)
    L = W(i,:);
    [~,indice] = max(L);
    M(indice,1) = M(indice,1) + 1;
    M(indice,2) = M(indice,2) + XA(i);
end

for i = 1:size(C,1)
    CA(i) = M(i,2) / M(i,1);
end 


end


