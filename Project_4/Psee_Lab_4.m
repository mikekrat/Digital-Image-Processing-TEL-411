clear all;
close all;

img1 = imread('axones1.png');
imshow(img1);

figure;
img2 = imread('axones2.png');
imshow(img2);

%% 1
se1 = strel('disk', 5);

img1_denoised = imopen(img1, se1);
figure
imshow(img1_denoised);
title('1.1');

img2_denoised = imopen(img2, se1);
figure;
imshow(img2_denoised);
title('1.2');

%% 2
se2 = strel('disk', 5);

img1_eroded = imerode(img1, se2);
img1_gradient = imsubtract(img1, img1_eroded);
figure
imshow(img1_gradient);
title('2.1');

img2_eroded = imerode(img2, se2);
img2_gradient = imsubtract(img2, img2_eroded);
figure
imshow(img2_gradient);
title('2.2');

%% 3
img1_gt = graythresh(img1);
img1_bw = im2bw(img1, img1_gt);

figure;
imshow(img1_bw);
title('3.1');

img2_gt = graythresh(img2);
img2_bw = im2bw(img2, img2_gt);

figure;
imshow(img2_bw);
title('3.2');

%% 4
img1_skel = bwmorph(img1_bw, 'skel', inf);

figure;
imshow(img1_skel);
title('4.1');

img2_skel = bwmorph(img2_bw, 'skel', inf);

figure;
imshow(img2_skel);
title('4.2');

%% 5

img1_skel = bwmorph(img1_skel, 'bridge');
img1_skel = bwmorph(img1_skel, 'spur');
img1_skel = bwmorph(img1_skel, 'clean');
img1_skel = bwmorph(img1_skel, 'spur');
img1_skel = bwmorph(img1_skel, 'clean');

figure;
imshow(img1_skel);
title('5.1');

img2_skel = bwmorph(img2_skel, 'bridge');
img2_skel = bwmorph(img2_skel, 'spur');
img2_skel = bwmorph(img2_skel, 'clean');
img2_skel = bwmorph(img2_skel, 'spur');
img2_skel = bwmorph(img2_skel, 'clean');

figure;
imshow(img2_skel);
title('5.2');


