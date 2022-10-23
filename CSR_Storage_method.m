function [Acs C Rb] = CSR_Storage_method(A)
    n = size(A, 1);

% Worst case need to store n x n values in v
Rb = [];
C = [];
Acs = [];

nz = 1;

for i = 1:n
    Rb(i) = nz;
    for j = 1:n

        if (A(i,j) ~= 0)
            Acs(nz) = A(i,j);
            C(nz) = j;
            nz = nz + 1;
        end

    end
    Rb(i + 1) = nz;
end

end