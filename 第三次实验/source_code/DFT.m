clc;
clear all;
close all;
b=imread("C:\Users\19309\Desktop\document\信息隐藏技术\第三次实验\picture\Xiangling.png"); %读入图像，像素值在b中
b=rgb2gray(b); %转换为灰度图像
figure(1);
I=im2bw(b);
imshow(b);
title('a原图像');

figure(2);
fa=fft2(I); %使用fft函数进行快速傅立叶变换
ffa=fftshift(fa); %fftshift函数调整fft函数的输出顺序，将零频位置移到到频谱的中心
imshow(ffa,[200,225]);
title('b幅度谱');

figure(3);
l=mesh(abs(ffa)); %画网格曲面图
title('c幅度谱的能量分布');