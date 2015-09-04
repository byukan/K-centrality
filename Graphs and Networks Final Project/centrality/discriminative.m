function [ D, V ] = discriminative( c )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Discrimanitive measure
%@param centralities is the vector of centrality measures
%@returns D is the matrix of distances


%Get the distances between all the nodes.  The i,jth entry of matrix D is
%the absolute value of the difference between the ith and jth entry in the
%vector of centralities.

D = pdist2(c,c);


%Next,  put them all
%into a vector, which we will normalize to get the vector of average
%distances.

v = sum(D,1)/length(c);  %sum along the columns

normalized_v = v/norm(v);
V = normalized_v;



    
end

