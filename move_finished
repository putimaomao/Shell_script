ls *DW.mrc | cat > f.txt
sed -e s/_motcor-1-33_DW.mrc/*/g -i f.txt
for i in `cat f.txt`
do
mv $i finished
done
