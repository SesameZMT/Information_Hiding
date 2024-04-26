% 读取音频文件
audio = readAudio('input.wav');

% 读取水印图像
watermark = readWatermark('watermark.png');

% 获取图像的长和宽
[height, width, ~] = size(watermark);

disp(['图像的长为：', num2str(height)]);
disp(['图像的宽为：', num2str(width)]);

% 将水印嵌入音频文件
marked_audio = embedWatermark(audio, watermark);

% 将带有水印的音频文件写入新文件
fid = fopen('output.wav', 'wb');
fwrite(fid, marked_audio, 'uint8');
fclose(fid);

% 绘制波形图
[y1, Fs] = audioread('input.wav');
[y2, Fs] = audioread('output.wav');
plotWaveform(y1, y2, Fs);
