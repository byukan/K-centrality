%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script runs various quantitative tests on each of the centrailty
% measures, and displays the results in some type of graph.

%Discrimanitive measure

%First, start with a vector of centrality measures.
%load('FlorentineGraph.mat')
%c = node_betweenness_faster(FlorentineGraph);

load('Florentine_Betweenness_Vector.mat')
load('Florentine_Closeness_Vector.mat')
load('Florentine_Current_Flow_Betweenness_Vector_10-3_1.mat')
load('Florentine_Current_Flow_Closeness_Vector.mat')
load('Florentine_K_centrality.mat')


[ ~,V ] = discriminative( Florentine_Betweenness_Vector );
d_Florentine_Betweenness_Vector = sum(V);
%2.8787
[ ~,V ] = discriminative( Florentine_Current_Flow_Betweenness_Vector );
d_Florentine_Current_Flow_Betweenness_Vector = sum(V);
%3.1825
[ ~,V ] = discriminative( FlorentineKcentrality );
d_FlorentineKcentrality = sum(V);
%3.3105
[ ~,V ] = discriminative( Florentine_Current_Flow_Closeness );
d_Florentine_Current_Flow_Closeness = sum(V);
%3.4432
[ ~,V ] = discriminative( Florentine_Closeness_Vector );
d_Florentine_Closeness_Vector = sum(V);
%3.6137


%Rankings is from least discriminative to most discriminative:
%betw, cf_betw, k_cent, cf_close, close

Flor = [d_Florentine_Betweenness_Vector d_Florentine_Current_Flow_Betweenness_Vector d_FlorentineKcentrality d_Florentine_Current_Flow_Closeness d_Florentine_Closeness_Vector];
str = {'betw'; 'cfBetw'; 'kCent'; 'cfClose'; 'close'};
figure;
bar(Flor, 'y')
title('Florentine Families','FontSize',12,'FontWeight','bold','Color','k')
set(gca, 'XTickLabel',str, 'XTick',1:numel(str))
xlabel('betw < cfBetw < kCent < cfClose < close','FontSize',12,'FontWeight','bold','Color','k')
ylabel('Discriminative score','FontSize',12,'FontWeight','bold','Color','k')






load('betwReed.mat')
load('closenessReed.mat')
load('CurrentFlowBetweenness_Reed.mat')
load('CurrentFlowCloseness_Reed.mat')
load('Kcentrality_Reed.mat')

[ ~,V ] = discriminative( betwReed );
d_betwReed = sum(V);
%14.3883
[ ~,V ] = discriminative( closenessReed );
d_closenessReed = sum(V);
%29.1458
[ ~,V ] = discriminative( CurrentFlowBetweenness_Reed );
d_CurrentFlowBetweeness_Reed = sum(V);
%26.5148
[ ~,V ] = discriminative( CurrentFlowCloseness_Reed );
d_CurrentFlowCloseness_Reed = sum(V);
%28.5010
[ ~,V ] = discriminative( Kcentrality_Reed );
d_Kcentrality_Reed = sum(V);
%27.7839


Reed = [d_betwReed d_CurrentFlowBetweeness_Reed d_Kcentrality_Reed d_CurrentFlowCloseness_Reed d_closenessReed];
str = {'betw'; 'cfBetw'; 'kCent'; 'cfClose'; 'close'};
figure;
bar(Reed, 'y')
title('Reed Facebook100','FontSize',12,'FontWeight','bold','Color','k')
set(gca, 'XTickLabel',str, 'XTick',1:numel(str))
xlabel('betw < cfBetw < kCent < cfClose < close','FontSize',12,'FontWeight','bold','Color','k')
ylabel('Discriminative score','FontSize',12,'FontWeight','bold','Color','k')

%large gap, where betw is least discriminative - it has 0 values.
%From least to most discriminative:  betw, cf_betw, k_cent, cf_close,
%close, so it seems that discrimination is consistent across networks,
%since these rankings match those of Florentine graph.












%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Correlation, Degrees

load('FlorentineGraph.mat')
load('Florentine_Betweenness_Vector.mat')
load('Florentine_Closeness_Vector.mat')
load('Florentine_Current_Flow_Betweenness_Vector_10-3_1.mat')
load('Florentine_Current_Flow_Closeness_Vector.mat')
load('Florentine_K_centrality.mat')

%make the degree vector, where the degree of node i is the ith entry in d
D = sum(FlorentineGraph);
d = D';

c_Florentine_Betweenness_Vector = corr(Florentine_Betweenness_Vector,d );
%0.8047
c_Florentine_Closeness_Vector = corr(Florentine_Closeness_Vector,d );
%0.7445
c_Florentine_Current_Flow_Betweenness_Vector = corr(Florentine_Current_Flow_Betweenness_Vector,d );
%0.9239
c_Florentine_Current_Flow_Closeness = corr(Florentine_Current_Flow_Closeness,d );
%0.9022
c_FlorentineKcentrality = corr(FlorentineKcentrality,d );
%0.9422


cFlor = [c_Florentine_Betweenness_Vector c_Florentine_Closeness_Vector c_Florentine_Current_Flow_Betweenness_Vector c_Florentine_Current_Flow_Closeness c_FlorentineKcentrality];
str = {'betw'; 'close'; 'cf Betw'; 'cf Close'; 'k Cent'};
figure;
bar(cFlor, 'g')
title('Florentine Families','FontSize',12,'FontWeight','bold','Color','b')
set(gca, 'XTickLabel',str, 'XTick',1:numel(str))
xlabel('betw, close, cf Betw, cf Close, k Cent','FontSize',12,'FontWeight','bold','Color','b')
ylabel('Correlation to Degrees','FontSize',12,'FontWeight','bold','Color','b')



