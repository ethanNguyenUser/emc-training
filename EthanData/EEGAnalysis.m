
clear all;
close all;

%Time delay from monitor
timeDelay = 59.6;

%Get paths to your .csv files using cmd/terminal
pathEmotiv = "/Users/ethan/Desktop/Code/EMC/emc-training/EthanData/Psychopy_Ethan Nguyen_2023-02-08T161045.915958_EPOCX_160085_2023.02.08T16.10.45.08.00.csv";
pathPsycho = "/Users/ethan/Desktop/Code/EMC/emc-training/EthanData/Ethan Nguyen_23-02-08_16-10-26.csv";

%Reading In Data
emotivData = readtable(pathEmotiv);
psychoData = readtable(pathPsycho);

keyPressed = table2array(psychoData(:,2));
reactionTimes = table2array(Data(:,3))*1000 - timeDelay;
correctness = table2array(Data(:,4));

redStimuli = [];
blueStimuli = [];

i = 1;
while i <= 50
    if correctness(i) == "True"
        if keyPressed == "f"
            redStimuli(end + 1) = reactionTimes(i);
        elseif keyPressed == "j"
            blueStimuli(end + 1) = reactionTimes(i);
        end
    elseif correctness(i) == "False"
        if keyPressed == "f"
            blueStimuli(end + 1) == reactionTimes(i);
        elseif keyPressed == "j"
            redStimuli(end + 1) = reactionTimes(i);
        end
    end
    i = i + 1;
end

%% Plotting Red Color

figure()
hold on

%Changing data type and specifying row containing RTs
avals = rmoutliers(redStimuli,'quartiles');

%Plot avals in a histogram and toggle bar & edge color
histogram(avals,'FaceColor','#EE0000', 'EdgeColor', 'w', 'BinWidth',20);

mn = mean(avals,'omitnan');
stdv = std(avals,'omitnan');

namelabel = 'Red Stimuli';
mnlabel = sprintf('Mean: %4.2f ms', mn);
stdlabel = sprintf('Std Deviation: %4.2f ms', stdv);

n = annotation('textbox',[0.62 0.65 0.1 0.1]);

set(n,'String',{namelabel, mnlabel,stdlabel});

%% Plotting Blue Color

avals = rmoutliers(blueStimuli,'quartiles');

histogram(avals,'FaceColor', '#0000EE', 'EdgeColor', 'w', 'BinWidth',20);

mn = mean(avals,'omitnan');
stdv = std(avals,'omitnan');

namelabel = 'Blue Stimuli';
mnlabel = sprintf('Mean: %4.2f ms', mn);
stdlabel = sprintf('Std Deviation: %4.2f ms', stdv);

n = annotation('textbox',[0.62 0.50 0.1 0.1]);

set(n,'String',{namelabel, mnlabel,stdlabel});

%%
legend('Red Stimulus', 'Blue Stimulus');
axis([0 600 0 20])
%[ymin ymax xmin xmax]

xlabel("Reaction Time (ms)");
ylabel("Frequency");

title("Reaction Time Distribution for 2 Decision-Making between Red and Blue Stimulus");