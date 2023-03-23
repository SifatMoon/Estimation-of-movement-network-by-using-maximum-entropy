
function netChar()
%Sifat Afroj Moon
%Calculation of link strength of estimated swine movemnet network at farm level
Tb= readtable('reviewnetworkchar.xlsx');
A=table2array(Tb(:,1:19));
Tb2= readtable('reviewadjlist.xlsx');
A2=table2array(Tb2(:,1:3));

sizegroup=7;
linknum=zeros(sizegroup,sizegroup);
linkweight=zeros(sizegroup,sizegroup);
county = 12;
farm= size(A,1);

for i= 1: length(A2)
    s=A(A2(i,1),3);
    t= A(A2(i,2),3);
    linknum(s, t)= linknum(s, t)+1;
    linkweight(s, t)= linkweight(s, t)+A2(i,3);
end
% degree distribution
wid=A(:,8);
wod=A(:,9);

% if(max(wid)>max(wod))
%     ml= max(wid);
% else
%     ml= max(wod);
% end

[cid, iaid, icid]= unique(wid);
countid= accumarray(icid,1);
[cod, iaod, icod]= unique(wod);
countod= accumarray(icod,1);

l=1;

% rx=round(max(cid)/100);
% for i=  rx:rx:max(cid)+rx
%     x(l)=(l-1)*rx+ round(rx/2);
%     l=l+1;
% end
% k=1;
% y =zeros(size(x,2),1);
% for i=1: size(cid, 1)
%     if(cid(i)<= x(k)+rx/2)
%         y(k,1)=  y(k,1) + countid(i);
%     else
%         while (cid(i)>= x(k)+round(rx/2))
%         k=k+1
%         end
%
%         y(k,1)=  y(k,1) + countid(i);
%     end
% end
% k=1;
% for i=1: (size(x,2))
%     if(y(i,1) ~=0)
%         s(k, 1)=x(i);
%         s(k,2)=y(i,1);
%         k=k+1;
%     end
% end
figure
plot_dist(A2(:,3),max(A2(:,3)),min(A2(:,3)),422,'link-strength', 'Normalized frequency')
%  subplot(1,2,1)
plot_dist(wid,max(wid),min(wid),50,'In-strength', 'Normalized frequency')
% subplot(1,2, 2)
figure
plot_dist(wod,max(wod),min(wod),50,'out-strength', '')
figure
scatter(cid, countid,'filled')
% scatter( s(:, 1),  s(:, 2))
xlabel('in-degree');
ylabel('count');
set(gca,'fontsize',14)
set(gca,'xscale','log', 'yscale', 'log')
box on
l=1;

% rx=round(max(cod)/300);
% for i=  rx:rx:max(cod)+rx
%     xo(l)=(l-1)*rx+ round(rx/2);
%     l=l+1;
% end
% k=1;
% yo =zeros(size(xo,2),1);
% for i=1: size(cod, 1)
%     if(cod(i)<= xo(k)+rx/2)
%         yo(k,1)=  yo(k,1) + countod(i);
%     else
%         while (cod(i)>= xo(k)+round(rx/2))
%         k=k+1
%         end
%
%         yo(k,1)=  yo(k,1) + countod(i);
%     end
% end
% k=1;
% for i=1: (size(xo,2))
%     if(yo(i,1) ~=0)
%         so(k, 1)=xo(i);
%         so(k,2)=yo(i,1);
%         k=k+1;
%     end
% end
% %
% [cod, iaod, icod]= unique(wod);
% countod= accumarray(icod,1);
% figure
% scatter(cod, countod,'filled')
% % scatter( so(:, 1),  so(:, 2))
% xlabel('out-degree');
% ylabel('count');
% set(gca,'fontsize',14)
% set(gca,'xscale','log', 'yscale', 'log')
% box on
% Assortivity
matfarm=zeros(farm, farm);

for i=1:size(A2,1)
    matfarm(A2(i,1), A2(i,2))= A2(i,3);
end

for i= 1: size(cid)
    x= cid(i);
    for j= 1: farm
        if(wid(j))
        end
    end
end



% %betweenness centrality
betwce= A(:, 14);
figure

