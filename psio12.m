clc
clear all
close all

img = imread('image.jpg');
bw = im2bw(img);
bw = 1 - bw;
% bw = bwareaopen(bw, 30);

figure();
montage({img, bw});

% Ex. 1a
se1 = strel('diamond', 6);
se2 = strel('disk', 6);
se3 = strel('octagon', 6);
se4 = strel('line', 6, 45);
se5 = strel('rectangle', [3, 6]);
se6 = strel('square', 6);

% Showing structural elements seperately,
% because montage rounds the corners
figure();
imshow(se1.Neighborhood);
truesize([200, 200]);

figure();
imshow(se2.Neighborhood);
truesize([200, 200]);

figure();
imshow(se3.Neighborhood);
truesize([200, 200]);

figure();
imshow(se4.Neighborhood);
truesize([200, 200]);

figure();
imshow(se5.Neighborhood);
truesize([200, 200]);

figure();
imshow(se6.Neighborhood);
truesize([200, 200]);

% figure();
% montage({se1.Neighborhood, se2.Neighborhood, se3.Neighborhood, ...
%    se4.Neighborhood, se5.Neighborhood, se6.Neighborhood});

% Ex. 1b
eroded = imerode(bw, se1);
dilated = imdilate(bw, se1);
opened = imdilate(eroded, se1);
closed = imerode(dilated, se1);

figure();
montage({eroded, dilated, opened, closed});

% Ex. 1c
initials = imcrop(img, [340, 350, 200, 80]);
initials_bw = im2bw(initials);
initials_bw = 1 - initials_bw;

figure();
montage({initials, initials_bw});

eroded = imerode(initials_bw, se1);
dilated = imdilate(initials_bw, se1);

diff1 = imabsdiff(initials_bw, eroded);
diff2 = imabsdiff(initials_bw, dilated);
diff3 = imabsdiff(dilated, eroded) / 2;

figure();
montage({diff1, diff2, diff3}, 'Size', [3, 1]);













