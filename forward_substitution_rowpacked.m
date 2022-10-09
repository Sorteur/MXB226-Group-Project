function x = forward_substitution_rowpacked(u, b, divide)
%Forward substitution
%Returns x for Ax=b for lower triangular system

if nargin < 3
    divide = true;
end

n = size(A, 2);

%initialise output
x = b;
p = 1;

%loop rows
for i = 1:n
    %loop columns
    for j = 1:i-1
        x(i) = x(i) - u(i,j) * x(j);
        p = p + 1;
    end
    if divide
        %divide by diagonal element
        x(i) = x(i) / u(i,i);
        p = p + 1; 
    end
end
end



