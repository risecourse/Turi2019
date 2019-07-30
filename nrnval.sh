cd ValidationTests

NrnType="Axoaxonic Basket Bistratified OLM IPCR Pyramidal"

for i in $NrnType
	do
	for j in $(seq -0.20 0.1 0.40)
		do
			CMD="../x86_64/special -c icurrent=$j IinjectionAt$i.hoc"
			eval "$CMD"
		done
	done
	
	