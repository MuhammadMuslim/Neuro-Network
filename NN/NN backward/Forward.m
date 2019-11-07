function [Error] = Forward(X1,X2,X3,X4,Vo1,Vo2,V11,V12,V21,V22,V31,V32,V41,V42,Uo1,Uo2,U11,U12,U21,U22,Go1,W1,W2,T,e)
%Keluaran di Hidden unit P
P_in1=Vo1+(X1*V11)+(X2*V21)+(X3*V31)+(X4*V41);
P_in2=Vo2+(X1*V12)+(X2*V22)+(X3*V32)+(X4*V42);

%Fungsi aktivasi P
P1=1/1+e^-P_in1;
P2=1/1+e^-P_in2;

%Keluaran di Hidden unit Q
Q_in1=Uo1+(P1*U11)+(P2*U21);
Q_in2=Uo2+(P1*U12)+(P2*U22);

%Fungsi aktivasi Q
Q1=1/1+e^-Q_in1;
Q2=1/1+e^-Q_in2;

%Keluaran di Layer Y
Y_in1=Go1+(Q1*W1)+(Q2*W2);

%Fungsi aktivasi Y
Y1=1/1+e^-Y_in1;

%Error
Error=T-Y1;
disp(['Error = ' num2str(Error)]);
end