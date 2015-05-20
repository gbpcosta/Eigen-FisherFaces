function [ coeff, score, latent, meanImVet ] = eigenfaces( folder, type, cropOrPad, varargin )
    if cropOrPad ~= 1 && cropOrPad ~= -1
        error('cropOrPad needs to be -1 (crop) or 1 (pad).')
    end

    if cropOrPad == 1
        if nargin < 4 
            error( 'Too few arguments.' )
        elseif nargin > 4 
            error( 'Too many arguments.' )
        end
    end
    
    if cropOrPad == -1
        if ( nargin > 3 )
            error( 'Too many arguments.' )
        end
    end

    [ max_height, max_width ] = maxImSize( folder, type );
    [ min_height, min_width ] = minImSize( folder, type );
    
    if cropOrPad == -1
        height = min_height;
        width = min_width;
    elseif cropOrPad == 1
        height = max_height;
        width = max_width;
    end

    path = strcat( folder, '/*.', type );
    
    files = dir( path );
    
    for file_id = 1:numel( files )
        file_path = strcat( folder, '/', files( file_id ).name );
        im = imread( file_path );
        
        if file_id == 1
            [ im_height, im_width, im_color ] = size( im );
            
            imsMatrix = zeros( numel( files ), height*width,  im_color );
        end
        
        newIm = cropIm( im, height, width );          
                
        vet = image2vet( newIm );
        for color = 1:im_color
            imsMatrix( file_id, :, color ) = vet( color, : );
        end
    end
    
    meanImVet = zeros( im_color, height*width );
    centered_Ims = zeros( numel( files ), height*width,  im_color );
    
    coeff = cell( im_color, 1 );
    score = cell( im_color, 1 );
    latent = cell( im_color, 1 );
 
    for color = 1:im_color
        meanImVet( color, : ) = mean( imsMatrix( :, :, color ) );
        centered_Ims( :, :, color ) = bsxfun( @minus, imsMatrix( :, :, color ), meanImVet( color, : ) );
        [ coeff{color}, score{color}, latent{color} ] = pca( centered_Ims( :, :, color ) );
    end
    
    %size(centered_Ims)
    
    %figure; imshow( vet2image( meanImVet, height, width, im_color ) );
    
    
end
