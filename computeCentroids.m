function [centroids,obj_fcn] = computeCentroids( X, idx, K )
%COMPUTECENTROIDS returs the new centroids by computing the means of the 
%data points assigned to each centroid.

centroids = zeros(K, size(X, 2));
for k=1:K
    belonged = X(find(idx==k), :);
    centroids(k, :) = mean(belonged);
end

dist = distfcm(centroids, X);       % fill the distance matrix
obj_fcn = sum(sum(dist.^2));  % objective function
end
