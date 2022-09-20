%Приведение матрицы к треугольному виду вращениями Гивенса.
clc
clear
close all

n = 3;
%A = rand(n, n)%complex(, rand(n,n));
A = [-1,4,-1;-2, -1, -11; 2,10,2]
size(A,1)
A_g = my_householder(A)

function A = my_householder(A)
    n = size(A,1); 
    I = eye(n);
    for j=1:n-1
         R=A; 
         x=R(j:n,j)
         v=-sign(x(1))*norm(x)*eye(n-j+1,1)-x
         if norm(v)>0
             v=v/norm(v)
             P=I; 
             P(j:n,j:n)=P(j:n,j:n)-2*v*v'
             A = P*A
         end
    end
end
