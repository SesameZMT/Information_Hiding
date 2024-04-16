function IntHiding()
    x=imread("C:\Users\19309\Desktop\document\信息隐藏技术\第六次实验\picture\Xiangling.png"); %载体图像
    m=2111454; %要嵌入的信息
    imshow(x,[])
    WaterMarked=Hide(x,m);
    watermark=Extract(WaterMarked)
end

function WaterMarked = Hide(origin,watermark)
    [Mc,Nc]=size(origin);
    WaterMarked=uint8(zeros(size(origin)));
    
    for i=1:Mc
        for j=1:Nc
            if i==1 && j<=28
                tem=bitget(watermark,j);
                WaterMarked(i,j)=bitset(origin(i,j),1,tem);
            else
                WaterMarked(i,j)=origin(i,j);
            end
        end
    end
    
    imwrite(WaterMarked,'C:\Users\19309\Desktop\document\信息隐藏技术\第六次实验\picture\lsb_int_watermarked.bmp','bmp');
    figure;
    imshow(WaterMarked,[]);
    title("WaterMarked Image");
end

function WaterMark=Extract(WaterMarked)
    WaterMark=0;
    for j=1:28
        tem=bitget(WaterMarked(1,j),1);
        WaterMark=bitset(WaterMark,j,tem);
    end
end