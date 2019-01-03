% calcul de la feature du visage
function sommeRatios = feature7(img)        
        imgCropped = decoupage(img);
        imgContours = contours(imgCropped);
        partiesVisage = traitement(imgCropped);

        imgBoxed = uint8(imgContours * 255);
        sommeRatios = 0;

        for j = 1 : size(partiesVisage, 1)
            box = partiesVisage(j, :);
            imgBoxed = insertObjectAnnotation(imgBoxed, 'rectangle', box, '');
            partieVisage = imcrop(imgContours, box(1, :));

            whitePixels = sum(sum(partieVisage == 1));
            totalPixels = sum(sum(partieVisage == 0)) + whitePixels;
            ratio = whitePixels / totalPixels;

            sommeRatios = sommeRatios + ratio;
        end
end        