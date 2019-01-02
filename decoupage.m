% Découpage du visage

clear, clc;

img = imread('test.jpg');

faceDetector = vision.CascadeObjectDetector();
box = step(faceDetector, img);
imgBoxed = insertObjectAnnotation(img,'rectangle', box, 'Visage');
imgCropped = imcrop(img, box(1,:));


% Affichage
figure, 
subplot(1, 2, 1), imshow(imgBoxed);
subplot(1, 2, 2), imshow(imgCropped);