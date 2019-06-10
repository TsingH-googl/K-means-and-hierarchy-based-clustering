
% ��������
px = 1;
py = 3;
K = 6;
% circle���ݼ�
% load('data.mat');
% Data = [X(:) Y(:)];
% X = Data; % X��ÿһ��Ϊһ��data point

% iris���ݼ���glass���ݼ�
 X=load('glass.data');

% rand���ݼ�
% X = [randn(50,2)+ones(50,2);randn(50,2)-ones(50,2);randn(50,2)+[ones(50,1),-ones(50,1)]];

% ����ǰ�ߵ����ߵ����
disVector = pdist(X);  % pdist֮���Y��һ����������15��Ԫ�طֱ����X �ĵ�1����2-6�㡢��2����3-6��,......�����ľ���

% ת���ɷ���
disMatrix = squareform(disVector);

% ȷ����ξ�����
treeCluster = linkage(disMatrix, 'average');% 'centroid'    'complete'   'single'  'average'

% ���ӻ�������
% dendrogram(treeCluster);

% �����±�
idx = cluster(treeCluster,'maxclust',K); %���־���Ϊ3��

Y= X(:, py);
X= X(:, px);
% ��ͬ�ఴ�ղ�ͬ��ɫ���Ƴ���
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

% ��ͼ

xydataFontsize = 15; % ���������ִ�С
fontName = 'Times New Roman';
set(gca,'FontName' ,fontName, 'FontSize' ,xydataFontsize);
set(0,'defaultfigurecolor','w');    % ���ñ���Ϊ��ɫ����ɫ���ʺϷ�����������
hold off