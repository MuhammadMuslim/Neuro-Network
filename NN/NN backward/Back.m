function [B] = Back(T,Y1,a,Q1,Q2,W1,W2,P1,P2,U11,U12,U21,U22,V11,V12,V21,V22,V31,V32,V41,V42,X1,X2,X3,X4,B)
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
W1old=W1; W2old=W2;
W1new=W1old+cW1;
W2new=W2old+cW2;

U11old=U11; U12old=U12; U21old=U21; U22old=U22;
U11new=U11old+cU11;
U12new=U12old+cU12;
U21new=U21old+cU21;
U22new=U22old+cU22;

V11old=V11; V12old=V12; V21old=V21; V22old=V22; V31old=V31; V32old=V32; V41old=V41; V42old=V42;
V11new=V11old+cV11;
V12new=V12old+cV12;
V21new=V21old+cV21;
V22new=V22old+cV22;
V31new=V31old+cV31;
V32new=V32old+cV32;
V41new=V41old+cV41;
V42new=V42old+cV42;
end