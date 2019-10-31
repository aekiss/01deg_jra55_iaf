#!/bin/bash

# Remove unconcatenated CICE daily output files

# DO NOT USE WHILE MODEL IS RUNNING! This could concatenate and delete a partial set of daily files.

echo "WARNING: do not proceed if the model is still running."
read -p "Proceed? (y/n) " yesno
case $yesno in
    [Yy] ) ;;
    * ) echo "Cancelled. Wait until model has finished before trying again."; exit 0;;
esac

for d in output???/ice/OUTPUT; do
    for f in $d/iceh.????-??-daily.nc; do
        echo $f " exists - deleting the following:"
        ls ${f/daily/??}
        rm ${f/daily/??}
    done
done

