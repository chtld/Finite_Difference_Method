N = 100;
M = 100;
[exactu, U] = solve(N, M);   %求解，返回精确解和数值解
plot_figure(exactu, U, N, M);%绘图