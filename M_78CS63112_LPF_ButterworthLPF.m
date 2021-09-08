% M_78CS63112.m

% เขียนคำสั่ง Matlab เพื่อทำการปรับปรุงภาพในฟรีเคว็นซีโดเมน 
% เพื่อทำการฟิลเตอร์ความถี่ ต่ำผ่านแบบ (i) อุดมคติ และ (2) 
% บัตเตอร์เวิร์ท โดยที่ทรานส์เฟอร์ฟังก์ชันของฟิลเตอร์ความถี่ต่ำผ่านมีขนาด 256x256 
% และความถี่คัตออฟเท่ากับ 64 หน่วย
clc
clear
[filename pathname] = uigetfile({'*.jpg';'*.png';'*.bmp'},'File Selector');
pathf = strcat(pathname, filename);
f = imread(pathf);
% figure(1), subplot(3,1,1), imagesc(f), title("original");
figure(1), imshow(f), title("Original");

f = im2double(f);

% --------------------- LPF ----------------- %
F = fft2(f(:,:,1),64,64)
F = fftshift(F);

ct = [33 33];
H = zeros(64, 64);
for i=1:64
    for j=1:64
        if sqrt((i-ct(1))^2+(j-ct(2))^2)<10
            H(i,j)=1;
        end
    end
end

% subplot(3,1,2), surf(H), title("LPF")
figure(2), surf(H), title("LPF");

axis([0 63 0 63 0 1])
G = F.*H;
G = ifft2(G,64,64);
G = abs(G);
G = mat2gray(G);
% subplot(3,1,3), imagesc(G);colormap('gray'), title("Image after Ideal LPF")
figure(3), imagesc(G);colormap(gray), title("Image after Ideal LPF");

% --------------------- Low  Butterworth LPF ----------------- %

% figure(2),subplot(3,1,1), imagesc(f), colormap(gray), title("Original")
% figure(4), imagesc(f), colormap('gray')

axis off
aa = im2double(f);
FF = fft2(aa(:,:,1), 256, 256);
FF = fftshift(FF);
ct = [64, 64];   % ความถี่คัตออฟเท่ากับ 64 หน่วย
mask = zeros(256, 256);
n = 6;
d0 = 50;
for i=1:256
    for j=1:256
        mask(i,j) = 1/(1+[sqrt((i-ct(1))^2+(j-ct(2))^2)/d0]^(2*n));
    end
end
% subplot(3,1,2), surf(mask), title("Butterworth LPF")
figure(4), surf(mask), title("Butterworth LPF");

LL = FF.*mask;
pp = ifft2(LL, 256, 256);
output = abs(pp);
% subplot(3,1,3), imagesc(output), colormap(gray), title("image after Butterworth LPF")
figure(5), imagesc(output), colormap(gray), title("Image after Butterworth LPF");
axis off
