function [A,flops] = cholesky_factorisation_band_flops(A,flops)
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
                    flops = flops + 2;
                end
            end
            A(i+(n-j),j) = A(i+(n-j),j) / A(n,i);
            flops = flops + 1;
            A(n,j) = A(n,j) - A(i+(n-j),j)^2;
            flops = flops + 2;
        end
    end
    A(n,j) = sqrt(A(n,j));
    flops = flops + 1;
end
end
