%% DCM model inference

dataDir = '/Volumes/Scratch/Nik_data/postprocessing/dcm/';
%dcmbatchDir = '/Users/c3336955/Documents/DCM_connectivity/dcm_batch/';
%modestbatchDir = '/Users/c3336955/Documents/DCM_connectivity/batchdcmest/';
subjs = {'EPY141001','EPY141003','EPY141004','EPY141006','EPY141007',...
    'EPY141008','EPY141009','EPY141010','EPY141011','EPY141012',...
    'EPY141013','EPY141014','EPY141015','EPY141020','EPY141021',...
    'EPY141022','EPY141025','EPY141026','EPY141027','EPY141028',...
    'EPY141029','EPY141030','EPY141031','EPY141032','EPY141033'
    };

model_names = {
    %bilinear
%      'BMRmodel001'
%      'BMRmodel002'
%      'BMRmodel003'
%      'BMRmodel004'
%      'BMRmodel005'
%      'BMRmodel006'
%      'BMRmodel007'
%      'BMRmodel008'
     %nonlinear on LOC to AI
%      'BMRmodel009'
%      'BMRmodel010'
%      'BMRmodel011'
%      'BMRmodel012'
%      'BMRmodel013'
%      'BMRmodel014'
%      'BMRmodel015'
%      'BMRmodel016'
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

bmsdir = '/Volumes/Scratch/Nik_data/postprocessing/EPY_BMS_winning_family';

if ~isfolder(bmsdir), mkdir(bmsdir); end

clear matlabbatch;

for s = 1:numel(subjs)
    subjDir = [dataDir, subjs{s}];
    cd(subjDir)
    
    for mm = 1:numel(model_names)
        ff = [subjDir '/DCM_' model_names{mm} '.mat'];
        matlabbatch{1}.spm.dcm.bms.inference.sess_dcm{s}(1).dcmmat{mm,1} = ff;
        disp(['Loading DCM ' model_names{mm} ' for subject ' num2str(s) ])
        disp('...............................')
        DCM = load(ff);
        if ~isfield(DCM,'DCM') || ~isfield(DCM,'Ep') || ~isfield(DCM,'Cp') || ~isfield(DCM,'F')
            error('something wrong with %s',ff);
        end
        %size(matlabbatch{1}.spm.dcm.bms.inference.sess_dcm{s}(1).dcmmat) % checking all models expected are there
            
    end
end

matlabbatch{1}.spm.dcm.bms.inference.dir = cellstr(bmsdir);

matlabbatch{1}.spm.dcm.bms.inference.model_sp = {''};
matlabbatch{1}.spm.dcm.bms.inference.load_f = {''};
matlabbatch{1}.spm.dcm.bms.inference.method = 'RFX';

% matlabbatch{1}.spm.dcm.bms.inference.family_level.family(1).family_name = 'F1bilinear';
% matlabbatch{1}.spm.dcm.bms.inference.family_level.family(1).family_models = [1
%                                                                              2
%                                                                              3
%                                                                              4
%                                                                              5
%                                                                              6
%                                                                              7
%                                                                              8
%                                                                              ];
% matlabbatch{1}.spm.dcm.bms.inference.family_level.family(2).family_name = 'F2nonlinearLOCtoAI';
% matlabbatch{1}.spm.dcm.bms.inference.family_level.family(2).family_models = [9
%                                                                              10
%                                                                              11
%                                                                              12
%                                                                              13
%                                                                              14
%                                                                              15
%                                                                              16
%                                                                              ];
% matlabbatch{1}.spm.dcm.bms.inference.family_level.family(3).family_name = 'F3nonlinearAItoPI';                                                                      
% matlabbatch{1}.spm.dcm.bms.inference.family_level.family(3).family_models = [17
%                                                                              18
%                                                                              19
%                                                                              20
%                                                                              21
%                                                                              22
%                                                                              23
%                                                                              24
%                                                                              ];
% matlabbatch{1}.spm.dcm.bms.inference.family_level.family(4).family_name = 'F3nonlinearboth';                                                                      
% matlabbatch{1}.spm.dcm.bms.inference.family_level.family(4).family_models = [25
%                                                                              26
%                                                                              27
%                                                                              28
%                                                                              29
%                                                                              30
%                                                                              31
%                                                                              32
%                                                                              ];
% 
% 
% matlabbatch{1}.spm.dcm.bms.inference.bma.bma_yes.bma_all = 'famwin';
% matlabbatch{1}.spm.dcm.bms.inference.verify_id = 1;

cd(bmsdir);
save ('bms_job.mat', 'matlabbatch');
disp('... starting batch for dcm bms inference')
spm_jobman('run', 'bms_job.mat');