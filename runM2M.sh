#!/bin/bash

filename='langList.txt'
m2mDir='~/tools/m2m/m2m-aligner'


while read p; do
    parts=(${p//-/ })
    len=${#parts[@]}
    lang=${parts[0]}
    if [[ $len -gt 3 ]]; then
        for (( i = 1; i < $len-2; i++ )); do
            lang+="-${parts[i]}"
        done
    fi

    ${m2mDir} --maxX 2 --maxY 2 --maxTag 2 --copy --delX --maxFn conYX -i "../alt/"${lang}/${lang}.m2m -o "../alt/"${lang}/${lang}.222.alt &
    ${m2mDir} --maxX 2 --maxY 2 --maxTag 3 --copy --delX --maxFn conYX -i "../alt/"${lang}/${lang}.m2m -o "../alt/"${lang}/${lang}.223.alt &
    ${m2mDir} --maxX 2 --maxY 2 --maxTag 4 --copy --delX --maxFn conYX -i "../alt/"${lang}/${lang}.m2m -o "../alt/"${lang}/${lang}.224.alt &
    
   
    ${m2mDir} --maxX 2 --maxY 1 --maxTag 2 --copy --delX --delY --maxFn conYX -i "../alt/"${lang}/${lang}.m2m -o "../alt/"${lang}/${lang}.212.alt &
    ${m2mDir} --maxX 1 --maxY 1 --maxTag 2 --copy --delX --delY --maxFn conYX -i "../alt/"${lang}/${lang}.m2m -o "../alt/"${lang}/${lang}.112.alt &
   
    ${m2mDir} --maxX 2 --maxY 1 --maxTag 3 --copy --delX --delY --maxFn conYX -i "../alt/"${lang}/${lang}.m2m -o "../alt/"${lang}/${lang}.213.alt &
    ${m2mDir} --maxX 1 --maxY 1 --maxTag 3 --copy --delX --delY --maxFn conYX -i "../alt/"${lang}/${lang}.m2m -o "../alt/"${lang}/${lang}.113.alt &

    ${m2mDir} --maxX 2 --maxY 1 --maxTag 1 --copy --delY --delX --maxFn conYX -i "../alt/"${lang}/${lang}.m2m -o "../alt/"${lang}/${lang}.211.alt &
    ${m2mDir} --maxX 1 --maxY 1 --maxTag 1 --copy --delY --delX --maxFn conYX -i "../alt/"${lang}/${lang}.m2m -o "../alt/"${lang}/${lang}.111.alt &
 
    wait


done < $filename
