function x = backward_substitution_rowpacked(A, b, divide)
%Backward substitution

if nargin < 3
    divide = true;
end

n = 33;

%initialise output
x = b;
p = n*(n+1)/2;

%loop rows
for i = n:-1:1
    %loop columns
    for j = n:-1:i+1
        x(i) = x(i) - A(p) * x(j);
        p = p - 1;
    end
    if divide
        %divide by diagonal element
        x(i) = x(i) / A(p);
        p = p - 1;
    end
end

end

