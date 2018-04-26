from scipy.io import loadmat
import pandas as pd
import os

# agregate scores for Wendt 2012
path = "scores/wendt_2012"
files = sorted(
    [os.path.join(path, f) for f in os.listdir(path)
     if "f1_n2" not in f])

scores = []
for sf in files:
    print(sf)
    f = loadmat(sf)
    fi = f["f1"][0][0]

    record = sf.split("/")[-1].split(".")[0]

    precision = fi[0]
    recall = fi[1]
    f1 = fi[2]
    IoU = fi[3]
    by_sample_precision = fi[4]
    by_sample_recall = fi[5]
    by_sample_f1 = fi[6]

    s = pd.DataFrame()
    s["precision"] = precision.squeeze()
    s["recall"] = recall.squeeze()
    s["f1"] = f1.squeeze()
    s["IoU"] = IoU.squeeze()
    s["by_sample_precision"] = by_sample_precision[0, 0]
    s["by_sample_recall"] = by_sample_recall[0, 0]
    s["by_sample_f1"] = by_sample_f1[0, 0]
    s["record"] = record
    s["evaluation"] = "record"

    scores.append(s)

# scores = pd.concat(scores)
# scores.to_csv("scores/wendt_2012.csv")

path = "scores/wendt_2012"
files = sorted(
    [os.path.join(path, f) for f in os.listdir(path)
     if "f1_n2" in f])

for sf in files:
    print(sf)
    f = loadmat(sf)
    fi = f["f1_n2"][0][0]

    record = sf.split("f1_n2")[-1].split(".")[0]

    precision = fi[0]
    recall = fi[1]
    f1 = fi[2]
    IoU = fi[3]
    by_sample_precision = fi[4]
    by_sample_recall = fi[5]
    by_sample_f1 = fi[6]

    s = pd.DataFrame()
    s["precision"] = precision.squeeze()
    s["recall"] = recall.squeeze()
    s["f1"] = f1.squeeze()
    s["IoU"] = IoU.squeeze()
    s["by_sample_precision"] = by_sample_precision[0, 0]
    s["by_sample_recall"] = by_sample_recall[0, 0]
    s["by_sample_f1"] = by_sample_f1[0, 0]
    s["record"] = record
    s["evaluation"] = "N2"

    scores.append(s)

scores = pd.concat(scores)
scores.to_csv("scores/wendt_2012.csv")


path = "scores/parekh_2017/"
files = sorted(
    [os.path.join(path, f_) for f_ in os.listdir(path)
     if f_.startswith("metrics_N2")])

scores = []
for sf in files:
    # record = "01-02-0002"
    f = loadmat(sf)

    record = sf.split("/")[-1].split(".")[0].split("_")[-1]

    for i in range(f["metrics"].shape[0]):
        for j in range(f["metrics"].shape[1]):
            fi = f["metrics"][i, j]

            precision = fi[0][0]
            recall = fi[1][0]
            f1 = fi[2][0]
            iou_th = fi[3][0]
            by_sample_precision = fi[4]
            by_sample_recall = fi[5]
            by_sample_f1 = fi[6]
            lam3 = fi[7][0]
            threshold = fi[8][0]

            s = pd.DataFrame()
            s["precision"] = precision.squeeze()
            s["recall"] = recall.squeeze()
            s["f1"] = f1.squeeze()
            s["IoU"] = iou_th.squeeze()
            s["by_sample_precision"] = by_sample_precision[0, 0]
            s["by_sample_recall"] = by_sample_recall[0, 0]
            s["by_sample_f1"] = by_sample_f1[0, 0]
            s["lam3"] = lam3.squeeze()
            s["threshold"] = threshold.squeeze()
            s["record"] = record

            scores.append(s)


files = sorted(
    [os.path.join(path, f_) for f_ in os.listdir(path)
     if f_.startswith("metrics_N2")])

for sf in files:
    # record = "01-02-0002"
    f = loadmat(sf)

    record = sf.split("/")[-1].split(".")[0].split("_")[-1]

    for i in range(f["metrics_n2"].shape[0]):
        for j in range(f["metrics_n2"].shape[1]):
            fi = f["metrics_n2"][i, j]

            precision = fi[0][0]
            recall = fi[1][0]
            f1 = fi[2][0]
            iou_th = fi[3][0]
            by_sample_precision = fi[4]
            by_sample_recall = fi[5]
            by_sample_f1 = fi[6]
            lam3 = fi[7][0]
            threshold = fi[8][0]

            s = pd.DataFrame()
            s["precision"] = precision.squeeze()
            s["recall"] = recall.squeeze()
            s["f1"] = f1.squeeze()
            s["IoU"] = iou_th.squeeze()
            s["by_sample_precision"] = by_sample_precision[0, 0]
            s["by_sample_recall"] = by_sample_recall[0, 0]
            s["by_sample_f1"] = by_sample_f1[0, 0]
            s["lam3"] = lam3.squeeze()
            s["threshold"] = threshold.squeeze()
            s["record"] = record

            scores.append(s)


scores = pd.concat(scores)
scores.to_csv("scores/parekh_2017.csv")
