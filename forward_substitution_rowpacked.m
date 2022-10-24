function x = forward_substitution_rowpacked(A, b)
%Forward substitution
%Returns x for Ax=b for lower triangular system

if nargin < 3
    divide = true;
end

n = 33;

%initialise output
x = b;
p = 1;

%loop rows
for i = 1:n
    %loop columns
    for j = 1:i-1
        x(i) = x(i) - A(p) * x(j);
        p = p + 1;
    end
    %divide by diagonal element
    x(i) = x(i) / A(p);
    p = p + 1;
end

end