
%[ c, s, l, mImVet ] = eigenfaces('CorelPraia', 'jpg', -1);

testIm = imread('CorelPraia/100.jpg');
%testIm2 = imread('SubCorel/105.jpg');

ctestIm = cropIm(testIm, 256, 256);
%ctestIm2 = cropIm(testIm2, 256, 256);

figure('name','Original Image 1'); imshow(ctestIm);





new_vet = zeros(3, 256 * 256);

colors = 3;

for color = 1:colors
    new_vet(color, :) = s{color}(1,1:20) * c{color}(:, 1:20)';
end

newIm = vet2image(new_vet + mImVet, 256, 256, 3);

vet3 = image2vet(newIm);


figure('name','Reconstructed Image 1'); imshow(newIm, []);





new_vet = zeros(3, 256 * 256);

colors = 3;

for color = 1:colors
    new_vet(color, :) = ((s{color}(1,:)+s{color}(6,:))./2) * c{color}';
end

newIm = vet2image(new_vet + mImVet, 256, 256, 3);

vet3 = image2vet(newIm);


figure('name','Combination of Images 1 and 6'); imshow(newIm, []);




new_vet = zeros(3, 256 * 256);

colors = 3;

new_s = cell(3,1);

for color = 1:colors
    new_s{color} = randn(1,size(c{color},2)) * 1000;
    new_vet(color, :) = new_s{color} * c{color}';
end

newIm = vet2image(new_vet + mImVet, 256, 256, 3);

vet3 = image2vet(newIm);


figure('name','Random Image'); imshow(newIm, []);



for color = 1:colors
    new_vet(color, :) = c{color}(:,1);
end

newIm = vet2image(new_vet, 256, 256, 3);

figure('name','Components Image'); imshow(newIm, []);
