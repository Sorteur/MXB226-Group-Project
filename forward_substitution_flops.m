function [x,flops] = forward_substitution_flops(A, b, divide,flops)
%Forward substitution
%Returns x for Ax=b for lower triangular system

if nargin < 3
    divide = true;
end

n = size(A, 2);
m = size(b,2);

%initialise output
x = b;

%loop rows
for i = 1:n
    %loop columns
    for j = 1:i-1
        x(i,1:m) = x(i,1:m) - A(i,j) * x(j,1:m);
        flops = flops + 2;
    end
    if divide
        %divide by diagonal element
        x(i,1:m) = x(i,1:m) / A(i,i);
        flops = flops + 1;
    end
end
end



