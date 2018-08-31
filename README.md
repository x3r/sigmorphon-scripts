# sigmorphon-scripts

The scripts were originally developed by Dr. Garrett Nicolai.

DirecTL+(DTL) and M2M-aligner(M2M) can be downloaded from https://github.com/GarrettNicolai/DTL and https://github.com/GarrettNicolai/m2m, respectively.

### How to use the scripts

The first, `convert2M2M.py` takes 4 parameters:

```
python convert2M2M.py inFile outFile flip copy
```

`inFile` and `outFile` are self-expanatory, with inFile being the shared task file (you can run this script on dev and test, too, to prepare files for testing, although they require a little bit of post-processing afterwards).

"flip" is used for flipping multiwords across a space, and then chooses orderings that lead to better alignments; however, it can be ignored here for the simplicity.

"copy" creates copy instances in the training file.  This is important in low-data situations.

```
python convert2M2M.py spanish-train-low ES.train.m2m n y 
```

will create a file in `M2M` format (ie, with spaces between characters, tab separated, with tags formatted properly).

To create the dev file (or test file), you would need to do something like-

```
python convert2M2M.py spanish-dev ES.dev n n

cut -f1 ES.dev | sed 's/ /:/g' > ES.dev.src
sed -i 's/ //g' ES.dev
```

This creates a source file to give to `DTL`, as well as a gold file to evaluate against. 

The second script, `runM2M.sh`, runs `M2M` with a number of different parameters, because different languages run better under different alignments.

This will produce an aligned m2m file that can be presented to `DTL`.  
One note; some of the languages have reserved characters in their input.  Before aligning, replace any ":" and "_" with alternative characters, and then remember to change them back before submission.

`runDTL.sh` is like runM2M, looping over multiple values of `cs` and `jointMgram` to find the best parameters.

For both runDTL and runM2M, it loops over the language list that it finds in a file (such as `langlist.txt`).

`evaluate.py` takes a gold file, a prediction file, and the name of an error file:

```
python evaluate.py ES.dev ES.preds ES.errors
```

`ES.errors` will be in the format that is suitable for analysis.
