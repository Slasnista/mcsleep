% loop over all records and all parameters
% hp selection is performed in a second phase
% // function Mass_parallelSpindleDetection()

%matlab -nodesktop -nojvm -nosplash
%matlab -nodesktop -nosplash

addpath('methods/')

format long g
warning('off','all')

N = maxNumCompThreads
% LASTN = maxNumCompThreads(10)
% LASTN = maxNumCompThreads('automatic')
p = parpool('local', 10);
p = parpool(10);

% param grid
%lam3_grid = [45, 46, 47, 48];
lam3_grid = [30];
%Threshold_grid = [0.5, 1, 1.5, 2, 2.5, 3];
Threshold_grid = [0.5];

% loop over record
% PATH = '/home/infres/schambon/Papers/mcsleep/data/stanford/SSC/';
PATH = 'data/stanford/SSC/';
fil=fullfile(PATH,'*.mat')
d=dir(fil)
% scores = {};
for k=1:numel(d)
	file_name=fullfile(PATH,d(k).name);

	% if k >= 15

	disp(file_name)
	% Grid search
	metrics = general_hp_selection(file_name, lam3_grid, Threshold_grid)

	a = strsplit(file_name, '/');
	b = a{1, end};
	c = strsplit(b, '.');

	save(['scores/stanford/consensus_' c{1, 1} '.mat'], 'metrics')
	% else

	% 	disp('done')
	% end

end

delete(gcp('nocreate'))
