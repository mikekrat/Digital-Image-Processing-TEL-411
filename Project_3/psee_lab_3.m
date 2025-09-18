clear all;
close all;

G = fspecial('gaussian', [15, 15], 20);
img = imread('lena_gray_512.tif');

figure 
imshow(img);
title('Original Image');

%% 1

img_zero_padding = padarray(img, [floor(size(G, 1) / 2), floor(size(G, 2) / 2)]);

img_conv = convImage(img_zero_padding,G);
img_conv_crop = imcrop(img_conv, [15 15 511 511]);

figure
imshow(img_conv_crop/255)
title('Convolution with zero padding');
img_d = double(img);
img_conv_crop = double(img_conv_crop);
mse_1 = immse(img_d, img_conv_crop);
psnr_1 = psnr(img_d, img_conv_crop);

%% 2

img_zero_padding = double(img_zero_padding);
img_conv2 = conv2(img_zero_padding, G, 'valid');

figure
imshow(img_conv2 / 255)
title('Convolution with function conv2 and zero padding');

img_conv2 = double(img_conv2);
mse_2 = immse(img_d, img_conv2);

%% 3

img_fil = imfilter(img , G , 'same' , 'conv');
figure
imshow(img_fil)
title('Filtered Image with zero padding');

img_fil = double(img_fil);
mse_3 = immse(img_d, img_fil);

%% 4

img_F = fft2(img);
G_F = fft2(G,512,512);

X_F = img_F.* G_F;
x_inv = ifft2(X_F);
figure
imshow(x_inv / 255)
title('Inversed Fourier Transform Image');

x_inv = double(x_inv);
mse_4_1 = immse(x_inv, img_conv2);
mse_4_2 = immse(x_inv, img_conv_crop);
mse_4_3 = immse(x_inv, img_fil);
