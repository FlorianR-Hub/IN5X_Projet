% Test de la détection de la tranche d'âge avec la méthode KPPV

close all;
clear, clc;

img = imread('31_1976_2007.jpg');

imgCropped = decoupage(img);
imgContours = contours(imgCropped);

trancheAge = detectionKPPV(img);
fprintf('Tranche d''âge: %d\n', trancheAge);

% Affichage
figure,
subplot(1, 3, 1), imshow(img), title('Original');
subplot(1, 3, 2), imshow(imgCropped), title('Rogné');
subplot(1, 3, 3), imshow(imgContours), title('Contours');

