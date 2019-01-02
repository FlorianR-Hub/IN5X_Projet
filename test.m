close all;
clear, clc;

img = imread('test.jpg');

img = decoupage(img);
imgContours = contours(img);