function [ A ] = get_A( V, N, p )
%GET_A  �������epsilon�����Է������γɵľ���A
%   V��ÿ�θ��µģ�V=V+epsilon
%   N-1�Ǿ���ά��
%   p = h^2/k, h�ǿռ䲽��, k��ʱ�䲽��
A = zeros(N-1,N-1);
for i = 2: 1: N-2
    A(i, i-1: 1: i+1) = [2*V(i-1), -2*(2*V(i)+p), 2*V(i+1)];
end
A(1,1: 2) = [-2*(2*V(1)+p), 2*V(2)];
A(N-1, N-2: N-1) = [2*V(N-2), -2*(2*V(N-1)+p)];
end