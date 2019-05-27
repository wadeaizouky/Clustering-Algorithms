function [ label,idxxx ] = FCM( input,c )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
X = input;
if c == 2
[center,member,idxxx,obj_fcn]=FCMn(X,c);

maxU = max(member);
index1 = find(member(1,:) == maxU);
index2 = find(member(2,:) == maxU);

figure;
plot(X(index1,1),X(index1,2),'ob');
hold on
plot(X(index2,1),X(index2,2),'or');
plot(center(1,1),center(1,2),'xb','MarkerSize',15,'LineWidth',3);
plot(center(2,1),center(2,2),'xr','MarkerSize',15,'LineWidth',3);
hold off
[max_iter,m]=size(obj_fcn);


[center1,cidx]=sort(center);
member1=member';
member2=member1(:,cidx);
[maxmember,label]=max(member2,[],2);

else
 [center,member,idxxx,obj_fcn]=FCMn(X,c);

maxU = max(member);
index1 = find(member(1,:) == maxU);
index2 = find(member(2,:) == maxU);
index3 = find(member(3,:) == maxU);

figure;
plot(X(index1,1),X(index1,2),'ob');
hold on
plot(X(index2,1),X(index2,2),'or');
plot(X(index3,1),X(index3,2),'g*');
plot(center(1,1),center(1,2),'xb','MarkerSize',15,'LineWidth',3);
plot(center(2,1),center(2,2),'xr','MarkerSize',15,'LineWidth',3);
plot(center(3,1),center(3,2),'xg','MarkerSize',15,'LineWidth',3);
hold off
[max_iter,m]=size(obj_fcn);


[center1,cidx]=sort(center);
member1=member';
member2=member1(:,cidx);
[maxmember,label]=max(member2,[],2);

end
figure;
plot(1:max_iter, obj_fcn, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Objectev Function');

end

