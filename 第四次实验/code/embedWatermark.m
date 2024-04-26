function marked_audio = embedWatermark(audio, watermark)
    n = length(audio) - 44;
    [row, col] = size(watermark);
    wi = watermark(:);
    if row * col > n
        error('音频载体太小，请更换载体');
    end
    marked_audio = audio;
    for k = 1 : row * col
        marked_audio(44 + k) = bitset(marked_audio(44 + k), 1, wi(k));
    end
end
