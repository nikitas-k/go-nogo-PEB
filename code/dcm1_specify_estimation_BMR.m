 %% DCM automate estimation

dataDir = '/Volumes/Scratch/Nik_data/postprocessing/dcm/';
subjDir = '/Volumes/Scratch/Nik_data/postprocessing/dcm/';
dcmbatchDir = '/Volumes/Scratch/Nik_data/postprocessing/dcm_batch/';
modestbatchDir = '/Volumes/Scratch/Nik_data/postprocessing/batchdcmest/';
subjs = {'EPY141001','EPY141003','EPY141004','EPY141006','EPY141007',...
    'EPY141008','EPY141009','EPY141010','EPY141011','EPY141012',...
    'EPY141013','EPY141014','EPY141015','EPY141020','EPY141021',...
    'EPY141022','EPY141025','EPY141026','EPY141027','EPY141028',...
    'EPY141029','EPY141030','EPY141031','EPY141032','EPY141033',...
    'P14325','P15698','P17528','P22793','P29083','P321456','P35701',...
    'P36941','P45792','P47268','P49012','P51357','P53791','P55533',...
    'P57893','P57933','P61137','P67641','P69581','P71985','P86420',...
    'P89922','P92648','P92855','P94998','P95532'};

voi_labels = {
    'R_LOC'
    'R_DLPFC'
    'R_AI'
    'R_PI'
    };
model_names = {
    
     %bilinear
     'BMRmodel001'
     'BMRmodel002'
     'BMRmodel003'
     'BMRmodel004'
     'BMRmodel005'
     'BMRmodel006'
     'BMRmodel007'
     'BMRmodel008'
     %nonlinear on LOC to AI
     'BMRmodel009'
     'BMRmodel010'
     'BMRmodel011'
     'BMRmodel012'
     'BMRmodel013'
     'BMRmodel014'
     'BMRmodel015'
     'BMRmodel016'
     %nonlinear on AI to PI
     'BMRmodel017'
     'BMRmodel018'
     'BMRmodel019'
     'BMRmodel020'
     'BMRmodel021'
     'BMRmodel022'
     'BMRmodel023'
     'BMRmodel024'
     %nonlinear on both
     'BMRmodel025'
     'BMRmodel026'
     'BMRmodel027'
     'BMRmodel028'
     'BMRmodel029'
     'BMRmodel030'
     'BMRmodel031'
     'BMRmodel032'
%     
    };

SPMinputs = {1 1 1};

cd(dcmbatchDir);
load('DCM_template_basic.mat');
%DCM.a = [1 1 0 0; 1 1 0 0; 0 0 1 1; 0 0 1 1]; %LOC to AG, LOC to AI, AI to PI and in reverse
%DCM.c = zeros(4,3);
%save(fullfile([dcmbatchDir 'DCM_temp_A.mat']),'DCM');
%disp('...DCM A template saved in dcm batch directory.')

for mm=1:length(model_names)
    %load('DCM_temp_A.mat');
    
