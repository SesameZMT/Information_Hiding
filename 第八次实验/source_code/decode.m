%% decode
clc;
clear;
d = imread("C:\Users\19309\Desktop\document\信息隐藏技术\第八次实验\picture\encode.bmp");

for t = 1:24
    s(t) = bitget(0, t);
end

t = 1;
num = 1;

while t < 24
    a = CalculateBlack(d, num);
    switch a
        case 0
            num = num + 4;
        case 1
            s(t) = 1;
            t = t + 1;
            num = num + 4;
        case 3
            s(t) = 0;
            t = t + 1;
            num = num + 4;
        case 4
            num = num + 4;
    end
end

sum = 0;

for t = 1:24
    sum = sum + s(t) * 2^(t - 1);
end

fprintf("秘密信息是： %d\n", sum);

function out = CalculateBlack(x, i)
    out = 0;
    for a = i : i + 3
        if x(a) == 0
            out = out + 1;
        end
    end
end