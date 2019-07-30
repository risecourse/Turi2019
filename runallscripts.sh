export PYRNUM=13
export TOTTRIALS=1 # paper figures used 10
export TOTRUNS=5 # paper figures used 5
export DURATION=1 # number of theta cycles for simulation length; paper figures used 172 for locomotion and reward, 113 for prelearning
export poisson_rate=5 # forbackground noise

# export CaseVal="Control No_VIPcells No_VIPCR No_VIPCCK No_VIPPVM No_VIPNVM No_VIPCRtoBC No_VIPCRtoOLM"
export CaseVal="Control"
export cellVal="_pvsoma_ _aacell_ _bcell_ _bscell_ _olm_ _vipcck_ _vipcr_ _vipcrnvm_"
export learningVal="prelearning locomotion reward"



######## Scripts to validate the model
# sh nrnval.sh # validate the neurons with a current sweep
# sh synval.sh # validate the synapses-------------------------------------------
# sh plotval.sh # Create the plots shown in Figure S7 (A-D)

######## Create the inputs for the model, both grid inputs
######## and background noise
sh createinputs.sh # Poisson level = 5

######## Run the prelearning and locomotion simulations
sh runseveral.sh

######## Analyze spiketimes
sh analyze.sh # First, one needs to extract the spiketimes for neurons and the paths in order to analyze them

######## Run the reward simulations
sh runreward.sh

######## Analyze and save plots
sh finalanalyze.sh
