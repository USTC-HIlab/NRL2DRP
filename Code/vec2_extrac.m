function [vec2_net_cv,vec2_net_cv_ind,label_net_cv]=vec2_extrac(drug_cline_pair,K,K_fold_indx,vec2_name)
vec2_net_cv=cell(K,2);
label_net_cv=cell(K,2);
vec2_net_cv_ind=cell(K,2);

for h=1:K
    drug_cline_test=drug_cline_pair(K_fold_indx{h,1},:);  % test data
    drug_cline_train=drug_cline_pair(K_fold_indx{h,2},:); % train data
    
    tmp2=importdata(vec2_name{h},' ',1);
    vec2_norm=tmp2.data;

    % get feature vector1 of drug's test and train cline dataset
    vec2norm=vec2_norm; % vec1norm is alternable
    [test1,in,~]=intersect(vec2norm(:,1),drug_cline_test(:,1)); 
    [train1,im,~]=intersect(vec2norm(:,1),drug_cline_train(:,1)); 
    vec2_fullnet_test=vec2norm(in,:);  % the feature vectores of train cell lines, the order of cell line in vec2_fullnet_test is same with test1
    vec2_fullnet_train=vec2norm(im,:); % the feature vectores of test cell lines, the order is same with  train1
    vec2_fullnet_test_ind=vec2_fullnet_test(:,1);  % the index of train cell lines
    vec2_fullnet_train_ind=vec2_fullnet_train(:,1); % the index of test cell lines
    vec2_net_cv{h,1}=vec2_fullnet_test;
    vec2_net_cv{h,2}=vec2_fullnet_train;
    vec2_net_cv_ind{h,1}=vec2_fullnet_test_ind;
    vec2_net_cv_ind{h,2}=vec2_fullnet_train_ind;

    % get label of cell line's representation vector (because intersect function will change the order of cell line in label.mat) 
    label_net_test=[];
    vec_test_len=size(vec2_fullnet_test,1);
    for i=1:vec_test_len
        cline=test1(i); % the order of cell line in test1 is same with that of vec2_fullnet_test
        ind= drug_cline_test(:,1)==cline;
        label_net_test =[label_net_test;drug_cline_test(ind,3)];
    end
    label_net_train=[];
    vec_train_len=size(vec2_fullnet_train,1);
    for i=1:vec_train_len
        cline=train1(i); % the order of cell line in train1 is same with that of vec2_fullnet_train
        ind= drug_cline_train(:,1)==cline;
        label_net_train=[label_net_train;drug_cline_train(ind,3)];
    end   
    label_net_cv{h,1}=label_net_test;
    label_net_cv{h,2}=label_net_train;
end    