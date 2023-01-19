
clear;
close all;
cd 'H:\matlab_cui\Calcium\cal_syn\M040_vgat_NSF_saline3\'

dir_name='H:\matlab_cui\Calcium\cal_syn\M040_vgat_NSF_saline3\data_approach\';
%%%%%% number of neurons
w = 136;
%%% Calcium imaging data
calcium=xlsread('M041_vgat_NSF_saline3.csv');
%%%Time=calcium(:,1);
calcium_cell_data=calcium(:,2:end)*100; %%%deltaF/F percentage of F/F
%%%% ?Event averaged? trigger time
Time=[-10:0.1:12]; %%x axis from -1.5 s to 12 s
num_cell=size(calcium_cell_data,2); %%% Neuron number, from column of calcium_cell_data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%approaching behavior
approach=xlsread('approach.xlsx');
approach_non_eat=approach(:,1);
approach_non_eat = approach_non_eat(~isnan(approach_non_eat));
num_approach_non_eat=size(approach_non_eat);

%%%%%% Separate approach_eat and approach_non_eat session
calcium_neuron_approach_non_eat=[];
    for j=1:num_approach_non_eat(:,1)
    calcium_neuron_approach_non_eat(:,j)=calcium_cell_data(approach_non_eat(j)-100:approach_non_eat(j)+120,w);
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%interaction behavior
interaction=xlsread('interaction.xlsx');
interaction_non_eat=interaction(:,1);
interaction_non_eat = interaction_non_eat(~isnan(interaction_non_eat));
num_interaction_non_eat=size(interaction_non_eat);

%%%%%% Separate approach_eat and approach_non_eat session
calcium_neuron_interaction_non_eat=[];
    for j=1:num_interaction_non_eat(:,1)
    calcium_neuron_interaction_non_eat(:,j)=calcium_cell_data(interaction_non_eat(j)-100:interaction_non_eat(j)+120,w);
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%escape behavior
escape=xlsread('escape.xlsx');
escape_non_eat=escape(:,1);
escape_non_eat = escape_non_eat(~isnan(escape_non_eat));
num_escape_non_eat=size(escape_non_eat);

%%%%%% Separate approach_eat and approach_non_eat session
calcium_neuron_escape_non_eat=[];
    for j=1:num_escape_non_eat(:,1)
    calcium_neuron_escape_non_eat(:,j)=calcium_cell_data(escape_non_eat(j)-100:escape_non_eat(j)+120,w);
    end

