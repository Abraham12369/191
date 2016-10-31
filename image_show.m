FDetect=vision.CascadeObjectDetector;
v=VideoReader('trial.mp4');
lastframe=read(v,inf);
frametotal=v.NumberOfFrames;
start=1;
stop=frametotal;
check=40;
file='trial.mp4';

for index=check
    image(:,:,:,index)=read(v,index);
end


figure
testframe=check;
testing=image(:,:,:,testframe);
imshow(testing);
hold on
for i=1:size(BB,1)
    rectangle('Position',BB(i,:,testframe),'LineWidth',4,'LineStyle','-','EdgeColor','r');
end