for i in *.box
do
awk 'BEGIN{FS=OFS=" "}{print int($1/1.02796) " " int($2/1.02796) " " $3 " " $4}' $i > ${i%%.box}_rescale.box
done
