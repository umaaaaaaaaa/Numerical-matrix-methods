clc
clear
close all

n = 3;
A = complex(rand(n, n), rand(n,n));
A = 0.5*(A+A');
A = A + n*eye(n);%диагональное преобладание

x = rand(n, 1)
b = A * x
try chol(A);
    disp('Matrix is symmetric positive definite.')
catch ME
    disp('Matrix is not symmetric positive definite')
end
A%комплексная матрица симметричная положительно определенная

chol = chol(A)
my_ch = choletsky(A)
my_A = conj(my_ch).'*my_ch 
A
chol_a =(conj(chol)).'*chol

%решаем систему
x_chol = my_ch\(my_ch'\b)
x

function L = choletsky(A)
if size(A,1) == 1
    L = sqrt(A);
end
if size(A,1) > 1
    a11 = sqrt(A(1,1));
    a12 = A(1,2:end)/a11;
    a22 = A(2:end, 2:end) - a12'*a12; 
    A22 = choletsky(a22);
    %L = [sqrt(A(1,1)) zeros(1,size(A,1)-1); A(2:end,1) Temp];% левая
    L = [a11 a12; zeros(size(A,1)-1,1) A22];%правая
end
end


