cd AnalysisRawData

for cell in cellVal
	for learn in learningVal
		do
		for i in $CaseVal
			do
			for j in `seq 1 $TOTRUNS`
				do
					CMD="python3 spiketimes_analysis.py _$cell_ $learningVal $i $TOTTRIALS $j"
					eval "$CMD"
				done
			done
		done
	done
	
for j in `seq 1 $TOTRUNS`
	do
		CMD="python3 all_path_all_spiketimes.py prelearning  $j"
		eval "$CMD"
		CMD="python3 all_path_all_spiketimes.py locomotion  $j"
		eval "$CMD"
	done
