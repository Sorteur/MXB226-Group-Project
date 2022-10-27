function [x, flops] = forward_substitution_rowpacked_flops(A, b, flops)
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
        flops = flops + 2;
    end
    x(i) = x(i) / A(i+(i*(i-1)/2));
    flops = flops + 1;
end