function plot_figure( exactu, u, N, M)
%PLOT_FIGURE 此处显示有关此函数的摘要
%   此处显示详细说明
h = 1/N;                              %空间步长
k = 0.5/M;                            %时间步长
x = 0: h: 1;
t = 0: k: 0.5;
subplot(131);
mesh(x, t, exactu);
title('精确解');
subplot(132);
mesh(x, t, u);
title('数值解');
subplot(133);
mesh(x, t, exactu-u);
title('误差');
end

