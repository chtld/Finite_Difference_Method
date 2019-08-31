function [ U ] = exactsolution( N, M )
%输入时间步数及空间步数
h = 1/N;
k = 0.5/M;
U = zeros(M+1, N+1);
for i = 0: 1: N
    for j =0: 1: M
        U(j+1, i+1) = fzero(@(u) exactf(u,i*h,j*k),2);
    end
end
end

function  f=exactf(u,x,t)
    f= 2*u-3+log(u-1/2)-2*(2*t-x);
end