while true
    op = input("请选择想要的功能：\n1、加密\n2、解密\n3、退出\n",'s');
    if op == '1'
        path = input("请输入要加密的图片：",'s');%二值图像（Lena.bmp）
        path1 = input("请输入要分存的图片1：",'s');
        path2 = input("请输入要分存的图片2：",'s');
        origin = imresize(imread(path),0.5);
        origin1 = imresize(imread(path1),0.5);
        origin2 = imresize(imread(path2),0.5);
        [image1,image2] = divide(origin,origin1,origin2);
        figure
        imshow(image1);
        figure
        imshow(image2);
        filepath=pwd;
        cd('C:\Users\19309\Desktop\document\信息隐藏技术\第一次实验\picture')
        if ~exist('bwimages','dir')
            mkdir('bwimages')
        end
        imwrite(image1,'bwimages/encodeimageS1.bmp');
        imwrite(image2,'bwimages/encodeimageS2.bmp');
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
        if ~exist('bwimages','dir')
            mkdir('bwimages')
        end
        imwrite(mergeimage,'bwimages/decodeimageS.bmp');
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
