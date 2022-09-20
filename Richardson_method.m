clear all
clc
close all

n = 3

A = rand(n)
for i = 1:n
    for j = i:n
        A(i,j) = A(j,i)
    end
end
disp('треуг')
A


while max(eig(A))>2 || min(eig(A))<0
    A=rand(n);
    for i = 1:n
        for j = i:n
            A(i,j) = A(j,i);
        end
    end
end

A
x = rand(n,1);
b = A*x;

I = eye(n,n);
x0 = rand(n,1);
x1 = (I-A)*x0+b;

while norm(x1-x0)>0.001
    x0=x1;
    x1=(I-A)*x0+b;
end

x
x1