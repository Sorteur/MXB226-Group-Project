function [x, converged, k, res_vec] = CSR_Jacobi(Acsr,C,Rb,x0,tol,maxiters,b)

converged = false;
res_vec = zeros(size(maxiters));

n = length(b);
k = 0;
x = x0;

normb = norm(b);
Ax = 1:n;

for i = 1:n
    Ax(i) = 0;
    for j = Rb(i):Rb(i + 1) - 1
        Ax(i) = Ax(i) + Acsr(j)*x(C(j));
    end
end

res = norm(b - Ax')/normb;
res_count = 2;

while (k < maxiters) && (res > tol)

    xold = x;

    for i = 1:n
        D = Acsr(Rb(i):Rb(i + 1) - 1) * (C(Rb(i):Rb(i+1) - 1) == i)';
        x(i) = b(i);
        for j = Rb(i):Rb(i + 1) - 1
            if Acsr(j) ~= D
                x(i) = x(i) - Acsr(j)*xold(C(j));
            end
        end
        x(i) = x(i)/D;
    end

    for i = 1:n
        Ax(i) = 0;
        for j = Rb(i):Rb(i + 1) - 1
            Ax(i) = Ax(i) + Acsr(j)*x(C(j));
        end
    end
    k = k + 1;
    res = norm(b - Ax')/normb;
    res_vec(res_count) = res;
    res_count = res_count + 1;
end


if res <= tol
    converged = true;
end
























