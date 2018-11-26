clear all;close all;
phantom           = 'Gaussnoise_Midfil_300.tif';
t=Tiff(phantom,'r+');
y=read(t)*10;
a=im2double(y);
x=im2uint16(a);
z=im2double(x);
z=z/10;

y_1=y(50,50,50);
x_1=x(50,50,50);
z_1=z(50,50,50);
a_1=a(100,100,50);