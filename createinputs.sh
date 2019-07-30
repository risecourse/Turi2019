cd make_inputs_linear_track

for j in `seq 1 $TOTRUNS`
	do
		CMD="python3 make_grid_like_inputs_prelearning.py $j"
		eval "$CMD"
		CMD="python3 make_grid_like_inputs_speed_mod.py $j"
		eval "$CMD"
	done


for j in `seq 1 $TOTRUNS`
	do
		CMD="python3 glim_v2_prelearning.py $j"
		eval "$CMD"
		CMD="python3 glim_v2_speed_mod.py $j pos"
		eval "$CMD"
		CMD="python3 glim_v2_speed_mod.py $j neg"
		eval "$CMD"
	done

cd ../background_noise

python3 poisson_input.py $TOTRUNS $poisson_rate

