%   O
%       O   
%   O       O   
%       O       O
%   O       O
%       O
%   O
%Input:4 - Hidden Layer:2(3 & 2 node tiap layer) - Output:1

clc;
disp('====JARINGAN SYARAF TIRUAN===');
disp('=------BACKWARD------=');
disp('Masukkan nilai Input');
X1=input('X1 = ');
X2=input('X2 = ');
X3=input('X3 = ');
X4=input('X4 = ');

%Nilai tetap (Bias 1,2 dan 3)
Vo1=0.2; Vo2=0.1; Uo1=0.3; Uo2=0.2; Go1=0.1;
disp('Bias');
disp(['' num2str(Vo1)]);
disp(['' num2str(Vo2)]);
disp(['' num2str(Uo1)]);
disp(['' num2str(Uo2)]);
disp(['' num2str(Go1)]);

%Inisialisasi awal
V11=0.2; V12=0.1; V21=-0.1; V22=0.3; V31=0.2; V32=0.2; V41=0.2; V42=0.3;
U11=0.2; U12=0.2; U21=0.3; U22=0.1;
W1=0.1; W2=0.2;
Y1=0.2;
Q1=0.1;Q2=0.2;
W1=01;W2=0.2;W3=0.2;
P1=0.3;P2=0.2;
T=3; a=0.2; e=2.718; B=0;
disp(['Target = ' num2str(T)]);
[Error] = Forward(X1,X2,X3,X4,Vo1,Vo2,V11,V12,V21,V22,V31,V32,V41,V42,Uo1,Uo2,U11,U12,U21,U22,Go1,W1,W2,T,e);
[B] = Back(T,Y1,a,Q1,Q2,W1,W2,P1,P2,U11,U12,U21,U22,V11,V12,V21,V22,V31,V32,V41,V42,X1,X2,X3,X4,B);

%Propagasi Balik
dy=(T-Y1)*Y1*(1-Y1);

cW1=a*dy*Q1;
cW2=a*dy*Q2;

%Faktor d di unit Q
dq_in1=dy*W1;
dq_in2=dy*W2;

%Faktor kesalahan d di Hidden unit Q
dq1=dq_in1*Q1*(1-Q1);
dq2=dq_in2*Q2*(1-Q2);

cU11=a*dq1*P1;
cU12=a*dq2*P1;
cU21=a*dq1*P2;
cU22=a*dq2*P2;

%Faktor d di Unit P
dp_in1=(dq1*U11)+(dq1*U12);
dp_in2=(dq2*U21)+(dq2*U22);

%Faktor kesalahan di Hidden unit P
dp1=(dp_in1*P1)*(1-P1);
dp2=(dp_in2*P2)*(1-P2);

cV11=a*dp1*X1;
cV12=a*dp2*X1;
cV21=a*dp1*X2;
cV22=a*dp2*X2;
cV31=a*dp1*X3;
cV32=a*dp2*X3;
cV41=a*dp1*X4;
cV42=a*dp2*X4;

%Perubahan Bobot
W1old=W1; W2old=W2; W3old=W3;
disp('Bobot awal');
disp(['' num2str(W1old)]);
disp(['' num2str(W2old)]);
disp(['' num2str(W3old)]);
W1new=W1old+cW1;
W2new=W2old+cW2;
disp('Perubahan bobot');
disp(['' num2str(W1new)]);
disp(['' num2str(W2new)]);

%nb. matriks
U11old=U11; U12old=U12; U21old=U21; U22old=U22;
U11new=U11old+cU11;
U12new=U12old+cU12;
U21new=U21old+cU21;
U22new=U22old+cU22;

disp('Perubahan ke 1');
disp(['' num2str(U11new)]);
disp(['' num2str(U12new)]);
disp(['' num2str(U21new)]);
disp(['' num2str(U22new)]);

V11old=V11; V12old=V12; V21old=V21; V22old=V22; V31old=V31; V32old=V32; V41old=V41; V42old=V42;
V11new=V11old+cV11;
V12new=V12old+cV12;
V21new=V21old+cV21;
V22new=V22old+cV22;
V31new=V31old+cV31;
V32new=V32old+cV32;
V41new=V41old+cV41;
V42new=V42old+cV42;

disp('Perubahan ke 2');
disp(['' num2str(V11new)]);
disp(['' num2str(V11new)]);
disp(['' num2str(V21new)]);
disp(['' num2str(V22new)]);
disp(['' num2str(V31new)]);
disp(['' num2str(V32new)]);

%Keluaran di Hidden unit P
P_in1=Vo1+(X1*V11new)+(X2*V21new)+(X3*V31new);
P_in2=Vo2+(X1*V12new)+(X2*V22new)+(X3*V32new);

%Fungsi aktivasi P
P1=1/1+e^-P_in1;
P2=1/1+e^-P_in2;

%Keluaran di Hidden unit Q
Q_in1=Uo1+(P1*U11new)+(P2*U21new);
Q_in2=Uo2+(P1*U12new)+(P2*U22new);

%Keluaran di Layer Y
Y_in1=Go1+(Q1*W1new)+(Q2*W2new);

%Fungsi aktivasi Y
Y1=1/1+e^-Y_in1;
disp(['Y =' num2str(Y_in1)]);

%Error
Error=T-Y1;
disp(['Error = ' num2str(Error)]);