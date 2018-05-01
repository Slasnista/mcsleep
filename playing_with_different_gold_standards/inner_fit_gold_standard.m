function [metrics_E1, metrics_E2, metrics_union, metrics_intersection] = inner_fit_gold_standard(params, lam3, Threshold)
	params.lam3 = lam3;
	params.Threshold = Threshold

	pred = analyzeSpindles(params);

	metrics_E1 = compute_f1(params.E1, pred, params.sfreq)
	metrics_E2 = compute_f1(params.E2, pred, params.sfreq)
	metrics_union = compute_f1(params.union, pred, params.sfreq)
	metrics_intersection = compute_f1(params.intersection, pred, params.sfreq)

	metrics_E1.lam3 = lam3;
	metrics_E1.Threshold = Threshold;

	metrics_E2.lam3 = lam3;
	metrics_E2.Threshold = Threshold;

	metrics_union.lam3 = lam3;
	metrics_union.Threshold = Threshold;

	metrics_intersection.lam3 = lam3;
	metrics_intersection.Threshold = Threshold;

end