function plot_figure( exactu, u, N, M)
%PLOT_FIGURE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
h = 1/N;                              %�ռ䲽��
k = 0.5/M;                            %ʱ�䲽��
x = 0: h: 1;
t = 0: k: 0.5;
subplot(131);
mesh(x, t, exactu);
title('��ȷ��');
subplot(132);
mesh(x, t, u);
title('��ֵ��');
subplot(133);
mesh(x, t, exactu-u);
title('���');
end

