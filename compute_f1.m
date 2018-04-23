function [f1, Pr, Re] = compute_f1(label, pred, sfreq)

[pred_starts, pred_ends, pred_durations] = give_starts_ends(pred, sfreq);
[true_starts, true_ends, true_durations] = give_starts_ends(label, sfreq);

iou = compute_iou(true_starts, true_ends, pred_starts, pred_ends);

iou_shape = size(iou);

iou_ths = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9];

Pr = zeros(1, 10);
Re = zeros(1, 10);
f1 = zeros(1, 10);
for i=1:length(iou_th)


	n_match = sum(sum(double(iou >= iou_th)));

	n_pos = iou_shape(1, 2);
	n_rel = iou_shape(1, 1);

	Pr(1, i) = n_match / n_pos;
	Re(1, i) = n_match / n_rel;

	f1(1, i) = 2 * (Re * Pr) / (Re + Pr);

end