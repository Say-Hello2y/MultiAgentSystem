clear;
close all;
clc;
X0=[1;2;3;4];
V0=[1;2;3;4];
dt=0.01;T=15;
t=0:dt:T;
n=length(t);
x=X0;
v=V0;
gamma=1;
A=[0 1 0 1;1 0 1 0;0 1 0 1;1 0 1 0];%�ڽӾ���
D=diag(sum(A,2));%����Laplacian �к�Ϊ0����D����
L=D-A;%���ö������Laplacian����
for i=1:n
  u(:,i)=-(L*x+gamma*L*v);%����Ren����ƵĻ�������ϵͳһ�����㷨
  X(:,i)=x;
  V(:,i)=v;
  x=dt*v+x;
  v=dt*u(:,i)+v;
end
figure(1);
plot(t,X)
title('status diagram');
xlabel('time');
ylabel('status');
figure(2);
plot(t,V)
title('velocity diagram');
xlabel('time');
ylabel('velocity');
figure(3)
plot(t,u)
title('acc diagram');
xlabel('time');
ylabel('u');
