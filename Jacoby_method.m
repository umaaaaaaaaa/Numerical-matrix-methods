clear
n = 5;
A = rand(n,n);
for k = 1:n
    A(k,k) = sum(abs(A(k, 1:n)));
end 
A;
%B = rand(n,n);
%D = diag(rand(5,1));
B = A;
for k = 1:n
    B(k,k) = 0;
end 
x = rand(n,1);
D = diag(diag(A)) ;
b = A*x;
x_prev = rand(5,1);
x_cur = zeros(5,1);
x_temp = zeros(5,1);
while norm(x_prev - x_cur)>0.001
    x_temp = x_cur;
    x_cur = inv(D)*(b - B*x_prev);
    x_prev = x_temp;
end
x
x_cur
