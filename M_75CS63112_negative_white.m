% M_75CS63112.m

% เขียนคำสั่ง Matlab เพื่อกลับภาพขาวเป็นดำ ดำเป็นขาว


clc
clear
[filename pathname] = uigetfile({'*.jpg';'*.png';'*.bmp'},'File Selector');
pathf = strcat(pathname, filename);
f = imread(pathf);
origin = f;

% https://www.mathworks.com/matlabcentral/answers/251519-i-need-negative-image
negative = 255 - origin;
% ------------------------------------------------ % 
% ------------- %
% https://www.geeksforgeeks.org/negative-of-an-image-in-matlab/

% levels of the 8-bit image
L = 2 ^ 8;

neg = (L-1) - origin;           % origin to black
white = (L-1) + origin;         % black to white
% -------------- %

% figure(1), imshow(f);
% figure(2), imshow(negative);
figure(1),
subplot(4,1,1), imagesc(f),title("Original");
axis off
subplot(4,1,2), imagesc(negative),title("Negative");
axis off
subplot(4,1,3), imagesc(white),title("Wthite");
axis off
subplot(4,1,4), imagesc(neg),title("White to Negative");
axis off

