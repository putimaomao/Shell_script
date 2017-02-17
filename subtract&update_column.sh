#!/usr/bin/env csh
#
if ($# != 3) then 
 echo 'Usage:    ' $0 ' run1_data.star particles_newctf.star  run1_data_newctf.star'
 echo 'Where run1_data.star is a selection of an originally larger data set of the averaged particles.'
 echo 'The input particles_newcft.star contains the particles with new ctf value.'
 echo 'The output run1_data_newctf.star will apply new ctf values to run1_data.star.'
 echo 'have fun of updating column value You can update any column as you want by change column number below'
else

 set star_selected_particles=$1
 set star_all_movies_frame=$2
 set star_updated_selected_particles=$3
 awk '{if (NF > 3) exit; print }' < ${star_selected_particles} > ${star_updated_selected_particles}

 relion_star_printtable ${star_selected_particles} data_ rlnImageName > temp1.dat
foreach p (`cat temp1.dat`)
   grep $p ${star_all_movies_frame}  >> temp2.dat
echo -n "."
end
grep 'Particles' ${star_selected_particles} > temp3.dat
awk 'FNR==NR{a[NR]=$5;next}{$5=a[FNR]}1' temp2.dat temp3.dat > temp4.dat
awk 'FNR==NR{a[NR]=$6;next}{$6=a[FNR]}1' temp2.dat temp4.dat > temp5.dat
awk 'FNR==NR{a[NR]=$7;next}{$7=a[FNR]}1' temp2.dat temp5.dat > temp6.dat

#awk 'FNR==NR{a[NR]=$5;b[NR]=$6;c[NR]=$7;next}{$5=a[FNR];$6=b[FNR];$7=c[FNR]}1' temp2.dat temp3.dat > temp4.dat
#cat temp4.dat >> ${star_updated_selected_particles}

cat temp6.dat >> ${star_updated_selected_particles}
 echo "done!"
endif
