close all;
clear, clc;

img = imread('214_36_1975_2011.jpg');

imgCropped = decoupage(img);
imgContours = contours(imgCropped);

% Affichage
figure,
subplot(1, 3, 1), imshow(img), title('Original');
subplot(1, 3, 2), imshow(imgCropped), title('Rogné');
subplot(1, 3, 3), imshow(imgContours), title('Contours');


trancheAge = detectionKPPV(img);