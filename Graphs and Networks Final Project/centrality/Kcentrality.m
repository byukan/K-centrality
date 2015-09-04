%-------------------------------------------------------------------------
%This function computes the k-means centrality.
%Input:
% -data - matrix computed from effective resistance function
% -A - adjacency matrix
% -l - maximum number of iterations; must be less or equal to the number of
% nodes
%Output:
% - vector of measures
%------------------------------------------------------------------------

function result = Kcentrality(data, A, l)
n = size(data,1);
result = zeros(n, 1);

%computing the measures
for i = 2:l
    cluster = kmeans(data, i);
    for j = 1:n
        for k = 1:n
            if(A(j,k) == 1)
                if(cluster(j) ~= cluster(k))
                    result(j) = result(j)+1;
                end
            end
        end
    end
end
            