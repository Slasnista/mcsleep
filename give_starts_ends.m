function [starts, ends, durations] = give_starts_ends(pred, sfreq)

% evaluate starts / ends / durations
pred_starts_ends = pred(1, 2:end) - pred(1, 1:end - 1);

idx_starts = find(pred_starts_ends==1);
idx_ends = find(pred_starts_ends==-1);

starts = idx_starts / sfreq;
ends = idx_ends / sfreq;
durations = ends - starts;

end