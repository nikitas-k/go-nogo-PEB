% List of open inputs
clc;
spm('defaults', 'FMRI');
dataDir = '/Volumes/Scratch/Nik_data/T0/';
%coordsDir = '/Users/c3336955/Documents/DCM_connectivity/GNG_coords';
subjs = {'EPY141001','EPY141003','EPY141004','EPY141006','EPY141007',...
    'EPY141008','EPY141009','EPY141010','EPY141011','EPY141012',...
    'EPY141013','EPY141014','EPY141015','EPY141020','EPY141021',...
    'EPY141022','EPY141025','EPY141026','EPY141027','EPY141028',...
    'EPY141029','EPY141030','EPY141031','EPY141032','EPY141033',...
    'P14325','P15698','P17528','P22793','P29083','P321456','P35701',...
    'P36941','P45792','P47268','P49012','P51357','P53791','P55533',...
    'P57893','P57933','P61137','P67641','P69581','P71985','P86420',...
    'P89922','P92648','P92855','P94998','P95532'};

for i = 1:numel(subjs)
    subj = subjs{i};
    disp(strcat('Subject:   ',subj));
    clear matlabbatch;
    spm_script_job_dcm;
    %cd(char(strcat(dataDir, subj)));
    try
        spm_jobman('run', matlabbatch);
    catch
        continue
    end
    %cd(dataDir);
end