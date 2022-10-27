function A = cholesky_factorisation_packed(A)
% performs Cholesky factorisation on SPD matrix A

n = 33;
% this needs to go in somewhere
%A(i,j) = A(i+j*(j-1)/2)  %i ≤ j 
%A(i,i) = A(i+i*(i-1)/2)
%A(j,j) = A(j+j*(j-1)/2)


for j = 1:n
    for i = 1:j-1
        for k = 1:i-1
            A(i+(j*(j-1)/2)) = A(i+(j*(j-1)/2)) - A(k+(i*(i-1)/2))*A(k+(j*(j-1)/2));
        end
        A(i+(j*(j-1)/2)) = A(i+(j*(j-1)/2)) / A(i+(i*(i-1)/2));
        A(j+(j*(j-1)/2)) = A(j+(j*(j-1)/2)) - A(i+(j*(j-1)/2))^2 ;
        
    end
    A(j+(j*(j-1)/2)) = sqrt(A(j+(j*(j-1)/2)));
end
end

