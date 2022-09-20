clc
clear
close all
%унитарная-верхнетр
%
n = 3;
%A = rand(n, n)
A = [-1,4,-1;-2, -1, -11; 2,10,2]
[A_g,G] = My_Givens(A)
GG = G* A_g

function [A,G] = My_Givens(A)
    n = min(size(A,1),size(A,2));
    G = eye(n)
    for j = 1:n
        for i = n:-1:j+1
            a = [A(i,j); A(i-1,j)];
            G1 = G
            G_ = My_Givens2(a);
            G = eye(n);
            G(i,i) = G_(1,1);
            G(i-1,i) = G_(1,2);
            G(i,i-1) =G_(2,1);
            G(i-1,i-1) = G_(2,2)
            A = G'*A
            G = G'*G1
        end
    end
    G = G'
end
function G = My_Givens2(a)
    x = a(2);
    y = a(1);
    if (x == 0) and (y == 0) 
        c = 1;
        s = 0;
    else 
        d = sqrt(x^2+y^2);
        c = x/d;
        s = -y/d;
    end
    G = [c conj(s); -conj(s) conj(c)];
end 