while true
    op = input("请选择想要的功能：\n1、加密\n2、解密\n3、退出\n",'s');
    if op == '1'
        path = input("请输入要加密的图片：",'s');
        path1 = input("请输入要分存的图片1：",'s');
        path2 = input("请输入要分存的图片2：",'s');
        gray = imresize(imread(path),0.5);
        gray1 = imresize(imread(path1),0.5);
        gray2 = imresize(imread(path2),0.5);

        origin = turn_to_bw(gray);
        origin1 = turn_to_bw(gray1);
        origin2 = turn_to_bw(gray2);
        cd('C:\Users\19309\Desktop\document\信息隐藏技术\第一次实验\picture')
        if ~exist('grayimages','dir')
            mkdir('grayimages')
        end
        imwrite(origin,'grayimages/grayimageS.bmp');
        imwrite(origin1,'grayimages/grayimageS1.bmp');
        imwrite(origin2,'grayimages/grayimageS2.bmp');
        cd(filepath)
        figure
        imshow(origin);
        figure
        imshow(origin1);
        figure
        imshow(origin2);
        [image1,image2] = divide(origin,origin1,origin2);
        figure
        imshow(image1);
        figure
        imshow(image2);
        filepath=pwd;
        cd('C:\Users\19309\Desktop\document\信息隐藏技术\第一次实验\picture')
        if ~exist('grayimages','dir')
            mkdir('grayimages')
        end
        imwrite(image1,'grayimages/encodeimageS1.bmp');
        imwrite(image2,'grayimages/encodeimageS2.bmp');
        cd(filepath)
    elseif op == '2'
        path1 = input("请输入要解密的图片1：",'s');
        origin1 = imread(path1);
        path2 = input("请输入要解密的图片2：",'s');
        origin2 = imread(path2);
        mergeimage = merge(origin1,origin2);
        figure
        imshow(mergeimage);
        cd('C:\Users\19309\Desktop\document\信息隐藏技术\第一次实验\picture')
        if ~exist('grayimages','dir')
            mkdir('grayimages')
        end
        imwrite(mergeimage,'grayimages/decodeimageS.bmp');
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

