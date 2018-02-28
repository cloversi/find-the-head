function [X Y]=Looking_for_head_simple(data_black,pic_size)
X=floor(pic_size(1)/8)
Y=floor(pic_size(2)/2)
if ((find(data_black(X+150,:),1)>=floor(pic_size(2)*3/8)))
    Y=Y-50
end
if (find(data_black(X+150,:),1,'last')<=floor(pic_size(2)*5/8))
    Y=Y+50
end
end