% loop over all records and all parameters
% hp selection is performed in a second phase
% // function Mass_parallelSpindleDetection()

%matlab -nodesktop -nosplash

addpath('/home/infres/schambon/Papers/mcsleep/methods/')
addpath('/home/infres/schambon/Papers/mcsleep')

% format long g
warning('off','all')

p = parpool('local', 20);

% param grid
lam3_grid = [10, 20, 30, 40, 50];
Threshold_grid = [0.5, 1, 1.5, 2, 2.5, 3];
sfreq = 200;

% loop over record
PATH = '/home/infres/schambon/Papers/mcsleep/data/WSC/mat_files';
fil=fullfile(PATH,'*.mat')
d=dir(fil)

for k=1:numel(d)
	file_name=fullfile(PATH,d(k).name);

	disp(file_name)

	% Grid search
	metrics = general_hp_selection(file_name, lam3_grid, Threshold_grid, sfreq)

	a = strsplit(file_name, '/');
	b = a{1, end};
	c = strsplit(b, '.');

	save(['scores/WSC/' c{1, 1} '.mat'], 'metrics')
end

delete(gcp('nocreate'))
