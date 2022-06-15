%-----------------------------------------------------------------------
% Job saved on 26-Feb-2021 14:01:28 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
subjDir = {strcat('/Volumes/Scratch/Nik_data/T0/', subj)};
%%spm
%smoothfiles = {};
%for ii = 1:720; smoothfiles{ii} = char(strcat(dataDir, subj, '/sub-', subj, '_task-gng_run-01_space-MNI152NLin6Asym_desc-preproc_bold.nii,',string(ii))); end
%smoothfiles = smoothfiles';
%%
% if ~exist(char(subjDir),'dir')
%     mkdir(char(subjDir))
% end
funcfiles = {};
for ii = 1:719; funcfiles{ii} = char(strcat(dataDir, subj, '/bold_vols_corr.nii,',string(ii))); end
funcfiles = funcfiles';

%%
% matlabbatch{1}.spm.spatial.smooth.data = smoothfiles;
% matlabbatch{1}.spm.spatial.smooth.fwhm = [8 8 8];
% matlabbatch{1}.spm.spatial.smooth.dtype = 0;
% matlabbatch{1}.spm.spatial.smooth.im = 0;
% matlabbatch{1}.spm.spatial.smooth.prefix = 's_';
%%
matlabbatch{1}.spm.stats.fmri_spec.dir = subjDir;
matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{1}.spm.stats.fmri_spec.timing.RT = 0.82;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = 60;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = 30;
matlabbatch{1}.spm.stats.fmri_spec.sess.scans = funcfiles;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.multi = {strcat(dataDir, subj, '/model_pmods_fix_dcm_adj.mat')};
matlabbatch{1}.spm.stats.fmri_spec.sess.regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.multi_reg = {''}; %strcat(subjDir, '/sub-', subj, '_task-gng_run-01_regressors_no_globals_fix_notabs.txt');
matlabbatch{1}.spm.stats.fmri_spec.sess.hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{1}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{1}.spm.stats.fmri_spec.volt = 1;
matlabbatch{1}.spm.stats.fmri_spec.global = 'None';
matlabbatch{1}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch{1}.spm.stats.fmri_spec.mask = {''};
matlabbatch{1}.spm.stats.fmri_spec.cvi = 'AR(1)';
matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = strcat(subjDir, '/SPM.mat');
matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;
matlabbatch{3}.spm.stats.con.spmmat(1) = strcat(subjDir, '/SPM.mat');

