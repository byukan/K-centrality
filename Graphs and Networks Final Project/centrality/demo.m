load('network1.mat');

%shortest-path closeness
r1 = closeness(toy);

%shortest-path betweenness
r2 = node_betweenness_faster(toy);

%Current floww closeness
r3 = CurrentFlowCloseness(toy);

%Current flow betweenness
r4 = CurrentFlowBetweenness(toy, 10^(-3), .01);

%K centrality measure
n = size(toy,1);
e_list = edge_list(toy);
s = randi([1,n]);
t = randi([1,n]);
while(t==s)
    t = randi([1,n]);
end
current = [s t];
num = size(e_list,1);
w = ones(num,1);
[~,Z] = EffectiveResistances(current,e_list,w,1e-5,1,'spl');
Z=Z';
r5 = Kcentrality(Z,toy,11);

