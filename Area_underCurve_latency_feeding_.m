clear;
close all;

dir_name='H:\matlab_cui\Calcium\cal_syn\M049_VIP_NSF_saline\';
cd 'H:\matlab_cui\Calcium\cal_syn\M049_VIP_NSF_saline\';

data=xlsread('M049_VIP_NSF_saline.csv');
data_zscore=zscore(data(:,2:end));
data_zscore(data_zscore<0)= 0;
%data_vip=[];
%vip=[40 44 67 85 84 91 132 149 147 42 125 46 135 185 26 64];
%data_vip=[data_zscore(:,40) data_zscore(:,44) data_zscore(:,67) data_zscore(:,85) data_zscore(:,85) data_zscore(:,84) data_zscore(:,91) data_zscore(:,132) data_zscore(:,149) data_zscore(:,147)];
%data_vip=[data_vip data_zscore(:,42) data_zscore(:,125) data_zscore(:,46) data_zscore(:,135) data_zscore(:,185) data_zscore(:,26) data_zscore(:,64)];


data_latency=data_zscore(1:681,:);
data_feeding=data_zscore(682:5998,:);



data_areaUnderCurve1 =trapz(data_latency)/68.1;
data_areaUnderCurve2 =trapz(data_feeding)/531.7;

deltaAUC=data_areaUnderCurve2-data_areaUnderCurve1;



csvwrite([dir_name,'M049_saline_latency_AUC3.csv'],[data_areaUnderCurve1])% cui added 
csvwrite([dir_name,'M049_saline_feeding_AUC4.csv'],[data_areaUnderCurve2])% cui added 
csvwrite([dir_name,'M049_saline_DeltaAUC.csv'],[deltaAUC])% cui added 

