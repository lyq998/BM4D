clear all;close all;

phantom = 'D:\aviris_hyperspectral_data\19920612_AVIRIS_IndianPine_EW-line_R_Gaussnoise.tif';
t=Tiff(phantom,'r+');
y=read(t);
close(t);
y = y(1:300,1:300,10:50);

%˫������y_est
%�����ֶ�����consol��

diffrence=y_est-y;
D=reshape(diffrence,300*300*41,1);
MSE=sum(D(:).*D(:))/prod(size(y));

%���Ϊ[14782.1441737127]