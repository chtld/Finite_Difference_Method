function [ NumericalSolution_u, error_e ] = extra_Crank_Nicolson( left_a, right_b, time_t, N, M )
%EXTRA_CRANK_NICOLSON 此函数使用用常微分方程的方法导出的Crank_Nicolson格式，并在时间方向外推求解一维抛物型偏微分方程
%   函数输入：left_a 表示区间左端点
%            right_b表示区间右端点
%            time_t表示求解到方程的哪个时间点
%            N表示空间步数
%            M表示时间步数
%   函数返回：函数最终返回包括各个时间层的数值解以及误差
% 
k = time_t/M;                           %时间步长
h = (right_b - left_a)/N;               %空间步长
A = getA(N-1,h,k);
x = left_a: h: right_b;
U1 = zeros(M+1, N+1);
U1(1, :) = sin(pi*x');
A1 = eye(size(A))-1/2*k*A;              %步长为K左右两端的矩阵
A2 = eye(size(A))+1/2*k*A;
U1(2, 2: N) = A1\(A2*U1(1, 2: N)');
A3 = eye(size(A))-k*A;                  %步长为2K左右两端的矩阵
A4 = eye(size(A))+k*A;
for i = 3: 1: M+1
    u1 = A3\(A4*U1(i-2, 2: N)');
    u2 = A1\(A2*U1(i-2, 2: N)');
    u2 = A1\(A2*u2);
    U1(i, 2: N) = 4/3*u2'-1/3*u1';      %外推步
end
NumericalSolution_u = U1;               %返回各个时间层数值解
exact_u = exp(-(pi)^2*time_t)*sin(pi*x);%求真实解
error_e = exact_u - U1(M+1, :);         %返回最后一个时间层的误差
end


