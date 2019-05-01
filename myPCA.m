function [results,newaxis] = myPCA(sample,k)
%PCA���˺������ڽ�ά��kΪ��ά������ά����sampleΪ��Ʒ��
%   ��Ϊ��ͬ��ά��
%����
t_dim=size(sample);
dim=t_dim(1);
if k>dim
    errordlg('�����k�Ƿ�');
    return
end
%��һ�� ����nsample
global nsample;
nsample=zeros(size(sample));
for i=1:dim
    nsample(i,:)=sample(i,:)-mean(sample(i,:));
end

%����Э�������
ncov=cov(nsample');
%������������
spe_ars=eig(ncov);
[spe_arsqu,temp]=eig(ncov);
%����������ά������k�������������±�
[temp,index]=sort(spe_ars);
len=length(index);
index=index(len-k+1:len,:);
newaxis=spe_arsqu(:,index);

results=nsample'*newaxis;
end

