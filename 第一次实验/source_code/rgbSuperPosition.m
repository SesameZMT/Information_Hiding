clear all;
while true
    op = input("请选择想要的功能：\n1、加密\n2、解密\n3、退出\n",'s');
    if op == '1'
        path = input("请输入要加密的图片：",'s');
        path1 = input("请输入要分存的图片1：",'s');
        path2 = input("请输入要分存的图片2：",'s');
        rgbimage = imresize(imread(path),0.5);
        rgbimage1 = imresize(imread(path1),0.5);
        rgbimage2 = imresize(imread(path2),0.5);

        rimage=rgbimage(:,:,1);%提取红色分量 
        gimage=rgbimage(:,:,2);%提取绿色分量 
        bimage=rgbimage(:,:,3);%提取蓝色分量

        rimage1=rgbimage1(:,:,1);%提取红色分量 
        gimage1=rgbimage1(:,:,2);%提取绿色分量 
        bimage1=rgbimage1(:,:,3);%提取蓝色分量

        rimage2=rgbimage2(:,:,1);%提取红色分量 
        gimage2=rgbimage2(:,:,2);%提取绿色分量 
        bimage2=rgbimage2(:,:,3);%提取蓝色分量
        figure;
        subplot(3,3,1);
        imshow(rimage);
        subplot(3,3,4);
        imshow(rimage1);
        subplot(3,3,7);
        imshow(rimage2);
        title("R分量");
        subplot(3,3,2);
        imshow(gimage);
        subplot(3,3,5);
        imshow(gimage1);
        subplot(3,3,8);
        imshow(gimage2);
        title("G分量");
        subplot(3,3,3);
        imshow(bimage);
        subplot(3,3,6);
        imshow(bimage1);
        subplot(3,3,9);
        imshow(bimage2);
        title("B分量");
        %灰度图变二值图
        originr = turn_to_bw(rimage);
        origing = turn_to_bw(gimage);
        originb = turn_to_bw(bimage);

        originr1 = turn_to_bw(rimage1);
        origing1 = turn_to_bw(gimage1);
        originb1 = turn_to_bw(bimage1);

        originr2 = turn_to_bw(rimage2);
        origing2 = turn_to_bw(gimage2);
        originb2 = turn_to_bw(bimage2);
        
        origin(:,:,1)=originr;
        origin(:,:,2)=origing;
        origin(:,:,3)=originb;

        origin1(:,:,1)=originr1;
        origin1(:,:,2)=origing1;
        origin1(:,:,3)=originb1;

        origin2(:,:,1)=originr2;
        origin2(:,:,2)=origing2;
        origin2(:,:,3)=originb2;
        figure;
        subplot(1,3,1);
        imshow(origin);
        subplot(1,3,2);
        imshow(origin1);
        subplot(1,3,3);
        imshow(origin2);
        title("原图的二值化");
        filepath=pwd;
        cd('C:\Users\19309\Desktop\document\信息隐藏技术\第一次实验\picture')
        if ~exist('rgbimages','dir')
            mkdir('rgbimages')
        end
        imwrite(origin,'rgbimages/rgbimageS.bmp');
        imwrite(origin1,'rgbimages/rgbimageS1.bmp');
        imwrite(origin2,'rgbimages/rgbimageS2.bmp');
        cd(filepath)
        %r、g、b分别分开再合并
        [image1,image2] = divide(originr,originr1,originr2);
        [image3,image4] = divide(origing,origing1,origing2);
        [image5,image6] = divide(originb,originb1,originb2);
        image7(:,:,1)=image1;
        image7(:,:,2)=image3;
        image7(:,:,3)=image5;
        image8(:,:,1)=image2;
        image8(:,:,2)=image4;
        image8(:,:,3)=image6;
        figure;
        imshow(image7);
        title("加密图1");
        figure;
        imshow(image8);
        title("加密图2");
        filepath=pwd;
        cd('C:\Users\19309\Desktop\document\信息隐藏技术\第一次实验\picture')
        if ~exist('rgbimages','dir')
            mkdir('rgbimages')
        end
        imwrite(image7,'rgbimages/encodeimageS1.bmp');
        imwrite(image8,'rgbimages/encodeimageS2.bmp');
        cd(filepath)
    elseif op == '2'
        path1 = input("请输入要解密的图片1：",'s');
        origin1 = imread(path1);
        origin1r=origin1(:,:,1);
        origin1g=origin1(:,:,2);
        origin1b=origin1(:,:,3);
        path2 = input("请输入要解密的图片2：",'s');
        origin2 = imread(path2);
        origin2r=origin2(:,:,1);
        origin2g=origin2(:,:,2);
        origin2b=origin2(:,:,3);
        mergeimager = merge(origin1r,origin2r);
        mergeimageg = merge(origin1g,origin2g);
        mergeimageb = merge(origin1b,origin2b);
        mergeimage(:,:,1)=mergeimager;
        mergeimage(:,:,2)=mergeimageg;
        mergeimage(:,:,3)=mergeimageb;
        figure;
        imshow(mergeimage);
        title("解密图");
        cd('C:\Users\19309\Desktop\document\信息隐藏技术\第一次实验\picture')
        if ~exist('rgbimages','dir')
            mkdir('rgbimages')
        end
        imwrite(mergeimage,'rgbimages/decodeimageS.bmp');
        cd(filepath)
    elseif op == '3'
        break
    end
