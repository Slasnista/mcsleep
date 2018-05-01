function [metrics_E1, metrics_E2, metrics_union, metrics_intersection] = hp_selection_gold_standard(file_name, lam3, Threshold)

load(file_name);

sfreq = 256;
fs = sfreq;

Y = zeros(6, size(c3,2));
Y(1, :) = c3;
Y(2, :) = c4;
Y(3, :) = f3;
Y(4, :) = f4;
Y(5, :) = o1;
Y(6, :) = o2;

N = size(Y,2);

%% Try low pass filtering
params.y = Y;
params.lam1 = 0.6;
params.lam2 = 7;
params.lam3 = 45;
params.mu = 0.5;
params.Nit = 40;
params.K = 256;
params.O = 128;
params.fs = fs;

% Bandpass filter & Teager operator parameters
params.f1 = 11;
params.f2 = 16;
params.filtOrder = 4;
params.Threshold = 1.5; 
params.meanEnvelope = 0;
params.desiredChannel = 4;

% Other function parameters
% params.channels = channels;
params.plot = 0;
params.epoch = 1;
params.calculateCost = 1;
params.Full = 1;
params.Entire = 0;
params.ROC = 0;
params.data = 0;

params.E1 = E1;
params.E2 = E2;
params.union = union;
params.intersection = intersection;

params.sfreq = sfreq;
params.N2 = N2
params.iou_th = 0.3;
params.Threshold = 1.5;

% grid search
[F,S] = ndgrid(lam3, Threshold);
[metrics_E1, metrics_E2, metrics_union, metrics_intersection] = arrayfun(@(p1, p2) inner_fit_gold_standard(params, p1, p2), F, S);



end