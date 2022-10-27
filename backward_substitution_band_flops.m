function [x,flops] = backward_substitution_band_flops(A, b, divide,flops)
%Backward substitution
%Returns x for Ax=b for banded system
if nargin < 3
    divide = true;
end

[m,n]= size(A);

%initialise output
x = b;

%loop rows
for i = n:-1:1
    %loop columns
    for j = i+1:n
        if i+(m-j)>0
            x(i) = x(i) - A(i+(m-j),j) * x(j);
            flops = flops + 2;
        end
    end
    if divide
        %divide by diagonal element
        x(i) = x(i) / A(m,i);
        flops = flops + 1;
    end
end
end