clear;
close all;
clc;
X0=[1;2;3;4];
V0=[1;2;3;4];
gamma=1;
A=[0 1 0 1;1 0 1 0;0 1 0 1;1 0 1 0];%邻接矩阵
D=diag(sum(A,2));%利用Laplacian 行和为0构造D矩阵
L=D-A;%利用定义求出Laplacian矩阵
u0=-(L*X0+gamma*L*V0);%u0初值
options = odeset('MaxStep', 1e-2, 'RelTol',1e-2,'AbsTol',1e-4);
[t,y] = ode45(@odefun,[0 15],[X0;V0;u0],options);
X=y(:,1:4);
V=y(:,5:8);
u=y(:,9:12);
%画图部分
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
%函数部分
function dydt = odefun(t,y)
dydt = zeros(12,1);% 指定dydt为微分方程变量的导数，dydt代表（x1，x2，x3，x4，v1，v2，v3，v4，u1，u2，u3，u4）^T的导数，y代表
% （x1，x2，x3，x4，v1，v2，v3，v4，u1，u2，u3，u4）^T ，x代表位置，v代表速度，u代表控制变量即加速度
A=[0 1 0 1;1 0 1 0;0 1 0 1;1 0 1 0];%邻接矩阵
D=diag(sum(A,2));%利用Laplacian 行和为0构造D矩阵
L=D-A;%利用算法求出Laplacian矩阵
gamma=1;
dydt(1:4)=y(5:8);%
dydt(5:8)=y(9:12);%-(L*y(1:4)+gamma*L*y(5:8));
dydt(9:12)=-(L*y(5:8)+gamma*L*y(9:12));
end

