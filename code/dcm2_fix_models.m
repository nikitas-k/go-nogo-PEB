dataDir = '/Users/c3336955/Documents/DCM_connectivity/dcm/';
subjs = {
    'P14325','P15698','P17528','P22793','P29083','P321456','P35701',...
    'P36941','P45792','P47268','P49012','P51357','P53791','P55533',...
    'P57893','P57933','P61137','P67641','P69581','P71985','P86420',...
    'P89922','P92648','P92855','P94998','P95532',...
    'EPY141001','EPY141003','EPY141004','EPY141006','EPY141007',...
    'EPY141008','EPY141009','EPY141010','EPY141011','EPY141012',...
    'EPY141013','EPY141014','EPY141015','EPY141020','EPY141021',...
    'EPY141022','EPY141025','EPY141026','EPY141027','EPY141028',...
    'EPY141029','EPY141030','EPY141031','EPY141032','EPY141033',...
    };

GCM = {};
dcmfiles = {
%     'NonLinDLPFCfullmodel'
%     'FacesonLOCself' %bilinear
%     'InhonDLPFCandAIonly' %bilinear
%     'Inhonconns' %bilinear
%     'Inhonall' %bilinear
%     'NonLinDLPFConLOCtoAIandInh-nodesnoDLPFCtoAI' %nonlinear
%     'NonLinDLPFConLOCtoAIandInh-binoDLPFCtoAI' %nonlinear
%     'NonLinDLPFConLOCtoAIandall-binoDLPFCtoAI' %nonlinear
%     'NonLinDLPFConLOCtoAIandInh-nodes'
%     'NonLinDLPFConLOCtoAIandInh-bi'
%     'NonLinDLPFConLOCtoAIandall-bi'
%     'NonLinDLPFConAItoPIandInh-nodesnoDLPFCtoAI'
%     'NonLinDLPFConAItoPIandInh-binoDLPFCtoAI'
%     'NonLinDLPFConAItoPIandall-binoDLPFCtoAI'
%     'NonLinDLPFConAItoPIandInh-nodesnoLOCtoAI'
%     'NonLinDLPFConAItoPIandInh-binoLOCtoAI'
%     'NonLinDLPFConAItoPIandall-binoLOCtoAI'
%     'NonLinDLPFConAItoPIandInh-nodes'
%     'NonLinDLPFConAItoPIandInh-bi'
%     'NonLinDLPFConAItoPIandall-bi'
%     % no feedback
%     'NoModulationsnofb'
%     'FacesonLOCselfnofb' %bilinear
%     'InhonDLPFCandAIonlynofb' %bilinear
%     'Inhonconnsnofb' %bilinear
%     'Inhonallnofb' %bilinear
%     'NonLinDLPFConLOCtoAIandInh-nodesnoDLPFCtoAInofb' %nonlinear
%     'NonLinDLPFConLOCtoAIandInh-binoDLPFCtoAInofb' %nonlinear
%     'NonLinDLPFConLOCtoAIandall-binoDLPFCtoAInofb' %nonlinear
%     'NonLinDLPFConLOCtoAIandInh-nodesnofb'
%     'NonLinDLPFConLOCtoAIandInh-binofb'
%     'NonLinDLPFConLOCtoAIandall-binofb'
%     'NonLinDLPFConAItoPIandInh-nodesnoDLPFCtoAInofb'
%     'NonLinDLPFConAItoPIandInh-binoDLPFCtoAInofb'
%     'NonLinDLPFConAItoPIandall-binoDLPFCtoAInofb'
%     'NonLinDLPFConAItoPIandInh-nodesnoLOCtoAInofb'
%     'NonLinDLPFConAItoPIandInh-binoLOCtoAInofb'
%     'NonLinDLPFConAItoPIandall-binoLOCtoAInofb'
%     'NonLinDLPFConAItoPIandInh-nodesnofb'
%     'NonLinDLPFConAItoPIandInh-binofb'
%     'NonLinDLPFConAItoPIandall-binofb'
    'NonLinDLPFCfullmodel'
   % 'NoModulationsnofb'
   
    };

for i=1:numel(subjs)
    subjDir = [dataDir, subjs{i}];
    for ii = 1:numel(dcmfiles)
        dcm_file = [subjDir, '/DCM_', dcmfiles{ii},'.mat'];
        load(dcm_file,'DCM');
        DCM.c(2,1)=1;
        DCM.c(3,1)=0;
        DCM.c(4,3)=1;
        save([subjDir,'/DCM_NonLinfullmodelwfearinput.mat'],'DCM');
        GCM{i,1} = [subjDir,'/DCM_NonLinfullmodelwfearinput.mat'];
        GCM{i,2} = [subjDir,'/DCM_NoModulationsnofb.mat'];
    end    
end
save('/Users/c3336955/Documents/DCM_connectivity/group_PEB/GCM_full_model_check.mat','GCM');