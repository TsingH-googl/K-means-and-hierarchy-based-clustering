

% ��������
px = 1;
py = 3;
K = 3;
% circle���ݼ�
% load('data.mat');
% Data = [X(:) Y(:)];
% X = Data; % X��ÿһ��Ϊһ��data point

% iris���ݼ���glass���ݼ�
X=load('glass.data');

% rand���ݼ�
% X = [randn(50,2)+ones(50,2);randn(50,2)-ones(50,2);randn(50,2)+[ones(50,1),-ones(50,1)]];


opts = statset('Display','final');


%����Kmeans����

%X N*P�����ݾ���

%Idx N*1������,�洢����ÿ����ľ�����

%Ctrs K*P�ľ���,�洢����K����������λ��

%SumD 1*K�ĺ�����,�洢����������е���������ĵ����֮��

%D N*K�ľ��󣬴洢����ÿ�������������ĵľ���;

 

[Idx,Ctrs,SumD,D] = kmeans(X,K,'Replicates',3,'Options',opts);

 

%��������Ϊ1�ĵ㡣X(Idx==1,1),Ϊ��һ��������ĵ�һ�����ꣻX(Idx==1,2)Ϊ�ڶ���������ĵڶ�������

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

%����������ĵ�,kx��ʾ��Բ��
% 
% plot(Ctrs(:,1),Ctrs(:,2),'kx','MarkerSize',14,'LineWidth',4)
% 
% plot(Ctrs(:,1),Ctrs(:,2),'kx','MarkerSize',14,'LineWidth',4)
% 
% plot(Ctrs(:,1),Ctrs(:,2),'kx','MarkerSize',14,'LineWidth',4)

 

%legend('Cluster 1','Cluster 2','Cluster 3','Centroids','Location','NW')
xydataFontsize = 15; % ���������ִ�С
fontName = 'Times New Roman';
set(gca,'FontName' ,fontName, 'FontSize' ,xydataFontsize);
set(0,'defaultfigurecolor','w');    % ���ñ���Ϊ��ɫ����ɫ���ʺϷ�����������
 

Ctrs

SumD

hold off
