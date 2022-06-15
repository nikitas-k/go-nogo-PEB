% List of open inputs
% Volume of Interest: Centre - cfg_entry
% Volume of Interest: Radius - cfg_entry
nrun = X; % enter the number of runs here
jobfile = {'/Volumes/Scratch/Nik_data/postprocessing/dcm/voi_job_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(2, nrun);
for crun = 1:nrun
    inputs{1, crun} = MATLAB_CODE_TO_FILL_INPUT; % Volume of Interest: Centre - cfg_entry
    inputs{2, crun} = MATLAB_CODE_TO_FILL_INPUT; % Volume of Interest: Radius - cfg_entry
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
