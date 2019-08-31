function [ exactu, U ] = solve( N, M )
%SOLVE �˺���ʵ����������ƫ΢�ַ��̣����ؾ�ȷ��exactu����ֵ��U
%   ����ռ䲽��N��ʱ�䲽��M
h = 1/N;                               %�ռ䲽��
k = 0.5/M;                             %ʱ�䲽��          
p = h^2/k;                             %��ʼ��
epsilon = zeros(N+1, 1);
U = zeros(M+1, N+1);
exactu = exactsolution( N, M );        %%��ȷ��
%%
%%����ֵ�ͱ߽�����
U(1, 1: N+1) = exactu(1, 1: N+1);
U(1: M+1, 1) = exactu(1: M+1, 1);
U(1: M+1, N+1) = exactu(1: M+1, N+1);
% for i = 0: 1: N
%     U(1, i+1) = fzero(@(u) exactf(u,i*h,0),2);
% end
% for i = 0: 1: M
%    U(i+1, 1) = fzero(@(u) exactf(u,0,i*k),2);
%    U(i+1, N+1) = fzero(@(u) exactf(u,1,i*k),2);
% end
%%
%ţ�ٷ���������ƫ΢�ַ���
V =zeros(N+1, 1);    
for i = 2:1:M+1
    V = U(i-1,:)';
    V(1) = U(i,1);
    V(N+1) = U(i,N+1);
    u0 = U(i-1,:)';
    normofepsilon = 1;
    while (normofepsilon > 1e-8)  %��������Ч��С��1e-8��ʱ�����ֹͣ
        A = get_A( V(2:N,1), N, p );
        F = get_F( V, u0, N, p );
        epsilon(2:N,1) = A\F;
        V = V+epsilon;
        normofepsilon = norm(epsilon,inf);
    end
    U(i,2:N)=V(2:N,1)';
end
end

