
% 载入数据
px = 1;
py = 3;
K = 6;
% circle数据集
% load('data.mat');
% Data = [X(:) Y(:)];
% X = Data; % X的每一行为一个data point

% iris数据集、glass数据集
 X=load('glass.data');

% rand数据集
% X = [randn(50,2)+ones(50,2);randn(50,2)-ones(50,2);randn(50,2)+[ones(50,1),-ones(50,1)]];

% 计算前边点与后边点距离
disVector = pdist(X);  % pdist之后的Y是一个行向量，15个元素分别代表X 的第1点与2-6点、第2点与3-6点,......这样的距离

% 转换成方阵
disMatrix = squareform(disVector);

% 确定层次聚类树
treeCluster = linkage(disMatrix, 'average');% 'centroid'    'complete'   'single'  'average'

% 可视化聚类树
% dendrogram(treeCluster);

% 聚类下标
idx = cluster(treeCluster,'maxclust',K); %划分聚类为3类

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

% 画图

xydataFontsize = 15; % 坐标轴数字大小
fontName = 'Times New Roman';
set(gca,'FontName' ,fontName, 'FontSize' ,xydataFontsize);
set(0,'defaultfigurecolor','w');    % 设置背景为白色，黑色不适合放在论文里面
hold off