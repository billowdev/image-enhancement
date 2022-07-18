% M_75CS63112.m

% เขียนคำสั่ง Matlab เพื่อกลับภาพขาวเป็นดำ ดำเป็นขาว

clc
clear
[filename pathname] = uigetfile({'*.jpg';'*.png';'*.bmp'},'File Selector');
pathf = strcat(pathname, filename);
origin = imread(pathf);

negative = 255 - origin; % origin to black
white = imcomplement(negative)   % black to white
% -------------- %

figure(1), imshow(origin)
figure(2), imshow(negative)
figure(3), imshow(white)



