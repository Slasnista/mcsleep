% loop over all records and all parameters
% hp selection is performed in a second phase


format long g
warning('off','all')

% param grid
lam3_grid = [45, 46];
Threshold_grid = [0.5];

% loop over record
path = 'data/SS2/mcsleep';
fil=fullfile(path,'*.mat')
d=dir(fil)
scores = {};
for k=1:numel(d)	
	file_name=fullfile(path,d(k).name)

	% Grid search
	metrics = hp_selection(file_name, lam3_grid, Threshold_grid)
	a = strsplit(file_name, '/');
	b = a{1, end};
	c = strsplit(b, '.');

	for i = 1:length(metrics)
		metrics(1, i).record = c{1, 1}
	end

	save(['scores/scores_' c{1, 1} '.mat'], 'metrics')
	scores{1, k} = metrics
end

save(['scores/scores.mat'], 'scores')
