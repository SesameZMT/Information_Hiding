% lena 图像的一级小波变换 
clc;
clear all;
close all;
b = imread("C:\Users\19309\Desktop\document\信息隐藏技术\第三次实验\picture\Xiangling.png") ; 
a = im2bw(b) ; 
nbcol = size(a,1) ; 
[ca1,ch1,cv1,cd1] = dwt2(a,'db4') ; 
cod_ca1 = wcodemat(ca1,nbcol) ; 
cod_ch1 = wcodemat(ch1,nbcol) ; 
cod_cv1 = wcodemat(cv1,nbcol) ; 
cod_cd1 = wcodemat(cd1,nbcol) ; 
figure
image([cod_ca1,cod_ch1;cod_cv1,cod_cd1]) ;
% 图像的二级小波变换 
clc;
clear all;
b = imread("C:\Users\19309\Desktop\document\信息隐藏技术\第三次实验\picture\Xiangling.png") ; 
a = im2bw(b) ; 
nbcol = 512; 
nbc = 256;
[ca1, ch1, cv1, cd1] = dwt2(a, 'db4'); 
[ca2, ch2, cv2, cd2] = dwt2(ca1, 'db4');
cod_ca1 = wcodemat(ca1, nbc); 
cod_ch1 = wcodemat(ch1, nbc); 
cod_cv1 = wcodemat(cv1, nbc);
cod_cd1 = wcodemat(cd1, nbc);
cod_ca2 = wcodemat(ca2, nbcol); 
cod_ch2 = wcodemat(ch2, nbcol); 
cod_cv2 = wcodemat(cv2, nbcol);
cod_cd2 = wcodemat(cd2, nbcol);
tt = [cod_ca2,cod_ch2;cod_cv2,cod_cd2];
tt = imresize(tt, size(ca1));
figure
image([tt, cod_ch1; cod_cv1, cod_cd1]);