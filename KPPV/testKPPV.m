% Test de la d�tection de la tranche d'�ge avec la m�thode KPPV

close all;
clear, clc;

img = imread('31_1976_2007.jpg');

imgCropped = decoupage(img);
imgContours = contours(imgCropped);

trancheAge = detectionKPPV(img);
fprintf('Tranche d''�ge: %d\n', trancheAge);

% Affichage
figure,
subplot(1, 3, 1), imshow(img), title('Original');
subplot(1, 3, 2), imshow(imgCropped), title('Rogn�');
subplot(1, 3, 3), imshow(imgContours), title('Contours');

