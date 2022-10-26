function x = forward_substitution_band(A, b, divide)
%Forward substitution
%Returns x for Ax=b for banded matrix A

if nargin < 3
    divide = true;
end

[n,m] = size(A);

%initialise output
x = b;

%loop rows
for i = 1:n
    %loop columns
    for j = 1:i-1
        if j+(m-i) > 0
            x(i) = x(i) - A(i,j+(m-i)) * x(j);
        end
    end
    if divide
        %divide by diagonal element
        x(i) = x(i) / A(i,m);
    end
end
end