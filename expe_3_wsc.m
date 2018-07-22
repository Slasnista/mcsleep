% loop over all records and all parameters
% hp selection is performed in a second phase
% // function Mass_parallelSpindleDetection()

%matlab -nodesktop -nosplash

addpath('/home/infres/schambon/Papers/mcsleep/methods/')
addpath('/home/infres/schambon/Papers/mcsleep')

format long g
warning('off','all')

p = parpool('local', 20);

% param grid
lam3_grid = [10, 20, 30, 40, 50];
Threshold_grid = [0.5, 1, 1.5, 2, 2.5, 3];
sfreq = 200;
lam1 = 0.6;
lam2 = 7;

% loop over record
PATH = '/home/infres/schambon/Papers/mcsleep/data/WSC/';
fil=fullfile(PATH,'*.mat')
d=dir(fil)

for k=1:numel(d)
	file_name=fullfile(PATH,d(k).name);

	disp(file_name)

	% Grid search
	metrics = general_hp_selection(
		file_name, lam3_grid, Threshold_grid, sfreq, lam1, lam2)

	a = strsplit(file_name, '/');
	b = a{1, end};
	c = strsplit(b, '.');

	save(['scores/SSC/' c{1, 1} '.mat'], 'metrics')
end

delete(gcp('nocreate'))
