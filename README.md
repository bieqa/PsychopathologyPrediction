# PsychopathologyPrediction

This package contains the codes for training and predicting general psychopathology based on functional connectivity, structural connectivity, morphological features and clinila factors. Any questions about the code, please contact xiajing0904@gmail.com.

===============================================================================
Environments:

Python 3.7 + TensorFlow 1.13.1 +  MATLAB R2017b

===============================================================================
# Here, we provide input data 'example20.mat' in ./data from 20 subjects in the PNC dataset as an example to run the code. Please follow the steps to run the demo data 'example20.mat'. Note: all parameters set in the codes are for a larger PNC dataset, containing 1100 subjects, as the manuscript. 'batch_size' should be modified as smaller than 12 for this small demo data, e.g., 4. We suggest users run the demo data first to test the codes, and then train the model with their own data. 

# For your own data, please put it in ./data/ and organize it as ./data/example20.mat. Results will be stored in ./*/result.

===============================================================================
Step-1: Feature selection models:
# for functional connectivity
run ./FC-conv/PNC_gF_5fold_FCconv.py
       # model is located in ./FC-conv/lib/model_FCconv_concate_2att_lr_mulscale.py
       # results are stored in ./FC-conv/result/
       # output files include performance_test.csv, predict_test.csv, checkpoints
		performance_text.csv: evaluation of prediction results.
		predict_test.csv: predicted scores and actual scores.
		

# for structural connectivity
run ./DTI-conv/PNC_gF_5fold_SCconv.py
       # model is located in ./DTI-conv/lib/model_FCconv_concate_2att_lr_mulscale.py
       # output files include performance_test.csv, predict_test.csv, checkpoints

# for morphological features:
# thickness: run ./T1-conv/PNC_gf_5fold_thick.py
# area:      run ./T1-conv/PNC_gf_5fold_area.py
# volume:    run ./T1-conv/PNC_gf_5fold_volume.py
	     # model is located in ./T1-conv/lib/mmodel_T2_MLP_output.py
	     # output files include performance_test.csv, predict_test.csv, checkpoints

# for clinical factors:
run ./Phen/PNC_gf_5fold_Tphen.py
	# model is located in ./Phen/lib/model_phen.py
        # output files include performance_test.csv, predict_test.csv, checkpoints

===============================================================================
Step-2: Extract the selected features for all subjects:

run ./FC-conv/PNC_gF_5fold_FCconv_extract.py
run ./DTI-conv/PNC_gF_5fold_SCconv_extract.py
run ./T1-conv/PNC_gf_5fold_thick_extract.py
run ./T1-conv/PNC_gf_5fold_area_extract.py
run ./T1-conv/PNC_gf_5fold_volume_extract.py
    # output files include feature.txt, att1.txt, att2.txt for all subjects.
		feature.txt: selected features for output.
		att1.txt: network-based attention weights.
		att2.txt: region-based attention weights.

# extract selected multi-model features in one file:
run ./feature_extract_new.m
	#input:  feature.txt in results fold
	#output: ./data/example_selected_feature.mat

===============================================================================
Step-3: Output layer:

#for morphological feature: 
run ./Output/ABCD_gF_5fold_fusion_mor.py

#for functional or structural connectivity features:
run ./Output/ABCD_gF_5fold_fusion_FC.py
run ./Output/ABCD_gF_5fold_fusion_SC.py

#for multiple image feature:
run ./Output/ABCD_gF_5fold_fusion_image.py

#for single image feature and clinical factors:
run ./Output/ABCD_gF_5fold_fusion_FC_phen.py
run ./Output/ABCD_gF_5fold_fusion_SC_phen.py
run ./Output/ABCD_gF_5fold_fusion_mor_phen.py

#for all features:
run ./Output/ABCD_gF_5fold_fusion_multiimage_phen.py
