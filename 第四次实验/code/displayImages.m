function displayImages(orig_image, extracted_image)
    figure;
    subplot(1, 2, 1); imshow(orig_image); title('Original Picture');
    subplot(1, 2, 2); imshow(extracted_image); title('Extracted Picture');
end