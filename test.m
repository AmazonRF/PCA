%PCA：此函数用于降维，k为降维降至的维数，sample为样品。
%   列为不同的维数
%报错
clear all
%sample=[2.5, 0.5, 2.2, 1 .9, 3.1 , 2.3, 2, 1 , 1 .5, 1 .1 ;2.4, 0.7, 2.9, 2.2, 3.0, 2.7, 1 .6, 1 .1 , 1 .6, 0.9];
x=importdata('C:\Users\ARFor\Desktop\机器学习\datax.txt');
y=importdata('C:\Users\ARFor\Desktop\机器学习\datay.txt');
sample=[x;y];
k=1;
plot(sample(1,:),sample(2,:),'o')
hold on
t_dim=size(sample);
dim=t_dim(1);
if k>dim
    errordlg('输入的k非法');
    return
end
%归一化 样本nsample
global nsample;
nsample=zeros(size(sample));
for i=1:dim
    nsample(i,:)=sample(i,:)-mean(sample(i,:));
end

%计算协方差矩阵
ncov=cov(nsample');
%计算特征向量
spe_ars=eig(ncov);
[spe_arsqu,temp]=eig(ncov);
%按照所降的维数排列k个特征向量的下标
[temp,index]=sort(spe_ars);
len=length(index);
index=index(len-k+1:len,:);
newaxis=spe_arsqu(:,index);
px=min(x):0.001:max(x);
py=(newaxis(2)/newaxis(1))*px;
plot(px,py)
% f=strcat('x/',num2str(newaxis(1)),'-y/',num2str(newaxis(2)));
% h=ezplot(f)
set(h,'Color','k')

results=nsample'*newaxis;




