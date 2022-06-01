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

figure();
montage({rotated1, rotated2});

res = [480, 640];
resized1 = imresize(img, res, 'nearest');
resized2 = imresize(img, res, 'bilinear');
resized3 = imresize(img, res, 'cubic');

figure();
imshow(resized1);

reshaped1 = reshape(gray, [387*3, 387/3]);
reshaped2 = reshape(gray, [387/3, 387*3]);

figure();
imshow(reshaped1');
figure();
imshow(reshaped2);

flipped_ud = flipud(img);
flipped_lr = fliplr(img);

figure();
montage({flipped_ud, flipped_lr});

crop1 = imcrop(img, [0, 0, 1000, 1000]);
crop2 = imcrop(img, [1000, 0, 1920, 1000]);
crop3 = imcrop(img, [0, 1000, 1000, 1080]);
crop4 = imcrop(img, [1000, 1000, 1920, 1080]);

% Ex. 3
img1 = imread('obraz1.jpg');
img2 = imread('obraz2.jpg');

sum = imadd(img1, img2);
diff = imabsdiff(img1, img2);
div = imdivide(img1, img2);
mul = immultiply(img1, img2);

% figure();
% montage({img1, img2});

% figure();
% montage({sum, diff, div, mul});

% Ex. 4
combined = [];

for i=0:0.1:1
    combined(i+1) = imlincomb(i, img1, 1-i, img2);
    % imshow(combined);
end

montage({combined(1), combined(2)});

% imshow(comb, []);




