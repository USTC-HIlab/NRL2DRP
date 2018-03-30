load('drug_cline_pair_all.mat');
load('label_all.mat');  % these labels are equal to the third columns in drug_cline_pair_all
load('K_fold_indx_all.mat');
load('DCGnet_cv_all');
load('DCGnet_vec2name_all'); % the names of representation documents,each drug will have 5 representation documents

dim=80;
K=5;
vec2_DCGnet_cv_all1=cell(265,1);
label_DCGnet_cv_all1=cell(265,1);
vec2_DCGnet_cv_ind_all1=cell(265,1);

%%% compute low dimensional representaion fro each complete training
%%% network, the representation vectors are stored in text documents.
for drug_id=1:265
    NRL_DCGnet_CV_linux(drug_id,DCGnet_cv_all1{drug_id},K,dim);   
end


%%% extract representation vectors of each tested cell lines
% for drug i, the element in K_fold_indx_all{i} denotes the cell line's index in drug_cline_pair_all{i}
for drug_id=1:265
    [vec2_DCGnet_cv_all1{drug_id},vec2_DCGnet_cv_ind_all1{drug_id},label_DCGnet_cv_all1{drug_id}]=vec2_extrac(drug_cline_pair_all{drug_id},K,K_fold_indx_all{drug_id},DCGnet_vec2name_all{drug_id});
end

save vec2_DCGnet_cv_all vec2_DCGnet_cv_all;
save vec2_DCGnet_cv_ind_all vec2_DCGnet_cv_ind_all;
save label_DCGnet_cv_all label_DCGnet_cv_all;
