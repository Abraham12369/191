clear all

%import confidence,norm_pos_x,norm_pos_y from gaze_position.csv
filename='gaze_positions.csv';
b=importdata(filename);
length=size(b,1);
delimiter=',';
startRow=2;

formatSpec = '%*s%*s%f%f%f%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'HeaderLines' ,startRow-1, 'ReturnOnError', false);
fclose(fileID);

confidence = dataArray{:, 1};
norm_pos_x = dataArray{:, 2};
norm_pos_y = dataArray{:, 3};

gaze=[norm_pos_x,norm_pos_y,confidence];

clearvars filename delimiter startRow formatSpec fileID dataArray ans;

save('gaze.mat','gaze');
