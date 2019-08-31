function [ NumericalSolution_u, error_e ] = Crank_Nicolson( left_a, right_b, time_t, N, M )
%CRANK_NICOLSON �˺���ʹ���ó�΢�ַ��̵ķ���������Crank_Nicolson��ʽ���һά������ƫ΢�ַ���
%   �������룺left_a ��ʾ������˵�
%            right_b��ʾ�����Ҷ˵�
%            time_t��ʾ��⵽���̵��ĸ�ʱ���
%            h��ʾ�ռ䲽��
%            k��ʾʱ�䲽��
%   �������أ��������շ��ذ�������ʱ������ֵ���Լ����
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

