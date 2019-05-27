function [centroids, idx,idxxx, obj_fcn] = runkMeans(X, initial_centroids, epsilon, plot_progress)
%RUNKMEANS runs the K-Means algorithm on data matrix X, where each row of X
%is a single example

% Set default value for plot progress
if ~exist('plot_progress', 'var') || isempty(plot_progress)
    plot_progress = false;
end
% Plot the data if we are plotting progress
if plot_progress
    figure;
    hold on;
end
% Initialize values
[m n] = size(X);
K = size(initial_centroids, 1);
centroids = initial_centroids;
previous_centroids = centroids;
idxxx = zeros(m, 1);
idx = zeros(m, 1);
% Run K-Means
obj_fcn = zeros(3, 1);
i = 1;
while (i == 1 || sum(sum((centroids - previous_centroids).^2)) > epsilon)
    % Output progress
    fprintf('K-Means iteration %d/%d...\n', i);
    if exist('OCTAVE_VERSION')
        fflush(stdout);
    end
    % For each example in X, assign it to the closest centroid
    
    idx = findClosestCentroids(X, centroids);
    if(i==1)
       idxxx = idx;
    end
    
    % Optionally, plot progress here
    if plot_progress
        plotProgresskMeans(X, centroids, previous_centroids, idx, K, i);
        previous_centroids = centroids;
        fprintf('Press enter to continue.\n');
        pause;
    end
    % Given the memberships, compute new centroids
    
    [centroids,obj_fcn(i)] = computeCentroids(X, idx, K);
    fprintf('Iteration count = %d, obj. fcn = %f\n', i, obj_fcn(i));
    i = i + 1;
    
end
% Hold off if we are plotting progress
if plot_progress
    hold off;
end


%figure;
%plot(1:3, obj_fcn, '-b', 'LineWidth', 2);
%xlabel('Number of iterations');
%ylabel('Objectev Function');
end
