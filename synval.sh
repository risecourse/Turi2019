cd ValidationTests

NrnType="Axoaxonic Basket Bistratified OLM VIPCCK VIPCR"

for i in $NrnType
	do
		CMD="../x86_64/special synaptic_validation_$i.hoc"
		eval "$CMD"
	done

../x86_64/special synaptic_validation_Pyramidal.hoc
../x86_64/special synaptic_validation_Pyramidal_NMDA.hoc
 