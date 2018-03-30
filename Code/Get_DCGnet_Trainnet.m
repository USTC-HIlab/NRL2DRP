load('K_fold_indx_all');         
load('cline_drg_s_n');
load('cline_gene_n');
load('PPI_dir_n');   % network of directed graph form with edge weight, all weight are set as 1
load('drug_cline_pair_all');

sensi_num=length(cline_drg_s_n);   %total number of sensitive relationships between drugs and cell lines
K=5;        % 5 fold CV
DCGnet_cv_all=cell(265,1);
cline_drg_train_DCGnet_cv_all=cell(265,1);

%%% bulit training network of cell line-drug network for each drug
for drug_id=1:265
    K_fold_indx=K_fold_indx_all{drug_id};    % CV data for drug 
    drug_cline_pair=drug_cline_pair_all{drug_id};   % association between screened cell lines and drug, 1 denotes sensitive, 0 denotes resistant
    drug_ind=1001+drug_id;          % drug's id in nodeset of  complete large response related network
    cline_drg_train_DCGnet_cv_all{drug_id}=cell(K,1);  % all training cell line-drug networks

    for h=1:K
        drug_cline_test=drug_cline_pair(K_fold_indx{h,1},:);  % get tested cell line-drug relationship
        %% build the training cell line-drug interaction network
        cline_drg_train=[];     % training network for fold k
        for i=1:sensi_num
            cline=cline_drg_s_n(i,1);
            drug=cline_drg_s_n(i,2);
            if drug==drug_ind && ismember(cline,drug_cline_test(:,1))==1 % 判断drug-cell line是否在test集中，如果在就不存入训练网络中,if the drug-cell line interaciotn is in the test data, it will not be contained into the training net
                continue;
            else
                cline_drg_train=[cline_drg_train;cline_drg_s_n(i,:)];  % if the drug-cell line interaciotn is not in the test data, it will  be contained into the training net
            end
        end
        cline_drg_train_DCGnet_cv_all{drug_id}{h,1}=cline_drg_train;  % store the training net in a cell
    end
end
save cline_drg_train_DCGnet_cv_all cline_drg_train_DCGnet_cv_all;

%%% built the complete training network for each drug
for drug_id=1:265
    DCGnet_cv_all{drug_id}=cell(K,1);
    for h=1:K
        tmp=[cline_drg_train_DCGnet_cv_all{drug_id}{h};cline_gene_n]; % incorporate the training cell line-drug network with cell line-gene network
        %% according to the requirement of representation learing algorithm, the network should be in the form of directed network
        %% directed the (cell line-drug + cell line-gene) networknetwork
        DCGnet_train=[];
        len=size(tmp,1);
        for i=1:len           
            DCGnet_train=[DCGnet_train;tmp(i,1:2)];
            pair_inverse=[tmp(i,2),tmp(i,1)];
            DCGnet_train=[DCGnet_train;pair_inverse]; % directed graph form
        end
        len2=size(DCGnet_train,1);
        tmp2=ones(len2,1);
        DCGnet_train=[DCGnet_train,tmp2];  % get network with interaction weight, all the weights are set as 1
        DCGnet_train=[DCGnet_train;PPI_dir_n]; % incorporate PPI network
        DCGnet_cv_all{drug_id}{h}=DCGnet_train; % store complete training networke of drug in a cell
    end
end
save DCGnet_cv_all DCGnet_cv_all;

