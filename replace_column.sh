## replace column with 5.000000  print out to new file (combined_for_C60_shrink1.star)

awk '{ if (NF<3) {print} else {$12 = "5.000000" ; print}}' zz_merged_grouped.star > combine_all.star  #NR<3 skip header