%%%Approach_non_eat figures
mean_calcium_neuron_approach_non_eat=mean(calcium_neuron_approach_non_eat,2); %%% average all the columns using '2' horizontally
calcium_ste_approach_non_eat=ste(calcium_neuron_approach_non_eat');%'
calcium_zscore_approach_non_eat=zscore(calcium_neuron_approach_non_eat); %%%??zscore
mean_calcium_zscore_approach_non_eat=mean(calcium_zscore_approach_non_eat,2); %%% zscore ???? ???horizontally average
zscore_ste_approach_non_eat=ste(calcium_zscore_approach_non_eat,2); %%%zscore ?standard error
filename1 = sprintf('calcium_neuron_approach_non_eat%d.csv',w);
csvwrite([dir_name,filename1],[calcium_neuron_approach_non_eat]);
filename2 = sprintf('calcium_zscore_approach_non_eat%d.csv',w);
csvwrite([dir_name,filename2],[calcium_zscore_approach_non_eat]);
filename10=sprintf('mean_calcium_neuron_approach_non_eat%d.csv',w);
csvwrite([dir_name,filename10],[mean_calcium_neuron_approach_non_eat]);
filename11=sprintf('mean_calcium_zscore_approach_non_eat%d.csv',w);
csvwrite([dir_name,filename11],[mean_calcium_zscore_approach_non_eat]);
%%%%%plot figures 
for i=1:num_approach_non_eat(:,1)
plot(Time,calcium_neuron_approach_non_eat(:,i))
xlabel('Time (s)')
ylabel('approach_non_eat_deltaF/F')
title([num2str(i),'th traceof approach_non_eat',num2str(num_approach_non_eat(:,1))])
%pause;
end

figure
hold on
plot(Time,calcium_neuron_approach_non_eat(:,1:num_approach_non_eat(:,1)))
plot(Time,mean_calcium_neuron_approach_non_eat,'k','Linewidth',5)  %%%%1st average
xlabel('Time (s)','fontsize',25) %%% I add fontsize 
ylabel('approach_non_eat_deltaF/F','fontsize',25)
xlim([-10,12]) %%%seting x axis range
%ylim([-0.05,0.2]) %%%seting y axis range
set(gca,'XTick',[-10:2:12]) %
set(gca,'fontsize',20) %%%% cui added the font size on the x and y axis
filename00 = sprintf('approach_non_eat_all_FF%d.tif',w);
print(gcf,'-dtiff',[dir_name,filename00]) %%%DPI 600
figure
shadedErrorBar(Time,mean_calcium_neuron_approach_non_eat,calcium_ste_approach_non_eat')
xlabel('Time (s)','fontsize',25)%%% fontsize
ylabel('approach_non_eat_deltaF/F','fontsize',25)
%ylim([-0.05,0.2]) %%%seting y axis range
xlim([-10,12]) %%%seting x axis range
set(gca,'XTick',[-10:2:12]) %
set(gca,'fontsize',20) %%%cui added the font size of the number on the x and y axis
filename8 = sprintf('approach_non_eat_deltaFF%d.tif',w);
print(gcf,'-dtiff',[dir_name,filename8]) %%%DPI 600
figure
shadedErrorBar(Time,mean_calcium_zscore_approach_non_eat,zscore_ste_approach_non_eat')
xlabel('Time (s)','fontsize',25)%%% fontsize
ylabel('approach_non_eat_Z-score','fontsize',25)
xlim([-10,12]) %%%seting x axis range
%ylim([-0.025,0.025]) %%%seting y axis range
set(gca,'XTick',[-10:2:12]) %
set(gca,'fontsize',20) %%%cui added the font size of the number on the x and y axis
filename7 = sprintf('approach_non_eat_Zscore_deltaFF%d.tif',w);
print(gcf,'-dtiff',[dir_name,filename7]) %%%DPI 600
%%%%%plot figures 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%interaction 
dir_name2='H:\matlab_cui\Calcium\cal_syn\M040_vgat_NSF_saline3\data_interaction\';
mean_calcium_neuron_interaction_non_eat=mean(calcium_neuron_interaction_non_eat,2); %%% average all the columns using '2' horizontally
calcium_ste_interaction_non_eat=ste(calcium_neuron_interaction_non_eat');%'
calcium_zscore_interaction_non_eat=zscore(calcium_neuron_interaction_non_eat); %%%??zscore
mean_calcium_zscore_interaction_non_eat=mean(calcium_zscore_interaction_non_eat,2); %%% zscore ???? ???horizontally average
zscore_ste_interaction_non_eat=ste(calcium_zscore_interaction_non_eat,2); %%%zscore ?standard error
filename14 = sprintf('calcium_neuron_interaction_non_eat%d.csv',w);
csvwrite([dir_name2,filename14],[calcium_neuron_interaction_non_eat]);
filename15 = sprintf('calcium_zscore_interaction_non_eat%d.csv',w);
csvwrite([dir_name2,filename15],[calcium_zscore_interaction_non_eat]);
filename16=sprintf('mean_calcium_neuron_interaction_non_eat%d.csv',w);
csvwrite([dir_name2,filename16],[mean_calcium_neuron_interaction_non_eat]);
filename17=sprintf('mean_calcium_zscore_interaction_non_eat%d.csv',w);
csvwrite([dir_name2,filename17],[mean_calcium_zscore_interaction_non_eat]);

for i=1:num_interaction_non_eat(:,1)
plot(Time,calcium_neuron_interaction_non_eat(:,i))
xlabel('Time (s)')
ylabel('interaction_non_eat_deltaF/F')
title([num2str(i),'th trace out of interaction_non_eat',num2str(num_interaction_non_eat(:,1))])
%pause;
end
figure
hold on
plot(Time,calcium_neuron_interaction_non_eat(:,1:num_interaction_non_eat(:,1)))
plot(Time,mean_calcium_neuron_interaction_non_eat,'k','Linewidth',5)  %%%%1st average
xlabel('Time (s)','fontsize',25) %%% I add fontsize 
ylabel('interaction_non_eat_deltaF/F','fontsize',25)
xlim([-10,12]) %%%seting x axis range
%ylim([-0.05,0.2]) %%%seting y axis range
set(gca,'XTick',[-10:2:12]) %
set(gca,'fontsize',20) %%%% cui added the font size on the x and y axis
filename00 = sprintf('interaction_non_eat_all_FF%d.tif',w);
print(gcf,'-dtiff',[dir_name2,filename00]) %%%DPI 600
figure
shadedErrorBar(Time,mean_calcium_neuron_interaction_non_eat,calcium_ste_interaction_non_eat')
xlabel('Time (s)','fontsize',25)%%% fontsize
ylabel('interaction_non_eat_deltaF/F','fontsize',25)
%ylim([-0.05,0.2]) %%%seting y axis range
xlim([-10,12]) %%%seting x axis range
set(gca,'XTick',[-10:2:12]) %
set(gca,'fontsize',20) %%%cui added the font size of the number on the x and y axis
filename18 = sprintf('interaction_non_eat_deltaFF%d.tif',w);
print(gcf,'-dtiff',[dir_name2,filename18]) %%%DPI 600
figure
shadedErrorBar(Time,mean_calcium_zscore_interaction_non_eat,zscore_ste_interaction_non_eat')
xlabel('Time (s)','fontsize',25)%%% fontsize
ylabel('interaction_non_eat_Z-score','fontsize',25)
xlim([-10,12]) %%%seting x axis range
%ylim([-0.025,0.025]) %%%seting y axis range
set(gca,'XTick',[-10:2:12]) %
set(gca,'fontsize',20) %%%cui added the font size of the number on the x and y axis
filename19 = sprintf('interaction_non_eat_Zscore_deltaFF%d.tif',w);
print(gcf,'-dtiff',[dir_name2,filename19]) %%%DPI 600



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%escape
dir_name3='H:\matlab_cui\Calcium\cal_syn\M040_vgat_NSF_saline3\data_escape\';
mean_calcium_neuron_escape_non_eat=mean(calcium_neuron_escape_non_eat,2); %%% average all the columns using '2' horizontally
calcium_ste_escape_non_eat=ste(calcium_neuron_escape_non_eat');%'
calcium_zscore_escape_non_eat=zscore(calcium_neuron_escape_non_eat); %%%??zscore
mean_calcium_zscore_escape_non_eat=mean(calcium_zscore_escape_non_eat,2); %%% zscore ???? ???horizontally average
zscore_ste_escape_non_eat=ste(calcium_zscore_escape_non_eat,2); %%%zscore ?standard error
filename34 = sprintf('calcium_neuron_escape_non_eat%d.csv',w);
csvwrite([dir_name3,filename34],[calcium_neuron_escape_non_eat]);
filename35 = sprintf('calcium_zscore_escape_non_eat%d.csv',w);
csvwrite([dir_name3,filename35],[calcium_zscore_escape_non_eat]);
filename36=sprintf('mean_calcium_neuron_escape_non_eat%d.csv',w);
csvwrite([dir_name3,filename36],[mean_calcium_neuron_escape_non_eat]);
filename37=sprintf('mean_calcium_zscore_escape_non_eat%d.csv',w);
csvwrite([dir_name3,filename37],[mean_calcium_zscore_escape_non_eat]);
%%%%%plot figures 
for i=1:num_escape_non_eat(:,1)
plot(Time,calcium_neuron_escape_non_eat(:,i))
xlabel('Time (s)')
ylabel('escape_non_eat_deltaF/F')
title([num2str(i),'th trace out of escape_non_eat',num2str(num_escape_non_eat(:,1))])
%pause;
end
figure
hold on
plot(Time,calcium_neuron_escape_non_eat(:,1:num_escape_non_eat(:,1)))
plot(Time,mean_calcium_neuron_escape_non_eat,'k','Linewidth',5)  %%%%1st average
xlabel('Time (s)','fontsize',25) %%% I add fontsize 
ylabel('escape_non_eat_deltaF/F','fontsize',25)
xlim([-10,12]) %%%seting x axis range
%ylim([-0.05,0.2]) %%%seting y axis range
set(gca,'XTick',[-10:2:12]) %
set(gca,'fontsize',20) %%%% cui added the font size on the x and y axis
filename00 = sprintf('escape_non_eat_all_FF%d.tif',w);
print(gcf,'-dtiff',[dir_name3,filename00]) %%%DPI 600
figure
shadedErrorBar(Time,mean_calcium_neuron_escape_non_eat,calcium_ste_escape_non_eat')
xlabel('Time (s)','fontsize',25)%%% fontsize
ylabel('escape_non_eat_deltaF/F','fontsize',25)
%ylim([-0.05,0.2]) %%%seting y axis range
xlim([-10,12]) %%%seting x axis range
set(gca,'XTick',[-10:2:12]) %
set(gca,'fontsize',20) %%%cui added the font size of the number on the x and y axis
filename38 = sprintf('escape_non_eat_deltaFF%d.tif',w);
print(gcf,'-dtiff',[dir_name3,filename38]) %%%DPI 600
figure
shadedErrorBar(Time,mean_calcium_zscore_escape_non_eat,zscore_ste_escape_non_eat')
xlabel('Time (s)','fontsize',25)%%% fontsize
ylabel('escape_non_eat_Z-score','fontsize',25)
xlim([-10,12]) %%%seting x axis range
%ylim([-0.025,0.025]) %%%seting y axis range
set(gca,'XTick',[-10:2:12]) %
set(gca,'fontsize',20) %%%cui added the font size of the number on the x and y axis
filename39 = sprintf('escape_non_eat_Zscore_deltaFF%d.tif',w);
print(gcf,'-dtiff',[dir_name3,filename39]) %%%DPI 600









