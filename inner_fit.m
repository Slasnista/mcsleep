function metrics = inner_fit(params, lam3, Threshold)
	params.lam3 = lam3;
	params.Threshold = Threshold

	
	pred = analyzeSpindles(params);
	metrics = compute_f1(params.label, pred, params.sfreq);

	metrics.lam3 = lam3;
	metrics.Threshold = Threshold;

	

end