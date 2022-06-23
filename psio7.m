close all;
clear all;
clc;

path = 'D:/e_mgr/psio/mountains.jpg';
img = imread(path);

gray = rgb2gray(img);
figure(1);
montage({img, gray});

red = zeros(size(img), 'uint8');
red(:, :, 1) = img(:, :, 1);

green = zeros(size(img), 'uint8');
green(:, :, 2) = img(:, :, 2);

blue = zeros(size(img), 'uint8');
blue(:, :, 3) = img(:, :, 3);

figure(2);
montage({red, green, blue}, 'Size', [1, 3]);

B1 = dct2(gray);
B2 = dct2(gray);
B3 = dct2(gray);
figure(3);
imshow(log(abs(B1)), []), colormap(jet), colorbar;

B1(abs(B1) < 25) = 0;
B2(abs(B2) < 50) = 0;
B3(abs(B3) < 100) = 0;

A = idct2(B1);
figure(4);
imshow(A, []);

A = idct2(B2);
figure(5);
imshow(A, []);

A = idct2(B3);
figure(6);
imshow(A, []);

nonzeros1 = nnz(B1)
nonzeros2 = nnz(B2)
nonzeros3 = nnz(B3)
eff = nonzeros1 / (2048 * 1536) * 100;

AA = [
   140   121   113   104    94    86    89    91;
   139   122   112   102    97    93    93    94;
   140   123   112   105    97    97    97    96;
   140   123   112   106    98    98    98    96;
   139   124   112   104   103    99    97    94;
   136   120   108   103   102    98    95    92;
   134   119   110   105   100    99    94    91;
   133   124   114   105   100    98    94    93;
];
range = [85 141];
% imshow(AA, [85 141]);
% truesize(1, [400 400]);

AA_norm = AA - 128;
Y = dct2(AA_norm);

Q = [16 11 10 16 24 40 51 61;
    12 12 14 19 26 28 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99];

YY = round(Y ./ Q);

nonzeros_after = nnz(YY);
nonzeros_before = nnz(Y);

Y_quant = YY .* Q;
AA_comp = round(idct2(Y_quant)) + 128;

figure(7);
imshow(AA, range);
truesize(7, [300, 300])
title('Obraz oryginalny');

figure(8);
imshow(AA_comp, range);
truesize(8, [300, 300]);
title('Obraz po kompresji');

gray = double(gray) / 256;
T = dctmtx(8);
B = blkproc(gray, [8, 8], 'P1*x*P2', T, T');

mask = [
    1 1 1 1 0 0 0 0;
    1 1 1 0 0 0 0 0;
    1 1 0 0 0 0 0 0;
    1 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0
];
B2 = blkproc(B, [8, 8], 'P1.*x', mask);
gray2 = blkproc(B2, [8, 8], 'P1*x*P2', T', T);

figure(9);
imshow(gray);

figure(10);
imshow(gray2);
