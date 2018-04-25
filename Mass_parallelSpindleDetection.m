% loop over all records and all parameters
% hp selection is performed in a second phase


format long g
warning('off','all')

p = parpool('local', 12); 

% param grid
% lam3_grid = [45, 46, 47, 48];
% Threshold_grid = [0.5, 1.0, 1.5, 2.0, 2.5, 3.0];

lam3_grid = [45];
Threshold_grid = [0.5];


% loop over record
path = 'data/SS2/mcsleep';
fil=fullfile(path,'*.mat')
d=dir(fil)
% scores = {};
for k=1:numel(d)	
	file_name=fullfile(path,d(k).name)

	% Grid search

	metrics = hp_selection(file_name, lam3_grid, Threshold_grid)

	a = strsplit(file_name, '/');
	b = a{1, end};
	c = strsplit(b, '.');

	% for i = 1:length(metrics)
	% 	metrics(1, i).record = c{1, 1}
	% end

	save(['scores/parekh_2017/' c{1, 1} '.mat'], 'metrics')
	% scores{1, k} = metrics
end

% save(['scores/scores.mat'], 'scores')
delete(gcp('nocreate'))