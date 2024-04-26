function audio = readAudio(filename)
    fid = fopen(filename, 'rb');
    audio = fread(fid, inf, 'uint8');
    fclose(fid);
end

