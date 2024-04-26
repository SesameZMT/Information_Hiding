% 读取音频文件
audio = readAudio('input.wav');

% 读取水印图像
watermark = readWatermark('watermark.png');



% 获取图像的长和宽
[height, width, ~] = size(watermark);

disp(['图像的长为：', num2str(height)]);
disp(['图像的宽为：', num2str(width)]);
