
clear all;
close all;

%Time delay from monitor
timeDelay = 59.6;

%Get paths to Aggregate Gabor
myDir = "/Users/ethan/Desktop/Code/EMC/emc-training/Lecture 7/AggregateGabor";

%Getting more file paths
listing = dir(myDir);
listing(1:2) = [];

%% Extracting Data
for i = 1:length(listing)
    subFolder(i).subfolder = listing(i).name;
    folderList(i).files = dir(fullfile(myDir, listing(i).name));
    folderList(i).files(1:2, :) = [];
end

RT = [];
for i = 1:length(subFolder)
    for j = 1:length(folderList(i).files)
        table1 = readtable(fullfile(folderList(i).files(j).folder, folderList(i).files(j).name));
        RT = cat(1, RT, mean(table2array(table1(:, 4))));
    end

    if i == 1
        OneDec = RT;
    elseif i == 2
        TwoDec = RT;
    elseif i == 3
        ThreeDec = RT;
    end

    RT = [];
end
 

%% Plotting Reflex

figure()
hold on

%Changing data type and specifying row containing RTs
xvals = OneDec * 1000 - timeDelay;
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

xvals = TwoDec * 1000 - timeDelay;
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
xvals = ThreeDec * 1000 - timeDelay;
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
axis([100 900 0 10])
%[ymin ymax xmin xmax]

xlabel("Reaction Time (ms)");
ylabel("Frequency");

title("Reaction Time Distribution for 1, 2, 3 Decision-Making");