matlabbatch{3}.spm.stats.con.consess{1}.fcon.name = 'fear go';
matlabbatch{3}.spm.stats.con.consess{1}.fcon.weights = [1 0 0 0];
matlabbatch{3}.spm.stats.con.consess{1}.fcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{2}.fcon.name = 'fear no-go';
matlabbatch{3}.spm.stats.con.consess{2}.fcon.weights = [0 1 0 0];
matlabbatch{3}.spm.stats.con.consess{2}.fcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{3}.fcon.name = 'calm go';
matlabbatch{3}.spm.stats.con.consess{3}.fcon.weights = [0 0 1 0];
matlabbatch{3}.spm.stats.con.consess{3}.fcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{4}.fcon.name = 'calm no-go';
matlabbatch{3}.spm.stats.con.consess{4}.fcon.weights = [0 0 0 1];
matlabbatch{3}.spm.stats.con.consess{4}.fcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{5}.fcon.name = 'main effect';
matlabbatch{3}.spm.stats.con.consess{5}.fcon.weights = [1 1 1 1];
matlabbatch{3}.spm.stats.con.consess{5}.fcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{6}.tcon.name = 'fear>calm';
matlabbatch{3}.spm.stats.con.consess{6}.tcon.weights = [1 1 -1 -1];
matlabbatch{3}.spm.stats.con.consess{6}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{7}.tcon.name = 'nogo>go';
matlabbatch{3}.spm.stats.con.consess{7}.tcon.weights = [-1 1 -1 1];
matlabbatch{3}.spm.stats.con.consess{7}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{8}.tcon.name = 'interaction';
matlabbatch{3}.spm.stats.con.consess{8}.tcon.weights = [-1 1 1 -1];
matlabbatch{3}.spm.stats.con.consess{8}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{9}.fcon.name = 'Effects of Interest';
matlabbatch{3}.spm.stats.con.consess{9}.fcon.weights = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
matlabbatch{3}.spm.stats.con.consess{9}.fcon.sessrep = 'none';
% % matlabbatch{4}.spm.stats.con.consess{1}.fcon.name = 'faces';
% % matlabbatch{4}.spm.stats.con.consess{1}.fcon.weights = [1 1 1 1];
% % matlabbatch{4}.spm.stats.con.consess{1}.fcon.sessrep = 'none';
% % matlabbatch{3}.spm.util.voi.spmmat = strcat(subjDir, '/SPM.mat');
% % matlabbatch{3}.spm.util.voi.adjust = 0;
% % matlabbatch{3}.spm.util.voi.session = 1;
% % matlabbatch{3}.spm.util.voi.name = 'L_FFA';
% % matlabbatch{3}.spm.util.voi.roi{1}.sphere.centre = LFFAcoords(i,:);
% % matlabbatch{3}.spm.util.voi.roi{1}.sphere.radius = 5;
% % matlabbatch{3}.spm.util.voi.roi{1}.sphere.move.fixed = 1;
% % matlabbatch{3}.spm.util.voi.expression = 'i1';
% % matlabbatch{4}.spm.util.voi.spmmat = strcat(subjDir, '/SPM.mat');
% % matlabbatch{4}.spm.util.voi.adjust = 0;
% % matlabbatch{4}.spm.util.voi.session = 1;
% % matlabbatch{4}.spm.util.voi.name = 'L_IFG';
% % matlabbatch{4}.spm.util.voi.roi{1}.sphere.centre = LIFGcoords(i,:);
% % matlabbatch{4}.spm.util.voi.roi{1}.sphere.radius = 5;
% % matlabbatch{4}.spm.util.voi.roi{1}.sphere.move.fixed = 1;
% % matlabbatch{4}.spm.util.voi.expression = 'i1';
% % matlabbatch{5}.spm.util.voi.spmmat = strcat(subjDir, '/SPM.mat');
% % matlabbatch{5}.spm.util.voi.adjust = 0;
% % matlabbatch{5}.spm.util.voi.session = 1;
% % matlabbatch{5}.spm.util.voi.name = 'L_DLPFC';
% % matlabbatch{5}.spm.util.voi.roi{1}.sphere.centre = LDLPFCcoords(i,:);
% % matlabbatch{5}.spm.util.voi.roi{1}.sphere.radius = 5;
% % matlabbatch{5}.spm.util.voi.roi{1}.sphere.move.fixed = 1;
% % matlabbatch{5}.spm.util.voi.expression = 'i1';
% % matlabbatch{6}.spm.util.voi.spmmat = strcat(subjDir, '/SPM.mat');
% % matlabbatch{6}.spm.util.voi.adjust = 0;
% % matlabbatch{6}.spm.util.voi.session = 1;
% % matlabbatch{6}.spm.util.voi.name = 'L_AG';
% % matlabbatch{6}.spm.util.voi.roi{1}.sphere.centre = LAGcoords(i,:);
% % matlabbatch{6}.spm.util.voi.roi{1}.sphere.radius = 5;
% % matlabbatch{6}.spm.util.voi.roi{1}.sphere.move.fixed = 1;
% % matlabbatch{6}.spm.util.voi.expression = 'i1';
% matlabbatch{1}.spm.util.voi.spmmat = strcat(subjDir,'/SPM.mat');
% matlabbatch{1}.spm.util.voi.adjust = 0;
% matlabbatch{1}.spm.util.voi.session = 1;
% matlabbatch{1}.spm.util.voi.name = 'R_DLPFC'; 
% matlabbatch{1}.spm.util.voi.roi{1}.sphere.centre = RDLPFCcoords(i,:); 
% matlabbatch{1}.spm.util.voi.roi{1}.sphere.radius = 5;
% matlabbatch{1}.spm.util.voi.roi{1}.sphere.move.fixed = 1;
% matlabbatch{1}.spm.util.voi.expression = 'i1';