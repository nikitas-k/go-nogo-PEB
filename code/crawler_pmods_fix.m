% later..
%[filename, pathname, filterindex] = uigetfile('*.log', 'select your log file');
dataDir = '/Volumes/Scratch/Nik_data/T0/';
subjs = {'EPY141001','EPY141003','EPY141004','EPY141006','EPY141007',...
    'EPY141008','EPY141009','EPY141010','EPY141011','EPY141012',...
    'EPY141013','EPY141014','EPY141015','EPY141020','EPY141021',...
    'EPY141022','EPY141025','EPY141026','EPY141027','EPY141028',...
    'EPY141029','EPY141030','EPY141031','EPY141032','EPY141033',...
    'P14325','P15698','P17528','P22793','P29083','P321456','P35701',...
    'P36941','P45792','P47268','P49012','P51357','P53791','P55533',...
    'P57893','P57933','P61137','P67641','P69581','P71985','P86420',...
    'P89922','P92648','P92855','P94998','P95532'};
%infile = [pathname filename];
% start text in log file!!
for ii = 1:numel(subjs)
    
    pathname = [dataDir subjs{ii} '/'];
    filename = [pathname subjs{ii} '_GNG_T0.log'];
    starttext = 'Ready';

    response_order = {'hit','hit','hit','hit','miss','miss','hit','hit','hit','miss',...
        'hit','hit','hit','miss','hit','hit','hit','miss','hit','hit','hit','hit',...
        'hit','hit','miss','hit','hit','miss','hit','miss','hit','hit','hit','hit',...
        'hit','miss','hit','hit','miss','hit','hit','miss','hit','hit','miss','hit',...
        'hit','hit',...
        'hit','miss','hit','hit','hit','hit','hit','hit','miss','hit','hit','hit',...
        'miss','miss','hit','hit','hit','miss','hit','hit','miss','hit','hit','hit',...
        'miss','hit','hit','hit','hit','miss','hit','hit','hit','hit','hit','hit','hit',...
        'hit','miss','miss','hit','miss','hit','hit','miss','hit','hit','hit'};
    
    image_order = {'fear','fear','fear','fear','calm','calm','fear','fear','fear','calm',...
        'fear','fear','fear','calm','fear','fear','fear','calm','fear','fear','fear','fear',...
        'fear','fear','calm','fear','fear','calm','fear','calm','fear','fear','fear','fear',...
        'fear','calm','fear','fear','calm','fear','fear','calm','fear','fear','calm','fear',...
        'fear','fear',...
        'calm','fear','calm','calm','calm','calm','calm','calm','fear','calm','calm','calm',...
        'fear','fear','calm','calm','calm','fear','calm','calm','fear','calm','calm','calm',...
        'fear','calm','calm','calm','calm','fear','calm','calm','calm','calm','calm','calm','calm',...
        'calm','fear','fear','calm','fear','calm','calm','fear','calm','calm','calm'};
    
    
    fid=fopen(filename);
    lines={};
    while ~feof(fid)
        lines{end+1}=fgetl(fid);
    end
    fclose(fid);
    
    
    l_header=5;
    l_start=7;
    
    % find scanner start time
    
    start_line = lines(l_start);
    start_line = strsplit(char(start_line), '\t');
    scanner_start_time = str2double(start_line{5})+16400;
    
    i_line = 1;
    
    % run loop to find the first line of interest
    
    while i_line <= numel(lines)
        
        this_line = lines(i_line);
        str = strsplit(char(this_line),'\t');
        
        if strcmp(str{1},'Event Type')
            break
        end
        i_line = i_line+1;
    end
    
    i_line = i_line + 3; %skip line breaks
    
    % build our struct, based on the types
    
    alltypes = {'onset','duration','name','value','rt','accuracy'};
    
    m=struct();m(:)=[];
    
    for i=1:numel(alltypes)
        
        m(1).(alltypes{i})={};
        
    end
    
    for i=1:numel(image_order); m(1).name(end+1,:) = image_order(i);end
    
    % now run main loop to pull out timings, etc
    
    while i_line <= numel(lines)
        this_line = lines(i_line);
        
        elements = strsplit(char(this_line),'\t');
        response = elements{3};
        if strcmp(response,'hit')
            t_onset = (str2double(elements{7}) - scanner_start_time)/10000;
            rt = str2double(elements{5})/10000;
        elseif strcmp(response,'miss')
            t_onset = (str2double(elements{4}) - scanner_start_time)/10000;
            rt = 0;
        else
            i_line = i_line+1;
        end
        
        duration = 5170/10000;
        
        m.duration{end+1,1} = duration;
        m.onset{end+1,1} = t_onset;
        m.value{end+1,1} = 1*ones(size(t_onset));
        m.rt{end+1,1} = rt;
        
        i_line = i_line + 1;
        
    end
    
    % names, onsets, durations for SPM...
    
    names={};
    onsets={};
    durations={};
    pmods={};
    
    
    %bookkeeping
    tmp = m(1).name;
    fear_inds = find(ismember(tmp,'fear'));
    fear_gos = fear_inds(1:36);
    fear_nogos = fear_inds(37:end);
    calm_inds = find(ismember(tmp,'calm'));
    calm_nogos = calm_inds(1:12);
    calm_gos = calm_inds(13:end);
    
    % CONDITIONS
    
    % fear go... % see below
