% Calcul de la somme des ratios de la feature du visage
%
% Récupère le ratio correspondant au nombre de pixels blancs
% par rapport au nombre de pixels noirs sur les parties du visage 
% selectionnées et les additionne
function sommeRatios = getSommeRatios(img)  

    % Découpe l'image pour ne garder que le visage
    imgCropped = decoupage(img);

    % Fait apparaitre les rides sous formes de contours
    imgContours = contours(imgCropped);

    % Récupère les coordonnées des rectangles correspondant aux
    % parties du visage selectionnées
    partiesVisage = getCoordPartiesVisage(imgCropped);

    imgBoxed = uint8(imgContours * 255);
    sommeRatios = 0;

    for j = 1 : size(partiesVisage, 1)
        box = partiesVisage(j, :);
        imgBoxed = insertObjectAnnotation(imgBoxed, 'rectangle', box, '');
        partieVisage = imcrop(imgContours, box(1, :));

        % Additionne les pixels blancs
        whitePixels = sum(sum(partieVisage == 1));
        % Calcul le nombre total de pixels
        totalPixels = sum(sum(partieVisage == 0)) + whitePixels;
        ratio = whitePixels / totalPixels;

        sommeRatios = sommeRatios + ratio;
    end
        
    % Affichage
    %figure, 
    %subplot(1, 2, 1), imshow(img);
    %subplot(1, 2, 2), imshow(imgBoxed);
end