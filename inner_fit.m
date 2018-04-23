function f1 = inner_fit(params, lam3, Threshold)
	params.lam3 = lam3;
	params.Threshold = Threshold

	p = parpool('local', 12); 
	pred = analyzeSpindles(params);
	[f1, Pr, Re] = compute_f1(params.label, pred, params.sfreq, params.iou_th);

	delete(gcp('nocreate'))

end