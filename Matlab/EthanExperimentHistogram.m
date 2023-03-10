
clear all;
close all;

%Time delay from monitor
timeDelay = 59.6;

%Get paths to your .csv files using cmd/terminal
path = "/Users/ethan/Desktop/Code/EMC/emc-training/Lecture 3/PsychoPy/Data/Ethan Nguyen_23-01-31_16-22-37.csv";

%Reading In Data
Data = readtable(path);

keyPressed = table2array(Data(:,2));
reactionTimes = table2array(Data(:,3))*1000 - timeDelay;
correctness = table2array(Data(:,4));

% disp(correctness)

redStimuli = [];
blueStimuli = [];


i = 1;
while i <= 50
    if correctness{i} == "True"
        if keyPressed{i} == "f"
            redStimuli(end + 1) = reactionTimes(i);
        elseif keyPressed{i} == "j"
            blueStimuli(end + 1) = reactionTimes(i);
        end
    end
    i = i + 1;
end

% Plotting Red Color

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
axis([150 400 0 10])
%[ymin ymax xmin xmax]

xlabel("Reaction Time (ms)");
ylabel("Frequency");

title("Reaction Time Distribution for 2 Decision-Making between Red and Blue Stimulus");