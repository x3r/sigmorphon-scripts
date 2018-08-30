# sigmorphon-scripts
Contains the scripts for running M2M and DirecTL+ for SIGMORPHON shared task

The first, convert2M2M.py takes 4 parameters:

python convert2M2M.py inFile outFile flip copy

inFile and outFile are self-expanatory, with inFile being the shared task file (you can run this script on dev and test, too, to prepare files for testing, although they require a little bit of post-processing afterwards).

"flip" is something we used for the EMNLP paper that flips multiwords across a space, and then chooses orderings that lead to better alignments; the code to do so is in the runM2M.sh script, but I would probably ignore it, to keep things simple (ie, set it to 'n')

"copy" creates copy instances in the training file.  This is important in low-data situations.

python convert2M2M.py spanish-train-low ES.train.m2m n y 

will create a file in M2M format (ie, with spaces between characters, tab separated, with tags formatted properly).

To create the dev file (or test file), you would need to do something like

python convert2M2M.py spanish-dev ES.dev n n

cut -f1 ES.dev | sed 's/ /:/g' > ES.dev.src
sed -i 's/ //g' ES.dev

This creates a source file to give to DTL, as well as a gold file to evaluate against. 

The second script, runM2M.sh, runs M2M with a number of different parameters.

I run m2m with several different parameter settings, because different languages run better under different alignments.  I've found that a 2-1-3 alignment works fairly well for most languages, so it might be a place to start.
However, if you're running a maxY of 1, you'll probably want to run the new alignment we developed for the EMNLP paper, so if you want to ignore all that, you can simply run maxX = 2, maxY = 2, maxTag = 3 (line 43 in the script).

This will produce an aligned m2m file that can be presented to DTL.  One note; some of the languages have reserved characters in their input.  Before aligning, replace any ":" and "_" with alternative characters, and then remember to change them back before submission.

runDTL.sh is like runM2M, looping over multiple values of cs and jointMgram to find the best parameters.

For both runDTL and runM2M, it loops over the language list that it finds in a file.  I've provided the language list from the 2017 shared task.

evaluate.py takes a gold file, a prediction file, and the name of an error file:

python evaluate.py ES.dev ES.preds ES.errors

ES.errors will be in the format that we like for analysis.
