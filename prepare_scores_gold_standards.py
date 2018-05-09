from scipy.io import loadmat
import pandas as pd
import os

# # agregate scores for Wendt 2012
# path = "scores/wendt_2012"
# files = sorted(
#     [os.path.join(path, f) for f in os.listdir(path)
#      if "gold_standard" in f])

# scores = []
# for sf in files:
#     print(sf)
#     f = loadmat(sf)

#     gs = sf.split("gold_standard")[-1].split("_")[1]
#     fi = f["f1_{}".format(gs)][0][0]

#     record = sf.split("/")[-1].split(".")[0]

#     precision = fi[0]
#     recall = fi[1]
#     f1 = fi[2]
#     IoU = fi[3]
#     by_sample_precision = fi[4]
#     by_sample_recall = fi[5]
#     by_sample_f1 = fi[6]

#     s = pd.DataFrame()
#     s["precision"] = precision.squeeze()
#     s["recall"] = recall.squeeze()
#     s["f1"] = f1.squeeze()
#     s["IoU"] = IoU.squeeze()
#     s["by_sample_precision"] = by_sample_precision[0, 0]
#     s["by_sample_recall"] = by_sample_recall[0, 0]
#     s["by_sample_f1"] = by_sample_f1[0, 0]
#     s["record"] = record
#     s["evaluation"] = "record"
#     s["gold_standard"] = gs

#     scores.append(s)

# pd.concat(scores).to_csv("scores/wendt_2012_gold_standard.csv")

path = '/home/infres/schambon/Papers/mcsleep/scores/parekh_2017'
files = sorted(
    [os.path.join(path, f) for f in os.listdir(path)
     if "gold_standard" in f])


scores = []
for sf in files:
    print(sf)
    f = loadmat(sf)

    gs = sf.split("gold_standard")[-1].split("_")[2]

    for i in range(f["metrics_{}".format(gs)].shape[0]):
        for j in range(f["metrics_{}".format(gs)].shape[1]):
            fi = f["metrics_{}".format(gs)][i, j]

    # gs = sf.split("gold_standard")[-1].split("_")[2]
    # fi = f["metrics_{}".format(gs)][0][0]

            record = sf.split("/")[-1].split(".")[0].split("_")[-1]

            precision = fi[0]
            recall = fi[1]
            f1 = fi[2]
            IoU = fi[3]
            by_sample_precision = fi[4]
            by_sample_recall = fi[5]
            by_sample_f1 = fi[6]
            lam3 = fi[7][0]
            threshold = fi[8][0]

            s = pd.DataFrame()
            s["precision"] = precision.squeeze()
            s["recall"] = recall.squeeze()
            s["f1"] = f1.squeeze()
            s["IoU"] = IoU.squeeze()
            s["by_sample_precision"] = by_sample_precision[0, 0]
            s["by_sample_recall"] = by_sample_recall[0, 0]
            s["by_sample_f1"] = by_sample_f1[0, 0]
            s["lam3"] = lam3.squeeze()
            s["threshold"] = threshold.squeeze()
            s["record"] = record
            s["evaluation"] = "record"
            s["gold_standard"] = gs

            scores.append(s)

pd.concat(scores).to_csv("scores/parekh_2017_gold_standard.csv")
