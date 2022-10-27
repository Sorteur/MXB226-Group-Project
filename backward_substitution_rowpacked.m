function x = backward_substitution_rowpacked(A, b)
%Backward substitution


if nargin < 3
    divide = true;
end

n = size(b,1);

%initialise output
x = b;

for i = n:-1:1
    for j = n:-1:i+1
        x(i) = x(i)- A(i+(j*(j-1)/2)) * x(j);
    end
    x(i) = x(i) / A(i+(i*(i-1)/2));
end
