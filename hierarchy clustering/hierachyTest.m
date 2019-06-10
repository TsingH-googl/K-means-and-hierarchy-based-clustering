clear all
clc
close all

Ncluster = 3;
%��ȡ����
%�ļ�Ϊ��ά�����꣬��һ��Ϊx�����꣬�ڶ���Ϊy������
% xx=load('iris.data');
load('data.mat'); xx = [X(:),Y(:)]; % ����������ά�����ǻ�ͼ�������
%��ȡ���ݵĸ�������number
[number, row]=size(xx);
%��ȡ������󣬵ڶ�����ָ��������㷽��
%��ѡ������'euclidean'��ŷ�Ͼ��루Ĭ�ϣ���'seuclidean'����׼��ŷ�Ͼ��룻
%'mahalanobis'�����Ͼ��룻'cityblock'������˾��룻'minkowski'�����ɷ�˹�����룻
%'cosine'�����Ҿ��� 'correlation'������� 'hamming'���������� 'jaccard'��Jaccard���ƶ�
%'chebychev'��Chebychev���롣
yy=pdist(xx,'minkowski');
%��ȡ���࣬�ڶ�����ָ����ξ��෽ʽ
%'single'������ͨ����̾��뷨��Ĭ�ϣ���'complete'��ȫ��ͨ������뷨��'average'��δ��Ȩƽ�����뷨��
%'weighted'�� ��Ȩƽ������'centroid'�� ���ľ��뷨��'median'����Ȩ���ľ��뷨��'ward'����ƽ�����뷨����С�����㷨��
zz=linkage(yy,'average');
%ָ����ȡ�������
% Ncluster=input('���������\n');
%��ȡָ��Ncluster�����ľ�����
c = cluster( zz,'maxclust', Ncluster );

%��ȡ��ͼ������ɫ
%��Ҫ�õ�linspecer.m�ļ�
%���ص�ַ
%http://www.mathworks.com/matlabcentral/fileexchange/42673-beautiful-and-distinguishable-line-colors-+-colormap
if(Ncluster>12)
    Color = linspecer( Ncluster );
else
    Color = linspecer( Ncluster, 'qualitative' );
end


for i=1:Ncluster
    for j = 1:number
        if(c(j) == i)
            hold on
            plot(xx(j,1),xx(j,2),'o','MarkerFaceColor',Color(i,:),'MarkerEdgeColor',Color(i,:))
        end
    end
    
end
