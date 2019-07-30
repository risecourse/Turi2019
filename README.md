# Turi2019
# README file for Turi et al, 2018 Vasoactive intestinal polypeptide-expressing interneurons in the hippocampus support goal-oriented spatial learning
# for more information, refer to the comments inside the scripts or contact me in: chavlis [DOT] spiros [AT] gmail [DOT] com
# Scripts' author: S. Chavlis, PhD

# The whole model script system can be executed by calling a series of shell scripts that have been pulled together into one:
runallscripts.sh

# First it defines some global variables and then it calls the scripts with the necessary arguments for each argument (cell type, condition, run, learning type)

export PYRNUM=13 # number of pyramidal cells. Full size = 130
export TOTTRIALS=1 # number of trials; paper figures use 10
export TOTRUNS=5 # number of runs; paper figures use 5
export DURATION=1 # number of theta cycles for simulation length; paper figures use 172 for locomotion and reward, 113 for prelearning
export poisson_rate=5 # setting for background noise

# export CaseVal="Control No_VIPcells No_VIPCR No_VIPCCK No_VIPPVM No_VIPNVM No_VIPCRtoBC No_VIPCRtoOLM" # different conditions
export CaseVal="Control" # choosing only to run and plot the control condition
export cellVal="_pvsoma_ _aacell_ _bcell_ _bscell_ _olm_ _vipcck_ _vipcr_ _vipcrnvm_" # different cell types
export learningVal="prelearning locomotion reward" # learning types



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
