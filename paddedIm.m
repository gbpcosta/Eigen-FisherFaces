function [ padded_im ] = paddedIm( im, pad_height, pad_width, padval )
    % paddedIm
    %   
    %   
    %   padded_im = paddedIm(im, maxHeight, maxWidth, 0 );
    %   padded_im = paddedIm(im, maxHeight, maxWidth, 'replicate' );
    %   padded_im = paddedIm(im, maxHeight, maxWidth, 'symmetric' );
    %   padded_im = paddedIm(im, maxHeight, maxWidth, 'circular' );

    [ im_height, im_width, colors ] = size(im);
    
    padded_im = zeros(pad_height, pad_width, colors);
    
    for i = 1:colors
        aux = padarray(im(:,:,i), [floor((pad_height - im_height)/2) floor((pad_width - im_width)/2)], padval, 'post');
        padded_im(:,:,i) = padarray(aux, [ceil((pad_height - im_height)/2) ceil((pad_width - im_width)/2)], padval, 'pre');
    end
    
    padded_im = uint8(round(padded_im-1));
end

