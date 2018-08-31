#!/bin/bash

filename='langList.txt'
dtlDir='~/tools/DTL/directlpCopy'

while read p; do
    parts=(${p//-/ })
    len=${#parts[@]}
    lang=${parts[0]}
    if [[ $len -gt 3 ]]; then
        for (( i = 1; i < $len-2; i++ )); do
            lang+="-${parts[i]}"
        done
    fi

    for i in `seq 1 5`;
    do
        let j=2*$i+1
        #echo $j
        for k in `seq 1 10`;
        do
       #Copy


		${dtlDir} --cs $i --ng $j --jointMgram $k --inChar : --outChar ' ' -t "../dev/"${lang}".dev.src" -a "../Results/"${lang}"/"${lang}$i$j$k"111BothNNC.out" -f "../alt/"${lang}/${lang}".111.alt" --mo "../Models/"${lang}"/"${lang}$i$j$k"111BothNNC.model" --copy &
		
		${dtlDir} --cs $i --ng $j --jointMgram $k --inChar : --outChar ' ' -t "../dev/"${lang}".dev.src" -a "../Results/"${lang}"/"${lang}$i$j$k"112BothNNC.out" -f "../alt/"${lang}/${lang}".112.alt" --mo "../Models/"${lang}"/"${lang}$i$j$k"112BothNNC.model" --copy &

		${dtlDir} --cs $i --ng $j --jointMgram $k --inChar : --outChar ' ' -t "../dev/"${lang}".dev.src" -a "../Results/"${lang}"/"${lang}$i$j$k"113BothNNC.out" -f "../alt/"${lang}/${lang}".113.alt" --mo "../Models/"${lang}"/"${lang}$i$j$k"113BothNNC.model"  --copy &
		
		${dtlDir} --cs $i --ng $j --jointMgram $k --inChar : --outChar ' ' -t "../dev/"${lang}".dev.src" -a "../Results/"${lang}"/"${lang}$i$j$k"211BothNNC.out" -f "../alt/"${lang}/${lang}".211.alt" --mo "../Models/"${lang}"/"${lang}$i$j$k"211BothNNC.model" --copy &
		
		${dtlDir} --cs $i --ng $j --jointMgram $k --inChar : --outChar ' ' -t "../dev/"${lang}".dev.src" -a "../Results/"${lang}"/"${lang}$i$j$k"212BothNNC.out" -f "../alt/"${lang}/${lang}".212.alt" --mo "../Models/"${lang}"/"${lang}$i$j$k"212BothNNC.model"  --copy &

		${dtlDir} --cs $i --ng $j --jointMgram $k --inChar : --outChar ' ' -t "../dev/"${lang}".dev.src" -a "../Results/"${lang}"/"${lang}$i$j$k"213BothNNC.out" -f "../alt/"${lang}/${lang}".213.alt" --mo "../Models/"${lang}"/"${lang}$i$j$k"213BothNNC.model" --copy &


		${dtlDir} --cs $i --ng $j --jointMgram $k --inChar : --outChar ' ' -t "../dev/"${lang}".dev.src" -a "../Results/"${lang}"/"${lang}$i$j$k"222BothNNC.out" -f "../alt/"${lang}/${lang}".222.alt" --mo "../Models/"${lang}"/"${lang}$i$j$k"222BothNNC.model" --copy &
		
		${dtlDir} --cs $i --ng $j --jointMgram $k --inChar : --outChar ' ' -t "../dev/"${lang}".dev.src" -a "../Results/"${lang}"/"${lang}$i$j$k"223BothNNC.out" -f "../alt/"${lang}/${lang}".223.alt" --mo "../Models/"${lang}"/"${lang}$i$j$k"223BothNNC.model" --copy &

		${dtlDir} --cs $i --ng $j --jointMgram $k --inChar : --outChar ' ' -t "../dev/"${lang}".dev.src" -a "../Results/"${lang}"/"${lang}$i$j$k"224BothNNC.out" -f "../alt/"${lang}/${lang}".224.alt" --mo "../Models/"${lang}"/"${lang}$i$j$k"224BothNNC.model" --copy &


        wait
        done 
    done
done < $filename
