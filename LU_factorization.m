clc
clear
close all
rng(6)
n = 4;
A = rand(n, n)%Невырожденная матрица
%A = [2,7,-6;8,2,1;7,4,2]
%A = [2,3;4,5]
x = rand(n, 1)
b = A * x

[L_my,U_my,P_my] = my_LU(A)
[L_mat, U_mat,P_mat] = lu(A)
A_my = P_my'*L_my*U_my
A_mat = P_mat'*L_mat*U_mat
A
d = det(A)
%my_A = conj(my_ch).'*my_ch
%chol_a =(conj(chol)).'*chol

%решаем систему
%x_lu = my_lu\(my_lu'\b)
%x

function [L,U,P] = my_LU(A)
if size(A,1) == 1
    L = 1
    U = A
    P = 1
end
if size(A,1) > 1
    A
    k = size(A,1)
    P_tmp = eye(k,k);
    [m,ind] = max(A(1:end,1))
    an = zeros(1,k);
    a1 = zeros(1,k);
    an(1,ind) = 1;
    a1(1,1) = 1;
    P_tmp(1,1:end) = an;
    P_tmp(ind,1:end) = a1
    PA = P_tmp*A
    alfa = PA(1,1);
    l = PA(2:k,1)/alfa
    a = PA(1,2:k);
    A22 = PA(2:end,2:end)-l*a
    %P22 = P_tmp(2:end,2:end)
    %U22 = LU22(2)
    %P22A22 = P22*A22
    [L22,U22,P2] = my_LU(A22);
    %L22 = LU22(1)
    Pn = eye(k,k);
    Pn(2:end,2:end) = P2
    P = Pn*P_tmp
    L = [1 zeros(1,size(A,1)-1);P2*l L22];
    U = [alfa a;zeros(size(A,1)-1,1) U22];
end
end