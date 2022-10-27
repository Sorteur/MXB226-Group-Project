function x = forward_substitution_rowpacked(A, b)
%Forward substitution
%Returns x for Ax=b for lower triangular system

if nargin < 3
    divide = true;
end

n = size(b,1);

%initialise output
x = b;
for i = 1:n
    %loop columns
    for j = 1:i-1
        x(i) = x(i) - A(i+j*(j-1)/2) * x(j);
    end
    if divide
        %divide by diagonal element
        x(i) = x(i) / A(i+i*(i-1)/2);
    end
end
end
