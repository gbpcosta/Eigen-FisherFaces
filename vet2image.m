function [ im ] = vet2image( vet, height, width, colors )
    %UNTITLED4 Summary of this function goes here
    %   Detailed explanation goes here

    im = zeros( height, width, colors );
    
    for color = 1:colors
        for i = 1:height
            range = (i-1)*width+1 : (i-1)*width+(width);
            im(i, :, color) = vet(color, range);
        end
    end
    
    im = uint8(im);
end

