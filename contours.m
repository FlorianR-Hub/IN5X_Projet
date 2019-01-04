% Renvoie les contours de l'image
function imgContours = contours(img)

imgGray = rgb2gray(img);
imgContours = edge(imgGray, 'Canny');

% Affichage
%figure, imshow(imgContours);

end