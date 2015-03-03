function [ dn ] = dirichlet(n,w)


dn = sin(n*w/2)./(n*sin(w/2));
dn(abs(sin(w))<1e-10) = 1;

end

