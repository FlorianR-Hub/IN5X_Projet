function supprImageErreurs(folder)
imagefiles = dir(fullfile(folder,'*.jpg'));
nbfail = 0;
for i = 1:size(imagefiles,1)
    try
        %feature =getSommeRatios(imread(fullfile(folder,imagefiles(i).name))); CPU
        img = imread(fullfile(folder,imagefiles(i).name));
        imgCropped = decoupage(img);
        partiesVisage = getCoordPartiesVisage(imgCropped);
        if(any(partiesVisage(:) <0))
            nbfail = nbfail + 1;
            delete(fullfile(folder,imagefiles(i).name));
        end
    catch %ME
         nbfail = nbfail + 1;
         delete(fullfile(folder,imagefiles(i).name));
    end
end
fprintf('nb fail = %d/%d',nbfail,size(imagefiles,1));