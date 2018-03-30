%%% all drugs
aupr_v2_all=zeros(265,1);
for i=1:265
    drug=i;
    deci=deci_v2_DCGnet_table{drug};
    label=label_DCGnet2_tabel{drug};
    [~, ~, ~, ~,aupr_het] = prec_rec(deci,label, 'holdFigure', 1,'style','b','plotPR',1,'plotROC',0, 'plotBaseline',0 );
    aupr_v2_all(i,1)=aupr_het;
end
save aupr_v2_all aupr_v2_all;



