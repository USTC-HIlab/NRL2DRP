function NRL_DCGnet_CV_linux(drug_id,DCGnet_cv,K,dim)    

for h=1:K
    DCGnet_train=DCGnet_cv{h};
    % save an matrix as txt
    fname=['drug',num2str(drug_id),'_DCGnet_train.txt'];
    fid=fopen(fname,'w');%写入文件路径
    [m,n]=size(DCGnet_train);
    for i=1:1:m
        for j=1:1:n
            if j==n
                fprintf(fid,'%d\n',DCGnet_train(i,j));
            else
                fprintf(fid,'%d\t',DCGnet_train(i,j));
            end
        end
    end
    fclose(fid);

    % LINE and get the feature matrix from result of LINE
    densname=['drug',num2str(drug_id),'_DCGnet_train',num2str(h),'_dense.txt'];
    vec2name=['vec2_drug',num2str(drug_id),'_DCGnet_train',num2str(h),'.txt'];
    cmd1=['./reconstruct -train ',fname,' -output ',densname,' -depth 2 -k-max 1000'];
    cmd3=['./NRL -train ',densname,' -output ',vec2name,' -binary 0 -size ',num2str(dim),' -order 2 -negative 5 -samples 1000 -threads 40'];
    unix(cmd1);
    unix(cmd3); % this network representation learning method is from Tang et al.'s work https://dl.acm.org/citation.cfm?id=2741093

end