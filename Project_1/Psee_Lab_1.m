clear all;
close all;

img=imread('retriever.tiff');
[R, C]=size(img);
figure
imshow(img);
title('Original image');

%% Downsampling
% Antialiasing

img_ds24_antialias = imresize(img,[R/2, C/4],'Antialiasing',true);
figure
subplot(2,2,1)
imshow(img_ds24_antialias);
title('DownSampled Image 1/2 rows , 1/4 colums, anti-aliasing');

img_ds42_antialias = imresize(img,[R/4, C/2],'Antialiasing',true);
subplot(2,2,2)
imshow(img_ds42_antialias);
title('DownSampled Image 1/4 rows , 1/2 colums, anti-aliasing');

img_ds88_antialias = imresize(img,[R/8, C/8],'Antialiasing',true);
subplot(2,2,3)
imshow(img_ds88_antialias);
title('DownSampled Image 1/8 rows , 1/8 colums, anti-aliasing');

% Aliasing

img_ds24_alias = imresize(img,[R/2, C/4],'Antialiasing',false);
figure
subplot(2,2,1)
imshow(img_ds24_alias);
title('DownSampled Image 1/2 rows , 1/4 colums, aliasing');

img_ds42_alias = imresize(img,[R/4, C/2],'Antialiasing',false);
subplot(2,2,2)
imshow(img_ds42_alias);
title('DownSampled Image 1/4 rows , 1/2 colums, aliasing');

img_ds88_alias = imresize(img,[R/8, C/8],'Antialiasing',false);
subplot(2,2,3)
imshow(img_ds88_alias);
title('DownSampled Image 1/8 rows , 1/8 colums, aliasing');

%% Upsampling
% Interpolations

% Antialiasing

img_up24_nearest_antialias = imresize(img_ds24_antialias,[R, C],'nearest','Antialiasing',true);
figure
subplot(2,2,1)
imshow(img_up24_nearest_antialias);
title('Upsampled image from 1/2 rows, 1/4 columns, nearest-neighbour, antialias');

img_up24_bilinear_antialias = imresize(img_ds24_antialias,[R, C],'bilinear','Antialiasing',true);
subplot(2,2,2)
imshow(img_up24_bilinear_antialias);
title('Upsampled image from 1/2 rows, 1/4 columns, bilinear, antialias');

img_up24_bicubic_antialias = imresize(img_ds24_antialias,[R, C],'bicubic','Antialiasing',true);
subplot(2,2,3)
imshow(img_up24_bicubic_antialias);
title('Upsampled image from 1/2 rows, 1/4 columns, bicubic, antialias');

img_up42_nearest_antialias = imresize(img_ds42_antialias,[R, C],'nearest','Antialiasing',true);
figure
subplot(2,2,1)
imshow(img_up42_nearest_antialias);
title('Upsampled image from 1/4 rows, 1/2 columns, nearest-neighbour, antialias');

img_up42_bilinear_antialias = imresize(img_ds42_antialias,[R, C],'bilinear','Antialiasing',true);
subplot(2,2,2)
imshow(img_up42_bilinear_antialias);
title('Upsampled image from 1/4 rows, 1/2 columns, bilinear, antialias');

img_up42_bicubic_antialias = imresize(img_ds42_antialias,[R, C],'bicubic','Antialiasing',true);
subplot(2,2,3)
imshow(img_up42_bicubic_antialias);
title('Upsampled image from 1/4 rows, 1/2 columns, bicubic, antialias');

img_up88_nearest_antialias = imresize(img_ds88_antialias,[R, C],'nearest','Antialiasing',true);
figure
subplot(2,2,1)
imshow(img_up88_nearest_antialias);
title('Upsampled image from 1/8 rows, 1/8 columns, nearest-neighbour, antialias');

img_up88_bilinear_antialias = imresize(img_ds88_antialias,[R, C],'bilinear','Antialiasing',true);
subplot(2,2,2)
imshow(img_up88_bilinear_antialias);
title('Upsampled image from 1/8 rows, 1/8 columns, bilinear, antialias');

img_up88_bicubic_antialias = imresize(img_ds88_antialias,[R, C],'bicubic','Antialiasing',true);
subplot(2,2,3)
imshow(img_up88_bicubic_antialias);
title('Upsampled image from 1/8 rows, 1/8 columns, bicubic, antialias');

% Aliasing

img_up24_nearest_alias = imresize(img_ds24_alias,[R, C],'nearest','Antialiasing',false);
figure
subplot(2,2,1)
imshow(img_up24_nearest_alias);
title('Upsampled image from 1/2 rows, 1/4 columns, nearest-neighbour, alias');

img_up24_bilinear_alias = imresize(img_ds24_alias,[R, C],'bilinear','Antialiasing',false);
subplot(2,2,2)
imshow(img_up24_bilinear_alias);
title('Upsampled image from 1/2 rows, 1/4 columns, bilinear, alias');

