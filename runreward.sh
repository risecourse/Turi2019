
 for i in `seq 0 7`
	do
	for j in `seq 1 $TOTRUNS`
		do
			CMD="x86_64/special -nogui -c n_runs=$j -c n_trials=1 -c n_neuron=$i -c duration=$DURATION -c pyrcellnum=$PYRNUM Network_reward.hoc"
			eval "$CMD"
		done
	done