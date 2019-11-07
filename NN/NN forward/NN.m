%   O
%       O   
%   O       O   
%       O       
%   O       O
%       O
%   O
%Input:4 - Hidden Layer:1(3 node) - Output:2

clear all;
clc;
%%
%nb.matriks bobot & nilai banding aktifasi
u11=0.1;u12=0.2;u13=-0.3;u21=-0.3;u22=-0.4;u23=0.3;u31=0.2;u32=-0.1;u33=0.5;u41=0.2;u42=0.4;u43=01;f1=0.5;f2=0.1;
%%
net_sebelum = [ u11 u12 u13 u21 u22 u23 u31 u32 u33 u41 u42 u43];
net_setelah = u11+ u12+ u13+ u21+ u22+ u23+ u31+ u32+ u33+ u41+ u42+ u43;
%%
%input net
x1 = input ('Input U1= ');
x2 = input ('Input U2= ');
x3 = input ('Input U3= ');
x4 = input ('Input U4= ');
%%
%nilai bias 
bias = 1;
%%
%fungsi threshold
%tan h (tan hyperbolik)
negatif = -1;%bentuk bipolar
positif = 1;%bentuk bipolar
%jika bentuk Th diinginkan dalam bentuk biner maka ubah nilai negatif=0 & positif=1
%%
%nb. matrik vektor baris 
nilai_input = [u11 u12 u13;u21 u22 u23;u31 u32 u33;u41 u42 u43;];%bentuk matrik vektor baris 
%%
target = x1*x2*x3*x4*bias;
delta_bias = target * bias; %net bias
delta_bobot = target * nilai_input; %net pembobot
%%
%========================================================================
w11 = delta_bobot (1,1)* nilai_input (1,1);
w12 = delta_bobot (1,2)* nilai_input (1,2);
w13 = delta_bobot (1,3)* nilai_input (1,3);
%========================================================================
w21 = delta_bobot (2,1)* nilai_input (2,1);
w22 = delta_bobot (2,2)* nilai_input (2,2);
w23 = delta_bobot (2,3)* nilai_input (2,3);
%========================================================================
w31 = delta_bobot (3,1)* nilai_input (3,1);
w32 = delta_bobot (3,2)* nilai_input (3,2);
w33 = delta_bobot (3,3)* nilai_input (3,3);
%========================================================================
w41 = delta_bobot (4,1)* nilai_input (4,1);
w42 = delta_bobot (4,2)* nilai_input (4,2);
w43 = delta_bobot (4,3)* nilai_input (4,3);
%%
y_in1 = (x1*w11)+(x2*w12)+(x3*w13);
y_in2 = (x1*w21)+(x2*w22)+(x3*w23);
y_in3 = (x1*w31)+(x2*w32)+(x3*w33);

disp(['y_in1=',num2str(y_in1,'%1.1f')]);
disp(['y_in1=',num2str(y_in2,'%1.1f')]);
disp(['y_in1=',num2str(y_in3,'%1.1f')]);
%%
a1= f1*y_in1;
a2= f2*y_in2;
disp(['a1=',num2str(a1,'%1.1f')]);
disp(['a2=',num2str(a2,'%1.1f')]);
%%
%fungsi aktifasi(f1)
%======================================================================
if (0<y_in1<=1);
    a1 = 2*(y_in1);
elseif(y_in1>1);
    a1 = 2;
elseif(y_in1<=0);
    a1 = 0;
end 
if (0<y_in2<=1);
    a2 = y_in2;
elseif(y_in2>1);
    a2 = 2*(y_in2)^2;
elseif(y_in2<=0);
    a2 = 1;
end
%%
%cek & recek aktifasi net
%=======================================
if (net_setelah == target)
    disp ('tidak dikenali')
else
    disp ('dikenali')
end