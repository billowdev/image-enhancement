% M_76CS63112.m
% เขียนคำสั่ง Matlab เพื่อทำการเฉลี่ยแบบสเปเชียล (Spatial Averaging) โดยใช้วินโดว์ในรูป 
clc
clear
[filename pathname] = uigetfile({'*.jpg';'*.png';'*.bmp'},'File Selector');
pathf = strcat(pathname, filename);
f = imread(pathf);

% f = rgb2gray(f);

% https://www.dynamsoft.com/blog/insights/image-processing/image-processing-101-spatial-filters-convolution/
w = zeros(3,3);
w = 1/9*[1 1 1; 1 1 1; 1 1 1;];
y = imfilter(f,2);

subplot(2,1,1);
imshow(f);
title("Original");
subplot(2,1,2);
imshow(y);
title("Spatial Average");


