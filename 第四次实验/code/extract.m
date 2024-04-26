% 读取音频文件
audio = readAudio('output.wav');

% 提取水印信息
watermark = extractWatermark(audio, 449328);

% 将提取的水印信息转换为图像
extracted_image = watermarkToImage(watermark);

% 读取原始图像
orig_image = imread('watermark.png');

% 显示原始图像和提取的水印图像
displayImages(orig_image, extracted_image);

