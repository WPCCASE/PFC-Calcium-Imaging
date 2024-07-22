clear; close all; clc;
cd 'H:\matlab_cui\Calcium\cal_syn\IPSC\sIPSC mPFC L5PyN with Afatin\';
%% sIPSC B&A CRS
fn = "3511.abf"; %'color',[0,0,0], sIPSC Ctrl
[d, si] = abfload(fn);
Begin = 480*1e6/si+1;                % 1e6/si = sample number for 1 second, 40*1e6/si = 40 s from starting
End = Begin + 1200*1e6/si+1;          % end = begin plus 30 s, therefore "Begin-end" is 30 s time window

%% draw plot
[duration, channels, traces] = size(d);
ch = 1;                             % recording channel is channel 1, no nned to change
figure
hold on
for i = 1:traces                    % plot all the traces together
    if (i~=5)*(i~=100)*(i~=100)==1     % get trace 1 (-300 pA), 10 (150 pA), and 13 (300 pA), and plot them
        plot(d(Begin:2:End, ch, i)-mean(d(Begin:2:End, ch, :)), 'color',[141/255 141/255 255/255], 'Linewidth',0.2);
        %axis([1,inf,-200,60]);       % define x, y axis
    end
end
hold off
saveas(gcf,strcat(fn,'.fig'));
