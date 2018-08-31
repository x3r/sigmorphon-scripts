#!/bin/bash

filename='langList.txt'
m2mDir='/local/chauvin2/riyadh/morph18/tools/m2m/m2m-aligner'


while read p; do
    parts=(${p//-/ })
    len=${#parts[@]}
    lang=${parts[0]}
    if [[ $len -gt 3 ]]; then
        for (( i = 1; i < $len-2; i++ )); do
            lang+="-${parts[i]}"
        done
    fi
    
    ${m2mDir} --maxX 2 --maxY 2 --maxTag 2 --copy --delX --maxFn conYX --pScore --errorInFile -i "../alt/"${lang}/${lang}.m2m -o "../alt/"${lang}/${lang}.222A.alt &
    ${m2mDir} --maxX 2 --maxY 2 --maxTag 2 --copy --delX --maxFn conYX --pScore --errorInFile -i "../alt/"${lang}/${lang}.flip -o "../alt/"${lang}/${lang}.222B.alt &
    paste "../alt/"${lang}/${lang}.222A.alt "../alt/"${lang}/${lang}.222B.alt > "../alt/"${lang}/${lang}-temp.222.alt
    python3 chooseAlignment.py "../alt/"${lang}/${lang}-temp.222.alt "../alt/"${lang}/${lang}.222.alt

    ${m2mDir} --maxX 2 --maxY 2 --maxTag 3 --copy --delX --maxFn conYX --pScore --errorInFile -i "../alt/"${lang}/${lang}.m2m -o "../alt/"${lang}/${lang}.223A.alt &
    ${m2mDir} --maxX 2 --maxY 2 --maxTag 3 --copy --delX --maxFn conYX --pScore --errorInFile -i "../alt/"${lang}/${lang}.flip -o "../alt/"${lang}/${lang}.223B.alt &
    paste "../alt/"${lang}/${lang}.223A.alt "../alt/"${lang}/${lang}.223B.alt > "../alt/"${lang}/${lang}-temp.223.alt
    python3 chooseAlignment.py "../alt/"${lang}/${lang}-temp.223.alt "../alt/"${lang}/${lang}.223.alt
    
    ${m2mDir} --maxX 2 --maxY 2 --maxTag 4 --copy --delX --maxFn conYX --pScore --errorInFile -i "../alt/"${lang}/${lang}.m2m -o "../alt/"${lang}/${lang}.224A.alt &
    ${m2mDir} --maxX 2 --maxY 2 --maxTag 4 --copy --delX --maxFn conYX --pScore --errorInFile -i "../alt/"${lang}/${lang}.flip -o "../alt/"${lang}/${lang}.224B.alt &
    paste "../alt/"${lang}/${lang}.224A.alt "../alt/"${lang}/${lang}.224B.alt > "../alt/"${lang}/${lang}-temp.224.alt
    python3 chooseAlignment.py "../alt/"${lang}/${lang}-temp.224.alt "../alt/"${lang}/${lang}.224.alt
    
   
    ${m2mDir} --maxX 2 --maxY 1 --maxTag 2 --copy --delX --delY --maxFn conYX --pScore --errorInFile -i "../alt/"${lang}/${lang}.m2m -o "../alt/"${lang}/${lang}.212A.alt &
    ${m2mDir} --maxX 2 --maxY 1 --maxTag 2 --copy --delX --delY --maxFn conYX --pScore --errorInFile -i "../alt/"${lang}/${lang}.flip -o "../alt/"${lang}/${lang}.212B.alt &
    paste "../alt/"${lang}/${lang}.212A.alt "../alt/"${lang}/${lang}.212B.alt > "../alt/"${lang}/${lang}-temp.212.alt
    python3 chooseAlignment.py "../alt/"${lang}/${lang}-temp.212.alt "../alt/"${lang}/${lang}.212.alt

    ${m2mDir} --maxX 1 --maxY 1 --maxTag 2 --copy --delX --delY --maxFn conYX --pScore --errorInFile -i "../alt/"${lang}/${lang}.m2m -o "../alt/"${lang}/${lang}.112A.alt &
    ${m2mDir} --maxX 1 --maxY 1 --maxTag 2 --copy --delX --delY --maxFn conYX --pScore --errorInFile -i "../alt/"${lang}/${lang}.flip -o "../alt/"${lang}/${lang}.112B.alt &
    paste "../alt/"${lang}/${lang}.112A.alt "../alt/"${lang}/${lang}.112B.alt > "../alt/"${lang}/${lang}-temp.112.alt
    python3 chooseAlignment.py "../alt/"${lang}/${lang}-temp.112.alt "../alt/"${lang}/${lang}.112.alt
   
    ${m2mDir} --maxX 2 --maxY 1 --maxTag 3 --copy --delX --delY --maxFn conYX --pScore --errorInFile -i "../alt/"${lang}/${lang}.m2m -o "../alt/"${lang}/${lang}.213A.alt &
    ${m2mDir} --maxX 2 --maxY 1 --maxTag 3 --copy --delX --delY --maxFn conYX --pScore --errorInFile -i "../alt/"${lang}/${lang}.flip -o "../alt/"${lang}/${lang}.213B.alt &
    paste "../alt/"${lang}/${lang}.213A.alt "../alt/"${lang}/${lang}.213B.alt > "../alt/"${lang}/${lang}-temp.213.alt
    python3 chooseAlignment.py "../alt/"${lang}/${lang}-temp.213.alt "../alt/"${lang}/${lang}.213.alt
    
    ${m2mDir} --maxX 1 --maxY 1 --maxTag 3 --copy --delX --delY --maxFn conYX --pScore --errorInFile -i "../alt/"${lang}/${lang}.m2m -o "../alt/"${lang}/${lang}.113A.alt &
    ${m2mDir} --maxX 1 --maxY 1 --maxTag 3 --copy --delX --delY --maxFn conYX --pScore --errorInFile -i "../alt/"${lang}/${lang}.flip -o "../alt/"${lang}/${lang}.113B.alt &
    paste "../alt/"${lang}/${lang}.113A.alt "../alt/"${lang}/${lang}.113B.alt > "../alt/"${lang}/${lang}-temp.113.alt
    python3 chooseAlignment.py "../alt/"${lang}/${lang}-temp.113.alt "../alt/"${lang}/${lang}.113.alt

    ${m2mDir} --maxX 2 --maxY 1 --maxTag 1 --copy --delY --delX --maxFn conYX --pScore --errorInFile -i "../alt/"${lang}/${lang}.m2m -o "../alt/"${lang}/${lang}.211A.alt &
    ${m2mDir} --maxX 2 --maxY 1 --maxTag 1 --copy --delY --delX --maxFn conYX --pScore --errorInFile -i "../alt/"${lang}/${lang}.flip -o "../alt/"${lang}/${lang}.211B.alt &
    paste "../alt/"${lang}/${lang}.211A.alt "../alt/"${lang}/${lang}.211B.alt > "../alt/"${lang}/${lang}-temp.211.alt
    python3 chooseAlignment.py "../alt/"${lang}/${lang}-temp.211.alt "../alt/"${lang}/${lang}.211.alt
    
    ${m2mDir} --maxX 1 --maxY 1 --maxTag 1 --copy --delY --delX --maxFn conYX --pScore --errorInFile -i "../alt/"${lang}/${lang}.m2m -o "../alt/"${lang}/${lang}.111A.alt &
    ${m2mDir} --maxX 1 --maxY 1 --maxTag 1 --copy --delY --delX --maxFn conYX --pScore --errorInFile -i "../alt/"${lang}/${lang}.flip -o "../alt/"${lang}/${lang}.111B.alt &
    paste "../alt/"${lang}/${lang}.111A.alt "../alt/"${lang}/${lang}.111B.alt > "../alt/"${lang}/${lang}-temp.111.alt
    python3 chooseAlignment.py "../alt/"${lang}/${lang}-temp.111.alt "../alt/"${lang}/${lang}.111.alt

    wait


done < $filename
