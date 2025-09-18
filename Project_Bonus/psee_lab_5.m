clear all;
close all;

img = imread('cameraman.tif');

%% Part A
A = 255;
range = linspace(-A,A);
R = 0 : 8;

% characteristic functions of the uniform quantizer 
calc_R_char_func(range, A, R, 0);

% characteristic functions of image
R = 2 : 9;
calc_R_char_func(img, A, R, 1);

%% Part B
%img = (imresize(img,[256 256]));

[ap, hor, ver, diag] = haart2(img,2);

figure
subplot(2,2,1)
imagesc(ap)
%colormap gray(255)
title('Approximation coefficients of Level 1')

subplot(2,2,2)
imagesc(hor{1})
title('Horizontal detail coefficients of Level 1')

subplot(2,2,3)
imagesc(ver{1})
title('Vertical detail coefficients of Level 1')

subplot(2,2,4)
imagesc(diag{1})
title('Diagonal detail coefficients of Level 1')

figure
subplot(2,2,1)
imagesc(ap)
%colormap gray(255)
title('Approximation coefficients of Level 2')

subplot(2,2,2)
imagesc(hor{2})
title('Horizontal detail coefficients of Level 2')

subplot(2,2,3)
imagesc(ver{2})
title('Vertical detail coefficients of Level 2')

subplot(2,2,4)
imagesc(diag{2})
title('Diagonal detail coefficients of Level 2')

%% Level 1: R=2, Level 2: R=4
R1 = 2;
L1 = 2 ^ R1;
D1 = (2 * A) / L1;

R2 = 4;
L2 = 2 ^ R2;
D2 = (2 * A) / L2;

us_hor1 = uni_scalar(hor{1},D1);
us_ver1 = uni_scalar(ver{1},D1);
us_diag1 = uni_scalar(diag{1},D1);
us_hor2 = uni_scalar(hor{2},D2);
us_ver2 = uni_scalar(ver{2},D2);
us_diag2 = uni_scalar(diag{2},D2);

en_hor1 = entropy(us_hor1);
en_ver1 = entropy(us_ver1);
en_diag1 = entropy(us_diag1);
en_hor2 = entropy(us_hor2);
en_ver2 = entropy(us_ver2);
en_diag2 = entropy(us_diag2);

e_total = en_hor1 + en_ver1 + en_diag1 + en_hor2 + en_ver2 + en_diag2;

hor_new = {us_hor1, us_hor2};
ver_new = {us_ver1, us_ver2};
diag_new = {us_diag1, us_diag2};

img_new = ihaart2(ap, hor_new, ver_new, diag_new);
psnr_1 = psnr(img, uint8(img_new));

figure
imagesc(img_new)
%colormap(gray)
title('Quantized image');


