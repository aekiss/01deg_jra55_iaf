#!/bin/bash
# check all monthlies are OK
b=/short/v45/aek156/access-om2/archive/01deg_jra55_iaf
for f in $(ncfind -r -c $b/output???/ice/OUTPUT/iceh.????-??.nc); do # $b/output???/ice/OUTPUT/iceh.????-??.nc; do
    cdo diffn /g/data/hh5/tmp/cosima/access-om2-01/01deg_jra55v13_iaf${f/$b/} $f
done 

