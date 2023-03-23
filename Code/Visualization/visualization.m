Tb= readtable('SIS_ER_differentsize.xlsx');
IMFF=table2array(Tb(1:105,1:3));

UMFF1=table2array(Tb(1:77,4:6));
UMFF2=table2array(Tb(1:137,7:9));
UMFF3=table2array(Tb(1:185,10:12));
UMFF4=table2array(Tb(1:205,13:15));
UMFF5=table2array(Tb(1:161,16:18));

figure
plot(IMFF(:,1), IMFF(:,2),'Color',[0.4660 0.6740 0.1880 0.6], 'LineWidth',2);
hold on
plot(IMFF(:,1), IMFF(:,3), 'Color',[0.8500 0.3250 0.0980 0.6], 'LineWidth', 2);
% hold on
% plot(IMFF(:,1), IMFF(:,4),'Color',[0 0.4470 0.7410 0.6],'LineWidth',3);
legend('susceptible','infected')
set(gca,'fontsize',18, 'FontName', 'Arial')

figure
% hold on
plot(UMFF1(:,1), UMFF1(:,2),'LineStyle','--',  'Color',[0.4660 0.6740 0.1880 0.6],'LineWidth',2);
hold on
plot(UMFF1(:,1), UMFF1(:,3),'LineStyle','--',  'Color',[0.8500 0.3250 0.0980 0.6],'LineWidth',2);
% hold on
% % plot(UMFF1(:,1), UMFF1(:,4),'LineStyle','--',  'Color',[0 0.4470 0.7410 0.6],'LineWidth',2);
legend('susceptible','infected')
set(gca,'fontsize',18, 'FontName', 'Arial')

figure
% hold on
plot(UMFF2(1:6:end,1), UMFF2(1:6:end,2),'Marker','^', 'MarkerSize', 7, 'Color',[0.4660 0.6740 0.1880]);
hold on
plot(UMFF2(1:6:end,1), UMFF2(1:6:end,3),'Marker','^', 'MarkerSize', 7, 'Color',[0.8500 0.3250 0.0980]);
% hold on
% % plot(UMFF2(1:2:end,1), UMFF2(1:2:end,4),'Marker','^', 'MarkerSize', 7, 'Color',[0 0.4470 0.7410]);
legend('susceptible','infected')
set(gca,'fontsize',18, 'FontName', 'Arial')

figure
% hold on
plot(UMFF3(3:11:end,1), UMFF3(3:11:end,2),'Marker','*', 'MarkerSize', 7, 'Color',[0.4660 0.6740 0.1880]);
hold on
plot(UMFF3(3:11:end,1), UMFF3(3:11:end,3),'Marker','*', 'MarkerSize', 7, 'Color',[0.8500 0.3250 0.0980]);
% % hold on
% % plot(UMFF3(2:3:end,1), UMFF3(2:3:end,4),'Marker','*', 'MarkerSize', 7, 'Color',[0 0.4470 0.7410]);
legend('susceptible','infected')
set(gca,'fontsize',18, 'FontName', 'Arial')

figure
% hold on
plot(UMFF4(1:8:end,1), UMFF4(1:8:end,2),'Marker','s', 'MarkerSize', 7, 'Color',[0.4660 0.6740 0.1880]);
hold on
plot(UMFF4(1:8:end,1), UMFF4(1:8:end,3),'Marker','s', 'MarkerSize', 7, 'Color',[0.8500 0.3250 0.0980]);

legend('susceptible','infected')
 set(gca,'fontsize',18, 'FontName', 'Arial')
 
 figure
% hold on
plot(UMFF5(1:6:end,1), UMFF5(1:6:end,2),'Marker','h', 'MarkerSize', 7, 'Color',[0.4660 0.6740 0.1880]);
hold on
plot(UMFF5(1:6:end,1), UMFF5(1:6:end,3),'Marker','h', 'MarkerSize', 7, 'Color',[0.8500 0.3250 0.0980]);

legend('susceptible','infected')
 set(gca,'fontsize',18, 'FontName', 'Arial')
sifu=1


