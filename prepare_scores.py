from scipy.io import loadmat
import pandas as pd


f = loadmat("scores_01-02-0002.mat")

scores = []
fi = f["metrics"][0, 0]

precision = fi[0][0]
recall = fi[1][0]
f1 = fi[2][0]
iou_th = fi[3][0]
lam3 = fi[4][0]
threshold = fi[5][0]
record = str(fi[6][0])

    s = pd.DataFrame()
    s["precision"] = precision.squeeze()[:-1]
    s["recall"] = recall.squeeze()[:-1]
    s["f1"] = f1.squeeze()[:-1]
    s["iou_th"] = iou_th.squeeze()
    s["lam3"] = lam3.squeeze()
    s["threshold"] = threshold.squeeze()
    s["record"] = record.squeeze()

    scores.append(s)

scores = pd.concat(scores)