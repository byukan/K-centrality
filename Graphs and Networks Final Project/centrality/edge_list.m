function result = edge_list(A)
n=size(A,1);
num_edge=sum(A(:))/2;
result = zeros(num_edge,2);
counter = 1;
for i = 1:n
    for j = i+1:n
        if(A(i,j) == 1)
            result(counter, 1) = i;
            result(counter, 2) = j;
            counter = counter+1;
        end
    end
end