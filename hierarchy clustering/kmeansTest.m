

% 载入数据
px = 1;
py = 3;
K = 3;
% circle数据集
% load('data.mat');
% Data = [X(:) Y(:)];
% X = Data; % X的每一行为一个data point

% iris数据集、glass数据集
X=load('glass.data');

% rand数据集
% X = [randn(50,2)+ones(50,2);randn(50,2)-ones(50,2);randn(50,2)+[ones(50,1),-ones(50,1)]];


opts = statset('Display','final');


%调用Kmeans函数

%X N*P的数据矩阵

%Idx N*1的向量,存储的是每个点的聚类标号

%Ctrs K*P的矩阵,存储的是K个聚类质心位置

%SumD 1*K的和向量,存储的是类间所有点与该类质心点距离之和

%D N*K的矩阵，存储的是每个点与所有质心的距离;

 

[Idx,Ctrs,SumD,D] = kmeans(X,K,'Replicates',3,'Options',opts);

 

%画出聚类为1的点。X(Idx==1,1),为第一类的样本的第一个坐标；X(Idx==1,2)为第二类的样本的第二个坐标

% for iter = 1:1:K
% plot(X(Idx==iter,px),X(Idx==iter,py),'g.','MarkerSize',14)
% 
% hold on
% 
% % plot(X(Idx==2,px),X(Idx==2,py),'b.','MarkerSize',14)
% % 
% % hold on
% % 
% % plot(X(Idx==3,px),X(Idx==3,py),'r.','MarkerSize',14)
% end 

Y= X(:, py);
X= X(:, px);
% 不同类按照不同颜色绘制出来
for i = 1:length(idx)
    
    switch(idx(i))
        
        case 1
            
            plot(X(i),Y(i),'.','color','r','MarkerSize',14);hold on
            
        case 2
            
            plot(X(i),Y(i),'.','color','g','MarkerSize',14);hold on
            
        case 3
            
            plot(X(i),Y(i),'.','color','b','MarkerSize',14);hold on
        case 4
            
            plot(X(i),Y(i),'.','color', [1 0.5 0],'MarkerSize',14);hold on
        case 5
            
            plot(X(i),Y(i),'.','color', [0.5 1 1],'MarkerSize',14);hold on
        case 6
            
            plot(X(i),Y(i),'.','color', [0 0.5 1],'MarkerSize',14);hold on
        case 7
            
            plot(X(i),Y(i),'.','color', [0 1 0.5],'MarkerSize',14);hold on
            
        otherwise;
            
    end
end

%绘出聚类中心点,kx表示是圆形
% 
% plot(Ctrs(:,1),Ctrs(:,2),'kx','MarkerSize',14,'LineWidth',4)
% 
% plot(Ctrs(:,1),Ctrs(:,2),'kx','MarkerSize',14,'LineWidth',4)
% 
% plot(Ctrs(:,1),Ctrs(:,2),'kx','MarkerSize',14,'LineWidth',4)

 

%legend('Cluster 1','Cluster 2','Cluster 3','Centroids','Location','NW')
xydataFontsize = 15; % 坐标轴数字大小
fontName = 'Times New Roman';
set(gca,'FontName' ,fontName, 'FontSize' ,xydataFontsize);
set(0,'defaultfigurecolor','w');    % 设置背景为白色，黑色不适合放在论文里面
 

Ctrs

SumD

hold off
