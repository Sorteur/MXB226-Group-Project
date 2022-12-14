function A = cholesky_factorisation_sparse(A)
% performs Cholesky factorisation on SPD matrix A

n = size(A,1);

for j = 1:n
    for i = 1:j-1
        
        for k = 1:i-1
            if A(k,j) ~= 0
                A(i,j) = A(i,j) - A(k,i)*A(k,j);
            end
        end
        A(i,j) = A(i,j) / A(i,i);
        A(j,j) = A(j,j) - A(i,j)^2 ;
    end
    A(j,j) = sqrt(A(j,j));
end
A = triu(A);
end

