function [ center, U,idxxx, obj_fcn ] = FCMn( data, cluster_n, options )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if nargin ~= 2 & nargin ~= 3,
	error('Too many or too few input arguments!');
end

data_n = size(data, 1);
in_n = size(data, 2);

% Change the following to set default options
default_options = [2;	% exponent for the partition matrix U
		100;	% max. number of iteration
		1e-5;	% min. amount of improvement
		1];	% info display during iteration 

if nargin == 2,
	options = default_options;
else
	% If "options" is not fully specified, pad it with default values.
	if length(options) < 4,
		tmp = default_options;
		tmp(1:length(options)) = options;
		options = tmp;
	end
	% If some entries of "options" are nan's, replace them with defaults.
	nan_index = find(isnan(options)==1);
	options(nan_index) = default_options(nan_index);
	if options(1) <= 1,
		error('The exponent should be greater than 1!');
	end
end

expo = options(1);		% Exponent for U
max_iter = options(2);		% Max. iteration
min_impro = options(3);		% Min. improvement
display = options(4);		% Display info or not

obj_fcn = zeros(max_iter, 1);	% Array for objective function

U = initfcm(cluster_n, data_n);			% Initial fuzzy partition
[m n] = size(data);
idxxx = zeros(m, 1);
if cluster_n ==2
% Main loop
for i = 1:max_iter,
	[U, center, obj_fcn(i)] = stepfcm(data, U, cluster_n, expo);
    if i ==1
    [center1,cidx]=sort(center);
     member1=U';
     member2=member1(:,cidx);
    [maxmember,idxxx]=max(member2,[],2);
    end
    figure;
    hold on
plot(data(:,1),data(:,2),'x');
plot(center(1,1),center(1,2),'xb','MarkerSize',15,'LineWidth',3);
plot(center(2,1),center(2,2),'xr','MarkerSize',15,'LineWidth',3);
fprintf('Press enter to continue.\n');
        pause;
hold off
	if display, 
		fprintf('Iteration count = %d, obj. fcn = %f\n', i, obj_fcn(i));
	end
	% check termination condition
	if i > 1,
		if abs(obj_fcn(i) - obj_fcn(i-1)) < min_impro, break; end,
	end
end
else
for i = 1:max_iter,
	[U, center, obj_fcn(i)] = stepfcm(data, U, cluster_n, expo);
    if i ==1
    [center1,cidx]=sort(center);
     member1=U';
     member2=member1(:,cidx);
    [maxmember,idxxx]=max(member2,[],2);
    end
    figure;
    hold on
plot(data(:,1),data(:,2),'o');
plot(center(1,1),center(1,2),'xb','MarkerSize',15,'LineWidth',3);
plot(center(2,1),center(2,2),'xr','MarkerSize',15,'LineWidth',3);
plot(center(3,1),center(3,2),'xg','MarkerSize',15,'LineWidth',3);
fprintf('Press enter to continue.\n');
pause;
hold off
	if display, 
		fprintf('Iteration count = %d, obj. fcn = %f\n', i, obj_fcn(i));
	end
	% check termination condition
	if i > 1,
		if abs(obj_fcn(i) - obj_fcn(i-1)) < min_impro, break; end,
	end
end
end

iter_n = i;	% Actual number of iterations 
obj_fcn(iter_n+1:max_iter) = [];
end

