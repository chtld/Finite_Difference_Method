function plot_figure( u1, N, M )
%PLOT_FIGURE �˺�����Ҫ������ֵ�⼰��ȷ���ͼ��
%   u1Ϊ��ֵ��
%   NΪ�ռ䲽��
%   MΪʱ�䲽��
h = 1/N;
k = 1/M;
t = 0: k: 1;
x = 0: h: 1;
u = exp(-(pi)^2*t')*sin(pi*x);    %��ȷ��
fig = figure;
set(fig, 'Position',[500,200,1000,500])  
subplot(121);
mesh(x, t, u1);
grid on;
title('��ֵ��');
xlabel('x');
ylabel('t');
zlabel('u');
subplot(122);
mesh(x, t, u);
grid on;
title('��ȷ��');
xlabel('x');
ylabel('t');
zlabel('u');
end

