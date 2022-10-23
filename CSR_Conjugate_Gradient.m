function [x, converged, k, res_vec] = CSR_Conjugate_Gradient(Acsr,C,Rb,b,x0,tol,maxiters)

k = 0;
x = x0;
n = length(b);
res_vec = zeros(size(maxiters));
Ax = 1:n;
Ad = 1:n;
normb = norm(b);
res_count = 2;
converged = false;

for i = 1:n
    Ax(i) = 0;
    for j = Rb(i):Rb(i + 1) - 1
        Ax(i) = Ax(i) + Acsr(j)*x(C(j));
    end
end
res = norm(b' - Ax') / normb;
r = b' - Ax';
d = r;
rTr = r'*r;



while(k < maxiters) && (res > tol)
for i = 1:n
    Ad(i) = 0;
    for j = Rb(i):Rb(i + 1) - 1
        Ad(i) = Ad(i) + Acsr(j)*d(C(j));
    end
end

alpha = rTr / (d'*Ad');
x = x + alpha * d;
r = r - alpha * Ad';
beta = 1/rTr;
rTr = r'*r;
beta = beta * rTr;
d = r + beta * d;
k = k + 1;

for i = 1:n
    Ax(i) = 0;
    for j = Rb(i):Rb(i + 1) - 1
        Ax(i) = Ax(i) + Acsr(j)*x(C(j));
    end
end

res = norm(b' - Ax') / normb;
res_vec(res_count) = res;
res_count = res_count + 1;

end

if res <= tol
    converged = true;
end
end