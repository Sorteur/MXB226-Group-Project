function [x,flops] = backward_substitution_flops(A, b, divide,flops)
%Backward substitution
%Returns x for Ax=b for upper triangular system

if nargin < 3
    divide = true;
end

n = size(A, 2);
m = size(b,2);

%initialise output
x = b;

%loop rows
for i = n:-1:1
    %loop columns
    for j = i+1:n
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

