clear all;close all;

phantom = 'D:\aviris_hyperspectral_data\19920612_AVIRIS_IndianPine_EW-line_R_Gaussnoise.tif';
t=Tiff(phantom,'r+');
y=read(t);
close(t);
y = y(1:300,1:300,10:50);
load('y_est.mat');

diffrence=y_est-y;
D=reshape(diffrence,300*300*41,1);
MSE=sum(D(:).*D(:))/prod(size(y));

%sigma=11结果为[14782.1441737127]
%sigma=6结果为[12491.0613346883]