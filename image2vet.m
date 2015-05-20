function [ vet ] = image2vet( im )
    % image2vet
    %   

    [ height, width, colors ] = size(im);
    
    vet = zeros(colors, height*width);
    
    for i = 1:colors
        for j = 1:height
            start = (j-1)*width + 1;
            vet(i, start:(start+width-1)) = im(j, :, i);
        end
    end
end

