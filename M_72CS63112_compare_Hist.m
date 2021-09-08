% M_72CS63112.m
% เปรียบเทียบฮิสโตแกรมของภาพในข้อ (1) กับฮิสโตแกรมที่ได้จากการใช้คำสั่ง imhist

clc
clear
[filename pathname] = uigetfile({'*.png'; '*.jpg'; '*.bmp'}, 'File Selector');
pathf = strcat(pathname, filename);
f = imread(pathf);

figure("Name", "Original image and histogram")
subplot(2,1,1), imagesc(f);
subplot(2,1,2), imhist(f);
hist_vector = zeros(1,256, 10); % เตรียมเว็คเตอร์สำหรับใส่ค่าที่นับได้จำนวน 10 ช่วง


bin=zeros(1,256);

for i=1:size(f,1)
    for j=1:size(f,2)
        if f(i,j) > 0 & f(i,j) <= 255
           bin(f(i,j,1)+1) = bin(f(i,j,1)+1)+1;
        end

    end
end


subplot(1,2,1)
grayLevels = 0 : 255;
bar(grayLevels, bin, 'BarWidth', 1, 'FaceColor', 'b');
xlabel('Gray Level', 'FontSize', 7);
ylabel('Pixel Count', 'FontSize', 7);
title('Custom_Histogram', 'FontSize', 7);

subplot(1,2,2)
imhist(f)
title("Imhist")


