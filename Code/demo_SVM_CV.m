load('vec2_DCGnet_cv_all');

deci_v2_DCGnet_table=cell(265,1);
label_DCGnet2_tabel=cell(265,1);

K=5;

for drug_id=1:265
    [deci_v2_DCGnet_table{drug_id},label_DCGnet2_tabel{drug_id}] = SVM_cv(label_DCGnet_cv_all1{drug_id},vec2_DCGnet_cv_all1{drug_id},K);  
end



save deci_v2_DCGnet_table deci_v2_DCGnet_table;
save label_DCGnet2_tabel label_DCGnet2_tabel;
