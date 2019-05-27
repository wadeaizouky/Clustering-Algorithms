function [outputs] = SOM( input,dimension1,dimension2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
X=input;
wadenet = newsom(X,[dimension1 dimension2]);
% Train the Network
[wadenet,st] = train(wadenet,X);
outputs = sim(wadenet,X);
%Test the Network
%ttest = wadenet(data);
view(wadenet);


plotsomtop(wadenet);
plotsomnc(wadenet);
plotsomnd(wadenet);
plotsomplanes(wadenet);
plotsomhits(wadenet,X);
plotsompos(wadenet,X);

end

