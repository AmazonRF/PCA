%PCA���˺������ڽ�ά��kΪ��ά������ά����sampleΪ��Ʒ��
%   ��Ϊ��ͬ��ά��
%����
clear all
%sample=[2.5, 0.5, 2.2, 1 .9, 3.1 , 2.3, 2, 1 , 1 .5, 1 .1 ;2.4, 0.7, 2.9, 2.2, 3.0, 2.7, 1 .6, 1 .1 , 1 .6, 0.9];
x=importdata('C:\Users\ARFor\Desktop\����ѧϰ\datax.txt');
y=importdata('C:\Users\ARFor\Desktop\����ѧϰ\datay.txt');
sample=[x;y];
k=1;
plot(sample(1,:),sample(2,:),'o')
hold on
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
px=min(x):0.001:max(x);
py=(newaxis(2)/newaxis(1))*px;
plot(px,py)
% f=strcat('x/',num2str(newaxis(1)),'-y/',num2str(newaxis(2)));
% h=ezplot(f)
set(h,'Color','k')

results=nsample'*newaxis;




