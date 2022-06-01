clc
clear all
close all

% Zad. 1a
file = 'sunflower';

jpg = imread(strcat(file, '.jpg'));
bmp = imread(strcat(file, '.bmp'));
png = imread(strcat(file, '.png'));
tiff = imread(strcat(file, '.tiff'));

frames = 34;
[X, map] = imread('anim.gif', 1:frames);

% Zad. 1b
info = imfinfo('anim.gif');
% frames number equals rows number from the info struct
frames = 34;

% display a gif without looping
i = 1;
for i = 1:1:frames
    imshow(X(:,:,:, i), map);
    i = i + 1;
end

% display a gif in a loop
i = 1;
while(1)
    imshow(X(:,:,:, mod(i,frames)+1), map);
    i = i + 1;
end

% Zad. 1c
imshow(jpg);
image(jpg);
imagesc(jpg);

% Zad. 1d
path = 'D:/e_mgr/psio/';
imwrite(jpg, strcat(path, 'outfile.png'));
imwrite(jpg, strcat(path, 'outfile.bmp'));
imwrite(jpg, strcat(path, 'outfile.tiff'));

% Zad. 2
file = 'sunflower.jpg';
rgb = imread(file);
n = 64; % number of colors

[X, map] = rgb2ind(rgb, n); % rgb to indexed 
gray = rgb2gray(rgb); % rgb to grayscale
out_rgb = ind2rgb(X, map); % indexed to rgb
gray2 = ind2gray(X, map); % indexed to grayscale
[X2, map2] = gray2ind(gray, n); % grayscale to indexed

level = 0.5;
bw = im2bw(X, map, level); % indexed to binary
bw2 = im2bw(gray, level); % grayscale to binary
bw3 = im2bw(rgb, level); % rgb to binary

bin = imbinarize(gray); % grayscale to binary

imshow(gray);
imshow(out_rgb);
imshow(bw);
imshow(bin);

path = 'D:/e_mgr/psio/';
imwrite(gray, strcat(path, 'gray.png'));
imwrite(bw, strcat(path, 'bw.png'));
imwrite(bin, strcat(path, 'bin.png'));
