
run=1;
load './data/example20.mat'
filename='PNC_gF_5fold_FCconv';
filename2='PNC_gF_5fold_un_thick';
filename3='PNC_gF_5fold_SCconv';
filename4='PNC_gF_5fold_un_volume';
filename5='PNC_gF_5fold_un_area';

for f=1:5
features=load(['./FC-conv/result/' filename '/' num2str(f-1) '/feature.txt']);
features2=load(['./T1-conv/result/' filename2 '/' num2str(f-1) '/feature.txt']);
features3=load(['./DTI-conv/result/' filename3 '/' num2str(f-1) '/feature.txt']);
features4=load(['./T1-conv/result/' filename4 '/' num2str(f-1) '/feature.txt']);
features5=load(['./T1-conv/result/' filename5 '/' num2str(f-1) '/feature.txt']);
[m,n]=size(features);
[~,n2]=size(features2);
[~,n3]=size(features4);
[~,n4]=size(features5);

load(['./data/TrainValidTest_demo_Idx_r' num2str(run) '.mat']);
Test_ind=[TrainSet{f,1};ValidSet{f,1};TestSet{f,1}];
features=features';
features2=features2';
features3=features3';
features4=features4';
features5=features5';

eval(['FC_selection',num2str(f),'=zeros(n,1100);'])
eval(['SC_selection',num2str(f),'=zeros(n,1100);'])
eval(['thick_selection',num2str(f),'=zeros(n2,1100);'])
eval(['volume_selection',num2str(f),'=zeros(n3,1100);'])
eval(['area_selection',num2str(f),'=zeros(n4,1100);'])

eval(['FC_selection',num2str(f),'(:,Test_ind)=features;'])
eval(['SC_selection',num2str(f),'(:,Test_ind)=features3;'])
eval(['thick_selection',num2str(f),'(:,Test_ind)=features2;'])
eval(['volume_selection',num2str(f),'(:,Test_ind)=features4;'])
eval(['area_selection',num2str(f),'(:,Test_ind)=features5;'])

end

save('./data/example_selected_feature.mat','SubID','Gender',...
    'Age','Pedu','Med_rat','Race','FamilyID','Phen_noglo',...
    'Tra','Overall','Positive','Negative','Anxious','Externalizing','Fear',...
   'FC_selection1', 'SC_selection1','thick_selection1','area_selection1','volume_selection1','FC_selection2',...
 'SC_selection2','thick_selection2','volume_selection2','area_selection2','FC_selection3','volume_selection3',...
  'SC_selection3','thick_selection3','area_selection3','FC_selection4', 'volume_selection4','SC_selection4',...
'thick_selection4','area_selection4','FC_selection5', 'volume_selection5','SC_selection5',...
 'thick_selection5','area_selection5','-v7.3')



