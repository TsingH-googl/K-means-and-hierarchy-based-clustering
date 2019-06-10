function    plotCurrent(X,Rnk,Kmus, pic_num)
[N,D]=size(X);
K=size(Kmus,1);
% plot��һ��ά��
px=1;
py=2;
clf;% ���ͼ�ε�����
hold on;
xydataFontsize = 15; % ���������ִ�С
fontName = 'Times New Roman';
set(gca,'FontName' ,fontName, 'FontSize' ,xydataFontsize);
set(0,'defaultfigurecolor','w');    % ���ñ���Ϊ��ɫ����ɫ���ʺϷ�����������
xlabel('featureX',    'Fontsize', xydataFontsize, 'FontName',fontName, 'FontWeight','bold');
ylabel('featureY','Fontsize', xydataFontsize, 'FontName',fontName, 'FontWeight','bold');
% ����ͼ��
%h=legend('h','h','h','location','SouthEast','FontName',fontName,  'FontWeight','bold');
%set(h,'Fontsize',xydataFontsize,  'FontWeight','bold'); 

%set(gca,'looseInset',[0 0 0 0]); % ȥ���հ�
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
% ����ͼ�� 
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


% axis equal;% axis square ��ǰ����ϵͼ������Ϊ����axis equal ����������Ķ���ϵ�������ֵͬ ,����λ������ͬ
% axis equal�̶��ǵȳ��ģ���Ҳ��һ���Ƿ��εġ�
hold off;
end