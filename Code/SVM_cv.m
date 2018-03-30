function [deci_vec,label] = SVM_cv(label_cv,vec_cv,K)
label=[];
deci_vec=[];
for i=1:K
    % label for test sets      
    label_train=label_cv{i,2};       
    label_test=label_cv{i,1};
    label=[label;label_test];          

    % SVM using feature of 1rd proximity from fullnet
    vec_train=vec_cv{i,2};       
    vec_test=vec_cv{i,1}; 
    len_vec_net=size(vec_train,2);
    vec_train=vec_train(:,2:len_vec_net);
    vec_test=vec_test(:,2:len_vec_net);
    %%% this SVM is from Chang abd Lin's work https://www.csie.ntu.edu.tw/~cjlin/libsvm/
    cmd=[' -w1 ',num2str(sum(label_train==0)/sum(label_train==1)),' -w0 ',num2str(1)];
    model=svmtrain(label_train,vec_train,cmd);  
    [predict_label,mse,subdeci] = svmpredict(label_test,vec_test,model);
    if model.Label(1)==1
        mod2=1;
    else 
        mod2=-1;
    end
    deci1_test = subdeci*mod2;
    deci_vec=[deci_vec;deci1_test];
end