
Get_DCGnet_Trainnet;   % build training network for each drug

demo_DCGnet_CV_linux;  % get representation vectors of cell lines for each drug

demo_SVM_CV;           % build a SVM classifer for each drug, using representation vectors of cell lines as features

demo_roc;              % get AUC of each drug

demo_PR;               % get AUPR of each drug