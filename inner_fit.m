function f1 = inner_fit(params, lam3)
	params.lam3 = lam3

	p = parpool('local', 12); 
	pred = analyzeSpindles(params);
	f1 = compute_f1(params.label, pred, params.sfreq, params.iou_th);

	delete(gcp('nocreate'))

end