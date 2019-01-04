% Récupération des parties du visage contenant des rides
function partiesVisage = traitement(imgDecoupee)
imgBoxed = imgDecoupee;
%% TODO SUPPRIMER LES imgBoxed

%% DETECTION YEUX GAUCHE && DROIT
eyes = vision.CascadeObjectDetector('LeftEye');
eyes.MergeThreshold = 7;
yeuxRectangle = step(eyes, imgDecoupee);
yeuxRectangle2 = yeuxRectangle(1 : 2, :);

if (yeuxRectangle(1, 1) > yeuxRectangle(2, 1))
    yeuxRectangle2 = yeuxRectangle(2, :);
    yeuxRectangle2 = [yeuxRectangle2 ; yeuxRectangle(1, :)];
end

centreOeilDroit  = yeuxRectangle2(1, 1 : 2) + yeuxRectangle2(1, 3 : 4) / 2;
centreOeilGauche = yeuxRectangle2(2, 1 : 2) + yeuxRectangle2(2, 3 : 4) / 2;
distanceMilieuYeux = norm(centreOeilGauche - centreOeilDroit); 
imgBoxed = insertObjectAnnotation(imgBoxed, 'rectangle', yeuxRectangle2, '');

%% FRONT
frontRectangle = [centreOeilDroit(1), centreOeilDroit(2) - distanceMilieuYeux * 0.9, distanceMilieuYeux, distanceMilieuYeux / 2];
imgBoxed = insertObjectAnnotation(imgBoxed, 'rectangle', frontRectangle, '', 'Color', {'cyan'});

%% JOUES GAUCHE && DROITE
oeilDroitRectangle = yeuxRectangle2(1, :);
joueDroiteRectangle = [oeilDroitRectangle(1), oeilDroitRectangle(2) + oeilDroitRectangle(4), oeilDroitRectangle(3), distanceMilieuYeux * 0.4];
oeilGaucheRectangle = yeuxRectangle2(2, :);
joueGaucheRectangle = [oeilGaucheRectangle(1), oeilGaucheRectangle(2) + oeilGaucheRectangle(4), oeilGaucheRectangle(3), distanceMilieuYeux * 0.4];

imgBoxed = insertObjectAnnotation(imgBoxed, 'rectangle', [joueDroiteRectangle; joueGaucheRectangle], '', 'Color', {'cyan'});

%% ENTRE YEUX
entreYeuxRectangle(1) = oeilDroitRectangle(1) + oeilDroitRectangle(3);
entreYeuxRectangle(2) = frontRectangle(2) + frontRectangle(4); %-1
entreYeuxRectangle(3) = oeilGaucheRectangle(1) - entreYeuxRectangle(1);
entreYeuxRectangle(4) = distanceMilieuYeux * 0.4;

imgBoxed = insertObjectAnnotation(imgBoxed, 'rectangle', entreYeuxRectangle, '', 'Color', {'cyan'});

%% AFFICHAGE
%figure, 
%subplot(1, 2, 1), imshow(imgBoxed);
%subplot(1, 2, 2), imshow(imgDecoupee);

%% RETOUR
partiesVisage = [frontRectangle ; entreYeuxRectangle ; joueDroiteRectangle ; joueGaucheRectangle];

end


