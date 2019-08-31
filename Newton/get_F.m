function [ G ] = get_F( V, u0, N, p )
%GET_F 计算关于epsilon的线性方程组的右端项
%   输入每次更新的V，及上一步的解u0，以及矩阵的维数N和参数p
%   V是每次更新的，V=V+epsilon
%   N-1是矩阵维数
%   p = h^2/k, h是空间步长, k是时间步长
F = zeros(N+1, 1);
for i=2:1:N
    F(i) = V(i-1)^2-2*(V(i)^2+p*V(i))+V(i+1)^2+u0(i-1)^2-2*(u0(i)^2-p*u0(i))+u0(i+1)^2;
end
F = -F;
G =F(2:N,1);
end