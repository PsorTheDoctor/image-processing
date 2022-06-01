clc
clear all
close all

img = imread('sunflower.jpg');
img2 = imread('lena.png');

figure();
montage({img, img2});

profile = improfile(img, [10 50], [10 50]);
% plot(profile);

% Ex. 2
[X, map] = rgb2ind(img, 64);
figure();
% imshow(X, [], colormap=jet);
% figure();
% imshow(X, [], colormap=hot);
% figure();
% imshow(X, [], colormap=cool);

% Ex. 3
hsv = rgb2hsv(img);
ycbcr = rgb2ycbcr(img);
ntsc = rgb2ntsc(img);

figure();
montage({hsv, ycbcr, ntsc}, 'Size', [1, 3]);

% Ex. 4
gray = rgb2gray(img);

% imshow(ntsc);

% Ex. 5 is optional