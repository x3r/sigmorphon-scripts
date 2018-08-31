import sys
import codecs
import re


fIn = codecs.open(sys.argv[1], "r", "utf-8")
fOut = codecs.open(sys.argv[2], "w", "utf-8")
flip = sys.argv[3]
copy = sys.argv[4]
Accuracy = 0.0
Oracle = 0.0
MRR = 0.0
preds = {}
total = 0.0;
found = True 
counted = {}

for i in fIn:
    i = i.replace(" ", "!")
    i = i.replace(":", ";")
    parts = i.strip().split('\t')
    if(flip == "y"):
        flipParts = parts[1].split("!")
        if(len(flipParts) == 2):
           parts[1] = flipParts[1] + "@" + flipParts[0]
    tagParts = parts[2].split(";")
    finalTag = ""
    for j in range(1, len(tagParts)):
        finalTag += tagParts[j] + "." + tagParts[0] + ";"
    
    fOut.write(finalTag.strip().replace(";", "P* ") + "+ " + parts[0].replace(""," ").strip() + " + " + finalTag.strip().replace(";", "* ") + "\t" + parts[1].strip().replace(""," ").strip() + "\n")
    if(copy == "y"):
        fOut.write(parts[1].replace(""," ").strip() + "\t" + parts[1].replace(""," ").strip() + "\n")
fIn.close();
fOut.close();
