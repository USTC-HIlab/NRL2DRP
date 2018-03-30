load('deci_v2_DCGnet_table');
load('label_DCGnet2_tabel');


auc2_DCGnet_table=cell(265,1);
sn2_DCGnet_table=cell(265,1);
sp2_DCGnet_table=cell(265,1);



for drug_id=1:265
    [auc2_DCGnet_table{drug_id},sn2_DCGnet_table{drug_id},sp2_DCGnet_table{drug_id}] = roc_curve(deci_v2_DCGnet_table{drug_id},label_DCGnet2_tabel{drug_id},'b');
end

auc2_DCGnet_table=cell2mat(auc2_DCGnet_table);

save auc2_DCGnet_table auc2_DCGnet_table;
save sn2_DCGnet_table sn2_DCGnet_table;
save sp2_DCGnet_table sp2_DCGnet_table;


