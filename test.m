%img = imread('30_1977_2007_ 2590.jpg');
%getCoordPartiesVisage(decoupage(img));
close all;
list = dir(fullfile('database', '40', '*.jpg'));
for i = 1:size(list,1)
        getCoordPartiesVisage(decoupage(imread(fullfile('database','40',list(i).name))));
end