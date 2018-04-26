% loop over all records and all parameters
% hp selection is performed in a second phase


format long g
warning('off','all')

p = parpool('local', 12); 

% param grid
lam3_grid = [45, 46, 47, 48];
Threshold_grid = [0.5, 1.0, 1.5, 2.0, 2.5, 3.0];

% loop over record
PATH = '/home/infres/schambon/Papers/mcsleep/data/mat_files/';
fil=fullfile(PATH,'*.mat')
d=dir(fil)
% scores = {};
for k=1:numel(d)	
	file_name=fullfile(PATH,d(k).name)

	% Grid search

	[metrics, metrics_n2] = hp_selection(file_name, lam3_grid, Threshold_grid)

	a = strsplit(file_name, '/');
	b = a{1, end};
	c = strsplit(b, '.');

	% for i = 1:length(metrics)
	% 	metrics(1, i).record = c{1, 1}
	% end

	save(['scores/parekh_2017/metrics_' c{1, 1} '.mat'], 'metrics')
	save(['scores/parekh_2017/metrics_N2_' c{1, 1} '.mat'], 'metrics_n2')
	% scores{1, k} = metrics
end

% save(['scores/scores.mat'], 'scores')
delete(gcp('nocreate'))