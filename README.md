# NRL2DRP
A novel approach for drug response predictionin cancer cell lines via network representation learning
NRL2DRP---matlab

A novel approach for drug response predictionin cancer cell lines via network representation learning

======================= Instructions to NRL2DRP 

Developer: Jianghong Yang(yjhzqw12@mail.ustc.edu.cn) from Health Informatics Lab, School of Information Science and Technology, University of Science and Technology of China
Requirement

4GB memory

MATLAB R2014a/b or later
Related data information need to first load in NRL2DRP method

    /data/cline_drg_s_n.mat
    /data/cline_gene_n.mat
    /data/PPI_n.mat
    /data/drug_cline_pair_all.mat
    /data/K_fold_indx_all.mat

The first file cline_drug_association_network.mat is a matrix of known drug sensitivity relationships between cell lines and drugs. The second file drug_target_interaction_network.mat is a matrix of known drug molecular activities between drugs and targets. The third file cline_similarity_network.mat is a matrix of cell line-cell line similarity network. The fourth file drug_similarity_network.mat is a matrix of drug-drug similarity network. The fifth file PPI_network_add_corr.mat is a matrix of target-target similarity network which is obtained by merging cell line gene expression and PPIs. The sixth file cline_drug_association_with_unknown.mat is a matrix which include known and unknown relationships between cell lines and drugs.
Run HNMDRP to predict associations between cell line and drug

We provide two association network matrix with cline_drug_association_network and cline_drug_association_network_with_unknown.

Firstly, to demonstrate HNMDRP can achieve a good performance with best ROC and PR curve, we performing LOOCV to evaluate our method on predicting known cell line-drug associations by running the following code. (This process may need to take a few hours.)

run Pre_HNMDRP.m

Secondly, to draw the ROC curve based on the prediction results of HNMDRP by running following code in matlab command window. (This process may need to take a few seconds.)

run plot_ROC(pre_HNMDRP_Results, transCD_with_unknown, 75)

Specific Instructions: In this function, you can specify the drug_number to be a number, then execute this line of code and the ROC curve is displayed in the computer screen for this drug. Here, 75 is the drug number which is determined by the Supplementary Table S2 that have 189 drugs and its corresponding index number. When you have got pre_HNMDRP_Results results, you need only run the second line code to obtain the results of each drug.
Configurations of HNMDRP
Related configuration files

=========================================================================================================
| FILE NAME		| DESCRIPTION									|
=========================================================================================================
|cline_drug_association	|The known cell line-drug associations are represented by adjacency		|
|network.mat		|matrix CD, which shows binary associations between cell line and drug.		|
|			|1 represents cell line i are sensitive with drug j, otherwise 0.		|
---------------------------------------------------------------------------------------------------------
|drug_target_interaction|The known drug-target interactions are represented by adjacency matrix		|
|_network.mat		|DT, which shows binary associations between drug and target.			|
|			|And 1 represents drug j has its corresponding target gene k,otherwise 0.	|
---------------------------------------------------------------------------------------------------------
|cline_similarity	|The similarity network between cell line based on gene expression		|
|network.mat		|profile.									|
---------------------------------------------------------------------------------------------------------
|drug_similarity_	|The similarity between drug based on drug chemical structures.			|
|_network.mat		|										|
---------------------------------------------------------------------------------------------------------
|target_similarity	|The similarity between target genes based on PPI and correlational		|
|_network.mat		|relationships.									|
---------------------------------------------------------------------------------------------------------

Mainly output variables of HNMDRP

The descriptions of output variables of HNMDRP are provided below:

=================================================================================================
| VARIABLE NAME		| DESCRIPTION								|
=================================================================================================
| pre_HNMDRP_Results	|The predicted results of cell line-drug associations through leave-one	|
|			|-out cross validation, which is used to draw ROC curve for each drug.	|
-------------------------------------------------------------------------------------------------

HNMDRP for users without MATLAB licenses

For users without MATLAB licenses, we also offer R codes of HNMDRP.The detailed method can be seen in R package.
Contact

Please feel free to contact us if you need any help: fzxx@mail.ustc.edu.cn
