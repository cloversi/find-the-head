function [X Y p]=Looking_for_head(data_black,pic_size)
X=find(data_black(:,ceil(pic_size(2)/2)),1)
p=0
if X>floor(pic_size(1)/16)
    p=1
end
Y=find(data_black(X+5,:),1)+find(data_black(X+5,:),1,'last')
Y=Y/2