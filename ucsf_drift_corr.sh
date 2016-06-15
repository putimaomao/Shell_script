for i in *.mrc
do
dosefgpu_driftcorr $i -bin 2 -bft 300 -pbx 96 -fod 3 -ssc 1       # bin2 is for super-resolution data
done

#         PTION     VALUE(Default)    Introduction  
#         -crx       0                 Image crop offset X
#         -cry       0                 Image crop offset Y
#         -cdx       0                 Image crop dimension X. 0: Use maximum size.
#         -cdy       0                 Image crop dimension Y. 0: Use maximum size.
#         -bin       1                 1 or 2. Bin stack before processing, only 1x and 2x binning
#         -nst       0                 First frame (0-base) used in alignment.
#         -ned       0                 Last frame (0-base) used in alignment. 0: Use maximum value.
#         -nss       0                 First frame (0-base) used for final sum.
#         -nes       0                 Last frame (0-base) used for final sum. 0: Use maximum value.
#         -gpu       0                 GPU device ID.
#         -bft       150               BFactor in pix^2.
#         -pbx       96                Box dimension for searching CC peak.
#         -fod       2                 Number of frame offset for frame comparision.
#         -nps       0                 Radius of noise peak.
#         -kit       1.0               Threshold of alignment error in pixel.
#         -fgr       FileName.mrc      Gain reference. Applied when specified.
#         -fdr       FileName.mrc      Dark reference. Applied when specified.
#         -srs       0                 1: Save uncorrected sum. 0: No.
#         -ssr       0                 1: Save uncorrected stack. 0: No.
#         -ssc       0                 1: Save corrected stack. 0: No.
#         -scc       0                 1: Save CC Map. 0: No.
#         -slg       1                 1: Save Log. 0: No.
#         -atm       1                 1: Align to middle frame N/2+1. 0: No. <0: to |VALUE|.
#         -dsp       1                 1: Save quick results. 0: No.
#         -frs       FileName.mrc      Uncorrected sum
#         -frt       FileName.mrc      Uncorrected stack
#         -fcs       FileName.mrc      Corrected sum
#         -fct       FileName.mrc      Corrected stack
#         -fcm       FileName.mrc      CC map
#         -flg       FileName.txt      Log file
