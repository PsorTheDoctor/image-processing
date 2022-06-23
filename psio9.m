clc
clear all
close all

img = imread('sunflower.jpg');

% Convertion data type to double and normalization in 0-1 range
img = double(img) / 255;
gray = rgb2gray(img);

% figure();
% montage({img, gray}, 'Size', [1, 2]);

% Ex. 1
img_sqrt = sqrt(img); % img .^ 0.5;
img_pow = img .^ 2;
img_double = img * 2;

gray_sqrt = sqrt(gray);
gray_pow = gray .^ 2;
gray_double = gray * 2;

% figure();
% montage({img_sqrt, img_pow, img_double}, 'Size', [1, 3]);
% figure();
% montage({gray_sqrt, gray_pow, gray_double}, 'Size', [1, 3]);

% Ex. 2
angle = 30;
rotated1 = imrotate(img, angle, 'nearest');
rotated2 = imrotate(img, angle, 'bilinear', 'crop');
rotated3 = imrotate(img, angle, 'bicubic', 'loose');

% figure();
% montage({rotated1, rotated2});

res = [480, 640];
resized1 = imresize(img, res, 'nearest');
resized2 = imresize(img, res, 'bilinear');
resized3 = imresize(img, res, 'cubic');

% figure();
% imshow(resized1);

reshaped1 = reshape(gray, [387*3, 387/3]);
reshaped2 = reshape(gray, [387/3, 387*3]);

% figure();
% imshow(reshaped1');
% figure();
% imshow(reshaped2);

flipped_ud = flipud(img);
flipped_lr = fliplr(img);

% figure();
% montage({flipped_ud, flipped_lr});

crop1 = imcrop(img, [0, 0, 200, 200]);
crop2 = imcrop(img, [0, 200, 200, 387]);
crop3 = imcrop(img, [200, 0, 387, 200]);
crop4 = imcrop(img, [200, 200, 387, 387]);

concat1 = cat(1, crop1, crop2);
concat2 = cat(1, crop3, crop4);
concat = cat(2, concat1, concat2);

% figure();
% montage({crop1, crop2, crop3, crop4});
% figure();
% imshow(concat);

% Ex. 3
img1 = imread('norway.jpg');
img2 = imread('sweden.jpg');

sum = imadd(img1, img2);
diff = imabsdiff(img1, img2);
div = imdivide(img1, img2);
mul = immultiply(img1, img2);

% figure();
% montage({img1, img2});

% figure();
% montage({sum, diff, div, mul});

% Ex. 4
for i=0:0.1:1
    combined = imlincomb(i, img1, 1-i, img2);
    % imshow(combined);
end

comb1 = imlincomb(0.1, img1, 1-0.1, img2);
comb2 = imlincomb(0.2, img1, 1-0.2, img2);
comb3 = imlincomb(0.3, img1, 1-0.3, img2);
comb4 = imlincomb(0.4, img1, 1-0.4, img2);
comb5 = imlincomb(0.5, img1, 1-0.5, img2);
comb6 = imlincomb(0.6, img1, 1-0.6, img2);
comb7 = imlincomb(0.7, img1, 1-0.7, img2);
comb8 = imlincomb(0.8, img1, 1-0.8, img2);
comb9 = imlincomb(0.9, img1, 1-0.9, img2);

% figure();
% montage({comb1, comb2, comb3, comb4, comb5, ...
%     comb6, comb7, comb8, comb9}, 'Size', [3, 3]);
