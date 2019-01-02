% Récupération des parties du visage contenant des rides
function partiesVisage = traitement(imgCropped)

rect1 = [0 0 10 10];
rect2 = [100 100 50 50];
rect3 = [120 20 70 50];
rect4 = [100 150 70 50];
partiesVisage = [rect1 ; rect2 ; rect3 ; rect4];

end


