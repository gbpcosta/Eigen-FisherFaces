function [ cropped_im ] = cropIm( im, crop_height, crop_width )
    % cropIm 
    %   Summary of this function goes here
    %   Detailed explanation goes here

    [ im_height, im_width, colors ] = size(im);
    
    dif_height = (im_height - crop_height)/2;
    dif_width = (im_width - crop_width)/2;
    
    cropped_im = zeros(crop_height, crop_width, colors);
    
    for i = 1:colors
        cropped_im(:,:,i) =  imresize(imcrop(im(:,:,i), [ floor(dif_width) floor(dif_height) crop_width crop_height ]), [ crop_height crop_width ]);
    end
    
    cropped_im = uint8(round(cropped_im-1));
end

