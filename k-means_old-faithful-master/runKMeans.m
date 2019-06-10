function runKMeans(K,fileString)
%load data file specified by fileStringfrom Bishop book

X=load(fileString);

% rand数据集
X = [randn(50,2)+ones(50,2);randn(50,2)-ones(50,2);randn(50,2)+[ones(50,1),-ones(50,1)]];

% circle数据集
% load(fileString);Data = [X(:) Y(:)]; X_x = Data(:,1);X_y = Data(:,2);X=[X_x, X_y]
px = 1 ;
py = 2;
X_x = X(:,px);
X_y = X(:,py);
% 显示初始的点
scatter(X_x ,X_y,[],[0 0 0]);
xydataFontsize = 15; % 坐标轴数字大小
fontName = 'Times New Roman';
set(0,'defaultfigurecolor','w');    % 设置背景为白色，黑色不适合放在论文里面
%set(gca,'looseInset',[0 0 0 0]); % 去掉空白
set(gca,'FontName' ,fontName, 'FontSize' ,xydataFontsize);
xlabel('featureX',    'Fontsize', xydataFontsize, 'FontName',fontName, 'FontWeight','bold');
ylabel('featureY','Fontsize', xydataFontsize, 'FontName',fontName, 'FontWeight','bold');

%axis equal
figure(1);
%set(gca,'ylim',[0,max(X_y)],'ytick',[0:length(X_y)/6:max(X_y)]);%y坐标轴范围
%set(gca,'xlim',[0,max(X_x)],'xtick',[0:length(X_x)/6:max(X_x)]);%x坐标轴范围
%xlim([2 7])
% ylim([20 100])

title('Iterations=0');
pic_num = 1;
F=getframe(gcf);
I=frame2im(F);
[I,map]=rgb2ind(I,256);
if pic_num == 1
    imwrite(I,map,'test.gif','gif', 'Loopcount',inf,'DelayTime',1);
else
    imwrite(I,map,'test.gif','gif','WriteMode','append','DelayTime',1);
end

pause(1);

%determine and store data set information
N=size(X,1);
D=size(X,2);

%allocate space for the K mu vectors
Kmus=zeros(K,D); % not need to allocate it but it is still worthy

%initialize cluster centers by randomly picking points from the data
rndinds=randperm(N);
Kmus=X(rndinds(1:K),:);

%specify the maximum number of iterations to allow
maxiters=1000;
for iter=1:maxiters
    %assign each data vector to closest mu vector as per Bishop (9.2)
    %do this by first calculating a squared distance matrix where the n,k entry
    %contains the squared distance from the nth data vector to the kth mu vector
    
    %sqDmat will be an N-by-K matrix with the n,k entry as specfied above
    sqDmat=calcSqDistances(X,Kmus);
    
    %given the matrix of squared distances, determine the closest cluster
    %center for each data vector
    
    %R is the "responsibility" matrix
    %R will be an N-by-K matrix of binary values whose n,k entry is set as
    %per Bishop (9.2)
    %Specifically, the n,k entry is 1 if point n is closest to cluster k,
    %and is 0 otherwise
    Rnk=determineRnk(sqDmat);
    
    KmusOld=Kmus;
    plotCurrent(X,Rnk,Kmus, pic_num);
    pic_num = pic_num + 1;
    F=getframe(gcf);
    I=frame2im(F);
    [I,map]=rgb2ind(I,256);
    if pic_num == 1
        imwrite(I,map,'test.gif','gif', 'Loopcount',inf,'DelayTime',0.5);
    else
        imwrite(I,map,'test.gif','gif','WriteMode','append','DelayTime',0.5);
    end
    pause(1)
    
    %recalculate mu values based on cluster assignments as per Bishop (9.4)
    Kmus=recalcMus(X,Rnk);
    
    
    
    
    
    %check to see if the cluster centers have converged.  If so, break.
    if sum(abs(KmusOld(:)-Kmus(:)))<1e-6
        disp(iter);
        break
    end
end

end

