% M_710CS63112.m

% เขียนคำสั่ง Matlab เพื่อทำการปิดบังความไม่คม (Unsharp Masking)
clc
clear
[filename pathname] = uigetfile({'*.jpg';'*.png';'*.bmp'},'File Selector');
pathf = strcat(pathname, filename);
f = imread(pathf);

% Sharpen image, specifying the radius and amount parameters.
G = imsharpen(f, 'Radius', 2, 'Amount', 1);

figure("Name", "specifying the radius and amount parameters.")
subplot(4,1,1), imagesc(f), title("Original Image"), axis off;

subplot(4,1,2), imhist(f), title("Origin Hist"), axis off;

subplot(4,1,3), imagesc(G), title("After imsharpen Image"), axis off;
subplot(4,1,4), imhist(G), title("After imsharpen Hist"), axis off;


