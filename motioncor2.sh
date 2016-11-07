#BSUB -J inf       
#BSUB -L /bin/bash
##BSUB -x
#BSUB -W 72:00           ## sets to 24 hours the job's runtime wall-clock limit.
#BSUB -n 1
#BSUB -R "span[ptile=1]"       ## 20:  number of cores/cpus per node to use
#BSUB -R "rusage[mem=128000]"      ## 20:  number of cores/cpus per node to use
#BSUB -R "select[gpu256gb]"      ## 20:  number of cores/cpus per node to use
#BSUB -o stdout1.%J       ## directs the job's standard output to stdout1.jobid
#BSUB -P 082785330218         ## charges the consumed service units (SUs) to project1.
#

module purge
module load CUDA/7.5.18

source ~/.bashrc

for i in *.mrc
do
MotionCor2 -InMrc $i -OutMrc ${i%%.mrc}_motcor-1-33.mrc -Patch 5 5 -Iter 10 -Tol 0.5 -Kv 200 -PixSize 0.625 -FmDose 1.14 -FtBin 2 > ${i%%.mrc}_mot-1-33.log
done
