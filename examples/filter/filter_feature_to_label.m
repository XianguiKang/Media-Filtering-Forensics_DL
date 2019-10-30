%Created by Ye Liu @ 2015-01-31

row_num=64;
column_num=64;
%total_pic_num=4374;
total_pic_num=2440;
whos

fid=fopen('./filter_full_iter_97000.features','r');
%fid=fopen('./filter_full_iter_10000.features','r');
total_prob=fscanf(fid,'%f %f',[2,total_pic_num*2]);
whos

label=zeros(1,total_pic_num);
for pic_num=1:total_pic_num
%for pic_num=1:2
    label_0_prob=total_prob(1,pic_num);
    label_1_prob=total_prob(2,pic_num);
    if label_0_prob>label_1_prob
        label(pic_num)=0;
    else
        label(pic_num)=1;
    end
end
label(1:10)
save('picBlockLabel.mat','label');

fclose(fid);
