function plot_figure( u1, N, M )
%PLOT_FIGURE 此函数主要绘制数值解及精确解的图像
%   u1为数值解
%   N为空间步数
%   M为时间步数
h = 1/N;
k = 1/M;
t = 0: k: 1;
x = 0: h: 1;
u = exp(-(pi)^2*t')*sin(pi*x);    %精确解
fig = figure;
set(fig, 'Position',[500,200,1000,500])  
subplot(121);
mesh(x, t, u1);
grid on;
title('数值解');
xlabel('x');
ylabel('t');
zlabel('u');
subplot(122);
mesh(x, t, u);
grid on;
title('精确解');
xlabel('x');
ylabel('t');
zlabel('u');
end

