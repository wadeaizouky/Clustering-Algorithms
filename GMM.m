function [ idx0,indxx ] = GMM( input,k )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
mu1 = [1 2];
sigma1 = [3 .2; .2 2];
mu2 = [-1 -2];
sigma2 = [2 0; 0 1];
X = input;
Mu = [mu1; mu2];
Sigma = cat(3,sigma1,sigma2);
p = [0.75 0.25]; % Mixing proportions

%[ cc,indxx ]=kmeans1( X,k );
indxx = findClosestCentroids(input, k);
gmTrue = gmdistribution(Mu,Sigma,p);
%X0 = random(gmTrue,75);
gm = gmdistribution.fit(X,k);
[idx0,~,P0] = cluster(gm,X);

figure;
ezcontour(@(x,y)pdf(gm,[x y]),[min(X(:,1)) max(X(:,1))],...
    [min(X(:,2)) max(X(:,2))]);
hold on;
gscatter(X(:,1),X(:,2),idx0,'rb','+o');
legend('Fitted GMM Contour','Cluster 1','Cluster 2','Location','NorthWest');
title('New Data Cluster Assignments')
hold off;


end

