% Clear Memory and Command window
clc;
clear all;
close all;
img = imread("C:\Users\19309\Desktop\document\信息隐藏技术\第五次实验\picture\Xiangling_gray.png");
%k = input("请输入n的值：");
for k=1:7
    [a,b]=size(img);
    
    for n=1:k
        for i=1:a
            for j=1:b
                img(i,j)=bitset(img(i,j),n,0);
            end
        end 
    end
    
    figure;
    imshow(img,[]);
    title(['去除前',num2str(k),'个位平面']);
end