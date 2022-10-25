function [x, converged, k, res_vec] = Conjugate_Gradient(A, b, x0, tol, maxiters)
% JACOBI Jacobi method
% [x, converged, k] = jacobi(A, b, x0, tol, maxiters) performs Jacobi
% iteration iteration to solve A*x=b, starting with x = x0 and iterating
% until either the number of iterations k equals maxiters, or until
% norm(b-A*x)/norm(b) <= tol. The value of converged is true if the method
% converged, or false otherwise.

% Initialise
res_vec = zeros(size(maxiters));
k = 0;
x = x0;

r = b - A*x;
d = r;
rTr = r'*r;

normb = norm(b);
res = norm(b - A*x) / normb;
res_count = 2;

converged = false;

% Perform the iteration until res <= tol or maximum iterations taken

while (k < maxiters) && (res > tol)
    Ad = A*d;
    alpha = rTr / (d'*Ad);
    x = x + alpha * d;
    r = r - alpha * Ad;
    beta = 1 / rTr; 
    rTr = r'*r;
    beta = beta * rTr;
    d = r + beta * d;
    k = k + 1;
    res = norm(b - A*x) / normb;

    res_vec(res_count) = res;
    res_count = res_count + 1;
end

% Check if converged

if res <= tol
    converged = true;
end