plot_dist(betwce,max(betwce),min(betwce),110,'Betweenness', 'Normalized frequency')
[cbetwce, iabetwce, icbetwce]= unique(betwce);
countbetwce= accumarray(icbetwce,1);
figure
scatter(cbetwce, countbetwce,'filled')
xlabel('betweenness');
ylabel('count');
set(gca,'fontsize',14)
set(gca,'xscale','log', 'yscale', 'log')
box on

% analysis of different size
statics=19;

f1= find(A(:,3)==1);
sizeone= A(f1,:);
f2= find(A(:,3)==2);
sizetwo= A(f2,:);
f3= find(A(:,3)==3);
sizethree= A(f3,:);
f4= find(A(:,3)==4);
sizefour= A(f4,:);
f5= find(A(:,3)==5);
sizefive= A(f5,:);
f6= find(A(:,3)==6);
sizesix= A(f6,:);
f7= find(A(:,3)==7);
sizeseven= A(f7,:);
m1= mean(sizeone(:,statics))
m2= mean(sizetwo(:,statics))
m3= mean(sizethree(:,statics))
m4= mean(sizefour(:,statics))
m5= mean(sizefive(:,statics))
m6= mean(sizesix(:,statics))
m7= mean(sizeseven(:,statics))

median1= median(sizeone(:,statics))
median2= median(sizetwo(:,statics))
median3= median(sizethree(:,statics))
median4= median(sizefour(:,statics))
median5= median(sizefive(:,statics))
median6= median(sizesix(:,statics))
median7= median(sizeseven(:,statics))

min1= min(sizeone(:,statics))
min2= min(sizetwo(:,statics))
min3= min(sizethree(:,statics))
min4= min(sizefour(:,statics))
min5= min(sizefive(:,statics))
min6= min(sizesix(:,statics))
min7= min(sizeseven(:,statics))


max1= max(sizeone(:,statics))
max2= max(sizetwo(:,statics))
max3= max(sizethree(:,statics))
max4= max(sizefour(:,statics))
max5= max(sizefive(:,statics))
max6= max(sizesix(:,statics))
max7= max(sizeseven(:,statics))





c1= ConfidenceInterval(sizeone(:,statics),.95)
c2= ConfidenceInterval(sizetwo(:,statics),.95)
c3= ConfidenceInterval(sizethree(:,statics),.95)
c4= ConfidenceInterval(sizefour(:,statics),.95)
c5= ConfidenceInterval(sizefive(:,statics),.95)
c6= ConfidenceInterval(sizesix(:,statics),.95)
c7= ConfidenceInterval(sizeseven(:,statics),.95)

figure
boxplot(sizeone(:,8))


function [] = plot_dist(Data, max, min, nbins,txt,ytxt)
lbins= (max-min)/nbins;
% lbins=1;
%     dist = zeros(1,ceil(max(Data))+1);
k=1;
distribution=zeros(nbins+1,1);
for i=min+lbins:lbins:max+lbins
    for j=1: length(Data)
        if(Data(j)<i)
            Data(j)=999999999999999999999999999999999999;
            distribution(k)= distribution(k)+1;
        end
    end
    k=k+1;
end
figure
loglog(min+lbins:lbins:max+lbins,distribution/sum(distribution),'o','MarkerFaceColor',[0.3 0.3 0.3],'MarkerEdgeColor',[0.3 0.3 0.3], 'MarkerSize',5)
ylabel(ytxt);
xlabel(txt);
%     b.FaceColor = [0.3 0.3 0.3];
%     ylabel('normalized frequency');
%     xlabel('\it \lambda');
% xlabel('\it K');
% xlabel('\it \beta_0');

%     set(gca,'fontsize',15)
%     ax = gca;
% ax.XAxis.Exponent = 4;
%     xlim([0 16000])
%     b.EdgeColor = [0 0.5 0.5];


%     xlabel('\it \lambda');
% xlabel('\it K');
% xlabel('\it \beta_0');


%     set(gca, 'yscale', 'log')

%     figure
%     scatter(min+lbins:lbins:max, distribution/sum(distribution))
%     xlabel(txt);
%set(gca,'xscale','log')
sifu=1;
