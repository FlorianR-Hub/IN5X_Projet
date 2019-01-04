% Renvoie les contours de l'image
function imgContours = contours(img)

[m n c]=size(img);

if c==3
    imgGray = rgb2gray(img);
else
    imgGray = img;
end

imgContours = edge(imgGray, 'Canny');

% Affichage
%figure, imshow(imgContours);

end