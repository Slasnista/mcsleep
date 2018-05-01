% add path
addpath('wendt_2012/')

% run Wendt 2012

% load data and run prediction script
PATH = '/home/infres/schambon/Papers/mcsleep/data/mat_gold_standard/';
fil=fullfile(PATH,'*.mat')
sfreq = 256;
d=dir(fil)
for k=1:numel(d)
  filename=fullfile(PATH,d(k).name)

  load(filename)
  pred = wendt_spindle_detection(c3(1, :).', o1(1, :).', 256);
  pred = transpose(pred);

  f1_E1 = compute_f1(E1, pred, sfreq)
  f1_E2 = compute_f1(E2, pred, sfreq)
  f1_union = compute_f1(union, pred, sfreq)
  f1_intersection = compute_f1(intersection, pred, sfreq)
  save(['scores/wendt_2012/gold_standard_E1_' d(k).name], 'f1_E1')
  save(['scores/wendt_2012/gold_standard_E2_' d(k).name], 'f1_E2')
  save(['scores/wendt_2012/gold_standard_union_' d(k).name], 'f1_union')
  save(['scores/wendt_2012/gold_standard_intersection_' d(k).name], 'f1_intersection')

  %label_n2 = label;
  %pred_n2 = pred;

  %idx_non_n2 = find(N2 == 0);
  %label_n2(idx_non_n2) = 0;
  %pred_n2(idx_non_n2) = 0;

  %f1_n2 = compute_f1(label_n2, pred_n2, sfreq)

  
  %save(['scores/wendt_2012/f1_n2' d(k).name], 'f1_n2')

  % vars = {'pred','c3','o1'};
  % clear(vars{:})
end

