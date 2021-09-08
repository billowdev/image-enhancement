% M_71CS63112.m
% Keyword
% image extract intensity matlab

% เขียนคำสั่ง Matlab เพื่อหาและพล็อตฮิสโตแกรมของภาพ โดยแบ่งระดับเทาออกเป็น 10 ช่วง
% ข้อเสนอแนะ
clc
clear
[filename pathname] = uigetfile({'*.png'; '*.jpg'; '*.bmp'}, 'File Selector');
pathf = strcat(pathname, filename);
f = imread(pathf);

figure("Name", "Original image and histogram")
subplot(2,1,1), imagesc(f);
subplot(2,1,2), imhist(f);
hist_vector = zeros(1,256, 10); % เตรียมเว็คเตอร์สำหรับใส่ค่าที่นับได้จำนวน 10 ช่วง

bin1 = zeros(1,256);
bin2 = zeros(1,256);
bin3 = zeros(1,256);
bin4 = zeros(1,256);
bin5 = zeros(1,256);
bin6 = zeros(1,256);
bin7 = zeros(1,256);
bin8 = zeros(1,256);
bin9 = zeros(1,256);
bin10 = zeros(1,256);


for i=1:size(f,1)
    for j=1:size(f,2)
        if f(i,j) > 0 & f(i,j) <= 25
            bin1(f(i,j,1)+1) = bin1(f(i,j,1)+1)+1;
            hist_vector(:,:,1) = bin1;
        end

        if f(i,j) > 25 & f(i,j) <= 50
            bin2(f(i,j,1)+1) = bin2(f(i,j,1)+1)+1;
            hist_vector(:,:,2) = bin2;
        end

        if f(i,j) > 50 & f(i,j) <= 75
            bin3(f(i,j,1)+1) = bin3(f(i,j,1)+1)+1;
            hist_vector(:,:,3) = bin3;
        end

        if f(i,j) > 75 & f(i,j) <= 100
            bin4(f(i,j,1)+1) = bin4(f(i,j,1)+1)+1;
            hist_vector(:,:,4) = bin4;
        end

        if f(i,j) > 100 & f(i,j) <= 125
            bin5(f(i,j,1)+1) = bin5(f(i,j,1)+1)+1;
            hist_vector(:,:,5) = bin5;
        end

        if f(i,j) > 125 & f(i,j) <= 150
            bin6(f(i,j,1)+1) = bin6(f(i,j,1)+1)+1;
            hist_vector(:,:,6) = bin6;
        end

        if f(i,j) > 150 & f(i,j) <= 175
            bin7(f(i,j,1)+1) = bin7(f(i,j,1)+1)+1;
            hist_vector(:,:,7) = bin7;
        end

        if f(i,j) > 175 & f(i,j) <= 200
            bin8(f(i,j,1)+1) = bin8(f(i,j,1)+1)+1;
            hist_vector(:,:,8) = bin8;
        end

        if f(i,j) > 200 & f(i,j) <= 225
            bin9(f(i,j,1)+1) = bin9(f(i,j,1)+1)+1;
            hist_vector(:,:,9) = bin9;
        end

        if f(i,j) > 220 & f(i,j) <= 250
            bin10(f(i,j,1)+1) = bin10(f(i,j,1)+1)+1;
            hist_vector(:,:,10) = bin10;
        end
    end
end

figure("Name", "ten range of the histogram")
for iTem=1:10
    subplot(5,2,iTem)
    grayLevels = 0 : 255;
    bar(grayLevels, hist_vector(:,:,iTem), 'BarWidth', 1, 'FaceColor', 'b');
    xlabel('Gray Level', 'FontSize', 7);
    ylabel('Pixel Count', 'FontSize', 7);
    title('Histogram', 'FontSize', 7);
end




