import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

X0 = np.arange(1,13).reshape(6,2)

print(X0)

x=X0
A = np.array([[0,0 ,0, 0 ,0 ,1],[1, 0, 0 ,0 ,0 ,0],[0 ,1 ,0 ,0 ,0 ,0],[1, 0 ,1 ,0 ,0, 0],[0 ,0 ,0 ,1 ,0 ,0],[0 ,0 ,1 ,0 ,1, 0]]) #邻接矩阵
# print(A)
D=np.diag(A.sum(axis=1))#利用Laplacian 行和为0构造D矩阵
# print(D)
L=D-A #利用算法求出Laplacian矩阵
dt = 0.01
T = 10
t = np.arange(0,T/dt)*dt
#print(t.size)
u = np.zeros((t.size,6,2))
X = np.zeros((t.size,6,2))
for i in range(t.size):
    #print(np.dot(-L,x))
    u[i,:,:]=np.dot(-L,x)
    X[i,:,:]=x
    x=dt*u[i,:,:]+x

# 画图
fig=plt.figure()
ax1 = Axes3D(fig)

for i in range(6):
    ax1.plot3D(t,X[:,i,0],X[:,i,1])    #绘制空间曲线

#图例
ax1.set_xlabel("Time Axis")
ax1.set_ylabel("x[0] Axis")
ax1.set_zlabel("x[1] Axis")
ax1.set_title("二维状态向量一致性")
plt.show()
