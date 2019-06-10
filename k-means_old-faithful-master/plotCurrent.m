function    plotCurrent(X,Rnk,Kmus, pic_num)
[N,D]=size(X);
K=size(Kmus,1);
% plot哪一个维度
px=1;
py=2;
clf;% 清除图形的命令
hold on;
xydataFontsize = 15; % 坐标轴数字大小
fontName = 'Times New Roman';
set(gca,'FontName' ,fontName, 'FontSize' ,xydataFontsize);
set(0,'defaultfigurecolor','w');    % 设置背景为白色，黑色不适合放在论文里面
xlabel('featureX',    'Fontsize', xydataFontsize, 'FontName',fontName, 'FontWeight','bold');
ylabel('featureY','Fontsize', xydataFontsize, 'FontName',fontName, 'FontWeight','bold');
% 设置图例
%h=legend('h','h','h','location','SouthEast','FontName',fontName,  'FontWeight','bold');
%set(h,'Fontsize',xydataFontsize,  'FontWeight','bold'); 

%set(gca,'looseInset',[0 0 0 0]); % 去掉空白
% axis equal
InitColorMat= [0.9 0.1 0;   
               0 0.8 0.2;   
               0.3 0.1 0.6;
               0.5 0 1;
               1 0.5 0; 
               1 0 1; 
               0 1 1;
               0.5 1 0.5];

KColorMat=InitColorMat(1:K,:);

colorVec=Rnk*KColorMat;
muColorVec=eye(K)*KColorMat;
scatter(X(:,px),X(:,py),[],colorVec)

scatter(Kmus(:,px),Kmus(:,py),200,muColorVec,'d','filled');
title(strcat('Iterations=', num2str(pic_num)));


%drawnow;
% axis equal
% 设置图例 
% 0.9 0.1 0       0 0.8 0.2         0.3 0.1 0.6      0.5 0 1    1 0.5 0
% 1 0 1
h1 = plot(min(X(:,px)), min(X(:,py)),'O','color', [0 0.8 0.2]);
h2 = plot(min(X(:,px)), min(X(:,py)), 'O','color', [ 0.9 0.1 0   ]);
h3 = plot(min(X(:,px)), min(X(:,py)), 'O','color', [0.3 0.1 0.6]);
% h4 = plot(min(X(:,px)), min(X(:,py)), 'O','color', [0.5 0 1]);
% h5 = plot(min(X(:,px)), min(X(:,py)), 'O','color', [1 0.5 0]);
% h6 = plot(min(X(:,px)), min(X(:,py)), 'O','color', [1 0 1]);
% h7 = plot(min(X(:,px)), min(X(:,py)), 'O','color', [0 1 1]);
xlim auto;
legend([h1,h2,h3],'cluster1', 'cluster2','cluster3','cluster4', 'cluster5','cluster6','location','NorthWest');


% axis equal;% axis square 当前坐标系图形设置为方形axis equal 将横轴纵轴的定标系数设成相同值 ,即单位长度相同
% axis equal刻度是等长的，但也不一定是方形的。
hold off;
end