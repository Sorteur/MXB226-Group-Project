function x = backward_substitution_rowpacked(A, b, divide)
%Backward substitution

if nargin < 3
    divide = true;
end

n = size(b,2);

%initialise output
x = b;

%loop rows
for i = n:-1:1
    %loop columns
    for j = i+1:n
        x(i,1:m) = x(i,1:m) - A(i,j) * x(j,1:m);
    end
    if divide
        %divide by diagonal element
        x(i,1:m) = x(i,1:m) / A(i,i);
    end
end

end