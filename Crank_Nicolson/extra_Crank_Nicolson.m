function [ NumericalSolution_u, error_e ] = extra_Crank_Nicolson( left_a, right_b, time_t, N, M )
%EXTRA_CRANK_NICOLSON �˺���ʹ���ó�΢�ַ��̵ķ���������Crank_Nicolson��ʽ������ʱ�䷽���������һά������ƫ΢�ַ���
%   �������룺left_a ��ʾ������˵�
%            right_b��ʾ�����Ҷ˵�
%            time_t��ʾ��⵽���̵��ĸ�ʱ���
%            N��ʾ�ռ䲽��
%            M��ʾʱ�䲽��
%   �������أ��������շ��ذ�������ʱ������ֵ���Լ����
% 
k = time_t/M;                           %ʱ�䲽��
h = (right_b - left_a)/N;               %�ռ䲽��
A = getA(N-1,h,k);
x = left_a: h: right_b;
U1 = zeros(M+1, N+1);
U1(1, :) = sin(pi*x');
A1 = eye(size(A))-1/2*k*A;              %����ΪK�������˵ľ���
A2 = eye(size(A))+1/2*k*A;
U1(2, 2: N) = A1\(A2*U1(1, 2: N)');
A3 = eye(size(A))-k*A;                  %����Ϊ2K�������˵ľ���
A4 = eye(size(A))+k*A;
for i = 3: 1: M+1
    u1 = A3\(A4*U1(i-2, 2: N)');
    u2 = A1\(A2*U1(i-2, 2: N)');
    u2 = A1\(A2*u2);
    U1(i, 2: N) = 4/3*u2'-1/3*u1';      %���Ʋ�
end
NumericalSolution_u = U1;               %���ظ���ʱ�����ֵ��
exact_u = exp(-(pi)^2*time_t)*sin(pi*x);%����ʵ��
error_e = exact_u - U1(M+1, :);         %�������һ��ʱ�������
end


