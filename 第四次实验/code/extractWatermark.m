function watermark = extractWatermark(audio, n)
    watermark_bits = zeros(n, 1);
    for i = 1 : n
        watermark_bits(i) = bitget(audio(44 + i), 1);
    end
    watermark = reshape(watermark_bits, 506, 888);
end