function plotWaveform(audio1, audio2, Fs)
    y1 = audio1(45:end); % 去除 WAV 文件头
    x1 = (0:length(y1) - 1) / Fs;
    
    y2 = audio2(45:end); % 去除 WAV 文件头
    x2 = (0:length(y2) - 1) / Fs;
    
    figure;
    subplot(2, 1, 1);
    plot(x1, y1);
    axis([0 max(x1) -1 1]);
    xlabel('Time / (s)');ylabel('Amplitude');title('original audio');
    
    subplot(2, 1, 2);
    plot(x2, y2);
    axis([0 max(x2) -1 1]);
    xlabel('Time / (s)');ylabel('Amplitude');title('information hiding audio');
end
