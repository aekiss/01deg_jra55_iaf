#!/bin/bash

# Compress CICE monthly output files

# DO NOT USE WHILE MODEL IS RUNNING!

echo "WARNING: do not proceed if the model is still running."
read -p "Proceed? (y/n) " yesno
case $yesno in
    [Yy] ) ;;
    * ) echo "Cancelled. Wait until model has finished before trying again."; exit 0;;
esac

for d in archive/output???/ice/OUTPUT; do
    f=$d/iceh.????-??.nc
    if [[ ! -f $d/COMPRESS-IN-PROGRESS ]];
        then
            echo "Submitting $f"
            qsub -P v45 -q copyq -l ncpus=1 -l walltime=05:00:00,mem=32GB -l wd -V -N compress_ice_monthlies -- ./compress_ice_monthlies.sh $f && touch $d/COMPRESS-IN-PROGRESS
        else
            echo "--- Skipping $f"
        fi
#    break
done

