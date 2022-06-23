clc
clear all
close all

img = imread('sunflower.jpg');
img2 = imread('lena.png');

% figure();
% montage({img, img2});

% profile = improfile(img, [10, 50], [10, 50]);
% plot(profile);

% Ex. 1
red_ch = img(:, :, 1);
green_ch = img(:, :, 2);
blue_ch = img(:, :, 3);

[h, w, ch] = size(img);

r = 0:255;
z = zeros(256, 3);
z(:, 1) = r';
red = z / 255;

figure();
mesh(1:w, w:-1:1, red_ch, 'FaceColor', 'texturemap', ...
    'EdgeColor', 'none', 'CdataMapping', 'direct');
colormap(red);
colorbar('vert');
xlabel('x'); ylabel('y'); zlabel('intensity');
hold on;
z = zeros(h, w);
z = z + 100;
mesh(z);
hold on;
mesh(1:w, h:-1:1, red_ch, 'FaceColor', 'texturemap', ...
    'EdgeColor', 'none', 'CdataMapping', 'direct');

g = 0:255;
z = zeros(256, 3);
z(:, 2) = g';
green = z / 255;

figure();
mesh(1:w, w:-1:1, green_ch, 'FaceColor', 'texturemap', ...
    'EdgeColor', 'none', 'CdataMapping', 'direct');
colormap(green);
colorbar('vert');
xlabel('x'); ylabel('y'); zlabel('intensity');
hold on;
z = zeros(h, w);
z = z + 100;
mesh(z);
hold on;
mesh(1:w, h:-1:1, green_ch, 'FaceColor', 'texturemap', ...
    'EdgeColor', 'none', 'CdataMapping', 'direct');

b = 0:255;
z = zeros(256, 3);
z(:, 3) = b';
blue = z / 255;

figure();
mesh(1:w, w:-1:1, blue_ch, 'FaceColor', 'texturemap', ...
    'EdgeColor', 'none', 'CdataMapping', 'direct');
colormap(blue);
colorbar('vert');
xlabel('x'); ylabel('y'); zlabel('intensity');
hold on;
z = zeros(h, w);
z = z + 100;
mesh(z);
hold on;
mesh(1:w, h:-1:1, blue_ch, 'FaceColor', 'texturemap', ...
    'EdgeColor', 'none', 'CdataMapping', 'direct');

% Ex. 2
[X1, map] = rgb2ind(img, 64);
[X2, map2] = rgb2ind(img2, 64);

figure()
imshow(X1, colormap('jet'));
figure();
imshow(X1, colormap('hot'));
figure();
imshow(X2, colormap('cool'));
figure();
imshow(X2, colormap('parula'));

% Ex. 3
hsv = rgb2hsv(img);
ycbcr = rgb2ycbcr(img);
ntsc = rgb2ntsc(img);

figure();
montage({hsv, ycbcr, ntsc}, 'Size', [1, 3]);

% Ex. 4a
gray = rgb2gray(img);

% Ex. 4b
figure();
imshow(img);
seg1 = improfile(img, [50, 200], [50, 200]);
seg2 = improfile(img, [200, 50], [50, 200]);
line([50, 200], [50, 200], 'Color', [1,1,1], 'linewidth', 2);
line([200, 50], [50, 200], 'Color', [1,1,1], 'linewidth', 2);
set(gcf, 'Color', ([1,1,1]));

% First segment
figure();
imshow(img);
plot(seg1(:, :, 1), 'r'); hold on;
plot(seg1(:, :, 2), 'g'); hold on;
plot(seg1(:, :, 3), 'b');

% Second segment
figure();
imshow(img);
plot(seg2(:, :, 1), 'r'); hold on;
plot(seg2(:, :, 2), 'g'); hold on;
plot(seg2(:, :, 3), 'b');

figure();
imshow(img);
diag1 = improfile(img, [0, 387], [0, 387]);
diag2 = improfile(img, [387, 0], [0, 387]);
line([0, 387], [0, 387], 'Color', [1,1,1], 'linewidth', 2);
line([387, 0], [0, 387], 'Color', [1,1,1], 'linewidth', 2);
set(gcf, 'Color', ([1,1,1]));

% First diagonal
figure();
imshow(img);
plot(diag1(:, :, 1), 'r'); hold on;
plot(diag1(:, :, 2), 'g'); hold on;
plot(diag1(:, :, 3), 'b');

% Second diagonal
figure();
imshow(img);
plot(diag2(:, :, 1), 'r'); hold on;
plot(diag2(:, :, 2), 'g'); hold on;
plot(diag2(:, :, 3), 'b');

% Ex. 4c
red_ch = img(:, :, 1);
green_ch = img(:, :, 2);
blue_ch = img(:, :, 3);
red_ch = red_ch .* 3;
img_red = cat(3, red_ch, green_ch, blue_ch);

figure();
imshow(img_red);

% Ex. 4d
[X16, map16] = rgb2ind(img, 16);
[X128, map128] = rgb2ind(img, 128);
[X256, map256] = rgb2ind(img, 256);

img16 = ind2rgb([X16, map16]);
img128 = ind2rgb([X128, map128]);
img256 = ind2rgb([X256, map256]);

figure();
montage({img16, img128, img256});
    
% Ex. 5 is optional
