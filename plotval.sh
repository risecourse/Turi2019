cd ValidationTests

NrnType="Axoaxonic Basket Bistratified OLM VIPCCK VIPCR Pyramidal"

for i in $NrnType
	do
		CMD="python synaptic_validation_plots.py $i"
		eval "$CMD"
	done

python synaptic_validation_plots.py EC_CA3


 