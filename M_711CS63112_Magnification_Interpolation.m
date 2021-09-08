% M_711CS63112.m

% เขียนคำสั่ง Matlab เพื่อทำการขยาย (Magnification) 
% หรือ ซูม อันดับที่ 4 โดยใช้เทคนิค (i) การซ้ำ และ (ii) 
% การอินเตอร์โพเลชันแบบเชิงเส้น
clc
clear
[filename pathname] = uigetfile({'*.jpg';'*.png';'*.bmp'},'File Selector');
pathf = strcat(pathname, filename);
f = imread(pathf);

r = f(:,:,1); g = f(:,:,2); b = f(:,:,3);
z = 4;
zr = zeros(z*size(f,1), z*size(f,2));
zg = zeros(z*size(f,1), z*size(f,2));
zb = zeros(z*size(f,1), z*size(f,2));

for i=1:size(f,1)
    for j=1:size(f,2)
        zr(z*i,z*j)=r(i,j);
        zg(z*i,z*j)=g(i,j);
        zb(z*i,z*j)=b(i,j);
    end
end

% ---------- Convolution ---------- %
figure(1), imagesc(zr), colormap(gray)
title("Image");
h = (1/2)*ones(3,3);h(2,2)=1;
h(1,1)=1/4; h(1,3)=1/4;
h(3,1)=1/4; h(3,3)=1/4;

er = conv2(zr,h,'same');
eg = conv2(zg,h,'same');
eb = conv2(zb,h,'same');

fr = conv2(er,h,'same');
fg = conv2(eg,h,'same');
fb = conv2(eb,h,'same');

gr = conv2(fr,h,'same');
gg = conv2(fg,h,'same');
gb = conv2(fb,h,'same');

e = cat(3,gr,gg,gb);
e = mat2gray(e);
figure(2), imshow(e)
title("Image after Convolution");

f1 = im2double(f(:,:,1)); 
f2 = im2double(f(:,:,2)); 
f3 = im2double(f(:,:,3)); 

% แทรก interpolated values (by repeatedly dividing)
% ช่วงเวลาระหว่างจุดต่างๆ ของกริด ทำให้ภาพชัดแล้ว(refined) 2 ครั้งในแต่ละมิติ
% Fq = interp2(f,4);
GR = interp2(f1,4);
GB = interp2(f2,4);
GG = interp2(f3,4);
E = cat(3, GR, GG, GB);
E = mat2gray(E);
%---------------------------% 
% Insert interpolated values by repeatedly dividing the intervals 
% between points of the refined grid five times in each dimension.
figure(3),
imagesc(E);
title("Interpolation");