%     if mm==1
%         DCM.a(1,1) = 1;
%         DCM.a(1,2) = 1;
%         DCM.a(1,3) = 1;
%         DCM.a(2,1) = 1;
%         DCM.a(2,2) = 1;
%         DCM.a(2,3) = 1;
%         DCM.a(3,1) = 1;
%         DCM.a(3,2) = 1;
%         DCM.a(3,3) = 1;
%         DCM.a(3,4) = 1;
%         DCM.a(4,3) = 1;
%         DCM.a(4,4) = 1;
%         DCM.b(2,1,2) = 1;
%         DCM.b(3,1,2) = 1;
%         DCM.c(1,1) = 1;
%         DCM.c(4,3) = 1;
%         DCM.d(3,1,2) = 1;
%         DCM.d(4,3,2) = 1;
    %bilinear
    if mm==1
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 0;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 0;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 0;
        DCM.c(1,1) = 1;
    elseif mm==2
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 0;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 0;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 0;
        DCM.c(1,1) = 1;
        DCM.c(4,3) = 1;
    elseif mm==3
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 0;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 0;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 1;
        DCM.c(1,1) = 1;
    elseif mm==4
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 0;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 0;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 1;
        DCM.c(1,1) = 1;
        DCM.c(4,3) = 1;
    elseif mm==5
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 1;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 1;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 0;
        DCM.c(1,1) = 1;
    elseif mm==6
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 1;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 1;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 0;
        DCM.c(1,1) = 1;
        DCM.c(4,3) = 1;
    elseif mm==7
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 1;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 1;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 1;
        DCM.c(1,1) = 1;
    elseif mm==8
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 1;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 1;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 1;
        DCM.c(1,1) = 1;
        DCM.c(4,3) = 1;
        
        
    %nonlinear LOC to AI
    elseif mm==9
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 0;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 0;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 0;
        DCM.c(1,1) = 1;
        DCM.d(3,1,2) = 1;
    elseif mm==10
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 0;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 0;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 0;
        DCM.c(1,1) = 1;
        DCM.c(4,3) = 1;
        DCM.d(3,1,2) = 1;
    elseif mm==11
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 0;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 0;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 1;
        DCM.c(1,1) = 1;
        DCM.d(3,1,2) = 1;
    elseif mm==12
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 0;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 0;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 1;
        DCM.c(1,1) = 1;
        DCM.c(4,3) = 1;
        DCM.d(3,1,2) = 1;
    elseif mm==13
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 1;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 1;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 0;
        DCM.c(1,1) = 1;
        DCM.d(3,1,2) = 1;
    elseif mm==14
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 1;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 1;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 0;
        DCM.c(1,1) = 1;
        DCM.c(4,3) = 1;
        DCM.d(3,1,2) = 1;
    elseif mm==15
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 1;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 1;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 1;
        DCM.c(1,1) = 1;
        DCM.d(3,1,2) = 1;
    elseif mm==16
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 1;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 1;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 1;
        DCM.c(1,1) = 1;
        DCM.c(4,3) = 1;
        DCM.d(3,1,2) = 1;
        
    %nonlinear AI to PI
    elseif mm==17
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 0;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 0;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 0;
        DCM.c(1,1) = 1;
        DCM.d(4,3,2) = 1;
    elseif mm==18
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 0;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 0;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 0;
        DCM.c(1,1) = 1;
        DCM.c(4,3) = 1;
        DCM.d(4,3,2) = 1;
    elseif mm==19
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 0;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 0;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 1;
        DCM.c(1,1) = 1;
        DCM.d(4,3,2) = 1;
    elseif mm==20
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 0;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 0;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 1;
        DCM.c(1,1) = 1;
        DCM.c(4,3) = 1;
        DCM.d(4,3,2) = 1;
    elseif mm==21
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 1;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 1;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 0;
        DCM.c(1,1) = 1;
        DCM.d(4,3,2) = 1;
    elseif mm==22
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 0;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 0;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 0;
        DCM.c(1,1) = 1;
        DCM.c(4,3) = 1;
        DCM.d(4,3,2) = 1;
    elseif mm==23
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 1;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 1;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 1;
        DCM.c(1,1) = 1;
        DCM.d(4,3,2) = 1;
    elseif mm==24
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 1;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 1;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 1;
        DCM.c(1,1) = 1;
        DCM.c(4,3) = 1;
        DCM.d(4,3,2) = 1;
        
    %nonlinear both
    elseif mm==25
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 0;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 0;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 0;
        DCM.c(1,1) = 1;
        DCM.d(3,1,2) = 1;
        DCM.d(4,3,2) = 1;
    elseif mm==26
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 0;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 0;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 0;
        DCM.c(1,1) = 1;
        DCM.c(4,3) = 1;
        DCM.d(3,1,2) = 1;
        DCM.d(4,3,2) = 1;
    elseif mm==27
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 0;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 0;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 1;
        DCM.c(1,1) = 1;
        DCM.d(3,1,2) = 1;
        DCM.d(4,3,2) = 1;
    elseif mm==28
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 0;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 0;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 1;
        DCM.c(1,1) = 1;
        DCM.c(4,3) = 1;
        DCM.d(3,1,2) = 1;
        DCM.d(4,3,2) = 1;
    elseif mm==29
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 1;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 1;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 0;
        DCM.c(1,1) = 1;
        DCM.d(3,1,2) = 1;
        DCM.d(4,3,2) = 1;
    elseif mm==30
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 1;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 1;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 0;
        DCM.c(1,1) = 1;
        DCM.c(4,3) = 1;
        DCM.d(3,1,2) = 1;
        DCM.d(4,3,2) = 1;
    elseif mm==31
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 1;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 1;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 1;
        DCM.c(1,1) = 1;
        DCM.d(3,1,2) = 1;
        DCM.d(4,3,2) = 1;
    elseif mm==32
        DCM.a(1,1) = 1;
        DCM.a(1,2) = 1;
        DCM.a(1,3) = 1;
        DCM.a(2,1) = 1;
        DCM.a(2,2) = 1;
        DCM.a(2,3) = 1;
        DCM.a(3,1) = 1;
        DCM.a(3,2) = 1;
        DCM.a(3,3) = 1;
        DCM.a(3,4) = 1;
        DCM.a(4,3) = 1;
        DCM.a(4,4) = 1;
        DCM.b(2,1,2) = 1;
        DCM.b(3,1,2) = 1;
        DCM.c(1,1) = 1;
        DCM.c(4,3) = 1;
        DCM.d(3,1,2) = 1;
        DCM.d(4,3,2) = 1;
    end
    save(fullfile([dcmbatchDir, '/DCM_temp_' model_names{mm} '.mat']), 'DCM');
