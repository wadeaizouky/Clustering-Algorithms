
function clustim=imseg(rgbim,k)
% rgbim=imresize(rgbim,[300,300]);
[r,c,~]=size(rgbim);
ycb=rgb2ycbcr(rgbim);
hsv=rgb2hsv(rgbim);
im2=ycb(:,:,2);
im3=ycb(:,:,3);
im21=hsv(:,:,2);
features=[];
features(:,1:2)=[im2(:),im3(:)];
features(:,3)=im21(:);
[ind,~]=kmeans(features,k);
clustim=reshape(ind,[r,c]);
clustim = (clustim - min(clustim(:))) / ( max(clustim(:)) - min(clustim(:)) )*255;
clustim=uint8(clustim);
[~,c]=size(clustim);
if clustim(1,1)>0&&clustim(1,c)>0
    clustim=imcomplement(clustim);
end
% clustim(clustim==255)=1;
% 
% SE=strel('square',5);
% SE2=strel('square',10);
% clustim=imdilate(clustim,SE);
% clustim=imerode(clustim,SE2);
% clustim= imfill(clustim,'holes');
