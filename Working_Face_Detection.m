%FINAL RESULT WORKING

clear all
close all
clc
FDetect=vision.CascadeObjectDetector;
v=VideoReader('trial.mp4');
lastframe=read(v,inf);
frametotal=v.NumberOfFrames;
start=1;
stop=frametotal;
check=20;
file='trial.mp4';
for index=start:1:stop
    image(:,:,:,index)=read(v,index);
end

%initialize
BB(2,4,index-1)=zeros;

for frame=start:1:stop
I(:,:,:)=image(:,:,:,frame);
bb_check=step(FDetect,I);
face_detect=size(bb_check,1);

    for counter=1:face_detect
        BB(counter,:,frame)=bb_check(counter,:);
    end

end

figure
testframe=check;
test=image(:,:,:,testframe);
imshow(test);
hold on
for i=1:size(BB,1)
    rectangle('Position',BB(i,:,testframe),'LineWidth',4,'LineStyle','-','EdgeColor','r');
end

hold off;