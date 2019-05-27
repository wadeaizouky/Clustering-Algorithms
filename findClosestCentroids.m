function idx = findClosestCentroids( X, centroids )
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example

m = size(X, 1);
idx = zeros(m, 1);
K = size(centroids, 1);
for i=1:m
    distances = zeros(K, 1);
    for k=1:K
        distances(k, 1) = sum((X(i, :) - centroids(k, :)).^2);
    end
    [minDest index] = min(distances);
    idx(i) = index;
end

end
