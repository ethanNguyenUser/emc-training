
clear all;
close all;

%Time delay from monitor
samplingRate = 256; %256 Hz for the Emotiv headset

%Get paths to your .csv files using cmd/terminal
path = "/Users/ethan/Desktop/Code/EMC/emc-training/EthanData/Psychopy_Ethan Nguyen_2023-02-08T161045.915958_EPOCX_160085_2023.02.08T16.10.45.08.00.csv";

%Reading In Data
Data = readtable(path);

O1Data = [table2array(Data(:, 1)) table2array(Data(:, 11)) table2array(Data(:, 23))];
eegData = zeros(28, 3 * samplingRate);

trialCounter = 1;
for i = 1:length(O1Data) - 256
    if O1Data(i,3) == 1
        eegData(trialCounter,:) = O1Data(i - samplingRate:i + 2 * samplingRate - 1, 2);
        trialCounter = trialCounter + 1;
    end
end

% mean()
averagedEEGData = mean(eegData, 1);
writematrix(averagedEEGData','EEGAnalysisAveraged.csv') 