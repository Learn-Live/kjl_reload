#!/bin/sh
### PYTHONPATH=../:./ taskset --cpu-list 0 python3.6 -u speedup/main_kjl_idv.py -d CTU1 -m "KJL-OCSVM(linear)" > speedup/out/"main_kjl_CTU1_KJL-OCSVM(linear)".txt 2>&1

echo "conduct experiments in a server named \"neno\""

### note: run xxx.sh out of the 'examples' directory, i.e. examples/reprst.sh
### keep 'the main function' still running after ending ssh session by execuate it in 'tumx'

# show current directory
echo 'PWD:' $PWD
### add root directory in PATH
PATH=$PATH:$PWD # add current directory to PATH
echo 'PATH:' $PATH

### run main function
exec_time=$(date +'%Y-%m-%d_%H:%M:%S')
echo $exec_time

##chmod 755 ./examples/mem_stats.sh
##./examples/mem_stats.sh > "mem_log_$(date +%Y-%m-%d_%H:%M:%S).txt" 2>&1 &
#./examples/mem_stats.sh > mem_log_${exec_time}.txt 2>&1 &
i=0
#for dataset in UNB345_3 CTU1 MAWI1_2020 MACCDC1 SFRIG1_2020 AECHO1_2020 DWSHR_WSHR_2020; do
#  for model in "OCSVM(rbf)"; do
#	for model in "OCSVM(rbf)" "KJL-OCSVM(linear)" "Nystrom-OCSVM(linear)" "KJL-GMM(full)" "KJL-GMM(diag)" "Nystrom-GMM(full)" \
#		"Nystrom-GMM(diag)"  "KJL-QS-GMM(full)" "KJL-QS-GMM(diag)" "Nystrom-QS-GMM(full)" "Nystrom-QS-GMM(diag)" "KJL-QS-init_GMM(full)" "KJL-QS-init_GMM(diag)" \
#		"Nystrom-QS-init_GMM(full)" "Nystrom-QS-init_GMM(diag)"; do
for dataset in UNB345_3 CTU1 MAWI1_2020 MACCDC1 SFRIG1_2020 AECHO1_2020 DWSHR_WSHR_2020; do
#  for model in "OCSVM(rbf)" "KJL-GMM(diag)" "Nystrom-GMM(diag)" \
#		 "KJL-QS-GMM(diag)"  "Nystrom-QS-GMM(diag)"  "KJL-QS-init_GMM(diag)"  \
#		"Nystrom-QS-init_GMM(diag)"; do
	for model in "OCSVM(rbf)" "KJL-GMM(full)" "Nystrom-GMM(full)" \
		 "KJL-QS-GMM(full)"  "Nystrom-QS-GMM(full)"  "KJL-QS-init_GMM(full)"  \
		"Nystrom-QS-init_GMM(full)"; do
		#  cd examples/
		#  echo ${dataset}
		echo 'PYTHONPATH=../:./ python3.7 -u speedup/main_kjl_idv.py -d' ${dataset}' -m '${model}' > speedup/out/main_kjl_'${dataset}'_'${model}'.txt 2>&1'
		PYTHONPATH=../:./ python3.7 -u speedup/main_kjl_idv.py -d ${dataset} -m ${model}> speedup/out/main_kjl_${dataset}_${model}.txt 2>&1

#echo 'PYTHONPATH=../:./ taskset --cpu-list '${i}' python3.7 -u speedup/main_kjl_idv.py -d' ${dataset}' -m '${model}' > speedup/out/main_kjl_'${dataset}'_'${model}'.txt 2>&1'
#		PYTHONPATH=../:./ taskset --cpu-list ${i} python3.7 -u speedup/main_kjl_idv.py -d ${dataset} -m ${model}> speedup/out/main_kjl_${dataset}_${model}.txt 2>&1
#		((i=i+1))
#		i=$(($i%30))



		# -u: write to file immediately
		# 2>&1: save stdout and stderr into a same file. I.e. > redirects stdout, 2>&1 redirects stderr to
		#       the same place as stdout
		# &: run in background

		#    status=$?   # only get the last process exitcode, and store exit status of grep to a variable 'status'
		#    echo 'exitcode:' $status
	done

done
# End of script
