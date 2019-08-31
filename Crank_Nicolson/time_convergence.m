function time_convergence()
%此函数求解时间方向收敛阶
a = 0;
b = 1;
T = 1;
N = 1024;
M = 16;
fprintf('*******************************************************************\n');
fprintf('**********************时间方向误差及收敛阶**************************\n');
fprintf('误差的L2范数       收敛阶                 误差的无穷范数       收敛阶\n');
[u1, e1] = Crank_Nicolson(a, b, T, N, M);
fprintf('%10.7f         ___                   %10.7f           ___\n',norm(e1,2),norm(e1,inf));
for i = 1: 1: 6
   M = 2*M;
   [u2, e2] =  Crank_Nicolson(a, b, T, N, M);
   CR_L2 = log(norm(e1, 2)/norm(e2, 2))/log(2);
   CR_Inf = log(norm(e1, inf)/norm(e2, inf))/log(2);
   fprintf('%10.7f        %6.4f                 %10.7f          %6.4f\n',norm(e2,2),CR_L2,norm(e2,inf),CR_Inf);
   e1 = e2;
   u1 = u2;
end
plot_figure( u1, N, M )
fprintf('*****************************END***********************************\n\n');
end