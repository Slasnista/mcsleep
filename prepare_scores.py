from scipy.io import loadmat
import pandas as pd


record = "01-02-0002"
f = loadmat("scores_01-02-0002.mat")

scores = []

for i in range(f["metrics"].shape[0]):
    fi = f["metrics"][i, 0]

    precision = fi[0][0]
    recall = fi[1][0]
    f1 = fi[2][0]
    iou_th = fi[3][0]
    lam3 = fi[4][0]
    threshold = fi[5][0]

    s = pd.DataFrame()
    s["precision"] = precision.squeeze()
    s["recall"] = recall.squeeze()
    s["f1"] = f1.squeeze()
    s["iou_th"] = iou_th.squeeze()
    s["lam3"] = lam3.squeeze()
    s["threshold"] = threshold.squeeze()
    s["record"] = record

    scores.append(s)

scores = pd.concat(scores)
