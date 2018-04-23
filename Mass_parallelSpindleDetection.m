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
Threshold_grid = [0.5];

% Grid search
file_name='/infres/ir610/users/schambon/Papers/mcsleep/data/SS2/mcsleep/01-02-0009.mat';
metrics = hp_selection(file_name, lam3_grid, Threshold_grid)

% % hp selection
% [m, idx] = max(scores(:))
% [maxval, maxidx] = max(scores);

% F_ = F(:);
% S_ = S(:);
% best_lam3 = F_(1, idx);
% best_Threshold = S_(1, idx);

% % prediction on test record
% file_name='/infres/ir610/users/schambon/Papers/mcsleep/data/SS2/mcsleep/01-02-0019.mat';
% [f1, Pr, Re] = prediction_test(file_name, best_lam3, best_Threshold)
