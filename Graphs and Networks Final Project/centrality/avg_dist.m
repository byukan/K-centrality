function [ average_distance ] = avg_dist( c, name )
%This function plots the average distance for each possible cut size.
%Should be that if you cut at the right amount, then the pairwise
%clustering measure is small.
%@param c is the centrality vector
%@param name is the xlabel of the plot

n=length(c);
t= (1:n);
t_matrix = [t' c];

sorted_t_matrix = sortrows(t_matrix, -2);

all_dist = pdist2(c,c);
average_distance = [];

%for every possible cutpoint, compute the average pairwise distance
for i = round(n/10) : round(n*9/10)
    label1 = sorted_t_matrix(1:i,1);  %top cut
    label2 = sorted_t_matrix((i+1):n,1);  %bottom cut
   
    D1 = all_dist(label1,label1);  %submatrix representing the distances of the top nodes
    D2 = all_dist(label2,label2);  %submatrix representing the distances of the bottom nodes
   
    avg1 = sum(sum(triu(D1,1))) / nchoosek(i,2);  %sum along columns of each submatrix, and get the mean of these distances
    avg2 = sum(sum(triu(D2,1))) / nchoosek(n-i,2);
   
    t =[ i (avg1+avg2)/2 ];  %resulting average distance is the mean of the top and bottom averages
    average_distance =  [average_distance ; t ];
   
end

average_distance;
figure;
plot(average_distance(:,1),average_distance(:,2), 'k', 'LineWidth',5);
title('Synthetic Tripartite Graph','FontSize',12,'FontWeight','bold','Color','b')
xlabel( strcat('Cut Point of', name, ' Vector') ,'FontSize',12,'FontWeight','bold','Color','b')
ylabel('Average Distance','FontSize',12,'FontWeight','bold','Color','b')


end