function [ A ] = get_A( V, N, p )
%GET_A  计算关于epsilon的线性方程组形成的矩阵A
%   V是每次更新的，V=V+epsilon
%   N-1是矩阵维数
%   p = h^2/k, h是空间步长, k是时间步长
A = zeros(N-1,N-1);
for i = 2: 1: N-2
    A(i, i-1: 1: i+1) = [2*V(i-1), -2*(2*V(i)+p), 2*V(i+1)];
end
A(1,1: 2) = [-2*(2*V(1)+p), 2*V(2)];
A(N-1, N-2: N-1) = [2*V(N-2), -2*(2*V(N-1)+p)];
end