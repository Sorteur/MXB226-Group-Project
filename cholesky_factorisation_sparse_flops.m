function [A,flops] = cholesky_factorisation_sparse_flops(A,flops)
% performs Cholesky factorisation on SPD matrix A

n = size(A,1);

for j = 1:n
    for i = 1:j-1
        
        for k = 1:i-1
            if A(k,j) ~= 0
                A(i,j) = A(i,j) - A(k,i)*A(k,j);
                flops = flops + 2;
            end
        end
        A(i,j) = A(i,j) / A(i,i);
        flops = flops + 1;
        A(j,j) = A(j,j) - A(i,j)^2 ;
        flops = flops + 2;
    end
    A(j,j) = sqrt(A(j,j));
    flops = flops + 1;
end
A = triu(A);
end

