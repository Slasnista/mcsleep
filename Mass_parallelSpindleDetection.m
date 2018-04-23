%% This script provides a demo for the McSleep spindle detection method
%
% Last EDIT: 5/1/17
% Ankit Parekh
% Perm. Contact: ankit.parekh@nyu.edu
%
% This script uses the Montreal Archive of Sleep Studies (MASS) dataset
% Please ensure that the relevant PSG files are in the same directory or
% added to the MATLAB path. 
%
% Please cite as: 
% Multichannel Sleep Spindle Detection using Sparse Low-Rank Optimization 
% A. Parekh, I. W. Selesnick, R. S. Osorio, A. W. Varga, D. M. Rapoport and I. Ayappa 
% bioRxiv Preprint, doi: https://doi.org/10.1101/104414
%
% Note: In the paper above, we discard epochs where body movement artifacts were visible. 
%       Since this script is for illustration purposes only, we do not reject any epochs here
%% 
%clear; close all; clc
format long g
warning('off','all')

path = 'data/SS2/';
% fil=fullfile(path,'*.edf')
% d=dir(fil)
% for k=1:numel(d)	
% 	filename=fullfile(path,d(k).name)

% end

% perform cross validation of hyper parameters Threshold and lam3
% f_val='data/SS2/01-02-0018 PSG.edf';
% label_name='/infres/ir610/users/schambon/Papers/mcsleep/data/SS2/mcsleep/01-02-0009.mat';
% load(label_name);

% scores = zeros(1, 5);

% perform grid search on one record
% lam3 = [45, 46, 47, 48];
% Threshold = [0.5, 1.0, 1.5, 2.0, 2.5, 3.0];

lam3_grid = [45];
Threshold_grid = [0.5, 1.0];

% Grid search
file_name='/infres/ir610/users/schambon/Papers/mcsleep/data/SS2/mcsleep/01-02-0009.mat';
[scores, F, S] = hp_selection(file_name, lam3_grid, Threshold_grid)

% hp selection
[m, idx] = max(scores(:))
[maxval, maxidx] = max(scores);

F_ = F(:);
S_ = S(:);
best_lam3 = F_(1, idx);
best_Threshold = S_(1, idx);

% prediction on test record
file_name='/infres/ir610/users/schambon/Papers/mcsleep/data/SS2/mcsleep/01-02-0019.mat';
[f1, Pr, Re] = prediction_test(file_name, best_lam3, best_Threshold)



% for idx = 1:numel(lam3)
% 	params.lam3 = lam3(idx)
% 	p = parpool('local', 12); 
% 	pred = analyzeSpindles(params);
% 	f1 = compute_f1(label, pred, sfreq, iou_th);
% 	scores(1, idx) = f1
% 	delete(gcp('nocreate'))
% end

% lam3 = [45, 46, 47, 48];

% [F] = ndgrid(lam3);



% distcomp.feature( 'LocalUseMpiexec', true );




% f1 = 2 * (recalls * precisions) / (recalls + precisions)

% a = (iou >= iou_th).astype(np.int)
% b = np.sum(a, axis=1)
% n_match = b[b > 0].shape[0]

% # mutiple positive element may match the same true object
% # we remove them with - b.sum() + n_match
% n_pos = iou.shape[1] - b.sum() + n_match
% n_rel = iou.shape[0]

% try:
%     Pr = n_match / n_pos
% except ZeroDivisionError:
%     pass
%     Pr = 0

% Re = n_match / n_rel

% precisions.append(Pr)
% recalls.append(Re)

% lam3 = [45, 46, 47, 48];
% c = [0.5, 1.0, 1.5, 2.0, 2.5, 3.0];
% [F,S] = ndgrid(lam3, c);



% fitresult = arrayfun(@(p1,p2) fittingfunction(p1,p2), F, S); %run a fitting on every pair fittingfunction(F(J,K), S(J,K))
% [minval, minidx] = min(fitresult);
% bestFirst = F(minidx);
% bestSecond = S(minidx);




% function f1 = hp_selection(lam3_, c_, params_)
% params_.c = c_
% params_.lam3 = lam3_
% f1 = params_.c + params_.lam3
% end



% filename='data/SS2/01-02-0019 PSG.edf'

% [hdr, data] = edfread(filename);
% channels = [23 22 5 14 24 9];

% % select only C3
% % channels = [14];

% fs = hdr.frequency(channels(1));
% Y = zeros(length(channels), size(data,2));
% j = 1;
% for i = channels
%     Y(j,:) = data(i,:); 
%     j = j+1;
% end
% N = size(Y,2);

% clear data;

% %% Try low pass filtering
% params.y = Y;
% params.lam1 = 0.6;
% params.lam2 = 7;
% params.lam3 = 45;
% params.mu = 0.5;
% params.Nit = 40;
% params.K = 256;
% params.O = 128;
% params.fs = fs;

% % Bandpass filter & Teager operator parameters
% params.f1 = 11;
% params.f2 = 16;
% params.filtOrder = 4;
% params.Threshold = 1.5; 
% params.meanEnvelope = 0;
% params.desiredChannel = 4;

% % Other function parameters
% params.channels = channels;
% params.plot = 0;
% params.epoch = 1;
% params.calculateCost = 1;
% params.Full = 1;
% params.Entire = 0;
% params.ROC = 0;
% params.data = 0;

% % distcomp.feature( 'LocalUseMpiexec', true );
% p = parpool('local', 12); 

% pred = analyzeSpindles(params);

% c = strsplit(d(k).name, '.')
% cc = strsplit(c{1,1}, ' ')


% %save(['predictions/figure_2/parekh_2017/' cc{1, 1} '.mat'], 'pred')

% %clear pred
% % end


% % %% Run the multichannel spindle detector
% % if params.Full && isempty(gcp)
% % % %     % Start parallel pool
% %     if isempty(gcp) 
% %         p = parpool('local', 12); 
% %     end
% % end    


% %% F1 score calculation

% %Score = F1score(spindles, vd1,vd2);
% %Score{2}

