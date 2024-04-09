clc;
clear all;
close all;
b=imread("C:\Users\19309\Desktop\document\信息隐藏技术\第三次实验\picture\Xiangling.png"); %读入图像，像素值在b中 
b=rgb2gray(b); %转换为灰度图像
figure(1); 
imshow(b); 
title('a原图象');
I=im2bw(b); % 转换为二值图像 
figure(2); 
L=dct2(I); % 进行离散余弦变换 
imshow(L); 
title('b DCT变换系数');
figure(3); 
mesh(L); % 画网格曲面图 
title('c DCT变换系数(立体视图)')