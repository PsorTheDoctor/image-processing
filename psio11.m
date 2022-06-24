clc
clear all
close all

img = imread('sunflower.jpg');
gray = rgb2gray(img);
[X, map] = rgb2ind(img, 256);

figure();
montage({img, gray});

% Ex. 1a
hist = imhist(gray);
figure();
plot(hist);

% Levels from histogram peaks
center = 75/256;  % to see only the center
petals = 175/256; % to see petals

bw = im2bw(gray, center);
bw2 = im2bw(gray, petals);
bw3 = im2bw(X, map, center);
bw4 = im2bw(X, map, petals);
bw5 = im2bw(img, center);
bw6 = im2bw(img, petals);

figure();
montage({bw, bw2});

% Ex. 1b
bw7 = imbinarize(gray);
bw8 = imbinarize(gray, 'adaptive');
bw9 = imbinarize(gray, 'global');
bw10 = imbinarize(gray, 0.5);

figure();
montage({bw7, bw8, bw9}, 'Size', [1, 3]);

% Ex. 1c
thresh = graythresh(gray);
bw11 = im2bw(img, thresh);

figure();
imshow(bw11);

% Ex. 1d
for i = 100:20:200
    bin = im2bw(img, i/256);
    % imshow(bin)
    % pause(0.2);
end

bin1 = im2bw(img, 100/256);
bin2 = im2bw(img, 120/256);
bin3 = im2bw(img, 140/256);
bin4 = im2bw(img, 160/256);
bin5 = im2bw(img, 180/256);
bin6 = im2bw(img, 200/256);

figure();
montage({bin1, bin2, bin3, bin4, bin5, bin6}, 'Size', [2, 3]);

% Ex. 2
[X, map] = rgb2ind(img, 256);
new_map = histeq(X, map);
aligned_img = ind2rgb(X, new_map);
aligned_hist = imhist(aligned_img);

figure();
imshow(aligned_img);

figure();
plot(aligned_hist);

% img = imread('strawberries.jpg');
% diff = imsubtract(img(:,:,1), rgb2gray(img));
% bin = im2bw(diff, 0.2);
% montage({img, diff, bin});