load('Reed.mat')
load('betwReed.mat')
load('closenessReed.mat')
load('CurrentFlowBetweenness_Reed.mat')
load('CurrentFlowCloseness_Reed.mat')
load('Kcentrality_Reed.mat')

D = sum(Reed);
d = D';

c_betwReed = corr(betwReed,d );
%0.6108
c_closenessReed = corr(closenessReed,d );
%0.8348
c_CurrentFlowBetweenness_Reed = corr(CurrentFlowBetweenness_Reed,d );
%0.9008
c_CurrentFlowCloseness_Reed = corr(CurrentFlowCloseness_Reed,d );
%0.6920
c_Kcentrality_Reed = corr(Kcentrality_Reed,d );
%0.9879


cReed = [c_betwReed c_closenessReed c_CurrentFlowBetweenness_Reed c_CurrentFlowCloseness_Reed c_Kcentrality_Reed];
str = {'betw'; 'close'; 'cf Betw'; 'cf Close'; 'k Cent'};
figure;
bar(cReed, 'g')
title('Reed Facebook100','FontSize',12,'FontWeight','bold','Color','b')
set(gca, 'XTickLabel',str, 'XTick',1:numel(str))
xlabel('betw, close, cf Betw, cf Close, k Cent','FontSize',12,'FontWeight','bold','Color','b')
ylabel('Correlation to Degrees','FontSize',12,'FontWeight','bold','Color','b')

%Unlike in the case of discriminative measure, different ranking results
%when used on Florentine than when used on Reed













%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Recovering from clusters
%Run k-means on the 1-D line, and look for 2 clusters.  Use the synthietic
%tripartite graph with small alpha.

load('betwtoy2.mat')
load('closenesstoy2.mat')
load('cfbetw_toy2.mat')
load('current_flow_closeness_toy2.mat')
load('Kcentrality_toy2.mat')

toy2_betw_IDX = kmeans(betwtoy2, 2);
figure(1);
stem(toy2_betw_IDX, 'r')
title('Synthetic Tripartite Graph','FontSize',12,'FontWeight','bold','Color','k')
xlabel('Betweenness Centrality','FontSize',12,'FontWeight','bold','Color','k')
ylabel('2 Means Grouping','FontSize',12,'FontWeight','bold','Color','k')

toy2_close_IDX = kmeans(closenesstoy2, 2);
figure(2);
stem(toy2_close_IDX, 'r')
title('Synthetic Tripartite Graph','FontSize',12,'FontWeight','bold','Color','k')
xlabel('Closeness Centrality','FontSize',12,'FontWeight','bold','Color','k')
ylabel('2 Means Grouping','FontSize',12,'FontWeight','bold','Color','k')


toy2_cfbetw_IDX = kmeans(cfbetw_toy2, 2);
figure(3);
stem(toy2_cfbetw_IDX, 'r')
title('Synthetic Tripartite Graph','FontSize',12,'FontWeight','bold','Color','k')
xlabel('Current Flow Betweenness Centrality','FontSize',12,'FontWeight','bold','Color','k')
ylabel('2 Means Grouping','FontSize',12,'FontWeight','bold','Color','k')


toy2_cfClose_IDX = kmeans(current_flow_closeness_toy2, 2);
figure(4);
stem(toy2_cfClose_IDX, 'r')
title('Synthetic Tripartite Graph','FontSize',12,'FontWeight','bold','Color','k')
xlabel('Current Flow Closeness Centrality','FontSize',12,'FontWeight','bold','Color','k')
ylabel('2 Means Grouping','FontSize',12,'FontWeight','bold','Color','k')

toy2_kcent_IDX = kmeans(Kcentrality_toy2, 2);
figure(5);
stem(toy2_kcent_IDX, 'r')
title('Synthetic Tripartite Graph','FontSize',12,'FontWeight','bold','Color','k')
xlabel('K Centrality','FontSize',12,'FontWeight','bold','Color','k')
ylabel('2 Means Grouping','FontSize',12,'FontWeight','bold','Color','k')







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Average Distances

[ average_distance1 ] = avg_dist( betwtoy2, ' Betweenness Centrality' );
[ average_distance2 ] = avg_dist( closenesstoy2, ' Closeness Centrality' );
[ average_distance3 ] = avg_dist( cfbetw_toy2, ' Current Flow Betweenness Centrality');
[ average_distance4 ] = avg_dist( current_flow_closeness_toy2, ' Current Flow Closeness Centrality' );
[ average_distance5 ] = avg_dist( Kcentrality_toy2, ' K Centrality' );











%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  This section of the program runs the following functions onto the
%  Reed facebook adjacency matrix:
% 1. node_betweenness_faster.m
% 2. closeness.m
% 3. CurrentFlowBetweenness.m

%load('Reed.mat')

%1. node_betweenness_faster
%started 4:00 pm 3/1, on Reed -- it finished overnight
%algorithm is O(n^3)
%betwReed = node_betweenness_faster(Reed);

% 2. closeness
%closenessReed = closeness(Reed);
%-- 3/2/2015 11:22 AM --%
%load('Reed.mat')
%closenessReed = closeness(Reed)

% 3. CurrentFlowBetweenness
%cfbetw_toy2 = CurrentFlowBetweenness(toy2, 10^-3, .001);