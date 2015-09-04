%------------------------------------------------------------------------
%This function computes the current flow betweenness measure of a graph.
%This algorithm is based on Algorithm 3 of Brandes and Fleischer.
%Input:
% A - adjacency matrix
% epsilon - probability error
% l - some constant
%Output:
% result - vector of measures
%-------------------------------------------------------------------------

function result = CurrentFlowBetweenness(A, epsilon, l)
%computing the coefficients
n = size(A,1);
result = zeros(n,1);
nb = (n-1)*(n-2);
c_star = n*(n-1)/nb;
k = l*ceil((c_star/epsilon)^2*log(n));

%constructing the matrix C
L = diag(sum(abs(A),2)) - A;
l = L(2:n, 2:n);
C = zeros(n, n);
C(2:n, 2:n) = inv(l);
k
%computing measures
for i = 1:k
    s = randi([1,n]);
    t = randi([1,n]);
    while(t==s)
        t = randi([1,n]);
    end
    b = zeros(n,1);
    b(s) = 1;
    b(t) = -1;
    p = C*b;
    for j = 1:n
        if(j~=s && j~=t)
            for h = 1:n
                if(A(j,h) == 1)
                    result(j) = result(j)+abs(p(j)-p(h))*c_star/(2*k);
                end
            end
        end
    end
end
    
    