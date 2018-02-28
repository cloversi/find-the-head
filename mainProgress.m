function [A B C]=mainProgress(data) 
    %\\show progress, enabled only when testing
    %figure(1),imshow(data),title('original')
    %fprintf('Program paused. Press enter to continue.\n');
    %pause;
    data_gray=rgb2gray(data)
    %figure(2),imshow(data_gray),title('gray')
    %fprintf('Program paused. Press enter to continue.\n');
    %pause;
    %lambda=0.5\\for graythresh adjust
    temp=graythresh(data_gray)%+lambda
    data_black=im2bw(data_gray,temp)
    %figure(3),imshow(data_black),title('black')
    %fprintf('Program paused. Press enter to continue.\n');
    %pause;
    pic_size=size(data_black)
    B=zeros(200,200)
    C=zeros(200,200)
    [X Y p]=Looking_for_head(data_black,pic_size)
   try %if not good, still goes on
    A=data_black(X:X+199,Y-100:Y+99)
   catch
       A=zeros(200,200)
   end
    if p==1
        try
            B=data_black(1:200,Y-100:Y+99)
            if (floor(pic_size(1)/8)-75/2)>0
            C=data_black(floor(pic_size(1)/8)-37:floor(pic_size(1)/8)+162,floor(pic_size(2)/2)-100:floor(pic_size(2)/2)+99)
            end
        end
    end
    %data_result=data_black_simple(X-75:X+274,Y-175:Y+174)
    %figure(4),imshow(data_result),title('result') 

    end