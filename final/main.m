%pre-process video by cropping to square 

%read in 'sample.mp4'
vid = VideoReader('single.mp4');
vidHeight = vid.Height;
vidWidth = vid.Width;

%creates matlab movie stuct
s = struct('cdata',zeros(vidHeight,vidWidth,3,'uint8'),...
    'colormap',[]);

%reads frames one by one into struct from vid object
k = 1;
while hasFrame(vid)
    %convert to greyscale
    s(k).cdata = rgb2gray(readFrame(vid));
    
    %downsample framerate by factor of 1/(n+1)
    n = 20;
    for i = 1:n
        if hasFrame(vid)
            readFrame(vid);
        end
    end
    k = k+1;
end

%struct info
whos s
% image(s(n).cdata) displays nth frame
x = s(5).cdata;
imshow(x)



