% M_77CS63112.m

% เขียนคำสั่ง Matlab เพื่อทำการฟิลเตอร์แบบค่ามีเดียน (Median Filtering) โดยใช้ขนาดวินโดว์ 5x5
% https://www.researchgate.net/figure/Median-Filter-of-3x3-5x5-7x7-9x9-and-11x11-of-Sliding-Window-Concept_fig4_282295704

clc
clear
[filename pathname] = uigetfile({'*.jpg';'*.png';'*.bmp'},'File Selector');
pathf = strcat(pathname, filename);
f = imread(pathf);
f = rgb2gray(f);
A = imnoise(f,'salt & pepper');

% Ref 
% https://www.imageeprocessing.com/2011/03/matlab-program-2d-median-filtering-for.html

figure(1), imshow(A);
A = 255*im2double(A);
%PAD THE MATRIX WITH ZEROS ON ALL SIDES
modifyA=zeros(size(A)+2);
B=zeros(size(A));

%COPY THE ORIGINAL IMAGE MATRIX TO THE PADDED MATRIX
        for x=1:size(A,1)
            for y=1:size(A,2)
                modifyA(x+1,y+1)=A(x,y);
            end
        end
      %LET THE WINDOW BE AN ARRAY
      %STORE THE 3-by-3 NEIGHBOUR VALUES IN THE ARRAY
      %SORT AND FIND THE MIDDLE ELEMENT
       
for i= 1:size(modifyA,1)-2
    for j=1:size(modifyA,2)-2
        window=zeros(9,1);
        inc=1;
        for x=1:3
            for y=1:3
                window(inc)=modifyA(i+x-1,j+y-1);
                inc=inc+1;
            end
        end
       
        med=sort(window);
        %PLACE THE MEDIAN ELEMENT IN THE OUTPUT MATRIX
        B(i,j)=med(5);
       
    end
end
%CONVERT THE OUTPUT MATRIX TO 0-255 RANGE IMAGE TYPE
B=uint8(B);
title('IMAGE AFTER MEDIAN FILTERING');
figure,imshow(B);



