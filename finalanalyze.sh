cd AnalysisRawData

for i in $CaseVal
	do
	for cell in $cellVal
		do
		for learn in $learningVal
		do
			for j in `seq 1 $TOTRUNS`
				do
					CMD="python3 spiketimes_analysis.py $cell $learn $i $TOTTRIALS $j"
					eval "$CMD"
				done
			done
		done
	done

	
j=5
CMD="python3 all_path_all_spiketimes.py prelearning  $j"
eval "$CMD"
CMD="python3 all_path_all_spiketimes.py reward  $j"
eval "$CMD"

for i in $StringVal
	do
	for learn in $learningVal
		do
		CMD="python3 heatmaps.py $TOTTRIALS $i $learn $PYRNUM"
		eval "$CMD"
		for cell in $cellVal
			do
				CMD="python3 heatmaps_interneurons.py $TOTTRIALS $i $learn $cell $PYRNUM"
				eval "$CMD"
			done			
		done
	done

python3 plasticity_indices.py $PYRNUM

python3 all_trials_paper_all.py $PYRNUM
python3 all_trials_paper_all_interneurons.py $TOTTRIALS
python3 all_trials_enrichment.py $PYRNUM $TOTTRIALS