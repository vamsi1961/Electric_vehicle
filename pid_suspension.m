m1 = 2500;
m2 = 320;
k1 = 80000;
k2 = 500000;
b1 = 350;
b2 = 15020;

nump=[(m1+m2) b2 k2];
denp2 = (m1*(b1+b2))+(m2*b1);
denp3 = (m1*(k1+k2))+(m2*k1)+(b1*b2);
denp4 = (b1*k2)+(b2*k1);
denp=[(m1*m2) denp2 denp3 denp4 k1*k2];
G1=tf(nump,denp);

num1=[-(m1*b2) -(m1*k2) 0 0];
den1_2 = (m1*(b1+b2))+(m2*b1);
den1_3 = (m1*(k1+k2))+(m2*k1)+(b1*b2);
den1_4 = (b1*k2)+(b2*k1);
den1=[(m1*m2) den1_2 den1_3 den1_4 k1*k2];
G2=tf(num1,den1);

numf=num1;
denf=nump;
F=tf(numf,denf);

Kd = 208025;
Kp = 832100;
Ki = 624075;
C = pid(Kp,Ki,Kd);

sys_cl=F*feedback(G1,C);
t=0:0.05:5;
step(0.2*sys_cl,t)
title('Response to a 0.2-m Step under PID Control');

axis([0 5 -.02 .02]);