addressIn='DATA_INPUT/'
addressOut='DATA_OUTPUT/'
picAdr=dir(addressIn)
judge=zeros(200,200)
for i=27:size(picAdr,1)
    if isequal(picAdr(i).name,'.') || isequal(picAdr(i).name,'..') 
        continue
    end
    
    data=imread(strcat(addressIn, picAdr(i).name))
        
    if size(data,1)>1000
        data=imresize(data,800/size(data,1))
    end
    
    data=imresize(data,0.5)%lower the size, get down unit number   

    siz_jud=size(data,2)/size(data,1)
    %judge the size
    
    if siz_jud<0.75 && siz_jud>0.71
    data=imresize(data,0.90)
    end
    
    if siz_jud<0.71
    data=imresize(data,0.50)
    end
    
    while size(data,2)<250
        data=imresize(data,1.1)
    end
%change size

    [A B C]=mainProgress(data) 
    if isequal(B,judge)==0 || isequal(C,judge)==0
         imwrite(A,strcat(strcat(addressOut,num2str(i),'(1).jpg')))
         if isequal(B,judge)==0
         imwrite(B,strcat(strcat(addressOut,num2str(i),'(2).jpg')))
         x=1
         end
         if isequal(C,judge)==0
         imwrite(C,strcat(strcat(addressOut,num2str(i),'(3).jpg')))
         end
    else
         imwrite(A,strcat(strcat(addressOut,num2str(i),'.jpg')))
    end
end

    
