function centroids = kMeansInitCentroids(X, K)
%KMEANSINITCENTROIDS This function initializes K centroids that are to be 
%used in K-Means on the dataset X

m = size(X, 1);
randoms = ceil(rand(K, 1) * m);
centroids = X(randoms, :);

end
