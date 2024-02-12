function [t,n,b, checkb] = FrenetFrames(p)
% following function computes the Frenet Frames given the parametrized
% curve p. s is parameter
syms s(t)
pprime = diff(p,s);
pdbprime = diff(pprime,s);

t = simplify(pprime/simplify(norm(pprime)));
n = simplify(cross(pprime,simplify(cross(pdbprime,pprime)))/(simplify(norm(pprime)) * simplify(norm(simplify(cross(pdbprime,pprime))))));
b = simplify(cross(t,n));

checkb = simplify(cross(pprime,pdbprime)/(simplify(norm(simplify(cross(pprime,pdbprime))))));
end