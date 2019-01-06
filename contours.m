% Renvoie les contours de l'image
function imgContours = contours(img)

[m n c]=size(img);

if c==3
    imgGray = rgb2gray(img);
else
    imgGray = img;
end

imgContours = edge(imgGray, 'Canny');
%imgContours = edge(imgGray, 'log');

% Affichage
%figure,
%subplot(1, 2, 1), imshow(img);
%subplot(1, 2, 2), imshow(imgContours);

end