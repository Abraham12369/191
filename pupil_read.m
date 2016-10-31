clc
clear all
close all
b=importdata('gaze_positions.csv');
array=b.textdata;
extract(:,1:2)=array(2:end,5:6);

for i=1:size(extract,1)
    for j=1:size(extract,2)
    x{i,j}=str2num(extract{i,j});
    end
end

for m=1:size(x,1)
    for n=1:size(x,2)
        gaze_point(m,n)=x{m,n}(1);
    end
end


%%%%%%%%%%
% 
% for n=1:length(test1)
%     x{n}=str2num(test1{n});
% end
% 
% for m=1:length(x)
%     y(m)=x{m}(1);
% end