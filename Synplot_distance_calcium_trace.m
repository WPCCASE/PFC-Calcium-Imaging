
clear;
close all;
cd 'H:\matlab_cui\Calcium\cal_syn\M041_Vgat_NSF\'
dir_name='H:\matlab_cui\Calcium\cal_syn\M041_Vgat_NSF\';

behavior=xlsread('M041_NSF_saline5new_XY.xlsx');
distance=behavior(:,5);

calcium=xlsread('M041_NSF_saline5.csv');

calcium_cell_data=calcium(:,2:end)*100; %%%deltaF/F percentage of F/F
%%%% ?Event averaged? trigger time
Time=[0:0.1:900.2]; %%x axis from -1.5 s to 12 s
num_cell=size(calcium_cell_data,2); %%% Neuron number, from column of calcium_cell_data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%approaching behavior


%set(gcf, 'defaultAxesFontSize', 16); 
%figure('papersize', [8, 8]); 

set(gcf, 'defaultAxesFontSize', 16); 
col = colormap(jet); 
axes('position', [0.0, 0.0, 0.99, 1]); 
hold on; 
%axes('position', [0.0, 0.0, 0.99, 1]); 

for i=1:30
 y=calcium_cell_data(:,i);
 plot(y+(30-i)*2,'linewidth',1, 'color','k')
end
plot(distance);
hold on
plot([0, 1000], [0, 0],'k-', 'LineWidth', 4 );%%%x axis scale plot at 100 point, 10s, 
plot([0, 0], [0, 5], 'k-', 'LineWidth', 4);%%% y axis scale
title('10s /5');
axis off;

%axis([-8,100,-1.5, 10.5]); 
print(gcf,'-depsc','-r2000','-painters',[dir_name,'M030_TST_SSRI_trace1.eps'])%%%%%%must '-painters'!!!!

for i=31:60
 y=calcium_cell_data(:,i);
 plot(y+(30-i)*2,'linewidth',1, 'color','k')
end
plot(distance);
hold on
plot([0, 1000], [0, 0],'k-', 'LineWidth', 4 );%%%x axis scale plot at 100 point, 10s, 
plot([0, 0], [0, 5], 'k-', 'LineWidth', 4);%%% y axis scale
title('10s /5');
%axis off;

%axis([-8,100,-1.5, 10.5]); 
print(gcf,'-depsc','-r2000','-painters',[dir_name,'M030_TST_SSRI_trace2.eps'])%%%%%%must '-painters'!!!!

for i=61:90
 y=calcium_cell_data(:,i);
 plot(y+(30-i)*2,'linewidth',1, 'color','k')
end
plot(distance);
hold on
plot([0, 1000], [0, 0],'k-', 'LineWidth', 4 );%%%x axis scale plot at 100 point, 10s, 
plot([0, 0], [0, 5], 'k-', 'LineWidth', 4);%%% y axis scale
title('10s /5');
%axis off;

%axis([-8,100,-1.5, 10.5]); 
print(gcf,'-depsc','-r2000','-painters',[dir_name,'M030_TST_SSRI_trace3.eps'])%%%%%%must '-painters'!!!!
