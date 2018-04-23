function [f1, Pr, Re] = compute_f1(label, pred, sfreq, iou_th)

[pred_starts, pred_ends, pred_durations] = give_starts_ends(pred, sfreq);
[true_starts, true_ends, true_durations] = give_starts_ends(label, sfreq);

iou = compute_iou(true_starts, true_ends, pred_starts, pred_ends);
n_match = sum(sum(double(iou >= iou_th)));

iou_shape = size(iou);

n_pos = iou_shape(1, 2);
n_rel = iou_shape(1, 1);

Pr = n_match / n_pos;
Re = n_match / n_rel;

f1 = 2 * (Re * Pr) / (Re + Pr);

end