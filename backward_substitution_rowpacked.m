function x = backward_substitution_rowpacked(u, b, divide)
%Backward substitution

if nargin < 3
    divide = true;
end

n = size(u);

%initialise output
x = b;
p = n*(n+1)/2;

%loop rows
for i = n:-1:1
    %loop columns
    for j = n:-1:i+1
        x(i) = x(i) - u(p) * x(j);
        p = p - 1;
    end
    if divide
        %divide by diagonal element
        x(i) = x(i) / u(p);
        p = p - 1;
    end
end

end

