function A = getA(n, h, k)
A = zeros(n,n);
for i=2: 1: n-1
    A(i, i-1:1:i+1) = [1 -2 1];
end
A(1, 1: 2) = [-2 1];
A(n, n-1: n) = [1,-2];
A = (1/h^2)*A;
end