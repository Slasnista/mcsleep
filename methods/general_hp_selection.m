function metrics = general_hp_selection(file_name, lam3, Threshold, sfreq)

f = load(file_name);

% fs = f.sfreq;

Y = zeros(1, size(f.chan,2));
Y(1, :) = f.chan;

N = size(Y,2);

%% Try low pass filtering
params.y = Y;
% params.lam1 = 0.3;
% params.lam2 = 6.5;
% % params.lam3 = 45;
% % params.Threshold = 40;
% params.mu = 0.5;
% params.Nit = 50;
% params.K = fs;
% params.O = fs / 2;
params.fs = sfreq;

params.lam1 = 0.6;
params.lam2 = 7;
params.mu = 0.5;
params.Nit = 40;
params.K = sfreq;
params.O = sfreq / 2;

% Bandpass filter & Teager operator parameters
params.f1 = 11;
params.f2 = 16;
params.filtOrder = 4;
params.meanEnvelope = 1;
params.desiredChannel = [1];

% Other function parameters
params.channels = [1];
params.plot = 0;
params.epoch = 1;
params.calculateCost = 1;
params.Full = 1;
params.Entire = 0;
params.ROC = 0;
params.data = 0;

params.scorer = f.spindle;
params.sfreq = sfreq;

% grid search
[F,S] = ndgrid(lam3, Threshold);
metrics = arrayfun(@(p1, p2) general_inner_fit(params, p1, p2), F, S);



end