close all;
clear, clc;

img = imread('214_36_1975_2011.jpg');

imgCropped = decoupage(img);
imgContours = contours(imgCropped);

% Affichage
figure, 
subplot(1, 2, 1), imshow(imgCropped), title('Visage');
subplot(1, 2, 2), imshow(imgContours), title('Contours');