end

function [image1,image2] = divide(origin,origin1,origin2)
    %init
    Size=size(origin);
    x=Size(1);
    y=Size(2);
    image1=zeros(2*x,2*y);
    image1(:,:)=255;
    image2=zeros(2*x,2*y);
    image2(:,:)=255;
    
    %take image1 as first
    for i = 1:x
        for j = 1:y
            key = randi(4);
            son_x=1+2*(i-1);
            son_y=1+2*(j-1);
            switch key
                case 1
                    if origin(i,j)==0 && origin1(i,j)==0 && origin2(i,j)==0  %黑  黑  黑
                        image1(son_x,son_y)=0;
                        image1(son_x+1,son_y)=0;
                        image1(son_x+1,son_y+1)=0;
    
                        image2(son_x,son_y+1)=0;
                        image2(son_x+1,son_y)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    elseif origin(i,j)==0 && origin1(i,j)==0 && origin2(i,j)~=0  %黑 黑 白
                        image1(son_x,son_y+1)=0;
                        image1(son_x+1,son_y)=0;
                        image1(son_x+1,son_y+1)=0;
    
                        image2(son_x,son_y)=0;
                        image2(son_x,son_y+1)=0;
    
                    elseif origin(i,j)==0 && origin1(i,j)~=0 && origin2(i,j)==0  %黑 白 黑
                        image1(son_x+1,son_y)=0;
                        image1(son_x+1,son_y+1)=0;
    
                        image2(son_x,son_y)=0;
                        image2(son_x,son_y+1)=0;
                        image2(son_x+1,son_y)=0;
    
                    elseif origin(i,j)==0 && origin1(i,j)~=0 && origin2(i,j)~=0  %黑 白 白
                        image1(son_x+1,son_y)=0;
                        image1(son_x+1,son_y+1)=0;
    
                        image2(son_x,son_y)=0;
                        image2(son_x,son_y+1)=0;
    
                    elseif origin(i,j)~=0 && origin1(i,j)==0 && origin2(i,j)==0  %白 黑 黑
                        image1(son_x,son_y)=0;
                        image1(son_x,son_y+1)=0;
                        image1(son_x+1,son_y)=0;
    
                        image2(son_x,son_y)=0;
                        image2(son_x,son_y+1)=0;
                        image2(son_x+1,son_y)=0;
    
                    elseif origin(i,j)~=0 && origin1(i,j)==0 && origin2(i,j)~=0  %白 黑 白
                        image1(son_x,son_y)=0;
                        image1(son_x,son_y+1)=0;
                        image1(son_x+1,son_y)=0;
    
                        image2(son_x,son_y)=0;
                        image2(son_x,son_y+1)=0;
    
                    elseif origin(i,j)~=0 && origin1(i,j)~=0 && origin2(i,j)~=0  %白 白 白
                        image1(son_x,son_y+1)=0;
                        image1(son_x+1,son_y+1)=0;
    
                        image2(son_x,son_y)=0;
                        image2(son_x,son_y+1)=0;
    
                    elseif origin(i,j)~=0 && origin1(i,j)~=0 && origin2(i,j)==0  %白 白 黑
                        image1(son_x+1,son_y)=0;
                        image1(son_x+1,son_y+1)=0;
    
                        image2(son_x,son_y+1)=0;
                        image2(son_x+1,son_y)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    end
                case 2
                    if origin(i,j)==0 && origin1(i,j)==0 && origin2(i,j)==0  %黑  黑  黑
                        image1(son_x,son_y)=0;
                        image1(son_x,son_y+1)=0;
                        image1(son_x+1,son_y)=0;
    
                        image2(son_x,son_y)=0;
                        image2(son_x,son_y+1)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    elseif origin(i,j)==0 && origin1(i,j)==0 && origin2(i,j)~=0  %黑 黑 白
                        image1(son_x,son_y)=0;
                        image1(son_x+1,son_y)=0;
                        image1(son_x+1,son_y+1)=0;
    
                        image2(son_x,son_y+1)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    elseif origin(i,j)==0 && origin1(i,j)~=0 && origin2(i,j)==0  %黑 白 黑
                        image1(son_x,son_y)=0;
                        image1(son_x+1,son_y)=0;
    
                        image2(son_x,son_y+1)=0;
                        image2(son_x+1,son_y)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    elseif origin(i,j)==0 && origin1(i,j)~=0 && origin2(i,j)~=0  %黑 白 白
                        image1(son_x,son_y)=0;
                        image1(son_x+1,son_y)=0;
    
                        image2(son_x,son_y+1)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    elseif origin(i,j)~=0 && origin1(i,j)==0 && origin2(i,j)==0  %白 黑 黑
                        image1(son_x,son_y)=0;
                        image1(son_x,son_y+1)=0;
                        image1(son_x+1,son_y+1)=0;
    
                        image2(son_x,son_y)=0;
                        image2(son_x,son_y+1)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    elseif origin(i,j)~=0 && origin1(i,j)==0 && origin2(i,j)~=0  %白 黑 白
                        image1(son_x,son_y)=0;
                        image1(son_x,son_y+1)=0;
                        image1(son_x+1,son_y+1)=0;
    
                        image2(son_x,son_y)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    elseif origin(i,j)~=0 && origin1(i,j)~=0 && origin2(i,j)~=0  %白 白 白
                        image1(son_x,son_y)=0;
                        image1(son_x,son_y+1)=0;
    
                        image2(son_x,son_y)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    elseif origin(i,j)~=0 && origin1(i,j)~=0 && origin2(i,j)==0  %白 白 黑
                        image1(son_x,son_y)=0;
                        image1(son_x,son_y+1)=0;
    
                        image2(son_x,son_y)=0;
                        image2(son_x,son_y+1)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    end
    
                case 3
                    if origin(i,j)==0 && origin1(i,j)==0 && origin2(i,j)==0  %黑  黑  黑
                        image1(son_x,son_y+1)=0;
                        image1(son_x+1,son_y)=0;
                        image1(son_x+1,son_y+1)=0;
    
                        image2(son_x,son_y)=0;
                        image2(son_x+1,son_y)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    elseif origin(i,j)==0 && origin1(i,j)==0 && origin2(i,j)~=0  %黑 黑 白
                        image1(son_x,son_y)=0;
                        image1(son_x,son_y+1)=0;
                        image1(son_x+1,son_y+1)=0;
    
                        image2(son_x+1,son_y)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    elseif origin(i,j)==0 && origin1(i,j)~=0 && origin2(i,j)==0  %黑 白 黑
                        image1(son_x,son_y)=0;
                        image1(son_x,son_y+1)=0;
    
                        image2(son_x,son_y)=0;
                        image2(son_x+1,son_y)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    elseif origin(i,j)==0 && origin1(i,j)~=0 && origin2(i,j)~=0  %黑 白 白
                        image1(son_x,son_y)=0;
                        image1(son_x,son_y+1)=0;
    
                        image2(son_x+1,son_y)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    elseif origin(i,j)~=0 && origin1(i,j)==0 && origin2(i,j)==0  %白 黑 黑
                        image1(son_x,son_y+1)=0;
                        image1(son_x+1,son_y)=0;
                        image1(son_x+1,son_y+1)=0;
    
                        image2(son_x,son_y+1)=0;
                        image2(son_x+1,son_y)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    elseif origin(i,j)~=0 && origin1(i,j)==0 && origin2(i,j)~=0  %白 黑 白
                        image1(son_x,son_y)=0;
                        image1(son_x+1,son_y)=0;
                        image1(son_x+1,son_y+1)=0;
    
                        image2(son_x+1,son_y)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    elseif origin(i,j)~=0 && origin1(i,j)~=0 && origin2(i,j)~=0  %白 白 白
                        image1(son_x,son_y+1)=0;
                        image1(son_x+1,son_y)=0;
    
                        image2(son_x+1,son_y)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    elseif origin(i,j)~=0 && origin1(i,j)~=0 && origin2(i,j)==0  %白 白 黑
                        image1(son_x,son_y+1)=0;
                        image1(son_x+1,son_y)=0;
    
                        image2(son_x,son_y)=0;
                        image2(son_x,son_y+1)=0;
                        image2(son_x+1,son_y)=0;
    
                    end
    
                case 4
                    if origin(i,j)==0 && origin1(i,j)==0 && origin2(i,j)==0  %黑  黑  黑
                        image1(son_x,son_y)=0;
                        image1(son_x,son_y+1)=0;
                        image1(son_x+1,son_y+1)=0;
    
                        image2(son_x,son_y)=0;
                        image2(son_x,son_y+1)=0;
                        image2(son_x+1,son_y)=0;
    
                    elseif origin(i,j)==0 && origin1(i,j)==0 && origin2(i,j)~=0  %黑 黑 白
                        image1(son_x,son_y)=0;
                        image1(son_x,son_y+1)=0;
                        image1(son_x+1,son_y)=0;
    
                        image2(son_x,son_y)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    elseif origin(i,j)==0 && origin1(i,j)~=0 && origin2(i,j)==0  %黑 白 黑
                        image1(son_x,son_y+1)=0;
                        image1(son_x+1,son_y)=0;
    
                        image2(son_x,son_y)=0;
                        image2(son_x,son_y+1)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    elseif origin(i,j)==0 && origin1(i,j)~=0 && origin2(i,j)~=0  %黑 白 白
                        image1(son_x,son_y+1)=0;
                        image1(son_x+1,son_y)=0;
    
                        image2(son_x,son_y)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    elseif origin(i,j)~=0 && origin1(i,j)==0 && origin2(i,j)==0  %白 黑 黑
                        image1(son_x,son_y)=0;
                        image1(son_x+1,son_y)=0;
                        image1(son_x+1,son_y+1)=0;
    
                        image2(son_x,son_y)=0;
                        image2(son_x+1,son_y)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    elseif origin(i,j)~=0 && origin1(i,j)==0 && origin2(i,j)~=0  %白 黑 白
                        image1(son_x,son_y+1)=0;
                        image1(son_x+1,son_y)=0;
                        image1(son_x+1,son_y+1)=0;
    
                        image2(son_x,son_y+1)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    elseif origin(i,j)~=0 && origin1(i,j)~=0 && origin2(i,j)~=0  %白 白 白
                        image1(son_x+1,son_y)=0;
                        image1(son_x+1,son_y+1)=0;
    
                        image2(son_x,son_y+1)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    elseif origin(i,j)~=0 && origin1(i,j)~=0 && origin2(i,j)==0  %白 白 黑
                        image1(son_x+1,son_y)=0;
                        image1(son_x+1,son_y+1)=0;
    
                        image2(son_x,son_y)=0;
                        image2(son_x+1,son_y)=0;
                        image2(son_x+1,son_y+1)=0;
    
                    end
    
            end
        end
    end

