% add path
addpath('wendt_2012/')

% run Wendt 2012

% load data and run prediction script
PATH = '/home/infres/schambon/Papers/mcsleep/data/mat_files/';
fil=fullfile(PATH,'*.mat')
sfreq = 256;
d=dir(fil)
for k=1:numel(d)
  filename=fullfile(PATH,d(k).name)

  load(filename)
  pred = wendt_spindle_detection(c3(1, :).', o1(1, :).', 256);

  pred = transpose(pred);

  f1 = compute_f1(label, pred, sfreq)

  label_n2 = label;
  pred_n2 = pred;

  idx_non_n2 = find(N2 == 0);
  label_n2(idx_non_n2) = 0;
  pred_n2(idx_non_n2) = 0;

  f1_n2 = compute_f1(label_n2, pred_n2, sfreq)

  save(['scores/wendt_2012/' d(k).name], 'f1')
  save(['scores/wendt_2012/f1_n2' d(k).name], 'f1_n2')

  % vars = {'pred','c3','o1'};
  % clear(vars{:})
end