%     names{end+1}= 'fear_go';
%     onsets{end+1} = cell2mat(m(1).onset(fear_gos))';
%     durations{end+1} = cell2mat(m(1).duration(fear_gos)');
%     pmods{end+1} = cell2mat(m(1).rt(fear_gos)');
%     
%     
%     %fear nogo trials
%     names{end+1} = 'fear_nogo';
%     onsets{end+1} = cell2mat(m(1).onset(fear_nogos))';
%     durations{end+1} = cell2mat(m(1).duration(fear_nogos)');
%     
%     % calm go trials
%     names{end+1} = 'calm_go';
%     onsets{end+1} = cell2mat(m(1).onset(calm_gos))';
%     durations{end+1} = cell2mat(m(1).duration(calm_gos)');
%     pmods{end+1} = cell2mat(m(1).rt(calm_gos)');
%     
%     %calm nogo trials
%     names{end+1} = 'calm_nogo';
%     onsets{end+1} = cell2mat(m(1).onset(calm_nogos))';
%     durations{end+1} = cell2mat(m(1).duration(calm_nogos)');
    
    
    %task in design
    names{end+1} = 'task';
    onsets{end+1} = [cell2mat(m(1).onset(fear_gos));cell2mat(m(1).onset(fear_nogos));cell2mat(m(1).onset(calm_gos));cell2mat(m(1).onset(calm_nogos))]';
    durations{end+1} = [cell2mat(m(1).duration(fear_gos));cell2mat(m(1).duration(fear_nogos));cell2mat(m(1).duration(calm_gos));cell2mat(m(1).duration(calm_nogos))]';
    pmods{end+1} = [cell2mat(m(1).rt(fear_gos));cell2mat(m(1).rt(calm_gos))]';
    
    %inhibition in design
    names{end+1} = 'inhibition';
    onsets{end+1} = [cell2mat(m(1).onset(fear_nogos));cell2mat(m(1).onset(calm_nogos))]';
    durations{end+1} = [cell2mat(m(1).duration(fear_nogos));cell2mat(m(1).duration(calm_nogos))]';
    % SAVE TO MODEL.MAT FOR SPM
    
    names{end+1} = 'fear trials';
    onsets{end+1} = [cell2mat(m(1).onset(fear_gos)); cell2mat(m(1).onset(fear_nogos))]';
    durations{end+1} = [cell2mat(m(1).duration(fear_gos)); cell2mat(m(1).duration(fear_nogos))]';
    
    outfile = strcat(pathname,'model_pmods_fix_dcm.mat');
    save(outfile, 'names', 'onsets', 'durations', 'pmods');
end