% M_79CS63112

% เขียนคำสั่ง Matlab เพื่อทำการปรับปรุงภาพในฟรีเคว็นซีโดเมน 
% เพื่อทำการฟิลเตอร์ความถี่สูงผ่าน แบบ(i) อุดมคติ และ (2) บัตเตอร์เวิร์ท 
% โดยที่ทรานส์เฟอร์ฟังก์ชันของฟิลเตอร์ความถี่สูงผ่านมีขนาด 256x256 
% และความถี่คัตออฟเท่ากับ 64 หน่วย

clc
clear
[filename pathname] = uigetfile({'*.jpg';'*.png';'*.bmp'},'File Selector');
pathf = strcat(pathname, filename);
f = imread(pathf);
% figure(1), subplot(3,1,1), imagesc(f), title("original");
figure(1), imagesc(f), title("Original");
f = im2double(f);

% --------------------- HPF ----------------- %
F = fft2(f(:,:,1),256,256)
F = fftshift(F);

ct = [64 64];
H = zeros(256, 256);
for i=1:256
    for j=1:256
        if sqrt((i-ct(1))^2+(j-ct(2))^2)<10
            H(i,j)=1;
        end
    end
end

% subplot(3,1,2), surf(H), title("HPF")
figure(2), surf(H), title("HPF");

axis([0 63 0 63 0 1])
G = F.*H;
G = ifft2(G,256,256);
G = abs(G);
G = mat2gray(G);

% subplot(3,1,3), imagesc(G);colormap('gray'), title("Image after Ideal HPF")
figure(3), imagesc(G);colormap('gray'), title("Image after Ideal HPF")


% --------------------- Butterworth HPF ----------------- %


% figure(1), image(f), colormap(gray)
% figure(3), imagesc(f), colormap(gray), 
axis off
% figure(4),
% subplot(3,1,1), imagesc(f), title("Original");
FF = fft2(f(:,:,1),256,256);
FF = fftshift(FF);
ct = [64,64]; %cut off
mask = zeros(256,256);
n = 6;
d0 = 50;
for i=1:256
    for j=1:256
        mask(i,j) = 1/(1+[d0/sqrt((i-ct(1))^2+(j-ct(2))^2)]^(2*n));
    end
end

% subplot(3,1,2), surf(mask), title("Butterworth HPF")
figure(4), surf(mask), title("Butterworth HPF");

SS = FF.*mask;
kk = ifft2(SS,256,256);
output = abs(kk);
% subplot(3,1,3), imagesc(output), colormap(gray), title("After Butterworth HPF")
figure(5), imagesc(output), colormap(gray), title("Afer Butterworth HPF");
axis off

