function [ clusterindex1,idxxx ] = kmeans1( input,k )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
X = input;
initial_centroids = kMeansInitCentroids(X, k);
[centroids clusterindex1 idxxx] = runkMeans(X, initial_centroids, 0.01, true);

end

