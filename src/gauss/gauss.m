function [L, U, x] = gauss(A, b)
%GAUSS 输入值A，b为系数矩阵，输出值为LU矩阵和解向量x
%   自动判断矩阵A的size并用列主元的方法分解出LU并求出解向量x
len = length(A);        %得到A的长度
new_matrix = [A, b];    %按照高斯消元法的形式组成新的矩阵
for k = 1:len - 1
    [col_max, row] = max(abs(new_matrix(k:len, k)));
    if col_max == 0     %如果整列为0直接结束循环，无法分解
        return
    end
    %执行行交换
    temp_matrix = new_matrix(row + k - 1, k:len + 1);
    new_matrix(row + k - 1, k:len + 1) = new_matrix(k, k:len + 1);
    new_matrix(k, k:len + 1) = temp_matrix;
    %高斯消元
    for i = k + 1:len
        num = new_matrix(i, k) / new_matrix(k, k);
        new_matrix(i, k:len + 1) = new_matrix(i, k:len + 1) - num * new_matrix(k, k:len + 1);
    end
end
%之前循环没有判断最后一列，现在补上
if new_matrix(len, len) == 0
    return
end
%小tips：高斯消元后的结果就是U矩阵
U = new_matrix(:, 1:len);
L = A / U;
%高斯求解公式
x(len) = new_matrix(len, len + 1) / new_matrix(len, len);
for m = len-1:-1:1
    x(m) = (new_matrix(m,len + 1) - sum(new_matrix(m,m + 1:len).*x(m + 1:len))) / new_matrix(m,m);
end
end

