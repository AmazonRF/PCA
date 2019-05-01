function [results,newaxis] = myPCA(sample,k)
%PCA：此函数用于降维，k为降维降至的维数，sample为样品。
%   列为不同的维数
%报错
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

results=nsample'*newaxis;
end

