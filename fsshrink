for i in *.mrc
do
e2proc2d.py $i ${i%%.mrc}_bin2.mrc --process math.fft.resample:n=2 
done
