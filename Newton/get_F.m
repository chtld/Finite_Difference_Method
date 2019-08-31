function [ G ] = get_F( V, u0, N, p )
%GET_F �������epsilon�����Է�������Ҷ���
%   ����ÿ�θ��µ�V������һ���Ľ�u0���Լ������ά��N�Ͳ���p
%   V��ÿ�θ��µģ�V=V+epsilon
%   N-1�Ǿ���ά��
%   p = h^2/k, h�ǿռ䲽��, k��ʱ�䲽��
F = zeros(N+1, 1);
for i=2:1:N
    F(i) = V(i-1)^2-2*(V(i)^2+p*V(i))+V(i+1)^2+u0(i-1)^2-2*(u0(i)^2-p*u0(i))+u0(i+1)^2;
end
F = -F;
G =F(2:N,1);
end