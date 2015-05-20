function [ height, width ] = maxImSize( folder, type )
    % maxImSize 
    %   Summary of this function goes here
    %   Detailed explanation goes here

    path = strcat(folder, '/*.', type);
    
    files = dir(path);
    
    file_path = strcat(folder, '/', files(1).name);
    im = imread(file_path);
    
    height = size(im, 1);
    width = size(im, 2);
    
    for file_id = 2:numel(files)
        file_path = strcat(folder, '/', files(file_id).name);
        im = imread(file_path);
    
        if height < size(im, 1)
            height = size(im, 1);
        end
        
        if width < size(im,2)
            width = size(im, 2);
        end
    end
    
end