img_up24_bicubic_alias = imresize(img_ds24_alias,[R, C],'bicubic','Antialiasing',false);
subplot(2,2,3)
imshow(img_up24_bicubic_alias);
title('Upsampled image from 1/2 rows, 1/4 columns, bicubic, alias');

img_up42_nearest_alias = imresize(img_ds42_alias,[R, C],'nearest','Antialiasing',false);
figure
subplot(2,2,1)
imshow(img_up42_nearest_alias);
title('Upsampled image from 1/4 rows, 1/2 columns, nearest-neighbour, alias');

img_up42_bilinear_alias = imresize(img_ds42_alias,[R, C],'bilinear','Antialiasing',false);
subplot(2,2,2)
imshow(img_up42_bilinear_alias);
title('Upsampled image from 1/4 rows, 1/2 columns, bilinear, alias');

img_up42_bicubic_alias = imresize(img_ds42_alias,[R, C],'bicubic','Antialiasing',false);
subplot(2,2,3)
imshow(img_up42_bicubic_alias);
title('Upsampled image from 1/4 rows, 1/2 columns, bicubic, alias');

img_up88_nearest_alias = imresize(img_ds88_alias,[R, C],'nearest','Antialiasing',false);
figure
subplot(2,2,1)
imshow(img_up88_nearest_alias);
title('Upsampled image from 1/8 rows, 1/8 columns, nearest-neighbour, alias');

img_up88_bilinear_alias = imresize(img_ds88_alias,[R, C],'bilinear','Antialiasing',false);
subplot(2,2,2)
imshow(img_up88_bilinear_alias);
title('Upsampled image from 1/8 rows, 1/8 columns, bilinear, alias');

img_up88_bicubic_alias = imresize(img_ds88_alias,[R, C],'bicubic','Antialiasing',false);
subplot(2,2,3)
imshow(img_up88_bicubic_alias);
title('Upsampled image from 1/8 rows, 1/8 columns, bicubic, alias');

%% MSE

mse_24_nearest_antialias = immse(img, img_up24_nearest_antialias);
mse_24_nearest_alias = immse(img, img_up24_nearest_alias);
mse_24_bilinear_antialias = immse(img, img_up24_bilinear_antialias);
mse_24_bilinear_alias = immse(img, img_up24_bilinear_alias);
mse_24_bicubic_antialias = immse(img, img_up24_bicubic_antialias);
mse_24_bicubic_alias = immse(img, img_up24_bicubic_alias);

mse_42_nearest_antialias = immse(img, img_up42_nearest_antialias);
mse_42_nearest_alias = immse(img, img_up42_nearest_alias);
mse_42_bilinear_antialias = immse(img, img_up42_bilinear_antialias);
mse_42_bilinear_alias = immse(img, img_up42_bilinear_alias);
mse_42_bicubic_antialias = immse(img, img_up42_bicubic_antialias);
mse_42_bicubic_alias = immse(img, img_up42_bicubic_alias);

mse_88_nearest_antialias = immse(img, img_up88_nearest_antialias);
mse_88_nearest_alias = immse(img, img_up88_nearest_alias);
mse_88_bilinear_antialias = immse(img, img_up88_bilinear_antialias);
mse_88_bilinear_alias = immse(img, img_up88_bilinear_alias);
mse_88_bicubic_antialias = immse(img, img_up88_bicubic_antialias);
mse_88_bicubic_alias = immse(img, img_up88_bicubic_alias);

%% PSNR

psnr_24_nearest_antialias = psnr(img, img_up24_nearest_antialias);
psnr_24_nearest_alias = psnr(img, img_up24_nearest_alias);
psnr_24_bilinear_antialias = psnr(img, img_up24_bilinear_antialias);
psnr_24_bilinear_alias = psnr(img, img_up24_bilinear_alias);
psnr_24_bicubic_antialias = psnr(img, img_up24_bicubic_antialias);
psnr_24_bicubic_alias = psnr(img, img_up24_bicubic_alias);

psnr_42_nearest_antialias = psnr(img, img_up42_nearest_antialias);
psnr_42_nearest_alias = psnr(img, img_up42_nearest_alias);
psnr_42_bilinear_antialias = psnr(img, img_up42_bilinear_antialias);
psnr_42_bilinear_alias = psnr(img, img_up42_bilinear_alias);
psnr_42_bicubic_antialias = psnr(img, img_up42_bicubic_antialias);
psnr_42_bicubic_alias = psnr(img, img_up42_bicubic_alias);

psnr_88_nearest_antialias = psnr(img, img_up88_nearest_antialias);
psnr_88_nearest_alias = psnr(img, img_up88_nearest_alias);
psnr_88_bilinear_antialias = psnr(img, img_up88_bilinear_antialias);
psnr_88_bilinear_alias = psnr(img, img_up88_bilinear_alias);
psnr_88_bicubic_antialias = psnr(img, img_up88_bicubic_antialias);
psnr_88_bicubic_alias = psnr(img, img_up88_bicubic_alias);







