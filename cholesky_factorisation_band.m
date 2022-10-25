function A = cholesky_factorisation_band(A)
% performs Cholesky factorisation on SPD band matrix A
[n,m] = size(A);

%A(j,j) = A(n,j)
%A(i,i) = A(n,i)
%A(i,j) = A(i+(n-j),j)

for j = 1:m
    for i = 1:j-1
        if i+(n-j)>0
            for k = 1:i-1
                if k+(n-j)>0
                    A(i+(n-j),j) = A(i+(n-j),j) - A(k+(n-i),i)*A(k+(n-j),j);
                end
            end
            A(i+(n-j),j) = A(i+(n-j),j) / A(n,i);
            A(n,j) = A(n,j) - A(i+(n-j),j)^2;
        end
    end
    A(n,j) = sqrt(A(n,j));
end
end
