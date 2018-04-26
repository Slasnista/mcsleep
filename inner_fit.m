function [metrics, metrics_n2] = inner_fit(params, lam3, Threshold)
	params.lam3 = lam3;
	params.Threshold = Threshold

	
	pred = analyzeSpindles(params);
	metrics = compute_f1(params.label, pred, params.sfreq);

	metrics.lam3 = lam3;
	metrics.Threshold = Threshold;

	label_n2 = params.label;
  	pred_n2 = pred;

  	idx_non_n2 = find(params.N2 == 0);
  	label_n2(idx_non_n2) = 0;
  	pred_n2(idx_non_n2) = 0;

  	metrics_n2 = compute_f1(label_n2, pred_n2, params.sfreq)

end