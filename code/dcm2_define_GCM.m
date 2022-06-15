dataDir = '/Volumes/Scratch/Nik_data/postprocessing/dcm/';
subjs = {
%     'P14325','P15698','P17528','P22793','P29083','P321456','P35701',...
%     'P36941','P45792','P47268','P49012','P51357','P53791','P55533',...
%     'P57893','P57933','P61137','P67641','P69581','P71985','P86420',...
%     'P89922','P92648','P92855','P94998','P95532',...
    'EPY141001','EPY141003','EPY141004','EPY141006','EPY141007',...
    'EPY141008','EPY141009','EPY141010','EPY141011','EPY141012',...
    'EPY141013','EPY141014','EPY141015','EPY141020','EPY141021',...
    'EPY141022','EPY141025','EPY141026','EPY141027','EPY141028',...
    'EPY141029','EPY141030','EPY141031','EPY141032','EPY141033',...
    };

GCM = {};
dcmfiles = {
    
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
    
    };
voi_labels = {
    'R_LOC'
    'R_DLPFC'
    'R_AI'
    'R_PI'
    };
SPMinputs = {1 1 1};

for i=1:numel(subjs)
    subjDir = [dataDir, subjs{i}];
    for ii = 1:numel(dcmfiles)
        dcm_file = [subjDir, '/DCM_' dcmfiles{ii} '.mat'];
        GCM{i,ii} = dcm_file;
        
    end    
end
save('/Volumes/Scratch/Nik_data/postprocessing/EPY_BMS/GCM_BMS.mat','GCM');