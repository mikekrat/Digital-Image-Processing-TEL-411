clear all;
close all;
clc;

Kernel_1=fspecial('average',[3 3]);
Kernel_2=fspecial('average',[5 5]);
Kernel_3=fspecial('average',[9 9]);
Kernel_4=fspecial('average',[5 7]);
Kernel_5=fspecial('average',[9 11]);
Kernel_6=fspecial('average',[7 7]);



Mean_Image1 = imread('Mean_Image1.jpeg');
M_I1 = rgb2gray(Mean_Image1);
%figure
%imshow(Mean_Image1);

Mean_Image2 = imread('Mean_Image2.jpeg');
%figure
%imshow(Mean_Image2);

Median_Image1 = imread('Median_Image1.png');
%figure
%imshow(Median_Image1);

Median_Image2 = imread('Median_Image2.png');
%figure
%imshow(Median_Image2);

Min_Max_Image1 = imread('Min_Max_Image1.jpeg');
MMI1 = rgb2gray(Min_Max_Image1);

%figure
%imshow(Min_Max_Image1);

Min_Max_Image2 = imread('Min_Max_Image2.jpeg');
MMI2 =rgb2gray(Min_Max_Image2);
%figure
%imshow(Min_Max_Image2);

%%Mean images


mean1_1 = compute_mean(M_I1,Kernel_1);
mean1_2 = compute_mean(M_I1,Kernel_2);
mean1_3 = compute_mean(M_I1,Kernel_3);

mean2_1 = compute_mean(Mean_Image2,Kernel_1);
mean2_2 = compute_mean(Mean_Image2,Kernel_2);
mean2_3 = compute_mean(Mean_Image2,Kernel_3);

%%Median images

median1_1 = compute_median(Median_Image1,Kernel_4);
median1_2 = compute_median(Median_Image1,Kernel_1);
median1_3 = compute_median(Median_Image1,Kernel_5);

median2_1 = compute_median(Median_Image2,Kernel_4);
median2_2 = compute_median(Median_Image2,Kernel_1);
median2_3 = compute_median(Median_Image2,Kernel_5);

%%Min images


min1_1 = compute_min(MMI1,Kernel_1);
min1_2 = compute_min(MMI1,Kernel_2);
min1_3 = compute_min(MMI1,Kernel_6);

min2_1 = compute_min(MMI2,Kernel_1);
min2_2 = compute_min(MMI2,Kernel_2);
min2_3 = compute_min(MMI2,Kernel_6);

%%Max images 


max1_1 = compute_max(MMI1,Kernel_1);
max1_2 = compute_max(MMI1,Kernel_2);
max1_3 = compute_max(MMI1,Kernel_6);

max2_1 = compute_max(MMI2,Kernel_1);
max2_2 = compute_max(MMI2,Kernel_2);
max2_3 = compute_max(MMI2,Kernel_6);

