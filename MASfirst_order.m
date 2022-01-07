clear;
close all;
clc;
X0=[1;2;3;4;5;6];%状态初始值
dt=0.01;T=10;%步长与仿真时间
t=0:dt:T;
n=length(t);
x=X0;
A=[0 0 0 0 0 1;1 0 0 0 0 0;0 1 0 0 0 0;1 0 1 0 0 0;0 0 0 1 0 0;0 0 1 0 1 0];%邻接矩阵
D=diag(sum(A,2));%利用Laplacian 行和为0构造D矩阵
L=D-A%利用算法求出Laplacian矩阵
for i=1:n
  u(:,i)=-L*x;
  X(:,i)=x;
  x=dt*u(:,i)+x;
end
%画出状态图与u随时间的图像
figure(1);
plot(t,X)
title('status diagram');
xlabel('time');
ylabel('status');
legend('x1','x2','x3','x4','x5','x6');
figure(2);
plot(t,u)
title('velocity diagram');
xlabel('time');
ylabel('u');
legend('u1','u2','u3','u4','u5','u6');