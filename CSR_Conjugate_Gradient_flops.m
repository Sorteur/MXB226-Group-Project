function [x, converged, k, res_vec, flops] = CSR_Conjugate_Gradient_flops(Acsr,C,Rb,b,x0,tol,maxiters, flops)

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
        flops = flops + 2;
    end
end
res = norm(b' - Ax') / normb;
flops = flops + 1;
r = b' - Ax';
flops = flops + 1;
d = r;
rTr = r'*r;
flops = flops + 1;



while(k < maxiters) && (res > tol)
for i = 1:n
    Ad(i) = 0;
    for j = Rb(i):Rb(i + 1) - 1
        Ad(i) = Ad(i) + Acsr(j)*d(C(j));
        flops = flops + 2;
    end
end

alpha = rTr / (d'*Ad');
flops = flops + 1;
x = x + alpha * d;
flops = flops + 2;
r = r - alpha * Ad';
flops = flops + 2;
beta = 1/rTr;
flops = flops + 1;
rTr = r'*r;
flops = flops + 1;
beta = beta * rTr;
flops = flops + 1;
d = r + beta * d;
flops = flops + 2;
k = k + 1;

for i = 1:n
    Ax(i) = 0;
    for j = Rb(i):Rb(i + 1) - 1
        Ax(i) = Ax(i) + Acsr(j)*x(C(j));
        flops = flops + 2;
    end
end

res = norm(b' - Ax') / normb;
flops = flops + 1;
res_vec(res_count) = res;
res_count = res_count + 1;

end

if res <= tol
    converged = true;
end
end