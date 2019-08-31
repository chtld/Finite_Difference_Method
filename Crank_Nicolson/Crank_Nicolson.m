function [ NumericalSolution_u, error_e ] = Crank_Nicolson( left_a, right_b, time_t, N, M )
%CRANK_NICOLSON 此函数使用用常微分方程的方法导出的Crank_Nicolson格式求解一维抛物型偏微分方程
%   函数输入：left_a 表示区间左端点
%            right_b表示区间右端点
%            time_t表示求解到方程的哪个时间点
%            h表示空间步长
%            k表示时间步长
%   函数返回：函数最终返回包括各个时间层的数值解以及误差
% 
k = time_t/M;
h = (right_b - left_a)/N;
A = getA(N-1,h,k);
x = left_a: h: right_b;
U1 = zeros(M+1, N+1);
U1(1, :) = sin(pi*x');
A1 = eye(size(A))-1/2*k*A;
A2 = eye(size(A))+1/2*k*A;
for i=2:1:M+1
    U1(i, 2: N) = A1\(A2*U1(i-1, 2: N)');
end
NumericalSolution_u = U1;
exact_u = exp(-(pi)^2*time_t)*sin(pi*x);
error_e = exact_u - U1(M+1, :);
end

