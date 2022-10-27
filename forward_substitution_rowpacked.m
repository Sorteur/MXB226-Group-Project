function x = forward_substitution_rowpacked(A, b)
%Forward substitution
%Returns x for Ax=b for lower triangular system

if nargin < 3
    divide = true;
end

n = size(b,1);

%initialise output
x = b;
%loop rows
for i = 1:n
    for j = 1:i-1
        x(i) = x(i) - A(j+(i*(i-1)/2)) * x(j);
    end
    x(i) = x(i) / A(i+(i*(i-1)/2));
end