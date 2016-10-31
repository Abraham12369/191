clear all
close all
clc

load('BB.mat');
load('gaze.mat');

frame=40;   %test #n frame
time_end=size(BB,3);
adjustBB(:,2,:)=720-BB(:,2,:);
adjustedBB=BB;
adjustedBB(:,2,:)=adjustBB(:,2,:);

%convert from normalize plane to video plane
adjusted_size_x(:,1)=gaze_point(:,1)*1280;
adjusted_size_y(:,1)=gaze_point(:,2)*720;
adjusted_coor=[adjusted_size_x,adjusted_size_y];

%create polygon detection from BB
%(x,y,person,frame)
person=1;
top_left(:,:)=adjustedBB(person,1:2);
top_right(:,:)=top_left+[adjustedBB(person,3),0];
bot_left(:,:)=top_left-[0,adjustedBB(person,3)];
bot_right(:,:)=bot_left+[adjustedBB(person,3),0];

xyv=[bot_left',top_left',top_right',bot_right',bot_left'];
xv=xyv(1,:);
yv=xyv(2,:);

%create hit scan coordinate
x=adjusted_coor(frame*2,1);
y=adjusted_coor(frame*2,2);

in=inpolygon(x,y,xv,yv);
figure
plot(xv,yv,x(in),y(in),'.r',x(~in),y(~in),'.b')
axis([1 1280 1 720]);






    