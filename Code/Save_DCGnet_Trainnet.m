load('DCGnet_cv_all');

%%% for saving computing time and storage space, the training nets are
%%% stored in 7 data files.
DCGnet_cv_all1=DCGnet_cv_all(1:40);
save DCGnet_cv_all1 DCGnet_cv_all1;

DCGnet_cv_all2=cell(265,1);
for i=41:80
    DCGnet_cv_all2{i}=DCGnet_cv_all{i};
end
save DCGnet_cv_all2 DCGnet_cv_all2;

DCGnet_cv_all3=cell(265,1);
for i=81:120
    DCGnet_cv_all3{i}=DCGnet_cv_all{i};
end
save DCGnet_cv_all3 DCGnet_cv_all3;

DCGnet_cv_all4=cell(265,1);
for i=121:160
    DCGnet_cv_all4{i}=DCGnet_cv_all{i};
end
save DCGnet_cv_all4 DCGnet_cv_all4;  

DCGnet_cv_all5=cell(265,1);
for i=161:200
    DCGnet_cv_all5{i}=DCGnet_cv_all{i};
end
save DCGnet_cv_all5 DCGnet_cv_all5; 

DCGnet_cv_all6=cell(265,1);
for i=201:240
    DCGnet_cv_all6{i}=DCGnet_cv_all{i};
end
save DCGnet_cv_all6 DCGnet_cv_all6; 

DCGnet_cv_all7=cell(265,1);
for i=241:265
    DCGnet_cv_all7{i}=DCGnet_cv_all{i};
end
save DCGnet_cv_all7 DCGnet_cv_all7; 