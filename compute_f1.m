function metrics = compute_f1(label, pred, sfreq)

[pred_starts, pred_ends, pred_durations] = give_starts_ends(pred, sfreq);
[true_starts, true_ends, true_durations] = give_starts_ends(label, sfreq);

iou = compute_iou(true_starts, true_ends, pred_starts, pred_ends);

iou_shape = size(iou);

iou_ths = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9];

precision_tab = zeros(1, 9);
recall_tab = zeros(1, 9);
f1_tab = zeros(1, 9);

for i=1:length(iou_ths)

	iou_th = iou_ths(1, i)
	n_match = sum(sum(double(iou >= iou_th)));

	n_pos = iou_shape(1, 2);
	n_rel = iou_shape(1, 1);

	Pr = n_match / n_pos;
	Re = n_match / n_rel;

	f1 = 2 * (Re * Pr) / (Re + Pr);

	precision_tab(1, i) = Pr;
	recall_tab(1, i) = Re;
	f1_tab(1, i) = f1
end

metrics.precision = precision_tab;
metrics.recall = recall_tab;
metrics.f1 = f1_tab;
metrics.iou_th = iou_ths


% by sample metrics
n_pos = sum(pred);
n_rel = sum(label);

y_match = label + pred;

a = find(y_match == 2);
sizes = size(a)

n_match = sizes(1, 2);

metrics.by_sample_precision = n_match / n_pos;
metrics.by_sample_recall = n_match / n_rel;
metrics.by_sample_f1 = 2 * (by_sample_recall * by_sample_precision) / (by_sample_recall + by_sample_precision);


end