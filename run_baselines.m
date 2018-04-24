% add path
addpath('wendt_2012/')

% run Wendt 2012

% load data and run prediction script
PATH = '/home/infres/schambon/Papers/mcsleep/data/SS2/mcsleep/';
fil=fullfile(PATH,'*.mat')
d=dir(fil)
for k=1:numel(d)
  filename=fullfile(PATH,d(k).name)
  load(filename)
  pred = wendt_spindle_detection(c3(1, :).', o1(1, :).', 256);
  f1 = compute_f1(label, transpose(pred), sfreq)
  save(['scores/wendt_2012/' d(k).name], 'f1')

  % vars = {'pred','c3','o1'};
  % clear(vars{:})
end

