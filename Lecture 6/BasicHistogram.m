
clear all;
close all;

%Time delay from monitor
timeDelay = 59.6;

%Get paths to your .csv files using cmd/terminal
path1 = "/Users/ethan/Desktop/Code/EMC/emc-training/Lecture 2/Data/Ethan Nguyen_01_12_Gabor Reflex Wide.csv";
path2 = "/Users/ethan/Desktop/Code/EMC/emc-training/Lecture 2/Data/Ethan Nguyen_01_12_Gabor Two Decision Covert.csv";
path3 = "/Users/ethan/Desktop/Code/EMC/emc-training/Lecture 2/Data/Ethan Nguyen_01_12_Gabor Three Decision Covert.csv";

%Reading In Data
OneDec = readtable(path1);
TwoDec = readtable(path2);
ThreeDec = readtable(path3);


%% Plotting Reflex

figure()
hold on

%Changing data type and specifying row containing RTs
xvals = table2array(OneDec(:,4))*1000 - timeDelay;
avals = rmoutliers(xvals,'quartiles');

%Plot avals in a histogram and toggle bar & edge color
histogram(avals,'FaceColor','#0072BD', 'EdgeColor', 'w', 'BinWidth',20);

mn = mean(avals,'omitnan');
stdv = std(avals,'omitnan');

namelabel = 'Reflex';
mnlabel = sprintf('Mean: %4.2f ms', mn);
stdlabel = sprintf('Std Deviation: %4.2f ms', stdv);

n = annotation('textbox',[0.62 0.65 0.1 0.1]);

set(n,'String',{namelabel, mnlabel,stdlabel});

%% Plotting Two Decision

xvals = table2array(TwoDec(:,4))*1000 - timeDelay;
avals = rmoutliers(xvals,'quartiles');

histogram(avals,'FaceColor', '[0.6350, 0.0780, 0.1840]', 'EdgeColor', 'w', 'BinWidth',20);

mn = mean(avals,'omitnan');
stdv = std(avals,'omitnan');

namelabel = '2 Decision';
mnlabel = sprintf('Mean: %4.2f ms', mn);
stdlabel = sprintf('Std Deviation: %4.2f ms', stdv);

n = annotation('textbox',[0.62 0.50 0.1 0.1]);

set(n,'String',{namelabel, mnlabel,stdlabel});

%% Plotting Three Decision
%Write code to plot your 3 Dec data
xvals = table2array(ThreeDec(:,4))*1000 - timeDelay;
avals = rmoutliers(xvals,'quartiles');

histogram(avals,'FaceColor', '#00EE00', 'EdgeColor', 'w', 'BinWidth',20);

mn = mean(avals,'omitnan');
stdv = std(avals,'omitnan');

namelabel = '3 Decision';

mnlabel = sprintf('Mean: %4.2f ms', mn);
stdlabel = sprintf('Std Deviation: %4.2f ms', stdv);

n = annotation('textbox',[0.62 0.35 0.1 0.1]);

set(n,'String',{namelabel, mnlabel,stdlabel});

%%
legend('Reflex', 'Two Decision', 'Three Decision');
axis([0 600 0 15])
%[ymin ymax xmin xmax]

xlabel("Reaction Time (ms)");
ylabel("Frequency");

title("Reaction Time Distribution for 1, 2, 3 Decision-Making");