end

function image = merge(image1,image2)
    Size=size(image1);
    x=Size(1);
    y=Size(2);
    image=zeros(x,y);
    image(:,:)=255;

    for i=1:x
        for j=1:y
            image(i,j)=image1(i,j)&image2(i,j);
        end
    end
end

function image = turn_to_bw(gray)
    Size=size(gray);
    x=Size(1);
    y=Size(2);

    m1 = [[ 0 2 ];
         [ 3 1 ]];
    u1 = ones(2, 2);
    m2 = [[ 4*m1       4*m1+2*u1 ];
         [ 4*m1+3*u1  4*m1+u1   ]];
    u2 = ones(4, 4);
    m3 = [[ 4*m2       4*m2+2*u2 ];
         [ 4*m2+3*u2  4*m2+u2   ]];
    u3 = ones(8,8);
    m4 = [[ 4*m3       4*m3+2*u3 ];
         [ 4*m3+3*u3  4*m3+u3   ]];
    
    for m=1:x
        for n=1:y
            if gray(m,n)>m4(bitand(m,15) + 1, bitand(n,15) + 1)
                out=255;
            else
                out=0;
            end
            error=gray(m,n)-out;
            if n>1 && n<255 && m<255
                gray(m,n+1)=gray(m,n+1)+error*7/16.0;  %右方
                gray(m+1,n)=gray(m+1,n)+error*5/16.0;  %下方
                gray(m+1,n-1)=gray(m+1,n-1)+error*3/16.0;  %左下方
                gray(m+1,n+1)=gray(m+1,n+1)+error*1/16.0;  %右下方
                gray(m,n)=out;
            else
                gray(m,n)=out;
            end
        end
    end
    image=gray;

end

