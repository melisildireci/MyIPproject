%% 0
para= imread('coins.png');
imshow(para);
d=imdistline;
[centers, radii]=imfindcircles(para,[20 30]);
imshow(para);
hold on;
viscircles(centers, radii,'EdgeColor','b');


%% 1
I= imread('coins.png');
level= graythresh(I);
bw= im2bw(I, level);
imshow(bw);
figure(1);
d=imdistline;
[centers, radii]=imfindcircles(bw,[20 30]);
imshow(bw);
hold on;
viscircles(centers, radii,'EdgeColor','b');


 
 %% 3
 bw = imfill(bw, 'holes');
 bw = bwareaopen(bw,100);
 imshow(bw);
 figure(3);
 

 
 
 %% 4
se =strel('disk', 3);
bw = imerode(bw, se);
imshow(bw);
figure(4);





[B,L] = bwboundaries(bw);
stats = regionprops(bw , 'Area' , 'Centroid');
imshow(para);
toplam = 0;
C= cell2mat(B)
for n=1: C
    
    a= stats(n).Area;
    centroid= stats(n).Centroid;
    if a>1200
        
        toplam= toplam +1;
        text(centroid(1) , centroid(2), '1TL');
    
    elseif a>800 && a<1050
        toplam = toplam+0.5;
        text(centroid(1) , centroid(2) , '50krs');
        
    elseif a>500 && a<600
        toplam = toplam+ 0.25;
        text(centroid(1), centroid(2), '25krs');
        
    elseif a>350 && a<400
        toplam = toplam + 0.10;
        text(centroid(1), centroid(2), '10krs');
        
    else
        toplam = toplam + 0.05;
        text(centroid(1), centroid(2), '5krs');
        
        
        
       
        
            
        
        
    end
    
end
    Title = (['toplam para miktari =' num2str(toplam) , 'TL']); 





 