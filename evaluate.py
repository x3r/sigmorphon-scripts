import sys
import codecs
import re


fGold = codecs.open(sys.argv[1], "r", "utf-8")
fPred = codecs.open(sys.argv[2], "r", "utf-8")
fOut = codecs.open(sys.argv[3], "w", "utf-8")

flag = ""
if(len(sys.argv) > 4):
    flag = "*"
Accuracy = 0.0
Oracle = 0.0
MRR = 0.0
preds = {}
total = 0.0;
found = True 
counted = {}
topN = []


for i in fGold:
    i = i.strip().replace("!", " ").strip()
    parts = i.strip().split("\t")
    if parts[0] not in preds.keys():
       preds[parts[0].strip()] = []
    preds[parts[0].strip()].append(parts[1].strip())


for i in fPred:
    parts = i.strip().split("\t")

    if len(parts) == 0:
        if(found == False):
            fOut.write(input + u"\t" + ','.join(preds[input]) + u"\t" + u'-')  
            counted[input] = True
        continue
    if len(parts) == 1:
        if(found == False):
            fOut.write(input + u"\t" + ','.join(preds[input]) + u"\t" + u'-')  
            counted[input] = True
        fOut.write("\t" + ",".join(topN) + "\n")  
        del topN[:]
        continue
    input = parts[0].replace("_","").replace("|","").replace("!", " ").strip()
    output = parts[1].replace("_","").replace("|","").replace("@@","@").replace("!"," ").strip()
    if("@" in output):
        flipParts = output.split("@")
        if(len(flipParts) == 2):
             output = flipParts[1] + " " + flipParts[0]
    topN.append(output)
    if input in counted.keys():
        continue
    if parts[2] == '1':
        total += 1
        found = False

    if found == False and output in preds[input]:
        MRR = MRR + (1 / float(parts[2]))
        found = True
        if parts[2] == '1':
            fOut.write(input + u"\t" + ','.join(preds[input]) + u"\t" + u'+')
            Accuracy = Accuracy + 1
        else:
            fOut.write(input + u"\t" + ','.join(preds[input]) + u"\t" + u'#')
     
        Oracle = Oracle + 1 
        counted[input] = True
if(found == False):
    fOut.write(input + u"\t" + ','.join(preds[input]) + u"\t" + u'-')
    fOut.write("\t" + ",".join(topN) + "\n")  
    counted[input] = True

Accuracy = Accuracy / total
Oracle = Oracle / total
MRR = MRR / total
print("Accuracy:\t" + str(Accuracy) + "\t" + sys.argv[2] + "\n")
print("Oracle" + flag + ":\t" + str(Oracle) + "\t" + sys.argv[2] + "\n")
print("MRR:\t" + str(MRR) + "\t" + sys.argv[2] + "\n")




fGold.close();
fPred.close();
fOut.close();
