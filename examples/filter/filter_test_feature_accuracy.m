%Created by Ye Liu @ 2015-01-27

row_num=64;
column_num=64;
total_pic_num=24000;
part_num=4;				
real_pic_num=total_pic_num/part_num;
whos

fid=fopen('./filter_full_iter_100000.features','r');
total_prob=fscanf(fid,'%f %f',[2,total_pic_num*2]);
whos

sum_prob=zeros(real_pic_num*2,1);
whos

for pic_num=1:real_pic_num*2
%for pic_num=1:2
    pic_num;
    tmp_prob=0.0;
    for pic_part=1:part_num
        (pic_num-1)*4+pic_part;
        tmp_prob=tmp_prob+total_prob(1,(pic_num-1)*4+pic_part);
    end
    tmp_prob=tmp_prob/4.0;
    sum_prob(pic_num)=tmp_prob;
end

total_accuracy=0
for pic_num=1:real_pic_num
    if sum_prob(pic_num)>0.5
        total_accuracy=total_accuracy+1;
    end
end
for pic_num=real_pic_num+1:real_pic_num*2
    if sum_prob(pic_num)<0.5
        total_accuracy=total_accuracy+1;
    end
end
total_accuracy=1.0*total_accuracy/(real_pic_num*2)


fclose(fid);
