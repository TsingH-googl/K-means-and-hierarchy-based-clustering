clear all
clc
close all

Ncluster = 3;
%获取坐标
%文件为二维的坐标，第一列为x轴坐标，第二列为y轴坐标
% xx=load('iris.data');
load('data.mat'); xx = [X(:),Y(:)]; % 若索引超出维度则是画图哪里出错
%获取数据的个数存至number
[number, row]=size(xx);
%获取距离矩阵，第二参数指定距离计算方法
%可选参数有'euclidean'：欧氏距离（默认）；'seuclidean'：标准化欧氏距离；
%'mahalanobis'：马氏距离；'cityblock'：布洛克距离；'minkowski'：明可夫斯基距离；
%'cosine'：余弦距离 'correlation'：相关性 'hamming'：汉明距离 'jaccard'：Jaccard相似度
%'chebychev'：Chebychev距离。
yy=pdist(xx,'minkowski');
%获取聚类，第二参数指定层次聚类方式
%'single'：单连通，最短距离法（默认）；'complete'：全连通，最长距离法；'average'：未加权平均距离法；
%'weighted'： 加权平均法；'centroid'： 质心距离法；'median'：加权质心距离法；'ward'：内平方距离法（最小方差算法）
zz=linkage(yy,'average');
%指定获取簇类个数
% Ncluster=input('输入类个数\n');
%获取指定Ncluster个数的聚类结果
c = cluster( zz,'maxclust', Ncluster );

%获取绘图所需颜色
%需要用到linspecer.m文件
%下载地址
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