end

disp('starting SPM job manager with fMRI defaults....')
spm('Defaults','fMRI');
spm_jobman('initcfg');

for s=1:numel(subjs)
    subjDir = [dataDir, subjs{s}];
    disp('Getting details from subject dir:...')
    disp(subjDir)
    disp('...........')
    
    spm_file = ([subjDir, '/SPM.mat']);
    
    for mm = 1:numel(model_names)
        clear DCMtemp;
        filenameTempDCM = ([dcmbatchDir, '/DCM_temp_' model_names{mm} '.mat']);
        load(filenameTempDCM);
        cd(subjDir)
        
        dcm_m_name = (['DCM_' model_names{mm}, '.mat']);
        save(dcm_m_name, 'DCM');
        disp('****************************************************')
        disp('****************************************************')
        disp('getting subject VOI info for spm_dcm_voi...');
        disp('****************************************************')
        disp(subjDir)
        VOIs = strcat(subjDir, '/VOI_', voi_labels, '_1.mat');
        DCM = spm_dcm_voi(dcm_m_name, VOIs);
        save(dcm_m_name, 'DCM')
        
        disp('****************************************************')
        disp('****************************************************')
        disp('getting subject SPM inputs info for spm_dcm_U...');
        disp('****************************************************')
                
        disp('updating template with subject info from spm.mat with spm_dcm_U...')
        disp(spm_file)
        load(spm_file)
        DCM = spm_dcm_U(dcm_m_name, spm_file, 1, SPMinputs);
        save(dcm_m_name, 'DCM')
    end
end

cd(modestbatchDir);
jobs={};

for i=1:numel(subjs)
    for mm=1:numel(model_names)
    matlabbatch{1}.spm.dcm.fmri.estimate.dcmmat = {[dataDir subjs{i} '/DCM_' model_names{mm} '.mat']};
             
    save([modestbatchDir '/batch_' subjs{i} '_DCM_' model_names{mm} '.mat'], 'matlabbatch'); % directory for saving batches and estimated dcms

    end
end
clear matlabbatch;

allbatches = dir('batch*.mat'); % saves list of all the batch files in the dir_save/Data directory %%% code copied and adpatped from JMcF's 

for i = 1:length(allbatches)
    
    jobs{i} = load([modestbatchDir '/' allbatches(i).name]);
    
end

%Run estimation in parallel

disp('... starting model estimation batches'); 
tic
parfor i = 1:length(jobs) %
    
    disp(['... running job ' num2str(i) ' of ' num2str(length(jobs))]);
    spm('Defaults','fMRI');
    spm_jobman('initcfg');
    spm_jobman('run',jobs{i}.matlabbatch);
    
end

disp(['... runtime for model estimation for ' , num2str(s), ' subjects with ' num2str(mm), ' models each']);
toc % displays time between tic and toc. 
runtime = floor(toc/60);
disp(['... in mins']) 
disp(runtime)